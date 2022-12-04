Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCF641E42
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 18:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1sv5-0000lS-9U; Sun, 04 Dec 2022 12:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p1sv3-0000l5-GZ
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 12:36:49 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p1sv1-0008EO-QP
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 12:36:49 -0500
Received: by mail-pj1-x1035.google.com with SMTP id q15so8167727pja.0
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 09:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qEAwh3rL6f8Cnhv0QF3VvcQHhWy6OUJslmZcquSoLe0=;
 b=l72AjKZhNG06/vtoCjG3OkUFzuJ/sTclKpzQ0W10DNFtl1Nqvz/n8YlUjmK/BPSgqh
 e2RpJQ2/uCR3diibOBDGeZzQHYMOSH5WayaraOPzpVdJK2RKjnnFmq6lIZE7816vHfYk
 EHi9I/KH4Q0oa3k51Tagj9sCK9dRU8JN2TzNF+kQgXhM28/Be2cplWeToLRyXXEqXF7Z
 ponaemonJDwDPDeAzTLyhHt28pqgiIHIIGiGhcG12ILJdybPQKWJIpM4cY3IbCm4UEp0
 CFNhAH8L3dvjopBs5D4wWx8pZ3q0YL0pIkUbPVRJbiQH7LzI6p3QPg+J4oiIoM4/6D+x
 ZZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qEAwh3rL6f8Cnhv0QF3VvcQHhWy6OUJslmZcquSoLe0=;
 b=t5gpARUEjEznuL0nxaS1GXxYPjk0BmtD+ozqU2kFGXMsJ/KvLRMLXPrRlt/l6lo2GY
 tVT9Tb/0NvHu2Y/sHqTUSsPur0jK9rFqTuhppPNTLkyEGr3RCKgBzM9oR73/zLVeAJNE
 z/s6i2hRbcU52/7gbriHyWoodt0/+iy0+kGQA6pz0SPTWeTRn1qjjTPO+f1ZSg7wF/Vt
 4XM0ierw+8p4gCl/830cKq5u4rfUOSMzQu7QUHjExSM/Yowi8BLK8j6Z2/UN6lfFyCby
 eahbHuNdNPGntSAElm940xVfkSGPap/XcJuJIKgEtn53GyzcOZZM0JsJo1vmxo/OEbEp
 /Fqw==
X-Gm-Message-State: ANoB5pmAdd3Z78etVkbizyhZFg1VS/I65xgbiKhgsA8QX4YEHnu6c1ya
 w2dtXF4ifwNoZTc7LAMQQ5uFP3oV2eaJH6asmlA9NQ==
X-Google-Smtp-Source: AA0mqf6XieYhUYJEsB27Jc1EJDCH2zo3i1PnHBUpemvNMJXwSN8GlQUbklcOildVFF3KglfCdczCxnKFN8EWi+gMxfk=
X-Received: by 2002:a17:90b:33c8:b0:219:94b2:2004 with SMTP id
 lk8-20020a17090b33c800b0021994b22004mr11124321pjb.215.1670175405756; Sun, 04
 Dec 2022 09:36:45 -0800 (PST)
MIME-Version: 1.0
References: <20221130111559.52150-1-thuth@redhat.com>
 <CAFEAcA-hneP0SLUTW=_maTztra9gYnKgPeXevDcVu3jZZnDObA@mail.gmail.com>
 <95226bbe-9658-660c-12bb-dbf82b28dbd5@redhat.com>
In-Reply-To: <95226bbe-9658-660c-12bb-dbf82b28dbd5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Dec 2022 17:36:34 +0000
Message-ID: <CAFEAcA9wrz5byHoq=1KeCcZW9yF44Zg2-SHi54pV=EFvYeu3rA@mail.gmail.com>
Subject: Re: [PATCH for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 2 Dec 2022 at 12:25, Thomas Huth <thuth@redhat.com> wrote:
>
> On 01/12/2022 12.55, Peter Maydell wrote:
> > On Wed, 30 Nov 2022 at 11:16, Thomas Huth <thuth@redhat.com> wrote:
> >>   #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
> >>   #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
> >>   #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
> >
> > kvm-consts.h is where QEMU_PSCI_RET_SUCCESS etc are defined.
> > So while the #include isn't strictly needed for compilation to work
> > because arm-powerctl.h only creates the #define and doesn't use it,
> > it does mean that any source file that uses the QEMU_ARM_POWERCTL_*
> > now needs to include kvm-consts.h somehow itself. (Usually this is
> > going to happen implicitly via target/arm/cpu.h, I think.)
> >
> > I guess this is worth living with for the benefit of not
> > compiling things twice. It could probably be untangled a little
> > by e.g. moving the PSCI constants into their own header rather
> > than defining them in kvm-consts.h, but I'm not sure if it's
> > worth the effort right now.
>
> Hmm, do we really need these QEMU_ARM_POWERCTL* redefinitions?
> They seem hardly to be used outside of the arm-powerctl.[ch]
> files:
>
> $ grep -r  QEMU_ARM_POWERCTL * | grep -v target/arm/arm-powerctl
> hw/misc/allwinner-cpucfg.c:    if (ret != QEMU_ARM_POWERCTL_RET_SUCCESS) {
> target/arm/hvf/hvf.c:    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
> target/arm/psci.c:    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
>
> ... so maybe we could rather change those spots to use the QEMU_PSCI_*
> constants instead? ... or since they basically only check for success,
> we could maybe use "if (ret) ..." and "assert(!ret)" there?

I see you've found a neat way to avoid this problem, but for the
record, the reason the two sets of constant names are different
is because these are two separate levels of API. The PSCI values
are required to be those values by the PSCI specification. The
ARM_POWERCTL values are just part of a within-QEMU API that is
used both by our PSCI implementation and also by some non-PSCI
power-control devices, so conceptually it shouldn't use PSCI
constants at all. However we assume in our PSCI implementation
that we can just pass through an Arm powerctl return code as a
PSCI return code to the guest, and so we want at compile time to
know that in fact we picked the same numbers for each. In theory
you could separate them the two sets of constant definitions and
then compile-time-assert in the PSCI implementation code that they
have the same values, or you could really separate them out and
then have the PSCI implementation code (that's the two cases in
target/arm) do a runtime conversion between an ARM_POWERCTL return
value and the appropriate PSCI return value.

The current setup exists partly because we started with only
a PSCI implementation, and then abstracted out the "start/stop
a CPU" functionality into its own within-QEMU API so other
power-control devices could use it.

-- PMM

