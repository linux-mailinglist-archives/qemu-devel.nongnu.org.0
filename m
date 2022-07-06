Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C96569061
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:13:06 +0200 (CEST)
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o98aH-0004Zb-Fa
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o98Xk-0002hF-La; Wed, 06 Jul 2022 13:10:30 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:46731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o98Xi-0003CK-QS; Wed, 06 Jul 2022 13:10:28 -0400
Received: by mail-ua1-x92f.google.com with SMTP id n3so3455138uak.13;
 Wed, 06 Jul 2022 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZFYJzjTPDvC676/lPHPSiBu/bo6K5OyS+d88rwQXyIk=;
 b=JJ4wYddTMG8dxXMbbjnnpfw1GYEk1eqhzgVuqd9yDpl9S5OSOLeIUDwsJ6aFFkTKyM
 EF20jYhqZfZLIKBEum0fdLKTFvhd5fb33mFXfHhNJYjw99otzBD0hkct/W3L0l5McWNW
 +Ch5ebL7T5D/QNa3Qy6LrGdR7Oj1k7PyEvNr59EOmjOg1ioerESPjpwCf7ScS24iYTRx
 WSsR6VjIGanRxtYHcBXk2GIHSBV9dFEvG9r1A41m6ntaDo8S5ZNFDu3hDguS08edYQRC
 49IIqhL4JKabg+BdCZDaDLBG+z8WWt5r7BoTG7cEOQbv+4799Vjhux1oWY2cikJr+aZ5
 OmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZFYJzjTPDvC676/lPHPSiBu/bo6K5OyS+d88rwQXyIk=;
 b=JsGjhq7d1z7Ng2YPbft9OhS/HoatOolbuFoyrnWEjQ/vI9vDvtkZG6CcQVWY5+VFMF
 MMfXVEcM7rEVYrpCfEq03lhHpyKWyqmknt1P12EjNvfAsqi0lGwvuGPMrToTZNOW62Wo
 nVti8lL4ep+EAr0/cSe9xQxF9NHj78BE57iw+vYWoFjucubj+PSq8xjZKpx0jKiGEr7E
 X1tJxqKPOSkvSo/up19JDZompC58emGQP/KoLCDk7WoOXuhPP9emeQjGuBsGpIUbiyLa
 8XXpKN6k3i30V4c6IiqTs2T3eAUEp8upu+9nMwRFleEDKgVqj3DCZvSd2MnlIhSit1iV
 SelA==
X-Gm-Message-State: AJIora9PLcX/Z/iIBOoEN7ptFHaV4g8u9Q66COkXwAOhJ8Sui3Lt5DEq
 OW9oilf7Tr10N0aUqL68lOpjgUjvsSw=
X-Google-Smtp-Source: AGRyM1sa5QV5Vxuvy4UOhQMatn7l1Q2qS0Y2Vuskold7UZoLt0S7cUy0CI7QG2qi+Tz2JOZF5RsBmA==
X-Received: by 2002:a9f:36b0:0:b0:382:7c31:6c2c with SMTP id
 p45-20020a9f36b0000000b003827c316c2cmr9512294uap.41.1657127425460; 
 Wed, 06 Jul 2022 10:10:25 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 n20-20020a05610203d400b003542a13134fsm7873428vsq.33.2022.07.06.10.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 10:10:25 -0700 (PDT)
Message-ID: <e59d5189-a58d-49e4-fa45-6d4c843a3481@gmail.com>
Date: Wed, 6 Jul 2022 14:10:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/9] target/ppc: use g_autofree in kvmppc_read_int_cpu_dt()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-5-danielhb413@gmail.com>
 <dd2710cb-cdbf-da9b-9557-07c5234ed5fe@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <dd2710cb-cdbf-da9b-9557-07c5234ed5fe@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92f.google.com
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



On 7/2/22 03:20, Cédric Le Goater wrote:
> On 6/30/22 21:42, Daniel Henrique Barboza wrote:
>> This spares us a g_free() call. Let's also not use 'val' and return the
>> value of kvmppc_read_int_dt() directly.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/kvm.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index 7611e9ccf6..c218380eb7 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -1932,8 +1932,8 @@ static uint64_t kvmppc_read_int_dt(const char *filename, Error **errp)
>>    */
>>   static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>>   {
>> -    char buf[PATH_MAX], *tmp;
>> -    uint64_t val;
>> +    g_autofree char *tmp = NULL;
> 
> I think you need to assign g_autofree variables where they are declared.

We need to initialize the var with something, not necessarily with the value we're
going to use. Initializing with 'NULL' works.


Thanks,


Daniel

> 
> C.
> 
>> +    char buf[PATH_MAX];
>>       if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
>>           error_setg(errp, "Failed to read CPU property %s", propname);
>> @@ -1941,10 +1941,8 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>>       }
>>       tmp = g_strdup_printf("%s/%s", buf, propname);
>> -    val = kvmppc_read_int_dt(tmp, errp);
>> -    g_free(tmp);
>> -    return val;
>> +    return kvmppc_read_int_dt(tmp, errp);
>>   }
>>   uint64_t kvmppc_get_clockfreq(void)
> 

