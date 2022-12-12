Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918164A4AD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:18:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4lUI-0004rN-DD; Mon, 12 Dec 2022 11:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4lUE-0004qm-Fw
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:17:02 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4lUC-0008JP-RQ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:17:02 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so317850pjr.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5uOiTnX4huuSRRuxb+Xsfwnc2vZE5IebtoMrPgdsREI=;
 b=Tl3+8AvtiOO2Ze8iFAJHJLY+DFy5vhzFwAgp1qOO3bfyBZFaX7NV3/qW8psifhsoLF
 bC8C3HOB5uHuH3ojRYhdEk3KdVNxzTiGUwq/dIYeqJ/xgKNrMT+LyaIaLQbMGU5t6gE6
 DEEZgFMdLUMmUrH7m5mHzG5rKt9tckNw+5oLTefiQe5p3bqgQb2bqmtAyH9My0qggozA
 tStgKBm/tIskxVfUkI3Yp+NdV83JxlAPaIWg4qWcDYyZBq4K+YjiTUJQ0KhiO8b5arir
 7h3uieJgcmW8Qiaz+fjj/oz+9boeOv8qyYCP4Fl8fvp97ckPVYcCJ13KOAecQ1AYcApz
 E4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5uOiTnX4huuSRRuxb+Xsfwnc2vZE5IebtoMrPgdsREI=;
 b=qPc1Xb9RKIeGwUxlVLOU3PwKobGX6+hsFSZN9Ry5UpJr756nRu+mtD+Io9Kg76Yp4g
 LClmlVGRI2+8SfxM870mEKtPzmqwZZloupE6lORPv0IAeI31Y0WsjxF67nLpkU0JvqWH
 1c6lum3YkCRuImg3GqgXB9+TqudRvvROUjPfSLbGYVox5b7YztydK+BlDMhgIhw+D34d
 Nru+N3kuBTZsVVPPQ4a8FHMxn+lmTm/Ng7xA0CxFTsMfRQ/rptBRO2DEx8yZ8j5icSp3
 ktUWUi4+JWXj4sufYywzS2kSXZIcBgDb2cvetcX/LhaFv5hFECFCXXl4NajehbNkbcPA
 Tk9A==
X-Gm-Message-State: ANoB5pk0nX3ESFWmPXwUgjiZKyFhd8PlVA4v39TrjY1UxAAzjaDYUZZf
 W8oRfs4XnD0TEHpAV5v9yrz/WEJHT62f76lB4TWXtw==
X-Google-Smtp-Source: AA0mqf7yF5K+WEblXjnxcNYOLVN/fj+5blWB5eitiFbcN1C2+XDBtzLY6b/dmQM5rxak6rBwhxZ6gSxEFF3Z/KoIO2w=
X-Received: by 2002:a17:90b:3c0b:b0:219:e2f1:81ad with SMTP id
 pb11-20020a17090b3c0b00b00219e2f181admr17833071pjb.19.1670861819371; Mon, 12
 Dec 2022 08:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
 <20221116174749.65175-3-fcagnin@quarkslab.com>
In-Reply-To: <20221116174749.65175-3-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Dec 2022 16:16:47 +0000
Message-ID: <CAFEAcA_QvfancWKj2hL3KxbyLm8FxkteSbgxvkF8QO119H7SNA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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

On Wed, 16 Nov 2022 at 17:48, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>
> Guests can be debugged through the gdbstub.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>

Hi; sorry it's taken me a while to get to this patchset.

> +void hvf_arch_update_guest_debug(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    hv_return_t r = HV_SUCCESS;
> +    bool trap_debug_exceptions = false;
> +
> +    cpu_synchronize_state(cpu);
> +
> +    if (cpu->singlestep_enabled) {
> +        trap_debug_exceptions = true;
> +
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 1);
> +        pstate_write(env, pstate_read(env) | PSTATE_SS);
> +    } else {
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 0);
> +    }
> +
> +    if (hvf_sw_breakpoints_active(cpu)) {
> +        trap_debug_exceptions = true;
> +    }
> +
> +    if (hvf_arm_hw_debug_active(cpu)) {
> +        trap_debug_exceptions = true;
> +
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 1);
> +
> +        int i;
> +        for (i = 0; i < cur_hw_bps; i++) {
> +            HWBreakpoint *bp = get_hw_bp(i);
> +            env->cp15.dbgbcr[i] = bp->bcr;
> +            env->cp15.dbgbvr[i] = bp->bvr;
> +        }
> +        for (i = 0; i < cur_hw_wps; i++) {
> +            HWWatchpoint *bp = get_hw_wp(i);
> +            env->cp15.dbgwcr[i] = bp->wcr;
> +            env->cp15.dbgwvr[i] = bp->wvr;
> +        }

Can you explain how the patches keep the guest's idea of the debug
registers distinct from the QEMU debugstub's values from them?
Looking at this patch it seems like we just directly set the
cp15.* values with what the debug stub wants them to be here;
but in patch 3 any trapped guest writes to the debug registers
also simply write to the same env fields.

With KVM, this is handled by the host kernel: QEMU tells KVM
that it wants to do guest debug, and then uses the KVM_SET_GUEST_DEBUG
ioctl to say what the bp/wp etc register values should be. The
KVM kernel then uses those values when it runs the VM, as well
as ensuring that debug exceptions go to EL2 rather than EL1,
and that EL1 accesses to the debug regs are also trapped to EL2.
Guest attempts to access the debug registers are then handled by
having reads and writes access fields which correspond to the
guest's view of the debug registers, which is separate from the
values that the QEMU debug stub is using. The effect is that while
QEMU is doing debug of the VM, the guest can still read and write
the debug registers, they just don't have any effect. The guest
can't do anything that messes with the state of the debug registers
that QEMU's debug stub is relying on. If/when QEMU says it's
done with doing guest debug, then the host kernel goes back to using
the guest's values of the debug registers. (In the kernel sources
this is done in arch/arm64/kvm/debug.c, with the trapping of debug
registers done in arch/arm64/kvm/sys_regs.c.)

I suspect that with HVF we need to do the equivalent of this ourselves
in QEMU.

thanks
-- PMM

