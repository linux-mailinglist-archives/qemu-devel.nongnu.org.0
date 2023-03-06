Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAE96AC8C0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:52:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZE45-0005Fl-2z; Mon, 06 Mar 2023 11:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZE42-0005FY-NP
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:51:54 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZE41-0008Eu-08
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:51:54 -0500
Received: by mail-wm1-x330.google.com with SMTP id j3so6104085wms.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 08:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678121511;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cEEFl6UYa3rl8WJ3XvHwTTp/aWt37/w4z28mtW0Lo30=;
 b=pCBXQ6Jugkx+8KLQmZ0Pzvzojj+DYbk1wlG1Yk6zOv9KwYpxPov1c7piPHiusHIY06
 v34qsNLAOqI90FlvfrfRd///bMhYTSFJwogUMytNt1wI1EHweBZWML+IJoFj0Bz6SxO6
 tLiLT0bISA473734GDes4zG0gS9hQePGj+i0i7Lax9ZP1/qkBrvrctDatsIDDQVMyZk9
 D908ihOo2miHd5AHkiSFDvvtTX8bEzS4GTiK3IyOSijYIvqRoDw6QpH6yXxyyy/gkVQ1
 ecg1nF6YNm2RCxk+d+99AF/cCNqK/os1Bg7o0WcBcp7ZZyum6vtfsIqkXzcIoaxVsICv
 YUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678121511;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cEEFl6UYa3rl8WJ3XvHwTTp/aWt37/w4z28mtW0Lo30=;
 b=cwNE7i6JGbC4oBBY8lNiIUUCHHK0qu6/Bpr0CK127BgxRaADcK+Vh75Y0yBRB0l2yU
 AKYlJjqZDCLPlcVGzETdwqIOSp+/l/WHjbjpjmZxtUy+zLJC42HWo2yGvzqBFssaV7Zd
 QpR8FrB0gXx5qlhG9UAEfyjk4nC42Jp5BnWICUcGe5biL5Wl56kz7zx2qNgJGQdBGTi2
 XR9IRkA/f3x3XJuQAFjkJsFAkNuEXAUBpbU56JCh/9zkbLsF5lTFl7FL4/pCruFrIUC3
 nORspBGKqpGLqfOjaLj28Z93nyC6S6dF1DE0iXecsMToTpL0DlNDp3DtpQhrgzYkhVdw
 pghg==
X-Gm-Message-State: AO0yUKXxl7Q+PohKqZtFzo1o1+uflMTWvAeaJenYnuRmKKuvsaRgsp/H
 HHbtpwJTqehDZyILDhfiN5rSdQ==
X-Google-Smtp-Source: AK7set91WfDXGi7Re0uaxVvXskyA3Dl3Wzk53HFKXRjk9dJl80W173zWkE6lb/2Ev3e/wU2diLoL1w==
X-Received: by 2002:a05:600c:4509:b0:3eb:29fe:7343 with SMTP id
 t9-20020a05600c450900b003eb29fe7343mr9665833wmo.33.1678121510971; 
 Mon, 06 Mar 2023 08:51:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bi25-20020a05600c3d9900b003e89e3284fasm14365427wmb.36.2023.03.06.08.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 08:51:50 -0800 (PST)
Message-ID: <d118e72e-852c-e80d-2180-245e99291f3a@linaro.org>
Date: Mon, 6 Mar 2023 17:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] hw/mips: Add MIPS virt board
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
 <20230304223803.55764-3-jiaxun.yang@flygoat.com>
 <50b4c547-7237-9b4d-2cbe-653a5a403210@linaro.org>
In-Reply-To: <50b4c547-7237-9b4d-2cbe-653a5a403210@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/3/23 17:42, Philippe Mathieu-Daudé wrote:
> On 4/3/23 23:38, Jiaxun Yang wrote:
>> MIPS virt board is design to utilize existing VirtIO infrastures
>> but also comptitable with MIPS's existing internal simulation tools.
>>
>> It includes virtio-pci, virtio-mmio, pcie gpex, flash rom, fw_cfg,
>> goldfish-rtc and MIPS CPS system.
>>
>> It should be able to cooperate with any MIPS CPU cores.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> v1:
>>   - Rename to virt board
>>   - Convert BIOS flash to ROM
>>   - Cleanups
>> v2:
>>   - Fix fdt flash
>>   - Remove UP variant
>> ---
>>   MAINTAINERS                             |   7 +
>>   configs/devices/mips-softmmu/common.mak |   1 +
>>   docs/system/target-mips.rst             |  22 +
>>   hw/mips/Kconfig                         |  17 +
>>   hw/mips/meson.build                     |   1 +
>>   hw/mips/virt.c                          | 916 ++++++++++++++++++++++++
>>   6 files changed, 964 insertions(+)
>>   create mode 100644 hw/mips/virt.c


>> +#include "qom/object.h"
>> +#include <libfdt.h>
>> +
>> +#define TYPE_MIPS_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
> 
> So now every variant requires libfdt available on the host,
> otherwise building with --target-list=mips-softmmu,mipsel-softmmu
> on a host without libfdt:
> 
> ../../hw/mips/virt.c:47:10: fatal error: 'libfdt.h' file not found
> #include <libfdt.h>
>           ^~~~~~~~~~
> 
> So we can use:
> -- >8 --
> diff --git a/configs/targets/mips-softmmu.mak 
> b/configs/targets/mips-softmmu.mak
> index 7787a4d94c..a5c1db82c9 100644
> --- a/configs/targets/mips-softmmu.mak
> +++ b/configs/targets/mips-softmmu.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=mips
>   TARGET_ALIGNED_ONLY=y
>   TARGET_BIG_ENDIAN=y
>   TARGET_SUPPORTS_MTTCG=y
> +TARGET_NEED_FDT=y
> diff --git a/configs/targets/mips64-softmmu.mak 
> b/configs/targets/mips64-softmmu.mak
> index 568d66650c..398e0fc244 100644
> --- a/configs/targets/mips64-softmmu.mak
> +++ b/configs/targets/mips64-softmmu.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=mips64
>   TARGET_BASE_ARCH=mips
>   TARGET_ALIGNED_ONLY=y
>   TARGET_BIG_ENDIAN=y
> +TARGET_NEED_FDT=y
> diff --git a/configs/targets/mipsel-softmmu.mak 
> b/configs/targets/mipsel-softmmu.mak
> index c7c41f4fb7..3ddebca575 100644
> --- a/configs/targets/mipsel-softmmu.mak
> +++ b/configs/targets/mipsel-softmmu.mak
> @@ -1,3 +1,4 @@
>   TARGET_ARCH=mips
>   TARGET_ALIGNED_ONLY=y
>   TARGET_SUPPORTS_MTTCG=y
> +TARGET_NEED_FDT=y
> ---

Also missing (to get libfdt include path added to CPPFLAGS):

-- >8 --
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 5670c939fa..a5a6c64a06 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -3,3 +3,3 @@ mips_ss.add(files('bootloader.c', 'mips_int.c'))
  mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
-mips_ss.add(when: 'CONFIG_MIPS_VIRT', if_true: files('virt.c'))
+mips_ss.add(when: 'CONFIG_MIPS_VIRT', if_true: [files('virt.c'), fdt])
  mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: 
files('loongson3_bootp.c', 'loongson3_virt.c'))
---

