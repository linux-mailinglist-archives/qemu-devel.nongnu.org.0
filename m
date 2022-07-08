Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE69C56B71A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:19:06 +0200 (CEST)
Received: from localhost ([::1]:52114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9l4j-0005zw-AZ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.frederic@yahoo.fr>)
 id 1o9l2e-0004nN-16
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:16:57 -0400
Received: from sonic312-25.consmr.mail.ir2.yahoo.com ([77.238.178.96]:40967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad.frederic@yahoo.fr>)
 id 1o9l2b-0005T6-0y
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s2048;
 t=1657275402; bh=T+3KIh3yqJO6AQ1Miyu/ZXt+Jvp6rBhOBFc3AiXpE7s=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=nl37D9lbmSjolAK/uPtQs2guflP7dZ6AYzxw/RUssgsPnXAx7i+t47/u4Bv3XKL4sC3He/PHapRaJo20Rl+iVvjo7zUzGF+RzTutZPEs/OMQKsiZefOwtl6OtGj1/wBUqBxVvZN+fo8GBk76M+Yz1TiU86K54/Bw9oAX33RDtEpaQZApsfAksVDoz7dvZcxNgKJBYrbWIFzECFtSv3j3YPzfv6y4d53+L8eJaZHbpqRHP2+Tmk2n0KOrESSMJZvS6iMspHROz2EAyJxyfBxdHtC5yUGFEEc/LBu9Idx8hNNLysDWzLP5BytfKUNambQzhFvmy83eW5dL8cUJemN9/g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1657275402; bh=H78X4axVuQcmy+IViZmEdfmORUWD8mjyzeSHeMw5z5e=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=gIkvWUgMyZLXi1ddRvgGeLQJpJNxcO5B4nP/u47qCSmZjLsK+Z7bwfV6l7FNNac0hb8ugk3avUSZxzVjpG43ggiOngXUOws47oGuTQ37lHu35BGZ+JbE6JGqGQN+HtlpLi7Kggjrbn4YnkLovWI2zqFTjhy2EG8XTKhce+3sInFdebQK2tditZZgq+pudBkDJ+TdMsCFa2Wb0BIS2IUPnqVbA9yUdXY/c9vjEVSujDfh3T3hdtLk49dwfYiEz6vHPGxd5gVb4Xyzyns1WK7r+0ksh3gMpZ4rdJi4xoGwG8jDsDpULpJc0hEO11bao/b47fBIC9KTVT9Wiri+nMyibg==
X-YMail-OSG: rWZti5gVM1nvwfm2iZ_EskUpctqdICEoCOSCUDAiqK0A.yTAZR_Qzw8ytuR5K4m
 VTgoFzM.w645g.vBxj5bDHB.gHot8a1GYcbdfHzQpvMCbgxs2sin4DhbwJu77Wc.WTQ_uzwnmotZ
 p.32zDvm55YyQqhTHf0pVC4hCrw6DFnzk9L6bG7cvU2YA.qQTneGUejXRi1QTT74NNq2h3wpmV6i
 9lDWWDitC2RC_xMGk9Jkb0tIMKoufka5xA3XcbRCwL9G31jn.KkolOIwJ7ACADKqv2gZgJLfzSTh
 niwig.bbfvYbr.QI2toqUTPjZ9INERMXsUm_Cl5eYAGirjBBgKgBcWmQ5GBkHONxP8MgpxHerCZl
 4Mcer27TipSUvCIWOS72obCuihiDWPvcHOhPTPJPhGFSqXW4Kp3jxWgqUCOlFB5OZKkq_CepzDQ8
 zovc9BSYBim_pWNhSkeIhLwJqoldX95Q1SzVygJj1rM1SVwmPh0VKfvUTAwnR8VGmIOoRxfr8T76
 8JXcPXOIXc3u_q33mjjlivlV5DqK945B7djGrsqqFmc5uwZAzutJ1BaBW3j5Yimry8gUd9dTMRV7
 iilD6Y1P7xopQGX_Qohorxex.FhBnN4KgU3kJE2ejSeiFM0Mk9hBFYQYXXlWTj_PELbNUkZgA2PK
 YlConMk9WGlaNhrro8Ps7XLgssGiEufyNqvSFJIxLoaqPAKRhr.xyS.T2PHi0jigsvHwqJDEyKNa
 2n5do0IRwBKgZOpMAaKoa8qvVe9_.30sNXb3iHs5PQvzEalKQt.7ffg9nDCo2tQewqGRILNq4iO9
 OUaBlZSGSvsUNysoY.B13dMzX8nUUISqluFxoSUJDsQLXe21x6AKHN4LniNw3Ah3eEGQdJhGkAYq
 bFcyHHxia3GponbBWp_CB0YkAlikt6nFp5K8Wba9v__SapsyOv5nxw.hktES8hkhsCzi_mwqMOm8
 GyLmaLHBkYqUwbnd_2x1JQKUWM9A9JuaQFnHlf1mRYOB73dtIyUsKeubcuy4KcuYAVKOvNElziFU
 kr8W.U71HqhgbdWyvaH87Hbe97.hbj0j2fGlygroqGses09wAVWkHKkspotVV7Vza3phoVom6nBx
 GL_Fn3yGpBnRfyDdFf43kfe.peWcfuO.OIL4jbVU47qRvBn0R7g_b2lEtGhEptfjC7pimcLyj369
 zo20zHiQHTqIkQ1teLx8n0fn._lo974aGev41Nkt5LUzI33ZD982YjrnbCYkWU_RMqUpurKUSdBx
 E0c4GpVVx4D0D3jJaNudnSAPcW.dwaD9dfcx2WllsNG7oGnD5NwUQIL.yiXmu7yo69HxkYuK3k3m
 GX4M_t30YjWQ0oIksI8APJkh8DCpMMjFihOH8wMfQ6hUlwoKbaTFxLyC8f7eWJanLRohltcZGlXI
 HNeHc8sUTtIY4wmCdAwopyAXNL5wT3jIFJw7ATn3MwYZ4L7C7Zro2ukk01WiWpwDTiLk1o83pRAE
 _V.EXYZzw9rfiOsr68Cr2_QhRmLUf0PAj5ngnnVtgfC_dsEfL3a4KYL.A5D5JlnM6RuiKXtq8vVE
 UjQAjrW6wghjVSHNXK4ehwZG8vjRxpsQ3WsEi6X5nchmizpu2PUbchrirJgA4Wl.ofG95ciWsaQM
 i0k2qkgPZICTyQ9Fht64QSmOyqsV0DuaKIjr.3GUUg1aovIi3dFbCzZghRthZql8nY_461uGcQRJ
 z95g2dubbgOQ_.qbBpHBy3hjPbsUhKFmE4c.bZF4cu8cSl8JQSY04uC6SXSBk3zvSn0UCr7o1Inl
 cOKU6neS501bDqbYe5lDdbo6R8nZJUvYMs6JL9mUn5HiyBteTMfAa0OSYeyVTDT9w3qAyW70mY87
 9mPwtMebcW1dHtWc7BWK4iQWUSe4vgJGOOLvV8Ca_rJCMbVPYhxbEHcvuEU0YtTtKuHaF2Uks51G
 JG0VeOfHSAi0ufE6YIUmdqAiw5OVFYJsFW0sJ9wMP3Ra8FckWCopP9plECF595y416vPtXSqDd0_
 k95Ev3UdgoxDCP_e8bQrRHoTWT0QEWJg3lB6TeaDc0YGIMHIyWFPf5hzXMXx7_9V9s4VOIgQOOyP
 3i5Sx9wGV0e2tATdUYdoiQZ1fp_Q5UxSn.K.BtdmY92trUSRBeDbruCtKlxX8KCYKwHD19a4SQun
 YHxadLD5UHBFn6sruFWQrkHgvwYRkww9E4aBAfgmoTh0O4zyj5.FgONy_2cuab0rG43ajMQEQEix
 f_xjLvzYs48o9ExfDy8WJk1TkyX7Ju0m5GpITzL_RjCvJp4eoYtKGKhuINPWgnL8Xzbq.whQMszF
 TtyQ-
X-Sonic-MF: <konrad.frederic@yahoo.fr>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Fri, 8 Jul 2022 10:16:42 +0000
Date: Fri, 8 Jul 2022 10:06:28 +0000 (UTC)
From: Frederic Konrad <konrad.frederic@yahoo.fr>
To: Gregg Allison <gregg.allison@lasp.colorado.edu>, 
 Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Fabien Chouteau <chouteau@adacore.com>
Message-ID: <1000569943.5927253.1657274788950@mail.yahoo.com>
In-Reply-To: <CAFEAcA8s1MTvtSuX-xjqoxbz_c7_f-V97Ra6Qzy1QdMpfXTLAA@mail.gmail.com>
References: <CY1PR03MB213764AFCA6F51DC5558C1AEB3839@CY1PR03MB2137.namprd03.prod.outlook.com>
 <CAFEAcA8s1MTvtSuX-xjqoxbz_c7_f-V97Ra6Qzy1QdMpfXTLAA@mail.gmail.com>
Subject: Re: Support for Gaisler multicore LEONx SoCs
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_5927252_879250215.1657274788947"
X-Mailer: WebService/1.1.20381 YMailNorrin
Received-SPF: pass client-ip=77.238.178.96;
 envelope-from=konrad.frederic@yahoo.fr;
 helo=sonic312-25.consmr.mail.ir2.yahoo.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

------=_Part_5927252_879250215.1657274788947
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

  Hi Gregg,
AFAIK the leon3-generic can emulate the GR712RC with some little difference=
s in the memorymap and / or timer / CPU count.=C2=A0 (You should be able to=
 boot the Gaisler monocore linux with it).

About the SMP support AdaCore had a few patches for it, I'll let Fabien ans=
wer.

Regards,Fred

 Le jeudi 7 juillet 2022 =C3=A0 22:30:46 UTC+2, Peter Maydell <peter.maydel=
l@linaro.org> a =C3=A9crit : =20
=20
=20

On Thu, 7 Jul 2022 at 20:54, Gregg Allison <Gregg.Allison@lasp.colorado.edu=
> wrote:


We are considering the Gaisler GR712RC (2 core LEON3) and GR740 (4 core LEO=
N4) SoCs for a new deep space mission.

Does QEMU support these two multicore configurations at present? Is there a=
n effort planned to provide multicore LEONx emulation?


I've cc'd the people listed in MAINTAINERS for Leon, but as far as I cansee=
 there have been no Leon-related commits for a few years, so I don'tthink t=
his area of QEMU is being actively developed. We seem to havecurrently LEON=
2 and LEON3 CPU support, and one machine type, the"Leon-3 generic" machine.
thanks
-- PMM

 =20
------=_Part_5927252_879250215.1657274788947
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div id=3D=
"ydp6e9c7218yahoo_quoted_7277343291" class=3D"ydp6e9c7218yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div dir=3D"ltr" data-setdir=3D"false">Hi Gregg,</div><div =
dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D=
"false">AFAIK the leon3-generic can emulate the GR712RC with some little di=
fferences in the memory</div><div dir=3D"ltr" data-setdir=3D"false">map and=
 / or timer / CPU count.&nbsp; (You should be able to boot the Gaisler mono=
core linux with it).<br></div><div dir=3D"ltr" data-setdir=3D"false"><br></=
div><div dir=3D"ltr" data-setdir=3D"false">About the SMP support AdaCore ha=
d a few patches for it, I'll let Fabien answer.<br></div><div dir=3D"ltr" d=
ata-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Regar=
ds,</div><div dir=3D"ltr" data-setdir=3D"false">Fred<br></div><div dir=3D"l=
tr" data-setdir=3D"false"><br>
                    </div><div>Le jeudi 7 juillet 2022 =C3=A0 22:30:46 UTC+=
2, Peter Maydell &lt;peter.maydell@linaro.org&gt; a =C3=A9crit :
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"ydp6e9c7218yiv0556966936"><div dir=3D"ltr">=
<div dir=3D"ltr"><div style=3D"font-family:monospace, monospace;" class=3D"=
ydp6e9c7218yiv0556966936gmail_default"><br></div></div><br><div class=3D"yd=
p6e9c7218yiv0556966936gmail_quote"><div dir=3D"ltr" class=3D"ydp6e9c7218yiv=
0556966936gmail_attr">On Thu, 7 Jul 2022 at 20:54, Gregg Allison &lt;<a hre=
f=3D"mailto:Gregg.Allison@lasp.colorado.edu" rel=3D"nofollow" target=3D"_bl=
ank">Gregg.Allison@lasp.colorado.edu</a>&gt; wrote:<br></div><blockquote st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex;" class=3D"ydp6e9c7218yiv0556966936gmail_quote">





<div lang=3D"EN-US">
<div class=3D"ydp6e9c7218yiv0556966936gmail-m_9049889610764523403WordSectio=
n1">
<p class=3D"ydp6e9c7218yiv0556966936MsoNormal">We are considering the Gaisl=
er GR712RC (2 core LEON3) and GR740 (4 core LEON4) SoCs for a new deep spac=
e mission.<u></u><u></u></p>
<p class=3D"ydp6e9c7218yiv0556966936MsoNormal">Does QEMU support these two =
multicore configurations at present? Is there an effort planned to provide =
multicore LEONx emulation?<u></u><u></u></p>
</div></div></blockquote><div><br></div><div><div style=3D"font-family:mono=
space, monospace;" class=3D"ydp6e9c7218yiv0556966936gmail_default">I've cc'=
d the people listed in MAINTAINERS for Leon, but as far as I can</div><div =
style=3D"font-family:monospace, monospace;" class=3D"ydp6e9c7218yiv05569669=
36gmail_default">see there have been no Leon-related commits for a few year=
s, so I don't</div><div style=3D"font-family:monospace, monospace;" class=
=3D"ydp6e9c7218yiv0556966936gmail_default">think this area of QEMU is being=
 actively developed. We seem to have</div><div style=3D"font-family:monospa=
ce, monospace;" class=3D"ydp6e9c7218yiv0556966936gmail_default">currently L=
EON2 and LEON3 CPU support, and one machine type, the</div><div style=3D"fo=
nt-family:monospace, monospace;" class=3D"ydp6e9c7218yiv0556966936gmail_def=
ault">"Leon-3 generic" machine.</div><div style=3D"font-family:monospace, m=
onospace;" class=3D"ydp6e9c7218yiv0556966936gmail_default"><br></div><div s=
tyle=3D"font-family:monospace, monospace;" class=3D"ydp6e9c7218yiv055696693=
6gmail_default">thanks<br></div><div style=3D"font-family:monospace, monosp=
ace;" class=3D"ydp6e9c7218yiv0556966936gmail_default">-- PMM<br><br></div><=
/div></div></div>
</div></div>
            </div>
        </div></div></body></html>
------=_Part_5927252_879250215.1657274788947--

