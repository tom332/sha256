import tkinter as tk
from tkinter import messagebox
import hashlib

def generate_sha256():
    text = input_text.get("1.0", "end-1c")
    sha256_value = hashlib.sha256(text.encode()).hexdigest()
    output_text.delete("1.0", tk.END)
    output_text.insert("1.0", sha256_value)

root = tk.Tk()
root.title("SHA256 Generator")

input_label = tk.Label(root, text="Enter text:")
input_label.pack()

input_text = tk.Text(root, height=10, width=40)
input_text.pack()

generate_button = tk.Button(root, text="Generate SHA256", command=generate_sha256)
generate_button.pack()

output_label = tk.Label(root, text="SHA256 value:")
output_label.pack()

output_text = tk.Text(root, height=5, width=40)
output_text.pack()

root.mainloop()