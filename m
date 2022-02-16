Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50244B84B7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:47:44 +0100 (CET)
Received: from localhost ([::1]:35366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGuV-0002wQ-Vd
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:47:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKGqp-0008O1-7y
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:43:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKGqm-0004RN-9c
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645004631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmpNpVuM5N2JklyPPVl+O26F9R1yt1IE9AJxIl+Ddbs=;
 b=a1cT6Y4OVD/YOtSHtVT49d324Q3cguQOgUz9LwL49eVwN9LZDA+0FDTZnzcJ3yEHSLjpFT
 g81cjJPf1IEbOHloSU7HOhCENwoCOxvbLpAgRYxJywMVKfiYNtC7yMhqJMQlAX0aJiN7UK
 dtTmlO91C8C0vP5K6px0vQwWT+r8vD0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-UbyoE-s5PVSbvXdUGh1Gzw-1; Wed, 16 Feb 2022 04:43:49 -0500
X-MC-Unique: UbyoE-s5PVSbvXdUGh1Gzw-1
Received: by mail-ed1-f70.google.com with SMTP id
 n7-20020a05640205c700b0040b7be76147so1217661edx.10
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gmpNpVuM5N2JklyPPVl+O26F9R1yt1IE9AJxIl+Ddbs=;
 b=CVBdKhmsaU6Hj/LvJKBkET9ASzuBTRfn/Jc/qX4+Oy70Hnq1n52vlyhPRFSZXm4U0z
 Lr0da/GXYhJ0lDCleZCBTeKRWacQS4oASA0SaiEQD9qK6rH6/feNSXc3MKh5D0k+Ya6x
 B7AMvXAsfm84twwlY/gB+XoVTBKDd3iytzuwYOltppVohwbDK7d6SCp5KJqoP7cLxiVK
 kzxy48oe0JX9hNr5k5zI7S2XggemEf3kqcCp5GJJbGJ76N9SO8V1GUKQ0p5okp6Zs7En
 otvwUagnDH65AcUsR0ulHJ/t3jHz+vt3BPYDMg7IMyjOg8ExngymWsDXWE5rczI+7hL5
 2jeg==
X-Gm-Message-State: AOAM5300gvmrCyA39zhep+8aZcmZ+0kyabbXiBA9pBWYVJGMUS8zlV0p
 3M4Dx3zgE7HOLMHwsEyOivs1a/NQJIV/lmVsfjapJotVPPkZqv78IHhLu2O0TuPfPMp0UfecfAf
 kOtiK9TPOaxenyBg=
X-Received: by 2002:a17:906:fad5:b0:6ce:e056:5918 with SMTP id
 lu21-20020a170906fad500b006cee0565918mr1625278ejb.562.1645004628264; 
 Wed, 16 Feb 2022 01:43:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpVoIioQuiC4TAkPKUCjR7fsDDP4k7bIbjz3Vv/nN7AbuBSCj7eaZ5lLu4lKQJlhtm5GHENQ==
X-Received: by 2002:a17:906:fad5:b0:6ce:e056:5918 with SMTP id
 lu21-20020a170906fad500b006cee0565918mr1625257ejb.562.1645004628034; 
 Wed, 16 Feb 2022 01:43:48 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id w17sm1346867edd.18.2022.02.16.01.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:43:47 -0800 (PST)
Message-ID: <0a3bd4ed-8918-1f03-1c40-8df4c8a042c6@redhat.com>
Date: Wed, 16 Feb 2022 10:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] iotests: Allow using QMP with the QSD
To: Eric Blake <eblake@redhat.com>
References: <20220215135727.28521-1-hreitz@redhat.com>
 <20220215135727.28521-3-hreitz@redhat.com>
 <20220215221914.2g4w7f7aol7ge3wy@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220215221914.2g4w7f7aol7ge3wy@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.02.22 23:19, Eric Blake wrote:
> On Tue, Feb 15, 2022 at 02:57:26PM +0100, Hanna Reitz wrote:
>> Add a parameter to optionally open a QMP connection when creating a
>> QemuStorageDaemon instance.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/iotests.py | 29 ++++++++++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>> index 6ba65eb1ff..47e3808ab9 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -39,6 +39,7 @@
>>   
>>   from qemu.machine import qtest
>>   from qemu.qmp import QMPMessage
>> +from qemu.aqmp.legacy import QEMUMonitorProtocol
> I thought we were trying to get rid of aqmp.legacy usage, so this
> feels like a temporary regression.  Oh well, not the end of the
> testing world.

I fiddled around with the non-legacy interface and wasn’t very 
successful...  I thought since machine.py still uses qemu.aqmp.legacy 
for QEMUMachine, when one is reworked to get rid of it (if that ever 
becomes necessary), then we can just do it here, too.

>
>>       def stop(self, kill_signal=15):
>>           self._p.send_signal(kill_signal)
>>           self._p.wait()
>>           self._p = None
>>   
>> +        if self._qmp:
>> +            self._qmp.close()
>> +
>>           try:
>> +            if self._qmpsock is not None:
>> +                os.remove(self._qmpsock)
>>               os.remove(self.pidfile)
>>           except OSError:
>>               pass
> Do we need two try: blocks here, to remove self.pidfile even if
> os.remove(self._qmpsock) failed?

Honestly, no reason not to use two blocks except it being longer. You’re 
right, I should’ve just done that.

> Otherwise, makes sense to me.

Thanks for reviewing!

Hanna


