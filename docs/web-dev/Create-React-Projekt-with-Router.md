# How to create a react Project with browser routing


Create react project from a template:

```bash
npm create vite@latest my-app -- --template react
cd my-app
npm install
```

Add `react-router-dom`:

```bash
npm install react-router-dom
```

Create a Router file:

```javascript
import { createBrowserRouter} from "react-router-dom";
import App from './App.jsx'
import Home from "./pages/home.jsx";
import NotFound from "./pages/notfound.jsx";


const router = createBrowserRouter([
  {
    path: "/",
    element: <App />, // usually a layout with header/footer
    children: [
      { index: true, element: <Home /> },
    //   { path: "about", element: <About /> },
      { path: "*", element: <NotFound /> }, // catch-all
    ],
  },
]);

export default router;
```


In main.jsx Add the `RouterProvide` from `react-router-dom` and the created `router` as attribute.


```javascript
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { RouterProvider } from "react-router-dom";
import './index.css'
import router from './Router.jsx';

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <RouterProvider router={router} />
  </StrictMode>,
)
```

In APP.jsx use `<Outlet/>` to add add data of the pages/routes in the layout.

```javascript
import { Outlet, Link } from "react-router-dom";

export default function App() {
  return (
    <div>
      <nav>
        <Link to="/">Home</Link> |{" "}
        <Link to="/about">About</Link>
      </nav>
      <hr />
      <Outlet /> {/* this renders the nested child routes */}
    </div>
  );
}
```


Call the server API inside `userEffect`  hook:

```javascript

import { useEffect, useState } from "react";

export default function About() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch("http://localhost:8080/api/info") // Go backend API
      .then((res) => res.json())
      .then(setData)
      .catch(console.error);
  }, []);

  return (
    <div>
      <h1>About</h1>
      {data ? <pre>{JSON.stringify(data, null, 2)}</pre> : "Loading..."}
    </div>
  );
}
```
