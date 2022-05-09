Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED66520285
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 18:34:32 +0200 (CEST)
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no6L9-0006Xu-9q
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 12:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no6JL-00057X-1y
 for qemu-devel@nongnu.org; Mon, 09 May 2022 12:32:39 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no6J5-0008BC-JA
 for qemu-devel@nongnu.org; Mon, 09 May 2022 12:32:25 -0400
Received: by mail-pl1-x634.google.com with SMTP id n8so14385361plh.1
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ZxACk/i+m8uMHkZ6WV71DEN9+P/ELBSqQr8i0vJlYQk=;
 b=mnv6a9+dJgsOA1XA5xHhvX56/uCuGbNTwyBvm/LHC5i7xal7+7f6yLvGannJdK/MHI
 0cdNbIMBAczU0A7++X3sRCAMUzF9b0aeuedbAqP3AQBf2ZmQq1SAabs2cSUTHBrXfkKE
 cyN563XCvEgGaIjoNEiwJyf+vyhrzuzk4C0mNfcigYHdE0Qm9V2yAVsZmfIH5FbbL9nH
 WazR92xOFS0KjpZhYGHxPU5JmAxfCJviWJ9HWQ7PTNQA1EnQ+3wlaYCLR8NlCLGIl1m5
 /PsOgR58mWCxdThYx6mFabwt2aFvk1UZItGcgRUMDlU8eF6GMEchRnT0FbAueuJ9+qiM
 sV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZxACk/i+m8uMHkZ6WV71DEN9+P/ELBSqQr8i0vJlYQk=;
 b=13kHADXqNCKv1QFyl590EQs6xZQF2YYL0ertJrq3vj9DYCS+yqyF+K4BOnZAkM6u12
 co8Ae2e2kO0EBsKLT0IiMM1qTwnv54Hm+sJsRCqLXLEeHHDHWn4Kc3y/+MWxNV1+Fu32
 bzeX3AjrUOkeUl/TvaRxHtYLVLeaGyj5ylB2Jalq7i1K5ou5fqZcN8t0JmLyEqk2vIAZ
 1dDrKQswcQ0L5uLrdmDboj3sUK7KLUCESSwGDMQJuWciqUuWVQdjHJBlBFMx5X1GnIv+
 sX8G7uarA6jmv1aVNlSjs82iqoNE+/uC6PDQVItC0BLmj6efIrApYtjT/zbFaE/wGLoW
 XXlA==
X-Gm-Message-State: AOAM5315DZE6KnXjxKKLMFQ0tefTjp3upb1Dh/+KcVK+ZaoPwaCfuW2m
 ByVLI2DTMRNCjk8yfMEePCk70A==
X-Google-Smtp-Source: ABdhPJwjHuxlD8K1T2pUWOZveL8q0edz6kf67za+87pSpG9T83Fmtvlxu1PFYt3AWjsO+1rblfLNfg==
X-Received: by 2002:a17:903:124a:b0:154:c7a4:9374 with SMTP id
 u10-20020a170903124a00b00154c7a49374mr16820918plh.68.1652113941165; 
 Mon, 09 May 2022 09:32:21 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 bh6-20020a170902a98600b0015e8d4eb243sm65596plb.141.2022.05.09.09.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 09:32:19 -0700 (PDT)
Message-ID: <6d9b1cc9-613d-7985-7307-1bff85cac6fb@linaro.org>
Date: Mon, 9 May 2022 09:32:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v2 00/11] Misc patches
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220509072933.48586-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509072933.48586-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 5/9/22 02:29, Thomas Huth wrote:
> The following changes since commit 554623226f800acf48a2ed568900c1c968ec9a8b:
> 
>    Merge tag 'qemu-sparc-20220508' of https://github.com/mcayland/qemu into staging (2022-05-08 17:03:26 -0500)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-09
> 
> for you to fetch changes up to ddc5a6cc70398ed7ec76220d59c123d8cb14b0ad:
> 
>    docs/devel/writing-monitor-commands: Replace obsolete STEXI/ETEXI tags (2022-05-09 08:21:14 +0200)
> 
> ----------------------------------------------------------------
> * Remove redundant/obsolete x86, arm and ppc disassemblers (Capstone is better)
> * Limit some Xen-related code to builds where Xen is really available
> * Remove hxtool-conv.pl and remove STEXI/ETEXI references from the docs
> * Update MinGW and OpenBSD to a more recent version in the CI
> * Warn user if the -vga flag is passed but no vga device is created

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> v2:
>   - Fixed the -vga warning patch to not warn in case of "-device"
>   - Added the ppc disassembler patch
>   - Added the STEXI/ETEXI doc patch
> 
> Brad Smith (1):
>        tests/vm: update openbsd to release 7.1
> 
> Gautam Agrawal (1):
>        Warn user if the vga flag is passed but no vga device is created
> 
> Thomas Huth (6):
>        disas: Remove old libopcode arm disassembler
>        disas: Remove old libopcode i386 disassembler
>        disas: Remove old libopcode ppc disassembler
>        softmmu/vl: Fence 'xenfb' if Xen support is not compiled in
>        qemu-options: Limit the -xen options to x86 and arm
>        docs/devel/writing-monitor-commands: Replace obsolete STEXI/ETEXI tags
> 
> Yonggang Luo (3):
>        doc: remove hxtool-conv.pl
>        cirrus/win32: upgrade mingw base packages
>        gitlab-ci: Upgrade mingw base package.
> 
>   docs/devel/writing-monitor-commands.rst |   11 +-
>   include/disas/dis-asm.h                 |    3 -
>   include/sysemu/sysemu.h                 |    1 +
>   disas.c                                 |    5 -
>   disas/arm.c                             | 4012 ------------------
>   disas/i386.c                            | 6771 -------------------------------
>   disas/ppc.c                             | 5435 -------------------------
>   hw/hppa/machine.c                       |    1 +
>   hw/isa/isa-bus.c                        |    1 +
>   hw/mips/fuloong2e.c                     |    1 +
>   hw/pci/pci.c                            |    1 +
>   hw/ppc/spapr.c                          |    1 +
>   hw/sparc/sun4m.c                        |    2 +
>   hw/sparc64/sun4u.c                      |    1 +
>   hw/xenpv/xen_machine_pv.c               |    1 +
>   softmmu/globals.c                       |    1 +
>   softmmu/vl.c                            |    9 +
>   target/arm/cpu.c                        |    8 -
>   target/i386/cpu.c                       |    1 -
>   target/ppc/cpu_init.c                   |    2 -
>   .cirrus.yml                             |    2 +-
>   .gitlab-ci.d/windows.yml                |    2 +-
>   MAINTAINERS                             |    6 -
>   disas/meson.build                       |    3 -
>   qemu-options.hx                         |    7 +-
>   scripts/hxtool-conv.pl                  |  137 -
>   tests/vm/openbsd                        |    4 +-
>   27 files changed, 32 insertions(+), 16397 deletions(-)
>   delete mode 100644 disas/arm.c
>   delete mode 100644 disas/i386.c
>   delete mode 100644 disas/ppc.c
>   delete mode 100755 scripts/hxtool-conv.pl
> 


