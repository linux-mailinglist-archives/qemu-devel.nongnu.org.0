Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955FA629837
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:11:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouumC-0002ry-P3; Tue, 15 Nov 2022 07:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouulv-0002oY-L1
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:10:45 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouult-00049z-Gl
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:10:35 -0500
Received: by mail-ej1-x62b.google.com with SMTP id m22so35454535eji.10
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 04:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sBPjlQSfg1/Xl8y7dzJVsS49yOnDA28C7pGmbfRj6/I=;
 b=OdKXZhodcfMeK7abHLo/WRGs/qI2wNs5/6f/24mxN+hHe6yLAyRyw5Z+Fkoa17y10A
 S9NhqChZ8rVoaoagNBzl9g5SBMLRuUj7imi8lDRsJ+uW60BPqR3GFnZQRK+wuUWLf/cn
 hpVz1X5TCd4bcsMnPS4Rs7r9NDhXHzctFMR43Lfo6syAynsiUaeTL1OYgtcriUOdG5hP
 Wr3uXBTpmN74hfFaUBIKUKM5nDdfM1hClpne96C5hDLeVpVvQtGDvyYO/sJgVoldgjRm
 c2FxOPm7e2wdh+p5ejB/QL8/daWyXd7C29csE1K/WnI4WU8KBAMeu4ORLPFuNVKrq66e
 Xh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sBPjlQSfg1/Xl8y7dzJVsS49yOnDA28C7pGmbfRj6/I=;
 b=jwEJkC71a1X1sX9se+LkY/gW5m1h6E0v5X49Pk+4xcLUBjTK/TPEt8fniqh4VBmElm
 e4kqPnI05XvZQg0WioayfKwBA8TPp42Z4vLhDTSoBPMOfKDLv0ddQOkAWpGf3EP/ZKgV
 35oJHOUxbfsMrp8F0sLTp+oHAXmpcMpkjUvFJ9XHC1RPEVFrXIT+pz74L4Tp4c2YN/GV
 R0j+emipuwwI1kDI8wQoR5Gj5GjSCC1dBKjsLJ5xHsvXTQG+71LC9XSG6da7B36OL8sp
 vw/8SO1PiEFeZTm1b76flpEiC2RxbW/YQYdUCIkvCJN3xp6nxg58GJDm9MxR5cx1+4cc
 egcQ==
X-Gm-Message-State: ANoB5pnSV5k/ripN3Fcd1bYfiQpQQusnXnd6XjZe80rK4c28+u0sxZkW
 nxsLvBnEeI174QQ8qV1Z0mFnHyz1dYHlAg==
X-Google-Smtp-Source: AA0mqf7tN/rp4FqrCTVtpU+0kRaI+/j2vbNVq96eXVnE7bUxINGi1NIn8MowCg9QduzgQ0PSDSCIZg==
X-Received: by 2002:a17:906:c7c8:b0:78d:e7c0:a2b with SMTP id
 dc8-20020a170906c7c800b0078de7c00a2bmr13784187ejb.273.1668514231908; 
 Tue, 15 Nov 2022 04:10:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a170906a09100b0077909095acasm5481834ejy.143.2022.11.15.04.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 04:10:31 -0800 (PST)
Message-ID: <2f381d06-842f-ac8b-085c-0419675a4872@linaro.org>
Date: Tue, 15 Nov 2022 13:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] hw/loongarch: Add cfi01 pflash device
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn
References: <20221115115645.3372746-1-yangxiaojuan@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221115115645.3372746-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

On 15/11/22 12:56, Xiaojuan Yang wrote:
> Add cfi01 pflash device for LoongArch virt machine

So the subject prefix should be "hw/loongarch/virt:".

> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/Kconfig        |   1 +
>   hw/loongarch/acpi-build.c   |  39 +++++++++++
>   hw/loongarch/virt.c         | 130 +++++++++++++++++++++++++++++++++---
>   include/hw/loongarch/virt.h |   7 ++
>   4 files changed, 168 insertions(+), 9 deletions(-)

>   static bool memhp_type_supported(DeviceState *dev)
> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
> index 45c383f5a7..4ec4a7b4fe 100644
> --- a/include/hw/loongarch/virt.h
> +++ b/include/hw/loongarch/virt.h
> @@ -12,6 +12,7 @@
>   #include "hw/boards.h"
>   #include "qemu/queue.h"
>   #include "hw/intc/loongarch_ipi.h"
> +#include "hw/block/flash.h"
>   
>   #define LOONGARCH_MAX_VCPUS     4
>   
> @@ -20,6 +21,11 @@
>   #define VIRT_FWCFG_BASE         0x1e020000UL
>   #define VIRT_BIOS_BASE          0x1c000000UL
>   #define VIRT_BIOS_SIZE          (4 * MiB)
> +#define VIRT_FLASH_SECTOR_SIZE  (128 * KiB)
> +#define VIRT_FLASH0_BASE        VIRT_BIOS_BASE
> +#define VIRT_FLASH0_SIZE        (4 * MiB)
> +#define VIRT_FLASH1_BASE        (VIRT_FLASH0_BASE + VIRT_FLASH0_SIZE)
> +#define VIRT_FLASH1_SIZE        (4 * MiB)
>   
>   #define VIRT_LOWMEM_BASE        0
>   #define VIRT_LOWMEM_SIZE        0x10000000
> @@ -48,6 +54,7 @@ struct LoongArchMachineState {
>       int          fdt_size;
>       DeviceState *platform_bus_dev;
>       PCIBus       *pci_bus;
> +    PFlashCFI01  *flash[2];
>   };

Since you are starting a virtual machine from scratch, you should take
the opportunity to learn from other early mistakes. X86 ended that way
due to 1/ old firmwares back-compability and 2/ QEMU pflash block
protections not being implemented. IIUC if we were starting with a
UEFI firmware today, the layout design (still using QEMU) would be
to map the CODE area in a dumb ROM device, and the VARSTORE area
in a PFlash device. Since Virt machines don't need to use Capsule
update, having the CODE area in ROM drastically simplifies the design
and maintainance.

Regards,

Phil.

