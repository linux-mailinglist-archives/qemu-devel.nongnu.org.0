Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1674B6162
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:10:54 +0100 (CET)
Received: from localhost ([::1]:40982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoEu-0004fi-Us
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:10:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJoDA-0003yH-8G
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 22:09:04 -0500
Received: from [2607:f8b0:4864:20::635] (port=41520
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJoD7-0001E4-SV
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 22:09:03 -0500
Received: by mail-pl1-x635.google.com with SMTP id j4so12043040plj.8
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 19:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gxn40PwLQDU7DeNCl/hPHWYlx8jJA4CS0bZET5fUUKM=;
 b=Q7pYwCIQopmSLIQx1J7KDSvSJq6XOSUb5yVKrbmur3Am/ig0r3+aXBANpZl3FLvd2v
 Xz+IOsgKsCwLbeyFOiDwP38RRWyXG0KSxWXfmg3NI5szk6kWCwjfwqnW87E7vZ2W8C6x
 8fwjieWFLxr9GhVxCnv9Y4z+pEeUY98kdpiSZ5EmUJ3UFQS3qFGztjI0BddHbR6vDuz3
 3gC8DwYIz+dzf4eKEnJj5tHc8qsjrbwJyGtib3+HMaSQnhJvtBl6f17uhRTS9p9/JmBT
 tuwOl/Ar5ndezMVJkf9b7ZORQF9/5ju97jbZhugfUm1Vz/kFaR9pAGczQej4AkyZp4zp
 dJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gxn40PwLQDU7DeNCl/hPHWYlx8jJA4CS0bZET5fUUKM=;
 b=oDICp7xuj58NccZTS87HBiBRNmMtIzA4XKQWn2TtfTCs1gnTEELSJB9uunxRzVxOxD
 /QiPrejb127YGzB8n1nImtDMSM2SalKB1vgH7g+A5eHloIbpG7Uw2RtjhyQHXK7+4iHP
 4AWIr7TKhsAF9gKHugBeSG+NDkayisvqZpiuNiD7jq0Uq5z3HNrQ20hurF7gPeJuOoiY
 Ao94vh7kojxHUsH+7hxzrIRUg4veGYJX5tKE4tXWLWEWeuHBZPrPxi/7SWtUQixiHfQG
 Fi0WZrKqAA+JWQydTwfBZbOJ+/tR08LRDpQunI7U0nJXxDt8inOKuBCDxzpRDOkpPsul
 yP6Q==
X-Gm-Message-State: AOAM530W/i2yHojXBO6RZUa9Lupe0mNETy1rzbSiU3PzbZ749irWhprQ
 h9uwi5w4062KFI7cXthsA7Y=
X-Google-Smtp-Source: ABdhPJx6UAkbZuCH/56TrJfqFWn6+jJVy2xlfSy8JRo8lyEpZFLPGZ4DaLHDaIbNtrC7vnrVAakrtQ==
X-Received: by 2002:a17:902:e749:: with SMTP id
 p9mr2112101plf.46.1644894540236; 
 Mon, 14 Feb 2022 19:09:00 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 q94sm4479674pja.27.2022.02.14.19.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 19:08:59 -0800 (PST)
Message-ID: <fe618e4c-0817-a86d-58d2-c80a878195b4@gmail.com>
Date: Tue, 15 Feb 2022 12:08:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/6] ui/dbus: Share one listener for a console
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
 <CAJ+F1C+3NyD+8Z8XGLBDLDGMfXh+MG+SOB_OY=ZXyLRHHNDTfg@mail.gmail.com>
 <CAMVc7JXcUNNnD75f3VO5Vy+MyUfKQhBkM-xHqrXMDUGoh4ALKA@mail.gmail.com>
 <CAJ+F1CKxwycO56NNFtZV8-anadCEOxYY3vwZ1xx+_v2y-z8XgA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAJ+F1CKxwycO56NNFtZV8-anadCEOxYY3vwZ1xx+_v2y-z8XgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/02/15 4:49, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Feb 14, 2022 at 5:15 PM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>> wrote:
> 
>     On Mon, Feb 14, 2022 at 9:07 PM Marc-André Lureau
>     <marcandre.lureau@gmail.com <mailto:marcandre.lureau@gmail.com>> wrote:
>      >
>      > Hi Akihiko
>      >
>      > On Sun, Feb 13, 2022 at 6:44 AM Akihiko Odaki
>     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>> wrote:
>      >>
>      >> ui/dbus required to have multiple DisplayChangeListeners
>     (possibly with OpenGL)
>      >> for a console but that caused several problems:
>      >> - It broke egl-headless, an unusual display which implements
>     OpenGL rendering
>      >>   for non-OpenGL displays. The code to support multiple
>     DisplayChangeListeners
>      >>   does not consider the case where non-OpenGL displays listens
>     OpenGL consoles.
>      >
>      >
>      > Can you provide instructions on what broke? Even better write a
>     test, please.
> 
>     The following command segfaults. Adding a test would be nice, but it
>     would need a binary which uses OpenGL.
>     qemu-system-x86_64 -device virtio-gpu-gl-pci -display egl-headless
>     -vnc :0 -m 8G -cdrom Fedora-Workstation-Live-x86_64-34-1.2.iso -accel
>     kvm
> 
> 
> Thanks!
> 
> This is clearly a mistake from commit 7cc712e98 ("ui: dispatch GL events 
> to all listener").
> 
> It should have taken into account that some listeners do not have GL 
> callbacks, and guard the call.
> 
> We should wrap the missing ops->dpy_gl_call() with a if 
> (ops->dpy_gl_call) ? I'll send a patch for that.


The assumption that OpenGL DisplayChangeListener and non-OpenGL 
DisplayChangeListener are exclusive is now broken so we have to examine 
if the whole patch series works correct without the assumption. Other 
problem I have found (and forgot to mention) is:
- that console_select and register_displaychangelistener may not call 
dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is 
incompatible with non-OpenGL displays and
- that the compatibility check breaks if egl-headless is present and a 
non-OpenGL DisplayChangeListener with con field is being added.

By the way, dbus registers a DisplayChangeListener for the size 
detection, apparently it fails to set "con" field, making it an 
accidental user of console_select.

> 
>      >
>      > "make check-avocado AVOCADO_TESTS=tests/avocado/virtio-gpu.py",
>     which covers egl-headless usage, works.
>      >
>      >>
>      >> - Multiple OpenGL DisplayChangeListeners of dbus shares one
>     DisplaySurface and
>      >>   modifies its texture field, causing OpenGL texture leak and
>     use-after-free.
>      >
>      >
>      > Again, please provide instructions. I have regularly run -display
>     dbus with multiple clients and qemu compiled with sanitizers. I
>     don't see any leak or use after free.
> 
>     I doubt sanitizers can find this because it is an OpenGL texture. You
>     may add a probe around surface_gl_create_texture and
>     surface_gl_destroy_texture.
> 
> 
> Indeed, a surface is created on each frame, because we create a 2d 
> surface on each qemu_console_resize(), which is called at each virgl 
> scanout. This is a regression introduced by commit ebced09185 ("console: 
> save current scanout details"). I can propose an easy fix, please check it.
> 
> And the root of the leak is actually surface_gl_create_texutre(), it 
> should be idempotent, just like destroy().

That is not enough since it may leave the texture present after 
unregister_displaychangelistener. And calling 
surface_gl_destroy_texture() before unregister_displaychangelistener may 
break the other listeners.

> 
> 
>      >
>      >>
>      >> - Introduced extra code to check the compatibility of OpenGL
>     context providers
>      >>   and OpenGL texture renderers where those are often inherently
>     tightly coupled
>      >>   since they must share the same hardware.
>      >
>      >
>      > So code checks are meant to prevent misusage. They might be too
>     limited or broken in some ways, but reverting is likely going to
>     introduce other regressions I was trying to fix.
> 
>     The misuse will not occur because DisplayChangeListeners will be
>     merged with OpenGL context providers.
> 
> 
> Ok, but aren't the checks enough to prevent it already? I have to check 
> the use cases and differences of design, but you might be right that we 
> don't need such a split after all.

Yes, the point is that it requires extra code.

> 
> 
>      >
>      >> - Needed extra work to broadcast the same change to multiple
>     dbus listeners.
>      >>
>      >
>      > Compared to what?
> 
>     Compared to sharing one DisplayChangeListener for multiple dbus
>     listeners.
> 
> 
> Well, you just moved the problem to the dbus display, not removed any work.
> 
> What we have currently is more generic, you should be able to add/remove 
> various listeners (in theory, we only really do it for dbus at this point).

The each DisplayChangeListeners have to upload the DisplaySurface to the 
graphics accelerator, create a DMA-BUF file descriptor, and make it 
suitable for D-Bus delivery. The duplicate work can be just done once if 
we have only one DisplayChangeListener for one console.

> 
> 
>      >
>      >>
>      >> This series solve them by implementing the change broadcast in
>     ui/dbus, which
>      >> knows exactly what is needed. Changes for the common code to
>     support multiple
>      >> OpenGL DisplayChangeListeners were reverted to fix egl-headless
>     and reduce
>      >> the code size.
>      >
>      >
>      > Thanks a lot for your work, I am going to take a look at your
>     approach. But please help us understand better what the problem
>     actually is, by giving examples & tests to avoid future regressions
>     and document the expected behaviour.
> 
>     The thing is really complicated and I may miss details so please feel
>     free to ask questions or provide suggestions.
> 
> 
> Reverting changes and proposing an alternative implementation requires 
> detailed explanation and convincing arguments. It may take a while, but 
> we will try to get through the problems and evaluate the alternative 
> designs. Thanks again for your help!

Rather, I think proposing a large change to common console code requires 
thorough examination and it should be reverted before it reaches the 
release if it is doubtful that it is correct and reduces the complexity 
of a few displays (possibly in the future). "No regression" should come 
first before fix and feature. We can always revisit the change land it 
in a proper form even after reverting the change.

Regards,
Akihiko Odaki

> 
>     Regards,
>     Akihiko Odaki
> 
> 
>      >
>      >>
>      >> Akihiko Odaki (6):
>      >>   ui/dbus: Share one listener for a console
>      >>   Revert "console: save current scanout details"
>      >>   Revert "ui: split the GL context in a different object"
>      >>   Revert "ui: dispatch GL events to all listeners"
>      >>   Revert "ui: associate GL context outside of display listener
>      >>     registration"
>      >>   Revert "ui: factor out qemu_console_set_display_gl_ctx()"
>      >>
>      >>  include/ui/console.h       |  60 +-----
>      >>  include/ui/egl-context.h   |   6 +-
>      >>  include/ui/gtk.h           |  11 +-
>      >>  include/ui/sdl2.h          |   7 +-
>      >>  include/ui/spice-display.h |   1 -
>      >>  ui/console.c               | 258 +++++++----------------
>      >>  ui/dbus-console.c          | 109 ++--------
>      >>  ui/dbus-listener.c         | 417
>     +++++++++++++++++++++++++++----------
>      >>  ui/dbus.c                  |  22 --
>      >>  ui/dbus.h                  |  36 +++-
>      >>  ui/egl-context.c           |   6 +-
>      >>  ui/egl-headless.c          |  20 +-
>      >>  ui/gtk-egl.c               |  10 +-
>      >>  ui/gtk-gl-area.c           |   8 +-
>      >>  ui/gtk.c                   |  25 +--
>      >>  ui/sdl2-gl.c               |  10 +-
>      >>  ui/sdl2.c                  |  14 +-
>      >>  ui/spice-display.c         |  19 +-
>      >>  18 files changed, 498 insertions(+), 541 deletions(-)
>      >>
>      >> --
>      >> 2.32.0 (Apple Git-132)
>      >>
>      >>
>      >
>      >
>      > --
>      > Marc-André Lureau
> 
> 
> 
> -- 
> Marc-André Lureau

