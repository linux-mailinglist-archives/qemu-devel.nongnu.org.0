Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E700546FDD
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 01:12:10 +0200 (CEST)
Received: from localhost ([::1]:58766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nznnV-0001JP-7F
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 19:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nznlv-0000Cq-1w
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 19:10:32 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nznls-0003eZ-D1
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 19:10:30 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so3601065pjl.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=WNV2VkktI3cHY8Bika+hFtwZHwjzjM2ZG/PKrEoCmsg=;
 b=ohrEpYPGng8l9my9zDCDJoSdah2epia3dWyPKRKwkMzVsLe3Qv8cPT6cXcAC34Ym2D
 OyVVk45QEPag+ap1I8yf9ybqG6yu94PrWyc67dCKQPSywshfjdh9oh+wqAIuFAxuSjEv
 ZQhoo4nFdHC8YPOeanh+E6OsaqXqJMfOFn2WPKtEZPlZK7f05ga8Ym1u2KT/7K94+7KP
 vttKoLpTErJrNfqYEDliR60/MiK7h7+w/LuIIfdCT+Z9MYmEts2gMCqcs2PoQB8s8Aib
 ym+YcBydkThxV1gqdwS7y/vBt8UutsZ/YWCSZLPee99BeHquHeetNksHJoxsDilHveTE
 JN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WNV2VkktI3cHY8Bika+hFtwZHwjzjM2ZG/PKrEoCmsg=;
 b=aDafKkawo00ROK7OFrHFn420beCtXArBft0BBHbciTLxYgWAq8aKdg3aR1XWV0C3iS
 lXIFWoj3f12rgyMVLnWwWrMxooupZoK5eHsChbo8oiOo/kevcJupc53F2dj91lUIy7T+
 VJs1tXF1anOqSj9fzPCIhsIqRsLWeIkh0FSi3IdJa9s6xunRDDMQXxZSXW+aug8HPm58
 6fRrMDwNN1xOZ6NSOo6QM6agRBuyoDqBmGiQj5B8ARvf17Betzq5+tAhb920D3A4xvjk
 EBhJFmudt60R26WUc3GdURO5v/Z+Hp/3rwMfDM4xAXqmPX1hXPrPaIBniqHecGMQRMML
 xAkQ==
X-Gm-Message-State: AOAM531mThDUFuEmJ38BU65IrAnmVqc1LfXCa2gKGBkxvvuPHSVUjJWN
 tfQQ3mZ2ZJt2M/8xp8qEtNBGgg==
X-Google-Smtp-Source: ABdhPJx1w/oSpox1tLIbbK4iFIQa4wf2Y1iK3BF//fBMSUTYewmUUp5y9QrirbawNaubkTWmc/TwUw==
X-Received: by 2002:a17:902:d591:b0:165:ddec:f6ef with SMTP id
 k17-20020a170902d59100b00165ddecf6efmr46480008plh.35.1654902626637; 
 Fri, 10 Jun 2022 16:10:26 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 ct21-20020a056a000f9500b0051c0784cb45sm95824pfb.99.2022.06.10.16.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 16:10:25 -0700 (PDT)
Message-ID: <35cf1ba6-9fe0-f8a2-d0bc-3eb4f12ce7eb@linaro.org>
Date: Fri, 10 Jun 2022 16:10:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/28] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 6/10/22 09:07, Peter Maydell wrote:
> Just flushing my target-arm queue since I won't be working next week :-)
> 
> -- PMM
> 
> The following changes since commit b3cd3b5a66f0dddfe3d5ba2bef13cd4f5b89cde9:
> 
>    Merge tag 'pull-riscv-to-apply-20220610' of github.com:alistair23/qemu into staging (2022-06-09 22:08:27 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220610
> 
> for you to fetch changes up to 90c072e063737e9e8f431489bbd334452f89056e:
> 
>    semihosting/config: Merge --semihosting-config option groups (2022-06-10 14:32:36 +0100)
> 
> ----------------------------------------------------------------
>   * refactor exception routing code
>   * fix SCR_EL3 RAO/RAZ bits
>   * gdbstub: Don't use GDB syscalls if no GDB is attached
>   * semihosting/config: Merge --semihosting-config option groups
>   * tests/qtest: Reduce npcm7xx_sdhci test image size

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Hao Wu (1):
>        tests/qtest: Reduce npcm7xx_sdhci test image size
> 
> Peter Maydell (2):
>        gdbstub: Don't use GDB syscalls if no GDB is attached
>        semihosting/config: Merge --semihosting-config option groups
> 
> Richard Henderson (25):
>        target/arm: Mark exception helpers as noreturn
>        target/arm: Add coproc parameter to syn_fp_access_trap
>        target/arm: Move exception_target_el out of line
>        target/arm: Move arm_singlestep_active out of line
>        target/arm: Move arm_generate_debug_exceptions out of line
>        target/arm: Use is_a64 in arm_generate_debug_exceptions
>        target/arm: Move exception_bkpt_insn to debug_helper.c
>        target/arm: Move arm_debug_exception_fsr to debug_helper.c
>        target/arm: Rename helper_exception_with_syndrome
>        target/arm: Introduce gen_exception_insn_el_v
>        target/arm: Rename gen_exception_insn to gen_exception_insn_el
>        target/arm: Introduce gen_exception_insn
>        target/arm: Create helper_exception_swstep
>        target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
>        target/arm: Move gen_exception to translate.c
>        target/arm: Rename gen_exception to gen_exception_el
>        target/arm: Introduce gen_exception
>        target/arm: Introduce gen_exception_el_v
>        target/arm: Introduce helper_exception_with_syndrome
>        target/arm: Remove default_exception_el
>        target/arm: Create raise_exception_debug
>        target/arm: Move arm_debug_target_el to debug_helper.c
>        target/arm: Fix Secure PL1 tests in fp_exception_el
>        target/arm: Adjust format test in scr_write
>        target/arm: SCR_EL3.RW is RAO/WI without AArch32 EL[12]
> 
>   target/arm/cpu.h                 | 133 ++---------------------
>   target/arm/helper.h              |   8 +-
>   target/arm/internals.h           |  43 +-------
>   target/arm/syndrome.h            |   7 +-
>   target/arm/translate.h           |  43 ++------
>   gdbstub.c                        |  14 ++-
>   semihosting/config.c             |   1 +
>   target/arm/debug_helper.c        | 220 +++++++++++++++++++++++++++++++++++++--
>   target/arm/helper.c              |  53 ++++------
>   target/arm/op_helper.c           |  52 +++++----
>   target/arm/translate-a64.c       |  34 +++---
>   target/arm/translate-m-nocp.c    |  15 ++-
>   target/arm/translate-mve.c       |   3 +-
>   target/arm/translate-vfp.c       |  18 +++-
>   target/arm/translate.c           | 106 ++++++++++---------
>   tests/qtest/npcm7xx_sdhci-test.c |   2 +-
>   16 files changed, 390 insertions(+), 362 deletions(-)
> 


