extends Node

const c1 = 1.70158
const c2 = 1.70158 * 1.525;
const c3 = 2.70158
const c4 = (2 * PI) / 3
const c5 = (2 * PI) / 4.5;
const n1 = 7.5625;
const d1 = 2.75;

func ease_in_sine(x : float) -> float :
	return 1 - cos((x * PI) / 2)

func ease_in_cubic(x : float) -> float :
	return x ** 3

func ease_in_quint (x : float) -> float :
	return x ** 5

func ease_in_circ (x : float) -> float :
	return 1 - sqrt(1 - x ** 2)

func ease_in_elastic (x : float) -> float :
	if x == 0:
		return 0
	elif x == 1:
		return 1
	else: 
		return -(2 ** (10 * x - 10)) * sin((x * 10 - 10.75) * c4)

func ease_in_quad (x : float) -> float :
	return x ** 2

func ease_in_quart (x : float) -> float :
	return x ** 4

func ease_in_expo (x : float) -> float :
	if x == 0:
		return 0
	else:
		return 2 ** (10 * x - 10)

func ease_in_back (x : float) -> float :
	return c3 * x ** 3 - c1 * x ** 2

func ease_in_bounce (x : float) -> float :
	return 1 - ease_out_bounce(1 - x)

func ease_out_sine (x : float) -> float :
	return sin((x * PI) / 2)

func ease_out_cubic (x : float) -> float :
	return 1 - (1 - x) ** 3

func ease_out_quint (x : float) -> float :
	return 1 - (1 - x) ** 5

func ease_out_circ (x : float) -> float :
	return sqrt(1 - (x - 1) ** 2)

func ease_out_elastic (x : float) -> float :
	if x == 0:
		return 0
	elif x == 1:
		return 1
	else:
		return 2 ** (-10 * x) * sin((x * 10 - 0.75) * c4) + 1

func ease_out_quad (x : float) -> float :
	return 1 - (1 - x) ** 2

func ease_out_quart (x : float) -> float :
	return 1 - (1 - x) ** 4

func ease_out_expo (x : float) -> float :
	if x == 1:
		return 1
	else:
		return 1 - 2 ** (-10 * x)

func ease_out_back (x : float) -> float :
	return 1 + c3 * (x - 1) ** 3 + c1 * (x - 1) ** 2

func ease_out_bounce (x : float) -> float :
	if x < (1 / d1):
		return n1 * x ** 2
	elif x < (2 / d1):
		return n1 * (x - 1.5 / d1) * x + 0.75
	elif x < (2.5 / d1):
		return n1 * (x - 2.25 / d1) * x + 0.9375
	else:
		return n1 * (x - 2.625 / d1) * x + 0.984375

func ease_in_out_sine (x : float) -> float :
	return -(cos(PI * x) - 1) / 2

func ease_in_out_cubic (x : float) -> float :
	if x < 0.5:
		return 4 * x ** 3
	else:
		return 1 - (-2 * x + 2) ** 3 / 2

func ease_in_out_quint (x : float) -> float :
	if x < 0.5:
		return 16 * x ** 5
	else:
		return 1 - (-2 * x + 2) ** 5 / 2

func ease_in_out_circ (x : float) -> float :
	if x < 0.5:
		return 1 - sqrt(1 - (2 * x) ** 2) / 2
	else:
		return (sqrt(1 - (-2 * x + 2) ** 2) + 1) / 2

func ease_in_out_elastic (x : float) -> float :
	if x == 0:
		return 0
	elif x == 1:
		return 1
	elif x < 0.5:
		return -(2 ** (20 * x - 10) * sin((20 * x - 11.125) * c5)) / 2
	else:
		return (2 ** (-20 * x - 10) * sin((20 * x - 11.125) * c5)) / 2 + 1

func ease_in_out_quad (x : float) -> float :
	if x < 0.5:
		return 2 * x ** 2
	else:
		return 1 - (-2 * x + 2) ** 2 / 2

func ease_in_out_quart (x : float) -> float :
	if x < 0.5:
		return 8 * x ** 4
	else:
		return 1 - ((-2 * x + 2) ** 4) / 2

func ease_in_out_expo (x : float) -> float :
	if x == 0:
		return 0
	elif x == 1:
		return 1
	elif x < 0.5:
		return 2 ** (20 * x - 10) / 2
	else:
		return (2 - 2 ** (-20 * x + 10)) / 2

func ease_in_out_back (x : float) -> float :
	if x < 0.5:
		return ((2 * x) ** 2 * ((c2 + 1) * 2 * x - c2))/ 2
	else:
		return ((2 * x - 2) ** 2 * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2

func ease_in_out_bounce (x : float) -> float :
	if x < 0.5:
		return (1 - ease_out_bounce(1 - 2 * x)) / 2
	else:
		return (1 + ease_out_bounce(2 * x - 1)) / 2
