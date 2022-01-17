Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B7D4910CD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:55:48 +0100 (CET)
Received: from localhost ([::1]:50352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Y6W-0007Rl-01
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9Y1m-0004KV-VN; Mon, 17 Jan 2022 14:50:55 -0500
Received: from [2607:f8b0:4864:20::c31] (port=33364
 helo=mail-oo1-xc31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9Y1h-0007Wo-VM; Mon, 17 Jan 2022 14:50:54 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 v10-20020a4a244a000000b002ddfb22ab49so4953906oov.0; 
 Mon, 17 Jan 2022 11:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=gRFUuO6a6sQeMWZbcQCXgs5/54bTjObeAs1Ieb6gF9M=;
 b=YwR9B43AoCu0XvvvXVl8WSpzYR3kWLsTIYaGSDSFw+DIoscn99Oy2XZIhsWiYsX6J2
 aPGqbH6wmHTTUpCsKmPOQBs/QoqqRnHhNpcwoDtXjSlWFNDcRK/Xidmo63lZK32y4eM0
 lNwyiiu6wT0mXhZSB7cEkmA5zW3PGXebkxZ94+T95k77Vg0j+VZx55mEzOStVxvy55qh
 4Za86ndQO+PVIRgtbGcaT8VbZ6yU4oyY/9ijTMWPZEBQ3do43JooVE5z6apUIKamwO7H
 jxZNvDJw0IBzC5eSZKlyatufClk0ssIxwcLJS+hLZx5r82U/aq7tz8Mj2ATtoW0VcqQG
 AG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gRFUuO6a6sQeMWZbcQCXgs5/54bTjObeAs1Ieb6gF9M=;
 b=ti9QPfLv89sYqvmY/TQkth26A/zO4W8JI2rpcCgn9F85o9xrKa5G+ckgZtBUMtHeD2
 ZUGU+F5VKopSKA2m9BGrGGGrKmWF2MXenUDrQ8Nxe/nXBdvmjeKxUPMGEV98OmkudTwe
 Rw47l+XNRoCp20bal+fetwU0t8iP2DfwgZoSPCs5Jl98yqXq4sh9/rv797QlRiBkqddF
 xpA1ucU6HFaRnORGr/P9jt5tMB+M3U3OakMwdTNKrk1sCWc1isaOgr9bDNNJKQimeuL6
 Pu4o9BUOXA6eFOzt6r6kIVRgaZ9uQUQ8eaSm+M4GfhthOjstnujhQhzCnp1eEEu4HhSD
 0xnQ==
X-Gm-Message-State: AOAM531zq59v+7vv8mUYeV3o+zA391Fh5HN6yqqsU/4gyGReVN4rbxvt
 D1d6tvebtKf3yX0IMQliVR8=
X-Google-Smtp-Source: ABdhPJxNbhJsbcmWF4JAwvaDO64Prew71NZar6p3jX2oqX6FVNGfrejuWwa60FTR0HnjVly6d12Gvg==
X-Received: by 2002:a4a:da04:: with SMTP id e4mr9034624oou.33.1642449007075;
 Mon, 17 Jan 2022 11:50:07 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id k19sm5686121oot.32.2022.01.17.11.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 11:50:06 -0800 (PST)
Message-ID: <329048b5-819f-603b-7e5b-efd98df81598@gmail.com>
Date: Mon, 17 Jan 2022 16:50:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] ppc/pnv: Remove PHB4 version property
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220117122753.1655504-1-clg@kaod.org>
 <20220117122753.1655504-4-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220117122753.1655504-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc31.google.com
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
> and grab the PHB version from the PEC class directly when needed.

I guess we want a capital "A" when starting the commit msg

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


This change also makes pnv-phb4s a little closer with pnv-phb3s, given that we don't
have a "Version" attribute exposed in the QOM for pnv-phb3s as well.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb4.c     | 9 +--------
>   hw/pci-host/pnv_phb4_pec.c | 3 ---
>   2 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index c688976caec9..a78add75b043 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -672,7 +672,7 @@ static uint64_t pnv_phb4_reg_read(void *opaque, hwaddr off, unsigned size)
>   
>       switch (off) {
>       case PHB_VERSION:
> -        return phb->version;
> +        return PNV_PHB4_PEC_GET_CLASS(phb->pec)->version;
>   
>           /* Read-only */
>       case PHB_PHB4_GEN_CAP:
> @@ -1575,7 +1575,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       if (!phb->pec) {
>           PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>           PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
> -        PnvPhb4PecClass *pecc;
>           BusState *s;
>   
>           if (!chip) {
> @@ -1589,11 +1588,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>   
> -        /* All other phb properties are already set */
> -        pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
> -        object_property_set_int(OBJECT(phb), "version", pecc->version,
> -                                &error_fatal);
> -
>           /*
>            * Reparent user created devices to the chip to build
>            * correctly the device tree.
> @@ -1688,7 +1682,6 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno)
>   static Property pnv_phb4_properties[] = {
>           DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
> -        DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
>           DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
>                            PnvPhb4PecState *),
>           DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index a3c4b4ef850c..40d89fda56e5 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -117,7 +117,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>                                           Error **errp)
>   {
>       PnvPHB4 *phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
> -    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
>   
>       object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
> @@ -126,8 +125,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>                               &error_fatal);
>       object_property_set_int(OBJECT(phb), "index", phb_id,
>                               &error_fatal);
> -    object_property_set_int(OBJECT(phb), "version", pecc->version,
> -                            &error_fatal);
>   
>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>           return;

