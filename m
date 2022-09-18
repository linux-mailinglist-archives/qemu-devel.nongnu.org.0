Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC85BBF86
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:40:54 +0200 (CEST)
Received: from localhost ([::1]:48092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa09t-00037M-1t
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa080-00014P-9d
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:38:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa07y-0006Qu-Q5
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lo94F43cAtmIOLqLQZg44XKAS2gdCEvPOcWepTC3Qv4=; b=zORpBEFh+UVo8J10EsHBC4Y8jn
 dVfw0UMASGWhqP4CGK+r9OeYEiVLf8hltOBpb+E+yhUw/Sqs+oS5K1F2UgVwCSwQyLtyb855Th6jj
 3WmQCzzcTiApKGaJIyQpQ79l7Fq4D91G712eKUgA2e3la7S39c5znvFQkwfkFXbmo8rOQ3u726h2I
 Z8SpcIBeLxWh4BsBqJdkWhf7HCfATGAzuaoagSG3Ad/uAVVrWUiTWBM5uTNnHy2NXxQvmBZJj80TZ
 H95iT0S7TUmCr9zkzRGnMnPlbxDc1idBIN4MJUeP+Srl+sbXAsBFOZgRv16kcj+MapMXKxeQnVeul
 DY4obeoeEY/dTzxBctvuVYnXKmg09rukTtdmaSetCGmOpusRAbAghCajoPbZUpOBos39nsZsIh74Z
 gFEsSHhDR1d/bbxCasUhkVb0oVokXKqvLPyjfsJnocvid1vpeza6dEcNONmmpcyxLena415RGs1FI
 UzRzsT7qRNZ9Iama1WYcAkpLZRclg7PtfDH9jksYtIxlQ5ccmzkl8PSA+G0cOtGddA3yMG2ZfQbor
 AgqhxZ8h0pDbcMMtaGGi9x18pJQaH5zuKjr0LSJY8lsMZ8CIAOJAWREQsk3u7v6hoVjkQTjXCfmdp
 w4oLSzEowBXQtGhXWgAB3ijxaLJ4uyGerAhoLpC9o=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa06H-0007QQ-2P; Sun, 18 Sep 2022 20:37:09 +0100
Message-ID: <43ba9a27-5c9e-01f1-e43e-d3f527a9ab8e@ilande.co.uk>
Date: Sun, 18 Sep 2022 20:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-8-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220901162613.6939-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 07/42] hw/intc/i8259: Introduce i8259 proxy "isa-pic"
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/09/2022 17:25, Bernhard Beschow wrote:

> Having an i8259 proxy allows for ISA PICs to be created and wired up in
> southbridges. This is especially interesting for PIIX3 for two reasons:
> First, the southbridge doesn't need to care about the virtualization
> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
> attached) and out-IRQs (which will trigger the IRQs of the respective
> virtzalization technology) are separated. Second, since the in-IRQs are
> populated with fully initialized qemu_irq's, they can already be wired
> up inside PIIX3.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/intc/i8259.c         | 27 +++++++++++++++++++++++++++
>   include/hw/intc/i8259.h | 14 ++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index cc4e21ffec..531f6cca53 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -458,9 +458,36 @@ static const TypeInfo i8259_info = {
>       .class_size = sizeof(PICClass),
>   };
>   
> +static void isapic_set_irq(void *opaque, int irq, int level)
> +{
> +    ISAPICState *s = opaque;
> +
> +    qemu_set_irq(s->out_irqs[irq], level);
> +}
> +
> +static void isapic_init(Object *obj)
> +{
> +    ISAPICState *s = ISA_PIC(obj);
> +
> +    qdev_init_gpio_in(DEVICE(s), isapic_set_irq, ISA_NUM_IRQS);
> +    qdev_init_gpio_out(DEVICE(s), s->out_irqs, ISA_NUM_IRQS);
> +
> +    for (int i = 0; i < ISA_NUM_IRQS; ++i) {
> +        s->in_irqs[i] = qdev_get_gpio_in(DEVICE(s), i);
> +    }
> +}
> +
> +static const TypeInfo isapic_info = {
> +    .name          = TYPE_ISA_PIC,
> +    .parent        = TYPE_ISA_DEVICE,
> +    .instance_size = sizeof(ISAPICState),
> +    .instance_init = isapic_init,
> +};
> +
>   static void pic_register_types(void)
>   {
>       type_register_static(&i8259_info);
> +    type_register_static(&isapic_info);
>   }
>   
>   type_init(pic_register_types)
> diff --git a/include/hw/intc/i8259.h b/include/hw/intc/i8259.h
> index e2b1e8c59a..0246ab6ac6 100644
> --- a/include/hw/intc/i8259.h
> +++ b/include/hw/intc/i8259.h
> @@ -1,6 +1,20 @@
>   #ifndef HW_I8259_H
>   #define HW_I8259_H
>   
> +#include "qom/object.h"
> +#include "hw/isa/isa.h"
> +#include "qemu/typedefs.h"
> +
> +#define TYPE_ISA_PIC "isa-pic"
> +OBJECT_DECLARE_SIMPLE_TYPE(ISAPICState, ISA_PIC)
> +
> +struct ISAPICState {
> +    ISADevice parent_obj;
> +
> +    qemu_irq in_irqs[ISA_NUM_IRQS];
> +    qemu_irq out_irqs[ISA_NUM_IRQS];
> +};
> +
>   /* i8259.c */
>   
>   extern DeviceState *isa_pic;

So effectively this proxy device is working around the issue that we don't yet have a 
qdev-ified PIC that can be used to wire up ISA bus IRQs via qdev_connect_gpio_out(). 
Whilst ultimately this is the goal, I think having the proxy is a nice intermediate 
step as long as we can ensure that the device is not user-visible (i.e. it won't be 
exposed via the command line) so that this can be improved later.


ATB,

Mark.

