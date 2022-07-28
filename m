Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1242A583FAA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:12:17 +0200 (CEST)
Received: from localhost ([::1]:56868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3JG-00085z-3s
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH3GN-0006R3-KT; Thu, 28 Jul 2022 09:09:15 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:33391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH3GL-0001jM-Qh; Thu, 28 Jul 2022 09:09:15 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so1160686otk.0; 
 Thu, 28 Jul 2022 06:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8P1iYUkh0D2fxcXk7oxa/0//UFiQaQPxOm3ZEP0ycJ0=;
 b=HaDPrLWwGxF6BzlNkXfcc5AGQ1dvtS1a+pWz8ArmAgWAAaT+WRMosxjlLotpvglnjt
 bbgPS95UnausZuQYtgwBXYAeVvY2nYdw9QVi+ridNP5C7QjffrSSaNS6rLyHcdr/uP/k
 dWmRaiDHIm47P7w4A1yJT30amfkXWF+JPlCUphUUOlkWdWlxTHiGtKH5O7oYMbk7GJ5k
 JgDU/tQ2lPVohLIOcunNhb3dVomfr7MRTidoZbUFz+1VZss3wybVn2l11OmL377quz7y
 azu16vEeI3K/33fwiQrZD0C/o9BzGZOMSLgLD1IsdxjDbHfD1pvlgS9afz0156hIvcT4
 kKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8P1iYUkh0D2fxcXk7oxa/0//UFiQaQPxOm3ZEP0ycJ0=;
 b=FgobWcTbkGjUvO7rG8EgZDNFyH7cX5TJZF4FB2XpCEwMk6iGKmLPt0CBotKzuZ1AXz
 /aVAXnohgQoQeqmKxn+TQRaECkmoV5mxYstXaaXldkzVjyK+/mdSfwW8R4zsyrB7A64O
 92vZCiDp1NFfsxuqCeoitcwZdQG4GzIqP3uGR+L4QVQF0nE7BR57cbhUTPgHggg7vy9I
 b3qkmhktfihPTJs38iaV7zPlBl1KynfA3+qm8NeJ8EgCb2ASThDkSg02QyjA+TdXAF5n
 BngKt/QRxoDmKTePPu9zinHKHQzCWvIJehUrdsswGgmuvgGpUg81PYF7slWVu0AMZPTx
 rQ8g==
X-Gm-Message-State: AJIora8RLhUb5y7x24A+NLSZgklgCyEUC/uJi2yhE7c4M4UIPWynT92P
 s3NGLlgTxL93UvIsHNCvGmX8pds499g=
X-Google-Smtp-Source: AGRyM1s6QtaNP17g5ixWG9dDWDBfb0FeLW4HgeJax82CM+i2l1w3NxWhRlGBv5woQ6uUu/4pazXP1A==
X-Received: by 2002:a9d:73d0:0:b0:61c:8d31:6981 with SMTP id
 m16-20020a9d73d0000000b0061c8d316981mr10419125otk.99.1659013751414; 
 Thu, 28 Jul 2022 06:09:11 -0700 (PDT)
Received: from [192.168.10.102] ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 e137-20020a4a558f000000b00431d44849e9sm347881oob.20.2022.07.28.06.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 06:09:11 -0700 (PDT)
Message-ID: <79ffedd9-0bf5-4ed2-dc0e-50d6d41c554c@gmail.com>
Date: Thu, 28 Jul 2022 10:09:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 05/12] ppc/pnv: turn PnvPHB4 into a PnvPHB backend
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-6-danielhb413@gmail.com>
 <fdb9248c-1b25-ec59-1532-a2ce093edf96@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <fdb9248c-1b25-ec59-1532-a2ce093edf96@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
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



On 7/27/22 14:41, Frederic Barrat wrote:
> 
> 
> On 24/06/2022 10:49, Daniel Henrique Barboza wrote:
> 
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 1df91971b8..b7273f386e 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -672,7 +672,14 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>>   static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
>>   {
>>       Monitor *mon = opaque;
>> -    PnvPHB4 *phb4 = (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PHB4);
>> +    PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
>> +    PnvPHB4 *phb4;
>> +
>> +    if (!phb) {
>> +        return 0;
>> +    }
>> +
>> +    phb4 = (PnvPHB4 *)phb->backend;
>>       if (phb4) {
>>           pnv_phb4_pic_print_info(phb4, mon);
> 
> 
> The full code in pnv_chip_power9_pic_print_info_child() looks like this:
> 
>      PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
>      PnvPHB4 *phb4;
> 
>      if (!phb) {
>          return 0;
>      }
> 
>      phb4 = (PnvPHB4 *)phb->backend;
> 
>      if (phb4) {
>          pnv_phb4_pic_print_info(phb4, mon);
>      }
> 
> Which is correct. However, if I want to nitpick, phb->backend is defined when the PnvPHB object is realized, so I don't think we can get here with the pointer being null, so we could remove the second if statement for readability. The reason I mention it is that we don't take that much care in the pnv_chip_power8_pic_print_info() function just above, so it looks a bit odd.

Good point. I changed it to look like this:


static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
{
     Monitor *mon = opaque;
     PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);

     if (!phb) {
         return 0;
     }

     pnv_phb4_pic_print_info(PNV_PHB4(phb->backend), mon);

     return 0;
}

phb->backend being either NULL or not a PHB4 object is serious enough to assert
out, so the PNV_PHB4() macro seems justified.


Thanks,


Daniel

> 
> In any case:
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
>    Fred
> 
> 
> 
> 
>> @@ -2122,8 +2129,14 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>>       PnvMachineClass *pmc = PNV_MACHINE_CLASS(oc);
>>       static const char compat[] = "qemu,powernv9\0ibm,powernv";
>> +    static GlobalProperty phb_compat[] = {
>> +        { TYPE_PNV_PHB, "version", "4" },
>> +    };
>> +
>>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
>>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
>> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
>> +
>>       xfc->match_nvt = pnv_match_nvt;
>>       mc->alias = "powernv";
>> @@ -2140,8 +2153,13 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
>>       XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
>>       static const char compat[] = "qemu,powernv10\0ibm,powernv";
>> +    static GlobalProperty phb_compat[] = {
>> +        { TYPE_PNV_PHB, "version", "5" },
>> +    };
>> +
>>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";
>>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power10_v2.0");
>> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
>>       pmc->compat = compat;
>>       pmc->compat_size = sizeof(compat);
>> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
>> index 90843ac3a9..f22253358f 100644
>> --- a/include/hw/pci-host/pnv_phb4.h
>> +++ b/include/hw/pci-host/pnv_phb4.h
>> @@ -18,6 +18,7 @@
>>   typedef struct PnvPhb4PecState PnvPhb4PecState;
>>   typedef struct PnvPhb4PecStack PnvPhb4PecStack;
>>   typedef struct PnvPHB4 PnvPHB4;
>> +typedef struct PnvPHB PnvPHB;
>>   typedef struct PnvChip PnvChip;
>>   /*
>> @@ -78,7 +79,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
>>   #define PCI_MMIO_TOTAL_SIZE        (0x1ull << 60)
>>   struct PnvPHB4 {
>> -    PCIExpressHost parent_obj;
>> +    DeviceState parent;
>> +
>> +    PnvPHB *phb_base;
>>       uint32_t chip_id;
>>       uint32_t phb_id;

