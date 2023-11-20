import random

def partition(arr, low, high):
    pivot = arr[low]
    left = low + 1
    right = high

    while True:
        while left <= right and arr[left] <= pivot:
            left += 1
        while left <= right and arr[right] > pivot:
            right -= 1
        if left <= right:
            arr[left], arr[right] = arr[right], arr[left]
        else:
            break

    arr[low], arr[right] = arr[right], arr[low]
    return right

def quick_sort_deterministic(arr, low, high):
    if low < high:
        pivot_index = partition(arr, low, high)
        quick_sort_deterministic(arr, low, pivot_index - 1)
        quick_sort_deterministic(arr, pivot_index + 1, high)

def random_partition(arr, low, high):
    rand_pivot = random.randint(low, high)
    arr[low], arr[rand_pivot] = arr[rand_pivot], arr[low]
    return partition(arr, low, high)

def quick_sort_random(arr, low, high):
    if low < high:
        pivot_index = random_partition(arr, low, high)
        quick_sort_random(arr, low, pivot_index - 1)
        quick_sort_random(arr, pivot_index + 1, high)

# Example usage
# arr = [29, 10, 14, 37, 13]
# Inputting elements using a loop
arr = []
n = int(input("Enter number of elements: "))
for i in range(n):
    arr.append(int(input(f"Enter element {i + 1}: ")))


arr_deterministic = arr.copy()
quick_sort_deterministic(arr_deterministic, 0, len(arr_deterministic) - 1)
print("Sorted array (Deterministic Pivot):", arr_deterministic)

arr_random = arr.copy()
quick_sort_random(arr_random, 0, len(arr_random) - 1)
print("Sorted array (Random Pivot):", arr_random)
