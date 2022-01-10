Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A5489DA1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:33:02 +0100 (CET)
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xbR-0006kM-DQ
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:33:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6xWV-00035B-TY; Mon, 10 Jan 2022 11:27:56 -0500
Received: from [2607:f8b0:4864:20::930] (port=37737
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6xWU-0000cC-C4; Mon, 10 Jan 2022 11:27:55 -0500
Received: by mail-ua1-x930.google.com with SMTP id o1so24416574uap.4;
 Mon, 10 Jan 2022 08:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qswtwHeCmAa44jEcAE1pYeajWTmbBQp63Abmb+Ar/+U=;
 b=nV0PU+kZnEM7wjnmL0x1v8tSaLuGfK2y1+8N/Jrx5jEr9Kd4Vk+bd7nCYRWR+RSBvl
 m6VBQbKzugMKCxxydtNxdZG20tV04kSPpDGwObcmL8lASc26LSaj8XtuXlT26jfZnerc
 d8hG9TVBO4fQBVY287A7LzfZ0Ji5uRQiUZ74QlTw+CGImsU8hR7PCBlhrR7ijn5z7PEt
 TnDiPut5xJDSrxOUchUcbDHJ47EFzJoLr6UMyu5j660rfDiIUjW3uY/TOaLvcxY+J3RX
 p6hLktzurawu8Aub7pPIrnHn2fsQXK8pMMUmrXknbkR54Env8M977SRw2tundlN9mloy
 GZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qswtwHeCmAa44jEcAE1pYeajWTmbBQp63Abmb+Ar/+U=;
 b=vm3G+rTI1167hIlibjMwlPGiGYXcA89ZeiVKFXuc4fZM2ut2a8fcA7r/Aonq8NKyPy
 DgvPlJ+a5ZjQiaP+Y2jrxM3YZPwBZly0jqjqtX+ZEwnYDeoz5qkizrHuvpQkjJsYtAV+
 ACtUUd8JGoqiujt1GPN9rgf7zfK668XI6H5e4U8NF1uoGRx8c8bZOySj8yQHC6D984wL
 BfX/E7UfuYu1HGjrHKVzqYcgUwri3bbJTluUMOcaYKdR/mUTVKjJxJZU+ygEtkPYMXsM
 iW63fvQbymxUtJ9rG+hvOZTIU4zJGjXxKzgRHm8uBvtL7GkjfVsZgndCSXnmBj+UFWSi
 DGLw==
X-Gm-Message-State: AOAM533SeWlTMmpVsWSLALuHu7dEt/x6KB/G3DNhb640LEvbGvqf1C5b
 ooi/Dxwnw3z3mX44G5Gv/V0=
X-Google-Smtp-Source: ABdhPJw30/Rx0Csl1mApa3j+XQJ3xytHKLn6IQBH5+G8vC4OMsyPBlOJdzxg518wBfKqwtHOJoMKfg==
X-Received: by 2002:ab0:a90:: with SMTP id d16mr218483uak.69.1641832073097;
 Mon, 10 Jan 2022 08:27:53 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 7sm3406448uan.19.2022.01.10.08.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 08:27:52 -0800 (PST)
Message-ID: <4324b472-bb59-75f7-2998-a0f9ba8f5aa3@gmail.com>
Date: Mon, 10 Jan 2022 13:27:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 04/10] pnv_phb4_pec.c: remove stack 'phb-id' alias
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220110143346.455901-1-danielhb413@gmail.com>
 <20220110143346.455901-5-danielhb413@gmail.com>
 <c47df0e6-818e-db2c-6538-af22f4b459ab@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <c47df0e6-818e-db2c-6538-af22f4b459ab@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 1/10/22 12:49, Cédric Le Goater wrote:
> On 1/10/22 15:33, Daniel Henrique Barboza wrote:
>> This alias is a indirect way of setting stack->phb->index. Since we have
>> access to a valid stack->phb (for default_enabled() at least - next
>> patch will deal with it accordingly) we can directly set the phb 'index'
>> attribute.
>>
>> Let's also take the opportunity to explain why we're having to deal with
>> stack->phb attributes during pec_realize().
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb4_pec.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 1f264d0a9c..417fac4cef 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -395,8 +395,17 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>>           int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
>>           object_property_set_int(stk_obj, "stack-no", i, &error_abort);
>> -        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
>>           object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
>> +
>> +        /*
>> +         * stack->phb->index is dependent on the position the
>> +         * stack occupies in pec->stacks[]. We have this information
>> +         * available here via the 'i' iterator so it's convenient to
>> +         * do it now.
>> +         */
>> +        object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
>> +                                &error_abort);
> 
> I don't like the fact that we are exposing ->phb under the PEC model.
> It looks like this is going to be a problem afterwards when defaults
> are disabled.
> 
> We should move the setting of the PHB ID under pnv_pec_stk_realize()
> before the PHB is realized and compute the id with :
> 
>         int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);


Oh, if stack->stack_no is the stack index of the pec->stacks[] array then we should
instead move all this stuff into phb4_realize().


Daniel


> 
> Thanks,
> 
> C.
> 
>> +
>>           if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
>>               return;
>>           }
>> @@ -534,7 +543,6 @@ static void pnv_pec_stk_instance_init(Object *obj)
>>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
>>       object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
>> -    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
>>   }
>>   static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>>
> 

