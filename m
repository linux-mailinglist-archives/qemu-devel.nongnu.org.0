Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B283314D5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:28:14 +0100 (CET)
Received: from localhost ([::1]:53232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJfx-0007eD-Aa
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJJGg-0000ng-CS
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:02:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJJGU-000252-7C
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U6D2ROrUytNvFfA8YtjuCuRen7Vd80kWLoKxRVvd+Yg=;
 b=ZMT10jgGMUcZd8vDfPh5yi3vMI3ZMx6BL/BsZNas0rfjktKU7FKatEWcqfDEh9m46dVKaa
 sTmxoLmTLl3EJbTEeXB2QMOWbuENBjRnTdz9FhPUbrIjMFLt87Bv62a8Z8s7OuXhyzv9sm
 v4vvU0f3jT3/GOesiT1fceaCE8nxnMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-dHaoukYqN_CRqEkosUbbrw-1; Mon, 08 Mar 2021 12:01:49 -0500
X-MC-Unique: dHaoukYqN_CRqEkosUbbrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 676AC801814;
 Mon,  8 Mar 2021 17:01:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CF0A60C04;
 Mon,  8 Mar 2021 17:01:42 +0000 (UTC)
Subject: Re: [PATCH v2] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210308154633.158915-1-thuth@redhat.com>
 <78fb219e-fba5-0dfc-b21e-0cc657a9c372@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8532b756-f53c-e606-b900-6dc77527fd71@redhat.com>
Date: Mon, 8 Mar 2021 18:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <78fb219e-fba5-0dfc-b21e-0cc657a9c372@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2021 17.35, Philippe Mathieu-Daudé wrote:
> On 3/8/21 4:46 PM, Thomas Huth wrote:
>> The status of the gitlab-CI files is currently somewhat confusing, and
>> it is often not quite clear whether a patch should go via my tree or
>> via the testing tree of Alex. That situation has grown historically...
>> Initially, I was the only one using the gitlab-CI, just for my private
>> repository there. But in the course of time, the gitlab-CI switched to
>> use the containers from tests/docker/ (which is not part of the gitlab-CI
>> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
>> completely for the repository and will soon use it as its gating CI, too,
>> so it makes way more sense if the gitlab-ci.yml files belong to the people
>> who are owning the qemu-project on gitlab.com and take care of the gitlab
>> CI there. Thus let's merge the gitlab-ci section into the common "test and
>> build automation" section.
>>
>> While we're at it, I'm also removing the line with Fam there for now,
>> since he was hardly active during the last years in this area anymore.
>> If he ever gets more time for this part again in the future, we surely
>> can add the line back again.
>>
>> Now to avoid that Alex is listed here alone, Philippe and I agreed to
>> help as backup maintainers here, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   v2: Keep Philippe and myself as maintainer instead of reviewer
>>
>>   MAINTAINERS | 21 +++++++--------------
>>   1 file changed, 7 insertions(+), 14 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 26c9454823..5c4c179abb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3262,17 +3262,21 @@ F: include/hw/remote/iohub.h
>>   
>>   Build and test automation
>>   -------------------------
>> -Build and test automation
>> +Build and test automation, Linux Continuous Integration
> 
> I'd rather not limit it to Linux hosts...
> 
>>   M: Alex Bennée <alex.bennee@linaro.org>
>> -M: Fam Zheng <fam@euphon.net>
> 
> I'm not sure about Fam removal, he is the one maintaining patchew
> (see [*] below)... Maybe we need an Ack from Paolo?

We could split the Patchew part into a separate section... OTOH, there are 
no patchew related files in the main git repo anyway that we track in the 
MAINTAINERS file, so maybe it makes more sense to simply remove that line? 
(Patchew admins are already mentioned here: 
https://wiki.qemu.org/AdminContacts )

  Thomas


