Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FED483F75
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:54:44 +0100 (CET)
Received: from localhost ([::1]:53880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gWg-0002dg-Qb
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:54:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4gVQ-0001nh-7Q; Tue, 04 Jan 2022 04:53:24 -0500
Received: from [2607:f8b0:4864:20::f35] (port=40791
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4gVO-0000Ez-O6; Tue, 04 Jan 2022 04:53:23 -0500
Received: by mail-qv1-xf35.google.com with SMTP id q3so33854530qvc.7;
 Tue, 04 Jan 2022 01:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SXo8Ho/FNPWSYsBHwpoWA4+6bR0VGlqQxieqD0sTM6s=;
 b=TlZL2o3y3zbjAsLQvUVcB0WGqlJRNG04d7YCgPYb74zX+Vmc8rmrr/Ag8d2tqfb9aI
 IU0eAIrt/byA13SV1Ji8n1JjblLPtIg6FlJLHHfk3NB86W+YC6xIskFHeNTqmkmBoK90
 k5CyYGA0xrscUxmfdgJm780tLS20UgHEOkpF8RdNHW/fda72dwrQaeF1aoQO1NEMuaKb
 uxHUmGh3qU9VbmL3jcQpl7MVsjA2lI4Y6PIONDUWkgrN8Uv6iNrMhv42b9XeZBBDBpnU
 IbRf5Dv2S1ICUk9t1PNBVpuQRXKtfhuO9bxd9ByKPcrn1KUELSN1uAT2b6F2ES5kY5Uh
 YmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SXo8Ho/FNPWSYsBHwpoWA4+6bR0VGlqQxieqD0sTM6s=;
 b=qWyKfupWUZLvCdBqnQpWYbu3l2NXQhRoUAqvuJjImqUx6Idb2l7sRbgTJXaV5eKYba
 qhbYL1jAW1NZqFNGvGaNGwLHqcffZtcE1D5XXd3ONYXVYU8SBBCJj2IjAjVKWf4Hxna2
 oDgcpDPG7lBTdG5B+0Jd3qH5c2DivXS36MT0gmtnj1jYLZfadiXVRKdeXlCWb+sqxEPY
 LTUCeQ4IIPZ/5bI17Ht2r32Y7/vz5FoZf0MzEZHfZtjxitSdtQ6UBz0hx574Q9yZAqmS
 dA9j3Siuzl/g366/468HL+nXWIO6nX/OpBJ6l3eJlHYxST0llbyo3xcolalU5Ifkl386
 +f2Q==
X-Gm-Message-State: AOAM533AKUYEiFwkowgNH/8MrA3uig1chQ0xV8mIWAIwF+VUsSgQtI7F
 943LU9uMKR8qIyOyZAj7uWI=
X-Google-Smtp-Source: ABdhPJwtJjUahFnGFSYs/MXhCdt3Gw5OjPuLRWLgKLAxQ1YHlBhHdBPoKku9l7jE+CK5fKuqvwS6xg==
X-Received: by 2002:a05:6214:d8b:: with SMTP id
 e11mr44977691qve.75.1641290001492; 
 Tue, 04 Jan 2022 01:53:21 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id y14sm25474312qkp.27.2022.01.04.01.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 01:53:21 -0800 (PST)
Message-ID: <0ede7097-61ce-a0b2-68c8-786644bde795@gmail.com>
Date: Tue, 4 Jan 2022 06:53:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 19/19] ppc/pnv: Move num_phbs under Pnv8Chip
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211213132830.108372-1-clg@kaod.org>
 <20211213132830.108372-20-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211213132830.108372-20-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 12/13/21 10:28, Cédric Le Goater wrote:
> It is not used elsewhere so that's where it belongs.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

I am/was using this patch and didn't provide my r-b on it:


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   include/hw/ppc/pnv.h | 4 ++--
>   hw/ppc/pnv.c         | 7 +++----
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index ca27bd39f0ac..251c9854329d 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -52,7 +52,6 @@ struct PnvChip {
>       uint64_t     cores_mask;
>       PnvCore      **cores;
>   
> -    uint32_t     num_phbs;
>       uint32_t     num_pecs;
>   
>       MemoryRegion xscom_mmio;
> @@ -82,6 +81,7 @@ struct Pnv8Chip {
>   
>   #define PNV8_CHIP_PHB3_MAX 4
>       PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
> +    uint32_t     num_phbs;
>   
>       XICSFabric    *xics;
>   };
> @@ -136,8 +136,8 @@ struct PnvChipClass {
>       /*< public >*/
>       uint64_t     chip_cfam_id;
>       uint64_t     cores_mask;
> -    uint32_t     num_phbs;
>       uint32_t     num_pecs;
> +    uint32_t     num_phbs;
>   
>       DeviceRealize parent_realize;
>   
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 2b027e299d27..8a3732c982e5 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1099,7 +1099,6 @@ static void pnv_chip_power10_intc_print_info(PnvChip *chip, PowerPCCPU *cpu,
>   
>   static void pnv_chip_power8_instance_init(Object *obj)
>   {
> -    PnvChip *chip = PNV_CHIP(obj);
>       Pnv8Chip *chip8 = PNV8_CHIP(obj);
>       PnvChipClass *pcc = PNV_CHIP_GET_CLASS(obj);
>       int i;
> @@ -1118,10 +1117,10 @@ static void pnv_chip_power8_instance_init(Object *obj)
>       object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
>   
>       if (defaults_enabled()) {
> -        chip->num_phbs = pcc->num_phbs;
> +        chip8->num_phbs = pcc->num_phbs;
>       }
>   
> -    for (i = 0; i < chip->num_phbs; i++) {
> +    for (i = 0; i < chip8->num_phbs; i++) {
>           object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
>       }
>   
> @@ -1239,7 +1238,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>                                   &chip8->homer.regs);
>   
>       /* PHB3 controllers */
> -    for (i = 0; i < chip->num_phbs; i++) {
> +    for (i = 0; i < chip8->num_phbs; i++) {
>           PnvPHB3 *phb = &chip8->phbs[i];
>   
>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);

