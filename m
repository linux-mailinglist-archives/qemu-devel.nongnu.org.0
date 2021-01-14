Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFAE2F66A2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:05:44 +0100 (CET)
Received: from localhost ([::1]:42356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0647-0000Dr-7b
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l05c6-0002rH-Qt
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l05bu-0005gY-Tk
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610642192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u88t4hwyHnSphP2bLI4K6DQUK3f4NGNsa/ORtp8c7Dg=;
 b=davbf3+jUzxHcRJjqUU2H7F/Fwkq4M+4kkdFPBdr/ocgdow+5/UrNzKdQ5CUF9BYD0IDfX
 Vu0bIzIfpydUepYHyHD0CApMO1bGpp0+/6dQmUuGZqOz0otFTGA4aFEW+4uN2U4ooZZ/eX
 ZLgcCo9HL0ubhwK3FZYOi/HIEx3hmtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-gxI0897PPpasjQskTyKT-Q-1; Thu, 14 Jan 2021 11:36:29 -0500
X-MC-Unique: gxI0897PPpasjQskTyKT-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43BCC1074646;
 Thu, 14 Jan 2021 16:36:27 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DDA65D9EF;
 Thu, 14 Jan 2021 16:36:23 +0000 (UTC)
Subject: Re: Call for Google Summer of Code 2021 project ideas
To: Markus Armbruster <armbru@redhat.com>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <87pn29kxcp.fsf@dusky.pond.sub.org>
 <b860c470-cbe3-00b5-1966-59fa87045024@redhat.com>
 <87h7njsnui.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <c26786ac-159e-149a-aa5e-dd08f418d11e@redhat.com>
Date: Thu, 14 Jan 2021 11:36:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87h7njsnui.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 1/14/21 7:29 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 1/13/21 4:19 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> On 1/11/21 6:47 AM, Stefan Hajnoczi wrote:
>>>>> Dear QEMU, KVM, and rust-vmm community,
>>>>> QEMU will apply for Google Summer of Code
>>>>> (https://summerofcode.withgoogle.com/) again this year.  This internship
>>>>> program offers paid, 10-week, remote work internships for
>>>>> contributing to open source.  QEMU can act as an umbrella organization
>>>>> for KVM kernel and rust-vmm projects too.
>>>>> Please post project ideas on the QEMU wiki before February 14th:
>>>>> https://wiki.qemu.org/Google_Summer_of_Code_2021
>>>>> What's new this year:
>>>>>     * The number of internship hours has been halved to 175 hours over
>>>>>       10 weeks. Project ideas must be smaller to fit and students will have
>>>>>       more flexibility with their working hours.
>>>>>     * Eligibility has been expanded to include "licensed coding school or
>>>>>       similar type of program".
>>>>> Good project ideas are suitable for 175 hours (10 weeks half-day)
>>>>> work by a
>>>>> competent programmer who is not yet familiar with the codebase.  In
>>>>> addition, they are:
>>>>>     * Well-defined - the scope is clear
>>>>>     * Self-contained - there are few dependencies
>>>>>     * Uncontroversial - they are acceptable to the community
>>>>>     * Incremental - they produce deliverables along the way
>>>>> Feel free to post ideas even if you are unable to mentor the
>>>>> project.
>>>>> It doesn't hurt to share the idea!
>>>>>
>>>>
>>>> I have one that is probably way too ambitious, but requires a
>>>> particular skillset that might be of good interest to a student that
>>>> has some experience in the area already.
>>>>
>>>> The idea is for a TUI qmp-shell (maybe using urwid?) to create an
>>>> irssi-like REPL interface for QMP. The idea would be to mimic the
>>>> mitmproxy TUI interface (Check it out if you haven't!)
>>>>
>>>> All the ideas below are extremely tentative to give a basic gist of
>>>> what I mean; exact layouts/hotkeys/etc are for the sake of explanation
>>>> only.
>>>>
>>>> Essentially, I want an interface like this:
>>>>
>>>> -----------------------------------------------------------
>>>> | QMP Mode                                                |
>>>> |=========================================================|
>>>> |                                                         |
>>>> | Welcome to the Qemu Machine Protocol shell.             |
>>>> | Please type /help or Ctrl+H to see available commands.  |
>>>> |                                                         |
>>>> |                                                         |
>>>> |                                                         |
>>>> |---------------------------------------------------------|
>>>> | >                                                       |
>>>> -----------------------------------------------------------
>>>>
>>>> commands are entered in the bottom and appear in a log window above,
>>>> appearing most-recent last, like irssi works.
>>>>
>>>> As an example, let's say we issue block-dirty-bitmap-add:
>>>>
>>>> --------------------------------------------------------
>>>> | > block-dirty-bitmap-add node=ide0hd0 name=mybitmap0 |
>>>> --------------------------------------------------------
>>>>
>>>> (...syntax up for debate...! We want something easy to parse, but easy
>>>> to type. For structured data, that's Hard.)
>>> "Hard" is a red flag for such a brief internship.  We need to solve
>>> or
>>> somehow exclude this design problem before we hand the task to the
>>> student.
>>> [...]
>>>
>>
>> Yes, there is a reason I capitalized "Hard". :~)
>>
>> This task CAN be split out, though. For starters, we can use an
>> extremely simplified parsing strategy while we work on the REPL and
>> and UI elements.
>>
>> We can accept things of the form:
>> command arg=value arg2=value
>>
>> and we can worry about how to input structured data later.
> 
> Bzzzt!  You just designed a language.  The fact that it is obviously
> inadequate for the task does not make this not language design.
> 

Did *I* design a language, or did qmp-shell authors design a language? O:-)

(Oh, I'm one of the authors. Well then.)

> Two outcomes:
> 
> 1. The project fails for other reasons.  The language doesn't matter.
> 
> 2. The project succeeds, i.e. it becomes useful to people.  Very quickly
> these people will demand you evolve your inadequate language into a less
> inadequate one, compatibly.  Your evasion of the language design problem
> (because hard) has now added accidental constraints, making the design
> problem even harder.
> 

There's no reason that an interactive shell has to stay backwards 
compatible. Version 0.1 and 0.2 might offer different input paradigms. 
It's not nice, but it's fine for beta-level stuff.

Still, I appreciate that "Beta! Might change!" is an oft-ignored 
warning. This isn't a library or API though, so I still think it's okay 
to take some liberty here.

> The sane way to evade the language design problem is to use the existing
> QMP language.
> 

I wouldn't mind implementing this for version 0.1 -- just allow 
copy-pasting JSON into the input bar -- it's a feature I wanted anyway.

Some things I would like to see, but suspect are not reasonably possible 
to implement quickly:

1. A shorthand syntax mode similar to qmp-shell that is reasonably 
sufficient for most commands. This involves solving a fairly difficult 
language design problem on how to facilitate the input of structured 
data. The biggest pain point here is nested data; we allow JSON as an 
input here but require that it has no spaces. We do not offer a "native" 
shorthand for the nested data.

We *could* co-opt the dotted key syntax, but that's cumbersome for some 
constructs because it involves a lot of repeated parent keys.

As you say, the language design aspect is hard.


2. a multi-line editor mode that facilitates typing QMP messages that 
offers syntax highlighting, field and type validation, autocomplete, 
etc. I have no idea how to implement this -- it's basically an entire 
bespoke editor.


That's *very* hard stuff, I expect, so I won't go there for starters.

So I see two possible options for "not inventing a language":

1. Raw QMP
2. The existing qmp-shell syntax, warts and all.

I don't see a tremendous problem with doing both; but we can start with 
raw QMP. The existing qmp-shell syntax is at least definitely very easy 
to write a new parser for, even if it's kind of ugly and insufficient. I 
still see value in designing a new TUI with the old syntax.

> The project then aims to build a tool that adds useful features over
> "socat "READLINE,history=$HOME/.qmp_history,prompt=QMP>"
> UNIX-CONNECT:/path/to/socket".
> 
> If it succeeds, you can still design and implement a "better" language,
> and let users choose the one they prefer.  Or you could add features to
> help with typing QMP.
> 
>>                                                             I don't
>> think it's a blocker to have someone work on the TUI and asynchronous
>> dispatch elements. I think even just keeping our current parsing but
>> adding some of the features outlined in the proposal would be a big
>> usability win.
> 
> I don't feel this particular itch, but I'm certainly not objecting to
> anyone scratching.
> 

It's something I'd like to see so that I can walk non-QEMU devs through 
interacting with QEMU at a low level for the purposes of debugging, 
reproducing problems, prototyping features, etc.

I use qmp-shell all the time for debugging things myself, I find it 
easier to use than copy-pasting things directly into socat. I wouldn't 
mind the shell getting a little smarter to help me out -- the ability to 
see async events and reconnect on disconnect would already be a massive 
improvement to *my* quality of life.

So much so that I spent a lot of time in December to write an async qmp 
library O:-)

--js


