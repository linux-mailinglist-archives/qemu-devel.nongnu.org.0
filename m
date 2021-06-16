Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F5D3A938B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 09:11:45 +0200 (CEST)
Received: from localhost ([::1]:38178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltPiA-00005n-Ae
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 03:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ltPgf-0007DY-Lo
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 03:10:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ltPgc-000381-7t
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 03:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623827404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wGhO5aO/xhVLH2wTPneM56jx1PlrhXVS8jYsotHtRI=;
 b=C3a2rypgvHokw68S+yekIX6fh9jLKzNVxSwUvOvFS8JT3rLasS8QAqxRYiSOHCoFsKHEdj
 8PJmt3Kd/C+NSf5ud/qdxZZRiAcpCVaEeiHDibWSOePV45XL5Iys/7k5VXH55dS6OFnYqz
 73Mn1qP8wOfVzTMP95fZCQUsSNSIu1g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-dVLPBEghOKyYwYplkgc3MQ-1; Wed, 16 Jun 2021 03:10:03 -0400
X-MC-Unique: dVLPBEghOKyYwYplkgc3MQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so563921ejc.0
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 00:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/wGhO5aO/xhVLH2wTPneM56jx1PlrhXVS8jYsotHtRI=;
 b=jDXmn/4rLszuUPEjeARaigEiOJ4ur+CGU5UcIn1Uswf3S5Qlv2ZlczE8jItZ5CS7DH
 ZyKspk75S1UyxgjWFmSrShV8VA0RTn8rS+9BK5nJXiFdHuF5kAEy1TgWNPDRE/YStiRU
 jiwZsQbyr7NVRaKJbzBOfl9Pu9mKwyyJfXfq7q8YYRyGvU6uyZN8bgbJxpc/pJXD+3vy
 UWN/4B69nSYD6QBbJkMtAnlPp4xMMawEQQFPHVVCKaKnSKDPpSKji7O760Vzk+sK1SCL
 txB/xE1ADHanPlXkQbpfLJEDsr7xvQ4X9zuPtKEhQ+2NVISC0dX28sfj+o8Fl5jQwXSQ
 qtnw==
X-Gm-Message-State: AOAM530Y1tf7AJY678KIZGq7cfyud2tzCEwXjYgN1wXqd4iivwWGMBGT
 wf+uxMdYttgXjRrO9Z/KckYsGYLvCSqwMoaj7T6KLJpn2PnUwQB272QdGlyEKoBq+EkUGa6u47G
 SNBMn88lxEkdJASkRPU72xLailIJZbOueDitVTlJX2Y80Jds3KaH9/9vpvXJxdhpb3Ps=
X-Received: by 2002:a17:906:509:: with SMTP id
 j9mr3655739eja.149.1623827401834; 
 Wed, 16 Jun 2021 00:10:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfyVVImpqbbmOoBgz/pZI5btJVKDiyQpx7NIAlFd1Um12tHcJxAX7jj4R5kI2QDBe2IPC4zg==
X-Received: by 2002:a17:906:509:: with SMTP id
 j9mr3655705eja.149.1623827401564; 
 Wed, 16 Jun 2021 00:10:01 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 n26sm935614ejc.27.2021.06.16.00.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 00:09:58 -0700 (PDT)
Subject: Re: [PATCH v5 06/16] qemu-iotests: delay QMP socket timers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210604091723.13419-1-eesposit@redhat.com>
 <20210604091723.13419-7-eesposit@redhat.com>
 <879584c2-48cb-c81e-ef9c-141db1c5a67f@redhat.com>
 <f68fa8d3-a70a-7f30-9fd1-913730e2b024@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <c968bda1-f7ef-101f-3e41-2181587884fd@redhat.com>
Date: Wed, 16 Jun 2021 09:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f68fa8d3-a70a-7f30-9fd1-913730e2b024@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15/06/2021 09:57, Vladimir Sementsov-Ogievskiy wrote:
> 14.06.2021 13:36, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 04/06/2021 11:17, Emanuele Giuseppe Esposito wrote:
>>> Attaching gdbserver implies that the qmp socket
>>> should wait indefinitely for an answer from QEMU.
>>>
>>> For Timeout class, create a @contextmanager that
>>> switches Timeout with NoTimeout (empty context manager)
>>> so that if --gdb is set, no timeout will be triggered.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   tests/qemu-iotests/iotests.py | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/qemu-iotests/iotests.py 
>>> b/tests/qemu-iotests/iotests.py
>>> index c86f239d81..d4bfd8f1d6 100644
>>> --- a/tests/qemu-iotests/iotests.py
>>> +++ b/tests/qemu-iotests/iotests.py
>>> @@ -486,6 +486,13 @@ def __exit__(self, exc_type, value, traceback):
>>>       def timeout(self, signum, frame):
>>>           raise Exception(self.errmsg)
>>> +@contextmanager
>>> +def NoTimeout():
>>> +    yield
>>> +
>>> +if qemu_gdb:
>>> +    Timeout = NoTimeout
>>> +
>>
>> @Vladimir or anyone expert enough in python:
>> This fix above works, but I just noticed that makes pylint (test 297) 
>> fail. My bad, I should have tried it before.
> 
> I think, just make mypy ignore it, like:
> 
>     Timeout = NoTimeout # type: ignore
> 
> 

I think I am going to drop this change.
This series already has patch 2 to ignore another pylint warning, plus 
another separate patch was sent to silence a warning that pops out with 
newer versions of pylint.

So once this gets in, feel free to add a patch with this change.

Emanuele
>>
>> The reason for that is
>>>> +    Timeout = NoTimeout
>>
>> They obviously have different types.
>>
>>> +iotests.py:507: error: Cannot assign to a type
>>> +iotests.py:507: error: Incompatible types in assignment (expression 
>>> has type "Callable[[], _GeneratorContextManager[Any]]", variable has 
>>> type "Type[Timeout]")
>>> +Found 2 errors in 1 file (checked 1 source file)
>>
>> Any ideas on how to fix this? Otherwise I will get rid of it.
>>
>> Thank you,
>> Emanuele
>>
>>>   def file_pattern(name):
>>>       return "{0}-{1}".format(os.getpid(), name)
>>> @@ -575,7 +582,7 @@ class VM(qtest.QEMUQtestMachine):
>>>       def __init__(self, path_suffix=''):
>>>           name = "qemu%s-%d" % (path_suffix, os.getpid())
>>> -        timer = 15.0
>>> +        timer = 15.0 if not qemu_gdb else None
>>>           super().__init__(qemu_prog, qemu_opts, name=name,
>>>                            base_temp_dir=test_dir,
>>>                            socket_scm_helper=socket_scm_helper,
>>>
>>
> 
> 


