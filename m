Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217CB2938B8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 12:01:39 +0200 (CEST)
Received: from localhost ([::1]:43220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUoSY-00061K-6d
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 06:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kUoQV-0005VN-S3
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 05:59:31 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kUoQT-00064X-TQ
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 05:59:31 -0400
Received: by mail-lf1-x133.google.com with SMTP id a9so1362764lfc.7
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3M99JTkIFEixHdxk6ZYa3yXOpidnjbVahkMrmshiRus=;
 b=fLjiKN1A6fQMZDaCMrvBj/qVf7vqaT9dFbbIQAVM8eIccoQphOtf3P9SwstAbXZjf2
 PzN0c5+Bu2WBS7YZC//sLh2tJiv1si9aslTTx1xU5dQWk9W7r8Saij8KjdysqXb6xWAj
 w5IxOlomAe5iOGSa6qaIE4+yMR1z9ca2Irl+LGH4Ir9jLl1pt6TuohgbS/THW0egddiU
 fx6H0RgdIsjSFL+kehG7A09MHQehI0bet2eN06cgpLQ4m+U6CfXNpI5hsKwDjGvR0ZLr
 X6ca+Uh8bocOjMMGvjO2pTM+kERh6ZRizrZPeQ27vkP2jcKUO7vxynbKtKLP6b1J3yXH
 r8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3M99JTkIFEixHdxk6ZYa3yXOpidnjbVahkMrmshiRus=;
 b=HxmUZa0TNvJjPygxL+9tNgdDtBi5NO682nGm40PKOqiZRu+84Q6SpJy7LTFo1W4mLQ
 4AN7ZcfGHiLXtO9MYzFGykmrUPDuDqkmnADW5ZHKkh241LXY0gCPuZlWXlgfZntW/2DM
 hYSESQGy8SBlwc7mSaNRIHwBNoUsPRxJcEe53o2wi3x89OOHLcg4coR2Lo/Vrm62+ftc
 7VdgcOeWbwXKaZinu+NwsVfAXxzBkxia0qxem8SuwIqIJ7F/3Z0//TSdJaSUPvoZa/QF
 ytzbitPFXCV4VZ5iqyMiCoU1FBgkSbb/PPDoikGK82RbSaOti07cDAKY2hbcceRTuDjA
 OqAA==
X-Gm-Message-State: AOAM533a7YZFX6Xg/ic0kNMPaQgx1t2ClJQZ21k6sIUvdQ7TW4Dfqscj
 FBSNKfdGyS0fDR6CTUAjdDqUATyHsDvGlZo4ebU=
X-Google-Smtp-Source: ABdhPJyHDb6L5lan7Lm+oHM2rOkfnwrtyMTUL0+AC655fgFZjX11C1ZL7c+mjjY/T3gIa2d5byoHZ05GsZ44lT6J0iE=
X-Received: by 2002:a19:185:: with SMTP id 127mr717267lfb.356.1603187967613;
 Tue, 20 Oct 2020 02:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201019075224.14803-1-kraxel@redhat.com>
In-Reply-To: <20201019075224.14803-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 20 Oct 2020 13:59:15 +0400
Message-ID: <CAJ+F1CJXt-RLCh5uezLVah4-Mmg1V5Uxx5UaP84Jm4FV1DwGGQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] ui: build spice and opengl as module.
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000515e4605b2174912"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000515e4605b2174912
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Oct 19, 2020 at 12:06 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> - Add QemuSpiceOps, reorganize spice stubs.
> - Add support for module dependencies.
> - Build spice-core modular, and make the existing spice
>   modules (audio, chardev, qxl) depend on spice-core.
> - Build egl-headless display and opengl helpers modular
>   (pretty easy thanks to module dependencies).
>
> Gerd Hoffmann (14):
>   spice: add module helpers
>   spice: add QemuSpiceOps, move migrate_info
>   spice: move qemu_spice_init() to QemuSpiceOps.
>   spice: move display_init() to QemuSpiceOps.
>   spice: move add_interface() to QemuSpiceOps.
>   spice: move auth functions to QemuSpiceOps.
>   spice: move display_add_client() to QemuSpiceOps.
>   spice: wire up monitor in QemuSpiceOps.
>   spice: load module when enabled on the cmdline
>   modules: dependencies infrastructure
>   modules: add spice dependencies
>   spice: flip modules switch
>   opengl: build egl-headless display modular
>   opengl: build opengl helper code modular
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

thanks!


>  include/ui/qemu-spice-module.h | 44 ++++++++++++++++++
>  include/ui/qemu-spice.h        | 42 +----------------
>  audio/spiceaudio.c             |  4 +-
>  chardev/spice.c                |  2 +-
>  monitor/misc.c                 |  2 +-
>  monitor/qmp-cmds.c             |  6 +--
>  softmmu/vl.c                   | 10 ++--
>  ui/spice-core.c                | 31 +++++++++----
>  ui/spice-input.c               |  6 +--
>  ui/spice-module.c              | 85 ++++++++++++++++++++++++++++++++++
>  util/module.c                  | 44 ++++++++++++++++--
>  ui/meson.build                 | 28 +++++++++--
>  12 files changed, 232 insertions(+), 72 deletions(-)
>  create mode 100644 include/ui/qemu-spice-module.h
>  create mode 100644 ui/spice-module.c
>
> --
> 2.27.0
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000515e4605b2174912
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 19, 2020 at 12:06 PM Ge=
rd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">- Add=
 QemuSpiceOps, reorganize spice stubs.<br>
- Add support for module dependencies.<br>
- Build spice-core modular, and make the existing spice<br>
=C2=A0 modules (audio, chardev, qxl) depend on spice-core.<br>
- Build egl-headless display and opengl helpers modular<br>
=C2=A0 (pretty easy thanks to module dependencies).<br>
<br>
Gerd Hoffmann (14):<br>
=C2=A0 spice: add module helpers<br>
=C2=A0 spice: add QemuSpiceOps, move migrate_info<br>
=C2=A0 spice: move qemu_spice_init() to QemuSpiceOps.<br>
=C2=A0 spice: move display_init() to QemuSpiceOps.<br>
=C2=A0 spice: move add_interface() to QemuSpiceOps.<br>
=C2=A0 spice: move auth functions to QemuSpiceOps.<br>
=C2=A0 spice: move display_add_client() to QemuSpiceOps.<br>
=C2=A0 spice: wire up monitor in QemuSpiceOps.<br>
=C2=A0 spice: load module when enabled on the cmdline<br>
=C2=A0 modules: dependencies infrastructure<br>
=C2=A0 modules: add spice dependencies<br>
=C2=A0 spice: flip modules switch<br>
=C2=A0 opengl: build egl-headless display modular<br>
=C2=A0 opengl: build opengl helper code modular<br></blockquote><div><br></=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></di=
v><div>thanks!</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
=C2=A0include/ui/qemu-spice-module.h | 44 ++++++++++++++++++<br>
=C2=A0include/ui/qemu-spice.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 42 +------------=
----<br>
=C2=A0audio/spiceaudio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 +-<br>
=C2=A0chardev/spice.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
=C2=A0monitor/misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
=C2=A0monitor/qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 6 +--<br>
=C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 10 ++--<br>
=C2=A0ui/spice-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 31 +++++++++----<br>
=C2=A0ui/spice-input.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 6 +--<br>
=C2=A0ui/spice-module.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8=
5 ++++++++++++++++++++++++++++++++++<br>
=C2=A0util/module.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 44 ++++++++++++++++--<br>
=C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 28 +++++++++--<br>
=C2=A012 files changed, 232 insertions(+), 72 deletions(-)<br>
=C2=A0create mode 100644 include/ui/qemu-spice-module.h<br>
=C2=A0create mode 100644 ui/spice-module.c<br>
<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000515e4605b2174912--

