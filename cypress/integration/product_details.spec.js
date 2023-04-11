describe("example to-do app", () => {
  beforeEach(() => {
    cy.visit("localhost:3000");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should navigate to product datails", () => {
    cy.get("[alt='Scented Blade']").click();
    cy.contains("18 in stock at").should("exist");
    cy.contains("button", "Add").should("exist");
  });
});
