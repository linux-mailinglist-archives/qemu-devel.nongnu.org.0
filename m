Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20B660961
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 23:15:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDuyv-00089N-QI; Fri, 06 Jan 2023 17:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDuyu-00087e-Gd
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:14:32 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDuys-00043w-02
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:14:31 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso3264765pjf.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 14:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sgchCCNHNRcv7zFFPZgHYphadLRf7lxSLp/DMSmmDbA=;
 b=IUgwW1TmPaiidfsJru8SARvftv/rkELJrZr+Y5C6yoHUNV6lmyoOZpT6FZ0HviBfAc
 2Qar1NlbghePU66+o/GunTurykSogq3zI62HRrMIIFLnnCTWlMapZ/yQxcyf6g0/wIKg
 tJXvqaWYOGzPPx9YBXnQKi0QDkpQS2YLqsngINqrWZal74ky8eEXyMQ1uedxR+vVJo0p
 N6JAuKbsuKit0iXSgpFrK90uZW6FAX8TSPeGudsYAcA3hmqVyKSUe9qk5eI1t42AiRMD
 WohEFIQAhUFRCefkwo0zgvN6piFP3W3wGJkzuGK3y0Z8tZZuj8zvDOOsR6nU9g2Ff95L
 8K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sgchCCNHNRcv7zFFPZgHYphadLRf7lxSLp/DMSmmDbA=;
 b=nnH/Z9o1UQL+tgq2xOKRK1CrFoWY9rb4/tLqW5+Sk3mnxNqGQIhy8SfvTxN2X6+pBr
 yZ+iBNLBS8THeJQwKnQPsy3cWKFVrRz2u/a2woIUhF/UjVmPi52ZMgyoMSDSC/GDuouX
 N3maXQ8tQ8mNzwQJ0oKuBmYeGirnwRDWPQZktAO1LfmPTT4oy5UYxw0AgCph5yqkneT2
 VdILMSRptMnyBwnjSCoLWpT7bzO+awr9OvrnHXJNN38GrOn/ZGVDf46F0gZMOhngGlO3
 YYZI7b/Gey5U4l2WR7TEXuVAK/+0eJf1/JBOeIim3kP3nMKNVzrjzufJl/7ACokLsal1
 43Jw==
X-Gm-Message-State: AFqh2krKTeLZ8D+lh7nvWyDteoF/tqdCAL7vsFTFQyG9u45tGFseIrVg
 sIAyEG/oRoImCiVTJYyDNT7YpNGi3CkaYL8klJYWRg==
X-Google-Smtp-Source: AMrXdXs4VBNA6ZBXRdxyZ3bKRbEgkfjWfGQpICiS5WBpPLN13qt1PXequNidR31xIywWwbpCHv53hzV45/bMKIyn5yg=
X-Received: by 2002:a17:90b:3d0e:b0:226:9f33:76bf with SMTP id
 pt14-20020a17090b3d0e00b002269f3376bfmr1119864pjb.221.1673043268488; Fri, 06
 Jan 2023 14:14:28 -0800 (PST)
MIME-Version: 1.0
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-17-richard.henderson@linaro.org>
 <CAFEAcA-m32sjkQSSkM1QopiqKgn+4OLTxs+c3w-+zck8Ns86yg@mail.gmail.com>
 <b52d4a65-3aa7-d9f1-a589-a0db64ee5e78@linaro.org>
In-Reply-To: <b52d4a65-3aa7-d9f1-a589-a0db64ee5e78@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 22:14:17 +0000
Message-ID: <CAFEAcA8SrKxe9XZCuuPCneFtTgAbe8Hs1neZmjenNXd04dWu_w@mail.gmail.com>
Subject: Re: [RFC PATCH 16/40] target/arm: Represent the entire MPIDR_EL1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, armbru@redhat.com, ajones@ventanamicro.com, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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

On Fri, 6 Jan 2023 at 19:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/6/23 11:16, Peter Maydell wrote:
> > On Tue, 3 Jan 2023 at 18:24, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Replace ARMCPU.mp_affinity with CPUARMState.cp15.mpidr_el1,
> >> setting the additional bits as required.  In particular,
> >> always set the U bit when there is only one cpu in the system.
> >> Remove the mp_is_up bit which attempted to do the same thing.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/cpu.h     |  7 ++--
> >>   target/arm/cpu.c     | 80 +++++++++++++++++++++++++++++++++++++-------
> >>   target/arm/cpu_tcg.c |  1 -
> >>   target/arm/helper.c  | 25 ++------------
> >>   target/arm/hvf/hvf.c |  2 +-
> >>   target/arm/kvm64.c   |  4 +--
> >>   6 files changed, 75 insertions(+), 44 deletions(-)
> >
> > Based purely on the diffstat it's not super-obvious why this
> > is an improvement. What's the rationale ?
>
> It gets rid of cpu->mp_is_up, set only by cortex-r5, and then generalizes.
>
> > Side note, we don't currently handle the MT bit, where some
> > CPUs end up putting the cpu number in the Aff1 field rather
> > than Aff0. We ideally ought to handle that too.
>
> Would that be set by the board as well?  I don't think we model cpu
> packages/clusters/whatchacallums at that level currently.

It's a fixed property of the CPU implementation, same as
mp_is_up. We currently mismodel Cortex-A55, Cortex-A76
and Neoverse-N1, which should all be setting the MT bit in
MPIDR and having the cpu number in Aff1. See this thread:
 https://lore.kernel.org/qemu-devel/CAFEAcA9P2-v94p8H8+ktnf-Yf-rucbGySXE6AGPdwvDxXfP=ZA@mail.gmail.com/

+    if (arm_feature(env, ARM_FEATURE_V7MP)) {
+        cpu->mpidr_el1 |= (1u << 31);   /* M */
+        if (cpu->core_count == 1) {
+            cpu->mpidr_el1 |= 1 << 30;  /* U */
+        }
+    }

This is wrong, incidentally -- a single Cortex A9, A53, etc does
not set the U bit. (It's "a cluster with 1 core in it", not
"a uniprocessor system".) The reason mp_is_up is set only
by the R5 model is because "we implement the MP extensions
but consider ourselves to be not part of a cluster" is a
behaviour of only this CPU. I forget why I didn't implement
it as an ARM_FEATURE_FOO bit.

thanks
-- PMM

