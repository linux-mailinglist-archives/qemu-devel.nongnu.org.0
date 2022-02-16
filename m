Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8E64B8F19
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:27:22 +0100 (CET)
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKO5J-0005zY-De
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:27:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKNpc-0005FN-UG
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:11:10 -0500
Received: from [2607:f8b0:4864:20::533] (port=45710
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKNpZ-0001b1-QU
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:11:08 -0500
Received: by mail-pg1-x533.google.com with SMTP id z4so2665039pgh.12
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to:content-transfer-encoding;
 bh=QZwUHs8blL7ig0/Y2jeJGqz4Paa580U7Y4d86v1RKrY=;
 b=qWEpRNqgGquAMSbouzqOT7e6yWp2b16QH9HyraaWdapck7Up2lD9RK/dkd1CtSzHyk
 Nz3XCBQ18oVGThBMnyhfiPzlzztG3nv18eZQIoiNqu96kr0rwqaGzVN4yaeEgsWUYFTM
 CLcSVcVfUXsQ41IzpqjRJEN2ejSU7kCRa915vTlljCQXDw/Xv8NMz4univ23eCTGMjHC
 B//Y4DbwzRkRGfHNIm+fV7HOuMYWL/bzrG5y69QqvTcAaBK/oQj/SvTVOjsK8sY7bm+k
 bHcCP6/jhexVrZTxvoVaFqRcmkLjE3kLItjwdImlauf2yI69LG93rZvYD0mVGMUGGQMh
 ca+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=QZwUHs8blL7ig0/Y2jeJGqz4Paa580U7Y4d86v1RKrY=;
 b=BgB3kTtN8hDtBxMw8cbT6HhIAQNp2lfFHaERaMNIyUIl5rpf2SpEkUTqiysqlMluCY
 erhmwcp5jt8hDAAQoIuDLXXMJFF4jx6E3BIMHbEIz1vV2fzSJJAlSZkRQsQXIwaoas6E
 Q7mPZHCpWHT2Wi/5P8iiaI/MrRSs3LPCez2nXJ83obEIknp6aJTVInfnIX/TT6JEXmIu
 4oqtScexk4ObLKivRI/tT4lBu3vUteyCDUbnsvsH0Pu1S18g9HckPG36Dmq5QL2wnPmU
 2CQkkA63zOcoMlXMlRfgn+cLQ6cISnQd0eY5TSCQ/aPl/VY3+r7CocpkDOGAYDXg5byB
 07OA==
X-Gm-Message-State: AOAM533jlU1JuWohAALt8zOBuSQUjqG9QuRTN4lcEKHk53hYVrFiwZU1
 QRxoATMneQKrhX0v85Krli0=
X-Google-Smtp-Source: ABdhPJwa5Zv/8AigrkpDKa60dUxB85QEhsPwte2+/1YcQmpDUiM2kbMDozfFO+hlYw3JgJ9hJnjgkQ==
X-Received: by 2002:a63:6cb:0:b0:36c:e2d:8857 with SMTP id
 194-20020a6306cb000000b0036c0e2d8857mr3055230pgg.214.1645031464229; 
 Wed, 16 Feb 2022 09:11:04 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 c17sm47446717pfv.68.2022.02.16.09.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 09:11:03 -0800 (PST)
Message-ID: <365c0267-b630-8ec3-3daa-a76614eace8d@gmail.com>
Date: Thu, 17 Feb 2022 02:05:35 +0900
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
 <fe618e4c-0817-a86d-58d2-c80a878195b4@gmail.com>
 <CAJ+F1CKOkTqFBkDF7VTjeE8LX=wFgsrPrmuvnj0L1vMThyWGUQ@mail.gmail.com>
 <CAMVc7JWnqucqKeEBDWFES8JYY77gmbMaX-inz+CSzd-bymr5cQ@mail.gmail.com>
 <CAJ+F1CJ1ZZV-dv6kHhYmAkg5Pnrb_-q7o3Bndo6cQZsYN+RkgA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAJ+F1CJ1ZZV-dv6kHhYmAkg5Pnrb_-q7o3Bndo6cQZsYN+RkgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/02/17 1:51, Marc-André Lureau wrote:
> Hi Akihiko,
> 
> (I suppose you meant to reply-all, feel free to add back qemu-devel)

My bad, restored Ccs.

> 
> On Tue, Feb 15, 2022 at 5:56 PM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>> wrote:
> 
>     On Tue, Feb 15, 2022 at 10:32 PM Marc-André Lureau
>     <marcandre.lureau@gmail.com <mailto:marcandre.lureau@gmail.com>> wrote:
>      >
>      > Hi
>      >
>      > On Tue, Feb 15, 2022 at 7:09 AM Akihiko Odaki
>     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>> wrote:
>      >>
>      >>
>      >>
>      >> On 2022/02/15 4:49, Marc-André Lureau wrote:
>      >> > Hi
>      >> >
>      >> > On Mon, Feb 14, 2022 at 5:15 PM Akihiko Odaki
>     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
>      >> > <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>> wrote:
>      >> >
>      >> >     On Mon, Feb 14, 2022 at 9:07 PM Marc-André Lureau
>      >> >     <marcandre.lureau@gmail.com
>     <mailto:marcandre.lureau@gmail.com>
>     <mailto:marcandre.lureau@gmail.com
>     <mailto:marcandre.lureau@gmail.com>>> wrote:
>      >> >      >
>      >> >      > Hi Akihiko
>      >> >      >
>      >> >      > On Sun, Feb 13, 2022 at 6:44 AM Akihiko Odaki
>      >> >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
>     <mailto:akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>>>
>     wrote:
>      >> >      >>
>      >> >      >> ui/dbus required to have multiple DisplayChangeListeners
>      >> >     (possibly with OpenGL)
>      >> >      >> for a console but that caused several problems:
>      >> >      >> - It broke egl-headless, an unusual display which
>     implements
>      >> >     OpenGL rendering
>      >> >      >>   for non-OpenGL displays. The code to support multiple
>      >> >     DisplayChangeListeners
>      >> >      >>   does not consider the case where non-OpenGL displays
>     listens
>      >> >     OpenGL consoles.
>      >> >      >
>      >> >      >
>      >> >      > Can you provide instructions on what broke? Even better
>     write a
>      >> >     test, please.
>      >> >
>      >> >     The following command segfaults. Adding a test would be
>     nice, but it
>      >> >     would need a binary which uses OpenGL.
>      >> >     qemu-system-x86_64 -device virtio-gpu-gl-pci -display
>     egl-headless
>      >> >     -vnc :0 -m 8G -cdrom
>     Fedora-Workstation-Live-x86_64-34-1.2.iso -accel
>      >> >     kvm
>      >> >
>      >> >
>      >> > Thanks!
>      >> >
>      >> > This is clearly a mistake from commit 7cc712e98 ("ui: dispatch
>     GL events
>      >> > to all listener").
>      >> >
>      >> > It should have taken into account that some listeners do not
>     have GL
>      >> > callbacks, and guard the call.
>      >> >
>      >> > We should wrap the missing ops->dpy_gl_call() with a if
>      >> > (ops->dpy_gl_call) ? I'll send a patch for that.
>      >>
>      >>
>      >> The assumption that OpenGL DisplayChangeListener and non-OpenGL
>      >> DisplayChangeListener are exclusive is now broken so we have to
>     examine
>      >
>      >
>      > Before the changes, there was already such a GL & non-GL listener
>     mixed situation. It's only because the first listener with GL would
>     be registered in register_displaychangelistener() that it "worked".
> 
>     I mean the dbus patch series should be reexamined since it does not
>     seem to consider the case.
> 
> 
> That's what I am doing, with your very good help.
> 
> 
>      >
>      >> if the whole patch series works correct without the assumption.
>     Other
>      >> problem I have found (and forgot to mention) is:
>      >> - that console_select and register_displaychangelistener may not
>     call
>      >> dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is
>      >> incompatible with non-OpenGL displays and
>      >
>      >
>      > Can you translate that to a reproducible test with expected outcome?
> 
>     vnc has the feature to switch consoles with Ctrl+Alt+[1-9] if it is
>     not bound to a particular console. Invoking the functionality with
>     egl-headless enabled would trigger the problem.
> 
> 
> That doesn't seem to happen after the fixes ([PATCH 0/3] GL console 
> related fixes) I posted.
> 
>      >
>      >>
>      >> - that the compatibility check breaks if egl-headless is present
>     and a
>      >> non-OpenGL DisplayChangeListener with con field is being added.
>      >>
>      >
>      > Same, thanks
> 
>     The following command should do:
>     qemu-system-x86_64 -device virtio-gpu-gl-pci,id=d -display
>     egl-headless -vnc :0,display=d -m 8G -cdrom
>     Fedora-Workstation-Live-x86_64-34-1.2.iso -accel kvm
> 
> 
> Thanks, that helps! I didn't realize DCL had "dynamic" consoles and the 
> compatibility checks were bypassed without specifying a specific display=d.
> 
> I'll address this in the v2 of my patch fixes series. Please check it.
> 
>      >
>      >>
>      >> By the way, dbus registers a DisplayChangeListener for the size
>      >> detection, apparently it fails to set "con" field, making it an
>      >> accidental user of console_select.
>      >
>      >
>      > I need more details, please.
> 
>     A DisplayChangeListener without con field set is passed to
>     register_displaychangelistener in dbus_display_console_new.
> 
> 
> Good catch, should be fixed too.
> 
> 
>      >
>      >>
>      >>
>      >> >
>      >> >      >
>      >> >      > "make check-avocado
>     AVOCADO_TESTS=tests/avocado/virtio-gpu.py",
>      >> >     which covers egl-headless usage, works.
>      >> >      >
>      >> >      >>
>      >> >      >> - Multiple OpenGL DisplayChangeListeners of dbus
>     shares one
>      >> >     DisplaySurface and
>      >> >      >>   modifies its texture field, causing OpenGL texture
>     leak and
>      >> >     use-after-free.
>      >> >      >
>      >> >      >
>      >> >      > Again, please provide instructions. I have regularly
>     run -display
>      >> >     dbus with multiple clients and qemu compiled with
>     sanitizers. I
>      >> >     don't see any leak or use after free.
>      >> >
>      >> >     I doubt sanitizers can find this because it is an OpenGL
>     texture. You
>      >> >     may add a probe around surface_gl_create_texture and
>      >> >     surface_gl_destroy_texture.
>      >> >
>      >> >
>      >> > Indeed, a surface is created on each frame, because we create a 2d
>      >> > surface on each qemu_console_resize(), which is called at each
>     virgl
>      >> > scanout. This is a regression introduced by commit ebced09185
>     ("console:
>      >> > save current scanout details"). I can propose an easy fix,
>     please check it.
>      >> >
>      >> > And the root of the leak is actually
>     surface_gl_create_texutre(), it
>      >> > should be idempotent, just like destroy().
>      >>
>      >> That is not enough since it may leave the texture present after
>      >> unregister_displaychangelistener. And calling
>      >> surface_gl_destroy_texture() before
>     unregister_displaychangelistener may
>      >> break the other listeners.
>      >
>      >
>      > The texture is shared, but owned by the console. It is not leaked.
>      >
>      > However, given that it is shared, it would be indeed better to
>     refcount the users to avoid destroying the texture by one listener
>     going away.
> 
>     Nobody destroys the texture in the case so it is a leak. Particularly
>     after dpy_gfx_replace_surface, even the reference which remains in
>     DisplaySurface will be gone.
> 
> 
>   We need a QemuConsole finalizer to call qemu_free_displaysurface(). 
> The UI code needs to evolve to become more robust in dynamic situations. 
> Let's do that.

QemuConsole gets never gone (if it does it would also break other 
displays), so adding a code to call surface_gl_destroy_texutre before 
unregister_displaychangelistener should be enough. However, doing so 
would break the other OpenGL DisplayChangeListeners of the same console 
if they exist.

Allowing to add/remove QemuConsole would be nice for hotplugging and it 
should also make the code clear overall by being more explicit about the 
lifetime of the resources, but that needs to update most (probably all) 
displays.

> 
> 
>      >
>      >>
>      >> >
>      >> >
>      >> >      >
>      >> >      >>
>      >> >      >> - Introduced extra code to check the compatibility of
>     OpenGL
>      >> >     context providers
>      >> >      >>   and OpenGL texture renderers where those are often
>     inherently
>      >> >     tightly coupled
>      >> >      >>   since they must share the same hardware.
>      >> >      >
>      >> >      >
>      >> >      > So code checks are meant to prevent misusage. They
>     might be too
>      >> >     limited or broken in some ways, but reverting is likely
>     going to
>      >> >     introduce other regressions I was trying to fix.
>      >> >
>      >> >     The misuse will not occur because DisplayChangeListeners
>     will be
>      >> >     merged with OpenGL context providers.
>      >> >
>      >> >
>      >> > Ok, but aren't the checks enough to prevent it already? I have
>     to check
>      >> > the use cases and differences of design, but you might be
>     right that we
>      >> > don't need such a split after all.
>      >>
>      >> Yes, the point is that it requires extra code.
>      >>
>      >> >
>      >> >
>      >> >      >
>      >> >      >> - Needed extra work to broadcast the same change to
>     multiple
>      >> >     dbus listeners.
>      >> >      >>
>      >> >      >
>      >> >      > Compared to what?
>      >> >
>      >> >     Compared to sharing one DisplayChangeListener for multiple
>     dbus
>      >> >     listeners.
>      >> >
>      >> >
>      >> > Well, you just moved the problem to the dbus display, not
>     removed any work.
>      >> >
>      >> > What we have currently is more generic, you should be able to
>     add/remove
>      >> > various listeners (in theory, we only really do it for dbus at
>     this point).
>      >>
>      >> The each DisplayChangeListeners have to upload the
>     DisplaySurface to the
>      >> graphics accelerator, create a DMA-BUF file descriptor, and make it
>      >> suitable for D-Bus delivery. The duplicate work can be just done
>     once if
>      >> we have only one DisplayChangeListener for one console.
>      >
>      >
>      > And we should avoid duplicating the texture/resources if
>     possible. This is not specific to DBus, it's the reason why I would
>     rather have the logic in the console code so we avoid code
>     duplication and we can do further improvement at the lower-level.
> 
>     The resources created are specific to D-Bus. Not all displays have
>     GUnixFDList, DMA-BUF file descriptors and OpenGL textures.
> 
> 
>   GUnixFDList is in dbus code. dmabuf fd & opengl textures are not 
> specific to dbus, they are used by spice as well, for example.
> 

You have to consider about the case where DMA-BUF is not used or OpenGL 
is not enabled if we try to remove the duplicate work in the common 
code. It would result in much less code if you reuse GUnixFDList in 
dbus, and that is what this patch series do.

> 
>     Regards,
>     Akihiko Odaki
> 
>      >
>      >>
>      >>
>      >> >
>      >> >
>      >> >      >
>      >> >      >>
>      >> >      >> This series solve them by implementing the change
>     broadcast in
>      >> >     ui/dbus, which
>      >> >      >> knows exactly what is needed. Changes for the common
>     code to
>      >> >     support multiple
>      >> >      >> OpenGL DisplayChangeListeners were reverted to fix
>     egl-headless
>      >> >     and reduce
>      >> >      >> the code size.
>      >> >      >
>      >> >      >
>      >> >      > Thanks a lot for your work, I am going to take a look
>     at your
>      >> >     approach. But please help us understand better what the
>     problem
>      >> >     actually is, by giving examples & tests to avoid future
>     regressions
>      >> >     and document the expected behaviour.
>      >> >
>      >> >     The thing is really complicated and I may miss details so
>     please feel
>      >> >     free to ask questions or provide suggestions.
>      >> >
>      >> >
>      >> > Reverting changes and proposing an alternative implementation
>     requires
>      >> > detailed explanation and convincing arguments. It may take a
>     while, but
>      >> > we will try to get through the problems and evaluate the
>     alternative
>      >> > designs. Thanks again for your help!
>      >>
>      >> Rather, I think proposing a large change to common console code
>     requires
>      >> thorough examination and it should be reverted before it reaches the
>      >> release if it is doubtful that it is correct and reduces the
>     complexity
>      >> of a few displays (possibly in the future). "No regression"
>     should come
>      >> first before fix and feature. We can always revisit the change
>     land it
>      >> in a proper form even after reverting the change.
>      >>
>      >
>      > That's not how we usually work, there was a long RFC&PATCH review
>     period during which testing was done. It's true that Gerd, the
>     maintainer, didn't do a thorough review though. If we have to
>     revert, we can do it before the release. However, I would rather fix
>     the current design since it is meant to be more generic & flexible.
>     We still have some time.
>      >
>      > Thanks again for your help
>      >
>      >> Regards,
>      >> Akihiko Odaki
>      >>
>      >> >
>      >> >     Regards,
>      >> >     Akihiko Odaki
>      >> >
>      >> >
>      >> >      >
>      >> >      >>
>      >> >      >> Akihiko Odaki (6):
>      >> >      >>   ui/dbus: Share one listener for a console
>      >> >      >>   Revert "console: save current scanout details"
>      >> >      >>   Revert "ui: split the GL context in a different object"
>      >> >      >>   Revert "ui: dispatch GL events to all listeners"
>      >> >      >>   Revert "ui: associate GL context outside of display
>     listener
>      >> >      >>     registration"
>      >> >      >>   Revert "ui: factor out
>     qemu_console_set_display_gl_ctx()"
>      >> >      >>
>      >> >      >>  include/ui/console.h       |  60 +-----
>      >> >      >>  include/ui/egl-context.h   |   6 +-
>      >> >      >>  include/ui/gtk.h           |  11 +-
>      >> >      >>  include/ui/sdl2.h          |   7 +-
>      >> >      >>  include/ui/spice-display.h |   1 -
>      >> >      >>  ui/console.c               | 258 +++++++----------------
>      >> >      >>  ui/dbus-console.c          | 109 ++--------
>      >> >      >>  ui/dbus-listener.c         | 417
>      >> >     +++++++++++++++++++++++++++----------
>      >> >      >>  ui/dbus.c                  |  22 --
>      >> >      >>  ui/dbus.h                  |  36 +++-
>      >> >      >>  ui/egl-context.c           |   6 +-
>      >> >      >>  ui/egl-headless.c          |  20 +-
>      >> >      >>  ui/gtk-egl.c               |  10 +-
>      >> >      >>  ui/gtk-gl-area.c           |   8 +-
>      >> >      >>  ui/gtk.c                   |  25 +--
>      >> >      >>  ui/sdl2-gl.c               |  10 +-
>      >> >      >>  ui/sdl2.c                  |  14 +-
>      >> >      >>  ui/spice-display.c         |  19 +-
>      >> >      >>  18 files changed, 498 insertions(+), 541 deletions(-)
>      >> >      >>
>      >> >      >> --
>      >> >      >> 2.32.0 (Apple Git-132)
>      >> >      >>
>      >> >      >>
>      >> >      >
>      >> >      >
>      >> >      > --
>      >> >      > Marc-André Lureau
>      >> >
>      >> >
>      >> >
>      >> > --
>      >> > Marc-André Lureau
>      >
>      >
>      >
>      > --
>      > Marc-André Lureau
> 
> 
> 
> -- 
> Marc-André Lureau

