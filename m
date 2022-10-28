Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9EB611D6E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 00:37:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooXx5-0003N8-Tg; Fri, 28 Oct 2022 18:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooXx3-0003Mk-E8
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 18:35:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooXx1-0007V9-LT
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 18:35:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id bk15so8273023wrb.13
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 15:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dMHuzZOle9sbJ27011SFv5HHUtj5M9vidZqH47LXNNk=;
 b=PX7JknSRjW+oYpE4sGKEbxaT/s9QS0fgd7g2VWJI+mjTOlZHQvoftqmnNHNt8EjlmO
 +d2yu1WhOEjj8EW3vDRo8iUvffFTn4AwV9VCnoFAekalBsqNgDw1v2i7FqKpgdd0LRBS
 bnjQDKSlwypCFkaaT9lIY2u/kTIp97PGEh7LKhPsiuyN3glzHna1MNSoDJ4RjLVH2pcn
 ZxOCV9kTMWFAxMoFPJye0uPWq8ZlE+6gamB5GMYadbb513KPPjCq2OWSvt5d64vXW06H
 bu8UNQXcrQtc4T6iVOuPl8zO+sSdUXOPoUjvd2RErEIV5j6PlIuh3FFJCxU5nyTrsHlM
 S6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dMHuzZOle9sbJ27011SFv5HHUtj5M9vidZqH47LXNNk=;
 b=OG66Waa/4BXcE/FW+bX7mgmA0K5IIJTV5qYqdGEKkii/BOvWc/svyVxe+HcrxkZdgi
 o3l5obGG9k3PWHGmtxThipdllg2apuls1VCazN7x9NDSFpyPKibfjATmUo0K73jrmwYT
 PKxPPBebZi1L+LaIMcU4E4ZUI50nzq/mjLBEnNZwMGZXRsCuYNcrFXpsWY/ttVaxKq9k
 sAlYmBgh9qYF6BSVsBYTvrblqsX0XYnoHgL3XVYyDdcXT0q0HqbpW/FqaZ2L3m4IChAT
 /lhjfc12KkpxndrSAvHEHrYZcRJasfK1m5tBey8WWZD2/8LpPpbA+G+UIQxinBM95KDS
 Vppw==
X-Gm-Message-State: ACrzQf0NX1uQFQ+EjmTWw9O0kImuDUvFGFHa4mKW0We9q3cDu+BI4ZIe
 XMJ+FQJyMnb8Sj2YvwmVdKRfGQ==
X-Google-Smtp-Source: AMsMyM4MUcj0o+ogXtXOQgwB7B8ZTBJB0cxNaG9awHuDWSC6l0IOI2mxbFS/nwMx8L6XlFq+uYXoNA==
X-Received: by 2002:adf:d0c7:0:b0:236:78b8:942a with SMTP id
 z7-20020adfd0c7000000b0023678b8942amr822065wrh.348.1666996541549; 
 Fri, 28 Oct 2022 15:35:41 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e30-20020a5d595e000000b002366d1cc198sm4493337wri.41.2022.10.28.15.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:35:40 -0700 (PDT)
Message-ID: <2d49657a-67d0-5d58-b646-23a4e30abc02@linaro.org>
Date: Sat, 29 Oct 2022 00:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v5 02/17] pci: Allow to omit errp for pci_add_capability
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
 <20221028122629.3269-3-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221028122629.3269-3-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/22 14:26, Akihiko Odaki wrote:
> pci_add_capability appears most PCI devices. Its error handling required
> lots of code, and led to inconsistent behaviors such as:
> - passing error_abort
> - passing error_fatal
> - asserting the returned value
> - propagating the error to the caller
> - skipping the rest of the function
> - just ignoring
> 
> The code generating errors in pci_add_capability had a comment which
> says:
>> Verify that capabilities don't overlap.  Note: device assignment
>> depends on this check to verify that the device is not broken.
>> Should never trigger for emulated devices, but it's helpful for
>> debugging these.
> 
> Indeed vfio has some code that passes capability offsets and sizes from
> a physical device, but it explicitly pays attention so that the
> capabilities never overlap. Therefore, we can always assert that
> capabilities never overlap when pci_add_capability is called, resolving
> these inconsistencies.
> 
> Such an implementation of pci_add_capability will not have errp
> parameter. However, there are so many callers of pci_add_capability
> that it does not make sense to amend all of them at once to match
> with the new signature. Instead, this change will allow callers of
> pci_add_capability to omit errp as the first step.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/pci/pci.c         |  8 ++++----
>   include/hw/pci/pci.h | 13 ++++++++++---
>   2 files changed, 14 insertions(+), 7 deletions(-)

> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index b54b6ef88f..51fd106f16 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -2,6 +2,7 @@
>   #define QEMU_PCI_H
>   
>   #include "exec/memory.h"
> +#include "qapi/error.h"
>   #include "sysemu/dma.h"
>   
>   /* PCI includes legacy ISA access.  */
> @@ -390,9 +391,15 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
>   void pci_unregister_vga(PCIDevice *pci_dev);
>   pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
>   
> -int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
> -                       uint8_t offset, uint8_t size,
> -                       Error **errp);
> +int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
> +                              uint8_t offset, uint8_t size,
> +                              Error **errp);
> +
> +#define PCI_ADD_CAPABILITY_VA(pdev, cap_id, offset, size, errp, ...) \
> +    pci_add_capability_legacy(pdev, cap_id, offset, size, errp)
> +
> +#define pci_add_capability(...) \
> +    PCI_ADD_CAPABILITY_VA(__VA_ARGS__, &error_abort)
Do we really need PCI_ADD_CAPABILITY_VA?

   #define pci_add_capability(...) \
        pci_add_capability_legacy(__VA_ARGS__, &error_abort)


