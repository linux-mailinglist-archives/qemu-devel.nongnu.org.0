Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D20A51F027
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 21:37:32 +0200 (CEST)
Received: from localhost ([::1]:45724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnmih-0001cZ-1B
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 15:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1nnmh3-0000vo-0D
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:35:49 -0400
Received: from mout.web.de ([212.227.17.11]:34233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1nnmh0-0003y1-Mc
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1652038544;
 bh=2k0hpSTlLXV2qEHo1f08xx0HC3MHm1Im5qr4C4YZ0BY=;
 h=X-UI-Sender-Class:From:Subject:Date:References:To:In-Reply-To;
 b=JHD+9++JGn5eWeDqg0vEF08sVO9+HN+EnOOz1y6r+35/Tn+IcwAP30Sh253+4pIHq
 DEVcdJOOd2hGbhQcNErO1teUfwXLuspa8F8UdaMCSJczqlLnyPTSq6w+4tSDYArLgV
 wrxn8xwDfajL0yJDDR2hrt16CvoB+v8DBwXYYoLg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.29.0.96] ([217.239.164.58]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MumNN-1o6PXX0YLb-00rqLk; Sun, 08
 May 2022 21:35:44 +0200
From: Chris Howard <cvz185@web.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: Possible bug in Aarch64 single-stepping
Date: Sun, 8 May 2022 21:35:43 +0200
References: <F1037D57-EB8E-43FA-A2C7-A43C45FEA82C@web.de>
 <CAFEAcA8QmsHfxAdUQET2Oab_xXa7x4i4C4+_6Y-J8ZNs1t5pPg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
In-Reply-To: <CAFEAcA8QmsHfxAdUQET2Oab_xXa7x4i4C4+_6Y-J8ZNs1t5pPg@mail.gmail.com>
Message-Id: <73FF0B20-89CD-4177-B536-049B2D0BDB61@web.de>
X-Mailer: Apple Mail (2.3445.104.21)
X-Provags-ID: V03:K1:Z2cLMtKKHzd8OpVKkkDlXz9QoOQQrXI4/UwHyOhaPub0/WadZw+
 eMGXyi1cs0mdoSz36YhQe4izI+fp3lzVL0pic3wyBkj9IR0RMVg/Ob9UtYANS86ZsuLMsDt
 ocXl7rXQ91rOXn+O4ooJn75vtkU5IhFmUvo2WMxU/uhvNiXUSOWevxWHeGfjgNj58KkGFKe
 mHB12YbWHJzev8ahHRIZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:i7uAfb2IlJM=:uf8WLtHSrZgw7leg5WLHZz
 q01Z/wVuX965qFHy+o9uzdMnU9jp6rfBhDxnVhSoMIUuotchT6xtVpvJKxcXWBWlhBGL7oaBl
 xYiY58jSUy+QcfQP7k9ePZrg/i6zPTprPxGajq4BYt9VPPqeMkwOYo7u6zZ2FqHkYLZ68PFo7
 +g2Ci2N8fYL5PSFNFeEWt8pn59UdXbj+SJjwD/9Lj1TuGuhgZdHZMBE5k9oPE8pgIArVFZwsa
 YdZlp44JyoHBrWqM4S+SdUxG55VgLbQgfrgw7zo0KdD3ykEzMdVnBOQWfrNCm2bGlEPSnzWAN
 uO5vitSkhw5IBgXasecB8bKtIRDo3ClPw8IqV75XEk9h2/Y2bVA5czLQo0o3ECkPZ2wKl78Ml
 HuTephLMd2ssmmWs02BYkHejdGeJ4/i3pHReOo4QpCeX2EfN+iAQq0s0+xraTrGh9wn9ECu0Y
 nNuzfUL6ztUiFxTSu32OkJXgEePz6K8y0VbJ2+X8SBMgvmk7br8TaBQ06M4i2hUuL6WlaGdiZ
 g0roPExmuO1J3+/YP/Dt1epGbGX4QLYh4z2pFRsHoPk6KhBwHjSR41q23CHHDRAbrxLwNFVXq
 O11t3uMrISJCe4u5A5ZEty0VloCbUQ5sze9xmM/I571kRe3+Hbke9QM0mXLHtfBMZgTKkJNe6
 aRXMOHLtIvWtE54u2ZIhUIoZyP8w6pTxmsysUI5EfPD6ptRMOCfv6Cx9stAkklgQ65ppfHuDy
 mpllcxwmqf83U5NkHvzMP4qlfZJVG9SVTcH0GWpKPtmZpYnPuzBglghaT7XOJihm9usCArDUI
 NTLEufR2ExKt51mBdHfEp7Fk/vtSzpD917Q+TzKTilXIo0iLKjbqg4ulyj9OXP7kSLrNkurej
 emRjCEGEGm3GvF65UBgcZzx/dGn6eyPGusgk+YN2OhRMZ1vseqDgwJghKqtKlPq0cJur/qCWD
 ucCU0p3rXxT5npg4kTIljHbzjtzC3hPRzp2AxxuP274x+ku72lT/WBBquQ21as5DkpRNJTyjG
 UH4oAH7WHp5B6ZwVES/Yfrdy8IAGXLBTln9faUxdasYrsHnpqqL5O6gEiP6HcQDx2JYonEit/
 36g/z01A5aa2hQ=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=cvz185@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8. May 2022, at 14:08, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Sat, 7 May 2022 at 14:44, Chris Howard <cvz185@web.de> wrote:
>>=20
>> Hi, I=E2=80=99m writing a simple debugger in assembly code for the =
Raspberry Pi 3B (in aarch64).
>>=20
>> I=E2=80=99m using QEMU 7.0.0. Everything is running in EL1. (I have =
MDE and KDE set in MDSCR_EL1).
>>=20
>> I=E2=80=99m coming across Unexpected Behaviour when playing with =
single-stepping:
>>=20
>> It appears that single-stepping is enabled (ie. an exception is =
generated after every instruction) when the SS bit (bit-0) is set in =
MDSCR_EL1 and debug events are enabled in the CPSR (=E2=80=9CD=E2=80=9D =
bit clear) *** irrespective of whether the SS bit (bit-21) is set in =
CPSR or not ***.
>>=20
>> I thought the SS bit (bit-21) needs to be set in CPSR for =
single-stepping to occur (and that it gets cleared whenever an exception =
is taken and needs to be reset if one wants to single-step again).
>>=20
>> Have I misunderstood / misconfigured something, or is this a bug?
>=20
> I think you've misunderstood how the architectural single
> step works. This is described in section D2.12 of the Arm ARM
> (DDI0487H.a), but briefly, there is a state machine with three
> states: Inactive, Active-not-pending, and Active-pending.
>=20
> * Inactive is when MDSCR_EL1.SS is 0 or debug exceptions are
> disabled from the current EL or security state.
>=20
> * Active-not-pending is when we're not Inactive (ie MDSCR_EL1.SS is 1
> and so on) and PSTATE.SS is 1. This is the state for "we're currently
> pointing at the instruction we would like to step". The CPU
> does the step by doing "execute this one instruction, and then
> clear PSTATE.SS". It does *not* take a "single step completed"
> exception. (I ignore for the moment the possibility that the
> insn resulted in some other exception.)
>=20
> * Active-pending is when we're not Inactive and PSTATE.SS is 0.
> This state means "Software step is active, and a software step
> is pending on the current instruction".
> The usual way we get here is that we were in Active-not-pending
> and then we executed the instruction and cleared PSTATE.SS.
> But you can also get here in other ways (as your test case does).
> In Active-pending state, the CPU does "take a software step
> exception immediately, without doing anything else" -- which is
> what you see.
>=20
> In other words, the design effectively separates out the
> "execute one instruction" part from the "take the exception
> that says we completed a step" part. (This separation is
> irrelevant for the 'normal case' where the stepped instruction
> doesn't cause any exceptions and no interrupts arrive either,
> but it can matter if there is some interrupt to be taken. For
> instance, suppose that we do a step, and while the insn is
> executing an interrupt comes in that is routed to EL3. We
> want to take that interrupt first, before taking the
> 'single step complete' exception. Because the distinction
> between 'active-not-pending' and 'active-pending' is stored
> in PSTATE.SS, this works automatically -- we go to EL3, do
> whatever the interrupt handler does, and then on the eret
> to where we started, PSTATE.SS is restored to 0: so we then
> correctly take the 'single step complete' exception without
> executing another instruction.)
>=20
> So if you don't want to see single-step exceptions you need
> to make sure you stay in the Inactive state.
>=20
> thanks
> =E2=80=94 PMM


I had indeed misunderstood :-) even though I had looked at that
section (and the state machine diagram)  :-/

Thanks for the EXCELLENT explanation! Very much appreciated.

=E2=80=94chris


