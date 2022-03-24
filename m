Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CB14E63E7
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 14:13:48 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXNHe-0000NS-SB
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 09:13:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXNEY-0006Kl-AD; Thu, 24 Mar 2022 09:10:35 -0400
Received: from [2607:f8b0:4864:20::22d] (port=45611
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXNES-0007Gf-Te; Thu, 24 Mar 2022 09:10:33 -0400
Received: by mail-oi1-x22d.google.com with SMTP id 12so4800813oix.12;
 Thu, 24 Mar 2022 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=WVhaJC7VTFxwxyYah0MLhQ3Z/HzBnZ5yfrjIiUcwpVk=;
 b=LgCJ91PmOGx3+EFoAGHiTuXsugYAyy+racNO+eQBhAge4EZXCs/hjqUkP9Tih2K5Yo
 0zf0S3NPiq2iHrXQL+NvvAp0DGzJCHe4bM+/LawMo9g62Bh0MwP+DGW6Xc1ucdIFdqae
 1hIwcpKeAkDIdLJMShjnSL9Yu9DztxT8O+7pKOi7LVP6WiS/xMcGXYwExEW6GYIymU0E
 /tC5YCmdmpl9JtXlJCXDJMsnRLvfG8kwuVs1Gmfa3ZM+t63+pGe82J1pOQGAKsMoWGKZ
 N/icCtk/MN9PoSipmGfLO4yZZXml/qP4rGv3u4nmvTEufnNO6OOJFipXUiqk9EzdXS5C
 7+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WVhaJC7VTFxwxyYah0MLhQ3Z/HzBnZ5yfrjIiUcwpVk=;
 b=WWMjh5qNaZYhRhTI6q3syz+OgcUl1BMUcKq8CoJKl+wvjk5AU0xh326LPjwesijxun
 7EyH+aTrLtNZMTE+LrzTCLx2B81tn6xZ0fNbXLOUP6+pwDschrYkZELM8gAR/cKJ/vhn
 vxMlWxJUhpt1sdkKf8nZlQii1SDnrUQudHlo+mhbUBG8xyXPLZrSNIQsB35aFBnBtRVx
 mZqbA/V0iV7Y66kMOIw76RzLeOciBd8iOCz0uDHng4Xy3NuM3RyMFsYrBJQ23RlJcVwx
 onG8NPhRlDGfD2stnmqeWnnyZbgdv58cgBMTv2vqDMEtHkM8J86YNEcaGLEm4DVOQtlB
 1Fvw==
X-Gm-Message-State: AOAM533BdYf0bVNmv+Qq/9A2HGMJSL3+iDU4R4ofKSPqKnlQU2E1zRA0
 trddPeJLnekNiYxAu1Nb4Cc=
X-Google-Smtp-Source: ABdhPJy3/nrx8CdLb5K70Ow8in0iTbk5b6d1JsqqPC0woY0V1gXKYQF0qb7Bq/ncEzzn5l4ERoD49g==
X-Received: by 2002:aca:705:0:b0:2d9:6bb6:5b0 with SMTP id
 5-20020aca0705000000b002d96bb605b0mr7397123oih.11.1648127422570; 
 Thu, 24 Mar 2022 06:10:22 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96?
 ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a4ae649000000b00320d35fc91dsm1252239oot.24.2022.03.24.06.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 06:10:22 -0700 (PDT)
Message-ID: <c1c83c72-40e0-6b67-6a32-6508e45266ce@gmail.com>
Date: Thu, 24 Mar 2022 10:10:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] ppc/pnv: Remove LSI on the PCIE host bridge
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220321153357.165775-1-fbarrat@linux.ibm.com>
 <20220321153357.165775-3-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220321153357.165775-3-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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
> The phb3/phb4/phb5 root ports inherit from the default PCIE root port
> implementation, which requests a LSI interrupt (#INTA). On real
> hardware (POWER8/POWER9/POWER10), there is no such LSI. This patch
> corrects it so that it matches the hardware.
> 
> As a consequence, the device tree previously generated was bogus, as
> the root bridge LSI was not properly mapped. On some
> implementation (powernv9), it was leading to inconsistent interrupt
> controller (xive) data. With this patch, it is now clean.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



>   hw/pci-host/pnv_phb3.c | 1 +
>   hw/pci-host/pnv_phb4.c | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index ac801ac835..0d18c96117 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1162,6 +1162,7 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>           error_propagate(errp, local_err);
>           return;
>       }
> +    pci_config_set_interrupt_pin(pci->config, 0);
>   }
>   
>   static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index b301762093..b66b75d4d7 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1772,6 +1772,7 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
>       pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
>       pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
>       pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
> +    pci_config_set_interrupt_pin(conf, 0);
>   }
>   
>   static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)

