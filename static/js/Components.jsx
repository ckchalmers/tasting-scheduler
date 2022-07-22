function Homepage(props) {
  return (
    <div id="home-banner" className="row">
      <div className="col">
        <h1>Ubermelon</h1>
        <p className="lead">Melons on demand.</p>
      </div>
    </div>
  );
}

function AllTastingsPage(props) {
  const { tastings, addTastingToCart } = props;
  const tastingCards = [];

  for (const tasting of Object.values(tastings)) {
    const tastigCard = (
      <TastingCard
        key={tasting.tasting_id}
        date={tasting.date}
        time={tasting.time}
        user={tasting.user}
        handleAddToCart={addTastingToCart}
      />
    );

    tastingCards.push(tastingCard);
  }

  return (
    <React.Fragment>
      <h1>All Tastings</h1>
      <div id="shopping">
        <div className="col-12 col-md-9 d-flex flex-wrap">{tastingCards}</div>
      </div>
    </React.Fragment>
  );
}

function ShoppingCartPage(props) {
  const { cart, tastings } = props;
  const tableData = [];
  for (const tastingId in cart) {
    const currentTasting = tastings[tastingId];

    tableData.push(
      <tr key={tastingId}>
        <td>{currentTasting.time}</td>
        <td>{currentTasting.date}</td>
        <td>{cart[tastingId]}</td>
        
      </tr>,
    );
  }
  return (
    <React.Fragment>
      <h1>Shopping Cart</h1>
      <div className="col-6">
        <table className="table">
          <thead>
            <tr>
              <th>Time</th>
              <th>Date</th>
              <th>TastingID</th>
            </tr>
          </thead>
          <tbody>{tableData}</tbody>
        </table>
        <p className="lead"></p>
      </div>
    </React.Fragment>
  );
}

function Navbar(props) {
  const { logo, brand } = props;

  return (
    <nav>
      <ReactRouterDOM.Link to="/" className="havbar-brand d-flex justify-content-center">
        <img src={logo} height="30" alt="logo" />
        <span>{brand}</span>
      </ReactRouterDOM.Link>

      <section className="d-flex justify-content-center">
        <ReactRouterDOM.NavLink
          to="/shop"
          activeClassName="navlink-active"
          className="nav-link nav-item"
        >
          Shop for Melons
        </ReactRouterDOM.NavLink>
        <ReactRouterDOM.NavLink
          to="/cart"
          activeClassName="navlink-active"
          className="nav-link nav-item"
        >
          Shopping Cart
        </ReactRouterDOM.NavLink>
      </section>
    </nav>
  );
}

function TastingCard(props) {
  const { key, date, time, user, handleAddToCart } = props;

  return (
    <div className="card melon-card">
      {/* melon image */}
      {/* <img src={imgUrl} className="card-img-top" alt="" /> */}
      <div className="card-body">
        {/* melon title */}
        <h5 className="card-title">{date} {time}</h5>
      </div>
      <div className="card-body pt-0 container-fluid">
        <div className="row">
          <div className="col-12 col-lg-6">
            {/* melon price */}
            {/* <span className="lead price d-inline-block">${price.toFixed(2)}</span> */}
          </div>
          <div className="col-12 col-lg-6">
            {/* Add to Cart button */}
            <button
              type="button"
              className="btn btn-sm btn-success d-inline-block"
              onClick={() => handleAddToCart(code)}
            >
              Add to cart
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

// part of the further study
function Loading() {
  return (
    <div className="loading-box">
      <img src="static/img/watermelon-loading.png" alt="" />
      <div>Loading...</div>
    </div>
  );
}
