Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E29D4D0E8D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 05:11:24 +0100 (CET)
Received: from localhost ([::1]:60048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRRBy-00087j-OS
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 23:11:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nRRAU-0006sM-JN; Mon, 07 Mar 2022 23:09:52 -0500
Received: from [2607:f8b0:4864:20::c2a] (port=35824
 helo=mail-oo1-xc2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nRRAS-0002zr-Tw; Mon, 07 Mar 2022 23:09:50 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so20647809ooi.2; 
 Mon, 07 Mar 2022 20:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JxJsWsKgdIgKmk1x/aw+xNGiU2hipBI93YGHqJNQ284=;
 b=otTJWOLHjC1trtykywy/xMLzENeSqesxhVZFVUSLcMR0YtlxkksRBD5gab2fWm/kUe
 psKZ9ba0mWlX3eRzCajY+6AYdg5a2yywp2agdKzs/sx5YHZkdOQBEYoksFQoGOa67hd1
 ltG7ZSWOIqPqNlz8UJCn8+dAIkOqp9T1+a4tk9q37FZqgyFT/xAzKWAoSlwwqULTObnR
 dmlefTjKW+h60b6ACjr53wzMDc6La4rpma7dzHeg49Ai1P4qsC0yXJn7ukXX+yH4de7K
 R8fLC8Kk2FAGTts3Y3F7K262h/RvKfkr5OzH+Itxsl5oYTUZCin6NJNJB5stYKximLaS
 rSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JxJsWsKgdIgKmk1x/aw+xNGiU2hipBI93YGHqJNQ284=;
 b=ycghDvnkYA08ETUV7VWYwOTDUoypkWXUJfEuD6EjjIC8ahkon1xtDcg9EDr6W6pPUF
 4wkf5DC7mkfW8Mq43/8D+6Toonz3A/fa0SzyhQqdvIEGYaGRvuZ/gBQDkTb62LAajsoX
 ornJ34IkPHS+00p2ZukWAP5/0x7ybAZWb+7qtaKbv9NQ5lpoLqKUOwWk8ZF0Pu7U1MLU
 g++WdDMubfjQAGBp/9TqSGh4cT6T90buzKIEf/s4fKvptTBicBtb6vG97XX1CvIzK9IR
 k98Tc+FWle1yp0eSCnQMOoSJT7MQTYetaNQ2ytkRxzCFPgCrWhjModMSj6fsXyMIuZpT
 KP0g==
X-Gm-Message-State: AOAM530VTyltGfATfRwYTyY7LFdER5NYHHOikMGSgGtRfgoAKaEnp2iw
 amirqvca9gHoYvS3OxQj13O5NRK406FHnvxwZUs=
X-Google-Smtp-Source: ABdhPJxZyIK0c2Pe1ogTnh4CeVj+T+uUXVP7ofJwAUaGAahxQbnc7zKEzeevLKQ0URdnIbh5kK3qfHzEBqtwjut/yyM=
X-Received: by 2002:a05:6870:7a3:b0:d7:5fbf:37b7 with SMTP id
 en35-20020a05687007a300b000d75fbf37b7mr1332164oab.16.1646712586933; Mon, 07
 Mar 2022 20:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20220308015358.188499-1-richard.henderson@linaro.org>
In-Reply-To: <20220308015358.188499-1-richard.henderson@linaro.org>
From: David Miller <dmiller423@gmail.com>
Date: Mon, 7 Mar 2022 23:09:32 -0500
Message-ID: <CAEgyohXWk7uFrZmOwZKSYtrHs8_NnAWhvr9DgqnYP0JmLEPP_Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] s390x/tcg: Implement Vector-Enhancements
 Facility 2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ca989305d9ad2666"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dmiller423@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ca989305d9ad2666
Content-Type: text/plain; charset="UTF-8"

I've reviewed all changes,  looks good.
Ran all of my own tests including vstrs, all passed.

Thank you for all reviews and changes here.

- David Miller

On Mon, Mar 7, 2022 at 8:54 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Hi David,
>
> I've split up the patches a bit, made some improvements to
> the shifts and reversals, and fixed a few bugs.
>
> Please especially review vector string search, as that is
> has had major changes.
>
>
> r~
>
>
> David Miller (9):
>   target/s390x: vxeh2: vector convert short/32b
>   target/s390x: vxeh2: vector string search
>   target/s390x: vxeh2: Update for changes to vector shifts
>   target/s390x: vxeh2: vector shift double by bit
>   target/s390x: vxeh2: vector {load, store} elements reversed
>   target/s390x: vxeh2: vector {load, store} byte reversed elements
>   target/s390x: vxeh2: vector {load, store} byte reversed element
>   target/s390x: add S390_FEAT_VECTOR_ENH2 to cpu max
>   tests/tcg/s390x: Tests for Vector Enhancements Facility 2
>
> Richard Henderson (2):
>   tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
>   target/s390x: Fix writeback to v1 in helper_vstl
>
>  include/tcg/tcg-op.h                 |   6 +
>  target/s390x/helper.h                |  13 +
>  target/s390x/gen-features.c          |   2 +
>  target/s390x/tcg/translate.c         |   3 +-
>  target/s390x/tcg/vec_fpu_helper.c    |  31 ++
>  target/s390x/tcg/vec_helper.c        |   2 -
>  target/s390x/tcg/vec_int_helper.c    |  58 ++++
>  target/s390x/tcg/vec_string_helper.c | 101 ++++++
>  tcg/tcg-op.c                         |  30 ++
>  tests/tcg/s390x/vxeh2_vcvt.c         |  97 ++++++
>  tests/tcg/s390x/vxeh2_vlstr.c        | 146 +++++++++
>  tests/tcg/s390x/vxeh2_vs.c           |  91 ++++++
>  target/s390x/tcg/translate_vx.c.inc  | 442 ++++++++++++++++++++++++---
>  target/s390x/tcg/insn-data.def       |  40 ++-
>  tests/tcg/s390x/Makefile.target      |   8 +
>  15 files changed, 1018 insertions(+), 52 deletions(-)
>  create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
>  create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
>  create mode 100644 tests/tcg/s390x/vxeh2_vs.c
>
> --
> 2.25.1
>
>

--000000000000ca989305d9ad2666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#073763"><br></div><div class=3D"gmail_default"=
 style=3D"font-family:georgia,serif;font-size:small;color:#073763">I&#39;ve=
 reviewed all changes,=C2=A0 looks good.</div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:#073763">Ran all o=
f my own tests including vstrs, all passed.</div><div class=3D"gmail_defaul=
t" style=3D"font-family:georgia,serif;font-size:small;color:#073763"><br></=
div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-si=
ze:small;color:#073763">Thank you for all reviews and changes here.<br></di=
v><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size=
:small;color:#073763"><br></div><div class=3D"gmail_default" style=3D"font-=
family:georgia,serif;font-size:small;color:#073763">- David Miller</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Mar 7, 2022 at 8:54 PM Richard Henderson &lt;<a href=3D"mailto:richard=
.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hi David,<br>
<br>
I&#39;ve split up the patches a bit, made some improvements to<br>
the shifts and reversals, and fixed a few bugs.<br>
<br>
Please especially review vector string search, as that is<br>
has had major changes.<br>
<br>
<br>
r~<br>
<br>
<br>
David Miller (9):<br>
=C2=A0 target/s390x: vxeh2: vector convert short/32b<br>
=C2=A0 target/s390x: vxeh2: vector string search<br>
=C2=A0 target/s390x: vxeh2: Update for changes to vector shifts<br>
=C2=A0 target/s390x: vxeh2: vector shift double by bit<br>
=C2=A0 target/s390x: vxeh2: vector {load, store} elements reversed<br>
=C2=A0 target/s390x: vxeh2: vector {load, store} byte reversed elements<br>
=C2=A0 target/s390x: vxeh2: vector {load, store} byte reversed element<br>
=C2=A0 target/s390x: add S390_FEAT_VECTOR_ENH2 to cpu max<br>
=C2=A0 tests/tcg/s390x: Tests for Vector Enhancements Facility 2<br>
<br>
Richard Henderson (2):<br>
=C2=A0 tcg: Implement tcg_gen_{h,w}swap_{i32,i64}<br>
=C2=A0 target/s390x: Fix writeback to v1 in helper_vstl<br>
<br>
=C2=A0include/tcg/tcg-op.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0target/s390x/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 13 +<br>
=C2=A0target/s390x/gen-features.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +<br>
=C2=A0target/s390x/tcg/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A03 +-<br>
=C2=A0target/s390x/tcg/vec_fpu_helper.c=C2=A0 =C2=A0 |=C2=A0 31 ++<br>
=C2=A0target/s390x/tcg/vec_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 -<br>
=C2=A0target/s390x/tcg/vec_int_helper.c=C2=A0 =C2=A0 |=C2=A0 58 ++++<br>
=C2=A0target/s390x/tcg/vec_string_helper.c | 101 ++++++<br>
=C2=A0tcg/tcg-op.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 30 ++<br>
=C2=A0tests/tcg/s390x/vxeh2_vcvt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 97 ++++++<br>
=C2=A0tests/tcg/s390x/vxeh2_vlstr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 146 ++++++=
+++<br>
=C2=A0tests/tcg/s390x/vxeh2_vs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 91 ++++++<br>
=C2=A0target/s390x/tcg/translate_vx.c.inc=C2=A0 | 442 +++++++++++++++++++++=
+++---<br>
=C2=A0target/s390x/tcg/insn-data.def=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 40 +=
+-<br>
=C2=A0tests/tcg/s390x/Makefile.target=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +=
<br>
=C2=A015 files changed, 1018 insertions(+), 52 deletions(-)<br>
=C2=A0create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c<br>
=C2=A0create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c<br>
=C2=A0create mode 100644 tests/tcg/s390x/vxeh2_vs.c<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000ca989305d9ad2666--

