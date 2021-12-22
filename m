Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9703147D65C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:16:04 +0100 (CET)
Received: from localhost ([::1]:52302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n069j-00086m-Jr
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:16:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n066d-00046O-2v; Wed, 22 Dec 2021 13:12:51 -0500
Received: from [2607:f8b0:4864:20::731] (port=35524
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n066Z-0004hO-Am; Wed, 22 Dec 2021 13:12:50 -0500
Received: by mail-qk1-x731.google.com with SMTP id 131so3151032qkk.2;
 Wed, 22 Dec 2021 10:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=KZ2fWfFstQy/18QP8DjPxpvE1P5fYOwlRW6KNPuXBqE=;
 b=Tcc+/0V0e3nyZKaqSoQkQjntk4Cf/7VBZmZsCnbb40u/d7EkzfY3cOoLsNL2Z5lcbw
 WrHnSXASdyCHovaf82le4E/imJSRFdJaRG5iqbUDJOwbXCQcowc6Z1gNlQGxKb8DeSrP
 4qfsaQv6LkxpXFoAdEWJZzJPm5KdlfQxl6Vcwo/k/BX3hA3jYTVEhsRkcTDPlpCa9iyS
 BOIxuRv0FGL8B604pcsg6OeVfTmwAafRqA+j8emSp+gsaG7lKXrVkjEGvv8mnkDcGtI1
 KaZngkh0i7PzI+F8hQ+St073Z3sNdptSwYoD+y+ZuLyvlmA+8LsteffUZCnRMXvjjOEG
 fzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KZ2fWfFstQy/18QP8DjPxpvE1P5fYOwlRW6KNPuXBqE=;
 b=mN8obHSAKqvp/8dsplkpaPzbe/2dtUxAFEN6zmcxGZ0hbDfLM8XLclHQlyw/pj7Nqz
 N+x1Wd3UhtrsMRJmhnjR7xrKAhpHmroSuZ5RuoJ3OxxCOkTfsUNgXp1cL/KSWHBXGKoG
 +ArypINT1QQPspp44fwPlK1SaXEVUQc0RtboSwwnH+Rpcj9h7JVDupIfDS6Ra3d8pfuh
 Emm1uLQH/AJ2D47IVNqftYg5z7sqkgVHlLU1WDF7sKT3c+LS6RamAY0N655QrEStSvng
 eWgjlNnuOi0nL4Qu/aXZnfYFohP9xmY4XciECsXbvGCQHHLirvzC4IPautCKCNFwM6yo
 Bvsg==
X-Gm-Message-State: AOAM530ZK1uN8U9vtxpKSday96sG+ztX/nka/RQDgH/dMrZSBoiT+L3D
 MuHg+8MUapJCWxzSZgHrqVOb2ya9M2U=
X-Google-Smtp-Source: ABdhPJy+4zsL6c7rzmm8RKt9btsVGZYHlwnjR07t+cKcEsfUKnS8hjLdNFqDG1k/UoLIeFPNoSVF4g==
X-Received: by 2002:a05:620a:2727:: with SMTP id
 b39mr2900805qkp.454.1640196766212; 
 Wed, 22 Dec 2021 10:12:46 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:7ce4:b718:2cc0:32df:97ee?
 ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id w2sm2352124qta.11.2021.12.22.10.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 10:12:45 -0800 (PST)
Message-ID: <b0810a89-ef6f-4f6b-dcc4-444f7672626a@gmail.com>
Date: Wed, 22 Dec 2021 15:12:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/5] ppc/pnv: Remove the PHB4 "device-id" property
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222063817.1541058-1-clg@kaod.org>
 <20211222063817.1541058-4-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211222063817.1541058-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 12/22/21 03:38, Cédric Le Goater wrote:
> It's unused.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb4.h | 2 --
>   hw/pci-host/pnv_phb4.c         | 1 -
>   hw/pci-host/pnv_phb4_pec.c     | 3 ---
>   3 files changed, 6 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 60de3031a622..4a19338db35e 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -84,7 +84,6 @@ struct PnvPHB4 {
>       uint32_t phb_id;
>   
>       uint64_t version;
> -    uint16_t device_id;
>   
>       char bus_path[8];
>   
> @@ -222,7 +221,6 @@ struct PnvPhb4PecClass {
>       const char *stk_compat;
>       int stk_compat_size;
>       uint64_t version;
> -    uint64_t device_id;
>       const uint32_t *num_stacks;
>   };
>   
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 4caf03310fab..3b50a22b97cd 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1261,7 +1261,6 @@ static Property pnv_phb4_properties[] = {
>           DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
>           DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
> -        DEFINE_PROP_UINT16("device-id", PnvPHB4, device_id, 0),
>           DEFINE_PROP_LINK("stack", PnvPHB4, stack, TYPE_PNV_PHB4_PEC_STACK,
>                            PnvPhb4PecStack *),
>           DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 24a3adcae326..f3e4fa0c8297 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -527,7 +527,6 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>       pecc->stk_compat = stk_compat;
>       pecc->stk_compat_size = sizeof(stk_compat);
>       pecc->version = PNV_PHB4_VERSION;
> -    pecc->device_id = PNV_PHB4_DEVICE_ID;
>       pecc->num_stacks = pnv_pec_num_stacks;
>   }
>   
> @@ -587,8 +586,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>                               &error_fatal);
>       object_property_set_int(OBJECT(&stack->phb), "version", pecc->version,
>                               &error_fatal);
> -    object_property_set_int(OBJECT(&stack->phb), "device-id", pecc->device_id,
> -                            &error_fatal);
>       object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack),
>                                &error_abort);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
> 

