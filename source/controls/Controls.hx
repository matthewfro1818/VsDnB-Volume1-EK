package controls;

import flixel.FlxG;
import flixel.input.FlxInput;
import flixel.input.actions.FlxAction;
import flixel.input.actions.FlxActionInput;
import flixel.input.actions.FlxActionManager;
import flixel.input.actions.FlxActionSet;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.keyboard.FlxKey;

enum abstract Action(String) to String from String
{
	var UP = "up";
	var UP_P = "up-press";
	var UP_R = "up-release";

	var LEFT = "left";
	var LEFT_P = "left-press";
	var LEFT_R = "left-release";

	var DOWN = "down";
	var DOWN_P = "down-press";
	var DOWN_R = "down-release";

	var RIGHT = "right";
	var RIGHT_P = "right-press";
	var RIGHT_R = "right-release";

	var SPACE = "space";
	var SPACE_P = "space-press";
	var SPACE_R = "space-release";

	var SECOND_UP = "second-up";
	var SECOND_UP_P = "second-up-press";
	var SECOND_UP_R = "second-up-release";

	var SECOND_LEFT = "second-left";
	var SECOND_LEFT_P = "second-left-press";
	var SECOND_LEFT_R = "second-left-release";

	var SECOND_DOWN = "second-down";
	var SECOND_DOWN_P = "second-down-press";
	var SECOND_DOWN_R = "second-down-release";

	var SECOND_RIGHT = "second-right";
	var SECOND_RIGHT_P = "second-right-press";
	var SECOND_RIGHT_R = "second-right-release";

	var THIRD_UP = "third-up";
	var THIRD_UP_P = "third-up-press";
	var THIRD_UP_R = "third-up-release";

	var THIRD_LEFT = "third-left";
	var THIRD_LEFT_P = "third-left-press";
	var THIRD_LEFT_R = "third-left-release";

	var THIRD_DOWN = "third-down";
	var THIRD_DOWN_P = "third-down-press";
	var THIRD_DOWN_R = "third-down-release";

	var THIRD_RIGHT = "third-right";
	var THIRD_RIGHT_P = "third-right-press";
	var THIRD_RIGHT_R = "third-right-release";

	var ACCEPT = "accept";
	var BACK = "back";
	var PAUSE = "pause";
	var RESET = "reset";
	var CHEAT = "cheat";
	var KEY5 = "key5";
}

enum Device
{
	Keys;
	Gamepad(id:Int);
}

/**
 * Since, in many cases multiple actions should use similar keys, we don't want the
 * rebinding UI to list every action. ActionBinders are what the user percieves as
 * an input so, for instance, they can't set jump-press and jump-release to different keys.
 */
enum Control
{
	UP;
	LEFT;
	RIGHT;
	DOWN;
	SPACE;
	SECOND_UP;
	SECOND_LEFT;
	SECOND_RIGHT;
	SECOND_DOWN;
	THIRD_UP;
	THIRD_LEFT;
	THIRD_RIGHT;
	THIRD_DOWN;
	RESET;
	ACCEPT;
	BACK;
	PAUSE;
	CHEAT;
	KEY5;
}

enum KeyboardScheme
{
	Solo;
	Duo;
	None;
	Custom;
	Askl;
	ZxCommaDot;
}

/**
 * A list of actions that a player would invoke via some input device.
 * Uses FlxActions to funnel various inputs to a single action.
 */
class Controls extends FlxActionSet
{
	var _up = new FlxActionDigital(Action.UP);
	var _left = new FlxActionDigital(Action.LEFT);
	var _right = new FlxActionDigital(Action.RIGHT);
	var _down = new FlxActionDigital(Action.DOWN);

	var _space = new FlxActionDigital(Action.SPACE);
	var _second_up = new FlxActionDigital(Action.SECOND_UP);
	var _second_left = new FlxActionDigital(Action.SECOND_LEFT);
	var _second_right = new FlxActionDigital(Action.SECOND_RIGHT);
	var _second_down = new FlxActionDigital(Action.SECOND_DOWN);
	var _third_up = new FlxActionDigital(Action.THIRD_UP);
	var _third_left = new FlxActionDigital(Action.THIRD_LEFT);
	var _third_right = new FlxActionDigital(Action.THIRD_RIGHT);
	var _third_down = new FlxActionDigital(Action.THIRD_DOWN);

	var _upP = new FlxActionDigital(Action.UP_P);
	var _leftP = new FlxActionDigital(Action.LEFT_P);
	var _rightP = new FlxActionDigital(Action.RIGHT_P);
	var _downP = new FlxActionDigital(Action.DOWN_P);
	var _upR = new FlxActionDigital(Action.UP_R);
	var _leftR = new FlxActionDigital(Action.LEFT_R);
	var _rightR = new FlxActionDigital(Action.RIGHT_R);
	var _downR = new FlxActionDigital(Action.DOWN_R);

	var _spaceP = new FlxActionDigital(Action.SPACE_P);
	var _second_upP = new FlxActionDigital(Action.SECOND_UP_P);
	var _second_leftP = new FlxActionDigital(Action.SECOND_LEFT_P);
	var _second_rightP = new FlxActionDigital(Action.SECOND_RIGHT_P);
	var _second_downP = new FlxActionDigital(Action.SECOND_DOWN_P);
	var _spaceR = new FlxActionDigital(Action.SPACE_R);
	var _second_upR = new FlxActionDigital(Action.SECOND_UP_R);
	var _second_leftR = new FlxActionDigital(Action.SECOND_LEFT_R);
	var _second_rightR = new FlxActionDigital(Action.SECOND_RIGHT_R);
	var _second_downR = new FlxActionDigital(Action.SECOND_DOWN_R);

	var _third_upP = new FlxActionDigital(Action.THIRD_UP_P);
	var _third_leftP = new FlxActionDigital(Action.THIRD_LEFT_P);
	var _third_rightP = new FlxActionDigital(Action.THIRD_RIGHT_P);
	var _third_downP = new FlxActionDigital(Action.THIRD_DOWN_P);
	var _third_upR = new FlxActionDigital(Action.THIRD_UP_R);
	var _third_leftR = new FlxActionDigital(Action.THIRD_LEFT_R);
	var _third_rightR = new FlxActionDigital(Action.THIRD_RIGHT_R);
	var _third_downR = new FlxActionDigital(Action.THIRD_DOWN_R);

	var _accept = new FlxActionDigital(Action.ACCEPT);
	var _back = new FlxActionDigital(Action.BACK);
	var _pause = new FlxActionDigital(Action.PAUSE);
	var _reset = new FlxActionDigital(Action.RESET);
	var _cheat = new FlxActionDigital(Action.CHEAT);
	var _key5 = new FlxActionDigital(Action.KEY5);

	var byName:Map<String, FlxActionDigital> = [];

	public var gamepadsAdded:Array<Int> = [];
	public var keyboardScheme = KeyboardScheme.None;

	public var UP(get, never):Bool;

	inline function get_UP()
		return _up.check();

	public var LEFT(get, never):Bool;

	inline function get_LEFT()
		return _left.check();

	public var RIGHT(get, never):Bool;

	inline function get_RIGHT()
		return _right.check();

	public var DOWN(get, never):Bool;

	inline function get_DOWN()
		return _down.check();

	public var SPACE(get, never):Bool;

	inline function get_SPACE()
		return _space.check();

	public var SECOND_UP(get, never):Bool;

	inline function get_SECOND_UP()
		return _second_up.check();

	public var SECOND_LEFT(get, never):Bool;

	inline function get_SECOND_LEFT()
		return _second_left.check();

	public var SECOND_RIGHT(get, never):Bool;

	inline function get_SECOND_RIGHT()
		return _second_right.check();

	public var SECOND_DOWN(get, never):Bool;

	inline function get_SECOND_DOWN()
		return _second_down.check();
	
	public var THIRD_UP(get, never):Bool;

	inline function get_THIRD_UP()
		return _third_up.check();

	public var THIRD_LEFT(get, never):Bool;

	inline function get_THIRD_LEFT()
		return _third_left.check();

	public var THIRD_RIGHT(get, never):Bool;

	inline function get_THIRD_RIGHT()
		return _third_right.check();

	public var THIRD_DOWN(get, never):Bool;

	inline function get_THIRD_DOWN()
		return _third_down.check();

	public var UP_P(get, never):Bool;

	inline function get_UP_P()
		return _upP.check();

	public var LEFT_P(get, never):Bool;

	inline function get_LEFT_P()
		return _leftP.check();

	public var RIGHT_P(get, never):Bool;

	inline function get_RIGHT_P()
		return _rightP.check();

	public var DOWN_P(get, never):Bool;

	inline function get_DOWN_P()
		return _downP.check();

	public var SPACE_P(get, never):Bool;

	inline function get_SPACE_P()
		return _spaceP.check();

	public var SECOND_UP_P(get, never):Bool;

	inline function get_SECOND_UP_P()
		return _second_upP.check();

	public var SECOND_LEFT_P(get, never):Bool;

	inline function get_SECOND_LEFT_P()
		return _second_leftP.check();

	public var SECOND_RIGHT_P(get, never):Bool;

	inline function get_SECOND_RIGHT_P()
		return _second_rightP.check();

	public var SECOND_DOWN_P(get, never):Bool;

	inline function get_SECOND_DOWN_P()
		return _second_downP.check();

	public var THIRD_UP_P(get, never):Bool;

	inline function get_THIRD_UP_P()
		return _third_upP.check();

	public var THIRD_LEFT_P(get, never):Bool;

	inline function get_THIRD_LEFT_P()
		return _third_leftP.check();

	public var THIRD_RIGHT_P(get, never):Bool;

	inline function get_THIRD_RIGHT_P()
		return _third_rightP.check();

	public var THIRD_DOWN_P(get, never):Bool;

	inline function get_THIRD_DOWN_P()
		return _third_downP.check();

	public var UP_R(get, never):Bool;

	inline function get_UP_R()
		return _upR.check();

	public var LEFT_R(get, never):Bool;

	inline function get_LEFT_R()
		return _leftR.check();

	public var RIGHT_R(get, never):Bool;

	inline function get_RIGHT_R()
		return _rightR.check();

	public var DOWN_R(get, never):Bool;

	inline function get_DOWN_R()
		return _downR.check();

	public var SPACE_R(get, never):Bool;

	inline function get_SPACE_R()
		return _spaceR.check();

	public var SECOND_UP_R(get, never):Bool;

	inline function get_SECOND_UP_R()
		return _second_upR.check();

	public var SECOND_LEFT_R(get, never):Bool;

	inline function get_SECOND_LEFT_R()
		return _second_leftR.check();

	public var SECOND_RIGHT_R(get, never):Bool;

	inline function get_SECOND_RIGHT_R()
		return _second_rightR.check();

	public var SECOND_DOWN_R(get, never):Bool;

	inline function get_SECOND_DOWN_R()
		return _second_downR.check();	

	public var THIRD_UP_R(get, never):Bool;

	inline function get_THIRD_UP_R()
		return _third_upR.check();

	public var THIRD_LEFT_R(get, never):Bool;

	inline function get_THIRD_LEFT_R()
		return _third_leftR.check();

	public var THIRD_RIGHT_R(get, never):Bool;

	inline function get_THIRD_RIGHT_R()
		return _third_rightR.check();

	public var THIRD_DOWN_R(get, never):Bool;

	inline function get_THIRD_DOWN_R()
		return _third_downR.check();

	public var ACCEPT(get, never):Bool;

	inline function get_ACCEPT()
		return _accept.check();

	public var BACK(get, never):Bool;

	inline function get_BACK()
		return _back.check();

	public var PAUSE(get, never):Bool;

	inline function get_PAUSE()
		return _pause.check();

	public var RESET(get, never):Bool;

	inline function get_RESET()
		return _reset.check();

	public var KEY5(get, never):Bool;

	inline function get_KEY5()
		return _key5.check();

	public var CHEAT(get, never):Bool;

	inline function get_CHEAT()
		return _cheat.check();

	public function new(name, scheme = None)
	{
		super(name);

		add(_up);
		add(_left);
		add(_right);
		add(_down);
		add(_upP);
		add(_leftP);
		add(_rightP);
		add(_downP);
		add(_upR);
		add(_leftR);
		add(_rightR);
		add(_downR);
		add(_space);
		add(_second_up);
		add(_second_left);
		add(_second_right);
		add(_second_down);
		add(_third_up);
		add(_third_left);
		add(_third_right);
		add(_third_down);
		add(_spaceP);
		add(_second_upP);
		add(_second_leftP);
		add(_second_rightP);
		add(_second_downP);
		add(_third_upP);
		add(_third_leftP);
		add(_third_rightP);
		add(_third_downP);
		add(_spaceR);
		add(_second_upR);
		add(_second_leftR);
		add(_second_rightR);
		add(_second_downR);
		add(_third_upR);
		add(_third_leftR);
		add(_third_rightR);
		add(_third_downR);
		add(_accept);
		add(_back);
		add(_pause);
		add(_reset);
		add(_cheat);
		add(_key5);

		for (action in digitalActions)
			byName[action.name] = action;

		setKeyboardScheme(scheme, false);
	}

	override function update()
	{
		super.update();
	}

	// inline
	public function checkByName(name:Action):Bool
	{
		#if debug
		if (!byName.exists(name))
			throw 'Invalid name: $name';
		#end
		return byName[name].check();
	}

	public function getDialogueName(action:FlxActionDigital):String
	{
		var input = action.inputs[0];
		return switch input.device
		{
			case KEYBOARD: return '[${(input.inputID : FlxKey)}]';
			case GAMEPAD: return '(${(input.inputID : FlxGamepadInputID)})';
			case device: throw 'unhandled device: $device';
		}
	}

	public function getDialogueNameFromToken(token:String):String
	{
		return getDialogueName(getActionFromControl(Control.createByName(token.toUpperCase())));
	}

	function getActionFromControl(control:Control):FlxActionDigital
	{
		return switch (control)
		{
			case UP: _up;
			case DOWN: _down;
			case LEFT: _left;
			case RIGHT: _right;
			case SPACE: _space;
			case SECOND_UP: _second_up;
			case SECOND_DOWN: _second_down;
			case SECOND_LEFT: _second_left;
			case SECOND_RIGHT: _second_right;
			case THIRD_UP: _third_up;
			case THIRD_DOWN: _third_down;
			case THIRD_LEFT: _third_left;
			case THIRD_RIGHT: _third_right;
			case ACCEPT: _accept;
			case BACK: _back;
			case PAUSE: _pause;
			case RESET: _reset;
			case CHEAT: _cheat;
			case KEY5: _key5;
		}
	}

	/**
	 * Calls a function passing each action bound by the specified control
	 * @param control
	 * @param func
	 * @return ->Void)
	 */
	function forEachBound(control:Control, func:FlxActionDigital->FlxInputState->Void)
	{
		switch (control)
		{
			case UP:
				func(_up, PRESSED);
				func(_upP, JUST_PRESSED);
				func(_upR, JUST_RELEASED);
			case LEFT:
				func(_left, PRESSED);
				func(_leftP, JUST_PRESSED);
				func(_leftR, JUST_RELEASED);
			case RIGHT:
				func(_right, PRESSED);
				func(_rightP, JUST_PRESSED);
				func(_rightR, JUST_RELEASED);
			case DOWN:
				func(_down, PRESSED);
				func(_downP, JUST_PRESSED);
				func(_downR, JUST_RELEASED);
			case SPACE:
				func(_space, PRESSED);
				func(_spaceP, JUST_PRESSED);
				func(_spaceR, JUST_RELEASED);
			case SECOND_UP:
				func(_second_up, PRESSED);
				func(_second_upP, JUST_PRESSED);
				func(_second_upR, JUST_RELEASED);
			case SECOND_LEFT:
				func(_second_left, PRESSED);
				func(_second_leftP, JUST_PRESSED);
				func(_second_leftR, JUST_RELEASED);
			case SECOND_RIGHT:
				func(_second_right, PRESSED);
				func(_second_rightP, JUST_PRESSED);
				func(_second_rightR, JUST_RELEASED);
			case SECOND_DOWN:
				func(_second_down, PRESSED);
				func(_second_downP, JUST_PRESSED);
				func(_second_downR, JUST_RELEASED);
			case THIRD_UP:
				func(_third_up, PRESSED);
				func(_third_upP, JUST_PRESSED);
				func(_third_upR, JUST_RELEASED);
			case THIRD_LEFT:
				func(_third_left, PRESSED);
				func(_third_leftP, JUST_PRESSED);
				func(_third_leftR, JUST_RELEASED);
			case THIRD_RIGHT:
				func(_third_right, PRESSED);
				func(_third_rightP, JUST_PRESSED);
				func(_third_rightR, JUST_RELEASED);
			case THIRD_DOWN:
				func(_third_down, PRESSED);
				func(_third_downP, JUST_PRESSED);
				func(_third_downR, JUST_RELEASED);
			case ACCEPT:
				func(_accept, JUST_PRESSED);
			case BACK:
				func(_back, JUST_PRESSED);
			case PAUSE:
				func(_pause, JUST_PRESSED);
			case RESET:
				func(_reset, JUST_PRESSED);
			case CHEAT:
				func(_cheat, JUST_PRESSED);
			case KEY5:
				func(_key5, PRESSED);
		}
	}

	public function replaceBinding(control:Control, device:Device, ?toAdd:Int, ?toRemove:Int)
	{
		if (toAdd == toRemove)
			return;

		switch (device)
		{
			case Keys:
				if (toRemove != null)
					unbindKeys(control, [toRemove]);
				if (toAdd != null)
					bindKeys(control, [toAdd]);

			case Gamepad(id):
				if (toRemove != null)
					unbindButtons(control, id, [toRemove]);
				if (toAdd != null)
					bindButtons(control, id, [toAdd]);
		}
	}

	public function copyFrom(controls:Controls, ?device:Device)
	{
		for (name => action in controls.byName)
		{
			for (input in action.inputs)
			{
				if (device == null || isDevice(input, device))
					byName[name].add(cast input);
			}
		}

		switch (device)
		{
			case null:
				// add all
				for (gamepad in controls.gamepadsAdded)
					if (!gamepadsAdded.contains(gamepad))
						gamepadsAdded.push(gamepad);

				mergeKeyboardScheme(controls.keyboardScheme);

			case Gamepad(id):
				gamepadsAdded.push(id);
			case Keys:
				mergeKeyboardScheme(controls.keyboardScheme);
		}
	}

	inline public function copyTo(controls:Controls, ?device:Device)
	{
		controls.copyFrom(this, device);
	}

	function mergeKeyboardScheme(scheme:KeyboardScheme):Void
	{
		if (scheme != None)
		{
			switch (keyboardScheme)
			{
				case None:
					keyboardScheme = scheme;
				default:
					keyboardScheme = Custom;
			}
		}
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function bindKeys(control:Control, keys:Array<FlxKey>)
	{
		inline forEachBound(control, (action, state) -> addKeys(action, keys, state));
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function unbindKeys(control:Control, keys:Array<FlxKey>)
	{
		inline forEachBound(control, (action, _) -> removeKeys(action, keys));
	}

	inline static function addKeys(action:FlxActionDigital, keys:Array<FlxKey>, state:FlxInputState)
	{
		for (key in keys)
			action.addKey(key, state);
	}

	static function removeKeys(action:FlxActionDigital, keys:Array<FlxKey>)
	{
		var i = action.inputs.length;
		while (i-- > 0)
		{
			var input = action.inputs[i];
			if (input.device == KEYBOARD && keys.indexOf(cast input.inputID) != -1)
				action.remove(input);
		}
	}

	public function setKeyboardScheme(scheme:KeyboardScheme, reset = true)
	{
		if (reset)
			removeKeyboard();

		keyboardScheme = scheme;

		switch (scheme)
		{
			case Solo:
				inline bindKeys(Control.UP, [J, FlxKey.UP]);
				inline bindKeys(Control.DOWN, [F, FlxKey.DOWN]);
				inline bindKeys(Control.LEFT, [D, FlxKey.LEFT]);
				inline bindKeys(Control.RIGHT, [K, FlxKey.RIGHT]);
				inline bindKeys(Control.SPACE, [FlxKey.SPACE]);
				inline bindKeys(Control.SECOND_UP, [FlxKey.H]);
				inline bindKeys(Control.SECOND_DOWN, [FlxKey.K]);
				inline bindKeys(Control.SECOND_LEFT, [FlxKey.J]);
				inline bindKeys(Control.SECOND_RIGHT, [FlxKey.L]);
				inline bindKeys(Control.THIRD_UP, [FlxKey.B]);
				inline bindKeys(Control.THIRD_DOWN, [FlxKey.V]);
				inline bindKeys(Control.THIRD_LEFT, [FlxKey.C]);
				inline bindKeys(Control.THIRD_RIGHT, [FlxKey.N]);
				inline bindKeys(Control.ACCEPT, [FlxKey.SPACE, ENTER]);
				inline bindKeys(Control.BACK, [BACKSPACE, ESCAPE]);
				inline bindKeys(Control.PAUSE, [ENTER, ESCAPE]);
				inline bindKeys(Control.RESET, [R, DELETE]);
				inline bindKeys(Control.KEY5, [FlxKey.SPACE, SHIFT]);
			case Duo:
				inline bindKeys(Control.UP, [W, FlxKey.UP]);
				inline bindKeys(Control.DOWN, [S, FlxKey.DOWN]);
				inline bindKeys(Control.LEFT, [A, FlxKey.LEFT]);
				inline bindKeys(Control.RIGHT, [D, FlxKey.RIGHT]);
				inline bindKeys(Control.SPACE, [FlxKey.SPACE]);
				inline bindKeys(Control.SECOND_UP, [FlxKey.H]);
				inline bindKeys(Control.SECOND_DOWN, [FlxKey.K]);
				inline bindKeys(Control.SECOND_LEFT, [FlxKey.J]);
				inline bindKeys(Control.SECOND_RIGHT, [FlxKey.L]);
				inline bindKeys(Control.THIRD_UP, [FlxKey.B]);
				inline bindKeys(Control.THIRD_DOWN, [FlxKey.V]);
				inline bindKeys(Control.THIRD_LEFT, [FlxKey.C]);
				inline bindKeys(Control.THIRD_RIGHT, [FlxKey.N]);
				inline bindKeys(Control.ACCEPT, [FlxKey.SPACE, ENTER]);
				inline bindKeys(Control.PAUSE, [ENTER, ESCAPE]);
				inline bindKeys(Control.BACK, [BACKSPACE, ESCAPE]);
				inline bindKeys(Control.RESET, [R, DELETE]);
				inline bindKeys(Control.KEY5, [FlxKey.SPACE, SHIFT]);
			case Custom:
				inline bindKeys(Control.UP, KeybindPrefs.keybinds.get('up'));
				inline bindKeys(Control.DOWN, KeybindPrefs.keybinds.get('down'));
				inline bindKeys(Control.LEFT, KeybindPrefs.keybinds.get('left'));
				inline bindKeys(Control.RIGHT, KeybindPrefs.keybinds.get('right'));
				inline bindKeys(Control.SPACE, KeybindPrefs.keybinds.get('space'));
				inline bindKeys(Control.SECOND_UP, KeybindPrefs.keybinds.get('second-up'));
				inline bindKeys(Control.SECOND_DOWN, KeybindPrefs.keybinds.get('second-down'));
				inline bindKeys(Control.SECOND_LEFT, KeybindPrefs.keybinds.get('second-left'));
				inline bindKeys(Control.SECOND_RIGHT, KeybindPrefs.keybinds.get('second-right'));
				inline bindKeys(Control.THIRD_UP, KeybindPrefs.keybinds.get('third-up'));
				inline bindKeys(Control.THIRD_DOWN, KeybindPrefs.keybinds.get('third-down'));
				inline bindKeys(Control.THIRD_LEFT, KeybindPrefs.keybinds.get('third-left'));
				inline bindKeys(Control.THIRD_RIGHT, KeybindPrefs.keybinds.get('third-right'));
				inline bindKeys(Control.ACCEPT, KeybindPrefs.keybinds.get('accept'));
				inline bindKeys(Control.BACK, KeybindPrefs.keybinds.get('back'));
				inline bindKeys(Control.PAUSE, KeybindPrefs.keybinds.get('pause'));
				inline bindKeys(Control.RESET, KeybindPrefs.keybinds.get('reset'));
				inline bindKeys(Control.KEY5, KeybindPrefs.keybinds.get('key5'));
			case Askl:
				inline bindKeys(Control.UP, [K, FlxKey.UP]);
				inline bindKeys(Control.DOWN, [S, FlxKey.DOWN]);
				inline bindKeys(Control.LEFT, [A, FlxKey.LEFT]);
				inline bindKeys(Control.RIGHT, [L, FlxKey.RIGHT]);
				inline bindKeys(Control.SPACE, [FlxKey.SPACE]);
				inline bindKeys(Control.SECOND_UP, [FlxKey.H]);
				inline bindKeys(Control.SECOND_DOWN, [FlxKey.K]);
				inline bindKeys(Control.SECOND_LEFT, [FlxKey.J]);
				inline bindKeys(Control.SECOND_RIGHT, [FlxKey.L]);
				inline bindKeys(Control.THIRD_UP, [FlxKey.B]);
				inline bindKeys(Control.THIRD_DOWN, [FlxKey.V]);
				inline bindKeys(Control.THIRD_LEFT, [FlxKey.C]);
				inline bindKeys(Control.THIRD_RIGHT, [FlxKey.N]);
				inline bindKeys(Control.ACCEPT, [FlxKey.SPACE, ENTER]);
				inline bindKeys(Control.BACK, [BACKSPACE, ESCAPE]);
				inline bindKeys(Control.PAUSE, [ENTER, ESCAPE]);
				inline bindKeys(Control.RESET, [R, DELETE]);
				inline bindKeys(Control.KEY5, [FlxKey.SPACE, SHIFT]);
			case ZxCommaDot:
				inline bindKeys(Control.UP, [FlxKey.COMMA, FlxKey.UP]);
				inline bindKeys(Control.DOWN, [X, FlxKey.DOWN]);
				inline bindKeys(Control.LEFT, [Z, FlxKey.LEFT]);
				inline bindKeys(Control.RIGHT, [FlxKey.PERIOD, FlxKey.RIGHT]);
				inline bindKeys(Control.SPACE, [FlxKey.SPACE]);
				inline bindKeys(Control.SECOND_UP, [FlxKey.H]);
				inline bindKeys(Control.SECOND_DOWN, [FlxKey.K]);
				inline bindKeys(Control.SECOND_LEFT, [FlxKey.J]);
				inline bindKeys(Control.SECOND_RIGHT, [FlxKey.L]);
				inline bindKeys(Control.THIRD_UP, [FlxKey.B]);
				inline bindKeys(Control.THIRD_DOWN, [FlxKey.V]);
				inline bindKeys(Control.THIRD_LEFT, [FlxKey.C]);
				inline bindKeys(Control.THIRD_RIGHT, [FlxKey.N]);
				inline bindKeys(Control.ACCEPT, [FlxKey.SPACE, ENTER]);
				inline bindKeys(Control.BACK, [BACKSPACE, ESCAPE]);
				inline bindKeys(Control.PAUSE, [ENTER, ESCAPE]);
				inline bindKeys(Control.RESET, [R, DELETE]);
				inline bindKeys(Control.KEY5, [FlxKey.SPACE, SHIFT]);
			case None: // nothing
		}
	}

	public static function stringControlToControl(control:String):Control
	{
		return switch (control)
		{
			case 'left' | 'left-press' | "left-release": Control.LEFT;
			case 'down' | 'down-press' | 'down-release': Control.DOWN;
			case 'up' | 'up-press' | 'up-release': Control.UP;
			case 'right' | 'right-press' | 'right-release': Control.RIGHT;
			case 'space' | 'space-press' | "space-release": Control.SPACE;
			case 'second-left' | 'second-left-press' | "second-left-release": Control.SECOND_LEFT;
			case 'second-down' | 'second-down-press' | 'second-down-release': Control.SECOND_DOWN;
			case 'second-up' | 'second-up-press' | 'second-up-release': Control.SECOND_UP;
			case 'second-right' | 'second-right-press' | 'second-right-release': Control.SECOND_RIGHT;
			case 'third-left' | 'third-left-press' | "third-left-release": Control.THIRD_LEFT;
			case 'third-down' | 'third-down-press' | 'third-down-release': Control.THIRD_DOWN;
			case 'third-up' | 'third-up-press' | 'third-up-release': Control.THIRD_UP;
			case 'third-right' | 'third-right-press' | 'third-right-release': Control.THIRD_RIGHT;
			case 'accept': Control.ACCEPT;
			case 'back': Control.BACK;
			case 'reset': Control.RESET;
			case 'cheat': Control.CHEAT;
			case 'pause': Control.PAUSE;
			case 'key5': Control.KEY5;
			default: null;
		}
	}

	function removeKeyboard()
	{
		for (action in this.digitalActions)
		{
			var i = action.inputs.length;
			while (i-- > 0)
			{
				var input = action.inputs[i];
				if (input.device == KEYBOARD)
					action.remove(input);
			}
		}
	}

	public function addGamepad(id:Int, ?buttonMap:Map<Control, Array<FlxGamepadInputID>>):Void
	{
		gamepadsAdded.push(id);

		for (control => buttons in buttonMap)
			inline bindButtons(control, id, buttons);
	}

	inline function addGamepadLiteral(id:Int, ?buttonMap:Map<Control, Array<FlxGamepadInputID>>):Void
	{
		gamepadsAdded.push(id);

		for (control => buttons in buttonMap)
			inline bindButtons(control, id, buttons);
	}

	public function removeGamepad(deviceID:Int = FlxInputDeviceID.ALL):Void
	{
		for (action in this.digitalActions)
		{
			var i = action.inputs.length;
			while (i-- > 0)
			{
				var input = action.inputs[i];
				if (input.device == GAMEPAD && (deviceID == FlxInputDeviceID.ALL || input.deviceID == deviceID))
					action.remove(input);
			}
		}

		gamepadsAdded.remove(deviceID);
	}

	public function addDefaultGamepad(id):Void
	{
		#if !switch
		addGamepadLiteral(id, [
			Control.ACCEPT => [A],
			Control.BACK => [B],
			Control.KEY5 => [LEFT_STICK_CLICK],
			Control.UP => [DPAD_UP, LEFT_STICK_DIGITAL_UP],
			Control.DOWN => [DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN],
			Control.LEFT => [DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT],
			Control.RIGHT => [DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT],
			Control.PAUSE => [START],
			Control.RESET => [Y]
		]);
		#else
		addGamepadLiteral(id, [
			// Swap A and B for switch
			Control.ACCEPT => [B],
			Control.BACK => [A],
			Control.UP => [DPAD_UP, LEFT_STICK_DIGITAL_UP, RIGHT_STICK_DIGITAL_UP],
			Control.DOWN => [DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN, RIGHT_STICK_DIGITAL_DOWN],
			Control.LEFT => [DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT, RIGHT_STICK_DIGITAL_LEFT],
			Control.RIGHT => [DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT, RIGHT_STICK_DIGITAL_RIGHT],
			Control.PAUSE => [START],
			// Swap Y and X for switch
			Control.RESET => [Y],
			Control.CHEAT => [X]
		]);
		#end
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function bindButtons(control:Control, id, buttons)
	{
		inline forEachBound(control, (action, state) -> addButtons(action, buttons, state, id));
	}

	/**
	 * Sets all actions that pertain to the binder to trigger when the supplied keys are used.
	 * If binder is a literal you can inline this
	 */
	public function unbindButtons(control:Control, gamepadID:Int, buttons)
	{
		inline forEachBound(control, (action, _) -> removeButtons(action, gamepadID, buttons));
	}

	inline static function addButtons(action:FlxActionDigital, buttons:Array<FlxGamepadInputID>, state, id)
	{
		for (button in buttons)
			action.addGamepad(button, state, id);
	}

	static function removeButtons(action:FlxActionDigital, gamepadID:Int, buttons:Array<FlxGamepadInputID>)
	{
		var i = action.inputs.length;
		while (i-- > 0)
		{
			var input = action.inputs[i];
			if (isGamepad(input, gamepadID) && buttons.indexOf(cast input.inputID) != -1)
				action.remove(input);
		}
	}

	public function getInputsFor(control:Control, device:Device, ?list:Array<Int>):Array<Int>
	{
		if (list == null)
			list = [];

		switch (device)
		{
			case Keys:
				for (input in getActionFromControl(control).inputs)
				{
					if (input.device == KEYBOARD)
						list.push(input.inputID);
				}
			case Gamepad(id):
				for (input in getActionFromControl(control).inputs)
				{
					if (input.deviceID == id)
						list.push(input.inputID);
				}
		}
		return list;
	}

	public function removeDevice(device:Device)
	{
		switch (device)
		{
			case Keys:
				setKeyboardScheme(None);
			case Gamepad(id):
				removeGamepad(id);
		}
	}

	static function isDevice(input:FlxActionInput, device:Device)
	{
		return switch device
		{
			case Keys: input.device == KEYBOARD;
			case Gamepad(id): isGamepad(input, id);
		}
	}

	inline static function isGamepad(input:FlxActionInput, deviceID:Int)
	{
		return input.device == GAMEPAD && (deviceID == FlxInputDeviceID.ALL || input.deviceID == deviceID);
	}
}
