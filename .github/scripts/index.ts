import { GoogleGenAI } from "@google/genai";

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

const input = process.argv[2]
if (!input) {
  console.error("please input prompt by argument.");
  process.exit(1);
}

async function main() {
  const response = await ai.models.generateContent({
    model: "gemini-2.0-flash",
    contents: `以下の質問に複数の観点から答えて. ${input}`,
  });
  console.log(response.text);
}

main();