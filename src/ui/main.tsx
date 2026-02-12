import React from "react";
import { createRoot } from "react-dom/client";
import MyApp from "./App";

const rootElement = document.getElementById("root");

if (!rootElement) {
  throw new Error("Root element with id 'root' was not found.");
}

createRoot(rootElement).render(
  <React.StrictMode>
    <MyApp />
  </React.StrictMode>
);