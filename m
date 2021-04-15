Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3AB360F7D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:54:30 +0200 (CEST)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4K4-00050V-VT
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lX4IB-00046M-HW
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lX4I7-0004ZJ-E7
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618501946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACIMUeuet1EcTythresVxcvQXlyt54tJwyqdrNqr9iY=;
 b=YSKSnDBoYpBBv/GuXAUI5OQm8TptfvtHkDKD3BkTBaIgY75MYfsatMBuePnC9Mdg1Bovqe
 EUxj0H0qwakhGI9mEbvmCR3EkGLmrAH/j7C2Q0Njsbs3YCfPfs0v6JPaRhInNWc24VG23C
 o9Uv+czCVK5XVHF+ZB5KCJ1QVgKbMAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-mLX-uGV9NxGuG5buzol94Q-1; Thu, 15 Apr 2021 11:52:22 -0400
X-MC-Unique: mLX-uGV9NxGuG5buzol94Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FFA5107ACF7;
 Thu, 15 Apr 2021 15:52:21 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 497F75D767;
 Thu, 15 Apr 2021 15:52:20 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] qapi/error: Add type hints
To: Markus Armbruster <armbru@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-8-jsnow@redhat.com>
 <877dl4ggrb.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <45d23fee-10dd-dbe8-3123-8ca5af1b2a64@redhat.com>
Date: Thu, 15 Apr 2021 11:52:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <877dl4ggrb.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 3:15 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> No functional change.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/error.py | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
>> index 2183b8c6b7..6ba54821c9 100644
>> --- a/scripts/qapi/error.py
>> +++ b/scripts/qapi/error.py
>> @@ -11,6 +11,10 @@
>>   # This work is licensed under the terms of the GNU GPL, version 2.
>>   # See the COPYING file in the top-level directory.
>>   
>> +from typing import Optional
>> +
>> +from .source import QAPISourceInfo
>> +
>>   
>>   class QAPIError(Exception):
>>       """Base class for all exceptions from the QAPI package."""
>> @@ -18,13 +22,16 @@ class QAPIError(Exception):
>>   
>>   class QAPISourceError(QAPIError):
>>       """Error class for all exceptions identifying a source location."""
>> -    def __init__(self, info, msg, col=None):
>> +    def __init__(self,
>> +                 info: Optional[QAPISourceInfo],
> 
> The Optional is a bit surprising.  Mind pointing to the / a reason in
> the commit message?
> 

We don't have a special object representing "No Source Info", so 
schema.py passes around None objects to mean the same.

The problem, ultimately, is that a QAPISchemaEntity may or may not have 
a source info; and various error reporting paths that in practice will 
not involve such a type in its reporting cannot distinguish that using 
the type system, because from the root-down, info is codified as 
Optional[QAPISourceInfo].

There might be a way to introduce a constraint in schema.py later on, 
but for now (prior to part 6, especially), we cannot.

The assertion should help remind a reader that we don't expect it to be 
true.

--js

>> +                 msg: str,
>> +                 col: Optional[int] = None):
>>           super().__init__()
>>           self.info = info
>>           self.msg = msg
>>           self.col = col
>>   
>> -    def __str__(self):
>> +    def __str__(self) -> str:
>>           assert self.info is not None
>>           loc = str(self.info)
>>           if self.col is not None:


