Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1838A5B6896
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:23:14 +0200 (CEST)
Received: from localhost ([::1]:45942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY0GG-0004To-U0
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oY06H-0006HU-1w
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:12:56 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oY06E-0008Tj-Ar
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:12:52 -0400
Received: by mail-ej1-x636.google.com with SMTP id r18so25311716eja.11
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 00:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BYtWKCoS6J59JerMNA6dC9f23myvFrPUfYB3Wr5I/lg=;
 b=ItSSj5vHUrnedAGOnGGIgimoIRawDnUNmLd3G2aKNlkOE5lck5swCNXqsnXtjlyqP+
 6f+ncnOcsh+9HTJrZpPaw0xV3NSpizWyxPvf6B2MmlDcbMVtEqBqn/nyfmMWUtHN0Q0m
 mm0bvYC0lmxypKQBvs605brPblvF6duWKlUVEG3KcmbBW+aVPoVYGsMMTWDh3+mcNoHJ
 qrDjzB9n3sefu1FX9F0Vsa8S2BeAAW3Q3Coy/Pb7F6DCTkG697pLeJ7rTsHd4BtyGqH3
 8wCnnA1dXDG9tgPQCwaiWPjBOUqsFurvTb26QSIElwIePn2Wp095y+ptxxlagDH7TBck
 h3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BYtWKCoS6J59JerMNA6dC9f23myvFrPUfYB3Wr5I/lg=;
 b=r3zh3hw/5bWAMfpqXjY3scaVRwZGOeCejqqJ9FTVyZLKY64rzxwUewC65R9rOr8hTr
 2sMF86nV7oBi1ikk1Uq3O7KDXCIt6GA2rDZWYbn9e092HgfAYX1YEakqGa8100NKPaHw
 y0acTWCfwt/i1XXe4Hc3FlFPgxDRcttHEZ4OAI8+rg5XRmQgEEPKbT7ZnP7p4nTOo2SA
 m4Nx8/eoXp5hKk7Bc/5nCey8tZrAz8zHkAxvfYptHb1RZCo7CHpP39Gj7HqA2slXU1hS
 mcFSvj+IrzcMm8w5386frqtAnOu9G61AMhtfjkKXlLYhsf3fYGqWw/dPzQzBOpmy1Txx
 +L+w==
X-Gm-Message-State: ACgBeo3mc6TbmXAEPfhFe7wkNJpdJyUNTaMuyC2iQlf6ARN2Eau5rjct
 4Nf0jCA6nDrL1ys0WBuh9Kz7kK/8stom0C4LyxrZOuLRpQ5SQpVs
X-Google-Smtp-Source: AA6agR5RhYCNLOuBKaQ7VtHowLHtB4TxP8C7XmCQR2xV+K5mXO/Yi9GDwXASPX522AUD7sIDpvKuBALMaKSEs6I51mk=
X-Received: by 2002:a17:907:628f:b0:72f:57da:c33d with SMTP id
 nd15-20020a170907628f00b0072f57dac33dmr21087158ejc.374.1663053166828; Tue, 13
 Sep 2022 00:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <87a67kphih.fsf@linaro.org>
In-Reply-To: <87a67kphih.fsf@linaro.org>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Tue, 13 Sep 2022 08:12:35 +0100
Message-ID: <CAHDbmO3CT+7q19gj_037cBt2c4wVEEVMTDr_5Lj8-uWXEt5xRw@mail.gmail.com>
Subject: Re: Any interest in a QEMU emulation BoF at KVM Forum?
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Mark Burton <mburton@qti.qualcomm.com>, Bill Mills <bill.mills@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Michael Rolnik <mrolnik@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, David Gibson <david@gibson.dropbear.id.au>, 
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Luc Michel <luc@lmichel.fr>, 
 Damien Hedde <damien.hedde@greensocs.com>, Alessandro Di Federico <ale@rev.ng>
Content-Type: multipart/alternative; boundary="000000000000407b8205e889bde9"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000407b8205e889bde9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The BoF session will be in Lifey A (the big hall) this afternoon. I thought
being able to sit around tables while we discuss things would make things a
bit easier. We can share note taking on the etherpad:

  https://etherpad.opendev.org/p/qemu-emulation-bof%40kvmforum2022

I'll run a HO at: https://meet.google.com/rac-axef-xvv

On Wed, 31 Aug 2022 at 16:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

> Hi,
>
> Given our slowly growing range of TCG emulations and the evident
> interest in keeping up with modern processor architectures is it worth
> having an emulation focused BoF at the up-coming KVM Forum?
>
> Some potential topics for discussion I could think of might include:
>
>  * Progress towards heterogeneous vCPU emulation
>
>  We've been making slow progress in removing assumptions from the
>  various front-ends about their global nature and adding accel:TCG
>  abstractions and support for the translator loop. We can already have
>  CPUs from the same architecture family in a model. What else do we need
>  to do so we can have those funky ARM+RiscV+Tricore heterogeneous
>  models? Is it library or something else?
>
>  * External Device Models
>
>  I know this is a contentious topic given the potential for GPL
>  end-runs. However there are also good arguments for enabling the
>  testing of open source designs without having forcing the
>  implementation of a separate C model to test software. For example if
>  we hypothetically modelled a Pi Pico would it make sense to model the
>  PIO in C if we could just compile the Verilog for it into a SystemC
>  model? Would a plethora of closed device models be the inevitable
>  consequence of such an approach? Would it matter if we just
>  concentrated on supporting useful open source solutions?
>
>  * Dynamic Machine Models
>
>  While we try and avoid modelling bespoke virtual HW in QEMU
>  (virt/goldfish not withstanding ;-) there is obviously a desire in the
>  EDA space to allow such experimentation. Is this something we can
>  provide so aspiring HW engineers can experiment with system
>  architectures without having to form QEMU and learn QOM. There have
>  been suggestions about consuming device trees or maybe translating to
>  QMP calls and adding support for wiring devices together. Given the
>  number of forks that exist is this something that could be better
>  supported upstream without degenerating into messy hacks?
>
>  * A sense of time
>
>  Currently we have the fairly limited support for -icount in QEMU. At
>  the same time we have no desire to start expanding frontends with
>  the details cost models required for a more realistic sense of time to
>  be presented. One suggestion is to expand the TCG plugin interface to
>  allow for the plugin to control time allowing as much or little logic
>  to be pushed there as we like and freeing up frontends from ever having
>  to consider it.
>
> Are any of these topics of interest? Are there any other emulation
> topics people would like to discuss?
>
> --
> Alex Benn=C3=A9e
>


--=20
Alex Benn=C3=A9e
KVM/QEMU Hacker for Linaro

--000000000000407b8205e889bde9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The BoF session will be in Lifey A (the big hall) this aft=
ernoon. I thought being able to sit around tables while we discuss things w=
ould make things a bit easier. We can share note taking on the etherpad:<di=
v><br><div>=C2=A0=C2=A0<a href=3D"https://etherpad.opendev.org/p/qemu-emula=
tion-bof%40kvmforum2022">https://etherpad.opendev.org/p/qemu-emulation-bof%=
40kvmforum2022</a></div><div><br></div><div>I&#39;ll run a HO at:=C2=A0<a h=
ref=3D"https://meet.google.com/rac-axef-xvv">https://meet.google.com/rac-ax=
ef-xvv</a></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, 31 Aug 2022 at 16:19, Alex Benn=C3=A9e &lt;<a=
 href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Given our slowly growing range of TCG emulations and the evident<br>
interest in keeping up with modern processor architectures is it worth<br>
having an emulation focused BoF at the up-coming KVM Forum?<br>
<br>
Some potential topics for discussion I could think of might include:<br>
<br>
=C2=A0* Progress towards heterogeneous vCPU emulation<br>
<br>
=C2=A0We&#39;ve been making slow progress in removing assumptions from the<=
br>
=C2=A0various front-ends about their global nature and adding accel:TCG<br>
=C2=A0abstractions and support for the translator loop. We can already have=
<br>
=C2=A0CPUs from the same architecture family in a model. What else do we ne=
ed<br>
=C2=A0to do so we can have those funky ARM+RiscV+Tricore heterogeneous<br>
=C2=A0models? Is it library or something else?<br>
<br>
=C2=A0* External Device Models<br>
<br>
=C2=A0I know this is a contentious topic given the potential for GPL<br>
=C2=A0end-runs. However there are also good arguments for enabling the<br>
=C2=A0testing of open source designs without having forcing the<br>
=C2=A0implementation of a separate C model to test software. For example if=
<br>
=C2=A0we hypothetically modelled a Pi Pico would it make sense to model the=
<br>
=C2=A0PIO in C if we could just compile the Verilog for it into a SystemC<b=
r>
=C2=A0model? Would a plethora of closed device models be the inevitable<br>
=C2=A0consequence of such an approach? Would it matter if we just<br>
=C2=A0concentrated on supporting useful open source solutions?<br>
<br>
=C2=A0* Dynamic Machine Models<br>
<br>
=C2=A0While we try and avoid modelling bespoke virtual HW in QEMU<br>
=C2=A0(virt/goldfish not withstanding ;-) there is obviously a desire in th=
e<br>
=C2=A0EDA space to allow such experimentation. Is this something we can<br>
=C2=A0provide so aspiring HW engineers can experiment with system<br>
=C2=A0architectures without having to form QEMU and learn QOM. There have<b=
r>
=C2=A0been suggestions about consuming device trees or maybe translating to=
<br>
=C2=A0QMP calls and adding support for wiring devices together. Given the<b=
r>
=C2=A0number of forks that exist is this something that could be better<br>
=C2=A0supported upstream without degenerating into messy hacks?<br>
<br>
=C2=A0* A sense of time<br>
<br>
=C2=A0Currently we have the fairly limited support for -icount in QEMU. At<=
br>
=C2=A0the same time we have no desire to start expanding frontends with<br>
=C2=A0the details cost models required for a more realistic sense of time t=
o<br>
=C2=A0be presented. One suggestion is to expand the TCG plugin interface to=
<br>
=C2=A0allow for the plugin to control time allowing as much or little logic=
<br>
=C2=A0to be pushed there as we like and freeing up frontends from ever havi=
ng<br>
=C2=A0to consider it.<br>
<br>
Are any of these topics of interest? Are there any other emulation<br>
topics people would like to discuss?<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Alex Benn=C3=A9e<br>KVM/QEMU Hacker for Linaro</=
div>

--000000000000407b8205e889bde9--

