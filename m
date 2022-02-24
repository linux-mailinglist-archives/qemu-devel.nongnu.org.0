Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077AA4C332C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:07:39 +0100 (CET)
Received: from localhost ([::1]:40344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHab-0001Lf-Ko
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:07:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNHXT-0006tq-A9
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:04:24 -0500
Received: from [2a00:1450:4864:20::42f] (port=44954
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNHXQ-0004FA-H5
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:04:22 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u1so623374wrg.11
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 09:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FenyVt1+zFwDzWuwYVIPLHFEQOvFulP8E0ajb/bofuY=;
 b=IFaFAZe5KzFzIvmFA8rax2J83nJqdUPFPoO3r1cfkGOWhnGT9y9hyX06S7fd3eGs9+
 PdE5dxecFkClzXIPBbPbQ3eBxDKZTOt3mWGOEJiwUgc2z7C5rBKofGb4FiCrcQuYkbIL
 tNZssDoVCpn1JguePf/4/8vTSMGjXT/vltTje8fta0z707hj+ojzfnz6AvVH7GZm9y57
 XhJb5csdt66d/5ePQGzO7WvrZDI/5xvUs7jj3Te9ui/0V+y6Raa3HpVT2ej8b/+TXQC8
 qHKS1KD8G79blDn+k8zXGatNMWIp/91JjrS2Or1RGUcG5XWU+XVazVs4awpwMcSM9d+D
 EsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FenyVt1+zFwDzWuwYVIPLHFEQOvFulP8E0ajb/bofuY=;
 b=rnjCcXRXnQeRfV0PLHVe04erJk18Tj4Nwpyb2x8aHzQnjV7jvUeK4b2M9OlhfimJ7W
 jWRhXSOD+GwUSdUECZKBRFM2VBBaNIV5umu4GSCIFC23pIP0d0SsleEM7eXf0g685PVO
 gbFnMX3wUcoXHgk6mq0/+Or6gh/5BvhGl2zWXxfBiuww8wCioMQel5K0AEZaBe5+n8tL
 nrL1yq5T+S9H9h/QizgdAGXl/WuFppuUsK96iQq10VQwRtFGPu8rNBSs4V6ROjBWzlMo
 wXzuGmUCeJU7txlbbTtT89jPm0xRmAgz8kpKjXKjOUSX0ifJ1exwXQu6VtTHPJJa57Gv
 FFpA==
X-Gm-Message-State: AOAM532ZcVVc01K8Ty7tHeo47x7A9tcddJX73RD9HC/buZnqEWcNEviV
 eAIjQ8MbcxUXs8QhFvq9ErlWuBwXIZGN6wMd7yLEbRNMmMo=
X-Google-Smtp-Source: ABdhPJwknDWaF8ZBkc2e96tz5/nqNb/5++7axfKBuD192HNjZHFgodH4CVz8sOPpmm2GC22jfsM5j8xpieERwCeeJio=
X-Received: by 2002:adf:f508:0:b0:1e4:a6f6:5b79 with SMTP id
 q8-20020adff508000000b001e4a6f65b79mr2973706wro.562.1645722254426; Thu, 24
 Feb 2022 09:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220222194008.610377-7-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 24 Feb 2022 21:04:02 +0400
Message-ID: <CAJ+F1C+QOAcjAiAY=7jcYgjJTQ79PTUDBRoJ3fzyHha2Syw4tA@mail.gmail.com>
Subject: Re: [PATCH 6/8] char: move qemu_openpty_raw from util/ to char/
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000005fc7fd05d8c692d3"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005fc7fd05d8c692d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paolo,

This patch is ok, but in some (new?) circumstances it fails with freebsd
and reveals that -lutil was missing for kinfo_getproc() in
util/oslib-posix.c. Please add:

-util_ss.add(when: 'CONFIG_POSIX', if_true: files('oslib-posix.c'))
+util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'), util])

(even better if we made this specific to freebsd I guess, but not strictly
necessary)

On Tue, Feb 22, 2022 at 11:53 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> It is only needed by char-pty.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu-common.h |   2 -
>  chardev/char-pty.c    | 104 +++++++++++++++++++++++++++++++
>  util/qemu-openpty.c   | 139 ------------------------------------------
>  chardev/meson.build   |   4 +-
>  util/meson.build      |   1 -
>  5 files changed, 106 insertions(+), 144 deletions(-)
>  delete mode 100644 util/qemu-openpty.c
>
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 68b2e3bc1091..0248a324cdcd 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -33,8 +33,6 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t
> count)
>
>  #ifndef _WIN32
>  int qemu_pipe(int pipefd[2]);
> -/* like openpty() but also makes it raw; return master fd */
> -int qemu_openpty_raw(int *aslave, char *pty_name);
>  #endif
>
>  #ifdef _WIN32
> diff --git a/chardev/char-pty.c b/chardev/char-pty.c
> index a2d1e7c985bc..f28779bcc9d2 100644
> --- a/chardev/char-pty.c
> +++ b/chardev/char-pty.c
> @@ -197,6 +197,110 @@ static void char_pty_finalize(Object *obj)
>      qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
>  }
>
> +#if defined HAVE_PTY_H
> +# include <pty.h>
> +#elif defined CONFIG_BSD
> +# include <termios.h>
> +# if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) ||
> defined(__DragonFly__)
> +#  include <libutil.h>
> +# else
> +#  include <util.h>
> +# endif
> +#elif defined CONFIG_SOLARIS
> +# include <termios.h>
> +# include <stropts.h>
> +#else
> +# include <termios.h>
> +#endif
> +
> +#ifdef __sun__
> +
> +#if !defined(HAVE_OPENPTY)
> +/* Once illumos has openpty(), this is going to be removed. */
> +static int openpty(int *amaster, int *aslave, char *name,
> +                   struct termios *termp, struct winsize *winp)
> +{
> +        const char *slave;
> +        int mfd =3D -1, sfd =3D -1;
> +
> +        *amaster =3D *aslave =3D -1;
> +
> +        mfd =3D open("/dev/ptmx", O_RDWR | O_NOCTTY);
> +        if (mfd < 0)
> +                goto err;
> +
> +        if (grantpt(mfd) =3D=3D -1 || unlockpt(mfd) =3D=3D -1)
> +                goto err;
> +
> +        if ((slave =3D ptsname(mfd)) =3D=3D NULL)
> +                goto err;
> +
> +        if ((sfd =3D open(slave, O_RDONLY | O_NOCTTY)) =3D=3D -1)
> +                goto err;
> +
> +        if (ioctl(sfd, I_PUSH, "ptem") =3D=3D -1 ||
> +            (termp !=3D NULL && tcgetattr(sfd, termp) < 0))
> +                goto err;
> +
> +        *amaster =3D mfd;
> +        *aslave =3D sfd;
> +
> +        if (winp)
> +                ioctl(sfd, TIOCSWINSZ, winp);
> +
> +        return 0;
> +
> +err:
> +        if (sfd !=3D -1)
> +                close(sfd);
> +        close(mfd);
> +        return -1;
> +}
> +#endif
> +
> +static void cfmakeraw (struct termios *termios_p)
> +{
> +        termios_p->c_iflag &=3D
> +                ~(IGNBRK|BRKINT|PARMRK|ISTRIP|INLCR|IGNCR|ICRNL|IXON);
> +        termios_p->c_oflag &=3D ~OPOST;
> +        termios_p->c_lflag &=3D ~(ECHO|ECHONL|ICANON|ISIG|IEXTEN);
> +        termios_p->c_cflag &=3D ~(CSIZE|PARENB);
> +        termios_p->c_cflag |=3D CS8;
> +
> +        termios_p->c_cc[VMIN] =3D 0;
> +        termios_p->c_cc[VTIME] =3D 0;
> +}
> +#endif
> +
> +/* like openpty() but also makes it raw; return master fd */
> +static int qemu_openpty_raw(int *aslave, char *pty_name)
> +{
> +    int amaster;
> +    struct termios tty;
> +#if defined(__OpenBSD__) || defined(__DragonFly__)
> +    char pty_buf[PATH_MAX];
> +#define q_ptsname(x) pty_buf
> +#else
> +    char *pty_buf =3D NULL;
> +#define q_ptsname(x) ptsname(x)
> +#endif
> +
> +    if (openpty(&amaster, aslave, pty_buf, NULL, NULL) < 0) {
> +        return -1;
> +    }
> +
> +    /* Set raw attributes on the pty. */
> +    tcgetattr(*aslave, &tty);
> +    cfmakeraw(&tty);
> +    tcsetattr(*aslave, TCSAFLUSH, &tty);
> +
> +    if (pty_name) {
> +        strcpy(pty_name, q_ptsname(amaster));
> +    }
> +
> +    return amaster;
> +}
> +
>  static void char_pty_open(Chardev *chr,
>                            ChardevBackend *backend,
>                            bool *be_opened,
> diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
> deleted file mode 100644
> index 427f43a76973..000000000000
> --- a/util/qemu-openpty.c
> +++ /dev/null
> @@ -1,139 +0,0 @@
> -/*
> - * qemu-openpty.c
> - *
> - * Copyright (c) 2003-2008 Fabrice Bellard
> - * Copyright (c) 2010 Red Hat, Inc.
> - *
> - * Wrapper function qemu_openpty() implementation.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> - * of this software and associated documentation files (the "Software"),
> to deal
> - * in the Software without restriction, including without limitation the
> rights
> - * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> - * copies of the Software, and to permit persons to whom the Software is
> - * furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be
> included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S
> IN
> - * THE SOFTWARE.
> - */
> -
> -/*
> - * This is not part of oslib-posix.c because this function
> - * uses openpty() which often in -lutil, and if we add this
> - * dependency to oslib-posix.o, every app will have to be
> - * linked with -lutil.
> - */
> -
> -#include "qemu/osdep.h"
> -#include "qemu-common.h"
> -
> -#if defined HAVE_PTY_H
> -# include <pty.h>
> -#elif defined CONFIG_BSD
> -# include <termios.h>
> -# if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) ||
> defined(__DragonFly__)
> -#  include <libutil.h>
> -# else
> -#  include <util.h>
> -# endif
> -#elif defined CONFIG_SOLARIS
> -# include <termios.h>
> -# include <stropts.h>
> -#else
> -# include <termios.h>
> -#endif
> -
> -#ifdef __sun__
> -
> -#if !defined(HAVE_OPENPTY)
> -/* Once illumos has openpty(), this is going to be removed. */
> -static int openpty(int *amaster, int *aslave, char *name,
> -                   struct termios *termp, struct winsize *winp)
> -{
> -        const char *slave;
> -        int mfd =3D -1, sfd =3D -1;
> -
> -        *amaster =3D *aslave =3D -1;
> -
> -        mfd =3D open("/dev/ptmx", O_RDWR | O_NOCTTY);
> -        if (mfd < 0)
> -                goto err;
> -
> -        if (grantpt(mfd) =3D=3D -1 || unlockpt(mfd) =3D=3D -1)
> -                goto err;
> -
> -        if ((slave =3D ptsname(mfd)) =3D=3D NULL)
> -                goto err;
> -
> -        if ((sfd =3D open(slave, O_RDONLY | O_NOCTTY)) =3D=3D -1)
> -                goto err;
> -
> -        if (ioctl(sfd, I_PUSH, "ptem") =3D=3D -1 ||
> -            (termp !=3D NULL && tcgetattr(sfd, termp) < 0))
> -                goto err;
> -
> -        *amaster =3D mfd;
> -        *aslave =3D sfd;
> -
> -        if (winp)
> -                ioctl(sfd, TIOCSWINSZ, winp);
> -
> -        return 0;
> -
> -err:
> -        if (sfd !=3D -1)
> -                close(sfd);
> -        close(mfd);
> -        return -1;
> -}
> -#endif
> -
> -static void cfmakeraw (struct termios *termios_p)
> -{
> -        termios_p->c_iflag &=3D
> -                ~(IGNBRK|BRKINT|PARMRK|ISTRIP|INLCR|IGNCR|ICRNL|IXON);
> -        termios_p->c_oflag &=3D ~OPOST;
> -        termios_p->c_lflag &=3D ~(ECHO|ECHONL|ICANON|ISIG|IEXTEN);
> -        termios_p->c_cflag &=3D ~(CSIZE|PARENB);
> -        termios_p->c_cflag |=3D CS8;
> -
> -        termios_p->c_cc[VMIN] =3D 0;
> -        termios_p->c_cc[VTIME] =3D 0;
> -}
> -#endif
> -
> -int qemu_openpty_raw(int *aslave, char *pty_name)
> -{
> -    int amaster;
> -    struct termios tty;
> -#if defined(__OpenBSD__) || defined(__DragonFly__)
> -    char pty_buf[PATH_MAX];
> -#define q_ptsname(x) pty_buf
> -#else
> -    char *pty_buf =3D NULL;
> -#define q_ptsname(x) ptsname(x)
> -#endif
> -
> -    if (openpty(&amaster, aslave, pty_buf, NULL, NULL) < 0) {
> -        return -1;
> -    }
> -
> -    /* Set raw attributes on the pty. */
> -    tcgetattr(*aslave, &tty);
> -    cfmakeraw(&tty);
> -    tcsetattr(*aslave, TCSAFLUSH, &tty);
> -
> -    if (pty_name) {
> -        strcpy(pty_name, q_ptsname(amaster));
> -    }
> -
> -    return amaster;
> -}
> diff --git a/chardev/meson.build b/chardev/meson.build
> index 325ba2bdb97d..664f77b8879a 100644
> --- a/chardev/meson.build
> +++ b/chardev/meson.build
> @@ -12,11 +12,11 @@ chardev_ss.add(files(
>    'char-udp.c',
>    'char.c',
>  ))
> -chardev_ss.add(when: 'CONFIG_POSIX', if_true: files(
> +chardev_ss.add(when: 'CONFIG_POSIX', if_true: [files(
>    'char-fd.c',
>    'char-parallel.c',
>    'char-pty.c',
> -))
> +), util])
>  chardev_ss.add(when: 'CONFIG_WIN32', if_true: files(
>    'char-console.c',
>    'char-win-stdio.c',
> diff --git a/util/meson.build b/util/meson.build
> index 3736988b9f6e..d6263ccc1b82 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -12,7 +12,6 @@ util_ss.add(when: 'CONFIG_POSIX', if_true:
> files('compatfd.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true:
> files('event_notifier-posix.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('mmap-alloc.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('oslib-posix.c'))
> -util_ss.add(when: 'CONFIG_POSIX', if_true: [files('qemu-openpty.c'),
> util])
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('qemu-thread-posix.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('memfd.c'))
>  util_ss.add(when: 'CONFIG_WIN32', if_true: files('aio-win32.c'))
> --
> 2.35.1.273.ge6ebfd0e8cbb
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005fc7fd05d8c692d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Paolo,</div><div dir=3D"ltr"><br></div><d=
iv>This patch is ok, but in some (new?) circumstances it fails with freebsd=
 and reveals that -lutil was missing for kinfo_getproc() in util/oslib-posi=
x.c. Please add:</div><div><br></div><div>-util_ss.add(when: &#39;CONFIG_PO=
SIX&#39;, if_true: files(&#39;oslib-posix.c&#39;))</div><div>+util_ss.add(w=
hen: &#39;CONFIG_POSIX&#39;, if_true: [files(&#39;oslib-posix.c&#39;), util=
])</div><div><br></div><div>(even better if we made this specific to freebs=
d I guess, but not strictly necessary)<br></div><div><br></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 22, 2022=
 at 11:53 PM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.l=
ureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
br>
<br>
It is only needed by char-pty.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu-common.h |=C2=A0 =C2=A02 -<br>
=C2=A0chardev/char-pty.c=C2=A0 =C2=A0 | 104 +++++++++++++++++++++++++++++++=
<br>
=C2=A0util/qemu-openpty.c=C2=A0 =C2=A0| 139 -------------------------------=
-----------<br>
=C2=A0chardev/meson.build=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0util/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
=C2=A05 files changed, 106 insertions(+), 144 deletions(-)<br>
=C2=A0delete mode 100644 util/qemu-openpty.c<br>
<br>
diff --git a/include/qemu-common.h b/include/qemu-common.h<br>
index 68b2e3bc1091..0248a324cdcd 100644<br>
--- a/include/qemu-common.h<br>
+++ b/include/qemu-common.h<br>
@@ -33,8 +33,6 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t c=
ount)<br>
<br>
=C2=A0#ifndef _WIN32<br>
=C2=A0int qemu_pipe(int pipefd[2]);<br>
-/* like openpty() but also makes it raw; return master fd */<br>
-int qemu_openpty_raw(int *aslave, char *pty_name);<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifdef _WIN32<br>
diff --git a/chardev/char-pty.c b/chardev/char-pty.c<br>
index a2d1e7c985bc..f28779bcc9d2 100644<br>
--- a/chardev/char-pty.c<br>
+++ b/chardev/char-pty.c<br>
@@ -197,6 +197,110 @@ static void char_pty_finalize(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_be_event(chr, CHR_EVENT_CLOSED);<br>
=C2=A0}<br>
<br>
+#if defined HAVE_PTY_H<br>
+# include &lt;pty.h&gt;<br>
+#elif defined CONFIG_BSD<br>
+# include &lt;termios.h&gt;<br>
+# if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__Drag=
onFly__)<br>
+#=C2=A0 include &lt;libutil.h&gt;<br>
+# else<br>
+#=C2=A0 include &lt;util.h&gt;<br>
+# endif<br>
+#elif defined CONFIG_SOLARIS<br>
+# include &lt;termios.h&gt;<br>
+# include &lt;stropts.h&gt;<br>
+#else<br>
+# include &lt;termios.h&gt;<br>
+#endif<br>
+<br>
+#ifdef __sun__<br>
+<br>
+#if !defined(HAVE_OPENPTY)<br>
+/* Once illumos has openpty(), this is going to be removed. */<br>
+static int openpty(int *amaster, int *aslave, char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t termios *termp, struct winsize *winp)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *slave;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int mfd =3D -1, sfd =3D -1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *amaster =3D *aslave =3D -1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mfd =3D open(&quot;/dev/ptmx&quot;, O_RDWR | O=
_NOCTTY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mfd &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grantpt(mfd) =3D=3D -1 || unlockpt(mfd) =
=3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((slave =3D ptsname(mfd)) =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((sfd =3D open(slave, O_RDONLY | O_NOCTTY))=
 =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ioctl(sfd, I_PUSH, &quot;ptem&quot;) =3D=
=3D -1 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (termp !=3D NULL &amp;&amp; tcge=
tattr(sfd, termp) &lt; 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *amaster =3D mfd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *aslave =3D sfd;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (winp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ioctl(sfd, TIOCSWI=
NSZ, winp);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+<br>
+err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sfd !=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(sfd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(mfd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+}<br>
+#endif<br>
+<br>
+static void cfmakeraw (struct termios *termios_p)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_iflag &amp;=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~(IGNBRK|BRKINT|PA=
RMRK|ISTRIP|INLCR|IGNCR|ICRNL|IXON);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_oflag &amp;=3D ~OPOST;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_lflag &amp;=3D ~(ECHO|ECHONL|I=
CANON|ISIG|IEXTEN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_cflag &amp;=3D ~(CSIZE|PARENB)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_cflag |=3D CS8;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_cc[VMIN] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_cc[VTIME] =3D 0;<br>
+}<br>
+#endif<br>
+<br>
+/* like openpty() but also makes it raw; return master fd */<br>
+static int qemu_openpty_raw(int *aslave, char *pty_name)<br>
+{<br>
+=C2=A0 =C2=A0 int amaster;<br>
+=C2=A0 =C2=A0 struct termios tty;<br>
+#if defined(__OpenBSD__) || defined(__DragonFly__)<br>
+=C2=A0 =C2=A0 char pty_buf[PATH_MAX];<br>
+#define q_ptsname(x) pty_buf<br>
+#else<br>
+=C2=A0 =C2=A0 char *pty_buf =3D NULL;<br>
+#define q_ptsname(x) ptsname(x)<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 if (openpty(&amp;amaster, aslave, pty_buf, NULL, NULL) &lt; =
0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Set raw attributes on the pty. */<br>
+=C2=A0 =C2=A0 tcgetattr(*aslave, &amp;tty);<br>
+=C2=A0 =C2=A0 cfmakeraw(&amp;tty);<br>
+=C2=A0 =C2=A0 tcsetattr(*aslave, TCSAFLUSH, &amp;tty);<br>
+<br>
+=C2=A0 =C2=A0 if (pty_name) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 strcpy(pty_name, q_ptsname(amaster));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return amaster;<br>
+}<br>
+<br>
=C2=A0static void char_pty_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ChardevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bool *be_opened,<br>
diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c<br>
deleted file mode 100644<br>
index 427f43a76973..000000000000<br>
--- a/util/qemu-openpty.c<br>
+++ /dev/null<br>
@@ -1,139 +0,0 @@<br>
-/*<br>
- * qemu-openpty.c<br>
- *<br>
- * Copyright (c) 2003-2008 Fabrice Bellard<br>
- * Copyright (c) 2010 Red Hat, Inc.<br>
- *<br>
- * Wrapper function qemu_openpty() implementation.<br>
- *<br>
- * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
- * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
- * in the Software without restriction, including without limitation the r=
ights<br>
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
- * copies of the Software, and to permit persons to whom the Software is<b=
r>
- * furnished to do so, subject to the following conditions:<br>
- *<br>
- * The above copyright notice and this permission notice shall be included=
 in<br>
- * all copies or substantial portions of the Software.<br>
- *<br>
- * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
- * THE SOFTWARE.<br>
- */<br>
-<br>
-/*<br>
- * This is not part of oslib-posix.c because this function<br>
- * uses openpty() which often in -lutil, and if we add this<br>
- * dependency to oslib-posix.o, every app will have to be<br>
- * linked with -lutil.<br>
- */<br>
-<br>
-#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
-<br>
-#if defined HAVE_PTY_H<br>
-# include &lt;pty.h&gt;<br>
-#elif defined CONFIG_BSD<br>
-# include &lt;termios.h&gt;<br>
-# if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__Drag=
onFly__)<br>
-#=C2=A0 include &lt;libutil.h&gt;<br>
-# else<br>
-#=C2=A0 include &lt;util.h&gt;<br>
-# endif<br>
-#elif defined CONFIG_SOLARIS<br>
-# include &lt;termios.h&gt;<br>
-# include &lt;stropts.h&gt;<br>
-#else<br>
-# include &lt;termios.h&gt;<br>
-#endif<br>
-<br>
-#ifdef __sun__<br>
-<br>
-#if !defined(HAVE_OPENPTY)<br>
-/* Once illumos has openpty(), this is going to be removed. */<br>
-static int openpty(int *amaster, int *aslave, char *name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t termios *termp, struct winsize *winp)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *slave;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int mfd =3D -1, sfd =3D -1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *amaster =3D *aslave =3D -1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mfd =3D open(&quot;/dev/ptmx&quot;, O_RDWR | O=
_NOCTTY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mfd &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grantpt(mfd) =3D=3D -1 || unlockpt(mfd) =
=3D=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((slave =3D ptsname(mfd)) =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((sfd =3D open(slave, O_RDONLY | O_NOCTTY))=
 =3D=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ioctl(sfd, I_PUSH, &quot;ptem&quot;) =3D=
=3D -1 ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (termp !=3D NULL &amp;&amp; tcge=
tattr(sfd, termp) &lt; 0))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *amaster =3D mfd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *aslave =3D sfd;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (winp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ioctl(sfd, TIOCSWI=
NSZ, winp);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-<br>
-err:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sfd !=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(sfd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(mfd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-}<br>
-#endif<br>
-<br>
-static void cfmakeraw (struct termios *termios_p)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_iflag &amp;=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~(IGNBRK|BRKINT|PA=
RMRK|ISTRIP|INLCR|IGNCR|ICRNL|IXON);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_oflag &amp;=3D ~OPOST;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_lflag &amp;=3D ~(ECHO|ECHONL|I=
CANON|ISIG|IEXTEN);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_cflag &amp;=3D ~(CSIZE|PARENB)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_cflag |=3D CS8;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_cc[VMIN] =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 termios_p-&gt;c_cc[VTIME] =3D 0;<br>
-}<br>
-#endif<br>
-<br>
-int qemu_openpty_raw(int *aslave, char *pty_name)<br>
-{<br>
-=C2=A0 =C2=A0 int amaster;<br>
-=C2=A0 =C2=A0 struct termios tty;<br>
-#if defined(__OpenBSD__) || defined(__DragonFly__)<br>
-=C2=A0 =C2=A0 char pty_buf[PATH_MAX];<br>
-#define q_ptsname(x) pty_buf<br>
-#else<br>
-=C2=A0 =C2=A0 char *pty_buf =3D NULL;<br>
-#define q_ptsname(x) ptsname(x)<br>
-#endif<br>
-<br>
-=C2=A0 =C2=A0 if (openpty(&amp;amaster, aslave, pty_buf, NULL, NULL) &lt; =
0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* Set raw attributes on the pty. */<br>
-=C2=A0 =C2=A0 tcgetattr(*aslave, &amp;tty);<br>
-=C2=A0 =C2=A0 cfmakeraw(&amp;tty);<br>
-=C2=A0 =C2=A0 tcsetattr(*aslave, TCSAFLUSH, &amp;tty);<br>
-<br>
-=C2=A0 =C2=A0 if (pty_name) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 strcpy(pty_name, q_ptsname(amaster));<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return amaster;<br>
-}<br>
diff --git a/chardev/meson.build b/chardev/meson.build<br>
index 325ba2bdb97d..664f77b8879a 100644<br>
--- a/chardev/meson.build<br>
+++ b/chardev/meson.build<br>
@@ -12,11 +12,11 @@ chardev_ss.add(files(<br>
=C2=A0 =C2=A0&#39;char-udp.c&#39;,<br>
=C2=A0 =C2=A0&#39;char.c&#39;,<br>
=C2=A0))<br>
-chardev_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(<br>
+chardev_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: [files(<br>
=C2=A0 =C2=A0&#39;char-fd.c&#39;,<br>
=C2=A0 =C2=A0&#39;char-parallel.c&#39;,<br>
=C2=A0 =C2=A0&#39;char-pty.c&#39;,<br>
-))<br>
+), util])<br>
=C2=A0chardev_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(<br>
=C2=A0 =C2=A0&#39;char-console.c&#39;,<br>
=C2=A0 =C2=A0&#39;char-win-stdio.c&#39;,<br>
diff --git a/util/meson.build b/util/meson.build<br>
index 3736988b9f6e..d6263ccc1b82 100644<br>
--- a/util/meson.build<br>
+++ b/util/meson.build<br>
@@ -12,7 +12,6 @@ util_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(=
&#39;compatfd.c&#39;))<br>
=C2=A0util_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(&#39;event_n=
otifier-posix.c&#39;))<br>
=C2=A0util_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(&#39;mmap-al=
loc.c&#39;))<br>
=C2=A0util_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(&#39;oslib-p=
osix.c&#39;))<br>
-util_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: [files(&#39;qemu-openpt=
y.c&#39;), util])<br>
=C2=A0util_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(&#39;qemu-th=
read-posix.c&#39;))<br>
=C2=A0util_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(&#39;memfd.c=
&#39;))<br>
=C2=A0util_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(&#39;aio-win=
32.c&#39;))<br>
-- <br>
2.35.1.273.ge6ebfd0e8cbb<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005fc7fd05d8c692d3--

