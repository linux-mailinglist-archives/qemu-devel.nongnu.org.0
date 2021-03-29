Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576CD34D6E5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 20:22:03 +0200 (CEST)
Received: from localhost ([::1]:33066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQwWX-0002cv-VX
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 14:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lQwUF-00022E-ML
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:19:40 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lQwU9-00026u-6x
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:19:39 -0400
Received: by mail-ej1-x633.google.com with SMTP id ap14so7786175ejc.0
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=32TCJto0OPKAWsXJ0xPtXpsF4a5kD/MrNOZ6Fo6FaUM=;
 b=KyVtjObVVC+aqIGBXhkY0toiuxo+IYBBcGZjV2vY1sDzr4mHz3/LdbUooL4uqDldNW
 TQsmCw7OkEEbk5idbWCoVzBuVXfYxhu1gxEfpDZ0TXpiXgti6uznlFMveXm8/3CGV2wp
 RtGDoLQJ2fcBC9t/FAlOGPf66AeGTncKl/DYoBob8M5mBtDfPcW4+qRBtgQhuXDWxQuv
 m3AyDUJy5tQ3cbtsrpzvUmryrJoTv7tgzDlNtYlwaTJW4Jyk4xMM8KW7yB3LVHxyf4kQ
 rik9eh9GD+pDZgILmqZkA8M6GnF54OS7cuifT1l+479WfacQ7gPZA4lgRHLJudcoIuvq
 cb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=32TCJto0OPKAWsXJ0xPtXpsF4a5kD/MrNOZ6Fo6FaUM=;
 b=hqKU7sR8eyd3vjOHYD1JDfo090ilptH92jyGeiWx4alM9ppT0mE8juzDihjvcv6oZv
 3URc/U2xDpxcVwizWTxztHZVqaz6NkrXe6AhMPYZE0NFjnWNeRo4rZ8TFTKQ9MGQ9Ris
 Z9pxezYpcH4ZbsVJcQN8P2xsQ6bwtP/S6y1AUY/zY5qJk64k0FteA1bzzhtlZ/HwCTeA
 MMjYMZnd0Ui59zQfkVP1TBxnkP/EV06L+w7eGwrys9n0VJCs3LR8ouPJLC4YYZLNVz1q
 dwdvVaL9k5Dg61UvpykaL20wvfYZqA9RGAUgrsLaZD7U5BXj9NYVcq2L4HYXFvSVdCPH
 d/hg==
X-Gm-Message-State: AOAM5329nhM8fx5y3Ro4NOCdcKzC28PHiS6F/29zwke69fnKIib2jnAr
 h/soRuvR/3VTPX62TaN77A3XbdjjLqDmyUOm1HU=
X-Google-Smtp-Source: ABdhPJz6B+DQ+KO+icS4XDZI6R9gHBqY+EI68HZXsLvePcqmaIwJrZrEHIqtQF63H7/T2xK7lsE+dSBapqlCrOnXkpk=
X-Received: by 2002:a17:907:3e8c:: with SMTP id
 hs12mr29973573ejc.105.1617041970641; 
 Mon, 29 Mar 2021 11:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617035720.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617035720.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 29 Mar 2021 22:19:17 +0400
Message-ID: <CAJ+F1C+hq+fop4cBEeNeRYj8qi-bAmvH3myEoVn2cUiC4ttCAg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] yank: Add chardev tests and fixes
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="0000000000003f42d505beb0ece2"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003f42d505beb0ece2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukas

On Mon, Mar 29, 2021 at 8:38 PM Lukas Straub <lukasstraub2@web.de> wrote:

> Hello Everyone,
> These patches increase test coverage for yank, add tests and fix bugs and
> crashes in yank in combination with chardev-change.
> Please Review.
>
> Regards,
> Lukas Straub
>
> Changes:
> -v6:
>  -test: (hopefully) fix test on OSX by using qio_net_listener on the dumm=
y
>   server socket so new clients get accept()'ed properly
>

I can't see the change, patchew neither:
https://patchew.org/QEMU/cover.1616794852.git.lukasstraub2@web.de/diff/cove=
r.1617035720.git.lukasstraub2@web.de/

btw, could you also fix the checkpatch style issue?

thanks

>
> -v5:
>  -test: fix memory leak
>
> -v4:
>  -test: fix CharChangeTestConfig structs on stack going out of scope
>  -test: move after bugfixes
>
> -v3:
>  -Base on <cover.1616521341.git.lukasstraub2@web.de>
>   ([PATCH 0/2] yank: Always link full yank code)
>  -Drop patch 1 (tests: Use the normal yank code instead of stubs in
> relevant tests)
>
> -v2:
>  -test: add license
>  -test: factorize testcases to a single function
>  -test: test chardev_change with initialization of new chardev failing
>  -fix chardev_change with initialization of new chardev failing
>  -add reviewed-by and tested-by tags
>
> Based-on: <cover.1616521341.git.lukasstraub2@web.de>
> ([PATCH 0/2] yank: Always link full yank code)
>
>
> Lukas Straub (4):
>   chardev/char.c: Move object_property_try_add_child out of chardev_new
>   chardev/char.c: Always pass id to chardev_new
>   chardev: Fix yank with the chardev-change case
>   tests: Add tests for yank with the chardev-change case
>
>  MAINTAINERS            |   1 +
>  chardev/char-socket.c  |  20 ++++-
>  chardev/char.c         |  77 ++++++++++------
>  include/chardev/char.h |   3 +
>  tests/unit/meson.build |   3 +-
>  tests/unit/test-yank.c | 200 +++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 275 insertions(+), 29 deletions(-)
>  create mode 100644 tests/unit/test-yank.c
>
> --
> 2.30.2
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000003f42d505beb0ece2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Lukas<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 29, 2021 at 8:38 =
PM Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web=
.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hello Everyone,<br>
These patches increase test coverage for yank, add tests and fix bugs and<b=
r>
crashes in yank in combination with chardev-change.<br>
Please Review.<br>
<br>
Regards,<br>
Lukas Straub<br>
<br>
Changes:<br>
-v6:<br>
=C2=A0-test: (hopefully) fix test on OSX by using qio_net_listener on the d=
ummy<br>
=C2=A0 server socket so new clients get accept()&#39;ed properly<br></block=
quote><div><br></div><div>I can&#39;t see the change, patchew neither:<br><=
/div><div><a href=3D"https://patchew.org/QEMU/cover.1616794852.git.lukasstr=
aub2@web.de/diff/cover.1617035720.git.lukasstraub2@web.de/">https://patchew=
.org/QEMU/cover.1616794852.git.lukasstraub2@web.de/diff/cover.1617035720.gi=
t.lukasstraub2@web.de/</a></div><div><br> </div><div>btw, could you also fi=
x the checkpatch style issue?</div><div><br></div><div>thanks<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-v5:<br>
=C2=A0-test: fix memory leak<br>
<br>
-v4:<br>
=C2=A0-test: fix CharChangeTestConfig structs on stack going out of scope<b=
r>
=C2=A0-test: move after bugfixes<br>
<br>
-v3:<br>
=C2=A0-Base on &lt;<a href=3D"mailto:cover.1616521341.git.lukasstraub2@web.=
de" target=3D"_blank">cover.1616521341.git.lukasstraub2@web.de</a>&gt;<br>
=C2=A0 ([PATCH 0/2] yank: Always link full yank code)<br>
=C2=A0-Drop patch 1 (tests: Use the normal yank code instead of stubs in re=
levant tests)<br>
<br>
-v2:<br>
=C2=A0-test: add license<br>
=C2=A0-test: factorize testcases to a single function<br>
=C2=A0-test: test chardev_change with initialization of new chardev failing=
<br>
=C2=A0-fix chardev_change with initialization of new chardev failing<br>
=C2=A0-add reviewed-by and tested-by tags<br>
<br>
Based-on: &lt;<a href=3D"mailto:cover.1616521341.git.lukasstraub2@web.de" t=
arget=3D"_blank">cover.1616521341.git.lukasstraub2@web.de</a>&gt;<br>
([PATCH 0/2] yank: Always link full yank code)<br>
<br>
<br>
Lukas Straub (4):<br>
=C2=A0 chardev/char.c: Move object_property_try_add_child out of chardev_ne=
w<br>
=C2=A0 chardev/char.c: Always pass id to chardev_new<br>
=C2=A0 chardev: Fix yank with the chardev-change case<br>
=C2=A0 tests: Add tests for yank with the chardev-change case<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 =
+<br>
=C2=A0chardev/char-socket.c=C2=A0 |=C2=A0 20 ++++-<br>
=C2=A0chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 77 ++++++++++=
------<br>
=C2=A0include/chardev/char.h |=C2=A0 =C2=A03 +<br>
=C2=A0tests/unit/meson.build |=C2=A0 =C2=A03 +-<br>
=C2=A0tests/unit/test-yank.c | 200 ++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A06 files changed, 275 insertions(+), 29 deletions(-)<br>
=C2=A0create mode 100644 tests/unit/test-yank.c<br>
<br>
--<br>
2.30.2<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003f42d505beb0ece2--

