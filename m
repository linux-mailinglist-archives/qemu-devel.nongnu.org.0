Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B3F4546A7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 13:52:04 +0100 (CET)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnKPz-0005Ih-30
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 07:52:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnKOU-0003Sv-B0
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:50:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnKOR-0006d7-Vc
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:50:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637153427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29ziVhPIMCqph+dahxIapM+saDrMhu3sazO7rktjM/I=;
 b=QElwAoYAPmQK2BvYrU9BDXWRlwi/wJCe2qrcflQ6CaJSikxK7iLdINUTecxiYBg+NRc4XF
 ucbizH9MGLjXdM99XBFkFfuSVSNEtljYh6VCyJu5nY3rki0quXsafmD4LPwaGYr9oalCAE
 uYuf8AtE5+oHU0jgMQqvdUMsV9YXx+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-tMQGRPvBO-mc0pbTpK4Ftw-1; Wed, 17 Nov 2021 07:50:20 -0500
X-MC-Unique: tMQGRPvBO-mc0pbTpK4Ftw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0D4F1851722;
 Wed, 17 Nov 2021 12:50:19 +0000 (UTC)
Received: from [10.39.195.37] (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0B113AEA;
 Wed, 17 Nov 2021 12:50:13 +0000 (UTC)
Message-ID: <fc5a6743-8d0b-58a0-00d1-169bb87691f7@redhat.com>
Date: Wed, 17 Nov 2021 13:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Failing QEMU iotests
To: Hanna Reitz <hreitz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Qemu-block <qemu-block@nongnu.org>
References: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
 <fabb0f91-48d4-47f7-562e-395f0acf4b81@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <fabb0f91-48d4-47f7-562e-395f0acf4b81@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/2021 11.59, Hanna Reitz wrote:
> On 17.11.21 11:07, Thomas Huth wrote:
>>
>>  Hi!
>>
>> I think it has been working fine for me a couple of weeks ago,
>> but when I now run:
>>
>>  make check SPEED=slow
>>
>> I'm getting a couple of failing iotests... not sure whether
>> these are known issues already, so I thought I'd summarize them
>> here:
...
>> --- /home/thuth/devel/qemu/tests/qemu-iotests/206.out
>> +++ 206.out.bad
>> @@ -99,55 +99,19 @@
>>
>>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": 
>> {"driver": "qcow2", "encrypt": {"cipher-alg": "twofish-128", 
>> "cipher-mode": "ctr", "format": "luks", "hash-alg": "sha1", "iter-time": 
>> 10, "ivgen-alg": "plain64", "ivgen-hash-alg": "md5", "key-secret": 
>> "keysec0"}, "file": {"driver": "file", "filename": 
>> "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
>>  {"return": {}}
>> +Job failed: Unsupported cipher algorithm twofish-128 with ctr mode
>>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>>  {"return": {}}
>>
>>  image: TEST_IMG
>>  file format: IMGFMT
>>  virtual size: 32 MiB (33554432 bytes)
>> -encrypted: yes
>>  cluster_size: 65536
>>  Format specific information:
>>      compat: 1.1
>>      compression type: zlib
>>      lazy refcounts: false
>>      refcount bits: 16
>> -    encrypt:
>> -        ivgen alg: plain64
>> -        hash alg: sha1
>> -        cipher alg: twofish-128
>> -        uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
>> -        format: luks
>> -        cipher mode: ctr
>> -        slots:
>> -            [0]:
>> -                active: true
>> -                iters: XXX
>> -                key offset: 4096
>> -                stripes: 4000
>> -            [1]:
>> -                active: false
>> -                key offset: 69632
>> -            [2]:
>> -                active: false
>> -                key offset: 135168
>> -            [3]:
>> -                active: false
>> -                key offset: 200704
>> -            [4]:
>> -                active: false
>> -                key offset: 266240
>> -            [5]:
>> -                active: false
>> -                key offset: 331776
>> -            [6]:
>> -                active: false
>> -                key offset: 397312
>> -            [7]:
>> -                active: false
>> -                key offset: 462848
>> -        payload offset: 528384
>> -        master key iters: XXX
>>      corrupt: false
>>      extended l2: false
> 
> I doubt this worked a couple of weeks ago, but it’s definitely one that we 
> should just get around to fixing. :/

Hm, maybe I've did the successful run on a different system last time ... I 
even slightly remember now having seen this before in the past on my current 
system, so yes, likely not something new.


>> +++ 297.out.bad
>> @@ -1,2 +1,21 @@
>>  === pylint ===
>> +************* Module image-fleecing
>> +tests/image-fleecing:34:24: C0326: Exactly one space required after comma
>> +patterns = [('0x5d', '0',         '64k'),
>> +                        ^ (bad-whitespace)
>> +tests/image-fleecing:35:25: C0326: Exactly one space required after comma
>> +            ('0xd5', '1M',        '64k'),
>> +                         ^ (bad-whitespace)
>> +tests/image-fleecing:36:26: C0326: Exactly one space required after comma
>> +            ('0xdc', '32M',       '64k'),
>> +                          ^ (bad-whitespace)
>> +tests/image-fleecing:39:25: C0326: Exactly one space required after comma
>> +overwrite = [('0xab', '0',         '64k'), # Full overwrite
>> +                         ^ (bad-whitespace)
>> +tests/image-fleecing:48:32: C0326: Exactly one space required after comma
>> +remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
>> +                                ^ (bad-whitespace)
>> +tests/image-fleecing:49:27: C0326: Exactly one space required after comma
>> +             ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
>> +                           ^ (bad-whitespace)
> 
> This could be because your pylint is too old.  At least for the python/ 
> tests we at least require 2.8.0 
> (https://lists.nongnu.org/archive/html/qemu-block/2021-10/msg00768.html) and 
> bad-whitespace was removed in 2.6.

Thanks, updating pylint fixed this problem, indeed!

But maybe the iotests should check the pylint version before using it?

  Thomas


