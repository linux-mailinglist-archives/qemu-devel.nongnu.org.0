Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503748AE26
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:05:36 +0100 (CET)
Received: from localhost ([::1]:48512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7GqF-0004rV-7Y
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:05:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n7GX7-0005I0-GL
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:45:49 -0500
Received: from [2607:f8b0:4864:20::62e] (port=40469
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n7GX4-00034J-5M
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:45:49 -0500
Received: by mail-pl1-x62e.google.com with SMTP id l15so16918110pls.7
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bNiP6Ax9a8VLYdXASSenEr7GrbNjGrkHoXWJhd60Hs8=;
 b=qrlL1bpUc8RHYE1KnBbb5ZNtkcA4pgPck4PxbigAOZFIMcW2cCezsb7q7I4eIcfw8x
 XfjLpWS7XzRVmeCQHte7zWRY/BltRILe8oVSpxgNG6J8h23B7iWU89wuELcDQ1BEx517
 vTzXxJud5d7jXjjcxFWbgXpY0ToPNw0ZmY/sKx1XjfwBBgOInpEjfPhteXBTigYgVkUw
 v1gLNVpZHWA/pu+B+GrwIDMOa99Khg0s3GGDqSB3fE7qqqHsdAxsFGNTZCDmH1B+h23Z
 i4c9xw100GP+DVFXPD7si20Xe+WwHRfRZrEL4g7frAGfRGO7YKqcTSP/zBEmL2x81IPF
 1e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bNiP6Ax9a8VLYdXASSenEr7GrbNjGrkHoXWJhd60Hs8=;
 b=i7OEeWAdbnZ7q8rZCsvMbFObcQVM5dEDIrIKuK67K1x4md3U17gsMNc3ZVM9UJdu4p
 uVyittngz60O6erW6Gb3nuJ16sKQJ+Rze8nHHo2FrkNF8mJrfGyvAMa/34YgjvM36EWt
 drkSZR7WVT7Dy0wF0SSUBt1NhdPBxakwXKsTiV2f1FO7yoCRWM0cK+DyFfDnig88XitA
 wgemSshnppdaMGlZ/ThjUtyO6Hw22h11qko1l9ml7zSN6wqBrYUx7ppv5UgSA8T01SPb
 h0qv5Dy8GMKUvTtNSdXRNJeFmSCQ3BPAahyMTXq/eEMqKIwiL9PxyI84ryA4O/1lFeS+
 KZCg==
X-Gm-Message-State: AOAM530KdcvbRRJFFOnbJ0H5SIOmfc6fk3HTtwq59vffT02vt4e+2n20
 g4nZkhV9DR5bdex7qUJTJ8aMoB2u7ADv1A==
X-Google-Smtp-Source: ABdhPJy+6k41JsalkUlemPudE78jRjW/lUgVSnRezMwI27W0Ewt7/vkVw02wgOehMqQPhK2ntBZ1bA==
X-Received: by 2002:a17:90a:a90:: with SMTP id
 16mr2929966pjw.125.1641905131353; 
 Tue, 11 Jan 2022 04:45:31 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 q22sm2703486pfu.153.2022.01.11.04.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 04:45:31 -0800 (PST)
Message-ID: <66e63ba1-d190-3a4e-12ee-95b94c84e3e0@gmail.com>
Date: Tue, 11 Jan 2022 21:45:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 19/37] console: save current scanout details
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-20-marcandre.lureau@redhat.com>
 <25b61c23-aa66-8857-f5d3-6f6b31664a5c@gmail.com>
 <CAMxuvawErYgckfVh_dVp5kFDjfKESodLZHtkiV_HNB7wmYwcoA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAMxuvawErYgckfVh_dVp5kFDjfKESodLZHtkiV_HNB7wmYwcoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hoffmann, Gerd" <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/01/11 17:23, Marc-André Lureau wrote:
> Hi Akihiko
> 
> On Tue, Jan 11, 2022 at 7:30 AM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> Hi,
>>
>> I found this brings an inconsistency and a flaw to scanout semantics and
>> think the inconsistency should be fixed or this should be reverted
>> before the next release comes up.
>>
>> The inconsistency is in the handling of the console size. A guest
>> hardware (especially I'm looking at virtio-gpu-virgl) tells the size
>> change with qemu_console_resize. It causes the replacement of the
>> surface, and the host display sees the change of the size via the
>> surface. The replacement of the surface does *not* mean the surface
>> should be scanned out; if an OpenGL texture is already provided, the
>> host display should scan out it, not the replaced surface.
> 
> Isn't that an inconsistent state? Is the host display supposed to
> scale the GL texture in this case, or what else?

Well, actually yes, there is a short time window where the window size 
and texture size are inconsistent. In reality, it has not been a problem 
since the resize is immidately followed by the texture scanout. If it 
was not the case, I guess the host display implementations would break 
in different ways.

> 
>> dpy_gl_scanout_disable will be called when the surface becomes the
>> source of the scanouts.
> 
> I don't think the code was/is so consistent about it, but I can agree
> with that rule eventually.

Skimming the code, apparently egl-headless, gtk-egl and sdl2-gl does not 
change the source of the scanouts in dpy_gfx_switch, which replaces the 
surface, and solely relies on dpy_gl_scanout_disable for the 
functionality. spice-egl *does* change the source of the scanouts in 
dpy_gfx_switch, which I was not aware. So you are right; it is not 
consistent as I thought.

Still the intention of the guest hardware is clear here; 
qemu_console_resize is obviously for resizing the console and not for 
changing the scanout source.

> 
>>
>> However, this change brings some contradicting behaviors.
>> - qemu_console_get_width and qemu_console_get_height now relies on the
>> texture size as the source of the console size while the resize is
>> delivered via the surface.
> 
> The texture update should follow, otherwise what do you do >
>> - dpy_gfx_replace_surface makes the surface as the source of the
>> scanouts while its guest hardware semantics does not mean that.
> 
> Here also, I am not convinced this is always consistent. But that
> should be fairly easy to change.
> 
> Do you have a particular example / test case where it's problematic?

When you resize a window, the change of the size is delivered to the 
guest, and the guest responds with a new texture which matches the 
current window size. Changing the scanout source in 
dpy_gfx_replace_surface causes a small disruption in the case and makes 
the screen black for a moment.

> 
>> - dpy_gl_scanout_disable sets the scanout kind to SCANOUT_NONE while it
>> actually means the surface is now the source of the scanout.
> 
> You make it sound like it is/was obvious. All those unwritten "rules"
> should probably be documented. If you have a good grasp of how the API
> should behave, it would be worth it to write some documentation,
> tests...

I think the cause of the problem is the design failures. The scanout 
details are delivered via several different channels and they interact 
with each other in a non-obvious way. The "surface" is overloaded and 
tasked to deliver pixmap *and* the console size. These design failures 
are artificial and can be fixed.

Another cause is that the OpenGL interface was designed for the single 
listener and driven by it. That listener-driven nature of OpenGL 
interface made it hard to understand and caused fragmentation. It is 
somewhat cannot be helped though if I understand correctly; you can't 
determine the graphics accelerator where OpenGL contexts should reside 
if you don't know which physical display actually outputs the result. 
That fundamental limitation makes the listener and the OpenGL context 
provieder inseperatable.
Now the interface allows to have multiple listeners for OpenGL, but I'm 
a bit concerning if it actually works. DisplaySurface has OpenGL-related 
fields managed by each listeners and having multiple would cause 
conflicts. The listener-driven nature still remains.

> 
>> Besides that, displaychangelistener_display_console has a flaw that it
>> does not tell the switch to a console with SCANOUT_NONE. The intention
>> of SCANOUT_NONE is not entirely clear.
> 
> I agree, it is not obvious to me what you were/are supposed to do when
> the GL scanout is disabled >
>> I think there are two options to fix the problem except reverting:
> 
> Well, reverting would be a pain, as it would break -display dbus.
> 
>> - Rework this change to make it consistent with the existing semantics.
> 
> Yes, that seems the way to go. I need your help to understand what is
> actually broken: please give me broken test cases. Otherwise, it feels
> needless.

There are two scenarios:
- Have a virtio-gpu-virgl device and let the guest automatically decide 
the screen resolution. Resize the window and see the source switches 
from the texture to the surface (black screen), and back to the texture.
- Have a virtio-gpu-virgl device. Reset it and switch to another console 
(e.g. serial) and switch back to the virtio-gpu-virgl. Now the console 
shows the stale output of serial.

> 
>> - Remove the use of qemu_console_resize and dpy_gl_scanout_disable from
>>     hardwares providing OpenGL textures or DMA-BUF to make it consistent
>>     with the new semantics.
> 
> It may make sense to make qemu_console_resize() work implicit when
> calling dpy_gl_scanout_texture().
> 
> Removing dpy_gl_scanout_disable() is not possible, since hardware will
> continue to provide 2d/fallback.

If dpy_gfx_replace_surface() does the switch to 2D, 
dpy_gl_scanout_disable() can be removed or its responsibility can be 
reduced at least.

Regards,
Akihiko Odaki

> 
> thanks
> 
> 
>>
>> Regards,
>> Akihiko Odaki
>>
>> On 2021/10/10 6:08, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> Add a new DisplayScanout structure to save the current scanout details.
>>> This allows to attach later UI backends and set the scanout.
>>>
>>> Introduce displaychangelistener_display_console() helper function to
>>> handle the dpy_gfx_switch/gl_scanout() & dpy_gfx_update() calls.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    include/ui/console.h |  27 +++++++
>>>    ui/console.c         | 165 +++++++++++++++++++++++++++++--------------
>>>    2 files changed, 138 insertions(+), 54 deletions(-)
>>>
>>> diff --git a/include/ui/console.h b/include/ui/console.h
>>> index b23ae283be..ab55d71894 100644
>>> --- a/include/ui/console.h
>>> +++ b/include/ui/console.h
>>> @@ -108,6 +108,17 @@ struct QemuConsoleClass {
>>>    #define QEMU_ALLOCATED_FLAG     0x01
>>>    #define QEMU_PLACEHOLDER_FLAG   0x02
>>>
>>> +typedef struct ScanoutTexture {
>>> +    uint32_t backing_id;
>>> +    bool backing_y_0_top;
>>> +    uint32_t backing_width;
>>> +    uint32_t backing_height;
>>> +    uint32_t x;
>>> +    uint32_t y;
>>> +    uint32_t width;
>>> +    uint32_t height;
>>> +} ScanoutTexture;
>>> +
>>>    typedef struct DisplaySurface {
>>>        pixman_format_code_t format;
>>>        pixman_image_t *image;
>>> @@ -173,6 +184,22 @@ typedef struct QemuDmaBuf {
>>>        bool      allow_fences;
>>>    } QemuDmaBuf;
>>>
>>> +enum display_scanout {
>>> +    SCANOUT_NONE,
>>> +    SCANOUT_SURFACE,
>>> +    SCANOUT_TEXTURE,
>>> +    SCANOUT_DMABUF,
>>> +};
>>> +
>>> +typedef struct DisplayScanout {
>>> +    enum display_scanout kind;
>>> +    union {
>>> +        /* DisplaySurface *surface; is kept in QemuConsole */
>>> +        ScanoutTexture texture;
>>> +        QemuDmaBuf *dmabuf;
>>> +    };
>>> +} DisplayScanout;
>>> +
>>>    typedef struct DisplayState DisplayState;
>>>    typedef struct DisplayGLCtx DisplayGLCtx;
>>>
>>> diff --git a/ui/console.c b/ui/console.c
>>> index e5a2c84dd9..a1c6a78523 100644
>>> --- a/ui/console.c
>>> +++ b/ui/console.c
>>> @@ -126,6 +126,7 @@ struct QemuConsole {
>>>        console_type_t console_type;
>>>        DisplayState *ds;
>>>        DisplaySurface *surface;
>>> +    DisplayScanout scanout;
>>>        int dcls;
>>>        DisplayGLCtx *gl;
>>>        int gl_block;
>>> @@ -197,6 +198,7 @@ static void dpy_refresh(DisplayState *s);
>>>    static DisplayState *get_alloc_displaystate(void);
>>>    static void text_console_update_cursor_timer(void);
>>>    static void text_console_update_cursor(void *opaque);
>>> +static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl);
>>>
>>>    static void gui_update(void *opaque)
>>>    {
>>> @@ -532,6 +534,8 @@ static void text_console_resize(QemuConsole *s)
>>>        TextCell *cells, *c, *c1;
>>>        int w1, x, y, last_width;
>>>
>>> +    assert(s->scanout.kind == SCANOUT_SURFACE);
>>> +
>>>        last_width = s->width;
>>>        s->width = surface_width(s->surface) / FONT_WIDTH;
>>>        s->height = surface_height(s->surface) / FONT_HEIGHT;
>>> @@ -1103,6 +1107,48 @@ static void console_putchar(QemuConsole *s, int ch)
>>>        }
>>>    }
>>>
>>> +static void displaychangelistener_display_console(DisplayChangeListener *dcl,
>>> +                                                  QemuConsole *con)
>>> +{
>>> +    static const char nodev[] =
>>> +        "This VM has no graphic display device.";
>>> +    static DisplaySurface *dummy;
>>> +
>>> +    if (!con) {
>>> +        if (!dcl->ops->dpy_gfx_switch) {
>>> +            return;
>>> +        }
>>> +        if (!dummy) {
>>> +            dummy = qemu_create_placeholder_surface(640, 480, nodev);
>>> +        }
>>> +        dcl->ops->dpy_gfx_switch(dcl, dummy);
>>> +        return;
>>> +    }
>>> +
>>> +    if (con->scanout.kind == SCANOUT_DMABUF &&
>>> +        displaychangelistener_has_dmabuf(dcl)) {
>>> +        dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
>>> +    } else if (con->scanout.kind == SCANOUT_TEXTURE &&
>>> +               dcl->ops->dpy_gl_scanout_texture) {
>>> +        dcl->ops->dpy_gl_scanout_texture(dcl,
>>> +                                         con->scanout.texture.backing_id,
>>> +                                         con->scanout.texture.backing_y_0_top,
>>> +                                         con->scanout.texture.backing_width,
>>> +                                         con->scanout.texture.backing_height,
>>> +                                         con->scanout.texture.x,
>>> +                                         con->scanout.texture.y,
>>> +                                         con->scanout.texture.width,
>>> +                                         con->scanout.texture.height);
>>> +    } else if (con->scanout.kind == SCANOUT_SURFACE &&
>>> +               dcl->ops->dpy_gfx_switch) {
>>> +        dcl->ops->dpy_gfx_switch(dcl, con->surface);
>>> +    }
>>> +
>>> +    dcl->ops->dpy_gfx_update(dcl, 0, 0,
>>> +                             qemu_console_get_width(con, 0),
>>> +                             qemu_console_get_height(con, 0));
>>> +}
>>> +
>>>    void console_select(unsigned int index)
>>>    {
>>>        DisplayChangeListener *dcl;
>>> @@ -1119,13 +1165,7 @@ void console_select(unsigned int index)
>>>                    if (dcl->con != NULL) {
>>>                        continue;
>>>                    }
>>> -                if (dcl->ops->dpy_gfx_switch) {
>>> -                    dcl->ops->dpy_gfx_switch(dcl, s->surface);
>>> -                }
>>> -            }
>>> -            if (s->surface) {
>>> -                dpy_gfx_update(s, 0, 0, surface_width(s->surface),
>>> -                               surface_height(s->surface));
>>> +                displaychangelistener_display_console(dcl, s);
>>>                }
>>>            }
>>>            if (ds->have_text) {
>>> @@ -1538,9 +1578,6 @@ static bool dpy_gl_compatible_with(QemuConsole *con, DisplayChangeListener *dcl)
>>>
>>>    void register_displaychangelistener(DisplayChangeListener *dcl)
>>>    {
>>> -    static const char nodev[] =
>>> -        "This VM has no graphic display device.";
>>> -    static DisplaySurface *dummy;
>>>        QemuConsole *con;
>>>
>>>        assert(!dcl->ds);
>>> @@ -1565,16 +1602,7 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
>>>        } else {
>>>            con = active_console;
>>>        }
>>> -    if (dcl->ops->dpy_gfx_switch) {
>>> -        if (con) {
>>> -            dcl->ops->dpy_gfx_switch(dcl, con->surface);
>>> -        } else {
>>> -            if (!dummy) {
>>> -                dummy = qemu_create_placeholder_surface(640, 480, nodev);
>>> -            }
>>> -            dcl->ops->dpy_gfx_switch(dcl, dummy);
>>> -        }
>>> -    }
>>> +    displaychangelistener_display_console(dcl, con);
>>>        text_console_update_cursor(NULL);
>>>    }
>>>
>>> @@ -1655,13 +1683,9 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
>>>    {
>>>        DisplayState *s = con->ds;
>>>        DisplayChangeListener *dcl;
>>> -    int width = w;
>>> -    int height = h;
>>> +    int width = qemu_console_get_width(con, x + w);
>>> +    int height = qemu_console_get_height(con, y + h);
>>>
>>> -    if (con->surface) {
>>> -        width = surface_width(con->surface);
>>> -        height = surface_height(con->surface);
>>> -    }
>>>        x = MAX(x, 0);
>>>        y = MAX(y, 0);
>>>        x = MIN(x, width);
>>> @@ -1684,12 +1708,10 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
>>>
>>>    void dpy_gfx_update_full(QemuConsole *con)
>>>    {
>>> -    if (!con->surface) {
>>> -        return;
>>> -    }
>>> -    dpy_gfx_update(con, 0, 0,
>>> -                   surface_width(con->surface),
>>> -                   surface_height(con->surface));
>>> +    int w = qemu_console_get_width(con, 0);
>>> +    int h = qemu_console_get_height(con, 0);
>>> +
>>> +    dpy_gfx_update(con, 0, 0, w, h);
>>>    }
>>>
>>>    void dpy_gfx_replace_surface(QemuConsole *con,
>>> @@ -1716,6 +1738,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
>>>
>>>        assert(old_surface != surface);
>>>
>>> +    con->scanout.kind = SCANOUT_SURFACE;
>>>        con->surface = surface;
>>>        QLIST_FOREACH(dcl, &s->listeners, next) {
>>>            if (con != (dcl->con ? dcl->con : active_console)) {
>>> @@ -1891,6 +1914,9 @@ void dpy_gl_scanout_disable(QemuConsole *con)
>>>        DisplayState *s = con->ds;
>>>        DisplayChangeListener *dcl;
>>>
>>> +    if (con->scanout.kind != SCANOUT_SURFACE) {
>>> +        con->scanout.kind = SCANOUT_NONE;
>>> +    }
>>>        QLIST_FOREACH(dcl, &s->listeners, next) {
>>>            dcl->ops->dpy_gl_scanout_disable(dcl);
>>>        }
>>> @@ -1907,6 +1933,11 @@ void dpy_gl_scanout_texture(QemuConsole *con,
>>>        DisplayState *s = con->ds;
>>>        DisplayChangeListener *dcl;
>>>
>>> +    con->scanout.kind = SCANOUT_TEXTURE;
>>> +    con->scanout.texture = (ScanoutTexture) {
>>> +        backing_id, backing_y_0_top, backing_width, backing_height,
>>> +        x, y, width, height
>>> +    };
>>>        QLIST_FOREACH(dcl, &s->listeners, next) {
>>>            dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
>>>                                             backing_y_0_top,
>>> @@ -1921,6 +1952,8 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,
>>>        DisplayState *s = con->ds;
>>>        DisplayChangeListener *dcl;
>>>
>>> +    con->scanout.kind = SCANOUT_DMABUF;
>>> +    con->scanout.dmabuf = dmabuf;
>>>        QLIST_FOREACH(dcl, &s->listeners, next) {
>>>            dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
>>>        }
>>> @@ -2047,10 +2080,8 @@ QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
>>>        s = qemu_console_lookup_unused();
>>>        if (s) {
>>>            trace_console_gfx_reuse(s->index);
>>> -        if (s->surface) {
>>> -            width = surface_width(s->surface);
>>> -            height = surface_height(s->surface);
>>> -        }
>>> +        width = qemu_console_get_width(s, 0);
>>> +        height = qemu_console_get_height(s, 0);
>>>        } else {
>>>            trace_console_gfx_new();
>>>            s = new_console(ds, GRAPHIC_CONSOLE, head);
>>> @@ -2079,13 +2110,8 @@ void graphic_console_close(QemuConsole *con)
>>>        static const char unplugged[] =
>>>            "Guest display has been unplugged";
>>>        DisplaySurface *surface;
>>> -    int width = 640;
>>> -    int height = 480;
>>> -
>>> -    if (con->surface) {
>>> -        width = surface_width(con->surface);
>>> -        height = surface_height(con->surface);
>>> -    }
>>> +    int width = qemu_console_get_width(con, 640);
>>> +    int height = qemu_console_get_height(con, 480);
>>>
>>>        trace_console_gfx_close(con->index);
>>>        object_property_set_link(OBJECT(con), "device", NULL, &error_abort);
>>> @@ -2237,7 +2263,19 @@ int qemu_console_get_width(QemuConsole *con, int fallback)
>>>        if (con == NULL) {
>>>            con = active_console;
>>>        }
>>> -    return con ? surface_width(con->surface) : fallback;
>>> +    if (con == NULL) {
>>> +        return fallback;
>>> +    }
>>> +    switch (con->scanout.kind) {
>>> +    case SCANOUT_DMABUF:
>>> +        return con->scanout.dmabuf->width;
>>> +    case SCANOUT_TEXTURE:
>>> +        return con->scanout.texture.width;
>>> +    case SCANOUT_SURFACE:
>>> +        return surface_width(con->surface);
>>> +    default:
>>> +        return fallback;
>>> +    }
>>>    }
>>>
>>>    int qemu_console_get_height(QemuConsole *con, int fallback)
>>> @@ -2245,7 +2283,19 @@ int qemu_console_get_height(QemuConsole *con, int fallback)
>>>        if (con == NULL) {
>>>            con = active_console;
>>>        }
>>> -    return con ? surface_height(con->surface) : fallback;
>>> +    if (con == NULL) {
>>> +        return fallback;
>>> +    }
>>> +    switch (con->scanout.kind) {
>>> +    case SCANOUT_DMABUF:
>>> +        return con->scanout.dmabuf->height;
>>> +    case SCANOUT_TEXTURE:
>>> +        return con->scanout.texture.height;
>>> +    case SCANOUT_SURFACE:
>>> +        return surface_height(con->surface);
>>> +    default:
>>> +        return fallback;
>>> +    }
>>>    }
>>>
>>>    static void vc_chr_set_echo(Chardev *chr, bool echo)
>>> @@ -2305,12 +2355,13 @@ static void text_console_do_init(Chardev *chr, DisplayState *ds)
>>>        s->total_height = DEFAULT_BACKSCROLL;
>>>        s->x = 0;
>>>        s->y = 0;
>>> -    if (!s->surface) {
>>> -        if (active_console && active_console->surface) {
>>> -            g_width = surface_width(active_console->surface);
>>> -            g_height = surface_height(active_console->surface);
>>> +    if (s->scanout.kind != SCANOUT_SURFACE) {
>>> +        if (active_console && active_console->scanout.kind == SCANOUT_SURFACE) {
>>> +            g_width = qemu_console_get_width(active_console, g_width);
>>> +            g_height = qemu_console_get_height(active_console, g_height);
>>>            }
>>>            s->surface = qemu_create_displaysurface(g_width, g_height);
>>> +        s->scanout.kind = SCANOUT_SURFACE;
>>>        }
>>>
>>>        s->hw_ops = &text_console_ops;
>>> @@ -2369,6 +2420,7 @@ static void vc_chr_open(Chardev *chr,
>>>            s = new_console(NULL, TEXT_CONSOLE, 0);
>>>        } else {
>>>            s = new_console(NULL, TEXT_CONSOLE_FIXED_SIZE, 0);
>>> +        s->scanout.kind = SCANOUT_SURFACE;
>>>            s->surface = qemu_create_displaysurface(width, height);
>>>        }
>>>
>>> @@ -2392,13 +2444,13 @@ static void vc_chr_open(Chardev *chr,
>>>
>>>    void qemu_console_resize(QemuConsole *s, int width, int height)
>>>    {
>>> -    DisplaySurface *surface;
>>> +    DisplaySurface *surface = qemu_console_surface(s);
>>>
>>>        assert(s->console_type == GRAPHIC_CONSOLE);
>>>
>>> -    if (s->surface && (s->surface->flags & QEMU_ALLOCATED_FLAG) &&
>>> -        pixman_image_get_width(s->surface->image) == width &&
>>> -        pixman_image_get_height(s->surface->image) == height) {
>>> +    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
>>> +        pixman_image_get_width(surface->image) == width &&
>>> +        pixman_image_get_height(surface->image) == height) {
>>>            return;
>>>        }
>>>
>>> @@ -2408,7 +2460,12 @@ void qemu_console_resize(QemuConsole *s, int width, int height)
>>>
>>>    DisplaySurface *qemu_console_surface(QemuConsole *console)
>>>    {
>>> -    return console->surface;
>>> +    switch (console->scanout.kind) {
>>> +    case SCANOUT_SURFACE:
>>> +        return console->surface;
>>> +    default:
>>> +        return NULL;
>>> +    }
>>>    }
>>>
>>>    PixelFormat qemu_default_pixelformat(int bpp)
>>
> 

