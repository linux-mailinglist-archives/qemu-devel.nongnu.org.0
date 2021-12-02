Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7DA46693D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:36:15 +0100 (CET)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msq0E-000865-T8
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:36:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mspxw-0005zM-UC; Thu, 02 Dec 2021 12:33:52 -0500
Received: from [2607:f8b0:4864:20::735] (port=36487
 helo=mail-qk1-x735.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mspxv-0004oM-47; Thu, 02 Dec 2021 12:33:52 -0500
Received: by mail-qk1-x735.google.com with SMTP id i9so699705qki.3;
 Thu, 02 Dec 2021 09:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+OqyCTggBvZ+aBt9wumBf+nFdES3oEgd3YB8MemvrKY=;
 b=gxIBwGbA9zOJMoEE7pVjOySShZXQ0wYu9LwppaoVFuPm/IorDb85ArZUgKmzI8suUc
 bkDxAS4DqKHaEfOIcy6y8Xb5jblk93QpjsblG4qk8hV7ehJU+c29x0qpb1xuQlA+UgbE
 EC6MqcQHPFwyQWV8TDlDd7paBRqkyoddB//dltwpLroycw35Fn5+ZN1k19J9xvKCqZSf
 nIc9BNZY3k7THN1HGlPXv++D7tX6MtGutBBXDNLaqFbZ4vhJp3cjf7TcujUcE6aGj+DH
 oSWs8EnulxjuU8hKb4EugNmiWa9GxVdmE5veAq0GXF1b2fTh9o8YsnmFmwAFJKZiPh1i
 jbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+OqyCTggBvZ+aBt9wumBf+nFdES3oEgd3YB8MemvrKY=;
 b=nnBQkwb6Gowhxxslaf4q+XC/FkW2Sv1otew0dwTt4w0Fr7w6ZEsqkh7BvL4Z2v5gxj
 GQZ84Qpusekz2ox6LpxypfKM400CiKp414horwU6OCG53eTqoGJesSxzGl0/W9KFAQMe
 /MirvMa92Ef37UNNx2TDkg44HqlSyxGPIXSnBLtc9wg13mPj/ZlwRySesf4buzAh5+Lv
 TS9SIqFctMuYjgf+JlsVXPRphmdpQ5gtE0jWMWzbKB16ENkAJBESPLFUD6ipgmfFO0QT
 zeopbHO0Un1KdbQ5+BjrWXAioOZZPthrWG17djgEnPoxsMV7WsgPbxiJluzh9mo6Yj3J
 Orug==
X-Gm-Message-State: AOAM532jBoOzDY9xGNvhEPdScA9MJNNgaue5iI/U4ngDngP3yc0OYs6j
 37mYDETN19RXzRay0FKixnI=
X-Google-Smtp-Source: ABdhPJxahx7ELDYi9j8LGlZst1keCzoLY8BF1ZOhd8Ex2k5PY8WtBGpNNbLyiEuWHYeSZzPSzTYnXg==
X-Received: by 2002:a05:620a:1587:: with SMTP id
 d7mr13583079qkk.126.1638466429996; 
 Thu, 02 Dec 2021 09:33:49 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id w14sm311520qkp.54.2021.12.02.09.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:33:49 -0800 (PST)
Message-ID: <d630a7d7-bf99-8434-c197-f3301ae4bcd9@gmail.com>
Date: Thu, 2 Dec 2021 14:33:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 06/14] ppc/pnv: Complete user created PHB3 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-7-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-7-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::735
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 11:42, Cédric Le Goater wrote:
> PHB3s ared SysBus devices and should be allowed to be dynamically
> created.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb3.c | 9 +++++++++
>   hw/ppc/pnv.c           | 2 ++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index e91f658b0060..b61f9c369f64 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1000,6 +1000,9 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>   
>       /* User created devices */
>       if (!phb->chip) {
> +        Error *local_err = NULL;
> +        BusState *s;
> +
>           phb->chip = pnv_get_chip(pnv, phb->chip_id);
>           if (!phb->chip) {
>               error_setg(errp, "invalid chip id: %d", phb->chip_id);
> @@ -1011,6 +1014,12 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>            * correctly the device tree.
>            */
>           pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
> +
> +        s = qdev_get_parent_bus(DEVICE(phb->chip));
> +        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
>       }
>   
>       /* LSI sources */
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 9a458655efd9..45d8ecbf2bf7 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1927,6 +1927,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
>   
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
> +
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB3);
>   }
>   
>   static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
> 

