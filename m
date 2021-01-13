Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCAC2F549D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:36:31 +0100 (CET)
Received: from localhost ([::1]:41644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznob-000073-NR
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kznnE-0007xN-Eo
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:35:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kznnC-0006d9-LW
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610573701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbkSiDhJW+GXpOigtoxEjqpKofyc8MdwsuYxDgwuSzM=;
 b=dJwgvv8khvhxOFjYHBxo7kXXapR+3UUT017DFJI6raWpN5eTrsgN9wnFUwMSC4LxGFXocI
 AS8UaqHQRT+4U/MmBXpgtaDS9Q4GYJ0FKTpzynrqwKRQPtYrywmqM/7MK/Acf9F8UmZUvu
 4x6WCvwvbQ/ILVlhskL6lYq+ABny0yA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-Cgbw9VXbOVuACWI__BLJ2g-1; Wed, 13 Jan 2021 16:34:57 -0500
X-MC-Unique: Cgbw9VXbOVuACWI__BLJ2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2547107ACF8;
 Wed, 13 Jan 2021 21:34:56 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC1F85C239;
 Wed, 13 Jan 2021 21:34:52 +0000 (UTC)
Subject: Re: [PATCH v2 04/12] qapi/gen: assert that _start_if is not None in
 _wrap_ifcond
To: Markus Armbruster <armbru@redhat.com>
References: <20201217015927.197287-1-jsnow@redhat.com>
 <20201217015927.197287-5-jsnow@redhat.com>
 <87im80yill.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <1803a765-a9e2-339c-035e-a0326167a80f@redhat.com>
Date: Wed, 13 Jan 2021 16:34:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87im80yill.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 10:14 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> We already assert this in end_if, but that's opaque to mypy. Do it in
>> _wrap_ifcond instead. Same effect at runtime, but mypy can now infer
>> the type in _wrap_ifcond's body.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/gen.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> index b40f18eee3c..a6dc991b1d0 100644
>> --- a/scripts/qapi/gen.py
>> +++ b/scripts/qapi/gen.py
>> @@ -130,11 +130,11 @@ def start_if(self, ifcond: List[str]) -> None:
>>           self._start_if = (ifcond, self._body, self._preamble)
>>   
>>       def end_if(self) -> None:
>> -        assert self._start_if
>>           self._wrap_ifcond()
>>           self._start_if = None
>>   
>>       def _wrap_ifcond(self) -> None:
>> +        assert self._start_if
>>           self._body = _wrap_ifcond(self._start_if[0],
>>                                     self._start_if[1], self._body)
>>           self._preamble = _wrap_ifcond(self._start_if[0],
> 
> Let's inline ._wrap_ifcond() into .end_if().  Not a blocker, of course.
> 

I thought I did do this, but I guess it didn't make it out to list. I'll 
look into that.

I was planning on taking your series and trying to splice it into this 
one here and sending it back out as a conjoined thing.


