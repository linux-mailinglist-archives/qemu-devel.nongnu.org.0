Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1358E6A5A13
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:40:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0Cg-0003HK-Dy; Tue, 28 Feb 2023 08:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0Ce-00038t-E2
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:39:36 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0Cc-0001Ad-RY
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:39:36 -0500
Received: by mail-wm1-x331.google.com with SMTP id j3so6437699wms.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 05:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jnSM6uKNMyXbGgLJXAuve8VftE83ASH0tywie9oQIak=;
 b=nWlGcfTp/v1ef/LDmracRm3cPTY8kIjG7GVNKavc8Yi0D8hT78KzgTFtUmJ8zn7r5o
 Szx36vcX2haHvC6VP7YORBV6l7MkpA5ONZSkmyxsuKfQqakbXa4xsadbp90pI4L07Kuv
 dfTaTSjPDTwrovefMA3dufHfml4jY7xULUNoYdlq04HbECjoOH0UEuJAuk2zbl0X9HKi
 BZp3DrCYCkDagnMei/Y5CIyVdMVZDd2DxuU8w8HkLZh37u/fvvJ/g+ZpUT67zCUMKDTW
 K7MlRoSoF8/Ki6fjHWBgKm9tLlH5M52NXixYo8x1XCBpdNwT5eqEbyOlfdwdYITa5JBt
 S4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jnSM6uKNMyXbGgLJXAuve8VftE83ASH0tywie9oQIak=;
 b=B5OIhtuWukmlaIChtQkcC+/TPXKC+QBACISOhh/F80ctPxaUGnJW1TxWIMWH1R0P3U
 DeNnqx7Cs54TpC0wAvHGPSFUm9ZP5FlFskhATmzr/+0TFvBkU+CgY2XGjnGD6b8h+0YN
 DQS0m2WR5iWMjj05zBCbqandix0g2ccpkvWjhEsSmtb+7Kn7/RmjPQMSzLG9wGU5BvTk
 hTroizntb50uhySB2FlX1QGFRA5IsuLfLgui2Zsiry5l0eYZQZ2nyossVkeI5tfUap+S
 PHzBPIbZbko5c0wHILAj3CtaSvv0zGu+oibhKn7yz/98BfiDKyzDsTq8pr+Ndldf+LuB
 1fZA==
X-Gm-Message-State: AO0yUKUYtwi4Fb+VpN6s+nwpQ7QYesBuG4TFz4Z9RKDUb7FSdlSDyYbW
 1RYXLNBPFKjnzAH7M9EOFVG4hkmTnJfBtmRa
X-Google-Smtp-Source: AK7set/kRbOvT4TY0v1adWBcfpY1qPTvvY6jL+mTY2+T9v9kQwnrBSE9LwxRWLhyFiPGw8lmVirIUw==
X-Received: by 2002:a05:600c:3d8e:b0:3eb:4cb5:e13 with SMTP id
 bi14-20020a05600c3d8e00b003eb4cb50e13mr2520107wmb.31.1677591572983; 
 Tue, 28 Feb 2023 05:39:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4521000000b002c573cff730sm9850929wra.68.2023.02.28.05.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:39:32 -0800 (PST)
Message-ID: <f7d73036-5b85-6945-68a7-19539b5c53e4@linaro.org>
Date: Tue, 28 Feb 2023 14:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 09/14] hw/net/tulip: Finish QOM conversion
Content-Language: en-US
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@163.com>,
 Thomas Huth <thuth@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Sven Schnelle <svens@stackframe.org>,
 Jason Wang <jasowang@redhat.com>
References: <20230213184338.46712-1-philmd@linaro.org>
 <20230213184338.46712-10-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213184338.46712-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jason, do you Ack this patch?

On 13/2/23 19:43, Philippe Mathieu-Daudé wrote:
> Use the TULIP() and DEVICE() QOM type-checking macros.
> Remove uses of DO_UPCAST().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/net/tulip.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> index 915e5fb595..990507859d 100644
> --- a/hw/net/tulip.c
> +++ b/hw/net/tulip.c
> @@ -19,7 +19,10 @@
>   #include "net/eth.h"
>   
>   struct TULIPState {
> +    /*< private >*/
>       PCIDevice dev;
> +    /*< public >*/
> +
>       MemoryRegion io;
>       MemoryRegion memory;
>       NICConf c;
> @@ -959,7 +962,7 @@ static void tulip_fill_eeprom(TULIPState *s)
>   
>   static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
>   {
> -    TULIPState *s = DO_UPCAST(TULIPState, dev, pci_dev);
> +    TULIPState *s = TULIP(pci_dev);
>       uint8_t *pci_conf;
>   
>       pci_conf = s->dev.config;
> @@ -967,7 +970,7 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
>   
>       qemu_macaddr_default_if_unset(&s->c.macaddr);
>   
> -    s->eeprom = eeprom93xx_new(&pci_dev->qdev, 64);
> +    s->eeprom = eeprom93xx_new(DEVICE(pci_dev), 64);
>       tulip_fill_eeprom(s);
>   
>       memory_region_init_io(&s->io, OBJECT(&s->dev), &tulip_ops, s,
> @@ -983,27 +986,26 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
>   
>       s->nic = qemu_new_nic(&net_tulip_info, &s->c,
>                             object_get_typename(OBJECT(pci_dev)),
> -                          pci_dev->qdev.id, s);
> +                          DEVICE(pci_dev)->id, s);
>       qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
>   }
>   
>   static void pci_tulip_exit(PCIDevice *pci_dev)
>   {
> -    TULIPState *s = DO_UPCAST(TULIPState, dev, pci_dev);
> +    TULIPState *s = TULIP(pci_dev);
>   
>       qemu_del_nic(s->nic);
>       qemu_free_irq(s->irq);
> -    eeprom93xx_free(&pci_dev->qdev, s->eeprom);
> +    eeprom93xx_free(DEVICE(s), s->eeprom);
>   }
>   
>   static void tulip_instance_init(Object *obj)
>   {
> -    PCIDevice *pci_dev = PCI_DEVICE(obj);
> -    TULIPState *d = DO_UPCAST(TULIPState, dev, pci_dev);
> +    TULIPState *s = TULIP(obj);
>   
> -    device_add_bootindex_property(obj, &d->c.bootindex,
> +    device_add_bootindex_property(obj, &s->c.bootindex,
>                                     "bootindex", "/ethernet-phy@0",
> -                                  &pci_dev->qdev);
> +                                  DEVICE(obj));
>   }
>   
>   static Property tulip_properties[] = {


