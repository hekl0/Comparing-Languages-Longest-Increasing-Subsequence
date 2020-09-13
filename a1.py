def bs(x, nums):
    lo = 0
    hi = len(nums) - 1
    while lo <= hi:
        mid = (lo + hi) >> 1
        if nums[mid] >= x:
            hi = mid - 1
        else:
            lo = mid + 1
    return lo

def lis(nums):
    bucket = []
    order = []
    for i in range(0, len(nums)):
        pos = bs(nums[i], bucket)
        if pos == len(bucket):
            bucket.append(0)
        bucket[pos] = nums[i]
        order.append(pos)

    max_len = len(bucket) - 1
    res = []
    for i in range(len(order) - 1, -1, -1):
        if order[i] == max_len:
            res.append(nums[i])
            max_len -= 1

    return res[::-1]


# nums = [int(num) for num in input().split(' ')]
# print(lis(nums))
print(lis([19, 3, 11, 7, 15, 12, 4, 12, 8, 16]))
