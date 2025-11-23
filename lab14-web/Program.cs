var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Configure CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseSwagger();
app.UseSwaggerUI();

app.UseCors("AllowAll");

// Endpoint raíz
app.MapGet("/", () => new
{
    mensaje = "Calculadora Simple API - Lab14",
    version = "1.0.0",
    autor = "Oliver Aven",
    endpoints = new[]
    {
        "GET  /api/sumar?a={numero}&b={numero}",
        "GET  /api/restar?a={numero}&b={numero}",
        "GET  /api/multiplicar?a={numero}&b={numero}",
        "GET  /api/dividir?a={numero}&b={numero}",
        "POST /api/calcular"
    },
    documentacion = "/swagger"
});

// Endpoint de suma
app.MapGet("/api/sumar", (double a, double b) => new
{
    operacion = "suma",
    numero1 = a,
    numero2 = b,
    resultado = a + b
});

// Endpoint de resta
app.MapGet("/api/restar", (double a, double b) => new
{
    operacion = "resta",
    numero1 = a,
    numero2 = b,
    resultado = a - b
});

// Endpoint de multiplicación
app.MapGet("/api/multiplicar", (double a, double b) => new
{
    operacion = "multiplicacion",
    numero1 = a,
    numero2 = b,
    resultado = a * b
});

// Endpoint de división
app.MapGet("/api/dividir", (double a, double b) =>
{
    if (b == 0)
    {
        return Results.BadRequest(new
        {
            error = "No se puede dividir por cero",
            operacion = "division",
            numero1 = a,
            numero2 = b
        });
    }

    return Results.Ok(new
    {
        operacion = "division",
        numero1 = a,
        numero2 = b,
        resultado = a / b
    });
});

// Endpoint POST para cálculos
app.MapPost("/api/calcular", (CalculoRequest request) =>
{
    double resultado = request.Operacion switch
    {
        "suma" => request.Numero1 + request.Numero2,
        "resta" => request.Numero1 - request.Numero2,
        "multiplicacion" => request.Numero1 * request.Numero2,
        "division" => request.Numero2 != 0 ? request.Numero1 / request.Numero2 : double.NaN,
        _ => double.NaN
    };

    if (double.IsNaN(resultado))
    {
        return Results.BadRequest(new
        {
            error = request.Operacion == "division" 
                ? "No se puede dividir por cero" 
                : "Operación inválida",
            operacionesValidas = new[] { "suma", "resta", "multiplicacion", "division" }
        });
    }

    return Results.Ok(new
    {
        operacion = request.Operacion,
        numero1 = request.Numero1,
        numero2 = request.Numero2,
        resultado
    });
});

app.Run();

// Modelo para el request POST
record CalculoRequest(string Operacion, double Numero1, double Numero2);
