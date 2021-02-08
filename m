Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AE8313FE6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:06:26 +0100 (CET)
Received: from localhost ([::1]:59160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Cnh-0001A7-GN
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l98QZ-0008Vo-T4
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:26:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l98QX-00033E-Mw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612797972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgskE0O4p/0ReIWk6vDFHl2VCYG6oWVWM96U5bsdAI4=;
 b=WRvO15tk7WxDjqWZHrozfFQPA/OODHbfc7Z7IBIroKNwZRs+U7TdJuOYclcT0L4FqwD5ij
 WpD2M+c25gRXjxRBGnk4F9h1YbsUW3Wa3WeJRrrWEe1+l9dDNPoVvXxQmYLlIGSbtpCYmT
 vOsMqUUpn2qKW5lsSghR2BK8s4FBdcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-GzjtAc5CODybjPIt4VC5KA-1; Mon, 08 Feb 2021 10:26:02 -0500
X-MC-Unique: GzjtAc5CODybjPIt4VC5KA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D5DC80196E;
 Mon,  8 Feb 2021 15:26:01 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC3F21002388;
 Mon,  8 Feb 2021 15:26:00 +0000 (UTC)
Subject: Re: [PATCH] docs/devel/testing.rst: Update outdated Avocado URLs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201010080741.2932406-1-philmd@redhat.com>
 <f835ae44-ba70-05cb-59b1-97f43f1f1942@redhat.com>
 <CAP+75-XPgqwyDmOtR+thBd9Od4hSavb1qA=4JCcO2jQTTG4eiw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <200f5c1f-9d4f-12d6-4ca7-b576812b0922@redhat.com>
Date: Mon, 8 Feb 2021 10:26:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAP+75-XPgqwyDmOtR+thBd9Od4hSavb1qA=4JCcO2jQTTG4eiw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 7:59 AM, Philippe Mathieu-Daudé wrote:
> On Fri, Feb 5, 2021 at 12:53 AM John Snow <jsnow@redhat.com> wrote:
>>
>> On 10/10/20 4:07 AM, Philippe Mathieu-Daudé wrote:
>>> Avocado documentation referred returns 404 error.
>>> Update the broken links.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>    docs/devel/testing.rst | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
>>> index bd64c1bdcdd..23a1697d9f4 100644
>>> --- a/docs/devel/testing.rst
>>> +++ b/docs/devel/testing.rst
>>> @@ -696,7 +696,7 @@ To manually install Avocado and its dependencies, run:
>>>
>>>    Alternatively, follow the instructions on this link:
>>>
>>> -  http://avocado-framework.readthedocs.io/en/latest/GetStartedGuide.html#installing-avocado
>>> +  https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/installing.html
>>>
>>>    Overview
>>>    --------
>>> @@ -879,7 +879,7 @@ Parameter reference
>>>    To understand how Avocado parameters are accessed by tests, and how
>>>    they can be passed to tests, please refer to::
>>>
>>> -  http://avocado-framework.readthedocs.io/en/latest/WritingTests.html#accessing-test-parameters
>>> +  https://avocado-framework.readthedocs.io/en/latest/guides/writer/chapters/writing.html#accessing-test-parameters
>>>
>>>    Parameter values can be easily seen in the log files, and will look
>>>    like the following:
>>>
>>
>> Do you know if there's a way we can augment sphinx to check link status
>> once in a while?
> 
> No, but good idea! Why not ask on the list, IIRC danpb mentioned something
> similar in another thread.
> 
>> If there's a callback where we can get sphinx to call a python function
>> for every URL it finds, we can use response = requests.head(url) and
>> check response.status_code to make sure it's 200 OK.
>>

OK, at Phil's nudge: Does anyone know if there's a Sphinx callback for 
URL processing? We could probably write a test that we could enable 
every-so-often.

I am thinking there might be some benefit to a test suite that we only 
run once-in-a-while during release candidate phases, and this could be 
one of them.

>> --js
>>
> 


