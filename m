Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1547BB8A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:13:48 +0100 (CET)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzaHL-0006S3-Mi
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:13:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzaBD-0002G7-Ro; Tue, 21 Dec 2021 03:07:27 -0500
Received: from [2607:f8b0:4864:20::735] (port=35675
 helo=mail-qk1-x735.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzaBB-0000wM-Rz; Tue, 21 Dec 2021 03:07:27 -0500
Received: by mail-qk1-x735.google.com with SMTP id 131so568501qkk.2;
 Tue, 21 Dec 2021 00:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to;
 bh=2jPXSqaFwzJUBSSA0pQONTemy4xZ9SutK5ZkL12xfXg=;
 b=J0XTpYddtsP7Ool+XLUhZBQtz3SnMU/5+Gm5vFi5KL2Tzq7bpu3brjVOj/eufYIsEi
 MzOdBxkJJ4oxN2Akd/d9jDAaW3iNdkw2Y5Gv0m2CJ781PgOngZHfVOK7Ga8ecCDpx9vR
 lvaZNmyFzBV5bo1okoOeCqBRXuj7GOtdVJ/rbJrJyjT10YxWYBU1vbX05FKtF3at62ru
 BDaCV2bFgZa2iUaSkZjifVTz3lI4/N0Gqr6gOjpD3+Q/wQKE/fAdV7F48nx8setj560v
 5Fac3J78hPRaUeyRKVZwU5Jp2l8J2ReTF1rC02LysxiKqHgHHp7QXk1i7HpcimvtyXKb
 MdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to;
 bh=2jPXSqaFwzJUBSSA0pQONTemy4xZ9SutK5ZkL12xfXg=;
 b=uSbbgXA+2LLYBoEctYFUYcG79+QrCD0ppdpxv6bMHK006UxZtFB+6rI/qtZo/PzPtU
 mIZf3fWiM5UBH/Gs84BjaodxjKmdm+6aUMfb/aOR/u8nujYTofPJL97ZkRguF4jf8aTJ
 uT39ldSWOcnIsrIZHiVHXeyOYtaZCSxfYqHBOJeSodbmckVWgADB2e7U3N5HgNRr95gK
 WhrKt/V2Ybxy44tbqXVkqAGZq2Y5gcdOzPVvz3V6HAHQQBTGGY/6Fc8nS7v8the2gwEd
 YYA9EJp7kdlb7uYUu+R9enh2F9opTOvYPZ7J1Ugiv/mdHG5zIyxQcP0913GdEvaQpm3x
 paQQ==
X-Gm-Message-State: AOAM531mQ/OtfsmbByOOcQzH4u5fOmGc8+QCNuPt2ox9WwLrIA2R1KQ2
 Jz/8LaOq9Ut3U3WN8PEs4xiKAXhXDuhTPw==
X-Google-Smtp-Source: ABdhPJznvJlY7Tcank6+/Z627s2jkcu+NGMmzoq0VxNUQjhDdhs3/zIc8TGZzN1RdZL3Wc71rrSWqA==
X-Received: by 2002:a37:c94:: with SMTP id 142mr1192346qkm.470.1640074044214; 
 Tue, 21 Dec 2021 00:07:24 -0800 (PST)
Received: from [192.168.1.10]
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id o10sm16943971qtx.33.2021.12.21.00.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 00:07:23 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------LkG0sPvLTikHrcoEDTtiRzqQ"
Message-ID: <3fc718a1-5e5d-ab97-9300-2e912fcf14db@gmail.com>
Date: Tue, 21 Dec 2021 03:07:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/4] ui: Fix gtk/gl when the scaled virtual console does
 not fit the window
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
 <20211219023006.124530-5-orzechowski.alexander@gmail.com>
 <CAJ+F1CK3aPi3WP9kBpz53Nvp5JR_TQ7CQjoMK3=F38rEHudtAA@mail.gmail.com>
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
In-Reply-To: <CAJ+F1CK3aPi3WP9kBpz53Nvp5JR_TQ7CQjoMK3=F38rEHudtAA@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::735
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------LkG0sPvLTikHrcoEDTtiRzqQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/21/21 02:48, Marc-André Lureau wrote:

> Hi
>
> On Sun, Dec 19, 2021 at 6:32 AM Alexander Orzechowski 
> <orzechowski.alexander@gmail.com> wrote:
>
>     gtk/gl was incorrectly always rendering as if the 'Zoom to Fit' was
>     always checked even if it wasn't. This is now using logic closer
>     to what is being used for the existing cairo code paths.
>
>     Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
>
>
> This doesn't work as expected, the display is not being centered 
> correctly.
>
>     ---
>      ui/gtk-gl-area.c | 34 +++++++++++++++++++++++++++++-----
>      1 file changed, 29 insertions(+), 5 deletions(-)
>
>     diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
>     index 01e4e74ee3..ea72f1817b 100644
>     --- a/ui/gtk-gl-area.c
>     +++ b/ui/gtk-gl-area.c
>     @@ -41,16 +41,40 @@ void gd_gl_area_draw(VirtualConsole *vc)
>      #ifdef CONFIG_GBM
>          QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
>      #endif
>     +    GtkDisplayState *s = vc->s;
>          int ww, wh, ws, y1, y2;
>     +    int mx, my;
>     +    int fbh, fbw;
>
>          if (!vc->gfx.gls) {
>              return;
>          }
>
>      gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
>     +
>     +    fbw = surface_width(vc->gfx.ds);
>     +    fbh = surface_height(vc->gfx.ds);
>     +
>          ws =
>     gdk_window_get_scale_factor(gtk_widget_get_window(vc->gfx.drawing_area));
>     -    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area) * ws;
>     -    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area) * ws;
>     +    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
>     +    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
>     +
>     +    if (s->full_screen) {
>     +        vc->gfx.scale_x = (double)ww / fbw;
>     +        vc->gfx.scale_y = (double)wh / fbh;
>     +    } else if (s->free_scale) {
>     +        double sx, sy;
>     +
>     +        sx = (double)ww / fbw;
>     +        sy = (double)wh / fbh;
>     +
>     +        vc->gfx.scale_x = vc->gfx.scale_y = MIN(sx, sy);
>     +    }
>     +
>     +    fbw *= vc->gfx.scale_x * ws;
>     +    fbh *= vc->gfx.scale_y * ws;
>     +    mx = (ww * ws - fbw) / 2;
>     +    my = (wh * ws - fbh) / 2;
>
>          if (vc->gfx.scanout_mode) {
>              if (!vc->gfx.guest_fb.framebuffer) {
>     @@ -70,11 +94,11 @@ void gd_gl_area_draw(VirtualConsole *vc)
>              glBindFramebuffer(GL_READ_FRAMEBUFFER,
>     vc->gfx.guest_fb.framebuffer);
>              /* GtkGLArea sets GL_DRAW_FRAMEBUFFER for us */
>
>     -        glViewport(0, 0, ww, wh);
>     +        glViewport(mx, my, fbw, fbh);
>              y1 = vc->gfx.y0_top ? 0 : vc->gfx.h;
>              y2 = vc->gfx.y0_top ? vc->gfx.h : 0;
>              glBlitFramebuffer(0, y1, vc->gfx.w, y2,
>     -                          0, 0, ww, wh,
>     +                          mx, my, fbw, fbh,
>                                GL_COLOR_BUFFER_BIT, GL_NEAREST);
>      #ifdef CONFIG_GBM
>              if (dmabuf) {
>     @@ -98,7 +122,7 @@ void gd_gl_area_draw(VirtualConsole *vc)
>              }
>      gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
>
>     -        surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww, wh);
>     +        glViewport(mx, my, fbw, fbh);
>              surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
>          }
>
>     -- 
>     2.34.1
>
>
>
>
> -- 
> Marc-André Lureau

It seems glBlitFramebuffer takes two coordinates instead of a width and 
height. I have corrected this locally and I will have v2 up tomorrow. 
Thanks for the thorough testing!

--

Alexander Orzechowski

--------------LkG0sPvLTikHrcoEDTtiRzqQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 12/21/21 02:48, Marc-André Lureau wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:CAJ+F1CK3aPi3WP9kBpz53Nvp5JR_TQ7CQjoMK3=F38rEHudtAA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Hi<br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Sun, Dec 19, 2021 at 6:32
            AM Alexander Orzechowski &lt;<a
              href="mailto:orzechowski.alexander@gmail.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">orzechowski.alexander@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">gtk/gl was incorrectly
            always rendering as if the 'Zoom to Fit' was<br>
            always checked even if it wasn't. This is now using logic
            closer<br>
            to what is being used for the existing cairo code paths.<br>
            <br>
            Signed-off-by: Alexander Orzechowski &lt;<a
              href="mailto:orzechowski.alexander@gmail.com"
              target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">orzechowski.alexander@gmail.com</a>&gt;<br>
          </blockquote>
          <div><br>
          </div>
          <div>This doesn't work as expected, the display is not being
            centered correctly.</div>
          <div> <br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            ---<br>
             ui/gtk-gl-area.c | 34 +++++++++++++++++++++++++++++-----<br>
             1 file changed, 29 insertions(+), 5 deletions(-)<br>
            <br>
            diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c<br>
            index 01e4e74ee3..ea72f1817b 100644<br>
            --- a/ui/gtk-gl-area.c<br>
            +++ b/ui/gtk-gl-area.c<br>
            @@ -41,16 +41,40 @@ void gd_gl_area_draw(VirtualConsole *vc)<br>
             #ifdef CONFIG_GBM<br>
                 QemuDmaBuf *dmabuf = vc-&gt;gfx.guest_fb.dmabuf;<br>
             #endif<br>
            +    GtkDisplayState *s = vc-&gt;s;<br>
                 int ww, wh, ws, y1, y2;<br>
            +    int mx, my;<br>
            +    int fbh, fbw;<br>
            <br>
                 if (!vc-&gt;gfx.gls) {<br>
                     return;<br>
                 }<br>
            <br>
               
             gtk_gl_area_make_current(GTK_GL_AREA(vc-&gt;gfx.drawing_area));<br>
            +<br>
            +    fbw = surface_width(vc-&gt;gfx.ds);<br>
            +    fbh = surface_height(vc-&gt;gfx.ds);<br>
            +<br>
                 ws =
gdk_window_get_scale_factor(gtk_widget_get_window(vc-&gt;gfx.drawing_area));<br>
            -    ww =
            gtk_widget_get_allocated_width(vc-&gt;gfx.drawing_area) *
            ws;<br>
            -    wh =
            gtk_widget_get_allocated_height(vc-&gt;gfx.drawing_area) *
            ws;<br>
            +    ww =
            gtk_widget_get_allocated_width(vc-&gt;gfx.drawing_area);<br>
            +    wh =
            gtk_widget_get_allocated_height(vc-&gt;gfx.drawing_area);<br>
            +<br>
            +    if (s-&gt;full_screen) {<br>
            +        vc-&gt;gfx.scale_x = (double)ww / fbw;<br>
            +        vc-&gt;gfx.scale_y = (double)wh / fbh;<br>
            +    } else if (s-&gt;free_scale) {<br>
            +        double sx, sy;<br>
            +<br>
            +        sx = (double)ww / fbw;<br>
            +        sy = (double)wh / fbh;<br>
            +<br>
            +        vc-&gt;gfx.scale_x = vc-&gt;gfx.scale_y = MIN(sx,
            sy);<br>
            +    }<br>
            +<br>
            +    fbw *= vc-&gt;gfx.scale_x * ws;<br>
            +    fbh *= vc-&gt;gfx.scale_y * ws;<br>
            +    mx = (ww * ws - fbw) / 2;<br>
            +    my = (wh * ws - fbh) / 2;<br>
            <br>
                 if (vc-&gt;gfx.scanout_mode) {<br>
                     if (!vc-&gt;gfx.guest_fb.framebuffer) {<br>
            @@ -70,11 +94,11 @@ void gd_gl_area_draw(VirtualConsole *vc)<br>
                     glBindFramebuffer(GL_READ_FRAMEBUFFER,
            vc-&gt;gfx.guest_fb.framebuffer);<br>
                     /* GtkGLArea sets GL_DRAW_FRAMEBUFFER for us */<br>
            <br>
            -        glViewport(0, 0, ww, wh);<br>
            +        glViewport(mx, my, fbw, fbh);<br>
                     y1 = vc-&gt;gfx.y0_top ? 0 : vc-&gt;gfx.h;<br>
                     y2 = vc-&gt;gfx.y0_top ? vc-&gt;gfx.h : 0;<br>
                     glBlitFramebuffer(0, y1, vc-&gt;gfx.w, y2,<br>
            -                          0, 0, ww, wh,<br>
            +                          mx, my, fbw, fbh,<br>
                                       GL_COLOR_BUFFER_BIT, GL_NEAREST);<br>
             #ifdef CONFIG_GBM<br>
                     if (dmabuf) {<br>
            @@ -98,7 +122,7 @@ void gd_gl_area_draw(VirtualConsole *vc)<br>
                     }<br>
                   
             gtk_gl_area_make_current(GTK_GL_AREA(vc-&gt;gfx.drawing_area));<br>
            <br>
            -        surface_gl_setup_viewport(vc-&gt;gfx.gls,
            vc-&gt;gfx.ds, ww, wh);<br>
            +        glViewport(mx, my, fbw, fbh);<br>
                     surface_gl_render_texture(vc-&gt;gfx.gls,
            vc-&gt;gfx.ds);<br>
                 }<br>
            <br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <br>
        -- <br>
        <div dir="ltr" class="gmail_signature">Marc-André Lureau<br>
        </div>
      </div>
    </blockquote>
    <p>It seems glBlitFramebuffer takes two coordinates instead of a
      width and height. I have corrected this locally and I will have v2
      up tomorrow. Thanks for the thorough testing!</p>
    <p>--</p>
    <p>Alexander Orzechowski<br>
    </p>
  </body>
</html>
--------------LkG0sPvLTikHrcoEDTtiRzqQ--


