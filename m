Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D7D131695
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 18:17:36 +0100 (CET)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioW0V-0001ad-4B
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 12:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioVy9-0008K9-4s
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:15:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioVy7-0007dq-8s
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:15:09 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44829)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioVy6-0007an-Sd
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:15:07 -0500
Received: by mail-ot1-x344.google.com with SMTP id h9so69915388otj.11
 for <qemu-devel@nongnu.org>; Mon, 06 Jan 2020 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LQxidMh1ompo67sH9IV7Q3/gPnh7WO+DzKCNJVGFP7o=;
 b=k81n14NwPPVPYVV1VrArC4mklYxXlDkp9N7qgNTs1of1EVbbK9rdktSkfO0WyNepiy
 FOR2fjKE/z1MCYorKBFypoAAEwUNEMn/cXEczHZYfhYYMPdxTO7QyFq4rj0/Qu7KzmBZ
 sNLQhaAlR0uKT+g+rGX/VamAxHCb4KY+Hr/A03qXCJxRQmn8saikgAKimrhItAj/OTw0
 afUe+62y7uZBi7rfScNLHPQ1Rrn5DI/1nyAWYFiCemfSXvkoWiOMDkln4Btl0uWesPoL
 BqVwIiqmjyRRwQWxRbZ8TUDofs4RQCoaQ61qIH2afba94P/9Bj/8APSMiI0QLfCXXqWf
 ERog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LQxidMh1ompo67sH9IV7Q3/gPnh7WO+DzKCNJVGFP7o=;
 b=D8HzkAaXuYzbgSdScqHxhS1J3mhPCnmFKi2WNNN58ooS7SDnjpMSpSpd836RMZk3uc
 ArzmMc39NLyIzmIuJDPt0svKO/nd7BWhTmEs9PBzUc/lbdyLsi+cq3OdpjLWj1v21Yn6
 JzGXCoU3dt0Q9OZFczM5XfNFJyVR+tJHY+SfnT8cBDV6tocLHx7XaiUYSCRkifppLKqm
 IAmjzT2IFO6JXYLrb7ZGqehjIi5QNdE2UMHcacHfmxdQSeosmay/17is6qK618r/tML5
 ufm6GiMMPLA3P5r0n+2zfiO3Y0uNkBWmHO/jDe4x6tIpS84drIScZ5KV3JlQXzIQj+9i
 Mxnw==
X-Gm-Message-State: APjAAAXWL8vxTYDW91se+Cp/Cf1AZWfZETjCR1lEupyWBdZBOMHB3CPp
 /Xr+h8qs26T/o28cYdrrtVGO7ellmzglrIt8sSkKWQ==
X-Google-Smtp-Source: APXvYqwqxtRluDBEbFx9iMttfES9Gc722FgKx7f+yJzGProOWK4IuiPt2ajeHpPpeFO6CN4FNktGJ5SQFW5YmsiMZ2E=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr100401197ota.232.1578330904812; 
 Mon, 06 Jan 2020 09:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20191220202707.30641-1-beata.michalska@linaro.org>
 <20191220202707.30641-2-beata.michalska@linaro.org>
In-Reply-To: <20191220202707.30641-2-beata.michalska@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 17:14:53 +0000
Message-ID: <CAFEAcA-N=Xsnb3522mm7tT-7TOxBtJ6S_cE23XHw-4vXVVA7Xw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] target/arm: kvm: Handle DABT with no valid ISS
To: Beata Michalska <beata.michalska@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christoffer Dall <Christoffer.Dall@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Dec 2019 at 20:27, Beata Michalska
<beata.michalska@linaro.org> wrote:
>
> On ARMv7 & ARMv8 some load/store instructions might trigger a data abort
> exception with no valid ISS info to be decoded. The lack of decode info
> makes it at least tricky to emulate those instruction which is one of the
> (many) reasons why KVM will not even try to do so.
>
> Add suport for handling those by requesting KVM to inject external
> dabt into the quest.
>
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  accel/kvm/kvm-all.c    | 15 +++++++
>  accel/stubs/kvm-stub.c |  4 ++
>  include/sysemu/kvm.h   |  1 +
>  target/arm/cpu.h       |  3 +-
>  target/arm/kvm.c       | 95 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/kvm32.c     |  3 ++
>  target/arm/kvm64.c     |  3 ++
>  target/arm/kvm_arm.h   | 19 +++++++++
>  8 files changed, 142 insertions(+), 1 deletion(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index ca00daa2f5..a3ee038142 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2174,6 +2174,14 @@ static void do_kvm_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
>      }
>  }
>
> +static void do_kvm_cpu_synchronize_state_force(CPUState *cpu,
> +                                               run_on_cpu_data arg)
> +{
> +    kvm_arch_get_registers(cpu);
> +    cpu->vcpu_dirty = true;
> +}

Why is this functionality special such that it needs a non-standard
way of synchronizing state with KVM that nothing else does ?

> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 9fe233b9bf..0cacc61d8a 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -483,6 +483,7 @@ void kvm_cpu_synchronize_state(CPUState *cpu);
>  void kvm_cpu_synchronize_post_reset(CPUState *cpu);
>  void kvm_cpu_synchronize_post_init(CPUState *cpu);
>  void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
> +void kvm_cpu_synchronize_state_force(CPUState *cpu);
>
>  void kvm_init_cpu_signals(CPUState *cpu);
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5f70e9e043..e11b5e7438 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -558,7 +558,8 @@ typedef struct CPUARMState {
>          uint8_t has_esr;
>          uint64_t esr;
>      } serror;
> -
> +    /* Status field for pending extarnal dabt */

"external" (I think you have the same typo later in the patch too)

> +    uint8_t ext_dabt_pending;
>      /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
>      uint32_t irq_line_state;


> @@ -701,6 +719,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>              ret = EXCP_DEBUG;
>          } /* otherwise return to guest */
>          break;
> +    case KVM_EXIT_ARM_NISV:
> +        /* External DAB with no valid iss to decode */

"DABT"

> +        ret = kvm_arm_handle_dabt_nisv(cs, run->arm_nisv.esr_iss,
> +                                 run->arm_nisv.fault_ipa);

(indentation looks odd here?)

> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
>                        __func__, run->exit_reason);
> @@ -835,3 +858,75 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
>  {
>      return (data - 32) & 0xffff;
>  }
> +
> +int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
> +                              uint64_t fault_ipa)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    hwaddr xlat, len;
> +    AddressSpace *as = cs->as ? cs->as : &address_space_memory;

I don't think you should need to test cs->as for NULL;
qemu_init_vcpu() ensures that one is always set up.

Probably the neatest way to get the AddressSpace* is to
call arm_addressspace(cs, MEMTXATTRS_UNSPECIFIED).


> +    int store_ins = ((esr_iss >> 6) & 1); /* WnR bit */

This should be a bool (matching the argument type for
address_space_translate), so you can just do
   bool is_write = esr_iss & (1 << 6);

> +    int ret;
> +
> +    /*
> +     * Note: The ioctl for SET_EVENTS will be triggered before next
> +     * KVM_RUN call though the vcpu regs need to be updated before hand
> +     * so to not to overwrite changes done by KVM upon injecting the abort.
> +     * This sadly requires running sync twice - shame ...
> +     */
> +    kvm_cpu_synchronize_state(cs);
> +   /*
> +    * ISS [23:14] is invalid so there is a limited info
> +    * on what has just happened so the only *useful* thing that can
> +    * be retrieved from ISS is WnR & DFSC (though in some cases WnR
> +    * might be less of a value as well)
> +    */
> +    /* Verify whether the memory being accessed is even recognisable */
> +    if (!address_space_translate(as, fault_ipa, &xlat, &len,
> +                                 store_ins, MEMTXATTRS_UNSPECIFIED)) {
> +        error_report("An attemp to access memory outside of the boundries"

"attempt"; "boundaries". But I think what we should actually report here
is:

"Guest attempted to access memory/device at guest physical address
0x... using an instruction that KVM could not emulate (no valid ISS).
Injecting a data abort exception into guest."

It doesn't seem to me worth distinguishing whether the guest
physical address happens to have anything mapped there or not;
we're going to inject a somewhat bogus dabt anyway.

After the initial error_report(), supplemental information like
the offending instruction should be printed with error_printf(),
because it isn't a separate new error.

> +                     "at 0x" TARGET_FMT_lx, (target_ulong) fault_ipa);
> +    } else {
> +        uint32_t ins;
> +        uint8_t ins_fetched;
> +
> +        /*
> +         * Get current PC before it will get updated to except vector entry

"exception"

> +         */
> +        target_ulong ins_addr = is_a64(env) ? env->pc
> +                                /* AArch32 mode vs T32 aka Thumb mode */
> +                                : env->regs[15] - (env->thumb ? 4 : 8);
> +
> +        /*
> +         * Get the faulting instruction
> +         * Instructions have a fixed length of 32 bits
> +         * and are always little-endian

...unless they're 16-bit Thumb. In an ideal world you should handle
the Thumb case by doing a 16-bit load, and then loading another 16-bit
value if the top 3 bits of the first part are 0b111.

At least we don't have to consider the possibility ofold-style
really-big-endian-instruction-ordering :-)

> +         */
> +        ins_fetched = !cpu_memory_rw_debug(cs, ins_addr, (uint8_t *) &ins,
> +                                           sizeof(uint32_t), store_ins) ;

stray space before semicolon

> +
> +        error_report("Data abort exception with no valid ISS generated by "
> +                     "memory access at 0x" TARGET_FMT_lx,
> +                     (target_ulong)fault_ipa);
> +        error_report(ins_fetched ? "%s: 0x%" PRIx32 " (encoded)" : "%s",
> +                     "Unable to emulate memory instruction",
> +                     (!ins_fetched ? 0 : ldl_le_p(&ins)));
> +
> +        error_report("Faulting instruction at 0x" TARGET_FMT_lx, ins_addr);
> +    }
> +    /*
> +     * Set pending ext dabt amd trigger SET_EVENTS so that
> +     * KVM can inject the abort
> +     */
> +    env->ext_dabt_pending = 1;
> +
> +    ret = kvm_put_vcpu_events(cpu);
> +
> +    /* Get the most up-tp-date state */

"to"

> +    if (!ret) {
> +        /* Hacky but the sync needs to be forced */
> +        kvm_cpu_synchronize_state_force(cs);
> +    }
> +    return ret;
> +}
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 32bf8d6757..5539c3a3f2 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -240,6 +240,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      /* Check whether userspace can specify guest syndrome value */
>      kvm_arm_init_serror_injection(cs);
>
> +    /* Set status for supporting the extarnal dabt injection */
> +    kvm_arm_init_ext_dabt_injection(cs);
> +
>      return kvm_arm_init_cpreg_list(cpu);
>  }
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 876184b8fe..3da4e2e70e 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -792,6 +792,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      /* Check whether user space can specify guest syndrome value */
>      kvm_arm_init_serror_injection(cs);
>
> +    /* Set status for supporting the extarnal dabt injection */
> +    kvm_arm_init_ext_dabt_injection(cs);
> +
>      return kvm_arm_init_cpreg_list(cpu);
>  }

thanks
-- PMM

