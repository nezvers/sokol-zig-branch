//------------------------------------------------------------------------------
//  triangle.zig
//
//  Vertex buffer, shader, pipeline state object.
//------------------------------------------------------------------------------
const sokol = @import("sokol");
const sg = sokol.gfx;
const sapp = sokol.app;
const sgapp = sokol.app_gfx_glue;

const State = struct {
    bind: sg.Bindings = .{},
    pip: sg.Pipeline = .{},
};
var state: State = .{};

export fn init() void {
    sg.setup(.{
        .context = sgapp.context()
    });

    // create vertex buffer with triangle vertices
    const vertices = [_]f32 {
        // positions         colors
         0.0,  0.5, 0.5,     1.0, 0.0, 0.0, 1.0,
         0.5, -0.5, 0.5,     0.0, 1.0, 0.0, 1.0,
        -0.5, -0.5, 0.5,     0.0, 0.0, 1.0, 1.0
    };
    state.bind.vertex_buffers[0] = sg.makeBuffer(.{
        .content = &vertices,
        .size = sg.sizeOf(vertices)
    });

    // create a shader and pipeline object
    // NOTE: eventually we'd like to use designated init also for complex nested structs!
    var shd_desc: sg.ShaderDesc = .{};
    shd_desc.attrs[0].sem_name = "POS";
    shd_desc.attrs[1].sem_name = "COLOR";
    shd_desc.vs.source = vs_source();
    shd_desc.fs.source = fs_source();

    var pip_desc: sg.PipelineDesc = .{
        .shader = sg.makeShader(shd_desc)
    };
    pip_desc.layout.attrs[0].format = .FLOAT3;
    pip_desc.layout.attrs[1].format = .FLOAT4;
    state.pip = sg.makePipeline(pip_desc);
}

export fn frame() void {
    // default pass-action clears to grey
    sg.beginDefaultPass(.{}, sapp.width(), sapp.height());
    sg.applyPipeline(state.pip);
    sg.applyBindings(state.bind);
    sg.draw(0, 3, 1);
    sg.endPass();
    sg.commit();
}

export fn cleanup() void {
    sg.shutdown();
}

pub fn main() void {
    sapp.run(.{
        .init_cb = init,
        .frame_cb = frame,
        .cleanup_cb = cleanup,
        .width = 640,
        .height = 480,
        .window_title = "triangle.zig"
    });
}

fn vs_source() [*c]const u8 {
    return switch (sg.queryBackend()) {
        .D3D11 =>
            \\struct vs_in {
            \\  float4 pos: POS;
            \\  float4 color: COLOR;
            \\};
            \\struct vs_out {
            \\  float4 color: COLOR0;
            \\  float4 pos: SV_Position;
            \\};
            \\vs_out main(vs_in inp) {
            \\  vs_out outp;
            \\  outp.pos = inp.pos;
            \\  outp.color = inp.color;
            \\  return outp;
            \\}
            ,
        else => "FIXME"
    };
}

fn fs_source() [*c]const u8 {
    return switch (sg.queryBackend()) {
        .D3D11 =>
            \\float4 main(float4 color: COLOR0): SV_Target0 {
            \\  return color;
            \\}
            ,
        else => "FIXME"
    };
}


