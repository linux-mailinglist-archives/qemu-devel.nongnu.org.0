Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7EB697838
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 09:32:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSDC7-00005V-85; Wed, 15 Feb 2023 03:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSDC5-0008WQ-62
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:31:13 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSDC3-0001NW-6C
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:31:12 -0500
Received: by mail-wm1-x32d.google.com with SMTP id r18so12727441wmq.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 00:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z2hzSr7UXLIXKF2T1HfXTbcEOIANb+dwOOB5fvD5Q6w=;
 b=aKqND9pxwCYu/xvwqy22xTRGArkqbweepEMwUYOA0Td4WueWpu2FQAaxmveTf5Mk8h
 IKAzbLPd81MObhpkdrHtWdjUxaAKnuO6oc9tjj08PXXX5gbf/Xl4yxVsB4dT2g1RyXAw
 mFv6uvgtn5w+h2YIxoI1Y7MHM7uLV/4UOklxYmzkATFqAuandv57wAGDFnvmGi5X2RBe
 BZ+q+9MxpvwkfOW2UtQRA16s+h4dgBUABb1esd45KHLSx3JKWy1bSPZptaIxzuT2QdVU
 +lpoqgHz/iHZSGfdvVUUhxyjZtG56h8GH3ROi3SU/AWQOxn+X7+0vVD8h5Vl7ekIoJVl
 S0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2hzSr7UXLIXKF2T1HfXTbcEOIANb+dwOOB5fvD5Q6w=;
 b=oLLjMDrN3jmWt6CQzAFZqcIgOGTdSH7UGi8YvUO4VFArMr4FuaJXIitohaZOAqxtF0
 tkXIkRYao0gVHT+AR3aif5Xfh03Vl0cQjZprQkWNcot/PIqCl5gFilypbMBb9PfyO8mn
 VMvV7Vwa1vLK5SRGhQzJoJ72Su2wmhNjHa7ybwLGuLOTv0eoaiFXfVEAmeQMJy0qjz22
 L5WMrpamauidcDbbkXsjeWKdYhsqc08mkM3QkqxcsMMNGD9SswE99+3HCkClArSRIlIM
 oD8EDzeZKOUi2vC4mHOtpSplGXlkNBLT/ARZqxo/YnqNDym9T1YWC0R47Ke37pHY+5Uy
 6ORQ==
X-Gm-Message-State: AO0yUKUbB5y5rTTowsXc/QGmvvTNjQZET4h3+wbqn8b6e6f5XykAmgg+
 OdYdoQZ3yxcP4HDnVXIFsXWZuA==
X-Google-Smtp-Source: AK7set8fKunGfacpJvZliWFfjReMyKD/GAZaQ6g4lEJF3w4xu6h/tzoDvNKu0738DyYpA2amlmtklQ==
X-Received: by 2002:a05:600c:448a:b0:3e1:f8af:8da4 with SMTP id
 e10-20020a05600c448a00b003e1f8af8da4mr1360389wmo.1.1676449867155; 
 Wed, 15 Feb 2023 00:31:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c205100b003dc51c48f0bsm1330241wmg.19.2023.02.15.00.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 00:31:06 -0800 (PST)
Message-ID: <ca79646e-237c-78f6-9e6d-d28a4fdcf978@linaro.org>
Date: Wed, 15 Feb 2023 09:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] target/s390x/arch_dump: Simplify memory allocation in
 s390x_write_elf64_notes()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, frankja@linux.ibm.com
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230215054834.726355-1-thuth@redhat.com>
 <a8cc2a89-c34e-986b-eaa0-317db14228f8@linaro.org>
 <0f7d28f5-03ff-3a39-d308-de8ff696616e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0f7d28f5-03ff-3a39-d308-de8ff696616e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/2/23 08:26, Thomas Huth wrote:
> On 15/02/2023 08.10, Philippe Mathieu-Daudé wrote:
>> On 15/2/23 06:48, Thomas Huth wrote:
>>> We are not on a hot path here, so there is no real need for the logic
>>> here with the split heap and stack space allocation. Simplify it by
>>> always allocating memory from the heap.
>>>
>>> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   Based-on: <20230214141056.680969-1-thuth@redhat.com>
>>>
>>>   target/s390x/arch_dump.c | 20 ++++++--------------
>>>   1 file changed, 6 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
>>> index a7c44ba49d..84e17effda 100644
>>> --- a/target/s390x/arch_dump.c
>>> +++ b/target/s390x/arch_dump.c
>>> @@ -227,25 +227,23 @@ static int s390x_write_elf64_notes(const char 
>>> *note_name,
>>>                                          DumpState *s,
>>>                                          const NoteFuncDesc *funcs)
>>>   {
>>> -    Note note, *notep;
>>> +    g_autofree Note *notep = NULL;
>>>       const NoteFuncDesc *nf;
>>> -    int note_size, content_size;
>>> +    int note_size, prev_size = 0, content_size;
>>
>> We can start with:
>>
>>    prev_size = sizeof(Note);
>>
>> If this goes thru your tree, feel free to modify without respining.
> 
> But then I'd also need to initialize notep above differently, don't I?
> And if I've got it right, this function sometimes also deals with chunks 
> that are smaller, so I think it's cleaner if we start with zero instead 
> of sizeof(Note).

Oh you are right. We are good then!

>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Thanks!
> 
>   Thomas
> 


