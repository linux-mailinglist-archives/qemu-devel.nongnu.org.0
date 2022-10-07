Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE15F7A96
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:33:18 +0200 (CEST)
Received: from localhost ([::1]:53910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpLh-0001AP-F8
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ognhn-0002UX-3b
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:47:59 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ognhj-0007GY-Mf
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:47:58 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso4823870pjk.1
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 06:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+PrtEfpecHSBapt/r6+/1FmwH25AdXTSiY4baPW2Vxg=;
 b=PZ53uNVIgWd/MmxpxxjjQqBF9oPdnKaSj809whMJzTNiFaWvuEnnNsBScTliU5B9Ts
 uTL/Tkgev5iyF2fcqR08ZMj2FapNqqT8CNSLJAfVV8Urm9/SK9W0ye7UBvfnAg+BQxYh
 1ayqr0Cy8y67QTx/P+I91zk+aPXo8uFuK/iGxeleAx25v3UzL3Qyp4rErHsPWS8q2j6Z
 Tft5JjS1Og0dl6zMDECT1ImoYr61K3EczpUD0lP+aQzMSOKMQf2MqlQt94mymCt67sW0
 nGN4qrTq/11YH2k/+f9BZ+wKp5FfOiHv/Ws63lwqnuSf4y1c2M46jx9OJGmPIQV89D4J
 sFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+PrtEfpecHSBapt/r6+/1FmwH25AdXTSiY4baPW2Vxg=;
 b=DPm5j0DpzQDJxg40HUJReDiNgXUg2BjKHkaDgjYvC4xwqK61gySKK3+vcPdRRpPdTX
 pjXecXoGaS+S+El02oM/RGlC6d7kWQBK5fLHBJdQWa+uCIWzuL789V8ynDuliU13ywDW
 5KO+5zgJvNFLI0mI1L857BaGXPnxt+ewAewvGo8gRQhuDYW/6SSxdqHoZice+oWoKFbG
 QZe7JxxTSBuAC+El+Z7OdZdOLbL8ksWFlJP7nw/4Z6qN+DXM+KqsIpI0CEnOvd3JcsSp
 plNPeC4rnUlFrM3wDssjpRP42tK+oRIKCQqDcA7Nl1FfXrzsSMVSKsnR80rb9q9Ce5kl
 z+CA==
X-Gm-Message-State: ACrzQf3SQrxCSidAhg2O8921c8kAPdhAOWWuR6FkVOjHaOJDsRz4sz5i
 nPHnAlBtRZbY+ie9z8igWxKl3eQig/4Te6aRxoMM7w==
X-Google-Smtp-Source: AMsMyM7MAYX7XXZRxwp45cF7RkGuTNmpDEUi2n9yIPWRKf8B6s05F29tHWhPVIE/vabrdGt+f65Vnwq4o/YdKSKTbiA=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr4874959plb.60.1665150473883; Fri, 07
 Oct 2022 06:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-42-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 14:47:41 +0100
Message-ID: <CAFEAcA-LhvMYbTTcsC+eAcAeA61e9Kq=zf6fKr5j_4dusuRDiw@mail.gmail.com>
Subject: Re: [PATCH v3 41/42] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 1 Oct 2022 at 18:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Perform the atomic update for hardware management of the access flag
> and the dirty bit.
>
> A limitation of the implementation so far is that the page table
> itself must already be writable, i.e. the dirty bit for the stage2
> page table must already be set, i.e. we cannot set both dirty bits
> at the same time.
>
> This is allowed because it is CONSTRAINED UNPREDICTABLE whether any
> atomic update happens at all.  The implementation is allowed to simply
> fall back on software update at any time.

I can't see where in the Arm ARM this is stated.

In any case, if HA is set you can't simply return ARMFault_AccessFlag
without breaking the bit in D5.4.12 which says
"When hardware updates of the Access flag are enabled for a stage of
 translation an address translation instruction that uses that stage
 of translation will not report that the address will give rise to
 an Access flag fault in the PAR"

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/system/arm/emulation.rst |   1 +
>  target/arm/cpu64.c            |   1 +
>  target/arm/ptw.c              | 119 ++++++++++++++++++++++++++++++++--
>  3 files changed, 115 insertions(+), 6 deletions(-)
>
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index be7bbffe59..c3582d075e 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -31,6 +31,7 @@ the following architecture extensions:
>  - FEAT_FRINTTS (Floating-point to integer instructions)
>  - FEAT_FlagM (Flag manipulation instructions v2)
>  - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
> +- FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
>  - FEAT_HCX (Support for the HCRX_EL2 register)
>  - FEAT_HPDS (Hierarchical permission disables)
>  - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index e6314e86d2..b064dc7964 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -1116,6 +1116,7 @@ static void aarch64_max_initfn(Object *obj)
>      cpu->isar.id_aa64mmfr0 = t;
>
>      t = cpu->isar.id_aa64mmfr1;
> +    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */

I think we should split the access flag update and the
dirty-bit update into separate commits. It might be useful
for bisection purposes later, and it looks like they're pretty
cleanly separable. (Though if you look at my last comment in this
email, maybe not quite so clean as in the code as you have it here.)

>      t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
>      t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
>      t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 45734b0d28..14ab56d1b5 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -223,6 +223,7 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
>  typedef struct {
>      bool is_secure;
>      bool be;
> +    bool rw;
>      void *hphys;
>      hwaddr gphys;
>  } S1TranslateResult;
> @@ -261,7 +262,8 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>              pte_attrs = s2.cacheattrs.attrs;
>              pte_secure = s2.f.attrs.secure;
>          }
> -        res->hphys = NULL;
> +        res->hphys = NULL;  /* force slow path */
> +        res->rw = false;    /* debug never modifies */
>      } else {
>          CPUTLBEntryFull *full;
>          int flags;
> @@ -276,6 +278,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>              goto fail;
>          }
>          res->gphys = full->phys_addr;
> +        res->rw = full->prot & PAGE_WRITE;
>          pte_attrs = full->pte_attrs;
>          pte_secure = full->attrs.secure;
>      }
> @@ -381,6 +384,56 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
>      return data;
>  }
>
> +static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
> +                             uint64_t new_val, const S1TranslateResult *s1,
> +                             ARMMMUFaultInfo *fi)
> +{
> +    uint64_t cur_val;
> +
> +    if (unlikely(!s1->hphys)) {
> +        fi->type = ARMFault_UnsuppAtomicUpdate;
> +        fi->s1ptw = true;
> +        return 0;
> +    }
> +
> +#ifndef CONFIG_ATOMIC64
> +    /*
> +     * We can't support the atomic operation on the host.  We should be
> +     * running in round-robin mode though, which means that we would only
> +     * race with dma i/o.
> +     */
> +    qemu_mutex_lock_iothread();

Are there definitely no code paths where we might try to do
a page table walk with the iothread already locked ?

> +    if (s1->be) {
> +        cur_val = ldq_be_p(s1->hphys);
> +        if (cur_val == old_val) {
> +            stq_be_p(s1->hphys, new_val);
> +        }
> +    } else {
> +        cur_val = ldq_le_p(s1->hphys);
> +        if (cur_val == old_val) {
> +            stq_le_p(s1->hphys, new_val);
> +        }
> +    }
> +    qemu_mutex_unlock_iothread();
> +#else
> +    if (s1->be) {
> +        old_val = cpu_to_be64(old_val);
> +        new_val = cpu_to_be64(new_val);
> +        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)s1->hphys,
> +                                           old_val, new_val);
> +        cur_val = be64_to_cpu(cur_val);
> +    } else {
> +        old_val = cpu_to_le64(old_val);
> +        new_val = cpu_to_le64(new_val);
> +        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)s1->hphys,
> +                                           old_val, new_val);
> +        cur_val = le64_to_cpu(cur_val);
> +    }
> +#endif
> +
> +    return cur_val;
> +}
> +
>  static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
>                                       uint32_t *table, uint32_t address)
>  {
> @@ -1290,6 +1343,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>          goto do_fault;
>      }
>
> + restart_atomic_update:
>      if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
>          /* Invalid, or the Reserved level 3 encoding */
>          goto do_translation_fault;
> @@ -1365,10 +1419,28 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>       * Here descaddr is the final physical address, and attributes
>       * are all in attrs.
>       */
> -    if ((attrs & (1 << 10)) == 0) {
> +    if ((attrs & (1 << 10)) == 0 && !debug) {
>          /* Access flag */
> -        fi->type = ARMFault_AccessFlag;
> -        goto do_fault;
> +        uint64_t new_des, old_des;
> +
> +        /*
> +         * If HA is disabled, or if the pte is not writable,
> +         * pass on the access fault to software.
> +         */
> +        if (!param.ha || !s1.rw) {
> +            fi->type = ARMFault_AccessFlag;
> +            goto do_fault;
> +        }
> +
> +        old_des = descriptor;
> +        new_des = descriptor | (1 << 10); /* AF */
> +        descriptor = arm_casq_ptw(env, old_des, new_des, &s1, fi);
> +        if (fi->type != ARMFault_None) {
> +            goto do_fault;
> +        }
> +        if (old_des != descriptor) {
> +            goto restart_atomic_update;

Do we really need to go all the way back to restart_atomic_update?
My reading of the Arm ARM is that we just need the "write the Access bit"
to be atomic, not that everything we do with the descriptor must be atomic.
Though the pseudocode does do a complete loop back like this, so I guess
that's the 'safe' interpretation. Hmm...

> +        }
>      }
>
>      ap = extract32(attrs, 6, 2);
> @@ -1385,8 +1457,43 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>      }
>
>      if (!(result->f.prot & (1 << access_type))) {
> -        fi->type = ARMFault_Permission;
> -        goto do_fault;
> +        uint64_t new_des, old_des;
> +
> +        /* Writes may set dirty if DBM attribute is set. */
> +        if (!param.hd
> +            || access_type != MMU_DATA_STORE
> +            || !extract64(attrs, 51, 1)  /* DBM */
> +            || !s1.rw) {
> +            fi->type = ARMFault_Permission;
> +            goto do_fault;
> +        }
> +
> +        old_des = descriptor;
> +        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
> +            new_des = descriptor | (1ull << 7);   /* S2AP[1] */
> +        } else {
> +            new_des = descriptor & ~(1ull << 7);  /* AP[2] */
> +        }

If we update the prot bits, we need to also re-calculate the exec bit,
I think, because the execute-never stuff depends on whether the page is
writeable. Alternatively you can do it the way the pseudocode does and
pre-figure-out the final permission bits value (see AArch64.S1ApplyOutputPerms()
and AArch64.S2ApplyOutputPerms()) so you only need to calculate the
exec bit once.

> +
> +        /*
> +         * If the descriptor didn't change, then attributes weren't the
> +         * reason for the permission fault, so deliver it.
> +         */
> +        if (old_des == new_des) {
> +            fi->type = ARMFault_Permission;
> +            goto do_fault;
> +        }
> +
> +        descriptor = arm_casq_ptw(env, old_des, new_des, &s1, fi);

Are we allowed to do the access and dirty bit updates with separate
atomic accesses? This bit in D5.4.12 suggests the expectation is
it will be a single atomic rmw to update the whole thing:

"For a Block or Page Translation Table descriptor for which the AF
 bit is 0, the DBM bit is 1, and either the value of the stage 1
 AP[2] bit is 1 or the value of the stage 2 S2AP[1] bit is 0, both
 AF can be set to 1, and either AP[2] set to 0 or S2AP[1] set to 1,
 in a single atomic read-modify-write operation, as a result of an
 attempted write to a memory location that uses the translation
 table entry."

(though it depends how you interpret that "can"...)

> +        if (fi->type != ARMFault_None) {
> +            goto do_fault;
> +        }
> +        if (old_des != descriptor) {
> +            goto restart_atomic_update;
> +        }
> +
> +        /* Success: the page is now writable. */
> +        result->f.prot |= 1 << MMU_DATA_STORE;
>      }
>
>      if (ns) {
> --
> 2.34.1

thanks
-- PMM

