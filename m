Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456DF33D1C9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:28:23 +0100 (CET)
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM6w2-0001R6-9X
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM6uf-0000sX-Kj
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:26:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM6uU-0004BW-NY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615890402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nVooUw+GVf0LKgNaCgMvtdnoEoKjFSwloyu3jzwSxE=;
 b=aj//XyaH+rBctd+2wq8Q4AN3CxPhxhKK0YpxgxRc+36IIwztxsWBOKHVaoyfPjCNgtX8U8
 2sygxo5gykgkV2uDWNzeV/bQMjxyg6gVjmCMe2cxQaSDMPVRYUtTGxtMQgsbrb8SDCD45J
 KEAFNBSAsGHPk6Mc87XLSejwyJxtpOY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-MLcZ6ld3O7q2YyA5SWYRRg-1; Tue, 16 Mar 2021 06:26:40 -0400
X-MC-Unique: MLcZ6ld3O7q2YyA5SWYRRg-1
Received: by mail-wr1-f72.google.com with SMTP id 75so16322464wrl.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 03:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5nVooUw+GVf0LKgNaCgMvtdnoEoKjFSwloyu3jzwSxE=;
 b=S6PPIWGz2+BD3+Ip2lboaP2FR7sinafUj86gtnVfz8BgQyx6T4eMhWtvkuLLKnaNsq
 Z/s2/SS5McDNnj5pDdbLKNg9QsFHEsp5/vpMb1Qj3tSNfBf8nPd4c8BJUIBH2ikYCZYd
 qbp3WtqVdXKcHbZ6hbqlUm3jcXJ+4X7aUZf9bofOTnG+vNfb3J+mVq3/YUMYiP0e40Yq
 t8g/Mhv3we2B/8tDIDcJ05+VYQeKZUNuGOp6fY0h54yPqxOmGXq/hEJE0KjODCR7ZOfA
 a6zLggFOTgNvmiAGDAchMf2u2xqG9qGsJOO14D3QdLU4SQgvxJxbA5WaVAENWWu3lEAj
 eccA==
X-Gm-Message-State: AOAM5301irLVFdR3I5wle2CwNZB2pGuqwlBAmfkUgWJ2G6ntlXvyb8OW
 pyrufbWF5GII0yuHVdZnWf+VkOhDneCNIAGepjsOO5eGLhNF47fiaoBY9b7ElSlkDm8RzNjF7UY
 /YzyMKXzbIPW0Gjs=
X-Received: by 2002:a1c:498b:: with SMTP id w133mr4134673wma.134.1615890399210; 
 Tue, 16 Mar 2021 03:26:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbl1nTazgcrRdP8TF5fvVhgGf44DHNqibThK3ZhOh9fWaVVVMNoofHxqU5KBdZpFAA9kJaog==
X-Received: by 2002:a1c:498b:: with SMTP id w133mr4134646wma.134.1615890399039; 
 Tue, 16 Mar 2021 03:26:39 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y205sm3089792wmc.18.2021.03.16.03.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 03:26:38 -0700 (PDT)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
 <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
Message-ID: <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
Date: Tue, 16 Mar 2021 11:26:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 10:02 AM, Philippe Mathieu-Daudé wrote:
> On 3/16/21 7:51 AM, Markus Armbruster wrote:
>> Eric Blake <eblake@redhat.com> writes:
>>
>>> On 3/11/21 5:11 PM, Philippe Mathieu-Daudé wrote:
>> [...]
>>>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>>>> new file mode 100644
>>>> index 00000000000..f16e49b8956
>>>> --- /dev/null
>>>> +++ b/accel/accel-qmp.c
>>>> @@ -0,0 +1,47 @@
>>>> +/*
>>>> + * QEMU accelerators, QMP commands
>>>> + *
>>>> + * Copyright (c) 2021 Red Hat Inc.
>>>> + *
>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>> + */
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "qapi/qapi-commands-machine.h"
>>>> +
>>>> +static const Accelerator accel_list[] = {
>>>> +    ACCELERATOR_QTEST,
>>>> +#ifdef CONFIG_TCG
>>>> +    ACCELERATOR_TCG,
>>>> +#endif
>>>> +#ifdef CONFIG_KVM
>>>> +    ACCELERATOR_KVM,
>>>> +#endif
>>>
>>> ...would it be worth compiling the enum to only list enum values that
>>> were actually compiled in?  That would change it to:
>>>
>>> { 'enum': 'Accelerator',
>>>   'data': [ 'qtest',
>>>             { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>>> ...
> 
> These accelerator definitions are supposed to be poisoned in generic
> code... But I like the simplicity of your suggestion, so I'll give it
> a try and see what happens with removing the poisoned definitions.

This is actually quite interesting :) Accelerator definitions are
declared in config-target.h, but acceleration is host specific...

We certainly don't want to make qapi target-specific.


