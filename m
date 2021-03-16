Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994AB33D73F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:22:40 +0100 (CET)
Received: from localhost ([::1]:58722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBWp-0006hu-M3
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMBV4-000598-NV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:20:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMBV1-0002Xl-2l
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615908045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KIGLa/sf+HIhoA0MAms1aH/HuMOl0M/JGu4GuaeB1FA=;
 b=H9LlqOM50uXKk8NAntl0iSE8X3HXmlEbqyaevFkCLchgESlH5RpndFn804oKufw2kp9lcC
 cZ47O9gtpFvJsvcPefGJsrVQJZ1GpG315IdtQCmR12gxKK5zeEXc5p8ncPskkUqXR1B3kL
 oHm3KoGE17MLfUhvoSJ7o8eN14szEv4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-DQZ9BVj_NJSW4IAm2CdDyA-1; Tue, 16 Mar 2021 11:20:43 -0400
X-MC-Unique: DQZ9BVj_NJSW4IAm2CdDyA-1
Received: by mail-wr1-f69.google.com with SMTP id m23so11813034wrh.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KIGLa/sf+HIhoA0MAms1aH/HuMOl0M/JGu4GuaeB1FA=;
 b=hq4iCCMgtGUfOyZ1jfGLVcXRUMxHqEvSXqM8Z+yEI4b84e0XreqQ2lLdm/xXOInKzv
 wvvBFXAvgEVRFYjeuRVmR7wxNkrz5kLMY1owvVUtu82swd8qm8ZSfS9j+XL3BVErNwqY
 jhapdTTmiGUXifN1Pq1M6Y87p683HWEd0EqZs2BRsMAj/uQmAT5qumbl4r2rwz6/JwP8
 B7/CT3Ey7wBQlG/bOoCjg0ERx8gB7F5Y2RCjfLQKhnaCbZmSzA1UTG2gCjS7CzNPJYfJ
 lacbgTjki6PWsG0U1MRVa4Le5QcEM9qbmhJ+rhoARJQZF4WTQ2BRqN6EBUTcEKaLS3/b
 TSBw==
X-Gm-Message-State: AOAM532Cf4wULanaEGAqG8smt6oGv3VmrnYyZ7k+zhBYlA0oI2UyPtom
 3/3bG9OfJCtbvZCm2PgGgKHEw62Grr4WRvnm1DHJJ2dYTTNusG3segIjYEwxemV0R2zgm0nNPDn
 2NFDFWyGBNROyI/g=
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr161889wmc.65.1615908042458;
 Tue, 16 Mar 2021 08:20:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0pNQhNON1NBBB5Tkv76aB0WPlbJZdKqV28kZ5rQtSyCapmGzw4fGI4avlb+XOzuCBff4Ltg==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr161861wmc.65.1615908042253;
 Tue, 16 Mar 2021 08:20:42 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j30sm24955190wrj.62.2021.03.16.08.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:20:41 -0700 (PDT)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
 <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
 <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
 <74d442cd-5e39-f9a4-6ca5-e2656280aa73@redhat.com>
 <875z1rl18h.fsf@dusky.pond.sub.org>
 <57f03668-a73a-32f2-bce8-4d70a13ccf77@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d7422fac-fa3d-f220-aea6-184b7d711b1f@redhat.com>
Date: Tue, 16 Mar 2021 16:20:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <57f03668-a73a-32f2-bce8-4d70a13ccf77@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 1:48 PM, Thomas Huth wrote:
> On 16/03/2021 13.41, Markus Armbruster wrote:
>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>
>>> On 3/16/21 11:26 AM, Philippe Mathieu-Daudé wrote:
>>>> On 3/16/21 10:02 AM, Philippe Mathieu-Daudé wrote:
>>>>> On 3/16/21 7:51 AM, Markus Armbruster wrote:
>>>>>> Eric Blake <eblake@redhat.com> writes:
>>>>>>
>>>>>>> On 3/11/21 5:11 PM, Philippe Mathieu-Daudé wrote:
>>>>>> [...]
>>>>>>>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>>>>>>>> new file mode 100644
>>>>>>>> index 00000000000..f16e49b8956
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/accel/accel-qmp.c
>>>>>>>> @@ -0,0 +1,47 @@
>>>>>>>> +/*
>>>>>>>> + * QEMU accelerators, QMP commands
>>>>>>>> + *
>>>>>>>> + * Copyright (c) 2021 Red Hat Inc.
>>>>>>>> + *
>>>>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +#include "qemu/osdep.h"
>>>>>>>> +#include "qapi/qapi-commands-machine.h"
>>>>>>>> +
>>>>>>>> +static const Accelerator accel_list[] = {
>>>>>>>> +    ACCELERATOR_QTEST,
>>>>>>>> +#ifdef CONFIG_TCG
>>>>>>>> +    ACCELERATOR_TCG,
>>>>>>>> +#endif
>>>>>>>> +#ifdef CONFIG_KVM
>>>>>>>> +    ACCELERATOR_KVM,
>>>>>>>> +#endif
>>>>>>>
>>>>>>> ...would it be worth compiling the enum to only list enum values
>>>>>>> that
>>>>>>> were actually compiled in?  That would change it to:
>>>>>>>
>>>>>>> { 'enum': 'Accelerator',
>>>>>>>    'data': [ 'qtest',
>>>>>>>              { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>>>>>>> ...
>>>>>
>>>>> These accelerator definitions are supposed to be poisoned in generic
>>>>> code... But I like the simplicity of your suggestion, so I'll give it
>>>>> a try and see what happens with removing the poisoned definitions.
>>>>
>>>> This is actually quite interesting :) Accelerator definitions are
>>>> declared in config-target.h, but acceleration is host specific...
>>>
>>> Thomas, I guess I hit Claudio's reported bug again...
>>>
>>> 1/ generic libqemuutil.a is built without any CONFIG_accel definition.
>>>
>>> So this qapi-generated enum ... :
>>>
>>> typedef enum Accelerator {
>>>      ACCELERATOR_QTEST,
>>> #if defined(CONFIG_TCG)
>>>      ACCELERATOR_TCG,
>>> #endif /* defined(CONFIG_TCG) */
>>> #if defined(CONFIG_KVM)
>>>      ACCELERATOR_KVM,
>>> #endif /* defined(CONFIG_KVM) */
>>> #if defined(CONFIG_HAX)
>>>      ACCELERATOR_HAX,
>>> #endif /* defined(CONFIG_HAX) */
>>> #if defined(CONFIG_HVF)
>>>      ACCELERATOR_HVF,
>>> #endif /* defined(CONFIG_HVF) */
>>> #if defined(CONFIG_WHPX)
>>>      ACCELERATOR_WHPX,
>>> #endif /* defined(CONFIG_WHPX) */
>>> #if defined(CONFIG_XEN_BACKEND)
>>>      ACCELERATOR_XEN,
>>> #endif /* defined(CONFIG_XEN_BACKEND) */
>>>      ACCELERATOR__MAX,
>>> } Accelerator;
>>>
>>> ... is expanded to:
>>>
>>> typedef enum Accelerator {
>>>      ACCELERATOR_QTEST,
>>>      ACCELERATOR__MAX,
>>> } Accelerator;
>>
>> CONFIG_KVM, CONFIG_TCG, ...  are defined in ${target}-config-target.h,
>> and may only be used in target-specific code.
>>
>> If the enum ends up in libqemuutil.a, there are uses outside
>> target-specific code.
>>
>> exec/poison.h lacks CONFIG_KVM, CONFIG_TCG, ...  Should they be added?
> 
> CONFIG_KVM is already in poison.h, and CONFIG_TCG cannot be added there
> since it is also defined in config-host.h. But the other accelerator
> switches should be marked as poisoned, too.

Maybe we hit "exec/poison.h" limit. Maybe it is too wide / generic,
and need split, or multiple ones.

Should we redefine on which code area we want these definitions
poisoned?

AFAIK accel/ is not target specific but host specific.

My list of area / useful to poison:

- user-mode
  . non-tcg accel
  . hardware emulation

- generic hardware emulation
  . target specific
  . accel specific

For this one it is already too late:

- target acceleration
  . hardware emulation

Thoughts?


