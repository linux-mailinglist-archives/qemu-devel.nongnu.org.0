Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C436DF77B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:41:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmaiv-0004hW-SE; Wed, 12 Apr 2023 09:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <waleedjghandour@gmail.com>)
 id 1pmais-0004hG-CR
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:41:18 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <waleedjghandour@gmail.com>)
 id 1pmaiq-0005Kc-PJ
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:41:18 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id d204so3328335ybh.6
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681306875; x=1683898875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HTUdAllrMMgYSGmyPAGpc4DYbgqUwliSG49WfhIwK6U=;
 b=KuEWop8PNiOxTQEafVLePrLnrXkSX4XX8BlNKmhClLSd5gW9MJ829/CcHp7mRZfWWq
 yC3Bo5cgXge6aK1eS1YFd4BDQPNL5dV2wKtxL4HuCBZe0KCofwb+xcERSmAwEmyHvCBQ
 Jgg5oXyj/hg18JKtKUpPFLfS9fTnbx2728xHpT7JoGb22mchmZ4PpTSEo+xyAiv6A7ee
 5AjsN4g9nMebTutPDT6C44OyUiLqoWqAy6KBX0deJS0Dqrgagl4eBCM4cND4Cwg587BO
 vEAK7VHx/7GlIJlhpkxyuar+HaGAzuTwECuwpDWIjP11RshCGGum10mGu8ZShaYYWc5d
 JN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681306875; x=1683898875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HTUdAllrMMgYSGmyPAGpc4DYbgqUwliSG49WfhIwK6U=;
 b=5s6oND2N3bQVIDQPTN4ZR0mvJ4jxTDC3FSpuCKMPnrnv75h1gXWuOlQcMXY1Vi3XPL
 K7OlPYHfTnIfCeH0d5fRdl7KM7zAMbOBLTXFL/UP4HeuPw7CVmffX5rwQnrSVXmR1uY7
 EAPD5esGA1TTB3/NgcXYtM5fItOWhz2dGaZ7gW8OFOVInAFQKtYcKAp4vBIVYqINJg3C
 QAW3DkwB40ylSuznpU7LijgzLJ/0kKHKy8g/VPnd5BnrW/s+/Ck9yz73nobbMalqZ1UQ
 E2cSir6gnale0fI0g8ifXb2YBwP2zf+IoXcFHXHNV/oDtPb+/H2CW33xce5oL/TIzpcf
 sPwg==
X-Gm-Message-State: AAQBX9fbMIxv91kvnqB2D1k4TSwSYvIILpMICEv5zCf0uZ+KSMys7pcE
 aDeIXqpqr/sRgYc2YD42dzBhyp/EFoP0WX8OoCk=
X-Google-Smtp-Source: AKy350aYA7NwCQx/XnSM5cAfbT6cItNdbZZXqf9yki2/1AlSqnQQkm7Ax2ijr0/IxihB7Hjb44AYKr0i9/Pbb75CpAA=
X-Received: by 2002:a25:7315:0:b0:a99:de9d:d504 with SMTP id
 o21-20020a257315000000b00a99de9dd504mr1663827ybc.12.1681306875170; Wed, 12
 Apr 2023 06:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQMSUtx73GosLwzMLERTMkJ=eLiU5NbwZY1K0eOmFbJ-M=4Kw@mail.gmail.com>
 <87y1mxnvlo.fsf@linaro.org>
 <CABgObfZPZ9+CvpPOfaqgFa+hiqW-mYJZ_5AkJorujy0hMiwo6A@mail.gmail.com>
In-Reply-To: <CABgObfZPZ9+CvpPOfaqgFa+hiqW-mYJZ_5AkJorujy0hMiwo6A@mail.gmail.com>
From: Walid Ghandour <waleedjghandour@gmail.com>
Date: Wed, 12 Apr 2023 15:41:04 +0200
Message-ID: <CAEQMSUua3kKCfT5yMOLOdT+t39zzRphKpZS0DXBQLPfFQs6i-g@mail.gmail.com>
Subject: Re: AVX-512 instruction set
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: multipart/alternative; boundary="0000000000000d926505f923c3d0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=waleedjghandour@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000000d926505f923c3d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will try to work on this.

Regards,
Walid

Le mer. 12 avr. 2023 =C3=A0 15:30, Paolo Bonzini <pbonzini@redhat.com> a =
=C3=A9crit :

> On Wed, Apr 12, 2023 at 2:17=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@lin=
aro.org>
> wrote:
> > I don't think there is currently any active effort to add AVX512
> > support. There have been various GSoC projects to improve the x86 SIMD
> > emulation but I don't think they got merged.
>
> No, there isn't. However, the recent implementation of AVX in QEMU 7.2
> is designed to make AVX512 at least doable.
>
> Adding support for AVX512 would be a very large work (at least 1
> months full time plus time to get it merged), but not impossible. The
> tasks could be something like this:
>
> 1. EVEX prefix decoding for AVX and AVX2 instructions
> 2. operand broadcast
> 3. VEX encoded mask instruction: kmov, kadd, kxnor, etc
> 4. other instructions and permutations with mask operands and permutation=
s
> 5. opmask support including merging and zeroing
> 6. Disp8*N addressing mode
> 7. rounding control and exception suppression
>
> It's important that, at any given step, the new functionality is
> tested comprehensively.
>
> > > 62 f2 7d 48 18 0d fa 0c 00 00 vbroadcastss 0xcfa(%rip),%zmm1
> > >
> > > qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> > >
> > > I like to add support for broadcast and fmadd avx 512 instructions
> such as the following one:
> > >
> > > 62 e2 7d 48 b8 c9     vfmadd231ps %zmm1,%zmm0,%zmm17
>
> Both of these are using a small subset of AVX512 (step 1 above). Both
> vbroadcastss and vfmadd231ps are already implemented in QEMU, but not
> using ZMM registers.
>
> Unfortunately the base AVX512 functionality is large, and therefore
> the above tasks are all needed to claim support for AVX512. On the
> other hand, for historical reasons AVX512BW and AVX512VL extensions
> are separate but in practice they are easier to just implement at the
> same time as basic AVX512; my expectation is that they would come up
> almost for free with the rest of the work.
>
> Paolo
>
>

--0000000000000d926505f923c3d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I will try to work on this.<br></div><div=
 dir=3D"ltr"><br></div><div>Regards,</div><div>Walid</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 12 avr. 20=
23 =C3=A0=C2=A015:30, Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.c=
om">pbonzini@redhat.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Wed, Apr 12, 2023 at 2:17=E2=80=AFPM=
 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_=
blank">alex.bennee@linaro.org</a>&gt; wrote:<br>
&gt; I don&#39;t think there is currently any active effort to add AVX512<b=
r>
&gt; support. There have been various GSoC projects to improve the x86 SIMD=
<br>
&gt; emulation but I don&#39;t think they got merged.<br>
<br>
No, there isn&#39;t. However, the recent implementation of AVX in QEMU 7.2<=
br>
is designed to make AVX512 at least doable.<br>
<br>
Adding support for AVX512 would be a very large work (at least 1<br>
months full time plus time to get it merged), but not impossible. The<br>
tasks could be something like this:<br>
<br>
1. EVEX prefix decoding for AVX and AVX2 instructions<br>
2. operand broadcast<br>
3. VEX encoded mask instruction: kmov, kadd, kxnor, etc<br>
4. other instructions and permutations with mask operands and permutations<=
br>
5. opmask support including merging and zeroing<br>
6. Disp8*N addressing mode<br>
7. rounding control and exception suppression<br>
<br>
It&#39;s important that, at any given step, the new functionality is<br>
tested comprehensively.<br>
<br>
&gt; &gt; 62 f2 7d 48 18 0d fa 0c 00 00 vbroadcastss 0xcfa(%rip),%zmm1<br>
&gt; &gt;<br>
&gt; &gt; qemu: uncaught target signal 4 (Illegal instruction) - core dumpe=
d<br>
&gt; &gt;<br>
&gt; &gt; I like to add support for broadcast and fmadd avx 512 instruction=
s such as the following one:<br>
&gt; &gt;<br>
&gt; &gt; 62 e2 7d 48 b8 c9=C2=A0 =C2=A0 =C2=A0vfmadd231ps %zmm1,%zmm0,%zmm=
17<br>
<br>
Both of these are using a small subset of AVX512 (step 1 above). Both<br>
vbroadcastss and vfmadd231ps are already implemented in QEMU, but not<br>
using ZMM registers.<br>
<br>
Unfortunately the base AVX512 functionality is large, and therefore<br>
the above tasks are all needed to claim support for AVX512. On the<br>
other hand, for historical reasons AVX512BW and AVX512VL extensions<br>
are separate but in practice they are easier to just implement at the<br>
same time as basic AVX512; my expectation is that they would come up<br>
almost for free with the rest of the work.<br>
<br>
Paolo<br>
<br>
</blockquote></div></div>

--0000000000000d926505f923c3d0--

