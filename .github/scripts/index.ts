import { GoogleGenAI } from "@google/genai";

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_KEY });

async function main() {
  const response = await ai.models.generateContent({
    model: "gemini-2.0-flash",
    contents: "what your model name? gemeni-2.0-flash? 2.5-flash?",
  });
  console.log(response.text);
}

main();