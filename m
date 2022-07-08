Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1BF56B0A4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 04:34:22 +0200 (CEST)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9doy-0004FP-5x
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 22:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9dnY-0002tx-NV
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 22:32:52 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9dnW-0002KE-PB
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 22:32:52 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso561293pjk.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 19:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=k1j7BTb3fNoP3LEWGwk6Ktte+lGH9DmzGhf3I2OcUs4=;
 b=L/j0SH3paQcy9DsDDRcgyHdumFMfvACsdXg1WnmLqTpvBx0uDLFo79UnWD82AvaNr4
 U4loSPKpYO8iMGK4URhz7z9Gkfwg6ZXhjx046pJiKdMLKO2N4SvIhpfYNWqaD8L1bPxM
 eD3p1VOJEb8E1nMYf+7A1mdPbuVbqqK68hsIZsquXqnb8co9L/V15cOqjuQlsnW4PqYH
 usKwZ18cF19MwsVi7xgTGYyeVmd7pvp2ALFppVMVMbxsUusfZPprPVnySKnNV5cXYSbq
 eeFtnHwStHAytjU+n8YXq61GILA23n2i/WWyQ+gW7gI+TVQ16c9cwSohTQZVe88Fb03x
 iTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k1j7BTb3fNoP3LEWGwk6Ktte+lGH9DmzGhf3I2OcUs4=;
 b=PCPbSeLVBKD97Apur0j9ZuC+QXIJ1ahVc2CDhcd+vfCvHy2G9LQXa+7sEvcfjanI4d
 liy8KpA7nA5rKxd2XdP+gH+1FJp4qo84PiScdPHwa23jP+zYv/BnoYK4uhVMVc4qAwKb
 Dmf/5oFuLEfYybHcmQyI9bveetG16qAD9X4mnQTMh0xK1sRiP80tPvWu4CKPATTHPQUQ
 H5c7zKb6Y7Lh1GuH+iqQ/KQ4KeJ61clNE64Tljbb9YPMqOLZzaqfUCP9w/jTUajOCrKr
 OlwkLxJzv+kbmtfQQhwxycPf5BLFWos9+iPl75ULbFttfB1FI5KE++Go6LCL4gFtjoZk
 6nNA==
X-Gm-Message-State: AJIora8aimtrkwW7qlM9K22babJ6iYvcUmCL2KCcBKSS7gH1UK1wnMvk
 u8fPH7UzfuDWspD2JZyqwk8IUw==
X-Google-Smtp-Source: AGRyM1sgUsvXFaF9bMkAQeqw7tTnqNrowDdNdDUad1qYGxyg92ZugKGRuH3RoavhL7ZgDEeY+czwEA==
X-Received: by 2002:a17:902:cf11:b0:16b:e1a5:aee with SMTP id
 i17-20020a170902cf1100b0016be1a50aeemr1126889plg.132.1657247569137; 
 Thu, 07 Jul 2022 19:32:49 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a170903110700b0016bfa097927sm5693148plh.249.2022.07.07.19.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 19:32:48 -0700 (PDT)
Message-ID: <6edadc17-a7e0-acf6-7195-7999420766dc@linaro.org>
Date: Fri, 8 Jul 2022 08:02:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/9] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220707122734.288929-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220707122734.288929-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 7/7/22 17:57, Peter Maydell wrote:
> My OS Lock/DoubleLock patches, plus a small selection of other
> bug fixes and minor things.
> 
> thanks
> -- PMM
> 
> The following changes since commit 8e9398e3b1a860b8c29c670c1b6c36afe8d87849:
> 
>    Merge tag 'pull-ppc-20220706' of https://gitlab.com/danielhb/qemu into staging (2022-07-07 06:21:05 +0530)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220707
> 
> for you to fetch changes up to c2360eaa0262a816faf8032b7762d0c73df2cc62:
> 
>    target/arm: Fix qemu-system-arm handling of LPAE block descriptors for highmem (2022-07-07 11:41:04 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * hw/arm/virt: dt: add rng-seed property
>   * Fix MTE check in sve_ldnfff1_r
>   * Record tagged bit for user-only in sve_probe_page
>   * Correctly implement OS Lock and OS DoubleLock
>   * Implement DBGDEVID, DBGDEVID1, DBGDEVID2 registers
>   * Fix qemu-system-arm handling of LPAE block descriptors for highmem

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Jason A. Donenfeld (1):
>        hw/arm/virt: dt: add rng-seed property
> 
> Peter Maydell (6):
>        target/arm: Fix code style issues in debug helper functions
>        target/arm: Move define_debug_regs() to debug_helper.c
>        target/arm: Suppress debug exceptions when OS Lock set
>        target/arm: Implement AArch32 DBGDEVID, DBGDEVID1, DBGDEVID2
>        target/arm: Correctly implement Feat_DoubleLock
>        target/arm: Fix qemu-system-arm handling of LPAE block descriptors for highmem
> 
> Richard Henderson (2):
>        target/arm: Fix MTE check in sve_ldnfff1_r
>        target/arm: Record tagged bit for user-only in sve_probe_page
> 
>   docs/about/deprecated.rst |   8 +
>   docs/system/arm/virt.rst  |  17 +-
>   include/hw/arm/virt.h     |   2 +-
>   target/arm/cpregs.h       |   3 +
>   target/arm/cpu.h          |  27 +++
>   target/arm/internals.h    |   9 +
>   hw/arm/virt.c             |  44 ++--
>   target/arm/cpu64.c        |   6 +
>   target/arm/cpu_tcg.c      |   6 +
>   target/arm/debug_helper.c | 580 ++++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/helper.c       | 513 +---------------------------------------
>   target/arm/ptw.c          |   2 +-
>   target/arm/sve_helper.c   |   5 +-
>   13 files changed, 684 insertions(+), 538 deletions(-)
> 


