Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79927687ACA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:48:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNX7v-0003SV-8l; Thu, 02 Feb 2023 05:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNX7t-0003Oe-7y
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:47:33 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNX7r-00018m-JG
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:47:32 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so1034717wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=96JTL4ELoG6kng7ICt+rcqu62Cj0G32jechBwlNDVvc=;
 b=tSmhyx4HRWiiwEr7VZv1zI/k4TZK8kAORNCi27if6GEfZcW2S4p/cxFZsxKT6sH4Kx
 LlA/IEGQ/vSTdfrlnZiRNVv/t09ZWyPVKnHd99yVvwcloGpMyGsXZWudXeWWs4rw3aV8
 tlqmSGNc4sJIgYM22oujX4i12tlxJIz5zg40fXi7cZswdl3VoVPGDbxoY0l6pPZzd9uH
 IdCNpH89ByZGTxkJuO2y7D7VCv+FTs8p9mZNL3yxiDD/fpjvzKUZmQj2liS4WE5IvdRg
 TMOpmvw2cNxv4FjUQS9eWpyrFBYw6Z2P9iqtbaHPMRjhSBkVCWxyWmU5LnUiHydO5ALh
 qmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=96JTL4ELoG6kng7ICt+rcqu62Cj0G32jechBwlNDVvc=;
 b=SfBfa7ppIoNGsc8DSGscmY4zRQgPSDtzcAsyTY3zbbWy5sbafFQsgvIqFxm/Z2uugv
 FS2HRU2LKSOVW48qxOuNsOyuLFxltwCR2LejkVEWZpiA/ggqcC5dFN4+RtYxKXJcldeD
 R6AS/n2LRfZOijuK1Wdb3tyC+Epq8kI5Nt1+NoY467jCDvx1XD+1gBB5Szb1gORGkOGz
 8rEnwleOQL94T/p2rPNjqp4LWs5KAkfJcLw1yr2knvkvbKvMH58Rk7UimFYBH3iAa+D0
 NWpLRuZ4rrSo9cU8h7VzZDhtWtoqnIxWqfhyi9tZzjRU1TXAmP1yE8g78IJ+PDtgWuYm
 x49w==
X-Gm-Message-State: AO0yUKXXMiGhNgRnUGhmWyXK9U1GdfrdEMsSS0Ms3BeEX1y85d9K1ho0
 VTT5eNIdB07f5TqutKgZF3cfSg==
X-Google-Smtp-Source: AK7set9Z5y66F3sDt5jVOdN4pfcLOgtNHuAD3nqoAwUFOCbzu2cjff11R4gxwHpWIRHq1cY32z9Xsw==
X-Received: by 2002:a05:600c:1f09:b0:3dc:24fc:ef6f with SMTP id
 bd9-20020a05600c1f0900b003dc24fcef6fmr5539655wmb.40.1675334849458; 
 Thu, 02 Feb 2023 02:47:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003dc36981727sm5021503wmq.14.2023.02.02.02.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 02:47:29 -0800 (PST)
Message-ID: <7592c27c-0c98-d52c-fecc-ac2b261ecbb3@linaro.org>
Date: Thu, 2 Feb 2023 11:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 08/34] hw/arm/virt: Let the virtio-iommu bypass MSIs
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>
References: <20200703165405.17672-1-peter.maydell@linaro.org>
 <20200703165405.17672-9-peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20200703165405.17672-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

Hi Eric,

On 3/7/20 17:53, Peter Maydell wrote:
> From: Eric Auger <eric.auger@redhat.com>
> 
> At the moment the virtio-iommu translates MSI transactions.
> This behavior is inherited from ARM SMMU. The virt machine
> code knows where the guest MSI doorbells are so we can easily
> declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
> setting the guest will not map MSIs through the IOMMU and those
> transactions will be simply bypassed.
> 
> Depending on which MSI controller is in use (ITS or GICV2M),
> we declare either:
> - the ITS interrupt translation space (ITS_base + 0x10000),
>    containing the GITS_TRANSLATOR or
> - The GICV2M single frame, containing the MSI_SETSP_NS register.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Message-id: 20200629070404.10969-6-eric.auger@redhat.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/virt.h |  7 +++++++
>   hw/arm/virt.c         | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)


>   static void create_gic(VirtMachineState *vms)
> @@ -2198,8 +2200,36 @@ out:
>   static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                               DeviceState *dev, Error **errp)
>   {
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +
>       if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>           virt_memory_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        hwaddr db_start = 0, db_end = 0;
> +        char *resv_prop_str;
> +
> +        switch (vms->msi_controller) {
> +        case VIRT_MSI_CTRL_NONE:
> +            return;
> +        case VIRT_MSI_CTRL_ITS:
> +            /* GITS_TRANSLATER page */
> +            db_start = base_memmap[VIRT_GIC_ITS].base + 0x10000;
> +            db_end = base_memmap[VIRT_GIC_ITS].base +
> +                     base_memmap[VIRT_GIC_ITS].size - 1;
> +            break;
> +        case VIRT_MSI_CTRL_GICV2M:
> +            /* MSI_SETSPI_NS page */
> +            db_start = base_memmap[VIRT_GIC_V2M].base;
> +            db_end = db_start + base_memmap[VIRT_GIC_V2M].size - 1;
> +            break;
> +        }
> +        resv_prop_str = g_strdup_printf("0x%"PRIx64":0x%"PRIx64":%u",
> +                                        db_start, db_end,
> +                                        VIRTIO_IOMMU_RESV_MEM_T_MSI);
> +
> +        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);

Where is "len-reserved-regions" declared?

Since qdev_prop_set_uint32() uses &error_abort, isn't this call
aborting the process? I am confused how this code path is exercised,
what am I missing?

> +        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
> +        g_free(resv_prop_str);
>       }
>   }
>   

