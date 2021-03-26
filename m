Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B5634AC1A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:58:13 +0100 (CET)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPoqh-0004Xa-UZ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPopG-0003Wm-LC
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:56:42 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPopE-00063F-Rt
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:56:42 -0400
Received: by mail-ed1-x52b.google.com with SMTP id l18so6857666edc.9
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KIrPNtgX0az6y31ZnVkPxOVrq07PUYDBSfThukPJoTs=;
 b=TQQuxTW/Za7llg7srUniJrUf6Jpmcw7hob54JyPfRRCLy+H2ytjMlLF3TflJywoJ80
 OJjL5y05VVhNGb7ZS5uK37ExIB4HOSAmKnA/VgqrUwOQ5hjvOtlsBjAqD08WOR8F6bOT
 rkSeWFICCoHbR5idIu/MwXawW6WELAflkt/Cm6zXJk0ECSBUTLSCmL0/bkbzkcFy0CJq
 x8UWuO1Y8DPP93001+r0vPcBtT6iRZfqFf/0GGrW/0sgtAgGRiL8M4kRbwONCvfE+Vm7
 lYhKL/DR29IIiUbFnuQQlraWuVy37nZjCpfLJcETcGX+aTs7zpBMf2yGeuF33HLbh0Be
 h9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KIrPNtgX0az6y31ZnVkPxOVrq07PUYDBSfThukPJoTs=;
 b=LneNy6pDFwDbSglKyOoleVZ58RaNY1uEwu7vKq8H1V+IiyGgJFFDG0hklFYir3eO3v
 aQNI4IMwWBmz8eGvC2ezqGLHu3SW0SRWihfyEYs5Dimn8Za0gTqaOwHcyP9leND/kBQV
 44PJFHfkY1F0mqjHSEGFdRaM4VDrG6E33/NFFkK1eRJYSsshvLZT+bQYi7nQSuNLgeD5
 T4Zc0JBPWXzYgLQxlOUBr3OmJj1kDuSEoeNRIxDZZsUDkU+fLxns55npT7ghrSxmVXBX
 GoMQh0fJs7j45ZokHCXaFeoOTHqG/eL0d44zzH3w36oH6yyQBmZ3Dq6DUxN1C/dtPu1n
 7enA==
X-Gm-Message-State: AOAM532qA2U7jJi/eCP4N5Kkt0iqh2EUKt4FRKStUgFvRzTVZnkHDzE/
 GMgq21WUPsWq/2L1B2S6I1FKDKnBzfjvmLiuAIc=
X-Google-Smtp-Source: ABdhPJwQFxGPJKvLQv6zYzfa5GyS2mlM/uWWVv9zTRnqeY1GlODV98b0rU/jLPcElO0VVrzrBdbMzJy12RSKFHQ3PC0=
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr16444654edy.30.1616774198873; 
 Fri, 26 Mar 2021 08:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616744509.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616744509.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Mar 2021 19:56:26 +0400
Message-ID: <CAJ+F1CLJawkZv=7pm6D_r0=Wx856Qsor+FeV7zJOUkyNjGfiQg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] yank: Add chardev tests and fixes
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="000000000000ce505505be7293e4"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Li Zhang <zhlcindy@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ce505505be7293e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 26, 2021 at 11:48 AM Lukas Straub <lukasstraub2@web.de> wrote:

> Hello Everyone,
> These patches increase test coverage for yank, add tests and fix bugs and
> crashes in yank in combination with chardev-change.
> Please Review.
>
> Regards,
> Lukas Straub
>
> Changes:
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
>  tests/unit/test-yank.c | 199 +++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 274 insertions(+), 29 deletions(-)
>  create mode 100644 tests/unit/test-yank.c
>
> --
> 2.30.2
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ce505505be7293e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi<br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 26, 2021 at 11:48 AM Lukas Str=
aub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web.de</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Eve=
ryone,<br>
These patches increase test coverage for yank, add tests and fix bugs and<b=
r>
crashes in yank in combination with chardev-change.<br>
Please Review.<br>
<br>
Regards,<br>
Lukas Straub<br>
<br>
Changes:<br>
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
=C2=A0tests/unit/test-yank.c | 199 ++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A06 files changed, 274 insertions(+), 29 deletions(-)<br>
=C2=A0create mode 100644 tests/unit/test-yank.c<br>
<br>
--<br>
2.30.2<br>
</blockquote></div><br clear=3D"all"></div><div>Reviewed-by: Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lur=
eau@redhat.com</a>&gt;</div><div><br></div><div>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--000000000000ce505505be7293e4--

