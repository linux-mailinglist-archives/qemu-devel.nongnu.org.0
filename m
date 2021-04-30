Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A829370313
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:40:16 +0200 (CEST)
Received: from localhost ([::1]:38770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcaru-0003jC-52
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lcaIi-0004bh-JY
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:03:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lcaIf-0000zp-4a
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619816627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWe3ez/NouLYWbwoUrzBQAYGXrGVxsfYQnH6Fy9U7ME=;
 b=ZTDmdf146gOicg+WPIbIQMEDRzqa7BSmOHjHkJJno0G7DaQpdoJJ+j2MrhEkV4Q4mtmQf0
 r5FbHIlT+vEvbFssp1lEVQ59wjvpnjsjdjNP6+Gcnx+RZ9Z/IC1K7otC9iu5tlz7zqqrzt
 Vxbaz4XyPlBOsBVbt45TIV6lFgHme08=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-WAVzYXhVMbW_PzEwyCKtPg-1; Fri, 30 Apr 2021 17:03:45 -0400
X-MC-Unique: WAVzYXhVMbW_PzEwyCKtPg-1
Received: by mail-ej1-f70.google.com with SMTP id
 nd10-20020a170907628ab02903a324b229bfso265082ejc.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 14:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWe3ez/NouLYWbwoUrzBQAYGXrGVxsfYQnH6Fy9U7ME=;
 b=dSIQygHS7kVSXfwHxrMza8m5NpgViJy+vehliGIVawGpWG9nGtLkUJEqDViHs1ZsGz
 LKjaqmTcmuSqTiPt0pZc5SkBZ/l74lc4tR2V70gFRet9XuEZeIOeEG5NZMy1zmjLDJ6C
 6UGPSSYfe7AJ+GmV+PAKcqqyHnnnM35yN32uvthCedxuTBGWpb2VDgqfIFqQAZcoy3lg
 Hg8zo9iZlVYlDcuE01+Gv4gFYe6pwUXgdP3QBeud1petcpOyM90ocpb1IGtuwqvHFmRa
 m2szkuR2I97Q8odusCedlYbGt/NjiXWa5riVwMqabmFguMoWYMNWQuz2l1uDcQb8zlv+
 +MuQ==
X-Gm-Message-State: AOAM530DOV/RKLAC78cU2YoRGkNpHZ1sg0C+9WbptAolbShiPlsnc8+7
 gtXzLlMKDYtH6iUVkbnjj95pVpBWVFpI9PLYzD1WLEV4YpFbgiRaU5UM19RXPL8Oe1Il6HldhYF
 1r0YY00aMOPs5RTARfd0RFojORbCvjUBFUbrCws2Opy76GT2pKleEvjgB0pGUQjvIjIw=
X-Received: by 2002:a17:906:2a16:: with SMTP id
 j22mr6420382eje.397.1619816623154; 
 Fri, 30 Apr 2021 14:03:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8vqYq1Cc+EEHOAWO4exfllVNtPw6BGsFa53CHdz/TJcz4anOokH66/XHCvFHGegWhRddjKA==
X-Received: by 2002:a17:906:2a16:: with SMTP id
 j22mr6420365eje.397.1619816622982; 
 Fri, 30 Apr 2021 14:03:42 -0700 (PDT)
Received: from localhost.localdomain (mob-194-230-155-107.cgn.sunrise.net.
 [194.230.155.107])
 by smtp.gmail.com with ESMTPSA id l17sm2923082ejk.22.2021.04.30.14.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 14:03:42 -0700 (PDT)
Subject: Re: [PATCH v3 10/15] qemu_iotests: extent QMP socket timeout when
 using valgrind
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-11-eesposit@redhat.com>
 <a370f621-ed39-9bbf-1546-da057026ca3b@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <68f9e63f-ec81-5d6f-a787-dd825009f3e5@redhat.com>
Date: Fri, 30 Apr 2021 23:03:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a370f621-ed39-9bbf-1546-da057026ca3b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 30/04/2021 15:02, Max Reitz wrote:
> On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
>> As with gdbserver, valgrind delays the test execution, so
>> the default QMP socket timeout timeout too soon.
> 
> I’m curious: The default timeouts should be long enough for slow 
> systems, too, though (e.g. heavily-loaded CI systems).  I would expect 
> that valgrind is used on developer systems where there is more leeway, 
> so the timeouts should still work.

As said in patch 5, I will check again which timeout is essential to 
avoid and which not.

Emanuele
> 
> But in practice, thinking about that doesn’t matter.  If valgrind leads 
> to a timeout being hit, that wouldn’t be nice.  OTOH, if you run 
> valgrind to debug a test/qemu, you don’t particularly care about the 
> timeouts anyway.
> 
> So in principle, this patch sounds good to me, it’s just that it’s based 
> on patch 5, which I don’t fully agree with.
> 
> Max
> 
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   python/qemu/machine.py        | 2 +-
>>   tests/qemu-iotests/iotests.py | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>> index d6142271c2..dce96e1858 100644
>> --- a/python/qemu/machine.py
>> +++ b/python/qemu/machine.py
>> @@ -410,7 +410,7 @@ def _launch(self) -> None:
>>                                          shell=False,
>>                                          close_fds=False)
>> -        if 'gdbserver' in self._wrapper:
>> +        if 'gdbserver' in self._wrapper or 'valgrind' in self._wrapper:
>>               self._qmp_timer = None
>>           self._post_launch()
>> diff --git a/tests/qemu-iotests/iotests.py 
>> b/tests/qemu-iotests/iotests.py
>> index a2e8604674..94597433fa 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -489,7 +489,7 @@ def log(msg: Msg,
>>   class Timeout:
>>       def __init__(self, seconds, errmsg="Timeout"):
>> -        if qemu_gdb:
>> +        if qemu_gdb or qemu_valgrind:
>>               self.seconds = 3000
>>           else:
>>               self.seconds = seconds
>> @@ -700,7 +700,7 @@ def qmp_to_opts(self, obj):
>>           return ','.join(output_list)
>>       def get_qmp_events(self, wait: bool = False) -> List[QMPMessage]:
>> -        if qemu_gdb:
>> +        if qemu_gdb or qemu_valgrind:
>>               wait = 0.0
>>           return super().get_qmp_events(wait=wait)
>>
> 


