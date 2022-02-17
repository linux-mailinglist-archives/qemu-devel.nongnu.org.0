Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8251F4BA0BA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:13:07 +0100 (CET)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKgan-0001Qd-0K
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:13:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKgNO-0004IB-RJ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:59:14 -0500
Received: from [2607:f8b0:4864:20::336] (port=46906
 helo=mail-ot1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKgNA-0002vs-PT
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:59:12 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso3564485otv.13
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 04:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=An6FEf7CqZpGWxOISdENfeZc/g7pSrwrvb3ALwslhIE=;
 b=QZCKMAzikcp+fXpbaxZ4vF77+lWEnz0jzjk2iazs3or0RQdtauFD3VqZUR4IQvvDlF
 QLCGILwTY35vv1XsuEy+46A4kIgWjK6pH4VcWvLBbKUaWKxkZJgiOiBdzhmIBRp9FVHZ
 AGhWL+86CM2GcOKG1cdCkMcWAvr3QSzl82qW+zV9mRnQ3onN15sL/SM+OlGVzCrcdMM1
 F1hlhIV9jsbi8RdT+8qppDfJNutL2Z+RF/90TISTT2BtQWFdZbCmFIm2llMXh8B2F8RE
 zPVlgxu3plIPr84Hjz/COAs+neCGD/qalMWVBs7iEldBAi3ePFrtjBpDtBwfBdJfdFzv
 m6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=An6FEf7CqZpGWxOISdENfeZc/g7pSrwrvb3ALwslhIE=;
 b=PajCWY6tlD2z3qGdomChFnBGClIEdq1jsuzmNH9GsrXyR+5jBbGSs5Pv9mO5/lSesv
 HxUj2gm+EaCWdgqlA0E3yxV49L1+lCjsaNDisXCVznwJ+1ho0mQNEb+q/DRuq8st8q9J
 UaGmqECWK2/yIaMjzrw69FX/INAhyLx7djJ7KtpUjMkrh45coL6AVPIow+mdEix4qo49
 iOokpBL+eM6hXgjRN1E5YNvbkgTV+IzFpWcItugbV8/XgQMcLpwBazliq5IpKSy96tua
 ryMaa4U2T9TV0LCkzU0cv9xg75K9IOXPBf2fw91hg4Y3eecQDmrmTdVhxqVcfqVFrMWo
 3b4w==
X-Gm-Message-State: AOAM531S3Xf0bX9bUGg1pylf98rZuFCrLZvvwa/inOe3gjVbTRreMA+E
 Z4Zf7WLUk6qO/0gmLEG3hjeZhM1HKzpgHDCOM1w=
X-Google-Smtp-Source: ABdhPJw+IDWEI8B6cKhs3FYSvzfHpEqVafV0gIigF/bPtrqHtJkQopsuFMk4d3ZzLJqRxi9dseMcDKrwTCanVH8kuZg=
X-Received: by 2002:a05:6830:2908:b0:5ad:1ed7:70ea with SMTP id
 z8-20020a056830290800b005ad1ed770eamr351068otu.186.1645102739447; Thu, 17 Feb
 2022 04:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 17 Feb 2022 21:58:48 +0900
Message-ID: <CAMVc7JVOJxkqLpvRu7JLNP48C5Kmu0JRYUSR8xP+dAtGp_n=_A@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] GL & D-Bus display related fixes
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::336
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Thu, Feb 17, 2022 at 8:58 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> In the thread "[PATCH 0/6] ui/dbus: Share one listener for a console", Ak=
ihiko
> Odaki reported a number of issues with the GL and D-Bus display. His seri=
es
> propose a different design, and reverting some of my previous generic con=
sole
> changes to fix those issues.
>
> However, as I work through the issue so far, they can be solved by reason=
able
> simple fixes while keeping the console changes generic (not specific to t=
he
> D-Bus display backend). I belive a shared infrastructure is more benefici=
al long
> term than having GL-specific code in the DBus code (in particular, the
> egl-headless & VNC combination could potentially use it)
>
> Thanks a lot Akihiko for reporting the issues proposing a different appro=
ach!
> Please test this alternative series and let me know of any further issues=
. My
> understanding is that you are mainly concerned with the Cocoa backend, an=
d I
> don't have a way to test it, so please check it. If necessary, we may wel=
l have
> to revert my earlier changes and go your way, eventually.
>
> Marc-Andr=C3=A9 Lureau (12):
>   ui/console: fix crash when using gl context with non-gl listeners
>   ui/console: fix texture leak when calling surface_gl_create_texture()
>   ui: do not create a surface when resizing a GL scanout
>   ui/console: move check for compatible GL context
>   ui/console: move dcl compatiblity check to a callback
>   ui/console: egl-headless is compatible with non-gl listeners
>   ui/dbus: associate the DBusDisplayConsole listener with the given
>     console
>   ui/console: move console compatibility check to dcl_display_console()
>   ui/shader: fix potential leak of shader on error
>   ui/shader: free associated programs
>   ui/console: add a dpy_gfx_switch callback helper
>   ui/dbus: fix texture sharing
>
>  include/ui/console.h |  19 ++++---
>  ui/dbus.h            |   3 ++
>  ui/console-gl.c      |   4 ++
>  ui/console.c         | 119 ++++++++++++++++++++++++++-----------------
>  ui/dbus-console.c    |  27 +++++-----
>  ui/dbus-listener.c   |  11 ----
>  ui/dbus.c            |  33 +++++++++++-
>  ui/egl-headless.c    |  17 ++++++-
>  ui/gtk.c             |  18 ++++++-
>  ui/sdl2.c            |   9 +++-
>  ui/shader.c          |   9 +++-
>  ui/spice-display.c   |   9 +++-
>  12 files changed, 192 insertions(+), 86 deletions(-)
>
> --
> 2.34.1.428.gdcc0cd074f0c
>
>

You missed only one thing:
>- that console_select and register_displaychangelistener may not call
> dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is
> incompatible with non-OpenGL displays

displaychangelistener_display_console always has to call
dpy_gfx_switch for non-OpenGL displays, but it still doesn't.

Anything else should be addressed with this patch series. (And it also
has nice fixes for shader leaks.)

cocoa doesn't have OpenGL output and egl-headless, the cause of many
pains addressed here, does not work on macOS so you need little
attention. I have an out-of-tree OpenGL support for cocoa but it is
out-of-tree anyway and I can fix it anytime.

Regards,
Akihiko Odaki

