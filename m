Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB244BA64C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:43:19 +0100 (CET)
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjsE-00040Y-6t
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:43:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKjol-0002Em-K9
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:39:43 -0500
Received: from [2607:f8b0:4864:20::235] (port=46813
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKjoj-0004jM-NV
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:39:43 -0500
Received: by mail-oi1-x235.google.com with SMTP id s8so161209oij.13
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 08:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4THcVomBU3VGJZ1pgGF5z/I6F73w2KQifWPl1H5fjpU=;
 b=MZLs0N36R0zf9y7l9eT+6FAx2dutmxlE0cDDCZOaWx1QwHdSlBRX4KvyZSFw4ANqDF
 jBrz5Ok/CYif+bF5KlRceIGI/n/goxG5XpMxbkJWvR+Xi7JE+NrhkAYxAXOdue4yrSTP
 t3HpJlsv5Z/isiiqlXHYzkC1LcWZwSyzSmuiK/vwe8Hukc/pyrBsKGFev0vsjQm/43Cg
 OqECnQecE/TQHJrpsshNi66EO4MjikWa5ERYqwWQAi1t/gdkNsUf8HZqQeazax5gDMTG
 1jYW0hwkQHWWt0mzPT0Y521TyODYQ3Tw8LYMJHZKyXiQ3Yz9aADups7NWUfe9zojWU9V
 3UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4THcVomBU3VGJZ1pgGF5z/I6F73w2KQifWPl1H5fjpU=;
 b=BDgXRKReqHG8w+/VCKUQBY7iGHTYWf8Y9KeyRLSaeSiEUkvlN6Hxqau8Gyi0O6k9jq
 xxG0jUR7kCZ76MXt4ZI+PmcQKQmVk8lKIrdGvoVEBxCCa14lbcWsjmQ1Ytg53ap/cTUW
 UyPA3+6uj/uDRr0Dt2PZoaf0eSONYYSQPkkoqeOHciVqFQFByQTzE9mj8pMvLED86Xvz
 d89ECE8mPvLZXGmi5hGipxN8EpCPghTEjbS03NKD39JZTGALiOj0Dq8jgZZ9jHVl0gqP
 HKiSZ3E50zgMWc66oQMi+z5t5h300eRHpEs1ipck1QqB4fT+OoN6fptMPqDHPc0mF8sS
 BtYg==
X-Gm-Message-State: AOAM531vge/9D/cwzakNDkVYoYwj/wUGcx+3kNsHUyE/bsadsqdAMO5T
 JhxjoLIY2v4g4UlzONsA6Rs0LoclwBMbp+/XtOySJKhSwnU=
X-Google-Smtp-Source: ABdhPJykeJCHA+0gs/UNpOtYrUGnIJ+LuZxL3wxubeFl23r/f+4HjMi3rv5nyKRE3T9wrL7XWxBk9iNGUo+jJj3Ba7o=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr3067896oig.40.1645115980227; Thu, 17
 Feb 2022 08:39:40 -0800 (PST)
MIME-Version: 1.0
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
 <CAMVc7JVOJxkqLpvRu7JLNP48C5Kmu0JRYUSR8xP+dAtGp_n=_A@mail.gmail.com>
 <CAJ+F1CKgvcA97kLdxVodSoAFbk1_kB3_po8vn4kX_gPZgKYxbg@mail.gmail.com>
In-Reply-To: <CAJ+F1CKgvcA97kLdxVodSoAFbk1_kB3_po8vn4kX_gPZgKYxbg@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 18 Feb 2022 01:11:42 +0900
Message-ID: <CAMVc7JU1rfBEHgofiveNopLkyXRLSEG8dA=6cn_qY52BqLB3iw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] GL & D-Bus display related fixes
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x235.google.com
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

On Fri, Feb 18, 2022 at 1:12 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Thu, Feb 17, 2022 at 5:09 PM Akihiko Odaki <akihiko.odaki@gmail.com> w=
rote:
>>
>> On Thu, Feb 17, 2022 at 8:58 PM <marcandre.lureau@redhat.com> wrote:
>> >
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Hi,
>> >
>> > In the thread "[PATCH 0/6] ui/dbus: Share one listener for a console",=
 Akihiko
>> > Odaki reported a number of issues with the GL and D-Bus display. His s=
eries
>> > propose a different design, and reverting some of my previous generic =
console
>> > changes to fix those issues.
>> >
>> > However, as I work through the issue so far, they can be solved by rea=
sonable
>> > simple fixes while keeping the console changes generic (not specific t=
o the
>> > D-Bus display backend). I belive a shared infrastructure is more benef=
icial long
>> > term than having GL-specific code in the DBus code (in particular, the
>> > egl-headless & VNC combination could potentially use it)
>> >
>> > Thanks a lot Akihiko for reporting the issues proposing a different ap=
proach!
>> > Please test this alternative series and let me know of any further iss=
ues. My
>> > understanding is that you are mainly concerned with the Cocoa backend,=
 and I
>> > don't have a way to test it, so please check it. If necessary, we may =
well have
>> > to revert my earlier changes and go your way, eventually.
>> >
>> > Marc-Andr=C3=A9 Lureau (12):
>> >   ui/console: fix crash when using gl context with non-gl listeners
>> >   ui/console: fix texture leak when calling surface_gl_create_texture(=
)
>> >   ui: do not create a surface when resizing a GL scanout
>> >   ui/console: move check for compatible GL context
>> >   ui/console: move dcl compatiblity check to a callback
>> >   ui/console: egl-headless is compatible with non-gl listeners
>> >   ui/dbus: associate the DBusDisplayConsole listener with the given
>> >     console
>> >   ui/console: move console compatibility check to dcl_display_console(=
)
>> >   ui/shader: fix potential leak of shader on error
>> >   ui/shader: free associated programs
>> >   ui/console: add a dpy_gfx_switch callback helper
>> >   ui/dbus: fix texture sharing
>> >
>> >  include/ui/console.h |  19 ++++---
>> >  ui/dbus.h            |   3 ++
>> >  ui/console-gl.c      |   4 ++
>> >  ui/console.c         | 119 ++++++++++++++++++++++++++----------------=
-
>> >  ui/dbus-console.c    |  27 +++++-----
>> >  ui/dbus-listener.c   |  11 ----
>> >  ui/dbus.c            |  33 +++++++++++-
>> >  ui/egl-headless.c    |  17 ++++++-
>> >  ui/gtk.c             |  18 ++++++-
>> >  ui/sdl2.c            |   9 +++-
>> >  ui/shader.c          |   9 +++-
>> >  ui/spice-display.c   |   9 +++-
>> >  12 files changed, 192 insertions(+), 86 deletions(-)
>> >
>> > --
>> > 2.34.1.428.gdcc0cd074f0c
>> >
>> >
>>
>> You missed only one thing:
>> >- that console_select and register_displaychangelistener may not call
>> > dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is
>> > incompatible with non-OpenGL displays
>>
>> displaychangelistener_display_console always has to call
>> dpy_gfx_switch for non-OpenGL displays, but it still doesn't.
>
>
> Ok, would that be what you have in mind?
>
>  --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1122,6 +1122,10 @@ static void displaychangelistener_display_console(=
DisplayChangeListener *dcl,
>      } else if (con->scanout.kind =3D=3D SCANOUT_SURFACE) {
>          dpy_gfx_create_texture(con, con->surface);
>          displaychangelistener_gfx_switch(dcl, con->surface);
> +    } else {
> +        /* use the fallback surface, egl-headless keeps it updated */
> +        assert(con->surface);
> +        displaychangelistener_gfx_switch(dcl, con->surface);
>      }

It should call displaychangelistener_gfx_switch even when e.g.
con->scanout.kind =3D=3D SCANOUT_TEXTURE. egl-headless renders the content
to the last DisplaySurface it received while con->scanout.kind =3D=3D
SCANOUT_TEXTURE.

>
> I wish such egl-headless specific code would be there, but we would need =
more refactoring.
>
> I think I would rather have a backend split for GL context, like "-object=
 egl-context". egl-headless-specific copy code would be handled by common/u=
til code for anything that wants a pixman surface (VNC, screen capture, non=
-GL display etc).
>
> This split would allow sharing the context code, and introduce other syst=
em specific GL initialization, such as WGL etc. Right now, I doubt the EGL =
code works on anything but Linux.

Sharing the context code is unlikely to happen. Usually the toolkit
(GTK, SDL, or Cocoa in my fork) knows what graphics accelerator should
be used and how the context should be created for a particular window.
The context sharing can be achieved only for headless displays, namely
dbus, egl-headless and spice. Few people would want to use them in
combination.

>
>>
>> Anything else should be addressed with this patch series. (And it also
>> has nice fixes for shader leaks.)
>
>
> thanks
>
>>
>>
>> cocoa doesn't have OpenGL output and egl-headless, the cause of many
>> pains addressed here, does not work on macOS so you need little
>> attention. I have an out-of-tree OpenGL support for cocoa but it is
>> out-of-tree anyway and I can fix it anytime.
>
>
> Great!
>
> btw, I suppose you checked your DBus changes against the WIP "qemu-displa=
y" project. What was your experience? I don't think many people have tried =
it yet. Do you think this could be made to work on macOS? at least the non-=
dmabuf support should work, as long as Gtk4 has good macOS support. I don't=
 know if dmabuf or similar exist there, any idea?

I tested it on Fedora. I think it would probably work on macOS but
maybe require some tweaks. IOSurface is a counterpart of DMA-BUF in
macOS but its situation is bad; it must be delivered via macOS's own
IPC mechanisms (Mach port and XPC), but they are for server-client
model and not for P2P. fileport mechanism allows to convert Mach port
to file descriptor, but it is not documented. (In reality, I think all
of the major browsers, Chromium, Firefox and Safari use fileport for
this purpose. Apple should really document it if they use it for their
app.) It is also possible to share IOSurface with a global number, but
it can be brute-forced and is insecure.

Regards,
Akihiko Odaki

>
>
> --
> Marc-Andr=C3=A9 Lureau

