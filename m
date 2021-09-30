Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FE141E38D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 23:56:26 +0200 (CEST)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW42T-0004Io-8m
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 17:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mW40U-0003M4-Kw; Thu, 30 Sep 2021 17:54:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mW40S-0005Ff-BH; Thu, 30 Sep 2021 17:54:22 -0400
Received: by mail-wr1-x436.google.com with SMTP id u18so12355136wrg.5;
 Thu, 30 Sep 2021 14:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6eAD+p36Z5Qycy9bvVaFcVsiLtWL2Umeb+LQeTDqnFU=;
 b=UesUw91d8ewxJ1PQK2C0uOWxYXNsfJqJORwS5xsCK1M05iWyy3kH51DKVW1NkITi0t
 QbVwPV4SNyJmw4BvwKujTT6pTX2GqHXt3sa86zkrRyeLWf/LxXSJDI+Iy2Qhk+xpm436
 UWrlRMg3XzstdDzNA3EBGvX+Pr9uuekhGfQsAOfc45iq5GTMEUgIj6YtrOpEcJy+qvL7
 MoG8Ld0r+3ECwAFr0f3FCF+EthV6R8OOou6bYaktrT4OxvizL0EA2QzUzK3Zz0UyO5jP
 t/W8YCLP/vsEzysJW8yJGrgMeDedTkldEzMIULdylOTQBdVd45U6ULGj6+1P+xWVXKZ7
 nxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6eAD+p36Z5Qycy9bvVaFcVsiLtWL2Umeb+LQeTDqnFU=;
 b=SKk5AVPLX4QcAjBmC01+SFDsLmaFF9kufH6JGRFKiuxlocRbzzkPTtP/EWD24mmDdA
 mFhZcH7emFwq2X3B9J2FN79H7laz22qaBfmVXph7wBe6+25R0F/WSY7kaipgWrN3l84h
 mjdWLNZD2at4NA6Q7vmS+7sR7ybUsECBcZKqZM0IKezxnXF2Ps6KYJNteY8MxA+LWuQ+
 woWueoQnAXLRe+AHO2TXQHr/B5x0KyI8N2/h+NxSQcQLVw6smxrQW8cJFJCgddyczHQg
 C9MhK+RSlUCpEfrT+1r/bOPD3Y4UgtZmTAhF57pZE4t43fZhwhvy0Ig+XPsvHoGbAYvU
 aiHQ==
X-Gm-Message-State: AOAM531xiyW+5PnUCa8VgELSZuIcf2FNyzcRA53JwxfoKfDCfT3o1BGW
 /x46D2ItMRdpB5imLRGO5UI=
X-Google-Smtp-Source: ABdhPJw9vKoqdW1/kqiItWnwA/eRqXehwbqcX3iFwVwvN6HwxJZP8S5U/OyY4B0UzJbaBg/JOKC56A==
X-Received: by 2002:adf:a499:: with SMTP id g25mr8136060wrb.239.1633038858362; 
 Thu, 30 Sep 2021 14:54:18 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o1sm4091738wru.91.2021.09.30.14.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 14:54:15 -0700 (PDT)
Message-ID: <907d7432-a81b-b36b-9af5-a5554df3bddf@amsat.org>
Date: Thu, 30 Sep 2021 23:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/3] hw/intc/arm_gicv3: Move checking of
 redist-region-count to arm_gicv3_common_realize
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210930150842.3810-1-peter.maydell@linaro.org>
 <20210930150842.3810-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210930150842.3810-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 9/30/21 17:08, Peter Maydell wrote:
> The GICv3 devices have an array property redist-region-count.
> Currently we check this for errors (bad values) in
> gicv3_init_irqs_and_mmio(), just before we use it.  Move this error
> checking to the arm_gicv3_common_realize() function, where we
> sanity-check all of the other base-class properties. (This will
> always be before gicv3_init_irqs_and_mmio() is called, because
> that function is called in the subclass realize methods, after
> they have called the parent-class realize.)
> 
> The motivation for this refactor is:
>  * we would like to use the redist_region_count[] values in
>    arm_gicv3_common_realize() in a subsequent patch, so we need
>    to have already done the sanity-checking first
>  * this removes the only use of the Error** argument to
>    gicv3_init_irqs_and_mmio(), so we can remove some error-handling
>    boilerplate
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/intc/arm_gicv3_common.h |  2 +-
>  hw/intc/arm_gicv3.c                |  6 +-----
>  hw/intc/arm_gicv3_common.c         | 26 +++++++++++++-------------
>  hw/intc/arm_gicv3_kvm.c            |  6 +-----
>  4 files changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index aa4f0d67703..cb2b0d0ad45 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -306,6 +306,6 @@ struct ARMGICv3CommonClass {
>  };
>  
>  void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
> -                              const MemoryRegionOps *ops, Error **errp);
> +                              const MemoryRegionOps *ops);
>  
>  #endif
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 3f24707838c..bcf54a5f0a5 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -393,11 +393,7 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> +    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
>  
>      gicv3_init_cpuif(s);
>  }
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 223db16feca..8e47809398b 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -250,22 +250,11 @@ static const VMStateDescription vmstate_gicv3 = {
>  };
>  
>  void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
> -                              const MemoryRegionOps *ops, Error **errp)
> +                              const MemoryRegionOps *ops)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(s);
> -    int rdist_capacity = 0;
>      int i;
>  
> -    for (i = 0; i < s->nb_redist_regions; i++) {
> -        rdist_capacity += s->redist_region_count[i];
> -    }
> -    if (rdist_capacity < s->num_cpu) {
> -        error_setg(errp, "Capacity of the redist regions(%d) "
> -                   "is less than number of vcpus(%d)",
> -                   rdist_capacity, s->num_cpu);
> -        return;
> -    }
> -
>      /* For the GIC, also expose incoming GPIO lines for PPIs for each CPU.
>       * GPIO array layout is thus:
>       *  [0..N-1] spi
> @@ -308,7 +297,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>  static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>  {
>      GICv3State *s = ARM_GICV3_COMMON(dev);
> -    int i;
> +    int i, rdist_capacity;
>  
>      /* revision property is actually reserved and currently used only in order
>       * to keep the interface compatible with GICv2 code, avoiding extra
> @@ -350,6 +339,17 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    rdist_capacity = 0;
> +    for (i = 0; i < s->nb_redist_regions; i++) {
> +        rdist_capacity += s->redist_region_count[i];
> +    }
> +    if (rdist_capacity < s->num_cpu) {
> +        error_setg(errp, "Capacity of the redist regions(%d) "
> +                   "is less than number of vcpus(%d)",
> +                   rdist_capacity, s->num_cpu);
> +        return;
> +    }
> +
>      s->cpu = g_new0(GICv3CPUState, s->num_cpu);
>  
>      for (i = 0; i < s->num_cpu; i++) {
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 5c09f00dec2..ab58c73306d 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -787,11 +787,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> +    gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
>  
>      for (i = 0; i < s->num_cpu; i++) {
>          ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
> 

The pattern make me think gicv3_init_irqs_and_mmio() should be
refactored as a ARMGICv3CommonClass::init_irqs_and_mmio handler,
called in arm_gicv3_common_realize().

Or maybe even have ARMGICv3CommonClass::irq_handler and
ARMGICv3CommonClass::ops set in each child class_init().

