Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B94C5F6D
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:28:43 +0100 (CET)
Received: from localhost ([::1]:37034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOS1y-0002Ql-5U
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:28:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOS0W-0001ip-K5
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:27:12 -0500
Received: from [2607:f8b0:4864:20::102f] (port=50776
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOS0U-0001mP-RD
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:27:12 -0500
Received: by mail-pj1-x102f.google.com with SMTP id m22so9545394pja.0
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=vAG7VNzP+2PmivOohqNytxAUevvkvUIE1zXipqpbrHo=;
 b=jc8oroV8MN2mG9F9KYuQpg7vHX/j8vw/SSmun5fqCQOK6h/8ZBC5TRcf8HRzfpfqmO
 2Q55v4ZIsozKdum2TGqk4CGMBsE0YeD+K9nKUbolSSGtwTzh5D/IXU2W5u2eyrx0MLdH
 QGPDSnXWQZhm7tdWLEs/zZrPbn0pfgj2LB+TClzgCzJLeFhhbEBrO5/gs82bAGPYFfWZ
 9Yh6O16XcrYKvpDb8CXIG/aFQ2VPeRodhfmG5kzksDi/c/prKoAulGnZ/yfolHo6VKMB
 Bj8JRajooiYwGWXO0tGWAK769L7BdbRNIvkkE/8XKQxP1K9p9Sfkg4Rdz0zddDCAMVgw
 YknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vAG7VNzP+2PmivOohqNytxAUevvkvUIE1zXipqpbrHo=;
 b=rlYRMp/4Bvqvyyh4UNKVbs9lQolMjS12FYC6V+ccv1jfsVua9K4lH2S6h8B5hbbQBv
 Ma4qY0TRBIH961UoAnw82+bvaY9SX6lSVwon7I4EZrJsK3u6it2SjAxsn1GHM45FGSHv
 aT42XRPuRxLbJrloA8NvInnJ75oeO1PRVW4b8Xc/hiVN9Y3GlhzcVXRlWl/3ObGOsgIn
 nOivSz5fhkaeltdw+hjC3TOhTiqnIIMnRrq57pPaLprAEJ2t5ovso3BBzxh8J0V2KjQy
 XjF9yF/H+e8oXjffdfQ/6YDa5tDjxBWxpkvrDNiD2PFbgWnjD0GB5BhSRtQD7mXF0zRT
 dVKg==
X-Gm-Message-State: AOAM533RU41Akf+GUO7aDomaSRXWJr/3faw6JlnOmnt2NdlMigXKrfIt
 4ubFs300hK1j+4csJVnUolo=
X-Google-Smtp-Source: ABdhPJxuDdzWE3GTZ+QVJnUqn0Vby2X/d9FORpjWk/K5g/lUfQ2ZFltw7sHxYZulsquaC3ywtOtQCQ==
X-Received: by 2002:a17:902:cf05:b0:14d:5249:3b1f with SMTP id
 i5-20020a170902cf0500b0014d52493b1fmr17586971plg.135.1646000828530; 
 Sun, 27 Feb 2022 14:27:08 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 a11-20020a056a001d0b00b004f4057fafe2sm1868847pfx.94.2022.02.27.14.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:27:08 -0800 (PST)
Message-ID: <86f664c7-343e-8de3-3d21-787b7eaf65ac@gmail.com>
Date: Sun, 27 Feb 2022 23:27:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 22/22] isa: Remove unused isa_init_irq()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-23-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220222193446.156717-23-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 22/2/22 20:34, Bernhard Beschow wrote:
> isa_init_irq() had become a trivial one-line wrapper for isa_get_irq().
> The previous commits resolved all usages in favor of isa_get_irq().
> isa_init_irq() can therefore be removed.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/isa-bus.c     | 5 -----
>   include/hw/isa/isa.h | 1 -
>   2 files changed, 6 deletions(-)
> 
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 1e8c102177..0ad1c5fd65 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -85,11 +85,6 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
>       return isabus->irqs[isairq];
>   }
>   
> -void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
> -{
> -    *p = isa_get_irq(dev, isairq);
> -}
> -
>   void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
>   {
>       qemu_irq irq = isa_get_irq(isadev, isairq);
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index d80cab5b79..034d706ba1 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -90,7 +90,6 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
>                       MemoryRegion *address_space_io, Error **errp);
>   void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
>   qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
> -void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq);
>   void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
>   void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
>   IsaDma *isa_get_dma(ISABus *bus, int nchan);

I'd merge patches 7-22 as "Inline and remove one-line isa_init_irq()".

Either merged or for each 7-22 patch:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

