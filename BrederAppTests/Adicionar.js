function OSWindow() { return UIATarget.localTarget().frontMostApp().mainWindow(); }
function OSKeyboard() { return UIATarget.localTarget().frontMostApp().keyboard(); }
function OSKeyboard_Type(text) { OSKeyboard().typeString(text); }
function OSKeyboard_Next() { OSKeyboard_Type("\n"); }

function OSAlert_Click(button) { UIATarget.onAlert = function onAlert(alert) { alert.buttons()[button].tap(); return true; }; OSWindow().buttons()[button].tap(); }

function CostList_Cells() { return CostList_Table().cells(); }
function CostList_Table() { return OSWindow().scrollViews()[0].scrollViews()[1].tableViews()[0]; }
function CostList_CellClick(index) { CostList_Cells()[index].tap(); }
function CostList_RequireCellCount(size) { assertEquals("CostList_RequireCellCount", size, CostList_Cells().length); }
function CostList_RequireCellText(index, text) { assertContain("Content of Table Cell", text, CostList_Cells()[index].staticTexts()[0].name()); }
function CostList_AddClick() { OSWindow().buttons()["Adicionar"].tap(); }

function CostAdd_AddClick() { OSWindow().buttons()["Adicionar"].tap(); }

function assertEquals(testName, a, b) {
	if (a != b) {
		UIALogger.logMessage(testName + ": " + a + "!=" + b); 
		UIALogger.logFail(testName);
		throw false;
	}
}

function assertContain(testName, a, b) {
	if (a.indexOf(b) >= 0) {
		UIALogger.logMessage(testName + ": " + a + " startWith " + b); 
		UIALogger.logFail(testName); 
		throw false;
	}
}

function test(testName, func) {
	UIALogger.logStart(testName);
	try {
		func();
		UIALogger.logPass(testName);
	} catch (e) {
		UIALogger.logFail(testName); 
	}
}

test("add cost", function() {
	 CostList_RequireCellCount(0);
    CostList_AddClick();
	OSKeyboard_Type("Cafe");
	OSKeyboard_Next();
	OSKeyboard_Type("12");
	CostAdd_AddClick();
	CostList_RequireCellCount(1);
	CostList_RequireCellText(0, "Cafe");
	CostList_CellClick(0);
	OSAlert_Click("Deletar");
	CostList_RequireCellCount(0);
});

// window.tableViews()[0].scrollToElementWithPredicate("name beginswitch 'Café'")
// UIALogger.logFail(testName);
// UIALogger.logPass(testName);