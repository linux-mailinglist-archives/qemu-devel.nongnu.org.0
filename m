Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B9325921
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 22:59:09 +0100 (CET)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFOf5-0003sF-VK
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 16:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lFOd3-0002vf-Nh
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 16:57:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lFOd0-0002sp-3e
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 16:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614290216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hf0xbDRhaAsUAqZf3m9r1RuZxL/hftcdy8VrjBhbDRQ=;
 b=QX0cHgG7d1llL5JU+DJyQFNfXPcr7l39PfBS/m1sOCMea4KhcNn0LLlAmm1P59V8Fwy3HX
 cmYE8+Mh+RZZS93Ej7f+SqaBUaOS0eidZh+n2CNbShTZMg1MHohh0M5O4CVFn4pdVmbF/p
 XsRqtPjDhODEOiqxuVbiRz4yYxISw2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-RHlleuCvOuaYEqGhZDd2-A-1; Thu, 25 Feb 2021 16:56:54 -0500
X-MC-Unique: RHlleuCvOuaYEqGhZDd2-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2CF5C289;
 Thu, 25 Feb 2021 21:56:53 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24D7661F38;
 Thu, 25 Feb 2021 21:56:53 +0000 (UTC)
Subject: Re: [PATCH v3 10/16] qapi/expr.py: Remove single-letter variable
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-11-jsnow@redhat.com>
 <87r1l4b5xi.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <dc2c6fae-60ed-8571-1572-1097c8705978@redhat.com>
Date: Thu, 25 Feb 2021 16:56:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87r1l4b5xi.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 2/25/21 9:03 AM, Markus Armbruster wrote:
> Why?  Is it to appease a style checker?
> 
> I disagree with a blanket ban of single-letter variable names.
> 
> If @f is deemed too terrible to live, then I'd prefer @feat over
> @feature, because it's more visually distant to @features.
> 
Yeah, pylint. We've changed some of these already and I've had reviews 
from you, Eduardo and Cleber. I thought there was some consensus, but 
maybe I misunderstood.

I generally agree that we should avoid single-letter variable names and 
would like to discourage adding new ones. Loop variables are a bit of a 
border-case. They're obviously fine in comprehensions.

There's not too many cases left. Mostly it's "for m in members" and "for 
f in features". We agreed earlier to use "memb" for members. I suppose 
'feat' matches.

--js

> John Snow <jsnow@redhat.com> writes:
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   scripts/qapi/expr.py | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index 3235a3b809e..473ee4f7f7e 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -214,14 +214,14 @@ def check_features(features: Optional[object],
>>           raise QAPISemError(info, "'features' must be an array")
>>       features[:] = [f if isinstance(f, dict) else {'name': f}
>>                      for f in features]
>> -    for f in features:
>> +    for feature in features:
>>           source = "'features' member"
>> -        assert isinstance(f, dict)
>> -        check_keys(f, info, source, ['name'], ['if'])
>> -        check_name_is_str(f['name'], info, source)
>> -        source = "%s '%s'" % (source, f['name'])
>> -        check_name_str(f['name'], info, source)
>> -        check_if(f, info, source)
>> +        assert isinstance(feature, dict)
>> +        check_keys(feature, info, source, ['name'], ['if'])
>> +        check_name_is_str(feature['name'], info, source)
>> +        source = "%s '%s'" % (source, feature['name'])
>> +        check_name_str(feature['name'], info, source)
>> +        check_if(feature, info, source)
>>   
>>   
>>   def check_enum(expr: Expression, info: QAPISourceInfo) -> None:


