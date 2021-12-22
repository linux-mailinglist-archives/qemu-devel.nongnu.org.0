Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B4347D65D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:16:21 +0100 (CET)
Received: from localhost ([::1]:53606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06A0-0000YU-8A
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:16:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n066H-00037S-7i; Wed, 22 Dec 2021 13:12:30 -0500
Received: from [2607:f8b0:4864:20::829] (port=33773
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n066F-0004e1-Fh; Wed, 22 Dec 2021 13:12:28 -0500
Received: by mail-qt1-x829.google.com with SMTP id v4so74761qtk.0;
 Wed, 22 Dec 2021 10:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=KlytgUT1ZQS9se3PudE0vqJflH9eB02Wfbvh8gk3tUw=;
 b=jTB51q+dWLyu7psTG3JasEYdhw4M90hjlMyZc7I+0qQYbjKc6rJiMDw+ev/VV5kYKC
 k8/LhIskIAHzWrUU+96q6pjZRl55rC7BNloE9lNDv64OmrwMivIFYcmjXpr23LQ30PVX
 yROfG0JoIgskW/4pfndOMyXFtwocuYsSQ6rsS0De31/bDC+XU3UtvRazkrcbuBzzSjr3
 epraaW48iwz2qUgu3DgbEotWd8NrZBk4gBO/WHPkIy2v5BZ9rbRKwKnGajEDsmNpN1js
 jwZKx8FghGCVOxU9OZRxPTs7j7ucQq0s5vxF2glN/aI59FJ3rroWbY26JKQrDGWGveEO
 Y2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KlytgUT1ZQS9se3PudE0vqJflH9eB02Wfbvh8gk3tUw=;
 b=sZeloh4fCn2sg4gm+ljBby/yXglJQ9p/RXR25pj3Ytx57aTYBzWjyUZ6W7x06sLWQB
 sF+NxFsFkJEspS5sV2bGwMtKP8ONu45NzQpq+RaYOweAYcHoNxzvGxBa+117/yq2NCow
 pSrdHulvti7vr5noIruXRiKAzKgI/jgS6pdOZoTg1Y5XJAWO+kffntlLiDA8UgXy+Eho
 7DBMKSDa5fJ5rnkPH5eAEe+3+OqvkSoqIGm+/iksyHQNSI5OFdfKtTUJdS3JTR+li5oE
 gThQpnMLFUhwRsCgM+KHHydn9tDJxdT942zlh1h8LfxyGFPXQRsX2tYyQ6tIWui/E6B5
 vhRw==
X-Gm-Message-State: AOAM5314eu7e/CGpWOzwllElfjduYQmMi0KyL7Yhf1Vwy0LVDDTBqh+0
 4ztfPhXbFcBnIpfnUBFHfsg=
X-Google-Smtp-Source: ABdhPJyIiXHutvc9q7VqZ8mGwjaJv6ZerHOoexYRAxE1SCWUvSXDOqLiZXspLtMQP0cwOed/fuoezA==
X-Received: by 2002:ac8:7c96:: with SMTP id y22mr3071293qtv.329.1640196746380; 
 Wed, 22 Dec 2021 10:12:26 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:7ce4:b718:2cc0:32df:97ee?
 ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id s2sm2276011qtw.22.2021.12.22.10.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 10:12:26 -0800 (PST)
Message-ID: <5f81a641-20ed-0ff3-5845-71edc7908eb2@gmail.com>
Date: Wed, 22 Dec 2021 15:12:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/5] ppc/pnv: Remove PHB4 reset handler
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222063817.1541058-1-clg@kaod.org>
 <20211222063817.1541058-3-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211222063817.1541058-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 12/22/21 03:38, Cédric Le Goater wrote:
> The PHB4 reset handler was preparing ground for PHB5 to set
> appropriately the device id. We don't need it for the PHB4 since the
> device id is already set in the root port complex. PH5 will introduce
> its own.
> 
> "device-id" property is now useless. It should be removed.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb4.c | 13 -------------
>   1 file changed, 13 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 40b793201a34..4caf03310fab 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1229,18 +1229,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       phb->qirqs = qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->nr_irqs);
>   }
>   
> -static void pnv_phb4_reset(DeviceState *dev)
> -{
> -    PnvPHB4 *phb = PNV_PHB4(dev);
> -    PCIDevice *root_dev = PCI_DEVICE(&phb->root);
> -
> -    /*
> -     * Configure PCI device id at reset using a property.
> -     */
> -    pci_config_set_vendor_id(root_dev->config, PCI_VENDOR_ID_IBM);
> -    pci_config_set_device_id(root_dev->config, phb->device_id);
> -}
> -
>   static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
>                                             PCIBus *rootbus)
>   {
> @@ -1290,7 +1278,6 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>       device_class_set_props(dc, pnv_phb4_properties);
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>       dc->user_creatable  = false;
> -    dc->reset           = pnv_phb4_reset;
>   
>       xfc->notify         = pnv_phb4_xive_notify;
>   }
> 

