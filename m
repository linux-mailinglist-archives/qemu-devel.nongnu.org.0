Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE638F25D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:38:16 +0200 (CEST)
Received: from localhost ([::1]:46336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEWt-0003O3-Ba
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llETP-0000Rk-7b
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llETL-0001av-Lu
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621877674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjMtKphQqxOlAX2DjGukeGS3KXAgPgF9NWGTnsz4rDc=;
 b=jF8oCGeDwBVV8pPxWt4j68BFrW96vbS7gxSzAy6jVlNdNt/jnKins7c7gOD4KLpzWxdMN/
 IzbH35avaVvBXMBpsUDA/bR/9iY/769qirfPLDEggivuJE5bpYVdo//ETUYgr+KUOO1mWq
 tm0hGGSv6Z5Y7zIbAigpAgTKZ8ITm/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-1Ps98gsENzC6tsU8GNdmKQ-1; Mon, 24 May 2021 13:34:29 -0400
X-MC-Unique: 1Ps98gsENzC6tsU8GNdmKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 245901B2C988;
 Mon, 24 May 2021 17:34:29 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15FCD5C701;
 Mon, 24 May 2021 17:34:20 +0000 (UTC)
Subject: Re: GSoC Intro - TUI interface for QMP
To: Stefan Hajnoczi <stefanha@redhat.com>,
 "Niteesh G. S." <niteesh.gs@gmail.com>
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <351d1344-a243-ca77-396b-0c1d071b9066@redhat.com>
Date: Mon, 24 May 2021 13:34:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_PH_BODY_ACCOUNTS_PRE=0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, wainersm@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 9:32 AM, Stefan Hajnoczi wrote:
> On Sat, May 22, 2021 at 12:32:00AM +0530, Niteesh G. S. wrote:

Welcome Niteesh :) I look forward to working with you this summer.

>> By end of this summer, I would like to get a basic TUI with some desirable
>> features working. Some of the features I would like to get working are

As a reminder to anyone reading this thread, the goal is to create a 
qmp-shell that functions more as a TUI, akin to mutt, irssi, or (my 
favorite example) mitmproxy. The idea is that there will be, at minimum, 
a history panel showing QMP messages that have occurred so far and a 
text entry panel for entering new commands.

This shell can then be augmented with various other features to 
facilitate testing, debugging, etc. One of the core upgrades over the 
existing qmp-shell will be the featuring of truly asynchronous events 
which will appear in the history panel without requiring the human user 
to press <enter> to allow them to display. This will use a new 
Asynchronous QMP library to facilitate this feature, bringing with it 
fixes over our current use of undocumented Python features abusing 
non-blocking sockets in the old QMP library.

My plan is to worry about implementing the very basics of the shell 
first, and then to add more features on as we feel comfortable with the 
basics. We can discuss what we consider to be the bare minimum for this 
project and lay out the feature requirements that define a successful 
minimum.

>> 1) Syntax checking

To a limited extent. I don't want to disallow the user from sending 
commands that are invalid in the event that we want to test the server's 
ability to cope with and reply to invalid commands.

However, if the syntax is malformed enough that we can't understand it 
to send it to the server, good error messages that point out what 
exactly went wrong are helpful.

>> 2) Syntax highlighting
>> 3) Code completion
>> 4) Logging
>>
>> I would like to hear some of the features you would like to have and also
>> your
>> advice's on implementation.
> 
> Welcome Niteesh!
> 
> It would be great to have an QMP API documentation viewer built into the
> TUI. When you enter a command like 'migrate' it would automatically
> display the associated QMP command documentation from qapi/*.json.
> 

Stefan's suggestion is an important one to me. The current qmp-shell 
does have an auto-complete list of available commands (press <tab> after 
connecting to see the list), but it offers no explanation of what the 
commands do, what their arguments are, etc.

Being able to get interactive help explaining the commands, their 
arguments, etc would be a massive usability improvement over the old shell.

> Stefan
>
Additionally, there's a few threads we've had before with people's 
stretch goals, dreams, nice-to-haves and so on. I owe you a bit of a 
compilation of those ideas. Here are some that I happen to remember.

(Keep in mind that not all of these have been discussed or vetted 
thoroughly on list, some may be vastly harder than others, and not all 
of them may be mutually compatible. There may even be objections to some 
of these. We will definitely not do every last thing on this list, and 
it is important we stay focused on the core task and get code merged 
this summer. However, some of these stretch goals might be fun and 
provide you with extreme leeway to investigate features that interest 
you personally, so I am listing them now.)


1. Utilize or otherwise re-implement readline's history feature, such 
that when opening qmp-shell, you can press up/down to recall previously 
issued commands. (The usage of 'readline' library itself may be 
complicated if we wish to use a TUI library like urwid. Some re-creation 
of features may be necessary.)

2. Implement tab-complete for command names, command arguments, etc.

3. Implement a FiSH-like suggestion mode where, without tab complete, 
the text entry window shows (in e.g. a gray font) the most likely 
auto-complete. You can press <tab> to accept this auto-completion.

4. Add the ability to save a log file for a given session, recording 
timestamps, incoming messages and outgoing messages. Sessions could 
possibly be automatically saved and cycled such that the last 10 or so 
are kept, or maybe up 10MB, or some other kind of limit.

5. Add the ability to load an old log file and "replay" it to a server. 
Optionally, the "replay" might be able to use the log timestamps to 
replay the commands with an identical timing. After a replay, it might 
be nice to be able to use a diff viewer of some kind to show differences 
between the original script and the replay.

6. Add the ability to "attach" qmp-shell to an existing instance of a 
libvirt-managed QEMU and have qmp-shell behave in a "watch" mode, 
showing commands sent back and forth between QEMU and libvirt, to help 
facilitate live debugging of libvirt.

7. Add the ability to "hide" certain events from the history view. By 
pressing a certain hotkey, we can enter a command mode and start 
filtering certain events. For example, we may wish to hide from view all 
JOB_STATUS_CHANGE events from view. Certain filtering modes may warrant 
their own explicit mode available directly in the shell, but we may wish 
to provide a more powerful filtering/scripting mechanism.

8. Similar to above, add the ability to change the "verbosity" of events 
in the history panel live at runtime. For example:

   - Show the full QMP message, pretty-printed
   - Show the full QMP message, condensed with no spaces.
   - Show the raw byte sequence of each QMP message.
   - Show an abbreviated summary; just the command name or event name.
   - Show or hide timestamps
   - Show outgoing commands in terms of what the user typed in qmp-shell.
     (e.g., if we offer a simple syntax, show the simple-syntax version.)

   Being able to toggle between these at-will may be nice to help see
   more or less information dynamically as the situation calls for it.


9. The ability to generate an iotest stub from the current session 
history or a subsection thereof. It's OK if the test isn't fully 
functional on its own, leaving some sections as stubs. Generating the 
commands, waiting for the commands to complete, and generating an '.out' 
could be a nice feature that helps qmp-shell users quickly write tests.

Some thoughts on this:

- iotests usually launch a VM to connect to. qmp-shell will not know the 
arguments QEMU was launched with. The generated test might attempt to 
launch QEMU with a minimum viable configuration, leaving other arguments 
as a stub marked #FIXME.

- The generated iotest may be able to automatically generate event 
waits. For instance, if a JOB_STATUS_CHANGE event occurs prior to the 
user entering the next command, the generated iotest could automatically 
insert a delay that waits for the same event.

- Generated tests should always end with a VM shutdown sequence, either 
explicitly (user sends a 'quit' command) or implicitly (The python 
iotest library calls vm.shutdown())


10. The ability to detect a disconnection and attempt to reconnect 
automatically, similar to how an IRC client would.

11. The ability to define macros to perform multi-step, complex routines 
with a single command. Something like a ~/.config/qemu/qmp-shell.conf 
file could possibly define these macros. The ability to create/save/edit 
these macros directly from the shell could be nice.

12. Integrating tools like Vladimir's block graph visualization tool. 
There are complex memory structures in QEMU that can be hard to 
understand quickly by reading large volumes of text. qmp-shell could be 
augmented to help render and visualize them quickly, facilitating 
debugging greatly.


I'll update this thread with more ideas as I remember them when going 
back through previous upstream discussions we've had on the topic. We 
may want to create a wiki page https://wiki.qemu.org/Documentation and 
start updating it with various ideas, stretch goals, and so on, to keep 
our planning organized. If you do not have an account on this wiki yet, 
I believe you'll need to ask the list for an account, letting us know 
what email and username you want to use for it.


...I also need to warn you about one big problem that looms over this 
project: QMP is a syntax designed for machines, but it's difficult to 
write by hand. The old qmp-shell has a simplistic syntax that was 
designed to make entering commands easier, but it isn't a suitable 
syntax for entering more complex, hierarchical data.

One of the decisions we'll need to make is if we simply REMOVE the 
convenient syntax (allowing only the raw input of QMP), or if we attempt 
to design a new shorthand syntax, simply use the old shorthand syntax, etc.

This is a complex area (and one I haven't fully solved for myself), so 
if this project involves only the input of *raw QMP commands* into the 
shell, I would still consider that a success if we got some of the other 
features worked into it. We will have to discuss the pros/cons of adding 
an imperfect shorthand syntax to this shell; there has been some 
reluctance to that idea in the past.


So, your first homework assignment from me is:

- Create a QEMU wiki account
- Port your GSoC proposal to the wiki
- Begin recording stretch goals to that wiki page
- Set up an (at least) weekly meeting time with me to discuss progress, 
problems, etc. We can chat on IRC, via google meet/zoom, etc at your 
preference.
- Make sure you have a gitlab account. I will add you as a contributor 
to my fork of QEMU and we can use the issue and milestone tracker to 
help set expectations and stay focused.


Thanks! (And welcome!)
--js


