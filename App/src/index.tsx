import { createRoot } from "react-dom/client";
import { Provider } from "react-redux";
import RootRouter from "./Route";
import store from "./Store/rootStore";

console.log("gggg");
const root = createRoot(document.getElementById("root") ?? document.body);
root.render(
  <Provider store={store}>
    <RootRouter />
  </Provider>
);
