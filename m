Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE51320C18
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 18:36:00 +0100 (CET)
Received: from localhost ([::1]:50290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDseF-0002fU-LZ
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 12:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDscn-00024j-NV
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:34:29 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDscl-00087A-SX
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:34:29 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v15so16680178wrx.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 09:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C03b5PCY2gdjo7NmMuYk89V/fSFwiNGFRdsyB/Qx6eM=;
 b=baJ+vzY7MGOJCnAdE9iFg9N0juYWrz19sqqgBjbB08f0VlVHUhJvT+ES40jRHd7bFr
 ulUMorkUi7MAw9PRnYuSy+l6VsT2iwYl7Dt2JvqkN93TjakRS0KxUxeinwO2c3gwr2We
 C88bSn0GSJ/N9wGSdEaNxP7BuLNlrD5E/MmthZxHxC2ps04bILlEZWyW2sBHEnMgJ2+/
 Y/hX1HbGBoSCkuTc++wMtwhpI4wHmZMePuNKeM7nQlgRgDqRtt7yA9/V8RqyJiayHbGN
 2wuEboF/3/5PA5/Kkk06KrOeRQZNoAd0oPz+yeYt5GiLqkEWbuiAdYpMmPC5j0EdcpyJ
 eDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C03b5PCY2gdjo7NmMuYk89V/fSFwiNGFRdsyB/Qx6eM=;
 b=S4NS0qT2crEyR0Td0CjGkxeNT+Xl9UyQtCjjCWXKxHIlgRxOmMZ+UkAhcrzU+vKM39
 /HSSm2wRbU3dU0VijNXcAP9VG2x44VGoW2u7TngbCJgyOPfY0sNFuJtn0npcECo6h30d
 HVRlvQ5JsoDuW6SiVSjRcryYcG4BEHfll4BDHFm+AflgDQbQoaQXPIgbkjfObQXM5TfV
 UOl9l+bnQzvi5z6AF8DvU6LWan7oLCoyYg4eCkoE1gVuMnP3pTNGxz9JIWtdsGFtlpPC
 7Qlf+PuNHck4rSBdFrIr7k+mm2iyfo0s1UHkKilZGvf03/rNA33ayTjVjG9Mh87SS5v5
 RKwg==
X-Gm-Message-State: AOAM530f/mRFINVcEKfnxZzS8JAMB64Emel1i/20W4xyqyJM5qH6yWcC
 BKtaC4ZKEZLlWmpn/iOfsxE=
X-Google-Smtp-Source: ABdhPJyRGx4wpolc/JqkUOG/FP6XrydoIkjn/qTQVQ2Ol5upsq/yDILZH8fLf8jTBFJ/0+2ZGZvlwA==
X-Received: by 2002:adf:e411:: with SMTP id g17mr5183747wrm.305.1613928866303; 
 Sun, 21 Feb 2021 09:34:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u6sm26627237wmg.41.2021.02.21.09.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 09:34:25 -0800 (PST)
Subject: Re: [PULL 00/43] MIPS patches for 2021-02-21
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210221143432.2468220-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9b1b1d0c-d667-809a-6fb7-31f0693685e8@amsat.org>
Date: Sun, 21 Feb 2021 18:34:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/21/21 3:33 PM, Philippe Mathieu-Daudé wrote:
> The following changes since commit a528b8c4c638d60cc474c2f80952ff0f2e60521a:
> 
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/sdmmc-20210220' into staging (2021-02-20 19:28:27 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/philmd/qemu.git tags/mips-20210221
> 
> for you to fetch changes up to 98e7c7108127bc9f2bf9065cbddd25778025b9c6:
> 
>   vt82c686: Fix superio_cfg_{read,write}() functions (2021-02-21 15:28:52 +0100)
> 
> ----------------------------------------------------------------
> MIPS patches queue
> 
> - Drop redundant struct MemmapEntry (Bin)
> - Fix for Coverity CID 1438965 and 1438967 (Jiaxun)
> - Add MIPS bootloader API (Jiaxun)
> - Use MIPS bootloader API on fuloong2e and boston machines (Jiaxun)
> - Add PMON test for Loongson-3A1000 CPU (Jiaxun)
> - Convert to translator API (Philippe)
> - MMU cleanups (Philippe)
> - Promote 128-bit multimedia registers as global ones (Philippe)
> - Various cleanups/fixes on the VT82C686B southbridge (Zoltan)
> ----------------------------------------------------------------
> 
> BALATON Zoltan (16):
>   vt82c686: Move superio memory region to SuperIOConfig struct
>   vt82c686: Reorganise code
>   vt82c686: Fix SMBus IO base and configuration registers
>   vt82c686: Make vt82c686-pm an I/O tracing region
>   vt82c686: Correct vt82c686-pm I/O size
>   vt82c686: Correctly reset all registers to default values on reset
>   vt82c686: Fix up power management io base and config
>   vt82c686: Set user_creatable=false for VT82C686B_PM
>   vt82c686: Make vt82c686b-pm an abstract base class and add vt8231-pm
>     based on it
>   vt82c686: Simplify vt82c686b_realize()
>   vt82c686: Move creation of ISA devices to the ISA bridge
>   vt82c686: Remove index field of SuperIOConfig
>   vt82c686: Reduce indentation by returning early
>   vt82c686: Simplify by returning earlier
>   vt82c686: Log superio_cfg unimplemented accesses
>   vt82c686: Fix superio_cfg_{read,write}() functions
> 
> Bin Meng (1):
>   hw/mips: loongson3: Drop 'struct MemmapEntry'
> 
> Jiaxun Yang (6):
>   hw/mips: Add a bootloader helper
>   hw/mips/fuloong2e: Use bl_gen_kernel_jump to generate bootloaders
>   hw/mips/boston: Use bl_gen_kernel_jump to generate bootloaders
>   hw/mips/boston: Use bootloader helper to set GCRs
>   hw/intc/loongson_liointc: Fix per core ISR handling
>   tests/acceptance: Test PMON with Loongson-3A1000 CPU
> 
> Philippe Mathieu-Daudé (20):
>   target/mips: fetch code with translator_ld
>   target/mips: Remove access_type argument from map_address() handler
>   target/mips: Remove access_type argument from get_seg_physical_address
>   target/mips: Remove access_type arg from get_segctl_physical_address()
>   target/mips: Remove access_type argument from get_physical_address()
>   target/mips: Remove unused MMU definitions
>   target/mips: Replace magic value by MMU_DATA_LOAD definition
>   target/mips: Let do_translate_address() take MMUAccessType argument
>   target/mips: Let cpu_mips_translate_address() take MMUAccessType arg
>   target/mips: Let raise_mmu_exception() take MMUAccessType argument
>   target/mips: Let get_physical_address() take MMUAccessType argument
>   target/mips: Let get_seg*_physical_address() take MMUAccessType arg
>   target/mips: Let CPUMIPSTLBContext::map_address() take MMUAccessType
>   target/mips: Remove unused 'rw' argument from page_table_walk_refill()
>   target/mips: Include missing "tcg/tcg.h" header
>   target/mips: Make cpu_HI/LO registers public
>   target/mips: Promote 128-bit multimedia registers as global ones
>   target/mips: Rename 128-bit upper halve GPR registers
>   target/mips: Introduce gen_load_gpr_hi() / gen_store_gpr_hi() helpers
>   target/mips: Use GPR move functions in gen_HILO1_tx79()

I am sorry I didn't notice hw/mips/bootloader.h is missing the
license (patch 2).

If it isn't too late for you I'll push a v2.

Thanks,

Phil.

