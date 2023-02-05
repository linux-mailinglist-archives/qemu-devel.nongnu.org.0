Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA74A68AF76
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcwx-0000yY-Ug; Sun, 05 Feb 2023 06:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcwm-0000y2-Ag
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:12:36 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcwj-0007k3-H4
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:12:35 -0500
Received: by mail-ej1-x62a.google.com with SMTP id mf7so26808044ejc.6
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DeHh+xR57LSPi2nTg81r53yT1/n7w4mqze1stnrDkbY=;
 b=kgCOqhDkmCcwQkf/ktzkh/3cgh2xwke0fuRjOhmBMqobccQHC6/b8HzbO3BGheHedg
 jwmi8SyL0I5tKLHJKtoztXwkXqs9uqzj6OmKrgxqQJmf0e/aWArjY6pwbOnWUbak3JeQ
 HRx/nR11lLEkyUGkHongKrJoquZQFHSLW439AlebPkwhidgrz5y0rGoJINoh6k3N3eun
 7q3hp5pzCHpwyU2z44gAu8RHKJSzcVojCxUZtk8VJ1GfY5l1d9PaZmOycVenv/1jBtGE
 ovp/+7F+a5TJb8BDW6dQK8njjrwxZQcEFIJ97uK4jGSToCT0nWaLj4EyNIuped8pBohW
 jFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DeHh+xR57LSPi2nTg81r53yT1/n7w4mqze1stnrDkbY=;
 b=brdnt59bGN67tHHLOh99NbwfGpmZqYwJeeW//X6fY58VzkpMa8/gqPuXnuoDOzTP/z
 OwiLj17xkAUPmdYWvA8vqP/ui/yfu2qkdbRCMby1AGHcsC1GdtnIPzVqaGG3YXhUKMCU
 Iw5LSg3LhX28ZKBDW8YqrQ8kL0wCznSecrTWY1u2d79GhUw4DsWOcR46y9wyh2fLbXG8
 KqAzV1Zw8B3gY0OQmP0alek3d/1imEvPt5z7iAkRs0UyAjwuXpw9ctqp7InPE9KAzEKR
 kXKx/nNM3uTAaVN7jXZjwY8igrUTz/fKtWDz6vtwiFhXuIuMDCjPDqgYOrZu4mCBOS06
 Rh2w==
X-Gm-Message-State: AO0yUKX75f+CW/AX7NaPVsSQ54TgqXfhz51ZIIy9UOzNh8YDVDVRITls
 2ufy35WKoSdhk3bG0/Yx/AaUqQ==
X-Google-Smtp-Source: AK7set9QHs76vz5NwISxPH8dW0MC2nx4hOQQJS0N6Aq8jAKta448AKkDkI/QApl5NjEVpF16I3tnPA==
X-Received: by 2002:a17:906:c7da:b0:878:4d11:f868 with SMTP id
 dc26-20020a170906c7da00b008784d11f868mr13867989ejb.2.1675595551095; 
 Sun, 05 Feb 2023 03:12:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a170906595200b00878775876c5sm4023721ejr.73.2023.02.05.03.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:12:29 -0800 (PST)
Message-ID: <58531e21-311c-a747-3859-a621144feeda@linaro.org>
Date: Sun, 5 Feb 2023 12:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/9] hw/pci-host/q35: Inline sysbus_add_io()
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
 <20230204151027.39007-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204151027.39007-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
> memory region s->mch.address_space_io which is set as an alias to
> get_system_io() by the q35 machine.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/pci-host/q35.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 26390863d6..fa05844319 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -50,10 +50,12 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
>       Q35PCIHost *s = Q35_HOST_DEVICE(dev);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>   
> -    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
> +    memory_region_add_subregion(s->mch.address_space_io,
> +                                MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
>       sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, 4);

This makes me wonder why MCH_PCI_DEVICE doesn't use the bus I/O space
via pci_address_space_io(). IOW, why the MR like is in MCH_PCI_DEVICE
and not Q35_HOST_DEVICE?

