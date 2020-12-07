Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08452D1552
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 16:58:28 +0100 (CET)
Received: from localhost ([::1]:37776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmIuB-00077U-Ft
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 10:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1kmIrw-00061Q-Th
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:56:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:46224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1kmIrt-0006u7-MK
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:56:08 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6113423741;
 Mon,  7 Dec 2020 15:55:58 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kmIrk-00Gnm0-3l; Mon, 07 Dec 2020 15:55:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 07 Dec 2020 15:55:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v6 1/2] arm64: kvm: Save/restore MTE registers
In-Reply-To: <03566358-21b0-11d9-c4f6-d07d137a1009@arm.com>
References: <20201127152113.13099-1-steven.price@arm.com>
 <20201127152113.13099-2-steven.price@arm.com>
 <946b1e7b06c4d286a78cf61408e0fc8d@kernel.org>
 <03566358-21b0-11d9-c4f6-d07d137a1009@arm.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <07e40bbcf734e8c63630168406262bb2@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: steven.price@arm.com, catalin.marinas@arm.com,
 will@kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com,
 suzuki.poulose@arm.com, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dave.Martin@arm.com, mark.rutland@arm.com, tglx@linutronix.de,
 qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, Haibo.Xu@arm.com,
 drjones@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=198.145.29.99; envelope-from=maz@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Haibo Xu <Haibo.Xu@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 qemu-devel@nongnu.org, Catalin Marinas <catalin.marinas@arm.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-12-07 14:48, Steven Price wrote:
> On 03/12/2020 17:07, Marc Zyngier wrote:
>> 
>>> diff --git a/arch/arm64/include/asm/sysreg.h 
>>> b/arch/arm64/include/asm/sysreg.h
>>> index e2ef4c2edf06..b6668ffa04d9 100644
>>> --- a/arch/arm64/include/asm/sysreg.h
>>> +++ b/arch/arm64/include/asm/sysreg.h
>>> @@ -569,7 +569,8 @@
>>>  #define SCTLR_ELx_M    (BIT(0))
>>> 
>>>  #define SCTLR_ELx_FLAGS    (SCTLR_ELx_M  | SCTLR_ELx_A | SCTLR_ELx_C 
>>> | \
>>> -             SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB)
>>> +             SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB | \
>>> +             SCTLR_ELx_ITFSB)
>>> 
>>>  /* SCTLR_EL2 specific flags. */
>>>  #define SCTLR_EL2_RES1    ((BIT(4))  | (BIT(5))  | (BIT(11)) | 
>>> (BIT(16)) | \
>>> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>>> b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>>> index cce43bfe158f..45255ba60152 100644
>>> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>>> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>>> @@ -18,6 +18,11 @@
>>>  static inline void __sysreg_save_common_state(struct kvm_cpu_context 
>>> *ctxt)
>>>  {
>>>      ctxt_sys_reg(ctxt, MDSCR_EL1)    = read_sysreg(mdscr_el1);
>>> +    if (system_supports_mte()) {
>> 
>> Please move the per-VM predicate to this patch so that it can be used
>> not to save/restore the MTE registers if we don't need to.
> 
> There isn't a valid struct kvm_vcpu or struct kvm here. I know there's
> ctx->__hyp_running_vcpu but AFAICT that is only valid with the host
> context.

We have per-CPU variables for the host context. If 
ctx->__hyp_running_vcpu
is non NULL, you know you're on the host.


> 
>> 
>>> +        ctxt_sys_reg(ctxt, RGSR_EL1)    = 
>>> read_sysreg_s(SYS_RGSR_EL1);
>>> +        ctxt_sys_reg(ctxt, GCR_EL1)    = read_sysreg_s(SYS_GCR_EL1);
>>> +        ctxt_sys_reg(ctxt, TFSRE0_EL1)    = 
>>> read_sysreg_s(SYS_TFSRE0_EL1);
>>> +    }
>> 
>> Overall, I still don't understand how this is going to work once
>> we have MTE in the kernel. You mentioned having the ability to
>> create turn off the tag checks at times, but I don't see that
>> in this patch (and I'm not sure we want that either).
> 
> Given that this is now highly unlikely to be merged for v5.11, I'll
> rebase onto of the KASAN MTE series and double check exactly what
> happens. My thought was that it should be as simple as setting TCO,
> but your previous comment about moving the save/restore into assembler
> might be wise in case the compiler starts playing with TCO itself.

Indeed.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

