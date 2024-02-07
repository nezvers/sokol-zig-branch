// machine generated, do not edit

const builtin = @import("builtin");
const sg = @import("gfx.zig");

// helper function to convert a C string to a Zig string slice
fn cStrToZig(c_str: [*c]const u8) [:0]const u8 {
    return @import("std").mem.span(c_str);
}
pub const Error = enum(i32) {
    ERROR = 0,
    SOKOL_INVALID,
    VERTICES_FULL,
    UNIFORMS_FULL,
    COMMANDS_FULL,
    VERTICES_OVERFLOW,
    TRANSFORM_STACK_OVERFLOW,
    TRANSFORM_STACK_UNDERFLOW,
    STATE_STACK_OVERFLOW,
    STATE_STACK_UNDERFLOW,
    ALLOC_FAILED,
    MAKE_VERTEX_BUFFER_FAILED,
    MAKE_WHITE_IMAGE_FAILED,
    MAKE_COMMON_SHADER_FAILED,
    MAKE_COMMON_PIPELINE_FAILED,
};
pub const BlendMode = enum(i32) {
    NONE = 0,
    BLEND,
    ADD,
    MOD,
    MUL,
    NUM,
};
pub const Isize = extern struct {
    w: i32 = 0,
    h: i32 = 0,
};
pub const Irect = extern struct {
    x: i32 = 0,
    y: i32 = 0,
    w: i32 = 0,
    h: i32 = 0,
};
pub const Rect = extern struct {
    x: f32 = 0.0,
    y: f32 = 0.0,
    w: f32 = 0.0,
    h: f32 = 0.0,
};
pub const TexturedRect = extern struct {
    dst: Rect = .{},
    src: Rect = .{},
};
pub const Vec2 = extern struct {
    x: f32 = 0.0,
    y: f32 = 0.0,
};
pub const Point = extern struct {
    x: f32 = 0.0,
    y: f32 = 0.0,
};
pub const Line = extern struct {
    a: Point = .{},
    b: Point = .{},
};
pub const Triangle = extern struct {
    a: Point = .{},
    b: Point = .{},
    c: Point = .{},
};
pub const Mat2x3 = extern struct {
    v: [2][3]f32 = [_][3]f32{[_]f32{0.0} ** 3} ** 2,
};
pub const Color = extern struct {
    r: f32 = 0.0,
    g: f32 = 0.0,
    b: f32 = 0.0,
    a: f32 = 0.0,
};
pub const Uniform = extern struct {
    size: u32 = 0,
    content: [4]f32 = [_]f32{0.0} ** 4,
};
pub const ImagesUniform = extern struct {
    count: u32 = 0,
    images: [4]sg.Image = [_]sg.Image{.{}} ** 4,
};
pub const State = extern struct {
    frame_size: Isize = .{},
    viewport: Irect = .{},
    scissor: Irect = .{},
    proj: Mat2x3 = .{},
    transform: Mat2x3 = .{},
    mvp: Mat2x3 = .{},
    thickness: f32 = 0.0,
    color: Color = .{},
    images: ImagesUniform = .{},
    uniform: Uniform = .{},
    blend_mode: BlendMode = .NONE,
    pipeline: sg.Pipeline = .{},
    _base_vertex: u32 = 0,
    _base_uniform: u32 = 0,
    _base_command: u32 = 0,
};
pub const Desc = extern struct {
    max_vertices: u32 = 0,
    max_commands: u32 = 0,
};
pub const PipelineDesc = extern struct {
    shader: sg.ShaderDesc = .{},
    primitive_type: sg.PrimitiveType = .DEFAULT,
    blend_mode: BlendMode = .NONE,
};
pub extern fn sgp_setup([*c]const Desc) void;
pub fn setup(desc: Desc) void {
    sgp_setup(&desc);
}
pub extern fn sgp_shutdown() void;
pub fn shutdown() void {
    sgp_shutdown();
}
pub extern fn sgp_is_valid() bool;
pub fn isValid() bool {
    return sgp_is_valid();
}
pub extern fn sgp_get_last_error() Error;
pub fn getLastError() Error {
    return sgp_get_last_error();
}
pub extern fn sgp_get_error_message(Error) [*c]const u8;
pub fn getErrorMessage(_error: Error) [:0]const u8 {
    return cStrToZig(sgp_get_error_message(_error));
}
pub extern fn sgp_make_pipeline([*c]const PipelineDesc) sg.Pipeline;
pub fn makePipeline(desc: PipelineDesc) sg.Pipeline {
    return sgp_make_pipeline(&desc);
}
pub extern fn sgp_begin(i32, i32) void;
pub fn begin(width: i32, height: i32) void {
    sgp_begin(width, height);
}
pub extern fn sgp_flush() void;
pub fn flush() void {
    sgp_flush();
}
pub extern fn sgp_end() void;
pub fn end() void {
    sgp_end();
}
pub extern fn sgp_project(f32, f32, f32, f32) void;
pub fn project(left: f32, right: f32, top: f32, bottom: f32) void {
    sgp_project(left, right, top, bottom);
}
pub extern fn sgp_reset_project() void;
pub fn resetProject() void {
    sgp_reset_project();
}
pub extern fn sgp_push_transform() void;
pub fn pushTransform() void {
    sgp_push_transform();
}
pub extern fn sgp_pop_transform() void;
pub fn popTransform() void {
    sgp_pop_transform();
}
pub extern fn sgp_reset_transform() void;
pub fn resetTransform() void {
    sgp_reset_transform();
}
pub extern fn sgp_translate(f32, f32) void;
pub fn translate(x: f32, y: f32) void {
    sgp_translate(x, y);
}
pub extern fn sgp_rotate(f32) void;
pub fn rotate(theta: f32) void {
    sgp_rotate(theta);
}
pub extern fn sgp_rotate_at(f32, f32, f32) void;
pub fn rotateAt(theta: f32, x: f32, y: f32) void {
    sgp_rotate_at(theta, x, y);
}
pub extern fn sgp_scale(f32, f32) void;
pub fn scale(sx: f32, sy: f32) void {
    sgp_scale(sx, sy);
}
pub extern fn sgp_scale_at(f32, f32, f32, f32) void;
pub fn scaleAt(sx: f32, sy: f32, x: f32, y: f32) void {
    sgp_scale_at(sx, sy, x, y);
}
pub extern fn sgp_set_pipeline(sg.Pipeline) void;
pub fn setPipeline(pipeline: sg.Pipeline) void {
    sgp_set_pipeline(pipeline);
}
pub extern fn sgp_reset_pipeline() void;
pub fn resetPipeline() void {
    sgp_reset_pipeline();
}
pub extern fn sgp_set_uniform(?*const anyopaque, u32) void;
pub fn setUniform(data: ?*const anyopaque, size: u32) void {
    sgp_set_uniform(data, size);
}
pub extern fn sgp_reset_uniform() void;
pub fn resetUniform() void {
    sgp_reset_uniform();
}
pub extern fn sgp_set_blend_mode(BlendMode) void;
pub fn setBlendMode(blend_mode: BlendMode) void {
    sgp_set_blend_mode(blend_mode);
}
pub extern fn sgp_reset_blend_mode() void;
pub fn resetBlendMode() void {
    sgp_reset_blend_mode();
}
pub extern fn sgp_set_color(f32, f32, f32, f32) void;
pub fn setColor(r: f32, g: f32, b: f32, a: f32) void {
    sgp_set_color(r, g, b, a);
}
pub extern fn sgp_reset_color() void;
pub fn resetColor() void {
    sgp_reset_color();
}
pub extern fn sgp_set_image(i32, sg.Image) void;
pub fn setImage(channel: i32, image: sg.Image) void {
    sgp_set_image(channel, image);
}
pub extern fn sgp_unset_image(i32) void;
pub fn unsetImage(channel: i32) void {
    sgp_unset_image(channel);
}
pub extern fn sgp_reset_image(i32) void;
pub fn resetImage(channel: i32) void {
    sgp_reset_image(channel);
}
pub extern fn sgp_viewport(i32, i32, i32, i32) void;
pub fn viewport(x: i32, y: i32, w: i32, h: i32) void {
    sgp_viewport(x, y, w, h);
}
pub extern fn sgp_reset_viewport() void;
pub fn resetViewport() void {
    sgp_reset_viewport();
}
pub extern fn sgp_scissor(i32, i32, i32, i32) void;
pub fn scissor(x: i32, y: i32, w: i32, h: i32) void {
    sgp_scissor(x, y, w, h);
}
pub extern fn sgp_reset_scissor() void;
pub fn resetScissor() void {
    sgp_reset_scissor();
}
pub extern fn sgp_reset_state() void;
pub fn resetState() void {
    sgp_reset_state();
}
pub extern fn sgp_clear() void;
pub fn clear() void {
    sgp_clear();
}
pub extern fn sgp_draw_points([*c]const Point, u32) void;
pub fn drawPoints(points: Point, count: u32) void {
    sgp_draw_points(&points, count);
}
pub extern fn sgp_draw_point(f32, f32) void;
pub fn drawPoint(x: f32, y: f32) void {
    sgp_draw_point(x, y);
}
pub extern fn sgp_draw_lines([*c]const Line, u32) void;
pub fn drawLines(lines: Line, count: u32) void {
    sgp_draw_lines(&lines, count);
}
pub extern fn sgp_draw_line(f32, f32, f32, f32) void;
pub fn drawLine(ax: f32, ay: f32, bx: f32, by: f32) void {
    sgp_draw_line(ax, ay, bx, by);
}
pub extern fn sgp_draw_lines_strip([*c]const Point, u32) void;
pub fn drawLinesStrip(points: Point, count: u32) void {
    sgp_draw_lines_strip(&points, count);
}
pub extern fn sgp_draw_filled_triangles([*c]const Triangle, u32) void;
pub fn drawFilledTriangles(triangles: Triangle, count: u32) void {
    sgp_draw_filled_triangles(&triangles, count);
}
pub extern fn sgp_draw_filled_triangle(f32, f32, f32, f32, f32, f32) void;
pub fn drawFilledTriangle(ax: f32, ay: f32, bx: f32, by: f32, cx: f32, cy: f32) void {
    sgp_draw_filled_triangle(ax, ay, bx, by, cx, cy);
}
pub extern fn sgp_draw_filled_triangles_strip([*c]const Point, u32) void;
pub fn drawFilledTrianglesStrip(points: Point, count: u32) void {
    sgp_draw_filled_triangles_strip(&points, count);
}
pub extern fn sgp_draw_filled_rects([*c]const Rect, u32) void;
pub fn drawFilledRects(rects: Rect, count: u32) void {
    sgp_draw_filled_rects(&rects, count);
}
pub extern fn sgp_draw_filled_rect(f32, f32, f32, f32) void;
pub fn drawFilledRect(x: f32, y: f32, w: f32, h: f32) void {
    sgp_draw_filled_rect(x, y, w, h);
}
pub extern fn sgp_draw_textured_rects([*c]const Rect, u32) void;
pub fn drawTexturedRects(rects: Rect, count: u32) void {
    sgp_draw_textured_rects(&rects, count);
}
pub extern fn sgp_draw_textured_rect(f32, f32, f32, f32) void;
pub fn drawTexturedRect(x: f32, y: f32, w: f32, h: f32) void {
    sgp_draw_textured_rect(x, y, w, h);
}
pub extern fn sgp_draw_textured_rects_ex(i32, [*c]const TexturedRect, u32) void;
pub fn drawTexturedRectsEx(channel: i32, rects: TexturedRect, count: u32) void {
    sgp_draw_textured_rects_ex(channel, &rects, count);
}
pub extern fn sgp_draw_textured_rect_ex(i32, Rect, Rect) void;
pub fn drawTexturedRectEx(channel: i32, dest_rect: Rect, src_rect: Rect) void {
    sgp_draw_textured_rect_ex(channel, dest_rect, src_rect);
}
pub extern fn sgp_query_state() [*c]const State;
pub fn queryState() State {
    return sgp_query_state();
}
pub extern fn sgp_query_desc() Desc;
pub fn queryDesc() Desc {
    return sgp_query_desc();
}
