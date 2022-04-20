Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041B8508E46
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 19:16:25 +0200 (CEST)
Received: from localhost ([::1]:49364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDwF-0007XC-Kj
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 13:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhDqC-00012Q-JR; Wed, 20 Apr 2022 13:10:08 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhDqA-0008Jr-EH; Wed, 20 Apr 2022 13:10:08 -0400
Received: by mail-oi1-x22c.google.com with SMTP id r85so2766752oie.7;
 Wed, 20 Apr 2022 10:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=1DgJdgfb4GhIct1Mnaxg5JbLe5SZnqAOzZw3oPI2zlk=;
 b=q43Pt7W/+MGTw2MI3MSuViwttSddp1+H4AWri6/UWwEWhbT97yfeg6Ejj1VstZKYVH
 /ZLs3RsDEnLzqrV55xcV9wfuMrjAMKmmqv1NbebMCfqMvF3pC2reBpH3lDgQ1ixxMCWP
 f1MuEXloBl5/MYXzhOlVAJsThZ/KpWBk4F7/RPM/JrXh0ZCQmzOx95sTT71COIiCIthi
 XF/e0Gyji9pQLXLDCk1iS07hnuZoUr/aJZTtWuKiRj1WZkS1m0O7+xF6UN0qSemuJqFU
 7frwVI7DvdWapoHU3Wg7Hc2QV0/YJ0r4/lpqvmHI8U+o/AjxzvkPJ61uVnlfR1KGxO0l
 xGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1DgJdgfb4GhIct1Mnaxg5JbLe5SZnqAOzZw3oPI2zlk=;
 b=QtbpMf7DYTv50o9q921itTJw8qfGlC0HKrF0PogjeNguOtpnylqKFV4hlyLKZUmq4j
 p9iAqvm7njOJtJAuaC8CJ263pLZ0btasdDQwhX5JtnGO4Em4b02s6muysOCSJut/xjNa
 GXjjXKFjDM9wFtFsmnWB0uRhKHQmiJGSjRXPTn17/IFK3m0kaoqZ31ykGjyxdf8H36a+
 JJ6xrEARzC8S7uDmq6+w5g32mUw5lf8E9cmkYbjCHYlPnWMIU3kswyggCMkGsn6PHb7g
 CMg9k8OqEv1l1yn/Z8TkyqGZAQ7Ox0A2/Mniu6zZIj1Aw9R5dzthUvXPQk5YDcOFPJV8
 F/hQ==
X-Gm-Message-State: AOAM533ryEJUIC6rJg3tOoIuKrvf8Ia8pfW4E4AovaPH78EKMXYiZof6
 TQvcEScNs2HpLWnJ/KpkZ9w=
X-Google-Smtp-Source: ABdhPJx7BlCHRM4tZ1bKECvjP8Ls61gkP6Hep7XTyH4sq+4Ts3Kwpi4PbqNDj6MlADN3rsSL535AiA==
X-Received: by 2002:a05:6808:23d1:b0:322:97f8:69d7 with SMTP id
 bq17-20020a05680823d100b0032297f869d7mr2271365oib.241.1650474604302; 
 Wed, 20 Apr 2022 10:10:04 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 g39-20020a9d12aa000000b00605534ffa55sm2334123otg.25.2022.04.20.10.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 10:10:03 -0700 (PDT)
Message-ID: <59a4f9e7-f2b6-8235-e583-e230bec6fc44@gmail.com>
Date: Wed, 20 Apr 2022 14:09:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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

Michael,

Let me know if you want me to grab this patch from the ppc tree. I'm
going to send a PR in the next few days.


Thanks,


Daniel

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

