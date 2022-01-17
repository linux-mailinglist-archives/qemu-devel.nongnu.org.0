Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF5E4910CB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:53:22 +0100 (CET)
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Y49-0005K3-NF
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:53:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9XtC-0005mQ-CY; Mon, 17 Jan 2022 14:42:02 -0500
Received: from [2607:f8b0:4864:20::235] (port=34385
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9XtA-00066f-MV; Mon, 17 Jan 2022 14:42:02 -0500
Received: by mail-oi1-x235.google.com with SMTP id r131so25086739oig.1;
 Mon, 17 Jan 2022 11:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=MZMSgLY9JulaAL7BWxmUWlLPhXFPmc4fYx0X1kjTIzA=;
 b=Y7zXtzjZkd0Mst2UH4DJO4DfOPE09YdhagtfoHxeGI++Ckoc4HvWUBSoH6Wai9Gukh
 B+eB3rxFe8ekETyyNCv4JwWq1bPPs+LZ3b2o+xqvVTBt4JgCwsL5D/P89mJZvzHVqURa
 tO2zShCvMu4cSg1PR/YKl6wj+eravZMEDpNQN6sEwYpmGDhfWQDwSXwZFLiEDpUAR0+r
 R1ggolW1sbT/51Re/BjFd6Z4iM+ccOVEXrIeARWhJeMNwHno/qIxU1/LZc7Pv9b8Ch0E
 NHZdIQQmdb4KnnHI3EJS/jX+P4o6WOkb8nPQVk9MgNPuU4sceVLsCGm3GKG3PZcuxMEQ
 qgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MZMSgLY9JulaAL7BWxmUWlLPhXFPmc4fYx0X1kjTIzA=;
 b=wfIil5fhaTnDQMtyib/x9I9eILEE9jMCyVJFBeoDzILnIdK7vWQ3PArSi2zLdU8zHQ
 BSVBB3fz7iZ7O1WINByvnOP1kM7dEhzbLcBnX3H5e29kbczmt+fAb8Hcxgq3QxtzCqfO
 Du6QVM8/e4v8k4g4zcrr1KxLrUScZ0ACz5ebciAUm7dUK2XtSoyzJEnjOaVNAGf+GyVp
 JmI7yy72sVIOb+fzbja5XKKnvb6OC5KxzNRZCPrCmAs33nZj6GYPBRUQixhsCPJwyZZZ
 6Mu439+aCHrXbpD5uL6KKQETnd9So7vCXYBgh44xWsFbecxd0IdQC1OfhYN+7HH2Kjlf
 NBmA==
X-Gm-Message-State: AOAM533/cWfIrYWq7O5/xarblFpo+e9EGzXbbNYShEyvdQ50SaKoQGis
 fdxw/am/7B0Vc23/6ejQZIOlesc4QytWnX7k
X-Google-Smtp-Source: ABdhPJyNx583jA/wUUJWG/upJTCxMWebc+gN2h3XmjuWFoNfj9cK+3Bl9tr0oiipsA7sy5bwN4J+eA==
X-Received: by 2002:a54:4498:: with SMTP id v24mr19131931oiv.126.1642448518992; 
 Mon, 17 Jan 2022 11:41:58 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id f18sm5220016oiw.30.2022.01.17.11.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 11:41:58 -0800 (PST)
Message-ID: <bbacd7a5-1bbe-7251-a423-73cd54191d4e@gmail.com>
Date: Mon, 17 Jan 2022 16:41:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] ppc/pnv: Move root port allocation under
 pnv_pec_default_phb_realize()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220117122753.1655504-1-clg@kaod.org>
 <20220117122753.1655504-2-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220117122753.1655504-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 1/17/22 09:27, Cédric Le Goater wrote:
> The root port device is currently created and attached to the PHB
> early in pnv_phb4_realize(). Do it under pnv_pec_default_phb_realize()
> after the PHB is fully realized. It's cleaner and avoids an extra
> test on defaults_enabled().
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb4.c     | 7 -------
>   hw/pci-host/pnv_phb4_pec.c | 3 +++
>   2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 1db815b1aba0..c688976caec9 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -22,7 +22,6 @@
>   #include "hw/irq.h"
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
> -#include "sysemu/sysemu.h"
>   #include "trace.h"
>   
>   #define phb_error(phb, fmt, ...)                                        \
> @@ -1639,12 +1638,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   
> -    /* Add a single Root port if running with defaults */
> -    if (defaults_enabled()) {
> -        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
> -                                 TYPE_PNV_PHB4_ROOT_PORT);
> -    }
> -
>       /* Setup XIVE Source */
>       if (phb->big_phb) {
>           nr_irqs = PNV_PHB4_MAX_INTs;
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 12aa4596282b..b19e89236a63 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -132,6 +132,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>           return;
>       }
> +
> +    /* Add a single Root port if running with defaults */
> +    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB4_ROOT_PORT);
>   }
>   
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)

