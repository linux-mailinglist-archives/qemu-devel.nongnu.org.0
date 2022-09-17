Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836F75BB8B3
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 16:12:37 +0200 (CEST)
Received: from localhost ([::1]:36148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZYYe-0007M5-IZ
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 10:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oZYWc-0005xc-Nl
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 10:10:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:41855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oZYWb-0007xe-8o
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 10:10:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso1503172wmb.0
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=lcjxnUpUVmQOmkZcsgUphLbJJBM4vbgJ7h2Sq8m23II=;
 b=OXXx3ue9NZphA2b67zV3ukwupoqtJ4laqOoC8IT3ozmffnVN8f4XnMhYuuTZIcNuQi
 49e/zFwhpDoJ1M6oIXcrnqZ9BuAg2LjuQ3JfipMdMMglrFrCSaTwg7Xwu4UC02OWyEuo
 tcTWdbOqJxjgfFDg3OmnKIrXwvOKIWopF9HiPlVTAnD9sy4d7LtlMdMF0f8bNRA16JBP
 kcgTdZ6iVbBzkd7wGrUe7hlOiYZfzoZFG0LIHzrFkGrWJCuQbh/aSoLw7fqUntcFwInn
 PDLUfq3FKz3R2A5QL6S9+Fn8az5Q8aRaEAb5eW+ew7gzGyJYc/unhnK+MmsqKlSAsggO
 XP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lcjxnUpUVmQOmkZcsgUphLbJJBM4vbgJ7h2Sq8m23II=;
 b=NAv7Hrz/KRt/zW0Bdm+XElh5F3Lm6zAX0ETWSs0fZ+cYix1NOinti30uXOdYg8ZmNO
 T9lqxeXhLAM77LhMFE88qnxZwfo7idZv7tJbJXSnvgqSM8p2Z0rh34fD/osr7bHvFGx4
 ZBQceJjkwxmeXrN36wKdxOUx1nFOZgNDQhV92jiBG6ArKeHbSxkH0Fh8FIP1Gsul4RLF
 XJkpdWFwRWWnfq+DeR3y9DWFlmKe9tNXsPkvPVJZRRSjsensXftsdtLsvM2cZuYnn01b
 iLNBCOLuocI68MaWGfQ9kSfs+r/eE2Gvf8YvlwLJbE8Pd+ABxwNfLsekOtZN8kY7YO+q
 Tk/g==
X-Gm-Message-State: ACrzQf1e3txGF5TmUipMRMObPR02sc35JtPBGRbeKYvE4j3fhZjhImfs
 AK8G94jPZnkYJ/OYUvRdddY=
X-Google-Smtp-Source: AMsMyM6nScC06Qoi0VjL/ObkJ1SSkGmE/Pre5mx1Lk8pUrCAhDNx1jQ9TA96odOTT92OQq69vVkTKQ==
X-Received: by 2002:a7b:ce99:0:b0:3b4:9031:fc02 with SMTP id
 q25-20020a7bce99000000b003b49031fc02mr6784027wmj.154.1663423827687; 
 Sat, 17 Sep 2022 07:10:27 -0700 (PDT)
Received: from [192.168.33.3] ([147.235.207.82])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adff2cd000000b00228dcf471e8sm8294069wrp.56.2022.09.17.07.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 07:10:26 -0700 (PDT)
Message-ID: <ff45d4c8-1184-ed5d-c347-c65f01f051ba@gmail.com>
Date: Sat, 17 Sep 2022 17:10:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] hw/display: load the correct ROM file for isa-vga device
To: kraxel@redhat.com
Cc: qemu-devel@nongnu.org
References: <20220917140650.105033-1-liavalb@gmail.com>
Content-Language: en-US
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <20220917140650.105033-1-liavalb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.529, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 9/17/22 17:06, Liav Albani wrote:
> Apparently we didn't load the correct ROM file when using the isa-vga
> device, which resulted in a display waiting to be initialized by a guest
> OS kernel. With this fix, SeaBIOS is able to print vital data to a text
> mode console during boot, which is useful in case of failing to continue
> booting.
>
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> ---
>   hw/display/vga-isa.c | 2 +-
>   hw/display/vga_int.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 46abbc5653..bcf646d012 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -84,7 +84,7 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>                                   VBE_DISPI_LFB_PHYSICAL_ADDRESS,
>                                   &s->vram);
>       /* ROM BIOS */
> -    rom_add_vga(VGABIOS_FILENAME);
> +    rom_add_vga(VGABIOS_ISAVGA_FILENAME);
>   }
>   
>   static Property vga_isa_properties[] = {
> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
> index 305e700014..b5e803ac51 100644
> --- a/hw/display/vga_int.h
> +++ b/hw/display/vga_int.h
> @@ -183,7 +183,7 @@ void vbe_ioport_write_data(void *opaque, uint32_t addr, uint32_t val);
>   extern const uint8_t sr_mask[8];
>   extern const uint8_t gr_mask[16];
>   
> -#define VGABIOS_FILENAME "vgabios.bin"
> +#define VGABIOS_ISAVGA_FILENAME "vgabios-isa.bin"
This should be an "vgabios-isavga.bin" actually, at least this is how it 
is named on my development machine. I'll send a v2 shortly.
>   #define VGABIOS_CIRRUS_FILENAME "vgabios-cirrus.bin"
>   
>   extern const MemoryRegionOps vga_mem_ops;

