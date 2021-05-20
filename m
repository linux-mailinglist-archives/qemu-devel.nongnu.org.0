Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B54F38B28E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:06:46 +0200 (CEST)
Received: from localhost ([::1]:58398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkG5-00035G-I5
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljk5u-0002Ba-9E
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljk5p-0008NW-V8
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621522568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0n1626wP3Kn6h/VElXM6JgPOipY9JSwtCERGqvDTjlQ=;
 b=biLE7lkMQdEGXlgC4RDZH2Nf7htnLgKx+D+6aYzQssS2A1TbIbEsGSv8qkXYIkkJjIJLAn
 YkCyxixlaFlV1JJc5fIv0ZVzQeFgy6LTK5h1Ue4fD9qahesGC7It5Fr4vlIf24D6LsFrVc
 iRw+syNu7g/zS1azmWQ+0f96SuR4Nnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-FIL7Ts--PSK-26I1ESL4Vw-1; Thu, 20 May 2021 10:56:06 -0400
X-MC-Unique: FIL7Ts--PSK-26I1ESL4Vw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FF6D107ACC7;
 Thu, 20 May 2021 14:54:37 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 911EC10013C1;
 Thu, 20 May 2021 14:54:36 +0000 (UTC)
Subject: Re: [PATCH v3 14/15] qapi/parser: allow 'ch' variable name
To: Markus Armbruster <armbru@redhat.com>
References: <20210519183951.3946870-1-jsnow@redhat.com>
 <20210519183951.3946870-15-jsnow@redhat.com>
 <878s49bvcn.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <29502dd2-753e-46ab-0bf0-d62c186dff6c@redhat.com>
Date: Thu, 20 May 2021 10:54:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <878s49bvcn.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 5:36 AM, Markus Armbruster wrote:
> Uh, one more little thing... this commit message isn't quite right:
> 
> John Snow <jsnow@redhat.com> writes:
> 
>> We can have a two-letter variable name, as a treat.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>>
>> --
> 
> This line is not a separator.
> 
>>
>> I don't want to use 'chr' or 'char', and in context 'ch' works well
>> enough. I will assume that any possible future uses will also be obvious
>> enough.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
> 
> This one is.
> 
> Two S-o-b.  Okay to manually toss everything after the "--" line?
> 

Whoops. Script failure because of the typo in the separator I added 
manually. Yes.

```
qapi/parser: allow 'ch' variable name

We can have a two-letter variable name, as a treat.

Signed-off-by: John Snow <jsnow@redhat.com>
```

Is fine. Any edits you want to make to my joking, not-that-useful commit 
message is also fine.

>>   scripts/qapi/pylintrc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
>> index 88efbf71cb2..c5275d5f59b 100644
>> --- a/scripts/qapi/pylintrc
>> +++ b/scripts/qapi/pylintrc
>> @@ -43,6 +43,7 @@ good-names=i,
>>              _,
>>              fp,  # fp = open(...)
>>              fd,  # fd = os.open(...)
>> +           ch,
>>   
>>   [VARIABLES]


