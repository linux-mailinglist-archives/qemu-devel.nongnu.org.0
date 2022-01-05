Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDA64858C1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 19:58:14 +0100 (CET)
Received: from localhost ([::1]:60330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5BUD-0004zK-NH
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 13:58:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5BRa-00024T-Gu; Wed, 05 Jan 2022 13:55:30 -0500
Received: from [2607:f8b0:4864:20::a33] (port=34732
 helo=mail-vk1-xa33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5BRX-0005p8-Lx; Wed, 05 Jan 2022 13:55:29 -0500
Received: by mail-vk1-xa33.google.com with SMTP id h67so237943vkh.1;
 Wed, 05 Jan 2022 10:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2EIWegs3xQPD9L6SGks0lHzcwpQCambwgUOGpeQ3K/I=;
 b=N0lPjUneV4tuPTViO9p4l9U37cP7MXLLEgg/VdkLCPBbWmuOHaF3ItOskCbYDtJDKE
 FJTO5xXyXb+vjkHfI4Zd8e8zAcelQHRGzE2QWg7XISL/va4k/dJ3Y4vhNHxi+Ys2Aebd
 n9XbWJXJ9TtyE4azW3pucDmI+RyhOPLQSTdKFEkkiqB1c8WVbbY2rm1vG2dg3+PlvWUX
 YPn+0L5UCRP++h378Qtklu92eHSMR1gQbWfu/e8RGwSjqZ3Jx9zlws+O++EIrcA3xpMX
 1aGOSpGyQccN2a4kMHu2zjS5PYHguMvoYMpxwp5PJJc4HX1bSiO2z4GuQ/go9cqQ0Sn5
 cezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2EIWegs3xQPD9L6SGks0lHzcwpQCambwgUOGpeQ3K/I=;
 b=Zpx5qmFvwwt+9vy0YrGzBBja7sFdbBVJlPoDdAaSrLj7SiPkkB8cMwxiAT8mHE//Ae
 pIbkLxkVn5boekK6+AAurvbiyCcILyH8FH2AjQT5hiB1BirDgG5GRHpCherhB4g/+f0U
 2f1sAX7s/taf4urJ/ynPvpsK7SofJMctVROH/TuStvaWPE5pkc3ZL5CU6RIUsZ7x/Y68
 9WKEkD+wtHknOJGA/uPxF7bEOBERAuQDQlh8ijL4uX25vkrr8Zp+RvjMMRGQPwgyZkdz
 JMTKNzIFsL7ek7/LYll3EHBkPvf1rj8nlDD4jbLNo+bm7tkTEPdo/P4M1rgUjZEt4PHR
 A3dQ==
X-Gm-Message-State: AOAM530vCY6CLZwOUlqHJURARnOcGQzuUDrA39hBTsNd+hV1yYPBDXRX
 UFZnnoPcmKtkwZwAVqwlde3ECAhzw7I=
X-Google-Smtp-Source: ABdhPJwMoRB03wUlw5WM9/SwQqlVEqjHQaM0jYFk01/1+kj//bucBNf6I///b3KWBq6aFdBZfawLTw==
X-Received: by 2002:a05:6122:c93:: with SMTP id
 ba19mr14640745vkb.17.1641408925292; 
 Wed, 05 Jan 2022 10:55:25 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id w131sm337699vkw.54.2022.01.05.10.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 10:55:24 -0800 (PST)
Message-ID: <6992e8ad-503e-1113-d471-4587fc57268c@gmail.com>
Date: Wed, 5 Jan 2022 15:55:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 11/17] pnv_phb4_pec.c: use pnv_pec_get_phb_id() in
 pnv_pec_dt_xscom()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-12-danielhb413@gmail.com>
 <2ee5ae64-3fec-9bf7-7c5d-010f90bdd379@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <2ee5ae64-3fec-9bf7-7c5d-010f90bdd379@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.057,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/3/22 06:08, Cédric Le Goater wrote:
> On 12/28/21 20:38, Daniel Henrique Barboza wrote:
>> Relying on stack->phb to write the xscom DT of the PEC is something that
>> we won't be able to do with user creatable pnv-phb4 devices.
>>
>> Hopefully, this can be done by using pnv_pec_get_phb_id(), which is
>> already used by pnv_pec_realize() to set the phb-id of the stack. Use
>> the same idea in pnv_pec_dt_xscom() to write ibm,phb-index without the
>> need to accessing stack->phb, since stack->phb is not granted to be !=
>> NULL when user creatable phbs are introduced.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Couldn't we do that already without the previous change ?

Yes. In fact I'll postpone the previous patch until we actually need it (in this
series it would be patch 15).


Thanks,

Daniel

> 
> Thanks,
> 
> C.
> 
> 
>> ---
>>   hw/pci-host/pnv_phb4_pec.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 4f6db26633..56ffd446ab 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -466,8 +466,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>>                         pecc->compat_size)));
>>       for (i = 0; i < pec->num_stacks; i++) {
>> -        PnvPhb4PecStack *stack = &pec->stacks[i];
>> -        PnvPHB4 *phb = &stack->phb;
>> +        int phb_id =  pnv_pec_get_phb_id(pec, i);
>>           int stk_offset;
>>           name = g_strdup_printf("stack@%x", i);
>> @@ -477,7 +476,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>>           _FDT((fdt_setprop(fdt, stk_offset, "compatible", pecc->stk_compat,
>>                             pecc->stk_compat_size)));
>>           _FDT((fdt_setprop_cell(fdt, stk_offset, "reg", i)));
>> -        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb->phb_id)));
>> +        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb_id)));
>>       }
>>       return 0;
>>
> 

