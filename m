Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A574F607A02
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:57:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltSg-0001Pj-3u
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:57:31 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltSX-0008JJ-Ta
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oltS4-0004Qf-Vz
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:56:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oltS0-000619-Bf
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:56:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a14so2393065wru.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wvWEXDCWexj2nNxdHI7ZWJ91KwbXGeybGhCSuG00e4=;
 b=tq8LXchoCbhpL+EniHi4yM1p/10pEAsMqY4IBwF9b86CrXXro5/FBEee5adDiAjoTb
 E2XAQWJxStJED81KeehE+/tbiqhzqdHXRUvbrEHK3Cq+6RH9BBivM+l84gQYdQLslMU1
 M3fgZ0zJJ0icrRPZT0ggAKy8aSEXw6NPGZbyxcgweGwT+XWpSW8bCN8e+XoFJFcKRndY
 K8nTiFgWG3DscGqdLrupD62cv6Qk8bdu8FgAJSXZw132mM+ucwJobgLhVLPI3PzjnQzf
 lZAspFi2/OnYgt4UQDuwQZ6hJg9hFC9wnCHAPRMpTWglvo5iUiEjq0LJTdO+oLj75ciR
 9gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5wvWEXDCWexj2nNxdHI7ZWJ91KwbXGeybGhCSuG00e4=;
 b=3SMGesZ8jTCDC0GFqCsCRjHr5TjMGrozb9aEjnTxKyM+GCx5klhwJgqCeEgQompu0R
 rDhSRJBreB1cfhyAXRL+Y9HT7DiLhmDqOOg0BbXzwomnZGtB0fWsbWaEX4jZahfYBzpW
 yMgyADk66OmP5sFkSIpHtldoAf3geAQ5Jjxztsd5pgmlxBHKIp1Th/sY763cfDCziPwO
 L11WsR6eT8VtgZ7OhAKrX507XPi3ENYRvybeD60kce8u5ii/FHKUURWBjLVktem65Q3h
 /4HI4QDelFDGIhtXrZjUbWMmdFVaLjMtdQDU0r/dyPKsJsF/fW2bQZOKptULNe48KGhD
 Vc7g==
X-Gm-Message-State: ACrzQf2QjSh1qzmgdmPuEYSZBPqOu0iiQT8h0pptwA4a+dWPMqRGPqAT
 i696yHteHyrHmtckNCfgzM6EUg==
X-Google-Smtp-Source: AMsMyM666DXNuEL6QEkKYawFhczAODmwpJyLQ3VTN+OCz7j3NKd0oS9TISMlhlUsEEWD85GPuUHTwA==
X-Received: by 2002:a5d:5111:0:b0:235:849f:f132 with SMTP id
 s17-20020a5d5111000000b00235849ff132mr6554112wrt.5.1666364200973; 
 Fri, 21 Oct 2022 07:56:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1cf417000000b003c6b874a0dfsm3401345wma.14.2022.10.21.07.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 07:56:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E90521FFB7;
 Fri, 21 Oct 2022 15:56:39 +0100 (BST)
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
 <20221020122146.3177980-13-peter.maydell@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 12/24] target/arm: Use softmmu tlbs for page table walking
Date: Fri, 21 Oct 2022 14:39:00 +0100
In-reply-to: <20221020122146.3177980-13-peter.maydell@linaro.org>
Message-ID: <87tu3x5ioo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> From: Richard Henderson <richard.henderson@linaro.org>
>
> So far, limit the change to S1_ptw_translate, arm_ldl_ptw, and
> arm_ldq_ptw.  Use probe_access_full to find the host address,
> and if so use a host load.  If the probe fails, we've got our
> fault info already.  On the off chance that page tables are not
> in RAM, continue to use the address_space_ld* functions.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20221011031911.2408754-11-richard.henderson@linaro.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

git bisect just pointed at this breaking:

  =E2=9E=9C  ./tests/venv/bin/avocado run tests/avocado/boot_linux_console.=
py:BootLinuxConsole.test_arm_raspi2_uart0
  JOB ID     : 12949b614095bbc064fea1bc260ab2a99e5673a0
  JOB LOG    : /home/alex.bennee/avocado/job-results/job-2022-10-21T14.40-1=
2949b6/job.log
   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_rasp=
i2_uart0: INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: =
Timeout reached\nOriginal
   status: ERROR\n{'name': '1-tests/avocado/boot_linux_console.py:BootLinux=
Console.test_arm_raspi2_uart0', 'logdir': '/home/alex.bennee/avocado/job-re=
sults/job-2022-10-21T14.40-12949b... (90.39 s)
  RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 1 | =
CANCEL 0
  JOB TIME   : 90.73 s

Looking at the log it looks like the kernel never gets started.

>  target/arm/cpu.h        |   5 +
>  target/arm/ptw.c        | 196 +++++++++++++++++++++++++---------------
>  target/arm/tlb_helper.c |  17 +++-
>  3 files changed, 144 insertions(+), 74 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 315c1c2820c..64fc03214c1 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -225,6 +225,8 @@ typedef struct CPUARMTBFlags {
>      target_ulong flags2;
>  } CPUARMTBFlags;
>=20=20
> +typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
> +
>  typedef struct CPUArchState {
>      /* Regs for current mode.  */
>      uint32_t regs[16];
> @@ -715,6 +717,9 @@ typedef struct CPUArchState {
>      struct CPUBreakpoint *cpu_breakpoint[16];
>      struct CPUWatchpoint *cpu_watchpoint[16];
>=20=20
> +    /* Optional fault info across tlb lookup. */
> +    ARMMMUFaultInfo *tlb_fi;
> +
>      /* Fields up to this point are cleared by a CPU reset */
>      struct {} end_reset_fields;
>=20=20
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index c58788ac693..8f41d285b7d 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -9,6 +9,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/range.h"
> +#include "exec/exec-all.h"
>  #include "cpu.h"
>  #include "internals.h"
>  #include "idau.h"
> @@ -21,6 +22,7 @@ typedef struct S1Translate {
>      bool out_secure;
>      bool out_be;
>      hwaddr out_phys;
> +    void *out_host;
>  } S1Translate;
>=20=20
>  static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> @@ -200,7 +202,7 @@ static bool regime_translation_disabled(CPUARMState *=
env, ARMMMUIdx mmu_idx,
>      return (regime_sctlr(env, mmu_idx) & SCTLR_M) =3D=3D 0;
>  }
>=20=20
> -static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
> +static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
>  {
>      /*
>       * For an S1 page table walk, the stage 1 attributes are always
> @@ -211,11 +213,10 @@ static bool ptw_attrs_are_device(uint64_t hcr, ARMC=
acheAttrs cacheattrs)
>       * With HCR_EL2.FWB =3D=3D 1 this is when descriptor bit [4] is 0, ie
>       * when cacheattrs.attrs bit [2] is 0.
>       */
> -    assert(cacheattrs.is_s2_format);
>      if (hcr & HCR_FWB) {
> -        return (cacheattrs.attrs & 0x4) =3D=3D 0;
> +        return (attrs & 0x4) =3D=3D 0;
>      } else {
> -        return (cacheattrs.attrs & 0xc) =3D=3D 0;
> +        return (attrs & 0xc) =3D=3D 0;
>      }
>  }
>=20=20
> @@ -224,32 +225,65 @@ static bool S1_ptw_translate(CPUARMState *env, S1Tr=
anslate *ptw,
>                               hwaddr addr, ARMMMUFaultInfo *fi)
>  {
>      bool is_secure =3D ptw->in_secure;
> +    ARMMMUIdx mmu_idx =3D ptw->in_mmu_idx;
>      ARMMMUIdx s2_mmu_idx =3D is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_=
Stage2;
> +    bool s2_phys =3D false;
> +    uint8_t pte_attrs;
> +    bool pte_secure;
>=20=20
> -    if (arm_mmu_idx_is_stage1_of_2(ptw->in_mmu_idx) &&
> -        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
> -        GetPhysAddrResult s2 =3D {};
> -        S1Translate s2ptw =3D {
> -            .in_mmu_idx =3D s2_mmu_idx,
> -            .in_secure =3D is_secure,
> -            .in_debug =3D ptw->in_debug,
> -        };
> -        uint64_t hcr;
> -        int ret;
> +    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
> +        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
> +        s2_mmu_idx =3D is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
> +        s2_phys =3D true;
> +    }
>=20=20
> -        ret =3D get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
> -                                 false, &s2, fi);
> -        if (ret) {
> -            assert(fi->type !=3D ARMFault_None);
> -            fi->s2addr =3D addr;
> -            fi->stage2 =3D true;
> -            fi->s1ptw =3D true;
> -            fi->s1ns =3D !is_secure;
> -            return false;
> +    if (unlikely(ptw->in_debug)) {
> +        /*
> +         * From gdbstub, do not use softmmu so that we don't modify the
> +         * state of the cpu at all, including softmmu tlb contents.
> +         */
> +        if (s2_phys) {
> +            ptw->out_phys =3D addr;
> +            pte_attrs =3D 0;
> +            pte_secure =3D is_secure;
> +        } else {
> +            S1Translate s2ptw =3D {
> +                .in_mmu_idx =3D s2_mmu_idx,
> +                .in_secure =3D is_secure,
> +                .in_debug =3D true,
> +            };
> +            GetPhysAddrResult s2 =3D { };
> +            if (!get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
> +                                    false, &s2, fi)) {
> +                goto fail;
> +            }
> +            ptw->out_phys =3D s2.f.phys_addr;
> +            pte_attrs =3D s2.cacheattrs.attrs;
> +            pte_secure =3D s2.f.attrs.secure;
>          }
> +        ptw->out_host =3D NULL;
> +    } else {
> +        CPUTLBEntryFull *full;
> +        int flags;
>=20=20
> -        hcr =3D arm_hcr_el2_eff_secstate(env, is_secure);
> -        if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs))=
 {
> +        env->tlb_fi =3D fi;
> +        flags =3D probe_access_full(env, addr, MMU_DATA_LOAD,
> +                                  arm_to_core_mmu_idx(s2_mmu_idx),
> +                                  true, &ptw->out_host, &full, 0);
> +        env->tlb_fi =3D NULL;
> +
> +        if (unlikely(flags & TLB_INVALID_MASK)) {
> +            goto fail;
> +        }
> +        ptw->out_phys =3D full->phys_addr;
> +        pte_attrs =3D full->pte_attrs;
> +        pte_secure =3D full->attrs.secure;
> +    }
> +
> +    if (!s2_phys) {
> +        uint64_t hcr =3D arm_hcr_el2_eff_secstate(env, is_secure);
> +
> +        if ((hcr & HCR_PTW) && S2_attrs_are_device(hcr, pte_attrs)) {
>              /*
>               * PTW set and S1 walk touched S2 Device memory:
>               * generate Permission fault.
> @@ -261,25 +295,23 @@ static bool S1_ptw_translate(CPUARMState *env, S1Tr=
anslate *ptw,
>              fi->s1ns =3D !is_secure;
>              return false;
>          }
> -
> -        if (arm_is_secure_below_el3(env)) {
> -            /* Check if page table walk is to secure or non-secure PA sp=
ace. */
> -            if (is_secure) {
> -                is_secure =3D !(env->cp15.vstcr_el2 & VSTCR_SW);
> -            } else {
> -                is_secure =3D !(env->cp15.vtcr_el2 & VTCR_NSW);
> -            }
> -        } else {
> -            assert(!is_secure);
> -        }
> -
> -        addr =3D s2.f.phys_addr;
>      }
>=20=20
> -    ptw->out_secure =3D is_secure;
> -    ptw->out_phys =3D addr;
> -    ptw->out_be =3D regime_translation_big_endian(env, ptw->in_mmu_idx);
> +    /* Check if page table walk is to secure or non-secure PA space. */
> +    ptw->out_secure =3D (is_secure
> +                       && !(pte_secure
> +                            ? env->cp15.vstcr_el2 & VSTCR_SW
> +                            : env->cp15.vtcr_el2 & VTCR_NSW));
> +    ptw->out_be =3D regime_translation_big_endian(env, mmu_idx);
>      return true;
> +
> + fail:
> +    assert(fi->type !=3D ARMFault_None);
> +    fi->s2addr =3D addr;
> +    fi->stage2 =3D true;
> +    fi->s1ptw =3D true;
> +    fi->s1ns =3D !is_secure;
> +    return false;
>  }
>=20=20
>  /* All loads done in the course of a page table walk go through here. */
> @@ -287,56 +319,78 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Tra=
nslate *ptw, hwaddr addr,
>                              ARMMMUFaultInfo *fi)
>  {
>      CPUState *cs =3D env_cpu(env);
> -    MemTxAttrs attrs =3D {};
> -    MemTxResult result =3D MEMTX_OK;
> -    AddressSpace *as;
>      uint32_t data;
>=20=20
>      if (!S1_ptw_translate(env, ptw, addr, fi)) {
> +        /* Failure. */
> +        assert(fi->s1ptw);
>          return 0;
>      }
> -    addr =3D ptw->out_phys;
> -    attrs.secure =3D ptw->out_secure;
> -    as =3D arm_addressspace(cs, attrs);
> -    if (ptw->out_be) {
> -        data =3D address_space_ldl_be(as, addr, attrs, &result);
> +
> +    if (likely(ptw->out_host)) {
> +        /* Page tables are in RAM, and we have the host address. */
> +        if (ptw->out_be) {
> +            data =3D ldl_be_p(ptw->out_host);
> +        } else {
> +            data =3D ldl_le_p(ptw->out_host);
> +        }
>      } else {
> -        data =3D address_space_ldl_le(as, addr, attrs, &result);
> +        /* Page tables are in MMIO. */
> +        MemTxAttrs attrs =3D { .secure =3D ptw->out_secure };
> +        AddressSpace *as =3D arm_addressspace(cs, attrs);
> +        MemTxResult result =3D MEMTX_OK;
> +
> +        if (ptw->out_be) {
> +            data =3D address_space_ldl_be(as, ptw->out_phys, attrs, &res=
ult);
> +        } else {
> +            data =3D address_space_ldl_le(as, ptw->out_phys, attrs, &res=
ult);
> +        }
> +        if (unlikely(result !=3D MEMTX_OK)) {
> +            fi->type =3D ARMFault_SyncExternalOnWalk;
> +            fi->ea =3D arm_extabort_type(result);
> +            return 0;
> +        }
>      }
> -    if (result =3D=3D MEMTX_OK) {
> -        return data;
> -    }
> -    fi->type =3D ARMFault_SyncExternalOnWalk;
> -    fi->ea =3D arm_extabort_type(result);
> -    return 0;
> +    return data;
>  }
>=20=20
>  static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw, hwaddr a=
ddr,
>                              ARMMMUFaultInfo *fi)
>  {
>      CPUState *cs =3D env_cpu(env);
> -    MemTxAttrs attrs =3D {};
> -    MemTxResult result =3D MEMTX_OK;
> -    AddressSpace *as;
>      uint64_t data;
>=20=20
>      if (!S1_ptw_translate(env, ptw, addr, fi)) {
> +        /* Failure. */
> +        assert(fi->s1ptw);
>          return 0;
>      }
> -    addr =3D ptw->out_phys;
> -    attrs.secure =3D ptw->out_secure;
> -    as =3D arm_addressspace(cs, attrs);
> -    if (ptw->out_be) {
> -        data =3D address_space_ldq_be(as, addr, attrs, &result);
> +
> +    if (likely(ptw->out_host)) {
> +        /* Page tables are in RAM, and we have the host address. */
> +        if (ptw->out_be) {
> +            data =3D ldq_be_p(ptw->out_host);
> +        } else {
> +            data =3D ldq_le_p(ptw->out_host);
> +        }
>      } else {
> -        data =3D address_space_ldq_le(as, addr, attrs, &result);
> +        /* Page tables are in MMIO. */
> +        MemTxAttrs attrs =3D { .secure =3D ptw->out_secure };
> +        AddressSpace *as =3D arm_addressspace(cs, attrs);
> +        MemTxResult result =3D MEMTX_OK;
> +
> +        if (ptw->out_be) {
> +            data =3D address_space_ldq_be(as, ptw->out_phys, attrs, &res=
ult);
> +        } else {
> +            data =3D address_space_ldq_le(as, ptw->out_phys, attrs, &res=
ult);
> +        }
> +        if (unlikely(result !=3D MEMTX_OK)) {
> +            fi->type =3D ARMFault_SyncExternalOnWalk;
> +            fi->ea =3D arm_extabort_type(result);
> +            return 0;
> +        }
>      }
> -    if (result =3D=3D MEMTX_OK) {
> -        return data;
> -    }
> -    fi->type =3D ARMFault_SyncExternalOnWalk;
> -    fi->ea =3D arm_extabort_type(result);
> -    return 0;
> +    return data;
>  }
>=20=20
>  static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 3462a6ea14e..69b0dc69dfa 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -208,10 +208,21 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
>                        bool probe, uintptr_t retaddr)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
> -    ARMMMUFaultInfo fi =3D {};
>      GetPhysAddrResult res =3D {};
> +    ARMMMUFaultInfo local_fi, *fi;
>      int ret;
>=20=20
> +    /*
> +     * Allow S1_ptw_translate to see any fault generated here.
> +     * Since this may recurse, read and clear.
> +     */
> +    fi =3D cpu->env.tlb_fi;
> +    if (fi) {
> +        cpu->env.tlb_fi =3D NULL;
> +    } else {
> +        fi =3D memset(&local_fi, 0, sizeof(local_fi));
> +    }
> +
>      /*
>       * Walk the page table and (if the mapping exists) add the page
>       * to the TLB.  On success, return true.  Otherwise, if probing,
> @@ -220,7 +231,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
>       */
>      ret =3D get_phys_addr(&cpu->env, address, access_type,
>                          core_to_arm_mmu_idx(&cpu->env, mmu_idx),
> -                        &res, &fi);
> +                        &res, fi);
>      if (likely(!ret)) {
>          /*
>           * Map a single [sub]page. Regions smaller than our declared
> @@ -242,7 +253,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
>      } else {
>          /* now we have a real cpu fault */
>          cpu_restore_state(cs, retaddr, true);
> -        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
> +        arm_deliver_fault(cpu, address, access_type, mmu_idx, fi);
>      }
>  }
>  #else


--=20
Alex Benn=C3=A9e

