Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A78638B21
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:25:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYhm-0002ft-Br; Fri, 25 Nov 2022 08:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyYhk-0002eG-GJ
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:25:20 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyYhi-0001CZ-Nw
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:25:20 -0500
Received: by mail-wr1-x429.google.com with SMTP id b12so6788684wrn.2
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 05:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OUkWqyAEUKslzxTVLU4pR2FAchUQX+pmvj32I/G1fYY=;
 b=OZc0jMiuCS7LSC9QAXOvpWfzeJFvAMxY9j+eeNyO62sAku8m8h6lsoPSF6H9YtbiMn
 guAgYcpxES4epF+V5WkhB7+ZUwES2RMbJG9zCbdJT8byjYpHtmdLPMWeNJH0mNV3Ly9p
 YrzwBlFQGYLc4PrRkqklzJEEZ+ZKcAQ3aHclIcC1N/AuFfN1ImW769AiqdsJJ3+5HNYL
 EsAvAXmj9++8sX0YWcUVLxScIWJVOkOk598CVNDvTrBda8vtFhZJkFPRVCM7cFaI4CBf
 Qy/qAlpwJ58r8KNOHpcs2LhHxaTVAGhpMFgh0HT65W140QHDOWVEW+7UC3yvqkQuoBDJ
 9ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OUkWqyAEUKslzxTVLU4pR2FAchUQX+pmvj32I/G1fYY=;
 b=rTjXJbBYPYRmERhKR6k+DQV1jIZlnG+ibYxC9WgIGo5XC5boDolf9dHDaDzk7oycWm
 pLa8B3YvhWxagb2f16yUTOTeCuX6USnkDDQmAew1u0uhDAef09nhobZfertMqmkrSTKz
 4j0dAvPdwoitQgPuPbOWGnGZDCqSsQ+oDVqqK8M4aKcdY/1/QJQjBgK4Q4NMlw6CfVpR
 qZu810OKjuEWAt4xN0YSeSD+h3K/FcEBYL/2kj6Nrr4VDc1kP8w09V376qvkcv/WyRk8
 eRvqZmpN9l7mcW75cFkojcgDyhQMlBAG35SsHdoekGJQbFi3zOXlweuqcLFCA85WKbLB
 GH6w==
X-Gm-Message-State: ANoB5pm/OrKpy2BVbPcujmHhXSCprDKFk6tg2v3SpWslfWTRPSo8SY8J
 3X4PdefbFtm6+BDadUdNcifzMw==
X-Google-Smtp-Source: AA0mqf4G9QXZG4kvpYpgnNMs9xvhNF42vkRR1PzN6xfiZZGkQ+fy+5RZAKqvKn39w/TenNQ4VBkZzg==
X-Received: by 2002:adf:e88e:0:b0:22e:68a1:ddab with SMTP id
 d14-20020adfe88e000000b0022e68a1ddabmr23094518wrm.496.1669382717084; 
 Fri, 25 Nov 2022 05:25:17 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d58c4000000b002417e7f0685sm4272676wrf.9.2022.11.25.05.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 05:25:16 -0800 (PST)
Message-ID: <f1270702-699b-a8c9-95fd-8bf668d6f7e5@linaro.org>
Date: Fri, 25 Nov 2022 14:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 3/3] hw/mips: Add MIPS VirtIO board
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org
References: <20221124212916.723490-1-jiaxun.yang@flygoat.com>
 <20221124212916.723490-4-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221124212916.723490-4-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 24/11/22 22:29, Jiaxun Yang wrote:
> MIPS VirtIO board is design to utilize existing VirtIO infrastures
> but also comptitable with MIPS's existing internal simulation tools.
> 
> It includes virtio-mmio, pcie gpex, flash rom, fw_cfg, goldfish-rtc,
> and optional goldfish_pic in case MIPS GIC is not present.
> 
> It should be able to cooperate with any MIPS CPU cores.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   configs/devices/mips-softmmu/common.mak |    1 +
>   hw/mips/Kconfig                         |   18 +
>   hw/mips/meson.build                     |    1 +
>   hw/mips/virt.c                          | 1039 +++++++++++++++++++++++
>   4 files changed, 1059 insertions(+)
>   create mode 100644 hw/mips/virt.c
> 
> diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
> index 416161f833..534b7843eb 100644
> --- a/configs/devices/mips-softmmu/common.mak
> +++ b/configs/devices/mips-softmmu/common.mak
> @@ -29,6 +29,7 @@ CONFIG_MC146818RTC=y
>   CONFIG_EMPTY_SLOT=y
>   CONFIG_MIPS_CPS=y
>   CONFIG_MIPS_ITU=y
> +CONFIG_MIPS_VIRT=y

Is there any value adding the 32-bit machine, or can we just add it as 
64-bit?

> +struct MIPSVirtState {
> +    MachineState parent;
> +
> +    Notifier machine_done;
> +    Clock *cpuclk;
> +    DeviceState *platform_bus_dev;
> +    MIPSCPSState *cps;
> +    DeviceState *pic;
> +    PFlashCFI01 *flash[2];

We should be fine with 1 ROM for CODE and 1 flash for VARS,
see my previous comments on the LoongArch virt machine:

https://lore.kernel.org/qemu-devel/2f381d06-842f-ac8b-085c-0419675a4872@linaro.org/
https://lore.kernel.org/qemu-devel/b62401b2-3a12-e89d-6953-b40dd170b4ba@linaro.org/

> +    FWCfgState *fw_cfg;
> +
> +    MIPSVirtPlatType plat_type;
> +    int fdt_size;
> +};


