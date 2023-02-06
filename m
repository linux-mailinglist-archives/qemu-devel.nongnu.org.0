Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5668BB03
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:11:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzOx-0001JE-Ph; Mon, 06 Feb 2023 06:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOzOv-0001IV-Lr
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:11:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOzOu-0001Kk-0F
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:11:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso8456406wms.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 03:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5TAhv2TTTqvxA8LNCzq9Vzzya3tsKSFHRbbUO/mKghc=;
 b=zzh0t9HQtSMsJJAA+cr3YRUVcHeqsNprJVJ7L8SASbDg9v4zFGYWqm0TbCTerVC98Z
 rsC5sLbw/jkINyKkltOTRSrHk0UjJPuvWI1X3NRsgou0B0c11b6DwI+4toI9AgUfckx5
 CMvNbPQgOEIyB5zcuYlQ90ekmpF4n/nFctyBuK/G/ATx34pgYvl1l/HRg8yLahtqyVkb
 nY06GOVRPCdryqF4lK/PFnU622HDIsTaDQiKqxn1oBu5BBom3i128JSXi+22+CqXib4s
 sPX39//YAHdMrw1rHZUjiHjZB1RraSOcLZ38c5Uh8sfSkVEeBu6i1YDCc0tqhhmt27Rs
 FPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5TAhv2TTTqvxA8LNCzq9Vzzya3tsKSFHRbbUO/mKghc=;
 b=3AG1L/EFhUpziWQOUU7443EKnnQqgy4irFBzvtNbgWpjl2m5eElwTZKxH8xlniY0+N
 AdupTfg/8LCg4EcpBuiu/zaoYrC+YUAC3O8MgWGKO250s4rHp0tCQ0Cl5h+7X2UVR79n
 uTtguN+/tEz47FQ3ZViycLv+1IjIWekTH5BARaRVlCd2gG29fd03Y/n0WVwLdDMOqDIg
 WIyc+fzrPKdrIJxct/nmHknpu/2vAKy0KKCCiUP9kEZTbeHnkHIz2tsl4nIW0etLxsj5
 MQVJa45OkYgicnLd7zrP0PbkbYrK6b9yGdGUrV0QzTOZbmb0SadlVrfjwHF+6Vur5aVX
 MPNA==
X-Gm-Message-State: AO0yUKWCkbDVpLkJ6aaysHQnHFmLy8qOgp8lz0ALhNcoVVPB57iOg3X3
 +JKaGmmWvG+MQa5tBDFtQ4MzyA==
X-Google-Smtp-Source: AK7set8EthqeJTceY5S3s9iQXLdRnciy9kEq6mAZUWm7w+6CcWg75GYVrK7uhREMmVvelFsfMeZXcg==
X-Received: by 2002:a05:600c:3795:b0:3dc:4c4f:6dc5 with SMTP id
 o21-20020a05600c379500b003dc4c4f6dc5mr19017957wmr.9.1675681865936; 
 Mon, 06 Feb 2023 03:11:05 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k6-20020adfb346000000b0027cb20605e3sm8711317wrd.105.2023.02.06.03.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:11:05 -0800 (PST)
Message-ID: <2d9ebc13-f5b4-c445-3a02-827c0a776178@linaro.org>
Date: Mon, 6 Feb 2023 12:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/1] hw/loongarch/virt: add system_powerdown hmp command
 support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, yangxiaojuan@loongson.cn,
 maobibo@loongson.cn, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20230112061144.3539393-1-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112061144.3539393-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/1/23 07:11, Song Gao wrote:
> For loongarch virt machine, add powerdown notification callback
> and send ACPI_POWER_DOWN_STATUS event by acpi ged. Also add
> acpi dsdt table for ACPI_POWER_BUTTON_DEVICE device in this
> patch.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/acpi-build.c   |  1 +
>   hw/loongarch/virt.c         | 14 ++++++++++++++
>   include/hw/loongarch/virt.h |  1 +
>   3 files changed, 16 insertions(+)

Cc'ing ACPI maintainers:

$ git grep acpi_send_event
include/hw/acpi/acpi_dev_interface.h:30:void acpi_send_event(DeviceState 
*dev, AcpiEventStatusBits event);

$ ./scripts/get_maintainer.pl -f include/hw/acpi/acpi_dev_interface.h
"Michael S. Tsirkin" <mst@redhat.com> (supporter:ACPI/SMBIOS)
Igor Mammedov <imammedo@redhat.com> (supporter:ACPI/SMBIOS)
Ani Sinha <ani@anisinha.ca> (reviewer:ACPI/SMBIOS)
qemu-devel@nongnu.org (open list:All patches CC here)

> diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
> index c2b237736d..b7601cb284 100644
> --- a/hw/loongarch/acpi-build.c
> +++ b/hw/loongarch/acpi-build.c
> @@ -261,6 +261,7 @@ build_la_ged_aml(Aml *dsdt, MachineState *machine)
>                                    AML_SYSTEM_MEMORY,
>                                    VIRT_GED_MEM_ADDR);
>       }
> +    acpi_dsdt_add_power_button(dsdt);
>   }
>   
>   static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 66be925068..a4998599d3 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -316,6 +316,16 @@ static void virt_machine_done(Notifier *notifier, void *data)
>       loongarch_acpi_setup(lams);
>   }
>   
> +static void virt_powerdown_req(Notifier *notifier, void *opaque)
> +{
> +    LoongArchMachineState *s = container_of(notifier,
> +                                   LoongArchMachineState, powerdown_notifier);
> +
> +    if (s->acpi_ged) {

Why check for acpi_ged? AFAICT it is always set.

Otherwise LGTM.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        acpi_send_event(s->acpi_ged, ACPI_POWER_DOWN_STATUS);
> +    }
> +}
> +
>   struct memmap_entry {
>       uint64_t address;
>       uint64_t length;
> @@ -859,6 +869,10 @@ static void loongarch_init(MachineState *machine)
>                                      VIRT_PLATFORM_BUS_IRQ);
>       lams->machine_done.notify = virt_machine_done;
>       qemu_add_machine_init_done_notifier(&lams->machine_done);
> +     /* connect powerdown request */
> +    lams->powerdown_notifier.notify = virt_powerdown_req;
> +    qemu_register_powerdown_notifier(&lams->powerdown_notifier);
> +
>       fdt_add_pcie_node(lams);
>       /*
>        * Since lowmem region starts from 0 and Linux kernel legacy start address
> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
> index f5f818894e..7ae8a91229 100644
> --- a/include/hw/loongarch/virt.h
> +++ b/include/hw/loongarch/virt.h
> @@ -45,6 +45,7 @@ struct LoongArchMachineState {
>       /* State for other subsystems/APIs: */
>       FWCfgState  *fw_cfg;
>       Notifier     machine_done;
> +    Notifier     powerdown_notifier;
>       OnOffAuto    acpi;
>       char         *oem_id;
>       char         *oem_table_id;


