Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271395B535A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 07:13:45 +0200 (CEST)
Received: from localhost ([::1]:59032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXblP-0002eU-Lp
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 01:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1oXbjh-0001GJ-EX
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 01:11:57 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:35527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1oXbje-0005Vm-0k
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 01:11:57 -0400
Received: by mail-ua1-x92b.google.com with SMTP id b7so2734052uas.2
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 22:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BglN0t/3oNb1YOzAoG+iKfL+A+QuZEDZvA8hmAFyWY0=;
 b=ZW7rPjOF6tdPHAFaRzSD/JBKTZQPt+S3Q+H20HnCHD+Ir2K5s93lruIj7odrz2p4uG
 F+89vy9GKSj61u1+STyRhK2T7Uiyivdhdxw81BnIV2apl1Up6DHgi6ckoFdnIv6gv3kV
 KELmWa0gNxGyo7BNRPNTm/+RjUGAAfmXEu0jbfvkzWbvzqqCu1mL1iH+pyPzx6VJM2z1
 Q8BXoU8MNdGGaBKzbcF5GN1kSqb77PuzIYSVzUd0BJu7SYgYT8K4z0hUh7orIMNE4TDU
 Xb9rKU0vsEpFJoHXL1OkaVSTGS5iNeZBUWKHqMGdrps6duKFmT9ac99HDgDdy22kzh2T
 NYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BglN0t/3oNb1YOzAoG+iKfL+A+QuZEDZvA8hmAFyWY0=;
 b=MOioSeyMPsC4zcKFjZ9A6gx6zUAOTr4Y2P2ZA8f3eOVFAylNYfR5oLsMQrcrLrsWcn
 o1kjHUNGk0XJLy17mlFl35h/PMPaK5guqtmft//5mVS+jEsEmRTW606JoH5t95ch/cvQ
 AOCpy8v6Tk9QadR/KA92fGMF5Nd9wOG6qwNz5fJzZs7maML7bLJHmEFiGOk8Du/YPUJB
 ztS3S/uVCMXRT46jEYO+Eud2m8Kvw7dINxixM+9CA7ahFpH1Fn9ruAz2+AxI/CoWWNLh
 oAqsPr4/3llyB+ZJOjfXS0kXnHCmDPvidyNUzNnRaWhRqjMhpXvBowhyYEGvQu8MzzSl
 5j4w==
X-Gm-Message-State: ACgBeo14WuxAAJZdTMiLl5ApxzbfXU7SL217JoCbsmXZ9g15sW3fHUd/
 Ovt2MkizAjMfBuNnZF5uMOobwqeAw53gzCp5tSI=
X-Google-Smtp-Source: AA6agR7l6QAAM/Ao7wGFOEj5yy91x4RR2WeXaevkD3FShQaART0pg+sKmKrsHV+lspSGTKSm3qvnxGyUAnlQ9C/CjhQ=
X-Received: by 2002:ab0:6914:0:b0:3b0:452b:413c with SMTP id
 b20-20020ab06914000000b003b0452b413cmr7929373uas.93.1662959512425; Sun, 11
 Sep 2022 22:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <DM5PR06MB2537E50667993338ED339A8FE6459@DM5PR06MB2537.namprd06.prod.outlook.com>
In-Reply-To: <DM5PR06MB2537E50667993338ED339A8FE6459@DM5PR06MB2537.namprd06.prod.outlook.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Mon, 12 Sep 2022 08:11:16 +0300
Message-ID: <CAK4993hfQfFVJiFRtoFPwJn1bef3R1gxZJuC=X+6n1m6_zik_A@mail.gmail.com>
Subject: Re: Question about pending patch for AVR_GPIO.
To: Hee-cheol Yang <heecheol.yang@outlook.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "niteesh.gs@gmail.com" <niteesh.gs@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000003998405e873efd0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=mrolnik@gmail.com; helo=mail-ua1-x92b.google.com
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

--00000000000003998405e873efd0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heecheol Yang.

I suggest rebasing your patch to the master.

Regards,
Michael Rolnik

On Sun, Sep 11, 2022 at 7:47 PM Hee-cheol Yang <heecheol.yang@outlook.com>
wrote:

> Hello.
>
> First of all, I am very sorry for my late response for following
> patchworks for AVR gpio.:
>
>    - https://patchew.org/QEMU/20210313165445.2113938-1-f4bug@amsat.org/
>
>
>
> I couldn=E2=80=99t check works for several years because of my personal r=
easons.
>
>
>
> If I or anyone want to continue these works, can I ask what should I do
> now to continue works?
>
> Should I continue additional works from the original source commit or
> after merging our patches into recent master branch?
>
>
>
> I apologize my fault again.
>
> Thanks a lot.
>
>
>
> Best regards
>
> Heecheol Yang.
>


--=20
Best Regards,
Michael Rolnik

--00000000000003998405e873efd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Heecheol Yang.<div><br></div><div>I suggest rebasing yo=
ur patch to the master.</div><div><br></div><div>Regards,</div><div>Michael=
 Rolnik</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sun, Sep 11, 2022 at 7:47 PM Hee-cheol Yang &lt;<a href=3D"=
mailto:heecheol.yang@outlook.com">heecheol.yang@outlook.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"ms=
g-3764367223738732380">





<div lang=3D"KO" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-3764367223738732380WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">First of all, I am very sorry f=
or my late response for following patchworks for AVR gpio.:<u></u><u></u></=
span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"m_-3764367223738732380MsoListParagraph" style=3D"margin-left:2=
pt">
<span lang=3D"EN-US"><a href=3D"https://patchew.org/QEMU/20210313165445.211=
3938-1-f4bug@amsat.org/" target=3D"_blank">https://patchew.org/QEMU/2021031=
3165445.2113938-1-f4bug@amsat.org/</a><u></u><u></u></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I couldn=E2=80=99t check works =
for several years because of my personal reasons.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If I or anyone want to continue=
 these works, can I ask what should I do now to continue works?
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Should I continue additional wo=
rks from the original source commit or after merging our patches into recen=
t master branch?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I apologize my fault again.<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks a lot.<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Heecheol Yang.<u></u><u></u></s=
pan></p>
</div>
</div>

</div></blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--00000000000003998405e873efd0--

