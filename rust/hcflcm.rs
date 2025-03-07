fn main() {
    let mut input = String::new();
    println!("Enter five numbers:");
    std::io::stdin().read_line(&mut input).unwrap();
    let nums: Vec<i32> = input.trim().split_whitespace().map(|s| s.parse().unwrap()).collect();
    if nums.len() != 5 {
        println!("Please enter exactly five numbers.");
        return;
    }
    let mut h = nums[0];
    let mut l = nums[0];
    for &n in &nums[1..] {
        h = gcd(h, n);
        l = lcm(l, n);
    }
    println!("HCF: {}", h);
    println!("LCM: {}", l);
}

fn gcd(a: i32, b: i32) -> i32 {
    if b == 0 { a.abs() } else { gcd(b, a % b) }
}

fn lcm(a: i32, b: i32) -> i32 {
    (a * b).abs() / gcd(a, b)
}
