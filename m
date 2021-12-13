Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05EC4737A9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 23:37:29 +0100 (CET)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwtwm-0006Ly-8p
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 17:37:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mwttt-0004sS-5O; Mon, 13 Dec 2021 17:34:29 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=45637
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mwttr-0000wT-ER; Mon, 13 Dec 2021 17:34:28 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id x32so41863623ybi.12;
 Mon, 13 Dec 2021 14:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4hXfOZmpFUioqobW2Gk5O70L0Umoxu3UUJjNGr7PuPU=;
 b=QZMrxjIJ8VVVeuHBpmc1iKoA1/Xlu2RDWz7RE45Id5i1Y1c0cDCu455vRfC+sWEFv2
 nLJLvgtGCCM+tixMjYm6XGhC0NzGkjhhx4/aNperPjybb3hJCTr8C7VXZ7JkzSgY4Og/
 JlS2xOxme5a37sY20KwXCCdNXrmNoF8w15aS3MpLkiadHGQvTV4uBDuJz+pJ/wTlip9s
 CVwituTh7Zzn2P1h5fVu9PRKa1g+FmYksWCpI2G3mxO32AwkQzv8NGExW64iBJKIKqhW
 UuY+G2F4a8al3VDF5QBKIe8cVsnevj3rI6e4H9o6SoEyfHKs+fyMoTzDtBm1SfxGSh4P
 0SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4hXfOZmpFUioqobW2Gk5O70L0Umoxu3UUJjNGr7PuPU=;
 b=TiXZ22+AIM0gy9uSwxpqjfu4mcGzRUVTic2uwIAITGTMRVjrPWm2z2VBb9uni1PmXT
 oHuhbd3gM7jGExYsFLmMKbq4Vbo2xEyVjt8qRRIYr/LhTwsfyVk+hiEnBka0wU/sE9bP
 Fgar1DG1RQKXXgh1P0BPkAQxN0+hlp6UZMcaLKN5LT9DemZlTRaGKYB+SlbKjsylLsIH
 PVuTeu0MlrFc3jK1Edbubd/WLKE9DWd0hKy1CNQe/U6hRHOK79djFD15igzCT3N3wE32
 G/z7pj7V8Ln4UU5ZIYICWpE9NG9zCgLWJdrpU4iH/lJuyYcu2Vo1B3A+O8/ow9hINcdB
 BAAA==
X-Gm-Message-State: AOAM53267tvS17jWZbaRUQ7IfV11njl9uLXl79nJR6e1XjtV/eOmsvXj
 DMws0XwrR68m1hai6mREeVxO4QeVe/bVUgkyN5I=
X-Google-Smtp-Source: ABdhPJwHqAkiAzzPH0RJVPClabIPgb48mvV93u94djh8HNPh8/+H6UNdF7wQtDmJZ+lePanSRCmRkAmzzZD27xnkU0o=
X-Received: by 2002:a25:abe2:: with SMTP id v89mr1685233ybi.521.1639434866048; 
 Mon, 13 Dec 2021 14:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20211213182449.7068-1-bslathi19@gmail.com>
 <87wnk8i4x7.fsf@linaro.org>
 <d0f649f7-4d5d-9b15-829c-d5cef2137797@linaro.org>
In-Reply-To: <d0f649f7-4d5d-9b15-829c-d5cef2137797@linaro.org>
From: Byron Lathi <bslathi19@gmail.com>
Date: Mon, 13 Dec 2021 16:34:14 -0600
Message-ID: <CAJ_MG7qqySDDBgi0WdcmK_q2v=BzNCKpnzRL9T9c7Cpq9WugWA@mail.gmail.com>
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d2c36005d30eac30"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bslathi19@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d2c36005d30eac30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The goal for me was to eventually add the SAMA5D, so I might have made some
assumptions that were not correct for all devices. My apologies for the
typos.
I will add those changes and re-submit.

On Mon, Dec 13, 2021 at 3:46 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 12/13/21 1:02 PM, Alex Benn=C3=A9e wrote:
> >> +    cpu->midr =3D 0x410fc0f1;
> >
> > hmm wikipedia lists the part number as 0xc05 (and the a15 as 0xc0f) but
> > I can't find the actual value in the TRM.
>
> https://developer.arm.com/documentation/ddi0434/c
>
> has exactly this value at the top of table 4-9.
>
> >> +    cpu->reset_fpsid =3D 0x41023051;
> >
> > I think for the a5 the FPU is optional so maybe we need a cpu option
> > here? Or maybe just assume it's enabled on QEMUs version?
>
> Yeah, there's no entry for fpsid in the above manual.
>
> >> +    cpu->isar.id_mmfr0 =3D 0x00100103;
> >
> > the TRM says [11:8] Outermost shareability 0x0 L1 cache coherency not
> supported.
>
> Again, this does match table 4-9.
>
>
> r~
>

--000000000000d2c36005d30eac30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The goal for me was to eventually add the SAMA5D, so =
I might have=C2=A0made some assumptions that were not correct for all devic=
es. My apologies for the typos.</div><div>I will add those changes and re-s=
ubmit.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Dec 13, 2021 at 3:46 PM Richard Henderson &lt;<a href=3D"mail=
to:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 12/13/21 1:02 PM, Alex Benn=C3=A9e wrote:<br>
&gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;midr =3D 0x410fc0f1;<br>
&gt; <br>
&gt; hmm wikipedia lists the part number as 0xc05 (and the a15 as 0xc0f) bu=
t<br>
&gt; I can&#39;t find the actual value in the TRM.<br>
<br>
<a href=3D"https://developer.arm.com/documentation/ddi0434/c" rel=3D"norefe=
rrer" target=3D"_blank">https://developer.arm.com/documentation/ddi0434/c</=
a><br>
<br>
has exactly this value at the top of table 4-9.<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;reset_fpsid =3D 0x41023051;<br>
&gt; <br>
&gt; I think for the a5 the FPU is optional so maybe we need a cpu option<b=
r>
&gt; here? Or maybe just assume it&#39;s enabled on QEMUs version?<br>
<br>
Yeah, there&#39;s no entry for fpsid in the above manual.<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_mmfr0 =3D 0x00100103;<br>
&gt; <br>
&gt; the TRM says [11:8] Outermost shareability 0x0 L1 cache coherency not =
supported.<br>
<br>
Again, this does match table 4-9.<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--000000000000d2c36005d30eac30--

