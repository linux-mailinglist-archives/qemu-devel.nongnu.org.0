Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAB64F100B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 09:38:32 +0200 (CEST)
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbHIE-0001av-Nm
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 03:38:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hduweili@gmail.com>)
 id 1nbHG2-0000hX-Vi
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 03:36:17 -0400
Received: from [2607:f8b0:4864:20::12b] (port=33679
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hduweili@gmail.com>)
 id 1nbHG1-0007Gy-1e
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 03:36:14 -0400
Received: by mail-il1-x12b.google.com with SMTP id k15so1600755ils.0
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 00:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LLilIuJDEkLuxzJSIWkrzFGnd1b+FrQMsn7Fb3iAQg=;
 b=YZh9w4c19aDudWqo+YG3H+EmAJDeP/m5H7cuLPr77tn6N7Jp7rNYfHJcSezXnPYXgJ
 FRC34VXMd91bTMWiSS6/DodS1FpQzWkx8baMkvwJzbcC06OhSUfh2mLZ1OzsOpxvCC75
 YHKLDlNHn2VxN5JidTL46NvXb8EtqrUCxLIdZdmYVFrphd6nhgb+Maa64WFD8PxvV4X7
 g1H0IUqTFBtLINOrlbul6X6ItgtJIIMDBeines1XHou5Y1ulfxPxDkZWOU6QUcj3Ov0h
 UnSU7ACxyuVKwFnV8iO5FGfYz8EGsnAZss7Osp1VQPsevnQNTxDHrmnjjDpOr7Te59HE
 5SlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LLilIuJDEkLuxzJSIWkrzFGnd1b+FrQMsn7Fb3iAQg=;
 b=WeyVJZ47YwenjkVkV/6L1p33UAv1d8NXkamkCH16C9cwlIFyQppZ5ObkNpuR4UIwHI
 2jcM917qWMQJ6WRoeP4DaKRTDanPDzXk6nJG+oDj5jyTxBN/Obk8GAcM91Lc6BbCi9dP
 PuyA/3HYGH8TQCVQplWSNBRBq2ILFL2K0KHcOeOeoldpZ02gHi2xB73B39q9DZJeumbU
 dhrZQm57caIPgDXr81VqGkLAqH6ugaETCJy+9mhijISgUUe5wVjvWja3WjDPS/GBEqpN
 4fTpWmAl8FT5/2iiHDxzhhIAoEakLEjfWMZUg+RTr8SXNPEN6aD/8MhGF8aancP+e7xy
 KJLQ==
X-Gm-Message-State: AOAM532W++5s8WuduLQzMdPnRGGZ2JycuVC+cRThy3uBwFy8dtFso5BZ
 1IgOD6lvAT0qbVW7fhYkcKf3kr/56oeJE07BCxc=
X-Google-Smtp-Source: ABdhPJziXhPra9IUbKeO4C8OfrjKz6fe565fo6GZSw386b9JCoskqCiO7UFRulL1A9Xx9Q3bdkkMK0x5nF3N9whswA8=
X-Received: by 2002:a92:6a01:0:b0:2b6:87b7:180b with SMTP id
 f1-20020a926a01000000b002b687b7180bmr5116106ilc.82.1649057771566; Mon, 04 Apr
 2022 00:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220325145007.448948-1-lw945lw945.ref@yahoo.com>
 <20220325145007.448948-1-lw945lw945@yahoo.com>
In-Reply-To: <20220325145007.448948-1-lw945lw945@yahoo.com>
From: Wei Li <hduweili@gmail.com>
Date: Mon, 4 Apr 2022 15:36:00 +0800
Message-ID: <CAAHarUxAhSEAxgxk5fLK22tfAShHDokhQByuKT_7BUL1hYjWHg@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/i386: Some mmx/sse instructions don't require
To: Wei Li <lw945lw945@yahoo.com>
Content-Type: multipart/alternative; boundary="000000000000b03c7605dbcf2e05"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=hduweili@gmail.com; helo=mail-il1-x12b.google.com
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
Cc: eduardo@habkost.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b03c7605dbcf2e05
Content-Type: text/plain; charset="UTF-8"

Ping......

And the title is target/i386: Some mmx/sse instructions don't require
CR0.TS=0

On Fri, Mar 25, 2022 at 10:55 PM Wei Li <lw945lw945@yahoo.com> wrote:

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/427
>
> All instructions decoded by 'gen_see' is assumed to require CRO.TS=0. But
> according to SDM, CRC32 doesn't require it. In fact, EMMS, FMMS and some
> mmx/sse instructions(0F38F[0-F], 0F3AF[0-F]) don't require it.
>
> To solve the problem, first to move EMMS and FMMS out of gen_sse. Then
> instructions in 'gen_sse' require it only when modrm & 0xF0 is false.
>
> Wei Li (2):
>   Move EMMS and FEMMS instructions out of gen_sse
>   Some mmx/sse instructions in 'gen_sse' don't require CRO.TS=0
>
>  target/i386/tcg/translate.c | 45 +++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 24 deletions(-)
>
> --
> 2.30.2
>
>
>
Thanks.
--
Wei Li

--000000000000b03c7605dbcf2e05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Ping......</div><div dir=3D"ltr"><br></di=
v><div>And the title is=C2=A0target/i386: Some mmx/sse instructions don&#39=
;t require CR0.TS=3D0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 25, 2022 at 10:55 PM Wei Li &lt;<a href=3D=
"mailto:lw945lw945@yahoo.com">lw945lw945@yahoo.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Resolves: <a href=3D"http=
s://gitlab.com/qemu-project/qemu/-/issues/427" rel=3D"noreferrer" target=3D=
"_blank">https://gitlab.com/qemu-project/qemu/-/issues/427</a><br>
<br>
All instructions decoded by &#39;gen_see&#39; is assumed to require CRO.TS=
=3D0. But<br>
according to SDM, CRC32 doesn&#39;t require it. In fact, EMMS, FMMS and som=
e<br>
mmx/sse instructions(0F38F[0-F], 0F3AF[0-F]) don&#39;t require it.<br>
<br>
To solve the problem, first to move EMMS and FMMS out of gen_sse. Then<br>
instructions in &#39;gen_sse&#39; require it only when modrm &amp; 0xF0 is =
false.<br>
<br>
Wei Li (2):<br>
=C2=A0 Move EMMS and FEMMS instructions out of gen_sse<br>
=C2=A0 Some mmx/sse instructions in &#39;gen_sse&#39; don&#39;t require CRO=
.TS=3D0<br>
<br>
=C2=A0target/i386/tcg/translate.c | 45 +++++++++++++++++-------------------=
-<br>
=C2=A01 file changed, 21 insertions(+), 24 deletions(-)<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div>Thanks.</div>--<div dir=3D"ltr" c=
lass=3D"gmail_signature"><div dir=3D"ltr"><div>Wei Li</div><div><br></div><=
/div></div></div>

--000000000000b03c7605dbcf2e05--

