Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E052C35A467
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 19:11:37 +0200 (CEST)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUufQ-0006EV-EH
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 13:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUucw-0004wb-2c
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 13:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUucu-0005mP-1U
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 13:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617988139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/u6bAD+eGUgSkEqrMV91+7OQLmKrLJLQh+boZUe5+nc=;
 b=hxQGvfpnzl5x2LNkRuzZyy3iDkvqNkn41BeOnN1DDZiO+v4uebIWbHV0nhUmPNx+UKEAP5
 hqkuuaGRPey+VtS6tpoLIjYxxrFfGth58JOTb55szxBtSCaDV5DQNt71kooa3u6F5ixvM4
 1ncQWvvdLi1/PlX69oMbXzrSHMF36qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-wJbKVFNUMIyrJbxqdly0Zg-1; Fri, 09 Apr 2021 13:08:56 -0400
X-MC-Unique: wJbKVFNUMIyrJbxqdly0Zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66D2110054F6;
 Fri,  9 Apr 2021 17:08:55 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9BFB5D6AD;
 Fri,  9 Apr 2021 17:08:54 +0000 (UTC)
Subject: Re: [PATCH v4 02/19] flake8: Enforce shorter line length for comments
 and docstrings
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-3-jsnow@redhat.com>
 <877dlvs1gp.fsf@dusky.pond.sub.org>
 <ed5134b3-bff9-947e-f370-239e5c31a512@redhat.com>
 <871rc277mm.fsf@dusky.pond.sub.org>
 <33866c5d-1eab-739c-f2e8-a35f4a0b0f55@redhat.com>
 <CAFEAcA8f-d7fPzrisUVkjkvpD0CCdQFBso3GiFmAPJ6gj-P_mg@mail.gmail.com>
 <YG7FpVcY72KhQbBJ@redhat.com> <87lf9r3ipn.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <46069b93-1a44-74f5-ef18-c3138200ebe9@redhat.com>
Date: Fri, 9 Apr 2021 13:08:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87lf9r3ipn.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 5:33 AM, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Fri, Mar 26, 2021 at 04:44:25PM +0000, Peter Maydell wrote:
>>> On Fri, 26 Mar 2021 at 16:33, John Snow <jsnow@redhat.com> wrote:
>>>> Being less terse about it: Mostly, I don't like how it enforces this
>>>> column width even for indented structures. Generally, we claim that 72
>>>> columns is "comfortable to read" and I agree.
>>>>
>>>>                                      However, when we start in a margin, I
>>>>                                      am not convinced that this is
>>>>                                      actually more readable than the
>>>>                                      alternative. We aren't using our full
>>>>                                      72 characters here.
>>>
>>> I agree, and I don't see any strong reason to hold our Python
>>> code to a different standard to the rest of our codebase as
>>> regards line length and comment standards.
>>
>> There's one small difference with python vs the rest of the codebase when
>> it comes to API doc strings specifically. eg we have a docstring API comment
>> in python/qemu/machine.py:
>>
>> class QEMUMachine:
>>      """
>>      A QEMU VM.
>>
>>      Use this object as a context manager to ensure
>>      the QEMU process terminates::
>>
>>          with VM(binary) as vm:
>>              ...
>>          # vm is guaranteed to be shut down here
>>      """
>>
>> This formatting, including line breaks, is preserved as-is when a user
>> requests viewing of the help:
>>
>>>>> print(help(qemu.machine.QEMUMachine))
>>
>> Help on class QEMUMachine in module qemu.machine:
>>
>> class QEMUMachine(builtins.object)
>>   |  QEMUMachine(binary: str, args: Sequence[str] = (), wrapper: Sequence[str] = (), name: Optional[str] = None, test_dir: str = '/var/tmp', monitor_address: Union[Tuple[str, str], str, NoneType] = None, socket_scm_helper: Optional[str] = None, sock_dir: Optional[str] = None, drain_console: bool = False, console_log: Optional[str] = None)
>>   |
>>   |  A QEMU VM.
>>   |
>>   |  Use this object as a context manager to ensure
>>   |  the QEMU process terminates::
>>   |
>>   |      with VM(binary) as vm:
>>   |          ...
>>   |      # vm is guaranteed to be shut down here
>>   |
>>   |  Methods defined here:
>>   |
>>
>>
>> IOW, while we as QEMU maintainers may not care about keeping to a narrow
>> line width, with API docstrings, we're also declaring that none of the
>> users of the python APIs can care either. These docstrings are never
>> reflowed, so they can end up wrapping if the user's terminal is narrow
>> which looks very ugly.
>>
>>
>> So this python API docstring scenario is slightly different from our
>> main codebase, where majority of comments are only ever going to be seen
>> by QEMU maintainers, and where C API doc strings don't preserve formatting,
>> because they're turned into HTML and re-flowed.
>>
>> Having said all that, I still don't think we need to restrict ourselves
>> to 72 characters. This is not the 1980's with people using text terminals
>> with physical size constraints. I think it is fine if we let python
>> docstrings get larger - especially if the docstrings are already indented
>> 4/8/12 spaces due to the code indent context, because the code indent is
>> removed when comments are displayed. I think a 100 char line limit would
>> be fine and still not cause wrapping when using python live help().
> 
> The trouble with long lines is not text terminals, it's humans.  Humans
> tend to have trouble following long lines with their eyes (I sure do).
> Typographic manuals suggest to limit columns to roughly 60 characters
> for exactly that reason[*].
> 
> Most doc strings are indented once (classes, functions) or twice
> (methods).  72 - 8 is roughly 60.
> 

My problem with this patch isn't actually the docstrings -- it's 
one-line comments.

If you can teach flake8 to allow this:

# Pretend this is a single-line comment that's 73 chars

but disallow this:

# Pretend this is a two-line comment that's 73 chars,
# and continues to a new line that's also pretty long,
# and maybe keeps going, too.

I will happily accept that patch. Without the ability to enforce the 
style though, I am reluctant to pretend that it's even a preference that 
we have. I think it's a waste to hunt down and re-flow single-line 
comments that just barely squeak over a limit. They look worse.

We can discuss this more when we go to propose a style guide for the 
Python folder; I think it's maybe a misprioritization of our energies in 
the present context.

(I still have the style guide on my TODO list, and even began writing a 
draft at one point, but I think we'd both like to press forward on the 
Typing bits first.)

> With nesting, doc strings can become indented more.  Nesting sufficient
> to squeeze the doc string width to column 72 under roughly 60 is pretty
> rare.  Going beyond 72 colums to keep such doc strings readable is
> exactly what PEP 8 wants you to do.
> 
> Again, I see no reason to deviate from PEP 8.
> 
> 
> [*] https://en.wikipedia.org/wiki/Column_(typography)#Typographic_style
> 


