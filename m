Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6D86BB7AB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:26:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcT0R-00005d-Dy; Wed, 15 Mar 2023 11:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcT0O-00005D-R2
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:25:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcT0L-0001Wm-Lh
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:25:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id g18so1127999wmk.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678893927;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y1ikRmVSE17z6Q74FRYA/LN1XWe2oWnl6sUw3c8SdOY=;
 b=IwhniqK5xmCF/3JaJbgK0mmG2ZSeOD0N1T/5IGiKjg7DkKTkl315DyAK78zmRAdl5Q
 7pX2rhRHwNFSM90mXud29DRo4fZRnsmzJww+yHZuLYAVrZ7IcYGjcpsoiK32APnYT1+B
 VPzO1eh1UVBWfVrjY9rsk9oQqwz3m74rQ5XfMpwauIXHKtrX9+7Ab5u555xWN1pHDs1B
 F470P/2Cw60Rge0KirrvqkJHY9AXQk7pqPpPG4AxfFotqI0QmsS2gX3detMQeOf3s/W5
 fhGhFqf3tamhN3WuAXW5cxIpu9uTyrFaNyYCz2yF24RKTIX2UMugn+RwKhpghvo34Aom
 8ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678893927;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y1ikRmVSE17z6Q74FRYA/LN1XWe2oWnl6sUw3c8SdOY=;
 b=48Q1SKvT55FOjRcJRIddVu/D8vs1r95jQTor3YDyuoV0RS6PlubNrQNwO/ufdr6SwD
 VxwIGGXn6rSEaX/fITnAvddYybrlMBDgNpu1GWBUNPIhp/hYUHlB9d+IPoIe1Q24sDPs
 T+8gVHYc0hKJ02Lt4Yclj/3OnExdcCyvZDz5amPXKTTLnJCjqRvunPQ+X7iB885N2hD9
 5wsaA1xaqFRaKVFufx1o2BYPqVWC3TeNImNe8AaDOGCSqAbcr2Un2kf38x9hf3NmzIwA
 ezi6L4RQMGrZIaFYlsl6LeHyHuVPaV8dDZ+mxrTGQljikcjPBbTyHGJk9wEz1aZheH3h
 U4rQ==
X-Gm-Message-State: AO0yUKVe0NrL6zm3Lo548YCNYbdWW8FU/Tr9OivRgEGkIslRZRnL+i5d
 aIj9WX+Ng69gq8xX74kIbwL88Q==
X-Google-Smtp-Source: AK7set/hwFOutQwzplNKff6x9wzQ6vbAd4dygRTB/rxUjAyLsQ4iUdA/+vKi+dw6T6SrDr1TF8Ucnw==
X-Received: by 2002:a05:600c:1e20:b0:3eb:376e:2bb7 with SMTP id
 ay32-20020a05600c1e2000b003eb376e2bb7mr17841880wmb.3.1678893927365; 
 Wed, 15 Mar 2023 08:25:27 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r14-20020a056000014e00b002c54c9bd71fsm4887665wrx.93.2023.03.15.08.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 08:25:27 -0700 (PDT)
Message-ID: <d0546cb1-6797-8fd5-8533-e94358ac58a6@linaro.org>
Date: Wed, 15 Mar 2023 16:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] qapi: Do not generate empty enum
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230315111304.21692-1-philmd@linaro.org>
 <20230315111304.21692-3-philmd@linaro.org>
 <68816687-b319-7c1a-f586-51201e12ecba@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <68816687-b319-7c1a-f586-51201e12ecba@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15/3/23 16:19, Stefan Berger wrote:
> On 3/15/23 07:13, Philippe Mathieu-Daudé wrote:
>> Per the C++ standard, empty enum are ill-formed. Do not generate
>> them in order to avoid:
>>
>>    In file included from qga/qga-qapi-emit-events.c:14:
>>    qga/qga-qapi-emit-events.h:20:1: error: empty enum is invalid
>>       20 | } qga_QAPIEvent;
>>          | ^
>>
>> Reported-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   docs/devel/qapi-code-gen.rst | 6 +++---
>>   scripts/qapi/schema.py       | 5 ++++-
>>   2 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
>> index 23e7f2fb1c..d684c7c24d 100644
>> --- a/docs/devel/qapi-code-gen.rst
>> +++ b/docs/devel/qapi-code-gen.rst
>> @@ -206,6 +206,9 @@ Syntax::
>>
>>   Member 'enum' names the enum type.
>>
>> +Empty enumeration (no member) does not generate anything (not even
>> +constant PREFIX__MAX).
>> +
>>   Each member of the 'data' array defines a value of the enumeration
>>   type.  The form STRING is shorthand for :code:`{ 'name': STRING }`.  
>> The
>>   'name' values must be be distinct.
>> @@ -214,9 +217,6 @@ Example::
>>
>>    { 'enum': 'MyEnum', 'data': [ 'value1', 'value2', 'value3' ] }
>>
>> -Nothing prevents an empty enumeration, although it is probably not
>> -useful.
>> -
>>   On the wire, an enumeration type's value is represented by its
>>   (string) name.  In C, it's represented by an enumeration constant.
>>   These are of the form PREFIX_NAME, where PREFIX is derived from the
>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> index 207e4d71f3..28045dbe93 100644
>> --- a/scripts/qapi/schema.py
>> +++ b/scripts/qapi/schema.py
>> @@ -309,6 +309,7 @@ class QAPISchemaEnumType(QAPISchemaType):
>>
>>       def __init__(self, name, info, doc, ifcond, features, members, 
>> prefix):
>>           super().__init__(name, info, doc, ifcond, features)
>> +        assert members
> 
> not: assert isinstance(members, list)

This doesn't work as [] is a list instance (we want to check the
members[] array contains elements). More verbose could be:

             assert len(members) > 0

>>           for m in members:
>>               assert isinstance(m, QAPISchemaEnumMember)
>>               m.set_defined_in(name)
>> @@ -1047,8 +1048,10 @@ def _make_implicit_object_type(self, name, 
>> info, ifcond, role, members):
>>           return name
>>
>>       def _def_enum_type(self, expr: QAPIExpression):
>> -        name = expr['enum']
>>           data = expr['data']
>> +        if not data:
>> +            return
>> +        name = expr['enum']
>>           prefix = expr.get('prefix')
>>           ifcond = QAPISchemaIfCond(expr.get('if'))
>>           info = expr.info
> 
> 
> Acked-by: Stefan Berger <stefanb@linux.ibm.com>

Thanks!

