Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A82F5314
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 20:09:21 +0100 (CET)
Received: from localhost ([::1]:55232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzlWC-0003Li-1I
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 14:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzlSY-0001b6-3r
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:05:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzlST-0007Bc-0i
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610564726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vK7J68ER2qETCVEIPC2DPN6l7QwtZdkAQlWz20RfOVA=;
 b=OX0TUx/phHeu87DtJIHte/hQeQnnnPhcMeaK8G17oM8c3WaXnYD9gd1pfVr+EGDnRkWbSk
 KyVkVmPbFvzezGR8zacDNz01b6J4XDmLSPVYydTS5ynkWB2Mpgoon2GffhS/QbhN9YnByd
 0QSlfhLqp0QSVbI1y5fEYuI0CnnOLLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-xCavex4cPkK6KYUqR03z1g-1; Wed, 13 Jan 2021 14:05:22 -0500
X-MC-Unique: xCavex4cPkK6KYUqR03z1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B79C1005D44;
 Wed, 13 Jan 2021 19:05:21 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECA1B19934;
 Wed, 13 Jan 2021 19:05:17 +0000 (UTC)
Subject: Re: Call for Google Summer of Code 2021 project ideas
To: Markus Armbruster <armbru@redhat.com>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <87pn29kxcp.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <b860c470-cbe3-00b5-1966-59fa87045024@redhat.com>
Date: Wed, 13 Jan 2021 14:05:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87pn29kxcp.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 4:19 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 1/11/21 6:47 AM, Stefan Hajnoczi wrote:
>>> Dear QEMU, KVM, and rust-vmm community,
>>> QEMU will apply for Google Summer of Code
>>> (https://summerofcode.withgoogle.com/) again this year.  This internship
>>> program offers paid, 10-week, remote work internships for
>>> contributing to open source.  QEMU can act as an umbrella organization
>>> for KVM kernel and rust-vmm projects too.
>>> Please post project ideas on the QEMU wiki before February 14th:
>>> https://wiki.qemu.org/Google_Summer_of_Code_2021
>>> What's new this year:
>>>    * The number of internship hours has been halved to 175 hours over
>>>      10 weeks. Project ideas must be smaller to fit and students will have
>>>      more flexibility with their working hours.
>>>    * Eligibility has been expanded to include "licensed coding school or
>>>      similar type of program".
>>> Good project ideas are suitable for 175 hours (10 weeks half-day)
>>> work by a
>>> competent programmer who is not yet familiar with the codebase.  In
>>> addition, they are:
>>>    * Well-defined - the scope is clear
>>>    * Self-contained - there are few dependencies
>>>    * Uncontroversial - they are acceptable to the community
>>>    * Incremental - they produce deliverables along the way
>>> Feel free to post ideas even if you are unable to mentor the
>>> project.
>>> It doesn't hurt to share the idea!
>>>
>>
>> I have one that is probably way too ambitious, but requires a
>> particular skillset that might be of good interest to a student that
>> has some experience in the area already.
>>
>> The idea is for a TUI qmp-shell (maybe using urwid?) to create an
>> irssi-like REPL interface for QMP. The idea would be to mimic the
>> mitmproxy TUI interface (Check it out if you haven't!)
>>
>> All the ideas below are extremely tentative to give a basic gist of
>> what I mean; exact layouts/hotkeys/etc are for the sake of explanation
>> only.
>>
>> Essentially, I want an interface like this:
>>
>> -----------------------------------------------------------
>> | QMP Mode                                                |
>> |=========================================================|
>> |                                                         |
>> | Welcome to the Qemu Machine Protocol shell.             |
>> | Please type /help or Ctrl+H to see available commands.  |
>> |                                                         |
>> |                                                         |
>> |                                                         |
>> |---------------------------------------------------------|
>> | >                                                       |
>> -----------------------------------------------------------
>>
>> commands are entered in the bottom and appear in a log window above,
>> appearing most-recent last, like irssi works.
>>
>> As an example, let's say we issue block-dirty-bitmap-add:
>>
>> --------------------------------------------------------
>> | > block-dirty-bitmap-add node=ide0hd0 name=mybitmap0 |
>> --------------------------------------------------------
>>
>> (...syntax up for debate...! We want something easy to parse, but easy
>> to type. For structured data, that's Hard.)
> 
> "Hard" is a red flag for such a brief internship.  We need to solve or
> somehow exclude this design problem before we hand the task to the
> student.
> 
> [...]
> 

Yes, there is a reason I capitalized "Hard". :~)

This task CAN be split out, though. For starters, we can use an 
extremely simplified parsing strategy while we work on the REPL and and 
UI elements.

We can accept things of the form:
command arg=value arg2=value

and we can worry about how to input structured data later. I don't think 
it's a blocker to have someone work on the TUI and asynchronous dispatch 
elements. I think even just keeping our current parsing but adding some 
of the features outlined in the proposal would be a big usability win.

--js


