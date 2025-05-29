import { GoogleGenAI } from "@google/genai";
import { readFile } from "fs/promises";

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

function readUserInput(): string | null {
  const input = process.argv[2];
  if (!input) {
    console.error("please input prompt by argument.");
    return null;
  }
  return input;
}

async function readInstraction(): Promise<string | null>{
  try {
    const data = await readFile('../instractions/feedback.instraction.md', 'utf-8');
    return data;
  } catch {
    console.error("can't read /.github/instractions/feedback.instraction.md");
    return null;
  }
}

async function main() {
  const instraction = await readInstraction();
  if(!instraction) return;

  const userInput = readUserInput();
  if(!userInput) return;
  
  const response = await ai.models.generateContent({
    model: "gemini-2.5-flash-preview-05-20",
    contents: `${userInput}`,
    config: {
      systemInstruction: instraction
    }
  });
  console.log(response.text);
}

main();