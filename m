Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0ED661294
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 00:29:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEIbt-0008CD-2I; Sat, 07 Jan 2023 18:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIbr-0008C1-Al; Sat, 07 Jan 2023 18:28:19 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIbp-0001mg-As; Sat, 07 Jan 2023 18:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a+LiDi3xBw4uXRghhNoj8Rl7uEKO3CPBkN7H5ROU0AA=; b=dYwuHYGkCKGFxVzbsSHn6rztNd
 j8Wxe+QjHbzIYJ90i8n/nlnlV3RmfJM5Md9bqkVj2tdLs5qGEcZMCmW2jaSX10Qpx/fDn40qRh9x7
 ooFeZ7TR8/MMhH+0S817YLhtGSe4MBxIkhwm3JNYg7eoGJn2kmSx4Q2P7weQLhEhssfIy+JbZA9JM
 vQXYbYia0lIePwBJBIg6GdEo3pRgayflMHjocsV5CSzyUxiBWqYrCckmsCwd+nnWYXjqE3mpZyNHO
 XHQuZVx0hC8iffTiPUbRRPEF44j5gvQ5LAVx/ZQkbVdgo8rVdwjaYtnLxt0sXgUHAdY2zncb3omk2
 Wn2yBICu4HG86tpbC7Eqhe1PZnBPsFCpaC232D1x4FdU0+Kq9yzBsCxQ5iaY/eGM7BUdbLVzt94c5
 zFy3zK6WylqzqY6rqNFL5RG6KyL+32YDEuTL69Gs84fTcW8pbGZrumiP4pDK6jSXDGRY2/mjJBMnM
 XCIWknq72XQdf7x6NNb7myQtT59FxYi4lz8RM+YwoRyuLcWEguNAFLcpVkbd7hrt+meTRHmNA9mQF
 vnn1QdmLMoax1dmrEB2Irid+ba/9GQW9MLozxAnX0mNmn/rTTHtzEK7unlJY6JXPOFKQNLYand7Ia
 BGhTiJdq/EPRtu/6sNAgsYKojeUqi1cJVGfNNrgXg=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIbM-000BEP-HD; Sat, 07 Jan 2023 23:27:52 +0000
Message-ID: <610e26ae-12bb-ba5a-5418-cc4ddf22116c@ilande.co.uk>
Date: Sat, 7 Jan 2023 23:28:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>, Richard Henderson
 <richard.henderson@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20230105143228.244965-1-shentey@gmail.com>
 <20230105143228.244965-13-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230105143228.244965-13-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 12/31] hw/intc/i8259: Make using the isa_pic singleton
 more type-safe
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.114,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 05/01/2023 14:32, Bernhard Beschow wrote:

> This even spares some casts in hot code paths along the way.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> 
> ---
> Note: The next patch will introduce a class "isa-pic", which is
> shall not be confused with the isa_pic singleton.
> ---
>   include/hw/intc/i8259.h |  6 +++---
>   include/qemu/typedefs.h |  1 +
>   hw/intc/i8259.c         | 11 ++++-------
>   3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/intc/i8259.h b/include/hw/intc/i8259.h
> index e2b1e8c59a..a0e34dd990 100644
> --- a/include/hw/intc/i8259.h
> +++ b/include/hw/intc/i8259.h
> @@ -3,10 +3,10 @@
>   
>   /* i8259.c */
>   
> -extern DeviceState *isa_pic;
> +extern PICCommonState *isa_pic;
>   qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq);
>   qemu_irq *kvm_i8259_init(ISABus *bus);
> -int pic_get_output(DeviceState *d);
> -int pic_read_irq(DeviceState *d);
> +int pic_get_output(PICCommonState *s);
> +int pic_read_irq(PICCommonState *s);
>   
>   #endif
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 688408e048..3d5944d2a4 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -98,6 +98,7 @@ typedef struct PCIExpressDevice PCIExpressDevice;
>   typedef struct PCIExpressHost PCIExpressHost;
>   typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
>   typedef struct PCIHostState PCIHostState;
> +typedef struct PICCommonState PICCommonState;
>   typedef struct PostcopyDiscardState PostcopyDiscardState;
>   typedef struct Property Property;
>   typedef struct PropertyInfo PropertyInfo;
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index cc4e21ffec..0261f087b2 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -55,7 +55,7 @@ struct PICClass {
>   #ifdef DEBUG_IRQ_LATENCY
>   static int64_t irq_time[16];
>   #endif
> -DeviceState *isa_pic;
> +PICCommonState *isa_pic;
>   static PICCommonState *slave_pic;
>   
>   /* return the highest priority found in mask (highest = smallest
> @@ -173,9 +173,8 @@ static void pic_intack(PICCommonState *s, int irq)
>       pic_update_irq(s);
>   }
>   
> -int pic_read_irq(DeviceState *d)
> +int pic_read_irq(PICCommonState *s)
>   {
> -    PICCommonState *s = PIC_COMMON(d);
>       int irq, intno;
>   
>       irq = pic_get_irq(s);
> @@ -354,10 +353,8 @@ static uint64_t pic_ioport_read(void *opaque, hwaddr addr,
>       return ret;
>   }
>   
> -int pic_get_output(DeviceState *d)
> +int pic_get_output(PICCommonState *s)
>   {
> -    PICCommonState *s = PIC_COMMON(d);
> -
>       return (pic_get_irq(s) >= 0);
>   }
>   
> @@ -426,7 +423,7 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
>           irq_set[i] = qdev_get_gpio_in(dev, i);
>       }
>   
> -    isa_pic = dev;
> +    isa_pic = PIC_COMMON(dev);
>   
>       isadev = i8259_init_chip(TYPE_I8259, bus, false);
>       dev = DEVICE(isadev);

I actually had a similar thought when I was looking at the i8259 code and it seems 
sensible to me, so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

