Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE74B51B3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:35:20 +0100 (CET)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbVe-0001od-Rj
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:35:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJbCh-0004nb-4B
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:15:43 -0500
Received: from [2607:f8b0:4864:20::230] (port=41915
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJbCf-0002sM-3x
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:15:42 -0500
Received: by mail-oi1-x230.google.com with SMTP id ay7so17283088oib.8
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 05:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TdIBjaKyMzZbcKYuWOo/hRYglNBU2Hw/aysBL3DO65Q=;
 b=TPtFbOrsJPtQX/RYdHFa0yVEwXpK+nO2giUAzc12Bk6zP9m8T9galr3bUTV6BdJiTh
 PVSye0EjoZ4hsqOnWq6otKfQO23r2Fsx/FZVLLIqe1lA3lD8EyfR3iw+cpmyS7FNSyxz
 jhrTE+HSu0bDbc5Xdgp8SehcFQXBbdVemkwhXQB7MGZCli1brmnXuknZAHTNEvmd01e2
 NFdCqMTc++MuoDEj8sEyiGHoPMRQnaA1Jmz/apzMyYLHKxnNxQnGTnurVdVIVzT48LtG
 0S/8p6eqSZGfBhFyE88hbGhsijZDIWxLlbDFIF5Z96gNsFCRKroqQgTJgxU36UrYdl6R
 FS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TdIBjaKyMzZbcKYuWOo/hRYglNBU2Hw/aysBL3DO65Q=;
 b=mSWM/xDIZgL2bj2IA1RZbYcfu/0Wy4QKzC/1GSC1e+bvbu7BORa6gaE5lKUqFRkIRG
 pxtF3jaBGTdINLjphb6ufqr7gJDvSAQUZOYUMpt/le2oLnFDqv0RiLw6q7/tHg88bjjy
 0zoD865wbuh0gMqpmViNkUdU2M4LxuiwLumXFWpDB6g0CZKCuetK6zfvEELpx4z5iFW7
 7HBv9ZHy4VJYd/9GZKgyYFIYeDR8wcdI24Zua+jFeT26+UJlselyT2dnWmIc0C5aE8Hx
 GpxzTwDPlRhBGpePFNHBuFlGIc8nKwwQqMSkthNVA2VxMoJwVrmQof/oBAQl6nUnBeV2
 q9xg==
X-Gm-Message-State: AOAM531UmDeXHJKPyekp5WlfqVLkvH5r6ZAzBCNI8uG1vsN3NS3karZf
 qlOXg95q+w7IDc4hXf0vAG9+cJVmNBOgCG6zUsw=
X-Google-Smtp-Source: ABdhPJz9i+VLRrNVWTVpp8sXh5P95WTHkjpPSuVr8xxwm6bxiW5dxtM3M8v225GGg7djLfwYm910wg0l2+zfWtSuWJs=
X-Received: by 2002:a05:6808:1283:: with SMTP id
 a3mr5483831oiw.57.1644844539822; 
 Mon, 14 Feb 2022 05:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
 <CAJ+F1C+3NyD+8Z8XGLBDLDGMfXh+MG+SOB_OY=ZXyLRHHNDTfg@mail.gmail.com>
In-Reply-To: <CAJ+F1C+3NyD+8Z8XGLBDLDGMfXh+MG+SOB_OY=ZXyLRHHNDTfg@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 14 Feb 2022 22:15:28 +0900
Message-ID: <CAMVc7JXcUNNnD75f3VO5Vy+MyUfKQhBkM-xHqrXMDUGoh4ALKA@mail.gmail.com>
Subject: Re: [PATCH 0/6] ui/dbus: Share one listener for a console
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Feb 14, 2022 at 9:07 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi Akihiko
>
> On Sun, Feb 13, 2022 at 6:44 AM Akihiko Odaki <akihiko.odaki@gmail.com> w=
rote:
>>
>> ui/dbus required to have multiple DisplayChangeListeners (possibly with =
OpenGL)
>> for a console but that caused several problems:
>> - It broke egl-headless, an unusual display which implements OpenGL rend=
ering
>>   for non-OpenGL displays. The code to support multiple DisplayChangeLis=
teners
>>   does not consider the case where non-OpenGL displays listens OpenGL co=
nsoles.
>
>
> Can you provide instructions on what broke? Even better write a test, ple=
ase.

The following command segfaults. Adding a test would be nice, but it
would need a binary which uses OpenGL.
qemu-system-x86_64 -device virtio-gpu-gl-pci -display egl-headless
-vnc :0 -m 8G -cdrom Fedora-Workstation-Live-x86_64-34-1.2.iso -accel
kvm

>
> "make check-avocado AVOCADO_TESTS=3Dtests/avocado/virtio-gpu.py", which c=
overs egl-headless usage, works.
>
>>
>> - Multiple OpenGL DisplayChangeListeners of dbus shares one DisplaySurfa=
ce and
>>   modifies its texture field, causing OpenGL texture leak and use-after-=
free.
>
>
> Again, please provide instructions. I have regularly run -display dbus wi=
th multiple clients and qemu compiled with sanitizers. I don't see any leak=
 or use after free.

I doubt sanitizers can find this because it is an OpenGL texture. You
may add a probe around surface_gl_create_texture and
surface_gl_destroy_texture.

>
>>
>> - Introduced extra code to check the compatibility of OpenGL context pro=
viders
>>   and OpenGL texture renderers where those are often inherently tightly =
coupled
>>   since they must share the same hardware.
>
>
> So code checks are meant to prevent misusage. They might be too limited o=
r broken in some ways, but reverting is likely going to introduce other reg=
ressions I was trying to fix.

The misuse will not occur because DisplayChangeListeners will be
merged with OpenGL context providers.

>
>> - Needed extra work to broadcast the same change to multiple dbus listen=
ers.
>>
>
> Compared to what?

Compared to sharing one DisplayChangeListener for multiple dbus listeners.

>
>>
>> This series solve them by implementing the change broadcast in ui/dbus, =
which
>> knows exactly what is needed. Changes for the common code to support mul=
tiple
>> OpenGL DisplayChangeListeners were reverted to fix egl-headless and redu=
ce
>> the code size.
>
>
> Thanks a lot for your work, I am going to take a look at your approach. B=
ut please help us understand better what the problem actually is, by giving=
 examples & tests to avoid future regressions and document the expected beh=
aviour.

The thing is really complicated and I may miss details so please feel
free to ask questions or provide suggestions.

Regards,
Akihiko Odaki


>
>>
>> Akihiko Odaki (6):
>>   ui/dbus: Share one listener for a console
>>   Revert "console: save current scanout details"
>>   Revert "ui: split the GL context in a different object"
>>   Revert "ui: dispatch GL events to all listeners"
>>   Revert "ui: associate GL context outside of display listener
>>     registration"
>>   Revert "ui: factor out qemu_console_set_display_gl_ctx()"
>>
>>  include/ui/console.h       |  60 +-----
>>  include/ui/egl-context.h   |   6 +-
>>  include/ui/gtk.h           |  11 +-
>>  include/ui/sdl2.h          |   7 +-
>>  include/ui/spice-display.h |   1 -
>>  ui/console.c               | 258 +++++++----------------
>>  ui/dbus-console.c          | 109 ++--------
>>  ui/dbus-listener.c         | 417 +++++++++++++++++++++++++++----------
>>  ui/dbus.c                  |  22 --
>>  ui/dbus.h                  |  36 +++-
>>  ui/egl-context.c           |   6 +-
>>  ui/egl-headless.c          |  20 +-
>>  ui/gtk-egl.c               |  10 +-
>>  ui/gtk-gl-area.c           |   8 +-
>>  ui/gtk.c                   |  25 +--
>>  ui/sdl2-gl.c               |  10 +-
>>  ui/sdl2.c                  |  14 +-
>>  ui/spice-display.c         |  19 +-
>>  18 files changed, 498 insertions(+), 541 deletions(-)
>>
>> --
>> 2.32.0 (Apple Git-132)
>>
>>
>
>
> --
> Marc-Andr=C3=A9 Lureau

