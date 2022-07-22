function App() {
  const [tastings, setTastings] = React.useState({});
  const [shoppingCart, setShoppingCart] = React.useState({});
  // loading is part of the further study
  const [loading, setLoading] = React.useState(false);

  React.useEffect(() => {
    setLoading(true);
    fetch('/api/tastings')
      .then((response) => response.json())
      .then((tastingData) => {
        setMelons(tastingData);
        setLoading(false);
      });
  }, []);

  // the following useEffect is part of the further study
  React.useEffect(() => {
    const previousCart = localStorage.getItem('shoppingCart');
    if (previousCart) {
      setShoppingCart(JSON.parse(previousCart));
    }
  }, []);

  // the following useEffect is also part of the further study
  React.useEffect(() => {
    localStorage.setItem('shoppingCart', JSON.stringify(shoppingCart));
  }, [shoppingCart]);

  function addTastingToCart(tastingID) {
    setShoppingCart((currentShoppingCart) => {
      // this makes a copy of the shopping cart since you should
      // never modify the state value directly
      const newShoppingCart = { ...currentShoppingCart };

      if (newShoppingCart[tastingID]) {
        newShoppingCart[tastingID] += 1;
      } else {
        newShoppingCart[tastingID] = 1;
      }

      return newShoppingCart;
    });
  }

  return (
    <ReactRouterDOM.BrowserRouter>
      <Navbar logo="/static/img/watermelon.png" brand="Ubermelon" />
      <div className="container-fluid">
        <ReactRouterDOM.Route exact path="/">
          {/* change this to a login page that accepts the user's name for login*/}
          <Homepage />
        </ReactRouterDOM.Route>
        <ReactRouterDOM.Route exact path="/login">
          <Homepage />
        </ReactRouterDOM.Route>
        <ReactRouterDOM.Route exact path="/shop">
          {loading ? (
            <Loading />
          ) : (
            <AllTastingsPage tastings={tastings} addTastingToCart={addTastingToCart} />
          )}
        </ReactRouterDOM.Route>
        <ReactRouterDOM.Route exact path="/cart">
          {loading ? <Loading /> : <ShoppingCartPage cart={shoppingCart} tastings={tastings} />}
        </ReactRouterDOM.Route>
      </div>
    </ReactRouterDOM.BrowserRouter>
  );
}

ReactDOM.render(<App />, document.querySelector('#root'));
