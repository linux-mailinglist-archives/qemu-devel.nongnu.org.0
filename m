Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8004F9F07
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 23:16:17 +0200 (CEST)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncvxk-0001zK-JT
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 17:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ncvuj-000837-81; Fri, 08 Apr 2022 17:13:05 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:45821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ncvuh-0001wr-Lt; Fri, 08 Apr 2022 17:13:04 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-d6ca46da48so10990397fac.12; 
 Fri, 08 Apr 2022 14:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=s4mnwZFBwME2QPKQdq6vY2rRd5CCXFigpIgJY9cJBE0=;
 b=XI62CC/ujqUT/lDPJvbTW/NEY3mp4Co4K3g2dG/7LbRfPAAeRVAVf+12IfxJGffJWd
 e+Qo5jIZ3YpHKrAha8JarLl+4MYtHe5OHvwVzb6eC7Iz8kCnAOlKWpWB8dbAbcrSMC8Q
 kBTSYjuSHywVblGV35daM9XqytaDZkz+Zjpc0FOhB0/2FBpx5tEZj5csRlFSXsx3PDIv
 RutLjrfIW1h/aWB7qZzwRbh+tJjW0S+hrzrofRi3MBAYb0kW7Rt7spTxZN49UXC2HJ2M
 7kbcM+6fBUl8Xx/Qw60OwrvpZM331xglVHOLlDfpSh2KCwkUYtsmia06D+3BedvJi6JW
 6unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s4mnwZFBwME2QPKQdq6vY2rRd5CCXFigpIgJY9cJBE0=;
 b=tcClThTQhXNnX0f1rANhm5ZKQoYk/JZYRiJ32gkCilsw+eha/REBYEwTmHRRwBbDdu
 7DbLztWUZNbeQ07vSghJZsx46PwboY3j6o/knAGHsyxyRfQnvciW6i9sgNBdZUE/eyaD
 4oFhO361M5+r5/WWtZJ0r0Eegrq5pXTQ2a02H6hCs3lg+Wyoh1Q/Jm1QYv534eeLhq9K
 XJmHwZAdhmNPXBVDt1bcu7UcpJNEASmiS7Ytrfu8pMjeW5VxhycT2dl7rcL79LtZclx9
 +HYMuBQRH7QI9iy2rtYowHWqNtdMmnHIviw1NOuU50x1m/O2de9W8R+kJgRBE676dW2+
 y7ig==
X-Gm-Message-State: AOAM5335rfJIXus0fw9tLIMCgzc5LyzkWWi9wYj+nMZik6qk7kca7E/L
 K60x40k9rnabnr4SIeRDAvw=
X-Google-Smtp-Source: ABdhPJz3sNzfB9WAFcokzn7PXxU352uJErpGM3QVTFlO5mJecSRbgfnpjIa28Eco/HyDXnRg1TACPA==
X-Received: by 2002:a05:6871:78b:b0:d4:2636:b26 with SMTP id
 o11-20020a056871078b00b000d426360b26mr9366003oap.14.1649452381679; 
 Fri, 08 Apr 2022 14:13:01 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:7ee3:afd9:f010:3a9:fd23?
 ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a056871078700b000e29ff467dcsm611997oap.50.2022.04.08.14.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 14:13:01 -0700 (PDT)
Message-ID: <bbb026da-c168-c8bd-3126-c696dd2a8ec9@gmail.com>
Date: Fri, 8 Apr 2022 18:12:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] pcie: Don't try triggering a LSI when not defined
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220408131303.147840-1-fbarrat@linux.ibm.com>
 <20220408131303.147840-2-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220408131303.147840-2-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 4/8/22 10:13, Frederic Barrat wrote:
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci/pcie.c     | 5 +++--
>   hw/pci/pcie_aer.c | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 67a5d67372..68a62da0b5 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -353,7 +353,7 @@ static void hotplug_event_notify(PCIDevice *dev)
>           msix_notify(dev, pcie_cap_flags_get_vector(dev));
>       } else if (msi_enabled(dev)) {
>           msi_notify(dev, pcie_cap_flags_get_vector(dev));
> -    } else {
> +    } else if (pci_intx(dev) != -1) {
>           pci_set_irq(dev, dev->exp.hpev_notified);
>       }
>   }
> @@ -361,7 +361,8 @@ static void hotplug_event_notify(PCIDevice *dev)
>   static void hotplug_event_clear(PCIDevice *dev)
>   {
>       hotplug_event_update_event_status(dev);
> -    if (!msix_enabled(dev) && !msi_enabled(dev) && !dev->exp.hpev_notified) {
> +    if (!msix_enabled(dev) && !msi_enabled(dev) && pci_intx(dev) != -1 &&
> +        !dev->exp.hpev_notified) {
>           pci_irq_deassert(dev);
>       }
>   }
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index e1a8a88c8c..92bd0530dd 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -290,7 +290,7 @@ static void pcie_aer_root_notify(PCIDevice *dev)
>           msix_notify(dev, pcie_aer_root_get_vector(dev));
>       } else if (msi_enabled(dev)) {
>           msi_notify(dev, pcie_aer_root_get_vector(dev));
> -    } else {
> +    } else if (pci_intx(dev) != -1) {
>           pci_irq_assert(dev);
>       }
>   }

