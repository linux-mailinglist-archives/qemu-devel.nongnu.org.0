Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95624421F9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:51:53 +0100 (CET)
Received: from localhost ([::1]:55586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mheHZ-00043Y-3E
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mheBT-0006CM-K6
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:45:35 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mheBQ-0000gR-Ab
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:45:34 -0400
Received: by mail-ed1-x534.google.com with SMTP id g10so68201967edj.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 13:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y5L4ZTu7Gt/FwyfX5ISXCiv+p7aofmdqhnwu+iOBfFU=;
 b=LSZ5XacAke3+84An62+npc+BgsmLu8cPdrVtvABkmEhWVVsqfNTRWAIuXB9OsKVSno
 WWKeJguAIKAigl5RfSWfpOx5XKSBRIeJjq/WMCm1fq9cGxkTIifOe3WTVljx94vt4yET
 +NB5AtOCX1/SDjlKR87N5m5MOmQpde8JOPJ38yjQv9iXUP3nedwhM8t0doBeT1OnoDiB
 gb+mi+pMhJoWGRsE3RU9RWi15Y7Na2kHHMUta0jtndgluLKgLAOq9vdrlGv6yqXUAVUd
 6Qb4hBfpqVzYKyQxu1zivAQ+UxUADomebw1g7QnXQcZ+jk2b8sQxtf2vxXVaQW9AD/kW
 JpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y5L4ZTu7Gt/FwyfX5ISXCiv+p7aofmdqhnwu+iOBfFU=;
 b=WD0OJj6sYxHmple2z1xVuic8whp/2F0b5ol2NpdBB6MAcV5io9GAa2+WvsEIvFlzPq
 Kw7/H5oRZfiG6azydF4WgcBuOmly4Btj9ArII0vP/LY95JvRnHJs+zHI4ENLFYr0g3kk
 TpjA/6zt1eDXEqsndDqdJOA81ghi4swI+gRpHSF0tXibJVtcgva0SsuF3A4FVJbBaOWY
 VfcAKMN2MIJMKp+UkggR0YW4GlgaT1Dx8kSAEFj1GUkCSKnwOSk7FH2TxzzpOH/2I1vp
 4VSQm1xg5kDrHLawTlzYrYslYowpgjQxWF+M6cCKTZ+jYfmPVMdcXMdzG86vj+3EKPEl
 7zbQ==
X-Gm-Message-State: AOAM531EM+wEqrEnGm0K3kPNIlNDFjiCodAwk2yypFOq8qcgreBifDZD
 /WZBy/DKHQ6hB9sr6ggf4o/+loXXB6brbPK2WbOiLg==
X-Google-Smtp-Source: ABdhPJzJq9Uz3jFDKxOzxtn3g6CQxqMf1GVepYO4d1qa5VCgnBMV571NwDoKjKfdk3LksCgBboIf9nbdI4cJhI2huxY=
X-Received: by 2002:a17:906:5d11:: with SMTP id
 g17mr39594561ejt.175.1635799530463; 
 Mon, 01 Nov 2021 13:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211101011734.1614781-1-sjg@chromium.org>
 <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
 <d3caa60fcbd1a482@bloch.sibelius.xs4all.nl>
In-Reply-To: <d3caa60fcbd1a482@bloch.sibelius.xs4all.nl>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Mon, 1 Nov 2021 21:45:19 +0100
Message-ID: <CAHFG_=WNHyhHj+RCJOMz89wEW50grYv_veKTfnGTRG0ZEKQ4oA@mail.gmail.com>
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Content-Type: multipart/alternative; boundary="000000000000f007c205cfc041e8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_FONT_LOW_CONTRAST=0.001,
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
Cc: marex@denx.de, albert.u.boot@aribaud.net, trini@konsulko.com,
 yamada.masahiro@socionext.com, xypron.glpk@gmx.de, bill.mills@linaro.org,
 ilias.apalodimas@linaro.org, qemu-devel@nongnu.org, u-boot@lists.denx.de,
 vanbaren@cideas.com, sjg@chromium.org, bmeng.cn@gmail.com,
 morpheus.ibis@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f007c205cfc041e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Le lun. 1 nov. 2021 =C3=A0 19:19, Mark Kettenis <mark.kettenis@xs4all.nl> a
=C3=A9crit :

> > From: Fran=C3=A7ois Ozog <francois.ozog@linaro.org>
> > Date: Mon, 1 Nov 2021 09:53:40 +0100
>
> [...]
>
> > We could further leverage Passage to pass Operating Systems parameters
> that
> > could be removed from device tree (migration of /chosen to Passage).
> Memory
> > inventory would still be in DT but allocations for CMA or GPUs would be
> in
> > Passage. This idea is to reach a point where  device tree is a "pristin=
e"
> > hardware description.
>
> I wanted to react on something you said in an earlier thread, but this
> discussion seems to be appropriate as well:
>
> The notion that device trees only describe the hardware isn't really
> correct.  Device trees have always been used to configure firmware
> options (through the /options node) and between firmware and the OS
> (through the /chosen node) and to describe firmware interfaces
> (e.g. OpenFirmware calls, PSCI (on ARM), RTAS (on POWER)).  This was
> the case on the original Open Firmware systems, and is still done on
> PowerNV systems that use flattened device trees.


> I understand and agree with the above.
Yet, PSCI is different from /options and /chosen: those are platform
services made available to the OS when the boot firmware code has been
unloaded/neutralized.

What I (not just myself but let=E2=80=99s simplify) am trying to decouple t=
he
supply chain: loosely coupled platform provider (ODM), the firmware
provider, OS provider, application provider. So it is not to prevent
presence of those existing nodes, it is to be able introduce some
rationalization in their use:

Platform interfaces such as PSCI: The question is =E2=80=9Cwho=E2=80=9D inj=
ects them in the
DT (build time or runtime). There is no single good answer and you may want
the authoritative entity that implements the service to actually inject
itself in the DT passed to the OS. I know some platforms are using SMC
calls from U-Boot to know what to inject in the DT. I see those as the same
nature of DIMM sensing and injection in the DT.

/chosen:  a must have when you do not have UEFI but not necessary with UEFI=
.

/options: it should be possible for the end customer to make the decision
of integration: at build time or at runtime based on a separate flattened
device tree file.

This decoupling should result for instance, in the long run, in adjustable
memory layouts without headaches. changing the secure dram size is simple
from hardware perspective but a massive issue from a firmware perspective:
multiple firmware projects sources need to be adjusted, making manual
calculations on explicit constants or =E2=80=9Chidden=E2=80=9D ones. It sho=
uld even be
possible to adjust it at runtime on the field (user selected firmware
parameter).


> I don't see what the benefits are from using Passage instead.  It
> would only fragment things even more.
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000f007c205cfc041e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Mark,</div><div style=3D"background-color:rgba(0,0,0,0=
)!important;border-color:rgb(0,0,0)!important;color:rgb(0,0,0)!important"><=
br><div class=3D"gmail_quote" style=3D"background-color:rgba(0,0,0,0)!impor=
tant;border-color:rgb(0,0,0)!important;color:rgb(0,0,0)!important"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 1 nov. 2021 =C3=A0 19:19, Mark K=
ettenis &lt;<a href=3D"mailto:mark.kettenis@xs4all.nl">mark.kettenis@xs4all=
.nl</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)">&gt; From: Fran=
=C3=A7ois Ozog &lt;<a href=3D"mailto:francois.ozog@linaro.org" target=3D"_b=
lank">francois.ozog@linaro.org</a>&gt;<br>
&gt; Date: Mon, 1 Nov 2021 09:53:40 +0100<br>
<br>
[...]<br>
<br>
&gt; We could further leverage Passage to pass Operating Systems parameters=
 that<br>
&gt; could be removed from device tree (migration of /chosen to Passage). M=
emory<br>
&gt; inventory would still be in DT but allocations for CMA or GPUs would b=
e in<br>
&gt; Passage. This idea is to reach a point where=C2=A0 device tree is a &q=
uot;pristine&quot;<br>
&gt; hardware description.<br>
<br>
I wanted to react on something you said in an earlier thread, but this<br>
discussion seems to be appropriate as well:<br>
<br>
The notion that device trees only describe the hardware isn&#39;t really<br=
>
correct.=C2=A0 Device trees have always been used to configure firmware<br>
options (through the /options node) and between firmware and the OS<br>
(through the /chosen node) and to describe firmware interfaces<br>
(e.g. OpenFirmware calls, PSCI (on ARM), RTAS (on POWER)).=C2=A0 This was<b=
r>
the case on the original Open Firmware systems, and is still done on<br>
PowerNV systems that use flattened device trees.</blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204=
)" dir=3D"auto"><br>
</blockquote><div dir=3D"auto">I understand and agree with the above.=C2=A0=
</div><div dir=3D"auto" style=3D"background-color:rgba(0,0,0,0)!important;b=
order-color:rgb(0,0,0)!important;color:rgb(0,0,0)!important"><div dir=3D"au=
to" style=3D"border-color:rgb(0,0,0)!important;color:rgb(0,0,0)!important;b=
ackground-color:rgba(0,0,0,0)!important"><span style=3D"background-color:rg=
ba(0,0,0,0);border-color:rgb(0,0,0)"><font style=3D"border-color:rgb(0,0,0)=
;color:rgb(0,0,0)">Yet,=C2=A0</font></span><span>PSCI is different from /op=
tions and /chosen: those are platform services made available to the OS whe=
n the boot firmware code has been unloaded/neutralized.</span></div><div di=
r=3D"auto" style=3D"border-color:rgb(0,0,0)"><span><br></span></div><div di=
r=3D"auto" style=3D"border-color:rgb(0,0,0)">What I (not just myself but le=
t=E2=80=99s simplify) am trying to decouple the supply chain: loosely coupl=
ed platform provider (ODM), the firmware provider, OS provider, application=
 provider. So it is not to prevent presence of those existing nodes, it is =
to be able introduce some rationalization in their use:</div><div><br></div=
><div dir=3D"auto"><span style=3D"border-color:rgb(0,0,0)">Platform interfa=
ces such as PSCI: The question is =E2=80=9Cwho=E2=80=9D injects them in the=
 DT (build time or runtime). There is no single good answer and you may wan=
t the authoritative entity that implements the service to actually inject i=
tself in the DT passed to the OS. I know some platforms are using SMC calls=
 from U-Boot to know what to inject in the DT. I see those as the same natu=
re of DIMM sensing and injection in the DT.</span><br></div><div dir=3D"aut=
o"><span style=3D"border-color:rgb(0,0,0)"><br></span></div></div><div dir=
=3D"auto">/chosen: =C2=A0a must have when you do not have UEFI but not nece=
ssary with UEFI.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">/op=
tions: it should be possible for the end customer to make the decision of i=
ntegration: at build time or at runtime based on a separate flattened devic=
e tree file.</div><div dir=3D"auto"><br></div><div dir=3D"auto">This decoup=
ling should result for instance, in the long run, in adjustable memory layo=
uts without headaches. changing the secure dram size is simple from hardwar=
e perspective but a massive issue from a firmware perspective: multiple fir=
mware projects sources need to be adjusted, making manual calculations on e=
xplicit constants or =E2=80=9Chidden=E2=80=9D ones. It should even be possi=
ble to adjust it at runtime on the field (user selected firmware parameter)=
.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
I don&#39;t see what the benefits are from using Passage instead.=C2=A0 It<=
br>
would only fragment things even more.<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px=
" valign=3D"top"><img src=3D"https://static.linaro.org/common/images/linaro=
-logo-web.png"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&qu=
ot;Sans Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:=
rgb(87,87,87)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7oi=
s-Fr=C3=A9d=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)=
">|</span>=C2=A0<i>Director Business Development</i></td></tr><tr><td style=
=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;f=
ont-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a=
 value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><=
br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87)=
;text-decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0=
<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td=
></tr></tbody></table></td></tr></tbody></table></div></div></div></div></d=
iv><div><div><br style=3D"font-size:small"></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

--000000000000f007c205cfc041e8--

