Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D05E51ED56
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 14:10:42 +0200 (CEST)
Received: from localhost ([::1]:37032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnfkE-0006wy-6M
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 08:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnfi6-0005y9-On
 for qemu-devel@nongnu.org; Sun, 08 May 2022 08:08:30 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:37509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnfi3-0006nh-6C
 for qemu-devel@nongnu.org; Sun, 08 May 2022 08:08:26 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f16645872fso119496617b3.4
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4hgyUUOgV9e3LEvMPEOkbiaThuZnnlpxs8+V9ehb6aI=;
 b=Vfxy130fPJlNZSCQGZkHp+88ljiEh0TRH3STFsZ9d/zNWREYElGckyOWDd2QGPwJKJ
 uRYuKXfy5xV/ThyAopHBZnzAvKS/pWlJQo+gAxnTCJDCFUPY1XRU3fRO21s69GX6Hw1t
 dH+V7equVs+Rqfvy8WzJKRNZORXJ0QTdy0prb6e+rQvS62WCId/au5Q/7UK3X1hgExL7
 Rz+kVfet/mZOngsEnUOVo/FZ2vWIlNY3y1ecFmEpSEde0OEjFYMDgP/q7qmDt3ELMpXI
 99W1yBKe0x6EUOGtPC/LtV7Rf9dDgIwN8pmt85mRlHP+Of5FyTiyiQMJMAqGl9hzfARj
 un3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4hgyUUOgV9e3LEvMPEOkbiaThuZnnlpxs8+V9ehb6aI=;
 b=IiEffsImd9v5+uuIEkvUXoo6xlFgXtDAA05qb8AbDcLAO3v7djCYN2PVCUDh8xlKaI
 NkjuuT/SeCWiK0F+JamRH3ZLpb4lTrJrgvvPiHss8f251mJsCK2NvtNQmsrTNwh6RWzJ
 DFihTrm5grvw99f97PpGWSQilpHV1a4+SYNuIzsuEZG73eBMzKZZoy1QVb2L3yPTfDsP
 N/29zEvh/UbHH9z7TaWUCnVEThOALV6Uh3w0CA6/j/pvcyB0URZ0bMqIFvbwwcb1ipQE
 p20H7nbjNk/9F2Gpy9trD85+t9PRdvvVP7vDZE71l9RAxuaP8RtJJLskm+R/2y2dlccT
 ZYZw==
X-Gm-Message-State: AOAM531HB5fkoCPK8+C3FrvogHfSSJyC/uLY+R3av4yAi+YBTWB5akVX
 qGMpo3q+T23tbaHukfFiqsURVIc7+MZaragkbNB5Ng==
X-Google-Smtp-Source: ABdhPJy5ns0Ct7weCNQPrEqGJOeDE9y57zIXR7sNdbbkPFBSCyRNmPI6SveW10sv4O2C9FEYlGdMBj+byK3x/WsFv9A=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr10650628ywb.469.1652011701237; Sun, 08
 May 2022 05:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <F1037D57-EB8E-43FA-A2C7-A43C45FEA82C@web.de>
In-Reply-To: <F1037D57-EB8E-43FA-A2C7-A43C45FEA82C@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 8 May 2022 13:08:10 +0100
Message-ID: <CAFEAcA8QmsHfxAdUQET2Oab_xXa7x4i4C4+_6Y-J8ZNs1t5pPg@mail.gmail.com>
Subject: Re: Possible bug in Aarch64 single-stepping
To: Chris Howard <cvz185@web.de>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sat, 7 May 2022 at 14:44, Chris Howard <cvz185@web.de> wrote:
>
> Hi, I=E2=80=99m writing a simple debugger in assembly code for the Raspbe=
rry Pi 3B (in aarch64).
>
> I=E2=80=99m using QEMU 7.0.0. Everything is running in EL1. (I have MDE a=
nd KDE set in MDSCR_EL1).
>
> I=E2=80=99m coming across Unexpected Behaviour when playing with single-s=
tepping:
>
> It appears that single-stepping is enabled (ie. an exception is generated=
 after every instruction) when the SS bit (bit-0) is set in MDSCR_EL1 and d=
ebug events are enabled in the CPSR (=E2=80=9CD=E2=80=9D bit clear) *** irr=
espective of whether the SS bit (bit-21) is set in CPSR or not ***.
>
> I thought the SS bit (bit-21) needs to be set in CPSR for single-stepping=
 to occur (and that it gets cleared whenever an exception is taken and need=
s to be reset if one wants to single-step again).
>
> Have I misunderstood / misconfigured something, or is this a bug?

I think you've misunderstood how the architectural single
step works. This is described in section D2.12 of the Arm ARM
(DDI0487H.a), but briefly, there is a state machine with three
states: Inactive, Active-not-pending, and Active-pending.

* Inactive is when MDSCR_EL1.SS is 0 or debug exceptions are
disabled from the current EL or security state.

* Active-not-pending is when we're not Inactive (ie MDSCR_EL1.SS is 1
and so on) and PSTATE.SS is 1. This is the state for "we're currently
pointing at the instruction we would like to step". The CPU
does the step by doing "execute this one instruction, and then
clear PSTATE.SS". It does *not* take a "single step completed"
exception. (I ignore for the moment the possibility that the
insn resulted in some other exception.)

* Active-pending is when we're not Inactive and PSTATE.SS is 0.
This state means "Software step is active, and a software step
is pending on the current instruction".
The usual way we get here is that we were in Active-not-pending
and then we executed the instruction and cleared PSTATE.SS.
But you can also get here in other ways (as your test case does).
In Active-pending state, the CPU does "take a software step
exception immediately, without doing anything else" -- which is
what you see.

In other words, the design effectively separates out the
"execute one instruction" part from the "take the exception
that says we completed a step" part. (This separation is
irrelevant for the 'normal case' where the stepped instruction
doesn't cause any exceptions and no interrupts arrive either,
but it can matter if there is some interrupt to be taken. For
instance, suppose that we do a step, and while the insn is
executing an interrupt comes in that is routed to EL3. We
want to take that interrupt first, before taking the
'single step complete' exception. Because the distinction
between 'active-not-pending' and 'active-pending' is stored
in PSTATE.SS, this works automatically -- we go to EL3, do
whatever the interrupt handler does, and then on the eret
to where we started, PSTATE.SS is restored to 0: so we then
correctly take the 'single step complete' exception without
executing another instruction.)

So if you don't want to see single-step exceptions you need
to make sure you stay in the Inactive state.

thanks
-- PMM

