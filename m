Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D405275B82
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 17:21:42 +0200 (CEST)
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL6aT-0005qo-66
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 11:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kL6WF-0001bG-1w
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 11:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kL6WB-0004hb-KU
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 11:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600874230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEiJ8vuiwPKxNjhMbmVrn6mkup/Pu9A2Z5/KlF4efKs=;
 b=UzZ0ZYPX05UMplouQuSKpB9/2if1Az4R8lSa+c5NLd77ZNOovM0zJAHFLLx5cqwao3JI3x
 yAgLf7Bo1o0JV7IczWhX/4NHzS9NxaXcQGkVqqNlooF0y4CoN4y393DwD3JvCDDWRDVhEL
 7RlUEx2NNTMc818yHo+5GTYKNZEVMHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-RIoVCx7lO3Wr8Jgr60F7aw-1; Wed, 23 Sep 2020 11:17:06 -0400
X-MC-Unique: RIoVCx7lO3Wr8Jgr60F7aw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338FC186DD28;
 Wed, 23 Sep 2020 15:17:05 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A6125DE50;
 Wed, 23 Sep 2020 15:17:02 +0000 (UTC)
Subject: Re: [PATCH v2 1/1] MAINTAINERS: Add Python library stanza
To: Markus Armbruster <armbru@redhat.com>
References: <20200922230505.4089701-1-jsnow@redhat.com>
 <20200922230505.4089701-2-jsnow@redhat.com>
 <87wo0k34qp.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <ce23c70a-2e0e-0ca1-5260-812d713f04a8@redhat.com>
Date: Wed, 23 Sep 2020 11:17:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87wo0k34qp.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, crosa@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/20 11:14 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> I'm proposing that I split the actual Python library off from the other
>> miscellaneous python scripts we have and declare it maintained. Add
>> myself as a maintainer of this folder, along with Cleber.
>>
>> v2: change python/* to python/, thanks Alex.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Acked-by: Cleber Rosa <crosa@redhat.com>
>> Acked-by: Eduardo Habkost <ehabkost@redhat.com>
>> ---
>>   MAINTAINERS | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3d17cad19a..c0222ee645 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2355,11 +2355,18 @@ S: Maintained
>>   F: include/sysemu/cryptodev*.h
>>   F: backends/cryptodev*.c
>>   
>> +Python library
>> +M: John Snow <jsnow@redhat.com>
>> +M: Cleber Rosa <crosa@redhat.com>
>> +R: Eduardo Habkost <ehabkost@redhat.com>
>> +S: Maintained
>> +F: python/
>> +T: git https://gitlab.com/jsnow/qemu.git python
>> +
>>   Python scripts
>>   M: Eduardo Habkost <ehabkost@redhat.com>
>>   M: Cleber Rosa <crosa@redhat.com>
>>   S: Odd fixes
>> -F: python/qemu/*py
>>   F: scripts/*.py
>>   F: tests/*.py
> 
> Separate sections just so you can have the appropriate S:, or is there a
> deeper logic behind the split?
> 

Yes, different intended levels of support. I don't currently have the 
bandwidth to promise support for the miscellaneous Python scripts in 
./scripts, but I do promise to support to a higher level the code in 
./python.

Over time, I intend to migrate things into ./python, but there are some 
series that need to happen first before I start doing that.

--js


