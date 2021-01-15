Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D162F782E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:02:20 +0100 (CET)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0No3-0005w0-6f
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0NlJ-0004eH-DO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0NlG-0000NU-CP
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610711965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kcVK3nx7WeeqQmTyTYCBp9QxG1n1i1kS4rr/Rcaj6W0=;
 b=cCKC6Y70bGgUeJw2gNliiGPqGMGuYSYVyVFzn7kUTBva/I6F7utBxljQTR1UYeHVjD9Xn6
 EooHTGY+4xcz5BovpbTWYo39eOAyfgR3KSmiga/tpWHX3elGLl9czG2OXQZV5NKoTV+lN6
 7jGsMb2dgMkHriqYFqZ3myaX3EB4/F8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-KRJLwkmBPA6qFVg9pa4_8A-1; Fri, 15 Jan 2021 06:59:23 -0500
X-MC-Unique: KRJLwkmBPA6qFVg9pa4_8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E12011927801;
 Fri, 15 Jan 2021 11:59:22 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-144.ams2.redhat.com
 [10.36.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B75FC19D61;
 Fri, 15 Jan 2021 11:59:21 +0000 (UTC)
Subject: Re: [PATCH v3 10/10] iotests/300: Clean up pylint and mypy complaints
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-11-mreitz@redhat.com>
 <5e2cc423-124f-3b63-2804-d0fe99e30826@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <1e1a09ff-1a96-c565-e590-2d5716945645@redhat.com>
Date: Fri, 15 Jan 2021 12:59:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5e2cc423-124f-3b63-2804-d0fe99e30826@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.01.21 12:30, Vladimir Sementsov-Ogievskiy wrote:
> 14.01.2021 20:03, Max Reitz wrote:
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/297 |  2 +-
>>   tests/qemu-iotests/300 | 18 +++++++++++++++---
>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>> index 1dce1d1b1c..03d8604538 100755
>> --- a/tests/qemu-iotests/297
>> +++ b/tests/qemu-iotests/297
>> @@ -33,7 +33,7 @@ SKIP_FILES = (
>>       '218', '219', '222', '224', '228', '234', '235', '236', '237', 
>> '238',
>>       '240', '242', '245', '246', '248', '255', '256', '257', '258', 
>> '260',
>>       '262', '264', '266', '274', '277', '280', '281', '295', '296', 
>> '298',
>> -    '299', '300', '302', '303', '304', '307',
>> +    '299', '302', '303', '304', '307',
> 
>>       'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
>>   )
>> diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
>> index b864a21d5e..64d388a8fa 100755
>> --- a/tests/qemu-iotests/300
>> +++ b/tests/qemu-iotests/300
>> @@ -22,7 +22,11 @@ import os
>>   import random
>>   import re
>>   from typing import Dict, List, Optional, Union
>> +
>>   import iotests
>> +
>> +# Import qemu after iotests.py has amended the PYTHONPATH
> 
> you mean os.path, exactly,
> 
>   sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 
> 'python'))
> 
> yes?

Indeed.

>> +# pylint: disable=wrong-import-order
>>   import qemu
>>   BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
>> @@ -110,10 +114,14 @@ class 
>> TestDirtyBitmapMigration(iotests.QMPTestCase):
>>           If @msg is None, check that there has not been any error.
>>           """
>>           self.vm_b.shutdown()
>> +
>> +        log = self.vm_b.get_log()
>> +        assert log is not None # Loaded after shutdown
>> +
>>           if msg is None:
>> -            self.assertNotIn('qemu-system-', self.vm_b.get_log())
>> +            self.assertNotIn('qemu-system-', log)
>>           else:
>> -            self.assertIn(msg, self.vm_b.get_log())
>> +            self.assertIn(msg, log)
>>       @staticmethod
>>       def mapping(node_name: str, node_alias: str,
>> @@ -445,9 +453,13 @@ class 
>> TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
>>           # Check for the error in the source's log
>>           self.vm_a.shutdown()
>> +
>> +        log = self.vm_a.get_log()
>> +        assert log is not None # Loaded after shutdown
>> +
>>           self.assertIn(f"Cannot migrate bitmap '{name}' on node "
>>                         f"'{self.src_node_name}': Name is longer than 
>> 255 bytes",
>> -                      self.vm_a.get_log())
>> +                      log)
>>           # Expect abnormal shutdown of the destination VM because of
>>           # the failed migration
>>
> 
> Your new comments are the only PEP8 complains in the 300 iotest:
> 
> flake8 300
> 300:119:31: E261 at least two spaces before inline comment
> 300:458:31: E261 at least two spaces before inline comment
> 
> So, I'd fix them.

Haha, sure :)

> anyway:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks!


