Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA8B26C3DB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 16:48:21 +0200 (CEST)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIYjM-0007WR-0H
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 10:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIYaQ-0005S3-H8
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 10:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIYaM-0006Go-Jq
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 10:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600267138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6fPnA29b8vf7iGASP7uT335/2td1i6AEAx1ei5gSac=;
 b=PT5B2iYH6/vrM7z3eHeCliZgsJYxnF1fR2bNjR7ehYjK3UYFwrAOBfVgwjmYRRpoJb+nqu
 Ylfed+rR6mwrrEqnB7i7Nb29gesYqGxP9jIRMYNqvwwLy+9VAwIDOYzEdsbzwnuK0xfeKH
 K+CVll5MBI2OjbxUuXpID6jB1/5YmPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-HRZJjEAbML20p6_LbAkGNw-1; Wed, 16 Sep 2020 10:38:57 -0400
X-MC-Unique: HRZJjEAbML20p6_LbAkGNw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E76E64093;
 Wed, 16 Sep 2020 14:38:56 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85E7075141;
 Wed, 16 Sep 2020 14:38:55 +0000 (UTC)
Subject: Re: [PATCH 08/37] qapi/common.py: Remove python compatibility
 workaround
To: Markus Armbruster <armbru@redhat.com>
References: <20200915224027.2529813-1-jsnow@redhat.com>
 <20200915224027.2529813-9-jsnow@redhat.com>
 <87ft7hoq6y.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <1d33b2b6-afe8-333d-a8fe-fd972ed068b0@redhat.com>
Date: Wed, 16 Sep 2020 10:38:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87ft7hoq6y.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:35:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.062, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/20 8:34 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/common.py | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
>> index ba35abea47..4fb265a8bf 100644
>> --- a/scripts/qapi/common.py
>> +++ b/scripts/qapi/common.py
>> @@ -119,10 +119,7 @@ def cgen(code, **kwds):
>>       raw = code % kwds
>>       if indent_level:
>>           indent = genindent(indent_level)
>> -        # re.subn() lacks flags support before Python 2.7, use re.compile()
>> -        raw = re.subn(re.compile(r'^(?!(#|$))', re.MULTILINE),
>> -                      indent, raw)
>> -        raw = raw[0]
>> +        raw, _ = re.subn(r'^(?!(#|$))', indent, raw, flags=re.MULTILINE)
>>       return re.sub(re.escape(eatspace) + r' *', '', raw)
> 
> I missed this one in my "qapi: Bye-bye Python 2" series.
> 
> Can we use re.sub() instead?
> 

Yup.


