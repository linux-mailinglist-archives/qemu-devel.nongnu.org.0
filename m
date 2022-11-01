Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE81615000
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:07:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsMN-0003Zx-G8; Tue, 01 Nov 2022 10:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opsMG-0003Z2-Gu
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:35:17 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opsME-0002Nz-4J
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:35:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id cl5so8782190wrb.9
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mba77bVt95Ve3hfStaqhl/1AXMyPU4tUX11eugH/fU0=;
 b=qG0pxekUBNhh1tPH/tFgb3F/j+UZ53esyoFnp3wW+58djCX3ZkrtMmWAsm87jMrMtK
 pygxmomdAwJzv/couqUYhSzDK8NKA2X57pt/EvAktp7INdEhxuVaq0cymWqh8APU1xCo
 MMravsII6HiyPsFUQYYamARrET/ix7DkfvxuqusLHgN18k1eTViLMB9LExerrtim7ZaK
 KgJ0Z9fr0FiC91u9Yav/rn6tYrnssH8ZIbZd9THSUB2gqM/8MRMtFdThiYvAXNG/cvK2
 oml/9+kZ+gCAtKkOhonFZhzXeD6tIniKEPilDVNy7zBPAx77WuQg2ZXiFo3d8CaMpWRb
 aHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mba77bVt95Ve3hfStaqhl/1AXMyPU4tUX11eugH/fU0=;
 b=DoczxaE7cWgLDankZwJk6XRnee77Jjf5vwDnmw6URT1le3dkYkuzzGdDDwYHY2gqk+
 ziRrrxcuYJB6jZYgndt3jDBJ6X121Ipo+NYTyW06lURPcElan4aYplk4LtCl2SSrKmOW
 pLCE7ABZH9sgdvx89N9mlvZa32LTeg+03Yg9LnCerfb51sNruQTTSpOT/4iWQ9T6y+Wv
 j4N4Ee0c2EmsJbAT7vY+zFAedZZbkXc+F3qBW4G/PRk0vUnrqE49SIztB6hnKHYpjXWX
 WeLBtjLSSGe1t2utpODpdQ2R5u3DOAtgYQRQX5ccCNjJzHLUa5LNpWqySuL27eNnRgzQ
 yI1w==
X-Gm-Message-State: ACrzQf1t7tQ085FsVrsS6uX5dtl5bnz9aEcNDOAx65S7YUOC0HZz6Ra6
 EdGDHD60koPmXPTcx18HAXs9Ug==
X-Google-Smtp-Source: AMsMyM6miG6VKVOZLdBJrbbyo+44u6tFc5FwPmz6tO8jEs5NXkMXyvwljb8zg2SybnlKFXuJariW7g==
X-Received: by 2002:a05:6000:156e:b0:22e:6bf3:79d0 with SMTP id
 14-20020a056000156e00b0022e6bf379d0mr12109853wrz.456.1667313311767; 
 Tue, 01 Nov 2022 07:35:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c414900b003b49ab8ff53sm10672323wmm.8.2022.11.01.07.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 07:35:11 -0700 (PDT)
Message-ID: <05002f72-176f-1299-0160-47d0f92c7344@linaro.org>
Date: Tue, 1 Nov 2022 15:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v8 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
 <20221101135749.4477-2-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221101135749.4477-2-akihiko.odaki@daynix.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/11/22 14:57, Akihiko Odaki wrote:
> pci_add_capability() checks whether capabilities overlap, and notifies
> its caller so that it can properly handle the case. However, in the
> most cases, the capabilities actually never overlap, and the interface
> incurred extra error handling code, which is often incorrect or
> suboptimal. For such cases, pci_add_capability() can simply abort the
> execution if the capabilities actually overlap since it should be a
> programming error.
> 
> This change handles the other cases: hw/vfio/pci depends on the check to
> decide MSI and MSI-X capabilities overlap with another. As they are
> quite an exceptional and hw/vfio/pci knows much about PCI capabilities,
> adding code specific to the cases to hw/vfio/pci still results in less
> code than having error handling code everywhere in total.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/pci/pci.c         | 34 ++++++++++++++++++++++------------
>   hw/vfio/pci.c        | 15 ++++++++++++++-
>   include/hw/pci/pci.h |  3 +++
>   3 files changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 2f450f6a72..b53649d1fd 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2512,6 +2512,25 @@ static void pci_del_option_rom(PCIDevice *pdev)
>       pdev->has_rom = false;
>   }
>   
> +bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
> +                                  uint8_t offset, uint8_t size, Error **errp)
> +{
> +    int i;
> +
> +    for (i = offset; i < offset + size; i++) {
> +        if (pdev->used[i]) {
> +            error_setg(errp,
> +                       "%s:%02x:%02x.%x PCI capability %x at offset %x overlaps existing capability %x at offset %x",
> +                       pci_root_bus_path(pdev), pci_dev_bus_num(pdev),
> +                       PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
> +                       cap_id, offset, pci_find_capability_at_offset(pdev, i), i);
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}

I apologize for jumping at v8 :/

Per the Error API, function taking an Error** as last argument should 
return TRUE on success; or FALSE on error and setting the *errp argument.

Your function return 'true' on error. The confusion might come from its
name 'pci_check_capability_overlap'.

 > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
 > index b54b6ef88f..77b264c17e 100644
 > --- a/include/hw/pci/pci.h
 > +++ b/include/hw/pci/pci.h
 > @@ -390,6 +390,9 @@ void pci_register_vga(PCIDevice *pci_dev, 
MemoryRegion *mem,
 >   void pci_unregister_vga(PCIDevice *pci_dev);
 >   pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 >

Please document function prototype of public APIs.

 > +bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
 > +                                  uint8_t offset, uint8_t size, 
Error **errp);
 > +
 >   int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
 >                          uint8_t offset, uint8_t size,
 >                          Error **errp);

Also, consider configuring scripts/git.orderfile :)

Regards,

Phil.

