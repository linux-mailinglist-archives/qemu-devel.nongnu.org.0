Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BCA28655F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 19:01:59 +0200 (CEST)
Received: from localhost ([::1]:34414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQCpC-0006qO-EN
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 13:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQCeH-0002rB-8U
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 12:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQCeF-0002Zo-8k
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 12:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602089438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjbxwAj8es/iOIXQjh38jn3KvAWBxBALopqL4AhHNtI=;
 b=jHv5faCW+2YRwBMwCgkY0M8TR1hde+X+/cgKUyZiKWmKkLkxn0Ih+V24oWWhOBAdlCaNC1
 JpTY3tqoe0ROu0/igVLwAF2pJIut41D0ZMsuqZVZgVCnXNPU6HFAtAb2hT0hAaNPpsn4aF
 0wFAXuX0U8fKbqq3i08kOg7scUxbL6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-ekqSX0wgOrSgnrK_ZakfqQ-1; Wed, 07 Oct 2020 12:50:35 -0400
X-MC-Unique: ekqSX0wgOrSgnrK_ZakfqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C580810BBECE
 for <qemu-devel@nongnu.org>; Wed,  7 Oct 2020 16:50:34 +0000 (UTC)
Received: from [10.10.120.38] (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50C0160BFA;
 Wed,  7 Oct 2020 16:50:34 +0000 (UTC)
Subject: Re: [PATCH v5 27/36] qapi/gen.py: add type hint annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-28-jsnow@redhat.com>
 <87tuv68952.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <5979141d-1d54-94fe-1afb-a976739f0956@redhat.com>
Date: Wed, 7 Oct 2020 12:50:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87tuv68952.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:54:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/20 9:20 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Annotations do not change runtime behavior.
>> This commit *only* adds annotations.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   scripts/qapi/gen.py | 104 ++++++++++++++++++++++++--------------------
>>   1 file changed, 57 insertions(+), 47 deletions(-)
>>
>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> index 1bad37fc06b..d0391cd8718 100644
>> --- a/scripts/qapi/gen.py
>> +++ b/scripts/qapi/gen.py
>> @@ -17,7 +17,13 @@
>>   import errno
>>   import os
>>   import re
>> -from typing import Optional
>> +from typing import (
>> +    Dict,
>> +    Iterator,
>> +    List,
>> +    Optional,
>> +    Tuple,
>> +)
>>   
>>   from .common import (
>>       c_fname,
>> @@ -29,31 +35,31 @@
>>       mcgen,
>>   )
>>   from .schema import QAPISchemaObjectType, QAPISchemaVisitor
>> +from .source import QAPISourceInfo
> 
> PATCH 03 has a similar cleanup.  Are there more?  Perhaps a separate
> patch doing just this kind of cleanup would make sense.  Up to you.
> 
> [...]
> 

This isn't a cleanup, I am just importing QAPISourceInfo to use for an 
annotation. It's relevant and required for this patch, and doesn't make 
sense on its own.

Patch 03 ... Oh, you mean identifying the correct location of QAPIError. 
Uh... nah? I think that was the only case of that one changing. Not 
worth pulling out or naming, I think.


