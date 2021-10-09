Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC6427789
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 07:33:57 +0200 (CEST)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZ4zc-0000EN-A4
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 01:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t0rr3sp3dr0@gmail.com>)
 id 1mZ4yX-00081T-Fb
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 01:32:49 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:33431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <t0rr3sp3dr0@gmail.com>)
 id 1mZ4yV-0006JE-R8
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 01:32:49 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id a9so7793285qvf.0
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 22:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:content-transfer-encoding:mime-version:subject:from
 :in-reply-to:cc:date:message-id:references:to;
 bh=9mk55v9bB91oNa1iA0zhsbvdZfxneKkNme/SNy0fB7g=;
 b=LriBXfm2oLSJom7zo96MzJdTnA+XNYMJMIyPd70TJO/mrbMXEJk8uQenxufMIFI8b6
 5l2uEELtJy+94rPv0NZqDeLi6+NEZCBsW3K2+0tDM5uttPm+jad5QULZa5Nraf0p9gJl
 M5dWHBpa1o4QMXv2Nwxn++mlL+Zj9yA47mHl69Q5u0xbzVZESOJUs2c8xpObTmEyZ2Rs
 vCE5mC3Mwth9uXKIdKqjjCF8dZmpsgdr5AcwnJHk//07DmMnrSAD3X8dzy/jZVF/covo
 u0ZdeZGMXTY+Iuw1OSLxABlKIeF/xbQhB8941ctfQGp1srhIfGK7tMtOn3TBODEK6oun
 jccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:content-transfer-encoding:mime-version
 :subject:from:in-reply-to:cc:date:message-id:references:to;
 bh=9mk55v9bB91oNa1iA0zhsbvdZfxneKkNme/SNy0fB7g=;
 b=7/3CD6qGDDIIs+nb7nE+oJ3ydS9WMNH7Zet4N+HWDeipQfu/nAt6xeiAuN70pGFU5I
 D70+ZuSDSDP5DQlEKnl0WvUt6618Abya4nvPb5ZyXE1wAfbhtxLKyl5Xq+6+sPYd+qag
 QXTFSmBx6D8i+B2ngOHx44EVY3mlBRTFrJf2awpFkQCFVyScnNYrziAdHWA3melhOg4v
 92kdeEc1Z/y+LF45hk+sJmA9o1ZVduQ6ClRrzUYDhpCpVhUeNX89bvPs/jImsJSK52g6
 3Wa5VeZ7Q1utMJ8KFbNkYdAYPba2PM9bXarya53qjubqseVoWnFa2+Qj+sVxLHu7/JzS
 uwZg==
X-Gm-Message-State: AOAM531Ln/a+qenv6Z/X7VtRPIH62pYLa1qLlyMeerA+IFgEwFoHJsza
 w9DZJLy7yaFGkfaq4UeJo1c=
X-Google-Smtp-Source: ABdhPJwmrzmrdh/5+mCpqGqkXJ2RG5ouSRZ25n4qzEWarhvzjMggYpt5WYCVZbvpCXvDG7Bdu1VMmA==
X-Received: by 2002:a05:6214:19eb:: with SMTP id
 q11mr14242827qvc.0.1633757565974; 
 Fri, 08 Oct 2021 22:32:45 -0700 (PDT)
Received: from smtpclient.apple ([191.187.160.179])
 by smtp.gmail.com with ESMTPSA id l1sm929197qti.94.2021.10.08.22.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 22:32:45 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-F2707B7D-3DBC-4D2C-8093-2946A45AF061
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] hw/misc: applesmc: use host osk as default on macs
From: =?utf-8?Q?Pedro_T=C3=B4rres?= <t0rr3sp3dr0@gmail.com>
In-Reply-To: <ada1704c-b1c7-ec48-bc58-2de8d3ed466c@redhat.com>
Date: Sat, 9 Oct 2021 02:32:42 -0300
Message-Id: <E9594914-E417-4F3B-8352-91D0A40E7E70@gmail.com>
References: <ada1704c-b1c7-ec48-bc58-2de8d3ed466c@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: iPhone Mail (19A348)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=t0rr3sp3dr0@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 MIME_QP_LONG_LINE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, rene@exactcode.de,
 jan.kiszka@siemens.com, qemu-devel@nongnu.org, agraf@suse.de,
 "Gabriel L. Somlo" <gsomlo@gmail.com>, suse@csgraf.de, afaerber@suse.de,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail-F2707B7D-3DBC-4D2C-8093-2946A45AF061
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Paolo and Phil,

I understand you concerns regarding the license that Apple open-source code i=
s distributed.

If I restart from scratch and implement this feature based only on VirtualBo=
x code, that is distributed under GPLv2, would it be fine?

Best regards,
Pedro T=C3=B4rres

> On Oct 8, 2021, at 3:54 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> =EF=BB=BFOn 08/10/21 14:03, Phil Dennis-Jordan wrote:
>> 1. Licensing
>> Given that the code it's heavily based on is copyright Apple Computer Inc=
., licensed under APSL, is it safe including it in qemu as is?
>> If the integrated code is going to be quite so "directly inspired" (down t=
o the inconsistent struct definition style and mixing unrelated constants in=
 the same anonymous enum), perhaps at minimum place it in its own isolated s=
ource file with appropriate notice?
>=20
> Yeah, this should be reverted.
>=20
> Pedro, I understand that you stated it was "based on code from Apple" but y=
ou also said (by including Signed-off-by) that
>=20
> ---
> (a) The contribution was created in whole or in part by me and I
>    have the right to submit it under the open source license
>    indicated in the file; or
>=20
> (b) The contribution is based upon previous work that, to the best
>    of my knowledge, is covered under an appropriate open source
>    license and I have the right under that license to submit that
>    work with modifications, whether created in whole or in part
>    by me, under the same open source license (unless I am
>    permitted to submit under a different license), as indicated
>    in the file; or
> ---
>=20
> and this is not true.
>=20
> Thanks very much,
>=20
> Paolo

--Apple-Mail-F2707B7D-3DBC-4D2C-8093-2946A45AF061
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><meta http-equiv=3D"conten=
t-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr">Hey Paolo an=
d Phil,</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">I understand you co=
ncerns regarding the license that Apple open-source code is distributed.</di=
v><div dir=3D"ltr"><br></div><div dir=3D"ltr">If I restart from scratch and i=
mplement this feature based only on VirtualBox code, that is distributed und=
er GPLv2, would it be fine?<br><br><div dir=3D"ltr">Best regards,</div><div i=
d=3D"AppleMailSignature" dir=3D"ltr">Pedro T=C3=B4rres</div><div dir=3D"ltr"=
><br><blockquote type=3D"cite">On Oct 8, 2021, at 3:54 PM, Paolo Bonzini &lt=
;pbonzini@redhat.com&gt; wrote:<br><br></blockquote></div><blockquote type=3D=
"cite"><div dir=3D"ltr">=EF=BB=BF<span>On 08/10/21 14:03, Phil Dennis-Jordan=
 wrote:</span><br><blockquote type=3D"cite"><span>1. Licensing</span><br></b=
lockquote><blockquote type=3D"cite"><span>Given that the code it's heavily b=
ased on is copyright Apple Computer Inc., licensed under APSL, is it safe in=
cluding it in qemu as is?</span><br></blockquote><blockquote type=3D"cite"><=
span>If the integrated code is going to be quite so "directly inspired" (dow=
n to the inconsistent struct definition style and mixing unrelated constants=
 in the same anonymous enum), perhaps at minimum place it in its own isolate=
d source file with appropriate notice?</span><br></blockquote><span></span><=
br><span>Yeah, this should be reverted.</span><br><span></span><br><span>Ped=
ro, I understand that you stated it was "based on code from Apple" but you a=
lso said (by including Signed-off-by) that</span><br><span></span><br><span>=
---</span><br><span>(a) The contribution was created in whole or in part by m=
e and I</span><br><span> &nbsp;&nbsp;&nbsp;have the right to submit it under=
 the open source license</span><br><span> &nbsp;&nbsp;&nbsp;indicated in the=
 file; or</span><br><span></span><br><span>(b) The contribution is based upo=
n previous work that, to the best</span><br><span> &nbsp;&nbsp;&nbsp;of my k=
nowledge, is covered under an appropriate open source</span><br><span> &nbsp=
;&nbsp;&nbsp;license and I have the right under that license to submit that<=
/span><br><span> &nbsp;&nbsp;&nbsp;work with modifications, whether created i=
n whole or in part</span><br><span> &nbsp;&nbsp;&nbsp;by me, under the same o=
pen source license (unless I am</span><br><span> &nbsp;&nbsp;&nbsp;permitted=
 to submit under a different license), as indicated</span><br><span> &nbsp;&=
nbsp;&nbsp;in the file; or</span><br><span>---</span><br><span></span><br><s=
pan>and this is not true.</span><br><span></span><br><span>Thanks very much,=
</span><br><span></span><br><span>Paolo</span><br><span></span><br></div></b=
lockquote></div></div></body></html>=

--Apple-Mail-F2707B7D-3DBC-4D2C-8093-2946A45AF061--

