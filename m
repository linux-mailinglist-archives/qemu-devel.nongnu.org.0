Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940DA545160
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:56:55 +0200 (CEST)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKWk-0006K4-KW
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzK1h-0002g7-3O
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:24:49 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzK1d-0008Nc-Ti
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:24:47 -0400
Received: by mail-pl1-x62f.google.com with SMTP id i15so3743683plr.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=HGJaKUO6TbPd5sq/6KL1WbMYFbszmLk2Lv205FNIuuY=;
 b=KiBVfWCGMgCfyZo1fzutblS50Cl7wZhJoS6tmPj2GtJrI4sRvzXCH4zkIEsxntjDNq
 y1SaYmKp6wDiDNPjzgVBByq5JKcHhrqZdq8SCKe+IQDjKFODjUm74UrNXOEY6hX28DVh
 MjOj4k+k4WqBuP3e9tmvxmPELfNSlGn1znYPBJ5drAir7Eabv2wK3VJW8rSHb0AVXPZp
 mQyxm7NTXB9Lf//ivNB6lgbLWDnGWKgtZJd0R6tU2qAL/+WfmZg5aIWfJF+izIeWrZ0R
 OkxHR7+mENV9pg6cpxbv1mvdvnprODJxc2dlO6yRJ94AuLYYQQyXmE3DF0tsPdBp7WlJ
 LbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HGJaKUO6TbPd5sq/6KL1WbMYFbszmLk2Lv205FNIuuY=;
 b=dVc5c1WXhC63mEhooyVaOk7LZltk7bPk0iHx6W3ozMpRcjf+Kswb58Pmlino8sqVDw
 K4xQvl/licu+vuRAA3IQ1XuFflAZ0KxqkVqNz7yGWjj7fXRZIWIZsnNit7DGZ4cFRA1D
 Wdawm1w0p/1jXEOt6GwLpaaR/D5pj3JIBh8lq+7WdpluhTvJy7uOor7ldjyaDdMGmeXT
 fE9Sc334dxV5eqstVvIxQ4jFObopU+7szsjrmeMur4mAtC7/DjxdcJS8d4D1d7CXusIx
 ZfkoP2druAEtDjz8ivgLhzG5GfobLpIWDe3cyWohpvbyxvupeWbMjc5NYX6PYJBau7Qc
 YHRg==
X-Gm-Message-State: AOAM5300Mh0IFwiyy3iXTKVN6ydpTqPtMZzciHGDQSUe7PfUCmEYIimu
 /47hhG4KkOh788VdeBmwdsA5sQ==
X-Google-Smtp-Source: ABdhPJykr8Yal/zNstnpsh3ZcITsgus4PrlQK85JNuZSTTC4xt2lUv/AEkaJoRcQeL44xaZxLP8tOw==
X-Received: by 2002:a17:90b:1c82:b0:1dd:1b46:5aa9 with SMTP id
 oo2-20020a17090b1c8200b001dd1b465aa9mr3998334pjb.158.1654788284044; 
 Thu, 09 Jun 2022 08:24:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a1709026e0100b0015e8d4eb231sm17077131plk.123.2022.06.09.08.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 08:24:43 -0700 (PDT)
Message-ID: <7f67f4f4-533c-19fa-454d-4b72e1b49a11@linaro.org>
Date: Thu, 9 Jun 2022 08:24:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/55] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/9/22 02:04, Peter Maydell wrote:
> The following changes since commit 6d940eff4734bcb40b1a25f62d7cec5a396f994a:
> 
>    Merge tag 'pull-tpm-2022-06-07-1' of https://github.com/stefanberger/qemu-tpm into staging (2022-06-07 19:22:18 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220609
> 
> for you to fetch changes up to 414c54d515dba16bfaef643a8acec200c05f229a:
> 
>    target/arm: Add ID_AA64SMFR0_EL1 (2022-06-08 19:38:59 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * target/arm: Declare support for FEAT_RASv1p1
>   * target/arm: Implement FEAT_DoubleFault
>   * Fix 'writeable' typos
>   * xlnx_dp: Implement vblank interrupt
>   * target/arm: Move page-table-walk code to ptw.c
>   * target/arm: Preparatory patches for SME support

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Frederic Konrad (2):
>        xlnx_dp: fix the wrong register size
>        xlnx-zynqmp: fix the irq mapping for the display port and its dma
> 
> Peter Maydell (3):
>        target/arm: Declare support for FEAT_RASv1p1
>        target/arm: Implement FEAT_DoubleFault
>        Fix 'writeable' typos
> 
> Richard Henderson (48):
>        target/arm: Move stage_1_mmu_idx decl to internals.h
>        target/arm: Move get_phys_addr to ptw.c
>        target/arm: Move get_phys_addr_v5 to ptw.c
>        target/arm: Move get_phys_addr_v6 to ptw.c
>        target/arm: Move get_phys_addr_pmsav5 to ptw.c
>        target/arm: Move get_phys_addr_pmsav7_default to ptw.c
>        target/arm: Move get_phys_addr_pmsav7 to ptw.c
>        target/arm: Move get_phys_addr_pmsav8 to ptw.c
>        target/arm: Move pmsav8_mpu_lookup to ptw.c
>        target/arm: Move pmsav7_use_background_region to ptw.c
>        target/arm: Move v8m_security_lookup to ptw.c
>        target/arm: Move m_is_{ppb,system}_region to ptw.c
>        target/arm: Move get_level1_table_address to ptw.c
>        target/arm: Move combine_cacheattrs and subroutines to ptw.c
>        target/arm: Move get_phys_addr_lpae to ptw.c
>        target/arm: Move arm_{ldl,ldq}_ptw to ptw.c
>        target/arm: Move {arm_s1_, }regime_using_lpae_format to tlb_helper.c
>        target/arm: Move arm_pamax, pamax_map into ptw.c
>        target/arm: Move get_S1prot, get_S2prot to ptw.c
>        target/arm: Move check_s2_mmu_setup to ptw.c
>        target/arm: Move aa32_va_parameters to ptw.c
>        target/arm: Move ap_to_tw_prot etc to ptw.c
>        target/arm: Move regime_is_user to ptw.c
>        target/arm: Move regime_ttbr to ptw.c
>        target/arm: Move regime_translation_disabled to ptw.c
>        target/arm: Move arm_cpu_get_phys_page_attrs_debug to ptw.c
>        target/arm: Move stage_1_mmu_idx, arm_stage1_mmu_idx to ptw.c
>        target/arm: Pass CPUARMState to arm_ld[lq]_ptw
>        target/arm: Rename TBFLAG_A64 ZCR_LEN to VL
>        linux-user/aarch64: Introduce sve_vq
>        target/arm: Remove route_to_el2 check from sve_exception_el
>        target/arm: Remove fp checks from sve_exception_el
>        target/arm: Add el_is_in_host
>        target/arm: Use el_is_in_host for sve_zcr_len_for_el
>        target/arm: Use el_is_in_host for sve_exception_el
>        target/arm: Hoist arm_is_el2_enabled check in sve_exception_el
>        target/arm: Do not use aarch64_sve_zcr_get_valid_len in reset
>        target/arm: Merge aarch64_sve_zcr_get_valid_len into caller
>        target/arm: Use uint32_t instead of bitmap for sve vq's
>        target/arm: Rename sve_zcr_len_for_el to sve_vqm1_for_el
>        target/arm: Split out load/store primitives to sve_ldst_internal.h
>        target/arm: Export sve contiguous ldst support functions
>        target/arm: Move expand_pred_b to vec_internal.h
>        target/arm: Use expand_pred_b in mve_helper.c
>        target/arm: Move expand_pred_h to vec_internal.h
>        target/arm: Export bfdotadd from vec_helper.c
>        target/arm: Add isar_feature_aa64_sme
>        target/arm: Add ID_AA64SMFR0_EL1
> 
> Sai Pavan Boddu (2):
>        xlnx_dp: Introduce a vblank signal
>        xlnx_dp: Fix the interrupt disable logic
> 
>   docs/interop/vhost-user.rst       |    2 +-
>   docs/specs/vmgenid.txt            |    4 +-
>   docs/system/arm/emulation.rst     |    2 +
>   hw/scsi/mfi.h                     |    2 +-
>   include/hw/display/xlnx_dp.h      |   12 +-
>   linux-user/aarch64/target_prctl.h |   20 +-
>   target/arm/cpu.h                  |   66 +-
>   target/arm/internals.h            |   45 +-
>   target/arm/kvm_arm.h              |    7 +-
>   target/arm/sve_ldst_internal.h    |  221 +++
>   target/arm/translate-a64.h        |    2 +-
>   target/arm/translate.h            |    2 +-
>   target/arm/vec_internal.h         |   28 +-
>   target/i386/hvf/vmcs.h            |    2 +-
>   target/i386/hvf/vmx.h             |    2 +-
>   accel/hvf/hvf-accel-ops.c         |    4 +-
>   accel/kvm/kvm-all.c               |    4 +-
>   accel/tcg/user-exec.c             |    6 +-
>   hw/acpi/ghes.c                    |    2 +-
>   hw/arm/xlnx-zynqmp.c              |    4 +-
>   hw/display/xlnx_dp.c              |   49 +-
>   hw/intc/arm_gicv3_cpuif.c         |    2 +-
>   hw/intc/arm_gicv3_dist.c          |    2 +-
>   hw/intc/arm_gicv3_redist.c        |    4 +-
>   hw/intc/riscv_aclint.c            |    2 +-
>   hw/intc/riscv_aplic.c             |    2 +-
>   hw/pci/shpc.c                     |    2 +-
>   hw/sparc64/sun4u_iommu.c          |    2 +-
>   hw/timer/sse-timer.c              |    2 +-
>   linux-user/aarch64/signal.c       |    4 +-
>   target/arm/arch_dump.c            |    2 +-
>   target/arm/cpu.c                  |    5 +-
>   target/arm/cpu64.c                |  120 +-
>   target/arm/gdbstub.c              |    2 +-
>   target/arm/gdbstub64.c            |    2 +-
>   target/arm/helper.c               | 2742 ++-----------------------------------
>   target/arm/hvf/hvf.c              |    4 +-
>   target/arm/kvm64.c                |   47 +-
>   target/arm/mve_helper.c           |    6 +-
>   target/arm/ptw.c                  | 2540 ++++++++++++++++++++++++++++++++++
>   target/arm/sve_helper.c           |  232 +---
>   target/arm/tlb_helper.c           |   26 +
>   target/arm/translate-a64.c        |    2 +-
>   target/arm/translate-sve.c        |    2 +-
>   target/arm/vec_helper.c           |   28 +-
>   target/i386/cpu-sysemu.c          |    2 +-
>   target/s390x/ioinst.c             |    2 +-
>   python/qemu/machine/machine.py    |    2 +-
>   target/arm/meson.build            |    1 +
>   tests/tcg/x86_64/system/boot.S    |    2 +-
>   50 files changed, 3240 insertions(+), 3037 deletions(-)
>   create mode 100644 target/arm/sve_ldst_internal.h
>   create mode 100644 target/arm/ptw.c
> 


