Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA42588245
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 21:09:28 +0200 (CEST)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIxGh-0006jo-QD
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 15:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oIxET-0003qn-Ia; Tue, 02 Aug 2022 15:07:09 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:33420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oIxER-0001na-R6; Tue, 02 Aug 2022 15:07:09 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 e2-20020a4ab982000000b004354ba9a591so2677660oop.0; 
 Tue, 02 Aug 2022 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=on+9djOJkrQCi3KBefeuUJciiDdZjgIUmuv54oRcST0=;
 b=f3q1HLMntF6DHvwFZASzSsAzC0UkNDJa4Y21MdC3yZby58CSYnQEzK7NHyBFKKKjcZ
 l8pkZElBtTNfrKE4bJHi6MAfwCavHNRp4VLJ6p/WPrO3whsaKhNrEDjyCGkPFgHkH7Pa
 6dqnAAqwwMCA4xUVDpczPy5vxFCXpaqFfrm2dQOa8zPaAbiomXje2ggBmJ/3U0sEj7wl
 3pP/ZJVd9eQw6jTlGD5PwDrPqvozQ63R6pnUIyeHgtCUJxniWMb1+3lJVgboU8TUDCgz
 VsNPrz2fA6mz62IwDci5mZ92eO46BIQC0PPuiTijoEKsKu1/7ClsNPbt+03LNp67j9WF
 XANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=on+9djOJkrQCi3KBefeuUJciiDdZjgIUmuv54oRcST0=;
 b=ucKWs9ywJB0QzzkLcLc64FWbIwK1K9VmMfQv9SBaVwh/miCT3JgQKLKl1hs6bHyQBs
 E22MCQnUjb+Vi58lU8h+1L1cYWh6n5LWwmY0R85Ighx+3Rzg8f5I/XZSxBONKvHiLBkp
 c4IHlnZOV0kNBeYNgjBT4Jxlbc6hUnwOgUqllbhOWYsj3HoiMvSkTBj3Uqj59u40fKjP
 M9nz41S8dfz7kQPHNk1gYSW17TCLOVuzWgJHQ2SwLaPYavothPnhXzuN4JxvIzTiWzMu
 jcsVhhidow557z6k/ozCm+fDTcqxlgZ3I9+fG9rGoNL506bsWnT2DU23wCD1hwTf9VIM
 4R0Q==
X-Gm-Message-State: AJIora/e2B5UrceLYl1CzgMitvjaHCRGVlOpoaggbIkrA9t1DtGXuuQs
 0Q/rDlOzV7uSg1+tz5ivpuM=
X-Google-Smtp-Source: AGRyM1vFoK53hOf9+ttsM1NahgXvKiUssLr2pCGOeICxll5x1H9I+239BoS4xp1NQ30OC+uiwWPQrA==
X-Received: by 2002:a4a:c113:0:b0:435:4ce0:9794 with SMTP id
 s19-20020a4ac113000000b004354ce09794mr7180982oop.87.1659467226231; 
 Tue, 02 Aug 2022 12:07:06 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056808130400b0033a2f6e4736sm3160256oiv.20.2022.08.02.12.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 12:07:05 -0700 (PDT)
Message-ID: <f7842a60-3aaf-6a8d-4abb-ede45fd2c381@gmail.com>
Date: Tue, 2 Aug 2022 16:07:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/19] ppc/ppc405: Introduce a PPC405 generic machine
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-3-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc32.google.com
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



On 8/1/22 10:10, Cédric Le Goater wrote:
> We will use this machine as a base to define the ref405ep and possibly
> the PPC405 hotfoot board as found in the Linux kernel.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/ppc/ppc405_boards.c | 31 ++++++++++++++++++++++++++++---
>   1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 1a4e7588c584..4c269b6526a5 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -50,6 +50,15 @@
>   
>   #define USE_FLASH_BIOS
>   
> +struct Ppc405MachineState {
> +    /* Private */
> +    MachineState parent_obj;
> +    /* Public */
> +};
> +
> +#define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405MachineState, PPC405_MACHINE);
> +
>   /*****************************************************************************/
>   /* PPC405EP reference board (IBM) */
>   /* Standalone board with:
> @@ -332,18 +341,34 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
>   
>       mc->desc = "ref405ep";
>       mc->init = ref405ep_init;
> -    mc->default_ram_size = 0x08000000;
> -    mc->default_ram_id = "ef405ep.ram";
>   }
>   
>   static const TypeInfo ref405ep_type = {
>       .name = MACHINE_TYPE_NAME("ref405ep"),
> -    .parent = TYPE_MACHINE,
> +    .parent = TYPE_PPC405_MACHINE,
>       .class_init = ref405ep_class_init,
>   };
>   
> +static void ppc405_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "PPC405 generic machine";
> +    mc->default_ram_size = 0x08000000;
> +    mc->default_ram_id = "ppc405.ram";


I don't mind changing the default_ram_id from "ef405ep.ram" to "ppc405.ram",
but since we're renaming it, might as well rename the remaining instances
of ef405ep.ram:

$ git grep 'ef405ep.ram'
hw/ppc/ppc405_uc.c:                             "ef405ep.ram.alias", s->dram_mr, 0, s->ram_size);
hw/ppc/ppc405_uc.c:    memory_region_init(&s->ram_memories[1], OBJECT(s), "ef405ep.ram1", 0);


I believe these can be renamed to "ppc405.ram.alias" and "ppc405.ram1" in
patch 05.


Thanks,


Daniel


> +}
> +
> +static const TypeInfo ppc405_machine_type = {
> +    .name = TYPE_PPC405_MACHINE,
> +    .parent = TYPE_MACHINE,
> +    .instance_size = sizeof(Ppc405MachineState),
> +    .class_init = ppc405_machine_class_init,
> +    .abstract = true,
> +};
> +
>   static void ppc405_machine_init(void)
>   {
> +    type_register_static(&ppc405_machine_type);
>       type_register_static(&ref405ep_type);
>   }
>   

