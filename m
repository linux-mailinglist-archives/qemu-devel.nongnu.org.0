Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E9609F18
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:32:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oms16-00083d-7r; Mon, 24 Oct 2022 03:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oms04-0007xU-Pv
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 03:36:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oms02-0004iy-Iq
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 03:35:56 -0400
Received: by mail-wr1-x436.google.com with SMTP id j15so4192361wrq.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yXQ5/aGIfQfwPwP2FROYcsWf+YYKV8Xxopi5oL5uekc=;
 b=R8wikOxT57NQvoiy7XvNwRhKHak0cJo2BfpgyanPpo/yKdADRA6NCCn26cJ7Lh2e0U
 G2TeAmy/SniHYRPaiz+q0F66s0eLCHruwRWYn5K8rTAJXsYJ04CP0xctkCZyqonGUVy3
 Yysgn42BUpdYu52+cBF8sc+J4ovpPYIrzuxJdsWJ6znmwBAO6r3YMxLwMkfdcM4CCdF2
 koUhq7F99dHmq9WZ/bG+rmr2yJ8/1dcfxzK7ZVJckvLcvx9DYfHDNRnRu3lvlQwKTcAV
 U5M8dYR8MLMPoWWJil4OEf0EfoUA8Av5tCJJplCcB0rB3HrlYZX2OLQDCIGxnC3oBScd
 e1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yXQ5/aGIfQfwPwP2FROYcsWf+YYKV8Xxopi5oL5uekc=;
 b=llbel/SFvmTOHRibsHkgUGtTJgblZlH0A5hhyY5tff1NRYPn1PtgGtQ5+BZJeoEUhW
 xO2YF1KkBNuofysN0BhemVPexCbNF4EwPf6w2PIih/HflWqhEJWyFJ9t7UYhPV39mlHm
 41Q/Nfy+Sd9sKC+5tAsyHNFqXNX7fkKiV2NGic1zcfi31LSUYqmLhi8bh8L4vnPW0rZK
 AJJb6PgQarlu4+9Nk529OEHniX/7ne14SsmrcpdX7iMyV1xoakPH3a7redEDSvL8t8wl
 O6aVYPC4MONNm1vix6wBukPNP/54pJLMl/UrxzGguKW8A5cXD/b9pISajMJ276NTgtRy
 s2DQ==
X-Gm-Message-State: ACrzQf03+Nn7NkWCKyET6szku8ZCo4xX0gZNz0vcCyY3t7uIMYV1hZMJ
 b4gVaKWzyjuFg0QHuhTR7v0LKg==
X-Google-Smtp-Source: AMsMyM6m0wUo02BFvr75CRNVfvCGZpZvheTOrR4if6WD3BvRYtWzteLzg/RZzfrlx0OGfkGVsKg8hA==
X-Received: by 2002:adf:d1cc:0:b0:22e:6371:65ad with SMTP id
 b12-20020adfd1cc000000b0022e637165admr20513031wrd.326.1666596952802; 
 Mon, 24 Oct 2022 00:35:52 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a5d4991000000b002367121db1asm1883237wrq.98.2022.10.24.00.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 00:35:52 -0700 (PDT)
Message-ID: <bdd0c528-82fe-db76-00d0-4caa6f1fb2ef@linaro.org>
Date: Mon, 24 Oct 2022 09:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 14/43] hw/intc/i8259: Introduce i8259 proxy "isa-pic"
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-15-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-15-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Bernhard,

On 22/10/22 17:04, Bernhard Beschow wrote:
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

There is nothing I8259 / ISA specific in your model.

What about adding a generic qdev proxy-irq (having a configurable
number of IRQs to proxy)? See for example hw/core/split-irq.c.

Regards,

Phil.

