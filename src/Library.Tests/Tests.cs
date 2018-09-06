using NUnit.Framework;

namespace Library.Tests {
	[TestFixture]
	public class PointlessTests {
		[Test]
		public void TestPointless() {
			Assert.AreEqual("Hello World", new Pointless().DoSomething());
		}

		[Test]
		public void TestFailureShouldFailBuild() {
			Assert.Fail();
		}
	}
}
