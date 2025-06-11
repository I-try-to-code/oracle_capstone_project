from google import genai  # Correct import for google-genai SDK

client = genai.Client(api_key="AIzaSyCccnmfvG7kFJ18U9NQWyzq14zqMlWBTzA")  # Creates a proper client

def ask_gemini(question):
    response = client.models.generate_content(
        model="gemini-2.0-flash",
        contents=question,
    )
    return response.text

# ---------------------------------------------------------------------------




print(ask_gemini(input("ENter tur pompt")))