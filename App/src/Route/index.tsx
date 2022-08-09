import React, { Suspense, useEffect } from "react";
import {
  BrowserRouter as Router,
  Route,
  Routes,
  Navigate,
} from "react-router-dom";

const Home = React.lazy(
  () => import(/* webpackChunkName: 'Home' */ "../Pages/Home")
);
const Count = React.lazy(
  () => import(/* webpackChunkName: 'Count' */ "../Pages/Count")
);

const RootRouter: React.FC = () => {
  return (
    <Suspense>
      <Router basename="/">
        <Routes>
          <Route path="/" element={<Navigate to="/home" />} />
          <Route path="/home" element={<Home />} />
          <Route path="/count" element={<Count />} />
        </Routes>
      </Router>
    </Suspense>
  );
};

export default RootRouter;
