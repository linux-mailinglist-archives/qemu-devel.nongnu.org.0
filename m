Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EABA52FA73
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 11:50:59 +0200 (CEST)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsLlC-0001rV-KO
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 05:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLij-0008Kc-03; Sat, 21 May 2022 05:48:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLih-0005wH-BA; Sat, 21 May 2022 05:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=57tLTuiStaQc55/sVhd5utQgjpHQVfb7X7NiqqNnEV0=; b=dHc1Ucf1pzF9TaIXzAA7RVqa2b
 NIw8VNVniq0l+bupNRv1t2k8JelEzlcC60W6R0kv1BeSvZxnRCoWOVlT1bE9gRCatfIzcOMtxT289
 C7z9in86QTpe2zMT3u0YOiGwQwRG3+WsYnea19qt26zOsUg4EhrIM5IwRvVYLlM2iW11LmMdlD8IV
 7vDeWIyV/3nZj3PlDXmP9bdSzf/8Vu2tkQZaEXyqPF5Pq1zPLF0T84Nb+lgwqPQ+hOSSa1twXy45f
 SuGaBmz42AUi15byWxOMMODDGWzn1oAZHkcG2ib5t0DC7QJNIG1xVCsNlz20ZoPVvsOrH8vk2L+TQ
 OswuIvdNSNkkT3V/2DTn5l8rq5nqGTrxxMw5B58Z/lR/xxO65wjOH+I+f+1NtQKKefWEsw432nPQh
 FnOiwTbnLDzOOdWHBI74pTGkROOcijSWdX1erPhjJiP0QYBnksp8mYIDBzm9MutRNdI/otqw0OnCC
 dl0g2HamWbjz6kfViDk+aszM34dyy+M5/A+uEsoaIQfS6cSyVZE7n1MT4lksSDO3wEddrKGWLcJjH
 ijJHN4F5hwjmIQ/P8alnOOx6SkkCA2fY2EZYy029Yh9slGhdjEx2ZXCKn+5UYWBNnlaDxlCq0M8yQ
 IadT5gJ7YAJxurx5A+epr3rRi4awYZ4+TREbNKRko=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLhb-000Aj7-Ma; Sat, 21 May 2022 10:47:19 +0100
Message-ID: <74cdb88e-7098-1d0c-b22c-e44b1cbc78c4@ilande.co.uk>
Date: Sat, 21 May 2022 10:48:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Jason Wang <jasowang@redhat.com>,
 "open list:e500" <qemu-ppc@nongnu.org>
References: <20220520180109.8224-1-shentey@gmail.com>
 <20220520180109.8224-8-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220520180109.8224-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 07/10] hw/net/fsl_etsec/etsec: Remove obsolete and
 unused etsec_create()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/05/2022 19:01, Bernhard Beschow wrote:

> etsec_create() wraps qdev API which is outdated. It is also unused,
> so remove it.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/net/fsl_etsec/etsec.c | 23 -----------------------
>   hw/net/fsl_etsec/etsec.h |  7 -------
>   2 files changed, 30 deletions(-)
> 
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index 4e6cc708de..b75d8e3dce 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -443,26 +443,3 @@ static void etsec_register_types(void)
>   }
>   
>   type_init(etsec_register_types)
> -
> -DeviceState *etsec_create(hwaddr         base,
> -                          MemoryRegion * mr,
> -                          NICInfo      * nd,
> -                          qemu_irq       tx_irq,
> -                          qemu_irq       rx_irq,
> -                          qemu_irq       err_irq)
> -{
> -    DeviceState *dev;
> -
> -    dev = qdev_new("eTSEC");
> -    qdev_set_nic_properties(dev, nd);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, tx_irq);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1, rx_irq);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 2, err_irq);
> -
> -    memory_region_add_subregion(mr, base,
> -                                SYS_BUS_DEVICE(dev)->mmio[0].memory);
> -
> -    return dev;
> -}
> diff --git a/hw/net/fsl_etsec/etsec.h b/hw/net/fsl_etsec/etsec.h
> index fddf551544..3c625c955c 100644
> --- a/hw/net/fsl_etsec/etsec.h
> +++ b/hw/net/fsl_etsec/etsec.h
> @@ -155,13 +155,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(eTSEC, ETSEC_COMMON)
>   #define eTSEC_TRANSMIT 1
>   #define eTSEC_RECEIVE  2
>   
> -DeviceState *etsec_create(hwaddr        base,
> -                          MemoryRegion *mr,
> -                          NICInfo      *nd,
> -                          qemu_irq      tx_irq,
> -                          qemu_irq      rx_irq,
> -                          qemu_irq      err_irq);
> -
>   void etsec_update_irq(eTSEC *etsec);
>   
>   void etsec_walk_tx_ring(eTSEC *etsec, int ring_nbr);

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

