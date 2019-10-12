Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4E5D4FBE
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 14:42:00 +0200 (CEST)
Received: from localhost ([::1]:33040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJGid-0002RC-2L
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 08:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iJGhh-0001lw-Tw
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 08:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iJGhg-0008UC-LV
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 08:41:01 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35479)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iJGhg-0008Ti-CM
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 08:41:00 -0400
Received: by mail-ot1-x342.google.com with SMTP id z6so10247133otb.2
 for <qemu-devel@nongnu.org>; Sat, 12 Oct 2019 05:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=DHyvr3l8NAM4U4Rn508Sh7F3vnZJamzcXfH88r2aZD4=;
 b=ZTimR7ugCr8RSycjKw7r0/clDhYUE9Iskp6M2zige7V6yVmkpZ7A+WlIULa9JK9SKd
 yJSERMbAdB2XUbB/nzc3s+YHdasNznhFYGlyijU+VWUz+N7vElCE/yKZsHeZt5XWorKS
 Ee2+kl+jFKyag5CUFnhnuvl5iN8CMOlNHPDhzjie6t/w0nWBMYbntD2cwjLe5ak+Ryx/
 zZqpHSFItF76l9sa5qquiroc0ATFX32XEI2zPAgzYqSquUZsT/0ndRqG7LP7kyU0QGTc
 v50aVogT4C1277viW9NkIdoIPuCXtlD1lTvkHTFpUGE6ypnSBmuztMQDk/g2bRcINjtt
 dvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=DHyvr3l8NAM4U4Rn508Sh7F3vnZJamzcXfH88r2aZD4=;
 b=i0x7dJKSKkTx6kAVUVruhhQNzTvERIKgVyJZex4+/271lZ7iplO5KLnXOfgJUgqMvE
 f5OmcoAHIS/zdwYQ3/6Yjq9P8x7oNMnraw/3c3FuggErKP390a3InVU/Q4HBu9sl9+am
 AXn+aUbb/Cdxje/oBWRacfrgTje/+sl+8xpBZRtnpEK7wmuehiQiQLCdKf0Yjlsr/mvc
 mbXDjBLtURg8XBsZupUKa5aElHoHxbtGCuvXDzN9wZJHX8ipaa0vyYWs6+F+0mpLdyee
 X6MY1SMWA/Ie7AyqPHy2KcK9VCoy5tqwO6JNWqF+uOFwH8DZ8VZk7sBOJvyXc2fyGYc/
 phEQ==
X-Gm-Message-State: APjAAAXAUiRIb8b0Z6QOpRwL1AJA5HjJ+8DCL0CGvF17x/cuiB2g3sBf
 3myZWpOnmzv7E45xPkvsY6VMvBitdYsvHoc0exg=
X-Google-Smtp-Source: APXvYqzL8LL1NxF8o/tmNm8svfhVC6Waq1woewBUsr7nEIhgvuKHqC7beLK2u+CL5kiI0PN+Paa2Xwb2FfPPF9GS1h0=
X-Received: by 2002:a9d:5914:: with SMTP id t20mr16608497oth.306.1570884059460; 
 Sat, 12 Oct 2019 05:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Sat, 12 Oct 2019 05:40:58
 -0700 (PDT)
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Sat, 12 Oct 2019 05:40:58
 -0700 (PDT)
In-Reply-To: <20191012071210.13632-1-philmd@redhat.com>
References: <20191012071210.13632-1-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sat, 12 Oct 2019 14:40:58 +0200
Message-ID: <CAL1e-=h2d8vBs3bKpsReFNgCW-f4FMTYvJuSahjyNgeF7x5cfw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add a TILE-Gx section
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000058fa3e0594b5f29c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Richard Henderson <rth@twiddle.net>, Chen Gang <gang.chen.5i5j@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000058fa3e0594b5f29c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

12.10.2019. 09.12, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> =D1=98=
=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> The TILE-Gx architecture was missing its section, add it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>

It is certainly good that there is a maintainer for each QEMU component.
But:

- is Chen Gang available and willing to assume the role?

- sadly, tilegx arch support was recently removed from kernel upstream.
That does not mean (in my understanding) automatic removal from QEMU, but
certainly raises some eyebrows. Should we continue supporting tilegx?
Isthete any feedback from users, or the company that owns tilegx?

Sincerely,
Aleksandar

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3ca814850e..a3be0a4a31 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -299,6 +299,11 @@ F: hw/sparc64/
>  F: include/hw/sparc/sparc64.h
>  F: disas/sparc.c
>
> +TILE-Gx CPUs
> +M: Chen Gang <gang.chen.5i5j@gmail.com>
> +S: Maintained
> +F: target/tilegx/
> +
>  UniCore32 TCG CPUs
>  M: Guan Xuetao <gxt@mprc.pku.edu.cn>
>  S: Maintained
> --
> 2.21.0
>
>

--00000000000058fa3e0594b5f29c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
12.10.2019. 09.12, &quot;Philippe Mathieu-Daud=C3=A9&quot; &lt;<a href=3D"m=
ailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =D1=98=D0=B5 =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; The TILE-Gx architecture was missing its section, add it.<br>
&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philm=
d@redhat.com">philmd@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0MAINTAINERS | 5 +++++<br>
&gt; =C2=A01 file changed, 5 insertions(+)<br>
&gt;</p>
<p dir=3D"ltr">It is certainly good that there is a maintainer for each QEM=
U component. But:</p>
<p dir=3D"ltr">- is Chen Gang available and willing to assume the role?</p>
<p dir=3D"ltr">- sadly, tilegx arch support was recently removed from kerne=
l upstream. That does not mean (in my understanding) automatic removal from=
 QEMU, but certainly raises some eyebrows. Should we continue supporting ti=
legx? Isthete any feedback from users, or the company that owns tilegx?</p>
<p dir=3D"ltr">Sincerely,<br>
Aleksandar<br></p>
<p dir=3D"ltr">&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 3ca814850e..a3be0a4a31 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -299,6 +299,11 @@ F: hw/sparc64/<br>
&gt; =C2=A0F: include/hw/sparc/sparc64.h<br>
&gt; =C2=A0F: disas/sparc.c<br>
&gt;<br>
&gt; +TILE-Gx CPUs<br>
&gt; +M: Chen Gang &lt;<a href=3D"mailto:gang.chen.5i5j@gmail.com">gang.che=
n.5i5j@gmail.com</a>&gt;<br>
&gt; +S: Maintained<br>
&gt; +F: target/tilegx/<br>
&gt; +<br>
&gt; =C2=A0UniCore32 TCG CPUs<br>
&gt; =C2=A0M: Guan Xuetao &lt;<a href=3D"mailto:gxt@mprc.pku.edu.cn">gxt@mp=
rc.pku.edu.cn</a>&gt;<br>
&gt; =C2=A0S: Maintained<br>
&gt; -- <br>
&gt; 2.21.0<br>
&gt;<br>
&gt;<br>
</p>

--00000000000058fa3e0594b5f29c--

