Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5549E3141A6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:24:37 +0100 (CET)
Received: from localhost ([::1]:39596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9E1M-0004a9-DM
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l98Ez-0005C9-CX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l98Eq-0007DV-Ub
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612797247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Edlb3aG54Bhx34cemoFyZkGwoRhFAAH3jdngVhszBQ=;
 b=dDPVYwCSZstItNviCUlx58eSag3USBpizxVarvJqkW/uLThmqlYk1VGFM+VJriUzwks9H1
 iM4R0wXiG1XkyVK0hKsdbL93y0OSiuSCmJAv6AVLji61RPcMxZIctH6HFwmRd1LUCxnadn
 wEOUkJ0ZA5yuyKQf5KelppSB/sDgZTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-Leccnms4OCWEL_BtguOkYg-1; Mon, 08 Feb 2021 10:13:59 -0500
X-MC-Unique: Leccnms4OCWEL_BtguOkYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3751E8049E0;
 Mon,  8 Feb 2021 15:13:37 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44DA55D720;
 Mon,  8 Feb 2021 15:13:36 +0000 (UTC)
Subject: Re: Interested in contributing to QEMU
To: "Niteesh G. S." <niteesh.gs@gmail.com>, qemu-devel@nongnu.org
References: <CAN6ztm-jdqqz=RteqcnSPObqatS8yiA9_QYVu_Csuvz3HjFCsQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <8962e94a-80d4-6272-3b4e-f81dfa43ad37@redhat.com>
Date: Mon, 8 Feb 2021 10:13:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAN6ztm-jdqqz=RteqcnSPObqatS8yiA9_QYVu_Csuvz3HjFCsQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: me@xcancerberox.com.ar, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 12:01 PM, Niteesh G. S. wrote:
> Hello all,
> 
> I am Niteesh, a junior student(3rd year) pursuing Electronics and 
> Communication
> engineering. I was also a GSoC student for RTEMS last year. My main area of
> interest is low-level development (OS, Emulators, Hardware design, etc).
> 

QEMU certainly is the right place for low-level!

> I wanted to start contributing from last year itself but was occupied 
> with academic
> work. I have started working on small patches. My ultimate goal is to 
> learn about
> how QEMU works, contribute and learn as much as possible.
> 
> I tried going through the Arduino emulation code. I was able to 
> understand it from
> a high level but couldn't understand underlying details. I went through 
> few blog
> posts related to QEMU internals but they didn't help much. I plan to 
> step through
> the code but the sheer size of the codebase is scary(Tips regarding 
> debugging are
> very much welcomed). AFAIK the source code is mostly the documentation for
> QEMU. If someone knows any docs or articles that will help a beginner 
> get started
> it would be great.
> 

Depending on what you'd like to debug, the debugging tips are going to 
be different. I am not sure of the quality of our Arduino code as I have 
not touched it personally.

Anything concrete you'd like to ask about how QEMU works? You can always 
stop by the IRC channel to ask some questions if you're afraid of 
cluttering up the email list.

See the end of this mail for instructions on how to join, if you need them.

> I would also like to take part in GSoC this year. I find the below two 
> projects interesting
> 1) 
> https://wiki.qemu.org/Google_Summer_of_Code_2020#QEMU_emulated_Arduino_board_visualizer 
> <https://wiki.qemu.org/Google_Summer_of_Code_2020#QEMU_emulated_Arduino_board_visualizer>
> This one is from last year AFAIK no one has worked on it. If so I would like
> to work on it. I have CC'ed the mentors of this project to share some 
> more details
> regarding it. Have you guys decided on the netlist parser lib, UI lib? 
> Is there something
> that I could work on or read to get myself familiarized with the JSON 
> event IO stuff?
> 

I don't think we have the events this project described in the latest 
development branch of QEMU, but maybe Phil has something in development 
somewhere. I'll let him answer you, but, it's likely they intend to use 
QMP here, which is relevant below, too:

> 2) 
> https://wiki.qemu.org/Google_Summer_of_Code_2021#Interactive.2C_asynchronous_QEMU_Machine_Protocol_.28QMP.29_text_user_interface_.28TUI.29 
> <https://wiki.qemu.org/Google_Summer_of_Code_2021#Interactive.2C_asynchronous_QEMU_Machine_Protocol_.28QMP.29_text_user_interface_.28TUI.29>
> This is something that I don't know much about. I have a basic idea 
> about what
> QMP is but I never used it. The docs say that the Async QMP library is a 
> work
> in progress. If someone can hook me up with some small tasks in this 
> library it would
> be really helpful in improving my understanding.
> 

1) About QMP and QAPI:

QMP is the JSON-like runtime protocol that QEMU supports. These two 
documents should get you started on understanding what QMP is and how it 
works:

https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/qmp-intro.txt

https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/qmp-spec.txt

There's a python script (scripts/qmp/qmp-shell) that can be used to 
issue an unsupported* short-hand syntax that translates into "real" QMP. 
Or, as qmp-intro.txt says, you can use telnet or socat to copy/paste 
JSON straight into the socket.

The commands that QMP accepts are defined by QAPI; those are defined in 
./qapi/*.json -- a component called the QAPI generator digests this 
information and generates the runtime server code that handles parsing 
and dispatch.


2) About QMP Events

Normally, after the initial handshake, QMP is a call-and-response 
protocol. The client sends an RPC request, the server executes the 
command and sends the response.

QMP also supports asynchronous events, though. At any point, QMP can 
send an unprompted status message that informs the client of some state 
change within QEMU. This is seen most often for changes in the system 
emulator runstate, i.e. if QEMU is paused or resumed, etc.

(It's also used for reporting block device errors, long-running task 
status updates like backup, etc.)

It's likely that Phil wants to use this functionality to send 
information about GPIO state changes such that a client can render a 
meaningful visualization.


3) About AQMP

QEMU today has a QMP library written in Python at ./python/qemu/qmp.py. 
This is a synchronous library that blocks execution until the command is 
done executing on the server.

We have augmented it over the years to support caching events we 
received while waiting for execution to finish (for later retrieval), 
but it requires the caller to go back and check those cached events. It 
does not offer event handling callbacks. It is a very low-level library 
that is prone to race conditions depending on how the test using it is 
written.

qmp-shell uses the old qmp library: it does not show you incoming events 
as they happen. You have to press "enter" with an empty buffer to coax 
the shell to check for new events and print them for you, which can be a 
little annoying if you want live updates.

I started writing AQMP using Python's asyncio/await keywords to create a 
more modern, flexible QMP library to replace it. One of the hopes I have 
for this library is that it will handle asynchronous events much more 
nicely. It's my hope that qmp-shell can be upgraded to use this newer 
library instead.

The AQMP library is about half finished: It supports all of the basic 
functionality of the protocol, but needs work on the callback API for 
dispatching event responses. It also likely needs a lot of testing and 
polish that's likely to become obvious as anyone tries to integrate it 
into a real program like a theoretical qmp-shell-2.0.


4) Understanding my project

If you're still interested in my project, I'd recommend trying out 
qmp-shell against a running QEMU instance and issuing a few basic, 
boring commands ("query-status" is a good candidate) and seeing how that 
works.

Then, I'd take a look at some of the other projects I mentioned 
(mitmproxy, irssi) to get a sense of what the work is here. This is 
largely a UI/API programming task, and there's real work to do on the 
AQMP library, but it's probably closer to the surface than the deep 
technical internals of QEMU.

It might be a good introductory project that helps you get a better 
overview of the internals of QEMU if you're interested in more 
hardware-related aspects, but it still requires you have at least some 
interested in UI programming and API design.

Phil's project might involve hardware specifics quite a bit more than 
mine, while still teaching you some overview of QMP as a necessity of 
the project.

If you remain interested after the above, I can point you towards some 
more concrete tasks that need doing for you to get a fairly concrete 
sense of what the project entails.

> I would like to work on these projects even outside of GSoC if someone 
> is ready to
> mentor in their free time :).
> 

Feel free to join #qemu-gsoc on irc.oftc.net. If you've not joined an 
IRC channel before, it's kind of like a prehistoric slack channel.

Linux GUI: xchat, hexchat
Linux TUI: irssi, WeeChat

OSX GUI: LimeChat, Colloquy (I've never used either)
OSX TUI: irssi and weechat should be available via ports (Not tried.)

Windows GUI: mIRC, XChat


I'm jsnow on OFTC. You can use my nickname at the start of a message 
("jsnow: Hello, this is Niteesh from the mailing list") and it will show 
me a notification -- but the hours I am paying attention to IRC are 
around 10AM - 7PM EST. (15:00 - 00:00 GMT)

I can be around later by request (00:00 - 05:00 GMT) if you give me some 
advance notice.

> Thanks
> Niteesh.
> 
> 


