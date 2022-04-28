Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BC4513AB1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 19:14:09 +0200 (CEST)
Received: from localhost ([::1]:37160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk7iS-0000K9-Hj
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 13:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk7fW-0007qo-FY
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 13:11:06 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk7fS-0001ch-UL
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 13:11:05 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so8243382pjb.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=cMDr8HIg6qemJZdibdKTUHNjskjWnz2O7TUs1xU0l8g=;
 b=LP71lMYX2yGqbrnDuzWlVTW7RW59e0mh7nzvFSp3MGxu8icMwaSJnGC3kPEdZMv1s6
 wvDROzUooc5GCVMsni0JWeGI31Ynhd19Vk9sgIsi5SSsVBn3+Fw0A+K7Qgm1IvzvQ6xH
 WJ9kn7DqlQal9hSxJUBsoTh/+PtXh2k/TMKZBK3WFpRlVFtOqAKmLVjy0tQhomP2bSuI
 dfX9PqFM7/e8X4graSMXyPDl1XcrTmynGLs6mrcJhM5Q0IeM9uqkyI7ANrdAgLGGqNee
 Tki1SxibcXyYvD5nVw6n7GxT0pH+0iPcMryELFEy8zTDoISBG3TvLpcaYT5D9ITusuxv
 qNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cMDr8HIg6qemJZdibdKTUHNjskjWnz2O7TUs1xU0l8g=;
 b=DKtgb3dBYQXaBCDiElgCUJPO413o3k3H0yNh7IG2kOlIqK63fW+1NAA1wpA+UYGeZf
 kDluFvAoMVwxM2ta8WwgyTeh7acMtBbs1ZbG3a1cblqYEr8hzi7RudruVftWMNiqsVvE
 Y5jDOFPZoBEmRauSlNuBdPd5WKswgkPkpZtdOP1INGdfc6CPOBU3H12w/zG+Anid6tOY
 2ofi+sJG+RZVJ2Xfil7Dl8q3ebqW8lHM1AGMH81FYZd4dWSIFTZ0N/NZ1pZYZ3p3e8iS
 h/8BRPWikE70IA/Q76hksTQ+Xqei9IuONrFck9OWdVlB3W7WQ+7VN+s+takME0xuui46
 UZsw==
X-Gm-Message-State: AOAM5301Vuvted5hv+KF61v1eAcyznypf7s4GpX1j79nMmsd3cu/Rlu7
 opzJs6rIkm2sf4ukCYEniGpLyA==
X-Google-Smtp-Source: ABdhPJwrSwifkMwjaCXOec2BIEoF8UeAajtTM+2/k5vsXcHJFf5SXhxF6K0DUWS4JLLpEmwvkr8q4A==
X-Received: by 2002:a17:903:22c7:b0:15d:3359:ca4c with SMTP id
 y7-20020a17090322c700b0015d3359ca4cmr15617976plg.59.1651165861227; 
 Thu, 28 Apr 2022 10:11:01 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a632f02000000b003c14af50601sm3171921pgv.25.2022.04.28.10.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 10:11:00 -0700 (PDT)
Message-ID: <eaf35087-ff6e-890e-d01e-23f382f2e8d9@linaro.org>
Date: Thu, 28 Apr 2022 10:10:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/54] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 4/28/22 07:39, Peter Maydell wrote:
> This is mostly RTH's tcg_constant refactoring work, plus a few
> other things.
> 
> thanks
> -- PMM
> 
> The following changes since commit cf6f26d6f9b2015ee12b4604b79359e76784163a:
> 
>    Merge tag 'kraxel-20220427-pull-request' of git://git.kraxel.org/qemu into staging (2022-04-27 10:49:28 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220428
> 
> for you to fetch changes up to f8e7163d9e6740b5cef02bf73a17a59d0bef8bdb:
> 
>    hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2 (2022-04-28 13:59:23 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * refactor to use tcg_constant where appropriate
>   * Advertise support for FEAT_TTL and FEAT_BBM level 2
>   * smmuv3: Cache event fault record
>   * smmuv3: Add space in guest error message
>   * smmuv3: Advertise support for SMMUv3.2-BBML2

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Damien Hedde (1):
>        target/arm: Disable cryptographic instructions when neon is disabled
> 
> Jean-Philippe Brucker (2):
>        hw/arm/smmuv3: Cache event fault record
>        hw/arm/smmuv3: Add space in guest error message
> 
> Peter Maydell (3):
>        target/arm: Advertise support for FEAT_TTL
>        target/arm: Advertise support for FEAT_BBM level 2
>        hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2
> 
> Richard Henderson (48):
>        target/arm: Use tcg_constant in gen_probe_access
>        target/arm: Use tcg_constant in gen_mte_check*
>        target/arm: Use tcg_constant in gen_exception*
>        target/arm: Use tcg_constant in gen_adc_CC
>        target/arm: Use tcg_constant in handle_msr_i
>        target/arm: Use tcg_constant in handle_sys
>        target/arm: Use tcg_constant in disas_exc
>        target/arm: Use tcg_constant in gen_compare_and_swap_pair
>        target/arm: Use tcg_constant in disas_ld_lit
>        target/arm: Use tcg_constant in disas_ldst_*
>        target/arm: Use tcg_constant in disas_add_sum_imm*
>        target/arm: Use tcg_constant in disas_movw_imm
>        target/arm: Use tcg_constant in shift_reg_imm
>        target/arm: Use tcg_constant in disas_cond_select
>        target/arm: Use tcg_constant in handle_{rev16,crc32}
>        target/arm: Use tcg_constant in disas_data_proc_2src
>        target/arm: Use tcg_constant in disas_fp*
>        target/arm: Use tcg_constant in simd shift expanders
>        target/arm: Use tcg_constant in simd fp/int conversion
>        target/arm: Use tcg_constant in 2misc expanders
>        target/arm: Use tcg_constant in balance of translate-a64.c
>        target/arm: Use tcg_constant for aa32 exceptions
>        target/arm: Use tcg_constant for disas_iwmmxt_insn
>        target/arm: Use tcg_constant for gen_{msr,mrs}
>        target/arm: Use tcg_constant for vector shift expanders
>        target/arm: Use tcg_constant for do_coproc_insn
>        target/arm: Use tcg_constant for gen_srs
>        target/arm: Use tcg_constant for op_s_{rri,rxi}_rot
>        target/arm: Use tcg_constant for MOVW, UMAAL, CRC32
>        target/arm: Use tcg_constant for v7m MRS, MSR
>        target/arm: Use tcg_constant for TT, SAT, SMMLA
>        target/arm: Use tcg_constant in LDM, STM
>        target/arm: Use tcg_constant in CLRM, DLS, WLS, LE
>        target/arm: Use tcg_constant in trans_CPS_v7m
>        target/arm: Use tcg_constant in trans_CSEL
>        target/arm: Use tcg_constant for trans_INDEX_*
>        target/arm: Use tcg_constant in SINCDEC, INCDEC
>        target/arm: Use tcg_constant in FCPY, CPY
>        target/arm: Use tcg_constant in {incr, wrap}_last_active
>        target/arm: Use tcg_constant in do_clast_scalar
>        target/arm: Use tcg_constant in WHILE
>        target/arm: Use tcg_constant in LD1, ST1
>        target/arm: Use tcg_constant in SUBR
>        target/arm: Use tcg_constant in do_zzi_{sat, ool}, do_fp_imm
>        target/arm: Use tcg_constant for predicate descriptors
>        target/arm: Use tcg_constant for do_brk{2,3}
>        target/arm: Use tcg_constant for vector descriptor
>        target/arm: Use field names for accessing DBGWCRn
> 
>   docs/system/arm/emulation.rst |   2 +
>   hw/arm/smmuv3-internal.h      |   2 +-
>   include/hw/arm/smmu-common.h  |   1 +
>   target/arm/internals.h        |  12 ++
>   hw/arm/smmuv3.c               |  17 +--
>   target/arm/cpu.c              |   9 ++
>   target/arm/cpu64.c            |   2 +
>   target/arm/debug_helper.c     |  10 +-
>   target/arm/helper.c           |   8 +-
>   target/arm/kvm64.c            |  14 +-
>   target/arm/translate-a64.c    | 301 +++++++++++++-----------------------------
>   target/arm/translate-sve.c    | 202 ++++++++++------------------
>   target/arm/translate.c        | 244 ++++++++++++----------------------
>   13 files changed, 293 insertions(+), 531 deletions(-)
> 


