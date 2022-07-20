Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C7057BB87
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 18:39:50 +0200 (CEST)
Received: from localhost ([::1]:54022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oECjl-00038i-BR
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 12:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1oECiC-0001FM-Fx
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 12:38:12 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:39746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1oECiA-0000nF-OH
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 12:38:12 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-10c0119dd16so36829417fac.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 09:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Efd9TTh8mvxRbXKgVCWjMM9mpvaMbP+69q+fpVHiWOM=;
 b=qIWm3qlpx/p8j02SECdbPjhPBveG9qqZp/9FefeleyN+8Nu1hhiPbFmoFATlC0pFNi
 IIR6roQASlQkwqpOx8m0qo9ZfA+i38Jc0k3cUHomDrIyA9dnGPWpw4mFNNXi12/DiTwt
 ep14hW8b8EoNkUdz8uLceJ5rcng+t6XJRtsc+KrZ1dpa6SGKa7mnCMGqcX1bAi71/CvY
 ZtnJy4ey0lCw1lIKnPwS/JXFLB8QZw8vKtK04fpZneEj4P6KfM7C/nr8fcXfolfhHePb
 ZPhSgvZgbVBbMSM8CnyZhuNnEF0A3EEfwA4Kdl/NARrnwosmCwpXhXYDAnYDRbB38xEn
 YufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Efd9TTh8mvxRbXKgVCWjMM9mpvaMbP+69q+fpVHiWOM=;
 b=TcBzKJnlsccKaH2MgsA/U6Six/PaBhwAL9UmEtgSC4/Kjt27g1i7otr6dNt2HMVaUR
 OFcX0MQnuftpEeQLOVIMrHwkNn8pbAf6wjNxLZMOsdSJn83UBi2daIhgqyeJIepg2rjQ
 5B3Si7fz5vX1HQtuX6t15XAdn1C1LfwWrcE8MVLE8eBj57QtO76nfoikHzO31tAQc+5D
 lza8H8adqBZS3plNgqpu6tvOftfMBTQheU7VVqnLrUWKkgW2BtXXXIZGO/WIQNM9Ixah
 cba2kUnyTIvrErWzvuCz1fT5phG2//pLWA39vQuTuRX986LFnUatXwuHIes7HpJrsW3A
 CQgA==
X-Gm-Message-State: AJIora+xMAW9OGW5z7sHIPv7gzo6uQsEc2iC+8AlSqgEQf9EiHU6HDN7
 kMHUsOnOCLAoFvNMvSKsiwILiSbIb2WogI2i/do=
X-Google-Smtp-Source: AGRyM1sojZtIzsRq/NKrfIPTZyt2yOLoY2jC+xiU+vmrLyTWT1hNNeo7fbMpMfqONnDQgIEfQj/wdIqYEb9438gButA=
X-Received: by 2002:a05:6870:612c:b0:10b:fde7:773f with SMTP id
 s44-20020a056870612c00b0010bfde7773fmr2936230oae.82.1658335089221; Wed, 20
 Jul 2022 09:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp-qoQrEo2D_H=39AeJVtZJfmNUuFRfTdQr6LqUpjp+FEQ@mail.gmail.com>
 <87y1woyxvo.fsf@linaro.org>
In-Reply-To: <87y1woyxvo.fsf@linaro.org>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Wed, 20 Jul 2022 12:37:58 -0400
Message-ID: <CAK7rcp-Ts=3JNoYRak-Zddb0NDjdgSqbGD32xFEguw0yLqydyw@mail.gmail.com>
Subject: Re: Access target TranslatorOps
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e9628705e43f393e"
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e9628705e43f393e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That I know of, the TCG plugins do not allow me to feed the QEMU instance
dynamically changing opcodes. I wouldn't use TranslatorOps if I don't have
to. I want to facilitate a use case in which the contents of the target
being emulated are changing, but it is not a self modifying target. I have
to query and interact with the TCG to find out what opcodes are supported
or not.

On Wed, Jul 20, 2022 at 4:46 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Kenneth Adam Miller <kennethadammiller@gmail.com> writes:
>
> > Hello,
> >
> > I would like to be able to, from the linux-user/main.c, access the
> target's registered TranslatorOps instance. How would I
> > do that when 1) the TCG is correctly initialized and ready to run 2)
> > before QEMU starts to run or when it is safely paused?
>
> Why would you want to mess with the TranslatorOps?
>
> If you want to do some sort of analysis you might want to consider:
>
>   https://qemu.readthedocs.io/en/latest/devel/tcg-plugins.html
>
> At which point you can hook into any translation or individual
> instructions.
>
> --
> Alex Benn=C3=A9e
>

--000000000000e9628705e43f393e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That I know of, the TCG plugins do not allow me to feed th=
e QEMU instance dynamically changing opcodes. I wouldn&#39;t use Translator=
Ops if I don&#39;t have to. I want to facilitate a use case in which the co=
ntents of the target being emulated are changing, but it is not a self modi=
fying target. I have to query and interact with the TCG to find out what op=
codes are supported or not.</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Jul 20, 2022 at 4:46 AM Alex Benn=C3=A9e=
 &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Kenneth Adam Miller &lt;<a href=3D"mailto:kennethadammiller@gmail.com" targ=
et=3D"_blank">kennethadammiller@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hello,<br>
&gt;<br>
&gt; I would like to be able to, from the linux-user/main.c, access the tar=
get&#39;s registered TranslatorOps instance. How would I<br>
&gt; do that when 1) the TCG is correctly initialized and ready to run 2)<b=
r>
&gt; before QEMU starts to run or when it is safely paused?<br>
<br>
Why would you want to mess with the TranslatorOps?<br>
<br>
If you want to do some sort of analysis you might want to consider:<br>
<br>
=C2=A0 <a href=3D"https://qemu.readthedocs.io/en/latest/devel/tcg-plugins.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://qemu.readthedocs.io/en/la=
test/devel/tcg-plugins.html</a><br>
<br>
At which point you can hook into any translation or individual instructions=
.<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--000000000000e9628705e43f393e--

