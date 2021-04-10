Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4EC35AB5F
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 08:32:46 +0200 (CEST)
Received: from localhost ([::1]:59694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV7Aj-0001sV-6c
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 02:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV77x-0001Aj-43
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 02:29:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV77e-0002ci-GA
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 02:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618036167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hb6hLMU4IjWDKv7rzGOrrYIpvPX+ZsYTdk4GYkiAE80=;
 b=Otjn0J15jCE7ZdeehhiCE3iVZ4dLkCgaC7Tmwobxdhw/v+n0tdongo+dq7GWceLHH5i6vh
 kWHaW+Ss9cMTkRr8dtyCIcu/x63DISJKwaPImQ7TLdZgWw9+Vh0dIO24FfMiofCYtJqUun
 SDSwKbz17rOPd+mWRd3x12XKTMgANnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-PRBQH2XUNhKDPj4PmsFBfQ-1; Sat, 10 Apr 2021 02:29:26 -0400
X-MC-Unique: PRBQH2XUNhKDPj4PmsFBfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C157107ACCA;
 Sat, 10 Apr 2021 06:29:24 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D3A91007604;
 Sat, 10 Apr 2021 06:29:16 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210331150527.14857-1-pbonzini@redhat.com>
 <YG2ILNrmn0+vVVKJ@merkur.fritz.box> <87wnteus7k.fsf@linaro.org>
 <YG3SyTLha8a9Itlo@merkur.fritz.box> <YG3X3kZk8HUglqp/@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Message-ID: <27ecdee0-d939-383a-d6fa-7dd83c59b127@redhat.com>
Date: Sat, 10 Apr 2021 08:29:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YG3X3kZk8HUglqp/@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, agraf@csgraf.de,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/04/2021 18.03, Daniel P. Berrangé wrote:
> On Wed, Apr 07, 2021 at 05:42:01PM +0200, Kevin Wolf wrote:
>> Am 07.04.2021 um 15:35 hat Alex Bennée geschrieben:
>>> Kevin Wolf <kwolf@redhat.com> writes:
>>>> Am 31.03.2021 um 17:05 hat Paolo Bonzini geschrieben:
>>>>> +respectful.  Examples of unacceptable behavior by participants include:
>>>>> +
>>>>> +* The use of sexualized language or imagery
>>>>> +
>>>>> +* Personal attacks
>>>>> +
>>>>> +* Trolling or insulting/derogatory comments
>>>>> +
>>>>> +* Public or private harassment
>>>>> +
>>>>> +* Publishing other's private information, such as physical or electronic
>>>>> +addresses, without explicit permission
>>>>
>>>> "Electronic addresses"? No more Cc: in emails without asking for
>>>> explicit permission first in each case, especially when looping in
>>>> people who are not subscribed to the list? And the same for attribution
>>>> in commits (turning informal statements into Reported-by, Acked-by
>>>> etc.)? Links to git repositories of other people?
>>>>
>>>> I'm sure that this is not what was intended, but it's pretty clearly the
>>>> implication of what is written here.
>>>
>>> I'm pretty sure emails used to post to public mailing lists (or used
>>> in a dco tag) are considered public pieces of information. I read the
>>> above as covering things that are not public such as private email
>>> addresses or chat ids and the likes.
>>
>> Yes, it's pretty clear that I'm not publishing new information about
>> people when I'm keeping them in Cc: when replying to a thread, or even
>> when they posted in another thread on the list recently. It becomes much
>> less clear for adding people who aren't usually part of the QEMU
>> community.
>>
>>>> (This kind of "bugs" is one of the reasons why I'm not a huge fan of
>>>> written rules instead of trusting the judgement of community leaders.
>>>> In the communities I am involved in, I can't remember many cases where
>>>> they actually helped to resolve conflicts, but I can remember many
>>>> unproductive discussions about how to interpret the written text and
>>>> what it does and doesn't cover.)
>>>
>>> Well we don't have to start here ;-)
>>>
>>> We explicitly try to avoid rules lawyering with the very next statement:
>>>
>>>    This isn't an exhaustive list of things that you can't do. Rather, take
>>>    it in the spirit in which it's intended: a guide to make it easier to
>>>    be excellent to each other.
>>
>> Right, though it doesn't make any of the above rules any less strict. It
>> just tells me that I'm still in danger even if I follow the explicitly
>> mentioned things.
>>
>> This might be the worst of both worlds: We explicitly threaten people
>> with consequences if they don't keep the rules, but then we don't tell
>> them what the rules even are and say they should use common sense
>> ("you'll find out what the rules were when we punish you for breaking
>> them").
>>
>> I _think_ I'm usually not misbehaving, but how can I know for sure that
>> others have the same impression? For me, this creates a situation of
>> uncertainty, and uncertainty makes me feel uneasy. Maybe I'm the only
>> one, though, and the benefits outweigh my uneasiness.

The docs clearly say that if others feel that there is a conflict with you, 
they should try to clarify that problem with you directly first. So unless 
there is someone already repetively complaining about your behavior, just 
relax, there is nothing to worry about.

> I think you need to bear in mind that we're not using some crude AI
> to apply blind enforcement of rules. The people responsible for any
> enforcement have the ability to apply common sense to situation and so
> aren't likely to take action if someone complains about "publishing" an
> email address by adding it to a CC on a thread / git commit message.

Right. I trust the QEMU leadership committee with their judgement.

> If we don't have any CoC then that creates much worse uncertainty because
> people who are on the receiving end of bad behaviour will have no idea
> whether the QEMU project as a whole even cares about it, or whether it
> is the kind of thing that will lead to action being taken, or whom to
> talk to about it.

Right. That's the point. If someone is really, really misbehaving, we also 
need a way to show them the door. This is only a last resort, of course, but 
if someone is really behaving like a complete jerk, we need a way to say: 
Look, that's not the way how we want to interact with each other in the QEMU 
community, and if you don't change your attitude, there might be consequences.

  Thomas


