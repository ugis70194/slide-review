import { GoogleGenAI } from "@google/genai";
import { readFile } from "fs/promises";

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

async function readUserInput(): Promise<string | null> {
  const input = await new Promise<string>(resolve => {
    let data = '';
    process.stdin.on('data', chunk => data += chunk);
    process.stdin.on('end', () => resolve(data));
  });
  if(!input) {
    console.error("input is empty");
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

  const userInput = await readUserInput();
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