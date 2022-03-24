Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD04E63E1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 14:09:53 +0100 (CET)
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXNDs-0005RX-GW
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 09:09:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXNBy-0004aK-Lk; Thu, 24 Mar 2022 09:07:54 -0400
Received: from [2607:f8b0:4864:20::c2b] (port=40488
 helo=mail-oo1-xc2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXNBx-0006qs-2A; Thu, 24 Mar 2022 09:07:54 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 o22-20020a4ad156000000b00324910b18d2so759395oor.7; 
 Thu, 24 Mar 2022 06:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=gt47LFNxL9HDvxlCbA5dgmhlAMmu2HPlpYdZbBe8RYc=;
 b=Jp8bLFjONZq+nkQwmx02b2Qn1iA0xmnqbcoi3bJaH4A6pWHX0WhA1byKJiQ++tpi8L
 K2VwiRmcHlcOvlGXVspf5d30z7nGm8JwzzKq+aY7L7SpEhzq2lXal+1+VmJKq5NApQGm
 pdjT7cH+aTTgKdPenk/NJ6boIzTfxEn2gpPdvuJE17Zj6ssur9mu+LL+4/+3IQnSY/ZL
 9CF40Shc3XhOwqFhR+7U34q2WySjSTX5kr5Vw5LbSq4Y7coCCpjGUjdJfd9N7FyL6Oxg
 dEgmYiSdDdaPNqOKD4OvsymaxuIUFNtE1K5jBQVuI7tPfsUfn54cCq97dqa0+Xp/r6LL
 Apfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gt47LFNxL9HDvxlCbA5dgmhlAMmu2HPlpYdZbBe8RYc=;
 b=ZV6tOck9cokktZpvpSduPdP3a5eLe0E/VMTvrGEIVioheA6fiA4eL0jbaExM0Fk0G9
 i6t+5oRmbgLOQ0JB+JaVl9JPfK+LQJWR056fsR0atEmy1mPLR1WBFb03Y7/6fsN4VCuv
 1ZUdahdSw4cDT8zOUHNB3KRIT0w6RdPPwiDR3ihCUr5mq7inCyNpntl+C+/Fts2Xr+M0
 /+ybH8x7DibkFEPc2ZTVnW2evVrA+5R+RNOKoFbb0QmVq5+BEi2x86TYErJ/7//QCGIv
 E8/zxY9VbClGZnbF7HvRwcRA0m7crbqnGDOA0FTVWMaHAy1LLYAnp8pjEgdl44ZvuF96
 PcXg==
X-Gm-Message-State: AOAM531yis4rjkUu4HL1J2FKf+oMROWo6nDtxlDcvp5DhNc4NL4FAEuZ
 Z+07VaHIrYibWQkpeydS0zE=
X-Google-Smtp-Source: ABdhPJx9B9bRdIMOqMfikAW28yJjzeKHqVa3IWFozy+ex3cGqTcqQl5nJe1ObQbyyl5UTVK2FSTL1g==
X-Received: by 2002:a4a:e9a9:0:b0:321:61bc:ae9e with SMTP id
 t9-20020a4ae9a9000000b0032161bcae9emr1864493ood.11.1648127271560; 
 Thu, 24 Mar 2022 06:07:51 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96?
 ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 g105-20020a9d12f2000000b005c961f9e119sm1308042otg.35.2022.03.24.06.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 06:07:51 -0700 (PDT)
Message-ID: <d0eaf24b-9eff-cfd4-4827-c738e238b5e6@gmail.com>
Date: Thu, 24 Mar 2022 10:07:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] pcie: Don't try triggering a LSI when not defined
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220321153357.165775-1-fbarrat@linux.ibm.com>
 <20220321153357.165775-2-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220321153357.165775-2-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 3/21/22 12:33, Frederic Barrat wrote:
> This patch skips [de]asserting a LSI interrupt if the device doesn't
> have any LSI defined. Doing so would trigger an assert in
> pci_irq_handler().
> 
> The PCIE root port implementation in qemu requests a LSI (INTA), but a
> subclass may want to change that behavior since it's a valid
> configuration. For example on the POWER8/POWER9/POWER10 systems, the
> root bridge doesn't request any LSI.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

I assume that it's easier to handle just the codepaths that powernv PHBs uses
rather than handling all instances where pci_irq_handler() would be asserting
without LSIs.


Patch LGTM. Small nits below:

>   hw/pci/pcie.c     | 8 ++++++--
>   hw/pci/pcie_aer.c | 4 +++-
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 67a5d67372..71c5194b80 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -354,7 +354,9 @@ static void hotplug_event_notify(PCIDevice *dev)
>       } else if (msi_enabled(dev)) {
>           msi_notify(dev, pcie_cap_flags_get_vector(dev));
>       } else {
> -        pci_set_irq(dev, dev->exp.hpev_notified);
> +        if (pci_intx(dev) != -1) {
> +            pci_set_irq(dev, dev->exp.hpev_notified);
> +        }


Since you're not doing anything unless the condition is met, you can use 'else if'
like it's done in the other conditionals:


     if (msix_enabled(dev)) {
         msix_notify(dev, pcie_cap_flags_get_vector(dev));
     } else if (msi_enabled(dev)) {
         msi_notify(dev, pcie_cap_flags_get_vector(dev));
     } else if (pci_intx(dev) != -1) {
         pci_set_irq(dev, dev->exp.hpev_notified);
     }



>       }
>   }
>   
> @@ -362,7 +364,9 @@ static void hotplug_event_clear(PCIDevice *dev)
>   {
>       hotplug_event_update_event_status(dev);
>       if (!msix_enabled(dev) && !msi_enabled(dev) && !dev->exp.hpev_notified) {
> -        pci_irq_deassert(dev);
> +        if (pci_intx(dev) != -1) {
> +            pci_irq_deassert(dev);
> +        }
>       }

Similar comment here:

     if (!msix_enabled(dev) && !msi_enabled(dev) && !dev->exp.hpev_notified &&
         pci_intx(dev) != -1) {
         pci_irq_deassert(dev);
     }



>   }
>   
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index e1a8a88c8c..d936bfca20 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -291,7 +291,9 @@ static void pcie_aer_root_notify(PCIDevice *dev)
>       } else if (msi_enabled(dev)) {
>           msi_notify(dev, pcie_aer_root_get_vector(dev));
>       } else {
> -        pci_irq_assert(dev);
> +        if (pci_intx(dev) != -1) {
> +            pci_irq_assert(dev);
> +        }


And here:

     if (msix_enabled(dev)) {
         msix_notify(dev, pcie_aer_root_get_vector(dev));
     } else if (msi_enabled(dev)) {
         msi_notify(dev, pcie_aer_root_get_vector(dev));
     } else if (pci_intx(dev) != -1) {
         pci_irq_assert(dev);
     }



Thanks,


Daniel

>       }
>   }
>   

