Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6F92F610E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 13:31:34 +0100 (CET)
Received: from localhost ([::1]:45196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l01mn-0005of-2E
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 07:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l01lU-0005Ni-Bb
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:30:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l01lR-0001Lv-91
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610627408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kMhGogHu57UNXF5HTzumkauWisrNdSnJ0HBnE1Mi3SY=;
 b=VAsFA5DNaKXy0hlgxpZ+d8jB1Vnjk5U5uOQBKz+2utY+OAul2/PKQ75XjJHzuU0eTaFCYU
 HRx/sqf9EeC68FRd7jyx/prK9cuvyZ4Bp04FlvpgSQImwNWZqxz5XyHm0SbL7HTIGmKxPq
 Sqgf2eExeVtb1yu8/0Aqcq6ajHjlYEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-3Y7OT2CxPW2c52y5GnX4zw-1; Thu, 14 Jan 2021 07:30:03 -0500
X-MC-Unique: 3Y7OT2CxPW2c52y5GnX4zw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC3F8801FD6;
 Thu, 14 Jan 2021 12:30:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 737F05D6AD;
 Thu, 14 Jan 2021 12:29:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C4AC311386A7; Thu, 14 Jan 2021 13:29:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Call for Google Summer of Code 2021 project ideas
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <87pn29kxcp.fsf@dusky.pond.sub.org>
 <b860c470-cbe3-00b5-1966-59fa87045024@redhat.com>
Date: Thu, 14 Jan 2021 13:29:57 +0100
In-Reply-To: <b860c470-cbe3-00b5-1966-59fa87045024@redhat.com> (John Snow's
 message of "Wed, 13 Jan 2021 14:05:17 -0500")
Message-ID: <87h7njsnui.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

John Snow <jsnow@redhat.com> writes:

> On 1/13/21 4:19 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 1/11/21 6:47 AM, Stefan Hajnoczi wrote:
>>>> Dear QEMU, KVM, and rust-vmm community,
>>>> QEMU will apply for Google Summer of Code
>>>> (https://summerofcode.withgoogle.com/) again this year.  This internship
>>>> program offers paid, 10-week, remote work internships for
>>>> contributing to open source.  QEMU can act as an umbrella organization
>>>> for KVM kernel and rust-vmm projects too.
>>>> Please post project ideas on the QEMU wiki before February 14th:
>>>> https://wiki.qemu.org/Google_Summer_of_Code_2021
>>>> What's new this year:
>>>>    * The number of internship hours has been halved to 175 hours over
>>>>      10 weeks. Project ideas must be smaller to fit and students will have
>>>>      more flexibility with their working hours.
>>>>    * Eligibility has been expanded to include "licensed coding school or
>>>>      similar type of program".
>>>> Good project ideas are suitable for 175 hours (10 weeks half-day)
>>>> work by a
>>>> competent programmer who is not yet familiar with the codebase.  In
>>>> addition, they are:
>>>>    * Well-defined - the scope is clear
>>>>    * Self-contained - there are few dependencies
>>>>    * Uncontroversial - they are acceptable to the community
>>>>    * Incremental - they produce deliverables along the way
>>>> Feel free to post ideas even if you are unable to mentor the
>>>> project.
>>>> It doesn't hurt to share the idea!
>>>>
>>>
>>> I have one that is probably way too ambitious, but requires a
>>> particular skillset that might be of good interest to a student that
>>> has some experience in the area already.
>>>
>>> The idea is for a TUI qmp-shell (maybe using urwid?) to create an
>>> irssi-like REPL interface for QMP. The idea would be to mimic the
>>> mitmproxy TUI interface (Check it out if you haven't!)
>>>
>>> All the ideas below are extremely tentative to give a basic gist of
>>> what I mean; exact layouts/hotkeys/etc are for the sake of explanation
>>> only.
>>>
>>> Essentially, I want an interface like this:
>>>
>>> -----------------------------------------------------------
>>> | QMP Mode                                                |
>>> |=========================================================|
>>> |                                                         |
>>> | Welcome to the Qemu Machine Protocol shell.             |
>>> | Please type /help or Ctrl+H to see available commands.  |
>>> |                                                         |
>>> |                                                         |
>>> |                                                         |
>>> |---------------------------------------------------------|
>>> | >                                                       |
>>> -----------------------------------------------------------
>>>
>>> commands are entered in the bottom and appear in a log window above,
>>> appearing most-recent last, like irssi works.
>>>
>>> As an example, let's say we issue block-dirty-bitmap-add:
>>>
>>> --------------------------------------------------------
>>> | > block-dirty-bitmap-add node=ide0hd0 name=mybitmap0 |
>>> --------------------------------------------------------
>>>
>>> (...syntax up for debate...! We want something easy to parse, but easy
>>> to type. For structured data, that's Hard.)
>> "Hard" is a red flag for such a brief internship.  We need to solve
>> or
>> somehow exclude this design problem before we hand the task to the
>> student.
>> [...]
>> 
>
> Yes, there is a reason I capitalized "Hard". :~)
>
> This task CAN be split out, though. For starters, we can use an
> extremely simplified parsing strategy while we work on the REPL and
> and UI elements.
>
> We can accept things of the form:
> command arg=value arg2=value
>
> and we can worry about how to input structured data later.

Bzzzt!  You just designed a language.  The fact that it is obviously
inadequate for the task does not make this not language design.

Two outcomes:

1. The project fails for other reasons.  The language doesn't matter.

2. The project succeeds, i.e. it becomes useful to people.  Very quickly
these people will demand you evolve your inadequate language into a less
inadequate one, compatibly.  Your evasion of the language design problem
(because hard) has now added accidental constraints, making the design
problem even harder.

The sane way to evade the language design problem is to use the existing
QMP language.

The project then aims to build a tool that adds useful features over
"socat "READLINE,history=$HOME/.qmp_history,prompt=QMP>"
UNIX-CONNECT:/path/to/socket".

If it succeeds, you can still design and implement a "better" language,
and let users choose the one they prefer.  Or you could add features to
help with typing QMP.

>                                                            I don't
> think it's a blocker to have someone work on the TUI and asynchronous
> dispatch elements. I think even just keeping our current parsing but
> adding some of the features outlined in the proposal would be a big
> usability win.

I don't feel this particular itch, but I'm certainly not objecting to
anyone scratching.


