Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59DB278A81
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 16:12:29 +0200 (CEST)
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLoSa-0002eQ-MV
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 10:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLoO8-0007ha-WC
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 10:07:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLoO5-00038T-GN
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 10:07:52 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601042868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGcEi8V/8Ob7QxdI0f6V70yPgzfZtVym7iQeRe92bCI=;
 b=K7iaPvsNOQlrgQ93L7/q8JQcZ1mQrKVom7I0ce/VtEfFI8jQ6tBTKYeKzM+gRliyfFTQmG
 Q+c7zUDDkMQ68hmmeIqWxxuD0hsqk1tKXAsC1RY+KHZAZq7xwnaul2AnngAeFrJRI4Buby
 hLhSQnFwgCeP4as/c/W3+P76aX9WLQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-tbnnBXAtMaCowAatDLU8sw-1; Fri, 25 Sep 2020 10:07:46 -0400
X-MC-Unique: tbnnBXAtMaCowAatDLU8sw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A75E1091066;
 Fri, 25 Sep 2020 14:07:45 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05AE060C15;
 Fri, 25 Sep 2020 14:07:43 +0000 (UTC)
Subject: Re: [PATCH 14/37] qapi/common.py: Move comments into docstrings
To: Markus Armbruster <armbru@redhat.com>
References: <20200915224027.2529813-1-jsnow@redhat.com>
 <20200915224027.2529813-15-jsnow@redhat.com>
 <87d02kpizr.fsf@dusky.pond.sub.org>
 <49e28f59-012c-9b7b-02b7-1854f85884b2@redhat.com>
 <20200917191455.GX7594@habkost.net>
 <3b1ce70b-377d-144f-9331-4f6da4c93f6f@redhat.com>
 <87a6xf8b9a.fsf@dusky.pond.sub.org>
 <7a58ccb0-8b54-38e9-316d-c8b7690b6ea1@redhat.com>
 <87eemq1ek5.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <d7451e9c-934d-8aae-c05f-f26ed5805eb9@redhat.com>
Date: Fri, 25 Sep 2020 10:07:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87eemq1ek5.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.238, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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

On 9/25/20 3:49 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 9/24/20 11:06 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> On 9/17/20 3:14 PM, Eduardo Habkost wrote:
>>>>> On Thu, Sep 17, 2020 at 02:44:53PM -0400, John Snow wrote:
>>>>> [...]
>>>>>> Having said this, I have not found any tool to date that actually *checks*
>>>>>> these comments for consistency. The pycharm IDE interactively highlights
>>>>>> them when it senses that you have made a mistake, but that cannot be worked
>>>>>> into our CI process that I know of - it's a proprietary checker.
>>>>>>
>>>>>> So right now, they're just plaintext that I am writing to approximate the
>>>>>> Sphinx style until such time as I enable autodoc for the module and
>>>>>> fine-tune the actual formatting and so on.
>>> You are deliberately trying to "approximate" Sphinx style, and ...
>>>
>>>>> After applying this series, I only had to make two small tweaks
>>>>> to make Sphinx + autodoc happy with the docstrings you wrote.
>>>>> With the following patch, "make sphinxdocs" will generate the
>>>>> QAPI Python module documentation at docs/devel/qapi.html.
>>>>> I had to explicitly skip qapi/doc.py because autodoc thinks the
>>>>> string constants are documentation strings.
>>>>>
>>>>
>>>> Awesome!
>>> ... actually almost nail it.
>>> Please mention your choice of style in the commit message.
>>>
>>
>> OK, I'll try to summarize it. I guess I'll do it in this commit
>> message, but it's not likely to be too visible in the future that way,
>> depending on how you run git blame and what you're looking at.
> 
> Thanks!
> 
>> I want to resurface my other python style patches soon; perhaps a
>> python coding style document should go in alongside those patches.
>>
>>>> I think I am going to delay explicitly pursuing writing a manual for
>>>> the QAPI parser for now, but it's good to know I am not too far
>>>> off. I'm going to target the mypy conversions first, because they can
>>>> be invasive and full of churn.
>>>>
>>>> When I get there, though ... I am thinking I should add this as
>>>> Devel/QAPI Parser.
>>> Doing "actually Sphinx style" instead of "an approximation of Sphinx
>>> style" would reduce churn later on.  So, if it's not too distracting...
>>>
>>
>> Yes, I just mean in terms of rebasing, docstrings and signatures fight
>> with each other for context and make re-spinning 125 patches a major
>> chore. I wasn't prepared to have the debate on if we wanted to add
>> Python code into the Sphinx generator and have that entire discussion
>> yet.
>>
>> So, I figured it would be a separate series afterwards. I mentioned
>> somewhere else that I anticipated doing it when I removed the
>> "missing-docstring" warning.
>>
>> I will investigate doing it (using Eduardo's patches) as a starting
>> point while reviews continue to filter in. If I figure it out in time,
>> I might squash the formatting changes in, but leave the sphinx
>> enablement patches themselves out.
> 

I wound up figuring it out before I sent V3 out :)

> Use your judgement.
> 

Yep. You can see how this played out in V3: I ensure that nothing is 
"wrong" but I haven't converted the entire submodule yet.

A thing to clarify for the list as well: Nothing validates these 
docstrings in the content-aware sense; nothing makes sure you documented 
the right parameter names, return values, exceptions, etc.

The only validation we can perform automatically right now that I am 
aware of is:

1. Did we have a docstring, yes/no?
2. Is anything referred to in `backticks` a valid reference?
3. Did that docstring parse as Sphinx-dialect ReST?

I would like to improve this situation someday, but it's not a task for 
the near future.

It would be very, very cool if autodoc itself was able to parse the 
integrity of the docstring and perform some simple validity checks, namely:

1. Every parameter has a :param FOO: in the docstring somewhere
2. Every :param FOO: matches a real parameter.
3. If the function has a return value, it is described with :returns:
4. If the function raises an exception, it must be mentioned with :raises:.

With perhaps some kind of exception for "simple" functions (How do I 
measure that?) where a one-line description is likely efficient enough.

--js


