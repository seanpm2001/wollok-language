object pepita {
  
  method energia() = @Expect(code="missingReference", level="error") energia
  
  method comer(p) {
    @Expect(code="missingReference", level="error", variable=true)
    energia = 100
  }

  method estaCansa() = @Expect(code="missingReference", level="error") energia < 10

  method methodName() {
    self.comer(@Expect(code="missingReference", level="error") energia)
  } 
}

object o1 {
  method catchingNonExistingException() {
    try {
      assert.that(true)
    } 
    catch e: @Expect(code = "missingReference", level="error") InexistentException
      assert.fail("InexistentException does not exist")
    @Expect(code = "catchShouldBeReachable", level="error")
    catch e: Exception
      assert.fail("Cannot check inheritance of inexistent exception")
  }
}

const a = new @Expect(code = "missingReference", level="error") InexistClass(
  @Expect(code = "namedArgumentShouldExist", level="error")edad = 5)