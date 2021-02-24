Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD63246E2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:32:35 +0100 (CET)
Received: from localhost ([::1]:39436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF2hu-0005aA-G9
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF2fh-0004i8-5m
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF2ff-0006qf-GT
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614205814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfoTPmIjB4f2wDx/27wODA1JkaNb06IVfGbjN8bNvYM=;
 b=ZONgVTF3CP6tjXT8QFVyxadd2Wq/SHpWfhJpPZnVm76Rq4Mhybk7eM5HWvTNCMhSm5FmUp
 pdn8P5pOQrD20B0234Xxb5SsUcA5OOo68BRUn+eSICHmOFlsXE7icvNxVSFlzASljTbAeU
 B9IpTQjgIwgD3uqkSDAkrsDFBEcYNcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-f8dCztvCOEqpJHQIPTzIFw-1; Wed, 24 Feb 2021 17:30:11 -0500
X-MC-Unique: f8dCztvCOEqpJHQIPTzIFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B939A107ACE6;
 Wed, 24 Feb 2021 22:30:10 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E161A5D9D3;
 Wed, 24 Feb 2021 22:30:09 +0000 (UTC)
Subject: Re: [PATCH v3 08/16] qapi/expr.py: add type hint annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-9-jsnow@redhat.com>
 <87y2fdzdt3.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <838aa159-9bf9-8c71-49dc-7d80e1b849ed@redhat.com>
Date: Wed, 24 Feb 2021 17:30:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87y2fdzdt3.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 10:27 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Annotations do not change runtime behavior.
>> This commit *only* adds annotations.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   scripts/qapi/expr.py  | 71 ++++++++++++++++++++++++++++---------------
>>   scripts/qapi/mypy.ini |  5 ---
>>   2 files changed, 46 insertions(+), 30 deletions(-)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index f45d6be1f4c..df6c64950fa 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -15,7 +15,14 @@
>>   # See the COPYING file in the top-level directory.
>>   
>>   import re
>> -from typing import MutableMapping, Optional, cast
>> +from typing import (
>> +    Iterable,
>> +    List,
>> +    MutableMapping,
>> +    Optional,
>> +    Union,
>> +    cast,
>> +)
>>   
>>   from .common import c_name
>>   from .error import QAPISemError
>> @@ -23,9 +30,10 @@
>>   from .source import QAPISourceInfo
>>   
>>   
>> -# Expressions in their raw form are JSON-like structures with arbitrary forms.
>> -# Minimally, their top-level form must be a mapping of strings to values.
>> -Expression = MutableMapping[str, object]
>> +# Arbitrary form for a JSON-like object.
>> +_JSObject = MutableMapping[str, object]
>> +# Expressions in their raw form are (just) JSON-like objects.
>> +Expression = _JSObject
> 
> Wat?
> 

Please read the "RFCs/notes" section of the cover letter. I wrote it for 
*you*!

--js


