Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CD569F30E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:59:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmpD-0001xc-Ra; Wed, 22 Feb 2023 05:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUmpC-0001xM-FT
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:58:14 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUmpA-0004NW-Ot
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:58:14 -0500
Received: by mail-wr1-x430.google.com with SMTP id t15so7401111wrz.7
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SDFV6sjA7bpeZf1TS4HdmAQFBN9/WW+KGRG8n1XyCvA=;
 b=iUKRFGcSIPhyUiRib7ZpEfX3BI67am7tzjisBcgiJy4iQAsA/jrD1J2B9/NcC9ss2Y
 U9/7wQ7vS5zsgkj3mAzc3KADX1AV2AMgGHIMn67JpSBm3jXnO6jMYwsUGEylruaR1Pu/
 YpO26mPygcH87ehd1Iogsdcd2+pWx9rV5I7KlaDc1t9Yr4YFazaVWJubPxrclEUAbe9w
 iaEgAkOMp8ulFcfsqMU+x3jWnR6/mrlkkXXSabyuYZ4Cbe4U+CT9GA4LnmCAit8XPLUm
 nD/vJV2mMSHeJRZIDJ5XChrO8AJykUtLZ2/VbC/5qFdbvdnxRgXFVtQjmoWjYbANH5ba
 6Z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SDFV6sjA7bpeZf1TS4HdmAQFBN9/WW+KGRG8n1XyCvA=;
 b=pHCN+syTJmnI1JinVrugXwO/DhefqDw9XO93aDJwrWXbS/u6K1loQb/X9tMB/hcqor
 SJGEH6WZzmTkTVUP+1aWujVX43Xn38URoY5WkZ4WgRLCbPKgCKqmA3bhjDgZIsPXrPf5
 Lmst9Ti8dXf8/2MnJ25XMBBN+MOveFLSEJXkPhDub0KlwQHuK4omG3ksosCaD970+xnl
 G4Lu4GbR9p3y+UO1t49EEqcwThiJQnUg4oTrCYQtfK8QUlq3MJCX1N+sMupqhbzipCds
 zCuWb0nqlCUNZpPD6tN7ehp7tWkP30jCOsX72nKMXyVEp/uF7AJiPc+3UWW6GDEZbfh5
 gMyg==
X-Gm-Message-State: AO0yUKXEtNHDmNVUzRK+LtXfqelyVPtsFGtaXw3/SoykcA83U2cwKTMT
 sEwyOlsphBtIXyz04K6FjFevaA==
X-Google-Smtp-Source: AK7set/rBdpV4xHs/0AU3KHnrB3h+UiLRlBa6O+ysZMu185OnXZFGy0X5z122QHrLvKoU73r7D8WBQ==
X-Received: by 2002:a5d:438c:0:b0:2c5:843e:7c4 with SMTP id
 i12-20020a5d438c000000b002c5843e07c4mr6479604wrq.33.1677063490925; 
 Wed, 22 Feb 2023 02:58:10 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a5d453b000000b002c577e2fc87sm8747418wra.15.2023.02.22.02.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 02:58:10 -0800 (PST)
Message-ID: <f865212d-6a08-8f9e-5ddd-6fe037fc5fa9@linaro.org>
Date: Wed, 22 Feb 2023 11:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/9] hw/pci-host/i440fx: Inline sysbus_add_io()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230213162004.2797-1-shentey@gmail.com>
 <20230213162004.2797-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213162004.2797-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 13/2/23 17:19, Bernhard Beschow wrote:
> sysbus_add_io() just wraps memory_region_add_subregion() while also
> obscuring where the memory is attached. So use
> memory_region_add_subregion() directly and attach it to the existing
> memory region s->bus->address_space_io which is set as an alias to
> get_system_io() by the pc machine.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/pci-host/i440fx.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index 262f82c303..9c6882d3fc 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -27,6 +27,7 @@
>   #include "qemu/range.h"
>   #include "hw/i386/pc.h"
>   #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bus.h"
>   #include "hw/pci/pci_host.h"
>   #include "hw/pci-host/i440fx.h"
>   #include "hw/qdev-properties.h"
> @@ -217,10 +218,10 @@ static void i440fx_pcihost_realize(DeviceState *dev, Error **errp)
>       PCIHostState *s = PCI_HOST_BRIDGE(dev);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>   
> -    sysbus_add_io(sbd, 0xcf8, &s->conf_mem);
> +    memory_region_add_subregion(s->bus->address_space_io, 0xcf8, &s->conf_mem);

To avoid accessing internal fields we should stick to the PCI API:

     memory_region_add_subregion(pci_address_space_io(PCI_DEVICE(dev)),
                                 0xcf8, &s->conf_mem);

>       sysbus_init_ioports(sbd, 0xcf8, 4);
>   
> -    sysbus_add_io(sbd, 0xcfc, &s->data_mem);
> +    memory_region_add_subregion(s->bus->address_space_io, 0xcfc, &s->data_mem);
>       sysbus_init_ioports(sbd, 0xcfc, 4);

Now all classes implementing PCI_HOST_BRIDGE register conf/data in I/O
space, so this could be a pattern justifying reworking a bit the
PCIHostBridgeClass or adding an helper in "hw/pci/pci_host.h" to do
that generically.

