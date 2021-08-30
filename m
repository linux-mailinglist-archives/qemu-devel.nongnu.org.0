Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CC63FBC63
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 20:25:54 +0200 (CEST)
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKlyi-0000ng-LZ
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 14:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mKlxU-0008NX-Gg; Mon, 30 Aug 2021 14:24:36 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mKlxS-0004DP-Nx; Mon, 30 Aug 2021 14:24:36 -0400
Received: by mail-qk1-x734.google.com with SMTP id y144so16703045qkb.6;
 Mon, 30 Aug 2021 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AtQwt1UcEp/Bvkaw/DJPs2udJU5uNU3LetZTq1jgzys=;
 b=I+UXmyhqzG57tFpfWNX6yAEMCTl78Nrq04B22p7uAmlPS/oHSDTuesXg7ohA8jWP2R
 SQZCmkofWrW9SfkQkJP/LJfC0m3dVr44M2kR3eD5eEa7rkGy1MOQ2dnL8v+py4ICOwER
 ndl4XySP25WBoy8k28Ngm9mJyC5I7/V3Ig4NNAQ5VTKTEiIm8Ul9Ym0+iaS640n4qRU/
 RyGlFh+re1iYJyodlfPPsep0m1Ww5l5eM0zphgqjJoRmHsMk09GxZx4YgSiY8oS+Y3NX
 3I5d6/af0rCD+dSCVg/CfSX3O3NYlkq/VdOaKau94WIRPjdln7avBRlsgZNwpT3eXaiJ
 Uslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AtQwt1UcEp/Bvkaw/DJPs2udJU5uNU3LetZTq1jgzys=;
 b=jVCIFsNTGRRMiYRPvsce7HSJWiZScxTN7HBp5MHODb0E8Rh8c1cBFRKGfzMtOhtvhr
 ca7Clh6xpcfyf6xqC3Tyte44Wnt4BDnCxzbMT1Mq6VWI72y6ykEDR/nZAf2xelXRf2ne
 n0FnZCxWnVv2cY/S2C0YDT+Rk/SPu1B/WZGXTv5IoeXB3tt56QuVnRNceg/QNaLIa/v9
 +usFYTbsjOA0Epc+OqQf3DuJxMMIHge3TP7u32PMRgTVAIT6y2uDZZCFehtFNe2QSyMf
 L4L81JFHwGIW9KP+/7dNWA8g8Zbis6TK9k5hG2mEbtZC3t53ExkaScaTMG97lAZVwqoe
 KnRw==
X-Gm-Message-State: AOAM530TVNONjQgren/uphUgJ+O3RtyeKr0qf5ByrLzTlL58/C4sgP0w
 ndySl33ihIEqOVRiVUp9L2hpEC2uQqE=
X-Google-Smtp-Source: ABdhPJxvZyz+JD1JWB/ov5zKrznuJnqrmhPZBp5BqPGfbsYc1UvqlpW7fJaoJObPYunkJAhCm3WJmQ==
X-Received: by 2002:a05:620a:12d3:: with SMTP id
 e19mr23601810qkl.501.1630347872452; 
 Mon, 30 Aug 2021 11:24:32 -0700 (PDT)
Received: from [192.168.10.222] ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id l13sm8857157qtr.67.2021.08.30.11.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 11:24:32 -0700 (PDT)
Subject: Re: [PATCH v4 1/5] hw, spapr: add 6.2 compat pseries machine
To: Greg Kurz <groug@kaod.org>
References: <20210827092455.125411-1-danielhb413@gmail.com>
 <20210827092455.125411-2-danielhb413@gmail.com>
 <20210830093446.0b80edfb@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <ffc25d9d-fe08-9f91-e87d-cded03e8681f@gmail.com>
Date: Mon, 30 Aug 2021 15:24:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830093446.0b80edfb@bahia.lan>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/30/21 4:34 AM, Greg Kurz wrote:
> On Fri, 27 Aug 2021 06:24:51 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
> 
> We usually introduce the compat machine types for all archs in a
> single patch. One was already posted for 6.2 :
> 
> https://patchwork.ozlabs.org/project/qemu-devel/patch/20210823122804.7692-7-wangyanan55@huawei.com/

We can discard this patch. The rest of the series will play ball with
the official 6.2 machine type patch later on.


Thanks,


Daniel

> 
> 
>>   hw/core/machine.c   |  3 +++
>>   hw/ppc/spapr.c      | 15 +++++++++++++--
>>   include/hw/boards.h |  3 +++
>>   3 files changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 54e040587d..067f42b528 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -37,6 +37,9 @@
>>   #include "hw/virtio/virtio.h"
>>   #include "hw/virtio/virtio-pci.h"
>>   
>> +GlobalProperty hw_compat_6_1[] = {};
>> +const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
>> +
>>   GlobalProperty hw_compat_6_0[] = {
>>       { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>>       { "i8042", "extended-state", "false"},
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 81699d4f8b..d39fd4e644 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -4685,15 +4685,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>>       }                                                                \
>>       type_init(spapr_machine_register_##suffix)
>>   
>> +/*
>> + * pseries-6.2
>> + */
>> +static void spapr_machine_6_2_class_options(MachineClass *mc)
>> +{
>> +    /* Defaults for the latest behaviour inherited from the base class */
>> +}
>> +
>> +DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
>> +
>>   /*
>>    * pseries-6.1
>>    */
>>   static void spapr_machine_6_1_class_options(MachineClass *mc)
>>   {
>> -    /* Defaults for the latest behaviour inherited from the base class */
>> +    spapr_machine_6_2_class_options(mc);
>> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>>   }
>>   
>> -DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
>> +DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
>>   
>>   /*
>>    * pseries-6.0
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index accd6eff35..463a5514f9 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -353,6 +353,9 @@ struct MachineState {
>>       } \
>>       type_init(machine_initfn##_register_types)
>>   
>> +extern GlobalProperty hw_compat_6_1[];
>> +extern const size_t hw_compat_6_1_len;
>> +
>>   extern GlobalProperty hw_compat_6_0[];
>>   extern const size_t hw_compat_6_0_len;
>>   
> 

