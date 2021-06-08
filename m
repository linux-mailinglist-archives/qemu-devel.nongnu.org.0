Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A6F39F7F9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:40:02 +0200 (CEST)
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbxZ-0005AB-I8
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqbwI-0003ZE-ON
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqbwF-0007PB-7p
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623159518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/2GUJpm4LhwdNupSozzb9z52vzZ90NUqtA9KjkNXx4=;
 b=POSVQP8IXH1+cuS5UF/+cnDsX82o6ieW6JSVA/1sao93qEDletIta91r/i1W3s1CJrjyCQ
 ueBv9DEIW7Iol3JCg/hNls75o7q+iAb6kD1gVKVqselF89ZuOa4zHBEdETs0/0Iz5yBhtI
 BSfV3b6S/yyNvT16mBlZmyv7EkJ3EAY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-TlEDCM2QPIyoytaIq52Hag-1; Tue, 08 Jun 2021 09:38:35 -0400
X-MC-Unique: TlEDCM2QPIyoytaIq52Hag-1
Received: by mail-wm1-f69.google.com with SMTP id
 n2-20020a05600c3b82b02901aeb7a4ac06so1196663wms.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 06:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7/2GUJpm4LhwdNupSozzb9z52vzZ90NUqtA9KjkNXx4=;
 b=VFR6NAeAOVYFKgGucSBq2as5HloOy1qXbtXGfziu9/OtKG7XpRSpesPa28AEv+NCyP
 nvY9QQ/GmAnLHFYFQWYRAkR4ImCAFcvyPXWt2LsznP5PNlFWd9u0DXXkAw5e9YvnPAA3
 TmOR3wQ0RQWsC3bj9RRGyhsFx2VpwBeuw+fEEBL18D5s1WzlUSDGx7kDalATMhC+hMct
 9Ikw8FqUhuf7A06NRWOrrZ0AEJkKsTqiuWSbFMgq/Mo8/Z8NNQ2YNf3Qxi6SShezG5n5
 WSFH2XKImHWFBvicBWQzM06erLgv3FghUI0r3J+0x0JeJJdDcerzF0EDZ0aXBvoCWawC
 d1Cg==
X-Gm-Message-State: AOAM532uFKES8Wg5bXm2beArdtVPcaqjPxqIkhKzeOYrX/Ji+hTr9soR
 UrTbLuZrPCNBTCUtLvQPAIWeRI6jS+lyTmNQf5DtsMG2W2FAcuM9TLIpPC6/idG6MAwHf2ncaGH
 TUQ31O/QIvInGOmg=
X-Received: by 2002:a05:6000:1a8f:: with SMTP id
 f15mr14348484wry.260.1623159514117; 
 Tue, 08 Jun 2021 06:38:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+Hvwcl578hS7CKwHM23mqBE3/kxEi8wAv+rYHtdPifYAIf9EQEJAxlPQr/kEZTdAfByTkqA==
X-Received: by 2002:a05:6000:1a8f:: with SMTP id
 f15mr14348461wry.260.1623159513958; 
 Tue, 08 Jun 2021 06:38:33 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l10sm16998130wrs.11.2021.06.08.06.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 06:38:33 -0700 (PDT)
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
 <af5b2b3a-e223-c8dd-91eb-51f9813d82ae@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9613547f-2e68-1bb9-5be8-c77f8c5c148f@redhat.com>
Date: Tue, 8 Jun 2021 15:38:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <af5b2b3a-e223-c8dd-91eb-51f9813d82ae@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 3:27 PM, Thomas Huth wrote:
> On 26/05/2021 19.04, Philippe Mathieu-Daudé wrote:
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>    specific information. Currently the common structure base
>>    provides the name of the accelerator, while the specific
>>    part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>      { "execute": "query-accels" }
>>      {
>>          "return": [
>>              {
>>                  "name": "qtest"
>>              },
>>              {
>>                  "name": "kvm"
>>              }
>>          ]
>>      }
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v8:
>> - Include code snippet from Markus adding to machine-target.json
>>    to be able to use enum values or union branches conditional.
>> - Use accel_find() on enum to be sure the accelerator is enabled
>>    at runtime (chat with jsnow / eblake).
>>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: John Snow <jsnow@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> ---
>>   qapi/machine-target.json | 54 ++++++++++++++++++++++++++++++++++++++++
>>   accel/accel-qmp.c        | 32 ++++++++++++++++++++++++
>>   accel/meson.build        |  2 +-
>>   3 files changed, 87 insertions(+), 1 deletion(-)
>>   create mode 100644 accel/accel-qmp.c
>>
>> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>> index e7811654b72..586a61b5d99 100644
>> --- a/qapi/machine-target.json
>> +++ b/qapi/machine-target.json
>> @@ -329,3 +329,57 @@
>>   ##
>>   { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
>>     'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) ||
>> defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
>> +
>> +##
>> +# @Accelerator:
>> +#
>> +# An enumeration of accelerator names.
>> +#
>> +# Since: 6.1
>> +##
>> +{ 'enum': 'Accelerator',
>> +  'data': [
>> +      { 'name': 'hax', 'if': 'defined(CONFIG_HAX)' },
>> +      { 'name': 'hvf', 'if': 'defined(CONFIG_HVF)' },
>> +      { 'name': 'kvm', 'if': 'defined(CONFIG_KVM)' },
>> +      { 'name': 'qtest' },
>> +      { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>> +      { 'name': 'whpx', 'if': 'defined(CONFIG_WHPX)' },
>> +      { 'name': 'xen', 'if': 'defined(CONFIG_XEN_BACKEND)' } ] }
>> +
>> +##
>> +# @AcceleratorInfo:
>> +#
>> +# Accelerator information.
>> +#
>> +# @name: The accelerator name.
>> +#
>> +# Since: 6.1
>> +##
>> +{ 'struct': 'AcceleratorInfo',
>> +  'data': { 'name': 'Accelerator' } }
>> +
>> +##
>> +# @query-accels:
>> +#
>> +# Get a list of AcceleratorInfo for all built-in accelerators.
>> +#
>> +# Returns: a list of @AcceleratorInfo describing each accelerator.
>> +#
>> +# Since: 6.1
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "query-accels" }
>> +# <- { "return": [
>> +#        {
>> +#            "name": "qtest"
>> +#        },
>> +#        {
>> +#            "name": "kvm"
>> +#        }
>> +#    ] }
>> +#
>> +##
>> +{ 'command': 'query-accels',
>> +  'returns': ['AcceleratorInfo'] }
> 
> What about Markus' comment here:
> 
>  https://lore.kernel.org/qemu-devel/87mtsoieyz.fsf@dusky.pond.sub.org/
> 
> ?
> 
> If I've got him right, you don't need the command at all, the Accelerator
> enum should be sufficient?

Yes, this is the part jsnow said "we are waiting for Markus to comment"
on the other thread ;) We'd like to only have enums, but QAPI doesn't
seem to allow a "leaf without branch", we need a command or struct to
use the enum else it is elided. Or maybe we didn't understood Markus
idea.


