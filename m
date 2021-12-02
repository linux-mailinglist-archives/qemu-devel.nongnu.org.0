Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE0E466972
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:53:34 +0100 (CET)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqGz-0002iF-JO
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:53:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msqBW-0005Lc-FC; Thu, 02 Dec 2021 12:47:54 -0500
Received: from [2607:f8b0:4864:20::730] (port=37391
 helo=mail-qk1-x730.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msqBU-0003VE-OY; Thu, 02 Dec 2021 12:47:54 -0500
Received: by mail-qk1-x730.google.com with SMTP id m186so736203qkb.4;
 Thu, 02 Dec 2021 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s75jTkt7fC304xzR1IO/AGBpnk1+xNihh3C8AJBF7iI=;
 b=eFYmoV7g6S02F5kLrwjeoC8ZaxQ2U6Fj3jPkqO8hBsTSXIQMT86iTbOKUzhPjCiXDF
 SvpRoJtdr3IucMIjYxj9PtFFuNL8dWgesv36v/orFblEgvVmi83MXj5FLioxxVNbtgO5
 IJXuijSlqwJlyM1BmEgWiNqJTPKw/RI6x/Ws1/zGd/vgbYI9vww9kBrLzlwlFalR6J78
 qif4vMynfquXiBRio7SouNXdy52XQYy/42UVY5VyBoMukQbv79zc7rhBkwEjEp9XZRs/
 XPkYJi2HG4ZiR371a/KvnJxyoWyPirOQKEZKBtm6YqqdrcE5Mv/3zrCS2bFyufIE96fl
 snOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s75jTkt7fC304xzR1IO/AGBpnk1+xNihh3C8AJBF7iI=;
 b=h5JzMHrvXw5R0ZJeNVAAYqXDjPEcSNf3G6YEVNNbPJYlW9JHxkKv79WOAE9Ruw3sd6
 ikqA/o22nyB1kRo98bOafr8iiEsCldlXNppCSKHAIovoEnzMjjA0c/4GnlYLR164HQde
 eZ+cGVOExQxJp57/kwv86g3qLurzDrxhZAWvIluE3ZIXKjqI22T0Yn4reXR7M6VrMx17
 2nB9wsYbFWNZNtslJYn6ZPjoKWU++cBTQROspmXusKmiq2VbZ3jAyRVjHXOfm8aouwF5
 8g97xk4l8F38K0Icwgub25KgV0k0diooQRkIPIygoyc0wzL8J6VY14zfSVjvQEY8pvYB
 q4nQ==
X-Gm-Message-State: AOAM5323ZL3BR2COTcXF/fip8X+NlW9bX9qZb2UnaM22PXSdoZlQCpvA
 o5vjIvhuM8/aPoKoGYnL4vk=
X-Google-Smtp-Source: ABdhPJwjztPT3RDgDIx63mwhaMl35pBL2I4MBupkOLZaFk9HYkWr01mzrAgyaFqGjVauM1gTf36oig==
X-Received: by 2002:a05:620a:461f:: with SMTP id
 br31mr13739044qkb.72.1638467271694; 
 Thu, 02 Dec 2021 09:47:51 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id e13sm259364qte.56.2021.12.02.09.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:47:51 -0800 (PST)
Message-ID: <de397766-d507-7234-e54a-2628fcf13546@gmail.com>
Date: Thu, 2 Dec 2021 14:47:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 12/14] ppc/pnv: Remove "system-memory" property for he
 PHB4 PEC model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-13-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-13-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::730
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
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
> This is not useful and will be in the way for support of user created
> PHB4 devices.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb4_pec.c | 6 +-----
>   hw/ppc/pnv.c               | 2 --
>   2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index a7dd4173d598..dfed2af0f7df 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -124,7 +124,7 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
>   static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>   {
>       PnvPhb4PecState *pec = stack->pec;
> -    MemoryRegion *sysmem = pec->system_memory;
> +    MemoryRegion *sysmem = get_system_memory();
>       uint64_t bar_en = stack->nest_regs[PEC_NEST_STK_BAR_EN];
>       uint64_t bar, mask, size;
>       char name[64];
> @@ -394,8 +394,6 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       char name[64];
>       int i;
>   
> -    assert(pec->system_memory);
> -
>       if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
>           error_setg(errp, "invalid PEC index: %d", pec->index);
>           return;
> @@ -486,8 +484,6 @@ static Property pnv_pec_properties[] = {
>           DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
>           DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
>                            PnvChip *),
> -        DEFINE_PROP_LINK("system-memory", PnvPhb4PecState, system_memory,
> -                     TYPE_MEMORY_REGION, MemoryRegion *),
>           DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index f8b0b2a28383..3a550eed0f36 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1383,8 +1383,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>                                   &error_fatal);
>           object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
>                                    &error_fatal);
> -        object_property_set_link(OBJECT(pec), "system-memory",
> -                                 OBJECT(get_system_memory()), &error_abort);
>           if (!qdev_realize(DEVICE(pec), NULL, errp)) {
>               return;
>           }
> 

