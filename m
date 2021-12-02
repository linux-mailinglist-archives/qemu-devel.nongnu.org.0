Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E263E466934
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:32:39 +0100 (CET)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspwk-0004AI-UP
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:32:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mspvV-0002eN-Oj; Thu, 02 Dec 2021 12:31:21 -0500
Received: from [2607:f8b0:4864:20::82f] (port=36375
 helo=mail-qt1-x82f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mspvT-0004O2-Be; Thu, 02 Dec 2021 12:31:21 -0500
Received: by mail-qt1-x82f.google.com with SMTP id t11so493264qtw.3;
 Thu, 02 Dec 2021 09:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xEra1hhSEH3bx6AIZw9Ft6MqsJXyjyWQeHQQTyecQak=;
 b=b7CoH0p2YnG2Hs5IXEoTrnSscU1sNPGsEbIy+J35EmGGr3BWc099iKWspyGN76yBVk
 fXjCsQd3tQbqOsoCkHujYpD/jN3MyxHPAnD+Ol09WzRvrlTbV12ytIiI+h9mxF+dbBMq
 G2MTQmHJ1npZDsasOcZSICq9NAxb65eFQJ26m3L6Z9vKu8+HT/+pBMvF2OOuaHBV2dAk
 PxoG8NB9iqH2eb4NMF5PSeUH+KEqqf6chHN9mRgFdyLkTmL+BTUhQy9sVrG1BTr0oAn/
 1lLoYo9eCfOhw1RZmplohlxJZxlNsMcCTFVIODVB12Z+6mn9MOUlWEHC+e2TyMDmfl23
 YTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xEra1hhSEH3bx6AIZw9Ft6MqsJXyjyWQeHQQTyecQak=;
 b=499AHPo1c9OOn6KGwPrN7NcX4PxBekS3+uC3Ig3Lt91hMOhdtNXWofhInITxpTb1Bt
 yTw1XIm05xwHbkGpmXmuRl9gYNnRI7LKNO9LswX7uKz5cBxE1haExpGSo8GdoMMzSMlD
 0vyPOrfVCoNm/Klt3+U6TScgGgIdr0Sqo87omqYzLNOSnO0Pbw1rJEs+w+K8fUUvp/St
 7VPNSqQz1zYJqk2HVgkw+giOn9IZWHo83ChbccGcHWKshO9/GKjy/o6jhP6wUxfHyghf
 rSNBRH8oniXcVZk8ipMz/xfTFNGuGw7W/Bk9pM+P42U+lwP1m9fBcPxdnQok13AlshEz
 upWA==
X-Gm-Message-State: AOAM53183l2uqInLN7hDX2nI5p6PwCP49jI7g0wBt7GsYbp54GO36EPW
 5q3Zx6vGaMIUAuzLJRI4MPs=
X-Google-Smtp-Source: ABdhPJxtqHq+RWxFOWdTyVelx/Wmup9MI7X4mlbl8chLjXok9GLrjUa2nRCTJHzf0gb7US7FQMHqyw==
X-Received: by 2002:a05:622a:186:: with SMTP id
 s6mr15679659qtw.477.1638466277049; 
 Thu, 02 Dec 2021 09:31:17 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id h22sm262739qtb.86.2021.12.02.09.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:31:16 -0800 (PST)
Message-ID: <29908948-a2aa-1456-92c3-27cfa7cac707@gmail.com>
Date: Thu, 2 Dec 2021 14:31:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 04/14] ppc/pnv: Introduce support for user created PHB3
 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-5-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82f.google.com
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
> PHB3 devices and PCI devices can now be added to the powernv8 machine
> using :
> 
>    -device pnv-phb3,chip-id=0,index=1 \
>    -device nec-usb-xhci,bus=pci.1,addr=0x0
> 
> The 'index' property identifies the PHB3 in the chip. In case of user
> created devices, a lookup on 'chip-id' is required to assign the
> owning chip.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/pnv.h   |  2 ++
>   hw/pci-host/pnv_phb3.c | 11 ++++++++++-
>   hw/ppc/pnv.c           | 23 ++++++++++++++++++-----
>   3 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 6f498c8f1b5f..0710673a7fd8 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -215,6 +215,8 @@ struct PnvMachineState {
>       hwaddr       fw_load_addr;
>   };
>   
> +PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id);
> +
>   #define PNV_FDT_ADDR          0x01000000
>   #define PNV_TIMEBASE_FREQ     512000000ULL
>   
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 3aa42ef9d4b9..dd1cf37288a0 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -998,6 +998,15 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    /* User created devices */
> +    if (!phb->chip) {
> +        phb->chip = pnv_get_chip(pnv, phb->chip_id);
> +        if (!phb->chip) {
> +            error_setg(errp, "invalid chip id: %d", phb->chip_id);
> +            return;
> +        }
> +    }
> +
>       /* LSI sources */
>       object_property_set_link(OBJECT(&phb->lsis), "xics", OBJECT(pnv),
>                                &error_abort);
> @@ -1105,7 +1114,7 @@ static void pnv_phb3_class_init(ObjectClass *klass, void *data)
>       dc->realize = pnv_phb3_realize;
>       device_class_set_props(dc, pnv_phb3_properties);
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> -    dc->user_creatable = false;
> +    dc->user_creatable = true;
>   }
>   
>   static const TypeInfo pnv_phb3_type_info = {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index de277c457838..d7fe92cb082d 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1097,14 +1097,14 @@ static void pnv_chip_power8_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
>   
> -    for (i = 0; i < pcc->num_phbs; i++) {
> +    if (defaults_enabled()) {
> +        chip->num_phbs = pcc->num_phbs;
> +    }
> +
> +    for (i = 0; i < chip->num_phbs; i++) {
>           object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
>       }
>   
> -    /*
> -     * Number of PHBs is the chip default
> -     */
> -    chip->num_phbs = pcc->num_phbs;
>   }
>   
>   static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
> @@ -1784,6 +1784,19 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
>       return NULL;
>   }
>   
> +PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
> +{
> +    int i;
> +
> +    for (i = 0; i < pnv->num_chips; i++) {
> +        PnvChip *chip = pnv->chips[i];
> +        if (chip->chip_id == chip_id) {
> +            return chip;
> +        }
> +    }
> +    return NULL;
> +}
> +
>   static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
> 

