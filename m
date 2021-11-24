Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B345CAB3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 18:12:03 +0100 (CET)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpvoP-0000PJ-PX
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 12:12:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpvmh-0005uf-Ud
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:10:16 -0500
Received: from [2a00:1450:4864:20::434] (port=34398
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpvmd-0008M1-L3
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 12:10:15 -0500
Received: by mail-wr1-x434.google.com with SMTP id j3so5511510wrp.1
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 09:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lUgGk4Y9SUXNaFFkMjbf7Vqvt0fKzJOmKbaBE7oKM/Y=;
 b=izxyB96QZlXb1bVnPQG4S0OTyE9FR1Iz3rJmEtKxhuryNiJxQxEu2MccLd7jy29T1G
 ygfja0JXXq7wK4Onyx+/0Y/S4kqRabhLoYoYKcIo9ka/cUiFbBxfTS1u+gmpHpJJde8E
 0K8TA6YZrV/lPCnVLBTGVL/dCqeXCOYW7cQ4C4sIEcrV2Ot1xrRJK4EyuefPqZNa9rSM
 oSrVEMT1chhtBsNol98ZkxzXLFr/G8+GGrb4GXLmt7zozVfTRGSyxXwg5rnqzvc2bUyc
 3cp5yb0fNgxb2680Z8KQGQCCIWtiVw2OkMC///rwa5CwAHwQZ/7Srihv4T7C4g4AU2WC
 GUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lUgGk4Y9SUXNaFFkMjbf7Vqvt0fKzJOmKbaBE7oKM/Y=;
 b=gYd1uUnLPEiwYfW2bym1d5jecn8T+k7QLybBnfLWl0Wn7bRYTvYpQeJZRc0jVBnVSX
 s0bAyKb10HyI92iCvkgBx+Z9ZYXUP7pKiw9k/RMjR2YigbsHWw+M9iEYorbJmcOjgALJ
 mEVY9fVdgOfZ9mbENtc6zDACOVVwViwi4yGc2sGWg9RFyua9qIzFxG/Xeuf3S4tPJzjU
 UCKyNdNFK5XKcN+2AouzXx7d3BvtEqgOWwCci5Y0GpdpnjA9ZzruZKb7+ItmJ1iqfK1U
 1FpZZtNVXj87ZGjzfS9qaSgVthBcMoUnlBsLfhyss1Pr9JIF+QqAPq07maQZ6qdVdT+C
 jIvg==
X-Gm-Message-State: AOAM531p6MCLOi4bORUoCtcAGD4aeFNMBstSO6VKNI0gBvfUaRCp0ODs
 vDi8+7SmY8SRP7n8qWZwnJ7IdOWq8p4Fk6ModS1qIg==
X-Google-Smtp-Source: ABdhPJwP4j6L3/EFJJZpn+IPs4Iy+4t9E47aUqOxz6EfZ15gU9OcALYo+tQcKBpa670YRnpWJY4L2PUWWST+PJ7xess=
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr21382830wrf.302.1637773810027; 
 Wed, 24 Nov 2021 09:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20211123171031.975367-1-peter.maydell@linaro.org>
 <CAFEAcA8XMtAHKY=saAajLc2b03_PHGi+G=iioEpeetuS3Hh5yg@mail.gmail.com>
 <233AD939-3A37-4075-8430-8FFBC6A04836@hxcore.ol>
In-Reply-To: <233AD939-3A37-4075-8430-8FFBC6A04836@hxcore.ol>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Nov 2021 17:09:58 +0000
Message-ID: <CAFEAcA_dnt5bSzdkhR99JHVKXL48KqMJDQg7uN6-cyypLfzj7w@mail.gmail.com>
Subject: Re: [for-6.2] hw/intc/arm_gicv3: Update cached state after
 acknowledging LPI
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Nov 2021 at 19:22, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Since LPIs do not have an active or active and pending state,the current implementation only clears the LPI pending state from the pending table once ICC_IAR1_EL1 acknowledges the interrupt.
>
> But, as part of gicv3_lpi_pending() processing, cs->hpplpi is updated with the next best priotiy lpi (only if the current acknowledged irq was best priority irq).

Yes. But we don't update cs->hppi there, and the GIC code assumes
that that cs->hppi always indicates the highest priority pending
interrupt, so leaving it stale will break things.

> By calling gicv3_redist_update() in icc_activate_irq(), we are
> re-initiating high priority irqs scan in redistributor and if
> applicable trigger of next best pending lpi from the latest
> cs->hpplpi info (which otherwise would have happened on next
> irq trigger from source).

We will figure out which the next best pending interrupt is
(which might be an LPI or might be some other interrupt).
But we won't actually trigger it, because it must be lower
priority than the LPI that we are activating.

(The way this works is that activating the LPI in icc_activate_irq()
writes into the Active Priority Registers to indicate the priority
of the current active interrupt. When gicv3_cpuif_update() is
deciding whether to set IRQ/FIQ to tell the CPU it has an interrupt
it calls icc_hppi_can_preempt(), which checks the priority of the
pending interrupt recorded in cs->hppi against the priority
of the active interrupt as calculated by icc_highest_active_prio().
So we won't take another interrupt until either (a) this one is
deactivated or (b) a fresh one arrives at a higher priority.)

-- PMM

