Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E672D5891CB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:52:43 +0200 (CEST)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJIXy-0002bR-Ov
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJIH2-0000jO-55; Wed, 03 Aug 2022 13:35:12 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:43713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJIH0-0008Sf-HN; Wed, 03 Aug 2022 13:35:11 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id w129so9018143vkg.10;
 Wed, 03 Aug 2022 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=0Dtu9rbQzBbc4o7WF/n39vsJGnKY+QSYZCdZtHwROcU=;
 b=VR2FuChtsB6rqDa8ISV4gx4p1JiQghgP2cfDb2OBfA1ATq0p8ZGCOiH+IATlaHwNq7
 newv4slbriHgt+1OPQpClPmTrHVurIIrqlnCgZxBIK4GOo+AiOzVlkibsC/5H5OkLDDY
 113BC3d2xAYMAYeEWmJYRHApaEPqHrOy3dInVny5bGbih5VGdiyrZmfuf9Y3CX5dgtsT
 TMRLZIs5sZ2krdfANpT150DCB8oMjUKglh0JjKAdo+D0SOk5b5LGhtf2H6bJsz1t3aaV
 0YblC95OdzsVAKZRYq1QYM5iscbOagiL8Q1wetWUvQDlpCCsG+O11PSjtK54VSdh/TkF
 Ojtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=0Dtu9rbQzBbc4o7WF/n39vsJGnKY+QSYZCdZtHwROcU=;
 b=IA2U5KKIzfPcT2z5sJTC8QgPtTIF7kN1BxW3HxumC+ak6aATcTIw6nKBDp2Ix36LJl
 YwU89Goaik6WT8+ub+owboFFfDgkKeZPiEA3tjjBO9FibhO49RvrgPD0qmqfZcw6V5Ys
 Q20sdDCjF/zxYglk62RMtAN+ltfqcP6LOuE03bRiEg81uj+QfDGhKMgSrzXpOs4OJR8t
 NUZ9bd0gIUhX5IHKEEy6VwOX6vkRR06G3ddk6hQNyxQhApG9tuC+sfciIm3qnWe8SuCV
 LySwZGrTg6P4NmOBPBb/Tg8DP5JMljwaKXneN5OItigeIAfEE/kw+dxmjZjxtGzws5rW
 XwJQ==
X-Gm-Message-State: AJIora+dnRw8MnWEad5WW12ZqBfKPnoAsI6PF5xMahm8rVY1uQqYJO/3
 DaOXFCHmp3FSIZ6euB1WzNF5thxRlbw=
X-Google-Smtp-Source: AGRyM1u+hokMhRFdKqr6LXxEpuMnl1yOhL+0JRFGXDiEObDrozHoUbDIOU6C35sacRB87+QFUYxcwA==
X-Received: by 2002:a1f:c687:0:b0:374:9549:741b with SMTP id
 w129-20020a1fc687000000b003749549741bmr10405126vkf.16.1659548109077; 
 Wed, 03 Aug 2022 10:35:09 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 p131-20020a1fa689000000b00376a19173e9sm10400086vke.26.2022.08.03.10.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 10:35:08 -0700 (PDT)
Message-ID: <b60aafb7-c8a7-b330-5769-bac19f8e40ee@gmail.com>
Date: Wed, 3 Aug 2022 14:35:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/20] ppc/ppc405: Introduce a PPC405 generic machine
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-3-clg@kaod.org>
 <c34b7697-bc8f-85a8-9f99-daa7d667a584@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <c34b7697-bc8f-85a8-9f99-daa7d667a584@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2e.google.com
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



On 8/3/22 14:03, BALATON Zoltan wrote:
> On Wed, 3 Aug 2022, Cédric Le Goater wrote:
>> We will use this machine as a base to define the ref405ep and possibly
>> the PPC405 hotfoot board as found in the Linux kernel.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405_boards.c | 31 ++++++++++++++++++++++++++++---
>> 1 file changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 1a4e7588c584..4c269b6526a5 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -50,6 +50,15 @@
>>
>> #define USE_FLASH_BIOS
>>
>> +struct Ppc405MachineState {
>> +    /* Private */
>> +    MachineState parent_obj;
>> +    /* Public */
>> +};
>> +
>> +#define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405MachineState, PPC405_MACHINE);
> 
> In other patches the declaration of the state struct comes after the OBJECT_DECLARE macro so here instead of above. It would be better to write it like that here too for consistency and also because then the DECLARE macro starts the object declaration and everything belonging to the object are together below it. Declaring the structure before is kind of outside the object, although this is only cosmetic and may be a matter of style.

Good point. I moved the struct declaration to after the OBJECT_DECLARE macro.


Thanks,

Daniel

> 
> Regards,
> BALATON Zoltan
> 
>> +
>> /*****************************************************************************/
>> /* PPC405EP reference board (IBM) */
>> /* Standalone board with:
>> @@ -332,18 +341,34 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
>>
>>     mc->desc = "ref405ep";
>>     mc->init = ref405ep_init;
>> -    mc->default_ram_size = 0x08000000;
>> -    mc->default_ram_id = "ef405ep.ram";
>> }
>>
>> static const TypeInfo ref405ep_type = {
>>     .name = MACHINE_TYPE_NAME("ref405ep"),
>> -    .parent = TYPE_MACHINE,
>> +    .parent = TYPE_PPC405_MACHINE,
>>     .class_init = ref405ep_class_init,
>> };
>>
>> +static void ppc405_machine_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +
>> +    mc->desc = "PPC405 generic machine";
>> +    mc->default_ram_size = 0x08000000;
>> +    mc->default_ram_id = "ppc405.ram";
>> +}
>> +
>> +static const TypeInfo ppc405_machine_type = {
>> +    .name = TYPE_PPC405_MACHINE,
>> +    .parent = TYPE_MACHINE,
>> +    .instance_size = sizeof(Ppc405MachineState),
>> +    .class_init = ppc405_machine_class_init,
>> +    .abstract = true,
>> +};
>> +
>> static void ppc405_machine_init(void)
>> {
>> +    type_register_static(&ppc405_machine_type);
>>     type_register_static(&ref405ep_type);
>> }
>>
>>

