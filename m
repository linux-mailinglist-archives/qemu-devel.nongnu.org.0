Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22F84444A8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:30:12 +0100 (CET)
Received: from localhost ([::1]:58122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIDL-0003Dv-TX
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miI7C-0001iy-Dv
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:23:51 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miI77-0002MM-VI
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:23:48 -0400
Received: by mail-qk1-x72e.google.com with SMTP id bp7so2612840qkb.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jBtm4kccoxZlTr1YK0iwLzwKc5TjF2FXLPHXE10No0E=;
 b=JGLXdJj1qgOgJLqgIRb41BeefTwiTAcDxi/80gYm2+QpXuvwxNIzuk/ToLVeuOgApF
 VieObmUW243BDa7BHp0OQcpCfP7nU+IsRRkCf4H1zPB//IJl8DhrvMhVIP5Je2RgwO4b
 dQz4Ba86+zJ+fEDpeTrJJcUHSESas2NLaV2bltd4uJq7AWkeZzJD6x3KtupKdV2aMyeU
 qVcUys97c61v1n4BmdJOXPYhf8NoqV60C4+4qz+lU5EHtrReClGsPeilu1F7irHR4FNI
 YGu1wdJy8DZveF/ocLfVh97/fIA5J7iFkB7DXCH1BzIzUNP3JuG/ZjOPpK4+2YnVyon0
 We4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jBtm4kccoxZlTr1YK0iwLzwKc5TjF2FXLPHXE10No0E=;
 b=CGVyttuVmIhvQ0skJBmK4b0btozoWDuMqTELtZfHtNJFr4V1fmdn9A6oO9HqHC5cp7
 ddJvK7+AefanRE+HvOFiGO3JLW2ofdFnKAmnoRidHlgZW+l9cNy1J/p8l1ko/w1ZfL4h
 OymyECchFCEDw8I73EQWqWSDr8nSHzT395e8D2hD+lJ0OmH/tWyYyuPatoBvc3O6MbeA
 S23i4/QIjg5OegDbJI/CNN03ownZ3EqYQebOAKktN1QPXjdWsUYr6q9u8JeDY+QpT3UH
 FTM1Fpy5rMmcbMtWHwPmWyp3YArZ0VypsJt4GGKrsB5Rase+VLqZnpzSX6jCMuJiffBd
 42YA==
X-Gm-Message-State: AOAM533ZFiUm5XiCgLqihkKl5+Hla6z6QncbSShdNU5wtV872Rq/wUnO
 Vzu+3Y9gAGv+2bzM/xU+bMhrU0ZqXQrUnw==
X-Google-Smtp-Source: ABdhPJyjdQLSzO5vKLVk1pkHj3k4rKkLzDk/6hFbY4m6kCgCcNEqPSVNIkViC5wiJ324YDavbpgE3A==
X-Received: by 2002:a05:620a:d85:: with SMTP id
 q5mr34842068qkl.64.1635953024465; 
 Wed, 03 Nov 2021 08:23:44 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id m1sm1759169qkp.124.2021.11.03.08.23.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 08:23:44 -0700 (PDT)
Subject: Re: [PULL v2 00/12] target/arm patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211102182519.320319-1-richard.henderson@linaro.org>
Message-ID: <c7c0b20d-9792-e474-8122-a01b76daa66c@linaro.org>
Date: Wed, 3 Nov 2021 11:23:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102182519.320319-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.528,
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

On 11/2/21 2:25 PM, Richard Henderson wrote:
> v2:
>    Dropped the errant npcm7xx_sdhci test case.
>    Added the hvf fix for openbsd.
> 
> 
> r~
> 
> 
> The following changes since commit 91e8394415f9bc9cd81c02bfafe02012855d4f98:
> 
>    Merge remote-tracking branch 'remotes/juanquintela/tags/migration-20211031-pull-request' into staging (2021-11-02 10:07:27 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-arm-20211102-2
> 
> for you to fetch changes up to 5fd6a3e23669444026f84f466a7ed402c203a84e:
> 
>    hvf: arm: Ignore cache operations on MMIO (2021-11-02 14:18:33 -0400)
> 
> ----------------------------------------------------------------
> Add nuvoton sd module for NPCM7XX
> Add gdb-xml for MVE
> More uses of tcg_constant_* in target/arm
> Fix parameter naming for default-bus-bypass-iommu
> Ignore cache operations to mmio in HVF
> 
> ----------------------------------------------------------------
> Alexander Graf (1):
>        hvf: arm: Ignore cache operations on MMIO
> 
> Jean-Philippe Brucker (1):
>        hw/arm/virt: Rename default_bus_bypass_iommu
> 
> Peter Maydell (1):
>        target/arm: Advertise MVE to gdb when present
> 
> Philippe Mathieu-Daudé (5):
>        target/arm: Use tcg_constant_i32() in op_smlad()
>        target/arm: Introduce store_cpu_field_constant() helper
>        target/arm: Use the constant variant of store_cpu_field() when possible
>        target/arm: Use tcg_constant_i64() in do_sat_addsub_64()
>        target/arm: Use tcg_constant_i32() in gen_rev16()
> 
> Shengtan Mao (4):
>        hw/sd: add nuvoton MMC
>        hw/arm: Add Nuvoton SD module to board
>        hw/arm: Attach MMC to quanta-gbs-bmc
>        tests/qtest/libqos: add SDHCI commands
> 
>   configs/targets/aarch64-softmmu.mak  |   2 +-
>   configs/targets/arm-linux-user.mak   |   2 +-
>   configs/targets/arm-softmmu.mak      |   2 +-
>   configs/targets/armeb-linux-user.mak |   2 +-
>   include/hw/arm/npcm7xx.h             |   2 +
>   include/hw/sd/npcm7xx_sdhci.h        |  65 +++++++++++++
>   target/arm/translate-a32.h           |   3 +
>   tests/qtest/libqos/sdhci-cmd.h       |  70 ++++++++++++++
>   hw/arm/npcm7xx.c                     |  12 ++-
>   hw/arm/npcm7xx_boards.c              |  20 ++++
>   hw/arm/virt.c                        |   4 +-
>   hw/sd/npcm7xx_sdhci.c                | 182 +++++++++++++++++++++++++++++++++++
>   target/arm/gdbstub.c                 |  25 +++++
>   target/arm/hvf/hvf.c                 |   7 ++
>   target/arm/translate-sve.c           |  17 ++--
>   target/arm/translate.c               |  27 ++----
>   tests/qtest/libqos/sdhci-cmd.c       | 116 ++++++++++++++++++++++
>   gdb-xml/arm-m-profile-mve.xml        |  19 ++++
>   hw/sd/meson.build                    |   1 +
>   tests/qtest/libqos/meson.build       |   1 +
>   20 files changed, 544 insertions(+), 35 deletions(-)
>   create mode 100644 include/hw/sd/npcm7xx_sdhci.h
>   create mode 100644 tests/qtest/libqos/sdhci-cmd.h
>   create mode 100644 hw/sd/npcm7xx_sdhci.c
>   create mode 100644 tests/qtest/libqos/sdhci-cmd.c
>   create mode 100644 gdb-xml/arm-m-profile-mve.xml

Applied, thanks.

r~


