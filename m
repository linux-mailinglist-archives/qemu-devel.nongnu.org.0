Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830C95AA0FA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 22:36:57 +0200 (CEST)
Received: from localhost ([::1]:59004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTqvo-0000Vt-6J
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 16:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTqsX-0006ze-Hq
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:33:35 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTqsR-0001ck-RT
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:33:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id m2so18143804pls.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 13:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=asOCKPnu6cXiYKIM0Np/SFv4OWnJeAcz/fxCJ+HghKA=;
 b=NLUuCNOavjqMiW3FqzH9qrxwnYAtHktIOg4/86XIKtaoY9GuxaRHMa7KK+FygI+hmd
 Nutjtqxj1Nacfa8QzwW0aM/kX/7PgxKUjAy0w4/0RyENaPdlnydmcWl9sJQlrCDEpDzA
 XBOazkPqyglZCSfhuatJPw+t9lpGivYoT7LprSTtptWa+EgDqsKI8DgwA4cj8v49Qme5
 EugWCvoGK29sVdUzUKFbucpaavIrBFg60zp6XbT9I7o0Ft5gxicIWwVlrCNHptGYm6WU
 ny27KaDTzKgt5TXfc5tst8OQejU+lpNPSvr+XuCgXT+hYua9hDp74RsEwW/VVPR8FdaB
 TriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=asOCKPnu6cXiYKIM0Np/SFv4OWnJeAcz/fxCJ+HghKA=;
 b=U93gFJTU2OmnKkef64m8ONIYHNKYu0XA+dCTFdRBLx5r3VU/kCoPkjHM1v2Ts7YUzY
 IVvuDW9CvyvGyAT+WlroPFInjhKhLrdcOX7Y0tHh3qGcaTE5YS+Yk5Zuv6i0yxetu0BC
 WGVc/H0Anty8MmgxXK2Q0/bWMQSgLS+BracUYTwxlL2sFl+vsiY2I78jWOM5FHS6t+v/
 Txm1wZzqnKOmio4/tGPSpwiv7WumZh4LmoAlSDj2XSasVo3pS4NrHlM15QzvvFavXTa2
 KRJeAyZOMMPk4pDnk1fJH6VilWEM8JTBZiplpHRRlkZk6oRjUqTap/+r6MQivigFbCii
 I7TQ==
X-Gm-Message-State: ACgBeo3YdJfzJ7wufeki9VW4sZY3o3MAXNrntND/zW14CT0CW10AVZ29
 BV/6i0aVPAwS57JoCXcUxDM=
X-Google-Smtp-Source: AA6agR477F+WGxyTEzgPTIAL3OyuHOnrjfXaBxnWKMuK2DMetUZu/1kagMsbhREAPa4reKX1HGuvDQ==
X-Received: by 2002:a17:90b:1810:b0:1fd:b639:fd99 with SMTP id
 lw16-20020a17090b181000b001fdb639fd99mr1023757pjb.78.1662064404125; 
 Thu, 01 Sep 2022 13:33:24 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z188-20020a6233c5000000b00536aa488062sm1609pfz.163.2022.09.01.13.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 13:33:23 -0700 (PDT)
Message-ID: <bbafe598-81ae-63ac-6704-9963ca11f9d8@amsat.org>
Date: Thu, 1 Sep 2022 22:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 14/42] hw/isa/piix3: Modernize reset handling
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-15-shentey@gmail.com>
In-Reply-To: <20220901162613.6939-15-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/9/22 18:25, Bernhard Beschow wrote:
> Rather than registering the reset handler via a function which
> appends the handler to a global list, prefer to implement it as
> a virtual method - PIIX4 does the same already.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index c8c2dd6048..0350f70706 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -31,7 +31,6 @@
>   #include "hw/qdev-properties.h"
>   #include "hw/isa/isa.h"
>   #include "hw/xen/xen.h"
> -#include "sysemu/reset.h"
>   #include "sysemu/runstate.h"
>   #include "migration/vmstate.h"
>   #include "hw/acpi/acpi_aml_interface.h"
> @@ -156,9 +155,9 @@ static void piix3_write_config_xen(PCIDevice *dev,
>       piix3_write_config(dev, address, val, len);
>   }
>   
> -static void piix3_reset(void *opaque)
> +static void piix3_reset(DeviceState *dev)
>   {
> -    PIIX3State *d = opaque;
> +    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
>       uint8_t *pci_conf = d->dev.config;
>   
>       pci_conf[0x04] = 0x07; /* master, memory and I/O */
> @@ -321,8 +320,6 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
>       memory_region_add_subregion_overlap(pci_address_space_io(dev),
>                                           PIIX_RCR_IOPORT, &d->rcr_mem, 1);
>   
> -    qemu_register_reset(piix3_reset, d);
> -
>       i8257_dma_init(isa_bus, 0);
>   
>       /* RTC */
> @@ -397,6 +394,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>       AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
>   
> +    dc->reset       = piix3_reset;
>       dc->desc        = "ISA bridge";
>       dc->vmsd        = &vmstate_piix3;
>       dc->hotpluggable   = false;

Yay 4 years later...
https://lore.kernel.org/qemu-devel/20180108024558.17983-28-f4bug@amsat.org/

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

