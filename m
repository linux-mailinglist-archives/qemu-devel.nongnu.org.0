Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D830D4BA72E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:34:00 +0100 (CET)
Received: from localhost ([::1]:41472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkfH-0004Ts-U3
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:33:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKkXu-0004nJ-U8
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:26:23 -0500
Received: from [2607:f8b0:4864:20::c29] (port=42996
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKkXX-0003vE-Mm
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:26:02 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so362676oos.9
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aoOLBQmHPB9qQDaYEBgSnxTNJ8K7ltnZhswl0kzdrEk=;
 b=OJDud+pfEMRNkcbEEYBWNSzpACmwSANte/U2cHTBMY3KYzHV7XEPVZzxgJwt2PT2Bs
 CvmDBGm0OcNmGjG2akc1gD7M7Svf0dwy08qYD97oaI4CpuCmGQ8zllsnIRwOr22RFlNh
 ijQ5bECikNznvHln2VgXSB9OvPIJ7wgUJ1Qjy4VmTKCoT6S4Ti/jcSwAXkOFdfd/E9xV
 YWZFq57qRHMod/52+Jb8mE/UsPXgkuA+jY5Q7v5QATH/U/WCOIb+d/jORRZVqrDl37Ib
 cyRVL3DcqUjQ/iLMQUlgUFh35Q7O93xVX0WDlYD5AWkfzRpD8IMSac7bBQQ0TEGv7BB1
 axfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aoOLBQmHPB9qQDaYEBgSnxTNJ8K7ltnZhswl0kzdrEk=;
 b=H1l/rdLAszOIs9/OfhLpi8o6orHak9dta/+oDGre81kRRSMhxBgUpIaVtyeOWTGvW4
 XANvT/a2PIalaFouydsKsZzlhURN5naJMWw8/0x9hRN947A1IvNutkQ5g/8XCR5tHc8h
 rZHMSG/lUm9v8fH3jJCUQjbhT9ihN0xdzf6jhn17YQ1RBHLm4M5DOYXY1dLWx46GnFRm
 TdnxPJgJNGeJthWwbhcxCui6BsRfGDi1cVb1a0sCiu9hyYcbRsIegXaJ0m4heDxXcdLp
 DnR6OkwJkK/2My0Qzz7XROEYu4ZiL88NmUdyMBIKhxKcnWgSQOiFyjgLFZhIf9p75WJD
 wLAQ==
X-Gm-Message-State: AOAM530rqlYMTw3Xb70JtQZK1038Qlz0RBSXWqWpa/Jku39mZPCGdVEP
 qaANmEcl79Tnawvct9092LoD2a8y0xvtZ0TUPQ0=
X-Google-Smtp-Source: ABdhPJxNrYykjKWph85HpK2aXVNQ1OTZv8E1ajYCxiQk49+F5zik8x6Ljw8Wgq2KsM/5bGW+0hf875F1oVhh9zRtTFQ=
X-Received: by 2002:a05:6870:f78d:b0:d2:73ff:93a8 with SMTP id
 fs13-20020a056870f78d00b000d273ff93a8mr1325493oab.193.1645118758047; Thu, 17
 Feb 2022 09:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
 <CAMVc7JVOJxkqLpvRu7JLNP48C5Kmu0JRYUSR8xP+dAtGp_n=_A@mail.gmail.com>
 <CAJ+F1CKgvcA97kLdxVodSoAFbk1_kB3_po8vn4kX_gPZgKYxbg@mail.gmail.com>
 <CAMVc7JU1rfBEHgofiveNopLkyXRLSEG8dA=6cn_qY52BqLB3iw@mail.gmail.com>
 <CAJ+F1CJsrfL-PiPM5W4Ydp4WLMfrZOaYydUp4wrX1LbFCxiSaA@mail.gmail.com>
In-Reply-To: <CAJ+F1CJsrfL-PiPM5W4Ydp4WLMfrZOaYydUp4wrX1LbFCxiSaA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 18 Feb 2022 02:25:47 +0900
Message-ID: <CAMVc7JVADz6A+xA7bcZOCd5Y+=2bAqyPGyxqu-Z1gawKGRtiGw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] GL & D-Bus display related fixes
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 18, 2022 at 2:07 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Thu, Feb 17, 2022 at 8:39 PM Akihiko Odaki <akihiko.odaki@gmail.com> w=
rote:
>>
>> On Fri, Feb 18, 2022 at 1:12 AM Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@gmail.com> wrote:
>> >
>> > Hi
>> >
>> > On Thu, Feb 17, 2022 at 5:09 PM Akihiko Odaki <akihiko.odaki@gmail.com=
> wrote:
>> >>
>> >> On Thu, Feb 17, 2022 at 8:58 PM <marcandre.lureau@redhat.com> wrote:
>> >> >
>> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >> >
>> >> > Hi,
>> >> >
>> >> > In the thread "[PATCH 0/6] ui/dbus: Share one listener for a consol=
e", Akihiko
>> >> > Odaki reported a number of issues with the GL and D-Bus display. Hi=
s series
>> >> > propose a different design, and reverting some of my previous gener=
ic console
>> >> > changes to fix those issues.
>> >> >
>> >> > However, as I work through the issue so far, they can be solved by =
reasonable
>> >> > simple fixes while keeping the console changes generic (not specifi=
c to the
>> >> > D-Bus display backend). I belive a shared infrastructure is more be=
neficial long
>> >> > term than having GL-specific code in the DBus code (in particular, =
the
>> >> > egl-headless & VNC combination could potentially use it)
>> >> >
>> >> > Thanks a lot Akihiko for reporting the issues proposing a different=
 approach!
>> >> > Please test this alternative series and let me know of any further =
issues. My
>> >> > understanding is that you are mainly concerned with the Cocoa backe=
nd, and I
>> >> > don't have a way to test it, so please check it. If necessary, we m=
ay well have
>> >> > to revert my earlier changes and go your way, eventually.
>> >> >
>> >> > Marc-Andr=C3=A9 Lureau (12):
>> >> >   ui/console: fix crash when using gl context with non-gl listeners
>> >> >   ui/console: fix texture leak when calling surface_gl_create_textu=
re()
>> >> >   ui: do not create a surface when resizing a GL scanout
>> >> >   ui/console: move check for compatible GL context
>> >> >   ui/console: move dcl compatiblity check to a callback
>> >> >   ui/console: egl-headless is compatible with non-gl listeners
>> >> >   ui/dbus: associate the DBusDisplayConsole listener with the given
>> >> >     console
>> >> >   ui/console: move console compatibility check to dcl_display_conso=
le()
>> >> >   ui/shader: fix potential leak of shader on error
>> >> >   ui/shader: free associated programs
>> >> >   ui/console: add a dpy_gfx_switch callback helper
>> >> >   ui/dbus: fix texture sharing
>> >> >
>> >> >  include/ui/console.h |  19 ++++---
>> >> >  ui/dbus.h            |   3 ++
>> >> >  ui/console-gl.c      |   4 ++
>> >> >  ui/console.c         | 119 ++++++++++++++++++++++++++-------------=
----
>> >> >  ui/dbus-console.c    |  27 +++++-----
>> >> >  ui/dbus-listener.c   |  11 ----
>> >> >  ui/dbus.c            |  33 +++++++++++-
>> >> >  ui/egl-headless.c    |  17 ++++++-
>> >> >  ui/gtk.c             |  18 ++++++-
>> >> >  ui/sdl2.c            |   9 +++-
>> >> >  ui/shader.c          |   9 +++-
>> >> >  ui/spice-display.c   |   9 +++-
>> >> >  12 files changed, 192 insertions(+), 86 deletions(-)
>> >> >
>> >> > --
>> >> > 2.34.1.428.gdcc0cd074f0c
>> >> >
>> >> >
>> >>
>> >> You missed only one thing:
>> >> >- that console_select and register_displaychangelistener may not cal=
l
>> >> > dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is
>> >> > incompatible with non-OpenGL displays
>> >>
>> >> displaychangelistener_display_console always has to call
>> >> dpy_gfx_switch for non-OpenGL displays, but it still doesn't.
>> >
>> >
>> > Ok, would that be what you have in mind?
>> >
>> >  --- a/ui/console.c
>> > +++ b/ui/console.c
>> > @@ -1122,6 +1122,10 @@ static void displaychangelistener_display_conso=
le(DisplayChangeListener *dcl,
>> >      } else if (con->scanout.kind =3D=3D SCANOUT_SURFACE) {
>> >          dpy_gfx_create_texture(con, con->surface);
>> >          displaychangelistener_gfx_switch(dcl, con->surface);
>> > +    } else {
>> > +        /* use the fallback surface, egl-headless keeps it updated */
>> > +        assert(con->surface);
>> > +        displaychangelistener_gfx_switch(dcl, con->surface);
>> >      }
>>
>> It should call displaychangelistener_gfx_switch even when e.g.
>> con->scanout.kind =3D=3D SCANOUT_TEXTURE. egl-headless renders the conte=
nt
>> to the last DisplaySurface it received while con->scanout.kind =3D=3D
>> SCANOUT_TEXTURE.
>
>
> I see, egl-headless is really not a "listener".
>
>>
>> >
>> > I wish such egl-headless specific code would be there, but we would ne=
ed more refactoring.
>> >
>> > I think I would rather have a backend split for GL context, like "-obj=
ect egl-context". egl-headless-specific copy code would be handled by commo=
n/util code for anything that wants a pixman surface (VNC, screen capture, =
non-GL display etc).
>> >
>> > This split would allow sharing the context code, and introduce other s=
ystem specific GL initialization, such as WGL etc. Right now, I doubt the E=
GL code works on anything but Linux.
>>
>> Sharing the context code is unlikely to happen. Usually the toolkit
>> (GTK, SDL, or Cocoa in my fork) knows what graphics accelerator should
>> be used and how the context should be created for a particular window.
>> The context sharing can be achieved only for headless displays, namely
>> dbus, egl-headless and spice. Few people would want to use them in
>> combination.
>
>
> Ok for toolkits, they usually have their own context. But ideally, qemu s=
hould be "headless". And the GL contexts should be working on other systems=
 than EGL Linux.
>
> Any of the spice, vnc, dbus display etc may legitimately be fixed to work=
 with WGL etc. Doing this repeatedly on the various display backends would =
be bad design.

We already have ui/egl-context.c to share the code for EGL. We can
have ui/headless-context.c or something which creates a context for
headless but the implementation can be anything proper there. It
doesn't require modifying ui/console.c or adding something like
"-object egl-context".

>
> Although my idea is that display servers (spice, vnc, rdp, etc) & various=
 UI (gtk, cocoa, sdl, etc) should be outside of qemu. The display would use=
 IPC, based on DBus if it fits the job, or something else if necessary. Obv=
iously, there is still a lot of work to do to improve surface & texture sha=
ring and portability, but that should be possible...

Maybe we can rework the present UIs of QEMU to make them compatible
with both in-process communication and D-Bus inter-process
communication. If the user has a requirement incompatible with IPC
(e.g. OpenGL on macOS), the user can opt for in-process communication.
D-Bus would be used otherwise. (Of course that would require
substantial effort.)

>
>>
>>
>> >
>> >>
>> >> Anything else should be addressed with this patch series. (And it als=
o
>> >> has nice fixes for shader leaks.)
>> >
>> >
>> > thanks
>> >
>> >>
>> >>
>> >> cocoa doesn't have OpenGL output and egl-headless, the cause of many
>> >> pains addressed here, does not work on macOS so you need little
>> >> attention. I have an out-of-tree OpenGL support for cocoa but it is
>> >> out-of-tree anyway and I can fix it anytime.
>> >
>> >
>> > Great!
>> >
>> > btw, I suppose you checked your DBus changes against the WIP "qemu-dis=
play" project. What was your experience? I don't think many people have tri=
ed it yet. Do you think this could be made to work on macOS? at least the n=
on-dmabuf support should work, as long as Gtk4 has good macOS support. I do=
n't know if dmabuf or similar exist there, any idea?
>>
>> I tested it on Fedora. I think it would probably work on macOS but
>> maybe require some tweaks. IOSurface is a counterpart of DMA-BUF in
>> macOS but its situation is bad; it must be delivered via macOS's own
>> IPC mechanisms (Mach port and XPC), but they are for server-client
>> model and not for P2P. fileport mechanism allows to convert Mach port
>> to file descriptor, but it is not documented. (In reality, I think all
>> of the major browsers, Chromium, Firefox and Safari use fileport for
>> this purpose. Apple should really document it if they use it for their
>> app.) It is also possible to share IOSurface with a global number, but
>> it can be brute-forced and is insecure.
>>
>
> Thanks, the Gtk developers might have some clue. They have been working o=
n improving macOS support, and it can use opengl now (https://blogs.gnome.o=
rg/chergert/2020/12/15/gtk-4-got-a-new-macos-backend-now-with-opengl/).

They don't need IPC for passing textures so that is a different story.

>
>>
>> Regards,
>> Akihiko Odaki
>>
>> >
>> >
>> > --
>> > Marc-Andr=C3=A9 Lureau
>
>
>
> --
> Marc-Andr=C3=A9 Lureau

