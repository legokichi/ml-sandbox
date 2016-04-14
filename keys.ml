let export =
  let empty = Js.Unsafe.obj [||] in
  Js.Unsafe.global##_MyModule <- empty; (* 先頭の _ は無視される *)
  empty

let js_Object = Js.Unsafe.variable "Object"
let js_this = Js.Unsafe.variable "this"
let hello () = Firebug.console##log(js_Object##keys(js_this))
let () = export##hello <- Js.wrap_callback hello
