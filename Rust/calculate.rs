
fn is_prime(n: i32) -> bool {
    if n <= 1 {
        return false;
    }

    for a in 2..n {
        if n % a == 0 {
            return false;
        }
    }

    return true;
}

fn calculate(n: i32) -> Vec<i32> {
    if n % 2 != 0 {
        return vec![];
    }

    if is_prime(n / 2) {
        return vec![1, n / 2];
    }

    let numbers = (1..n / 2 + 1)
            .filter(|x| n % x == 0 && (n / x) % 2 == 0)
            .collect();

    return numbers;
}

fn main() {
    let up_to: i32 = std::env::args()
        .nth(1)
        .unwrap_or("100".to_string())
        .parse()
        .unwrap();

    for i in (2..=up_to).filter(|x| x % 2 == 0) {
        println!("{}: {:?}", i, calculate(i));
    }
}
