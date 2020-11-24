Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346AA2C26B7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:03:06 +0100 (CET)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXyL-0000Z2-81
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khXvE-000769-9L
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:59:52 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:45591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1khXvC-00074N-Hq
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:59:52 -0500
Received: by mail-ej1-x642.google.com with SMTP id lv15so22482732ejb.12
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 04:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=nAOSdf+1dWSd26DXQ8liJVtSSpAL6szHxDdh0zVRnW8=;
 b=OGexWFOEW6Hp8Up94igfEYrElYEW2PdYVHXBEU56TaWATOMn5HiAcOhynf4OqH2/Yy
 JLOK4l6WGjUkUaZxuUANgN2HCSB3a3r/BFkz/darNJD+ah7/m+Don1vUWAURHvaXjxVG
 QNCmTCbVDxqIRD9lvZlwcTnjr82S7oeh/W81Fo13VcjCivWLUwpHd8fGJIJ0xOSevHtG
 r9x8c02mhOwmTkHU+1NygFPXkO7USaH9/x6We9KInmGVuE7CP541OkCj3kEsslX0+JIo
 ayTDgg7t8GaLaXHf03zpLo9o/G0xagcH03rMGU2G6PNyt56aWZNRNVY2+S6gm+XU98RO
 gKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=nAOSdf+1dWSd26DXQ8liJVtSSpAL6szHxDdh0zVRnW8=;
 b=FN1LGD0geLgQ/Duj1BS26Gu1pTuSjj8jUVxsY/RcsfwezK2bmrdakkgMLtIO65eWdb
 +7UrNljSV1dBkZsS/JlEIAqH6EG/sDlTtQQ13uUXoI01CjONg+cZUVWyKRMyQPpkwzjb
 M/j2+ln3+H9XCYtmRf0elAXsJkJ+gGc9N9MK/opr0cXzquMcWRpf5fJR+Yvh/v7KZ8cF
 5/EwO4KyyifQ+F08okQwLpyjRR+ZPuvKavP9iYQeJAoVRGVKps1XCvNDMrOqlvqZnAKU
 zyfF4jwR1XBLScH5pQNBQgqpik8gCJCaRd/56Z2mgE0YAwaTc1eIU9SqVi3d9B1Qqmtj
 sDpA==
X-Gm-Message-State: AOAM530UDaHnfo8FeggBQgI2g42XrMi0PfrLvFodL8wcnhxkEWTWCuoq
 3refaY3NXVU++OrzWTkn+aIFcwu8AmpmuOJmBG9s1mYksZ4=
X-Google-Smtp-Source: ABdhPJwWk05VAx/u6si0JzKYp4ocJh4UvoAiQJ9Sxi0B+g9t/qH3l1YCQr0UQNV6W9aPA11KKijp6C5beCRahD+O3Yk=
X-Received: by 2002:a17:906:c298:: with SMTP id
 r24mr452787ejz.381.1606222787815; 
 Tue, 24 Nov 2020 04:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20201124125235.266884-1-marcandre.lureau@redhat.com>
In-Reply-To: <20201124125235.266884-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 24 Nov 2020 16:59:34 +0400
Message-ID: <CAJ+F1CJO52ZUNh+mJPEc4xAHXLLnCxBqoFP5nrERNqExjpVuVQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Remove GCC < 4.8 checks
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b2ae4705b4d9e2b5"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b2ae4705b4d9e2b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 4:54 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version=3D
> "),
> QEMU explicitely depends on GCC >=3D3D 4.8.
>
> Marc-Andr=3DC3=3DA9 Lureau (2):
>   Remove GCC version checks (all < 4.8)
>   compiler.h: remove QEMU_GNUC_PREREQ macro
>

There is some double-encoding going on with my cover letters, lovely...


>  include/qemu/atomic.h         | 17 -----------------
>  include/qemu/compiler.h       | 33 ++++++---------------------------
>  include/qemu/qemu-plugin.h    |  9 ++-------
>  scripts/cocci-macro-file.h    |  1 -
>  tools/virtiofsd/fuse_common.h |  4 +---
>  accel/tcg/cpu-exec.c          |  2 +-
>  tests/tcg/arm/fcvt.c          |  8 +++-----
>  7 files changed, 13 insertions(+), 61 deletions(-)
>
> --=3D20
> 2.29.0
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b2ae4705b4d9e2b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 4:54 PM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Hi,<br>
<br>
Since commit efc6c07 (&quot;configure: Add a test for the minimum compiler =
version=3D<br>
&quot;),<br>
QEMU explicitely depends on GCC &gt;=3D3D 4.8.<br>
<br>
Marc-Andr=3DC3=3DA9 Lureau (2):<br>
=C2=A0 Remove GCC version checks (all &lt; 4.8)<br>
=C2=A0 compiler.h: remove QEMU_GNUC_PREREQ macro<br></blockquote><div><br><=
/div><div>There is some double-encoding going on with my cover letters, lov=
ely... <br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
=C2=A0include/qemu/atomic.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ---------=
--------<br>
=C2=A0include/qemu/compiler.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 33 ++++++--------=
-------------------<br>
=C2=A0include/qemu/qemu-plugin.h=C2=A0 =C2=A0 |=C2=A0 9 ++-------<br>
=C2=A0scripts/cocci-macro-file.h=C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0tools/virtiofsd/fuse_common.h |=C2=A0 4 +---<br>
=C2=A0accel/tcg/cpu-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<b=
r>
=C2=A0tests/tcg/arm/fcvt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++-=
----<br>
=C2=A07 files changed, 13 insertions(+), 61 deletions(-)<br>
<br>
--=3D20<br>
2.29.0<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b2ae4705b4d9e2b5--

