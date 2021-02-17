Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907E031DBB2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 15:49:57 +0100 (CET)
Received: from localhost ([::1]:39610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCO9M-0000nP-LY
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 09:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1lCO8F-0000MH-Q5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 09:48:49 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:43775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1lCO8B-00017M-R2
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 09:48:47 -0500
Received: by mail-lj1-x22f.google.com with SMTP id a22so16435337ljp.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 06:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+WSOlerGpzCB9ffw2y1mCePwEzSxrlScYXH3gG+BwZ8=;
 b=wGnLkpYHFAJWrOYmvFH1PNhNr03AthIcJ9zM6GWBZF4IbxGPh6DSwGz8Oa36mjPZXk
 GyzPce5LTFbtzJr3aIEH57WwWPPqMw+yIhI918jI/xGL1BDQgYROXquJ/5uATv5gPEwJ
 VKboMa1M2o9Urc7QpDcEgofwBh2WH+EImE1XU4PG5eJ2po1X51U1CFpAiH+oVTHpDTy3
 /SNzvKUkENJ77vSZHdsXSkqydMEdkiclJ5/S1kd6mQxkCI4RVr3297n8+yE4o5mW8vn4
 W6m4kccCBk3523ooWfeJq5abOpeJnsK1wf4QZGwdLqfHrFM915yCbFoSVGtJOo1K6ZMP
 Exlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+WSOlerGpzCB9ffw2y1mCePwEzSxrlScYXH3gG+BwZ8=;
 b=E5xHdSgXRvEfUJQbZFS2opUEVPPkGSsPnmQYhICoSut3fsv05ZC7O9lo1jNBRsGL2F
 nKyFg/pDZkSyCT5fiULWq1ChgV94Pn2h3x4zxZ89ZNKbQYeOd9DaDWmzvI63VarFd9M+
 A5pvO3qeYTiP/8X5r7ccwfrth0x07YKg57xExVpTzsZ7EoE+V8dbBEj1bKi6OYghBwvY
 AT4F9/SE1DyC27dPCd+JD8+kuY5sF6hI6XUjyHLxWIadpRzu1dGc5itcI8T3MnjhFFF2
 hE3Wn10UJRApcMOUUsxYqKQKMFEWbaQb4LztiIFlQpdDuGK1kz7lSXgPknZQhgGNi2ZD
 wREQ==
X-Gm-Message-State: AOAM533wlq1fM5Tq1xxlrNoDy3Mxr+pb8FkGSO15A0+jwmCNJS4LRayd
 PPPNMLGtuN3mIC8e9/oLBBirDsQ19TLYL5LpPuMI6g==
X-Google-Smtp-Source: ABdhPJzqsiw+tERgcFSn67Q+dAGDgBajHNhJJ2dd3sIePcZcUhdDXVAUZ/AlVfY82cC0KYWnoM4lB5JxMh1OucBOyVE=
X-Received: by 2002:a2e:720a:: with SMTP id n10mr1906760ljc.215.1613573317585; 
 Wed, 17 Feb 2021 06:48:37 -0800 (PST)
MIME-Version: 1.0
References: <87y2fmsrxw.fsf@linaro.org>
In-Reply-To: <87y2fmsrxw.fsf@linaro.org>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 17 Feb 2021 15:48:26 +0100
Message-ID: <CAHFG_=VHqTORBGshu5CpC83h3EtFeD1pPteftC4UfSUP9OyUbQ@mail.gmail.com>
Subject: Re: Measuring the impact of buffer copy for virtio-gpu guests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006a034a05bb895032"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=francois.ozog@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mikhail Golubev <Mikhail.Golubev@opensynergy.com>,
 Vasyl Vavrychuk <Vasyl.Vavrychuk@opensynergy.com>,
 Zhao Jiancong <chou.kensou@jp.panasonic.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Griffin <peter.griffin@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006a034a05bb895032
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Feb 2021 at 15:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

> Hi Gerd,
>
> I was in a discussion with the AGL folks today talking about approaches
> to achieving zero-copy when running VirGL virtio guests. AIUI (which is
> probably not very much) the reasons for copy can be due to a number of
> reasons:
>
>   - the GPA not being mapped to a HPA that is accessible to the final HW
>   - the guest allocation of a buffer not meeting stride/alignment
> requirements
>   - data needing to be transformed for consumption by the real hardware?
>
> any others? Is there an impedance between different buffer resource
> allocators in the guest and the guest? Is that just a problem for
> non-FLOSS blob drivers in the kernel?
>
> I'm curious if it's possible to measure the effect of these extra copies
> and where do they occur?

Making a good benchmark is going to be difficult. Copying has big impacts
on:
- L3 pressure (pure cost of evictions and loss of "sticky" cache lines
benefits)
- Memory request queue and prefetching
- TLB pressure
Conversely, as we are in VM environments the pressure that other VMs have
on those resources, the jitter of the bounce copies will grow.
(lesson learnt from high speed - > 100Gbps - user pace networking)
All this to say that a unitest may be wrongly give impression that copy is
not that costly.

> Do all resources get copied from the guest buffer to
> host or does this only occur when there is a mismatch in the buffer
> requirements?
>
> Are there any functions where I could add trace points to measure this?
> If this occurs in the kernel I wonder if I could use an eBPF probe to
> count the number of bytes copied?
>
> Apologies for the wall of questions I'm still very new to the 3D side of
> things ;-)
>
> --
> Alex Benn=C3=A9e
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Linaro Edge & Fog Computi=
ng Group*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--0000000000006a034a05bb895032
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 17 Feb 2021 at 15:13, Alex Be=
nn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-l=
eft-color:rgb(204,204,204);padding-left:1ex">Hi Gerd,<br>
<br>
I was in a discussion with the AGL folks today talking about approaches<br>
to achieving zero-copy when running VirGL virtio guests. AIUI (which is<br>
probably not very much) the reasons for copy can be due to a number of<br>
reasons:<br>
<br>
=C2=A0 - the GPA not being mapped to a HPA that is accessible to the final =
HW<br>
=C2=A0 - the guest allocation of a buffer not meeting stride/alignment requ=
irements<br>
=C2=A0 - data needing to be transformed for consumption by the real hardwar=
e?<br>
<br>
any others? Is there an impedance between different buffer resource<br>
allocators in the guest and the guest? Is that just a problem for<br>
non-FLOSS blob drivers in the kernel?<br>
<br>
I&#39;m curious if it&#39;s possible to measure the effect of these extra c=
opies<br>
and where do they occur? </blockquote><div>Making a good benchmark is going=
 to be difficult. Copying has big impacts on:</div><div>- L3 pressure (pure=
 cost of evictions and loss of &quot;sticky&quot; cache lines benefits)</di=
v><div>- Memory request queue and prefetching</div><div>- TLB pressure</div=
><div>Conversely, as we are in VM environments the pressure that other VMs =
have on those resources, the jitter of the bounce copies will grow.</div><d=
iv>(lesson learnt from high speed - &gt; 100Gbps - user pace networking)</d=
iv><div>All this to say that a unitest may be wrongly give impression that =
copy is not that costly.</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border=
-left-color:rgb(204,204,204);padding-left:1ex">Do all resources get copied =
from the guest buffer to<br>
host or does this only occur when there is a mismatch in the buffer<br>
requirements?<br>
<br>
Are there any functions where I could add trace points to measure this?<br>
If this occurs in the kernel I wonder if I could use an eBPF probe to<br>
count the number of bytes copied?<br>
<br>
Apologies for the wall of questions I&#39;m still very new to the 3D side o=
f<br>
things ;-)<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px" valign=
=3D"top"><img src=3D"https://drive.google.com/a/linaro.org/uc?id=3D0BxTAygk=
us3RgQVhuNHMwUi1mYWc&amp;export=3Ddownload" width=3D"96" height=3D"53"></td=
><td valign=3D"top"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0"=
><tbody><tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;=
;white-space:nowrap;font-size:9pt;padding-top:0px;color:rgb(87,87,87)" vali=
gn=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=A9d=C3=A9ri=
c Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0<i>=
Director Linaro Edge &amp; Fog Computing Group</i></td></tr><tr><td style=
=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;f=
ont-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a=
 value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><=
br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87)=
;text-decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0=
<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td=
></tr></tbody></table></td></tr></tbody></table></div></div></div></div></d=
iv><div><div><br style=3D"font-size:small"></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div></div=
>

--0000000000006a034a05bb895032--

