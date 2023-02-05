Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80A268AF72
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcpf-0005Cl-7v; Sun, 05 Feb 2023 06:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcpb-0005Bn-8j
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:05:11 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcpY-0006H0-I0
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:05:11 -0500
Received: by mail-ej1-x630.google.com with SMTP id bk15so26763886ejb.9
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 03:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2osJA2OLrMFuNPfRJ1Jdiww7Q2EvwQbnvhrpg5YfAoo=;
 b=WLQBh9Yb2w/zShfD3nnetooRUcaKrIQdn4ykcjpDnKkSV2Kfu3QU26Jk8Tne7G63j7
 JWwO/oDMu50392Ft1Dy6KBqWFU1ErUVbxI4fteTEu4MXQHyOvAiHBMO6D4I82OL3X8dF
 zhgxeL4NwY3WiQXj9tQ03V18U4sJLTow9D/qUmyyJuLn7Nt4OMx/5tpDKViYo7NKDjJ2
 XcyR+nz5sZNSmweEOdt6sZUhOg8cFXl0to3i65jV50PeLbrtfv12McwkM9POkVMxB8JL
 tPxy7ndgZTJ05eDeOBzedK98QJXA748CDxhyNYToFBH3Ott9nCtrb2NPs9/h8S1uP9iH
 RC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2osJA2OLrMFuNPfRJ1Jdiww7Q2EvwQbnvhrpg5YfAoo=;
 b=k/xy+nZRz/TFUc8H8r3GxN8gDOMMXPWo/qR8o1Ej6aMMh8OlHI0bsNuffdgIlsPSUf
 ofm1tWc3hazO4KASHI2N58J6apQEgOVCsTJ0w9ZI5zMHawLDn+L4fCkufQxq/6Xg1L5K
 mWjytbvIKyK0SeaOT4wL2tdQGE0J/rSF5mkOUYP1MSKFxWNLJEYYzugPOaHghk7bZCPR
 PS0/ksPi98OUfWyP6dxpIztuiJhfiF/R/Vr0V0c6ehH09ybVbLPrkEGxDmKqS2WkA9o4
 vmzkv/t2wUxrdRle/2dkuZZjOoQVAcLGr4VsrjTRqxA2Ia7QUNVBk4SNMebcO0edlKBS
 +kWQ==
X-Gm-Message-State: AO0yUKXcjqrUPOYLRFb7uB8Bd9x4Qd1mi20qaaTM+WKKSHxS/Kw7joYa
 cHCWkKtVTQroDaG2DRHWhsnVWw==
X-Google-Smtp-Source: AK7set88mVl33Musb2/VW/GRO5zyt3W8nhWkm9S3AFjV0fAwvLy9UWVMbfFK1xPm1acHtYhfn+c6iA==
X-Received: by 2002:a17:906:2ed7:b0:878:5f7a:7aab with SMTP id
 s23-20020a1709062ed700b008785f7a7aabmr15513230eji.39.1675595106928; 
 Sun, 05 Feb 2023 03:05:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a17090603d300b0088519b9206bsm3964410eja.130.2023.02.05.03.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:05:06 -0800 (PST)
Message-ID: <0f994c3c-b90f-17da-3904-395e2536f843@linaro.org>
Date: Sun, 5 Feb 2023 12:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/9] hw/pci-host/i440fx: Inline sysbus_add_io()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204151027.39007-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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

On 4/2/23 16:10, Bernhard Beschow wrote:
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

address_space_io is internal to PCIBus. Better would be adding a helper
like pci_bus_io_region() IMO. Anyhow, removing sysbus_add_io() uses is
good, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


