Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3794C1D7C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 22:09:19 +0100 (CET)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMysv-00036F-PN
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 16:09:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMys0-0002QT-Mx
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 16:08:20 -0500
Received: from [2607:f8b0:4864:20::535] (port=39543
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMyry-0004mj-QR
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 16:08:20 -0500
Received: by mail-pg1-x535.google.com with SMTP id 195so21296251pgc.6
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 13:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RFYKdFTsbQO3bEEyKaK1brSyEmCsvoxwTKwRAI+NWNA=;
 b=B45AlJOswlFnz5roxQRT8AosqcG1p01odz0UEO5kjPqN08vB7xUXv43AbkBWdy9GAK
 J/guCuMB6viy37uLCImMJ9WplSvqeWBsvQKjdWyDO04/Y6LPi04YF5Jy6UhgOrp03YvY
 PbNZnk9vh6OvQ2dhQRelw6Y6d/lFA9Yz329RAITWpzlZHe6qY87IjQ1pZ4wcnxIYPjpl
 1y8/SCJU2lmfqXF916VKkj49HvkLWdrPdftQVuFsV7X4BQCoQAs+sG5lIawbzkpMl5yL
 f35Y1w4OTvQzt5S4a7/QgN6u6T7nqtBPprtU+AHryCtqERQhfduFcwP9E8HwdkPaTBeG
 aJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RFYKdFTsbQO3bEEyKaK1brSyEmCsvoxwTKwRAI+NWNA=;
 b=gayvo0TDA7WHAObQMTE8bGae9rg39fUKLsgPaNfQDxqCJA7K9+gfMss6EaWWEWYSc6
 owWd1wydN6n8l239ACsJNztyKL/Cm0IxtwMv1ZxWjmbAlBMdERh0UVA5IwoTX7tMXByj
 RQ8LkmQhNf2Pq22rrbVH3FFHxqVepHQa3NZ5Gw34TH1qlPVKodKI3o7PNG5qp4IaEZhA
 znU4SNuLbLRIC0QSa5qHH2BSc2GwwhZN8oJh5ayI6nmONWsNNwCcZKwZG4uFjl6LYoyD
 nlxhXVBagguErGosPZ59eOlUFDaHGgMhbV9z2E7R09z60szhiJDCLWl8HV/dqFLtAfVM
 S/FA==
X-Gm-Message-State: AOAM530w0sL4BOgginvUpdLGO+sDeZ1v+xB1aQ5diSK5iN6LWke4UwZJ
 UPb50TAvWaXAxeovVxzJkwSRng==
X-Google-Smtp-Source: ABdhPJyRSSSgOC6Jlce2XD5TMe7fghQmVqecWAekrkUeH18a4mEP/VbrYiNK4vQ3qWdQo1Jg1JSDFg==
X-Received: by 2002:a63:f10d:0:b0:370:14d9:c1ce with SMTP id
 f13-20020a63f10d000000b0037014d9c1cemr1208748pgi.50.1645650497225; 
 Wed, 23 Feb 2022 13:08:17 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id b14sm452478pfm.17.2022.02.23.13.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 13:08:16 -0800 (PST)
Message-ID: <0dd73491-0568-cb73-9184-0d8b1422fbb1@linaro.org>
Date: Wed, 23 Feb 2022 11:08:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 04:07, Peter Maydell wrote:
> This series seems to break 'make check-acceptance':
> 
>   (01/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '01-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
> (900.74 s)
>   (02/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '02-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
> (900.71 s)
> 
> UEFI runs in the guest and seems to launch the kernel, but there's
> no output from the kernel itself in the logfile. Last thing it
> prints is:
> 
> EFI stub: Booting Linux Kernel...
> EFI stub: EFI_RNG_PROTOCOL unavailable, no randomness supplied
> EFI stub: Using DTB from configuration table
> EFI stub: Exiting boot services and installing virtual address map...
> SetUefiImageMemoryAttributes - 0x000000007F500000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C190000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C140000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007F4C0000 - 0x0000000000030000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C0F0000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BFB0000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BE00000 - 0x0000000000030000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BDC0000 - 0x0000000000030000
> (0x0000000000000008)
> 
> This ought to be followed by the usual kernel boot log
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> etc but it isn't. Probably the kernel is crashing in early bootup
> before it gets round to printing anything.

Ug.  The v5.3.7 kernel we're trying to boot is actively broken wrt LPA2:

ENTRY(__enable_mmu)
         mrs     x2, ID_AA64MMFR0_EL1
         ubfx    x2, x2, #ID_AA64MMFR0_TGRAN_SHIFT, 4
         cmp     x2, #ID_AA64MMFR0_TGRAN_SUPPORTED
         b.ne    __no_granule_support

That's an exact match for TGRAN4 == 0, so the LPA2 value sends the cpu into a sleep loop.

This is fixed in 26f55386f964c, included in v5.12.

So... we're going to need to update avocado, or something.


r~

