Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF29931C483
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 01:11:37 +0100 (CET)
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBnxo-00060n-Ro
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 19:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBnwt-0005Ca-Gz
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:10:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBnwr-0004Qc-H6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613434235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9HnTtPPq47PeUuI8YkapT+/EVzQ8Sd8ct9FBrfewG8=;
 b=PpnqKYNbjOAr/mN1h/8UCBFoa+yj+mF1rfn3aHLOJN1vunkxFWuPoskmpdz+NL9Lx4bKf9
 w4NeMwKcWfWpB1RIA2NTBwaVqSiTgMurG7sPv5PyJzxTB65yBoiUpryhWjorVFiFxbynvk
 U76Lu8u8btK45KHykYfI4NXe6at8GkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-a8gzbfAUMgCVehuJa4Oz5g-1; Mon, 15 Feb 2021 19:10:31 -0500
X-MC-Unique: a8gzbfAUMgCVehuJa4Oz5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBD6780198A;
 Tue, 16 Feb 2021 00:10:30 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D4DE10023B6;
 Tue, 16 Feb 2021 00:10:29 +0000 (UTC)
Subject: Re: Interested in contributing to QEMU
To: "Niteesh G. S." <niteesh.gs@gmail.com>
References: <CAN6ztm-jdqqz=RteqcnSPObqatS8yiA9_QYVu_Csuvz3HjFCsQ@mail.gmail.com>
 <8962e94a-80d4-6272-3b4e-f81dfa43ad37@redhat.com>
 <CAN6ztm93eFZdtN6CTreoM-s-kF7m8f6oxpOWyez2V=3sTaOSUw@mail.gmail.com>
 <9965cb74-96aa-cc4d-01bb-aa7ff6fd8db5@redhat.com>
 <CAN6ztm8OOwqxfU6s6krDac4npePuCOB_xXOzBU=b+QfG3FbhQg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <8e38319a-5645-4a38-f974-0e686aa3d65e@redhat.com>
Date: Mon, 15 Feb 2021 19:10:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAN6ztm8OOwqxfU6s6krDac4npePuCOB_xXOzBU=b+QfG3FbhQg@mail.gmail.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 7:10 AM, Niteesh G. S. wrote:
> Hello John,
> 
> On Wed, Feb 10, 2021 at 10:33 PM John Snow <jsnow@redhat.com 
> <mailto:jsnow@redhat.com>> wrote:
> 

[...]

> 
>     OK: I think I need to be careful about "issuing" work to someone who
>     isn't (yet) accepted into the program -- I shouldn't misrepresent this
>     arrangement -- but I can give you some more research tips that may help
>     you find your footing.
> 
>     We can work on getting to know QMP a bit better; it sounds like it'd be
>     relevant for both projects.
> 
>     Try using '-qmp qmp.sock,server,nowait' when you boot up QEMU and then
>     open the qmp.sock file with socat and try messing with it.
> 
>     Try going to ./qapi/ in the source tree and "git grep event" to find
>     some event definitions. try grepping for that event name in the QEMU
>     tree at large and try to work out how QEMU emits these events.
> 
>     Try *adding* an event somewhere in ./qapi/ and modifying QEMU to emit
>     this event. Try using rlwrap and socat to connect to this QMP socket
>     and
>     verify that your event is being sent over the wire. Depending on where
>     you add the event, it may be helpful to start QEMU in a paused state
>     and
>     issue a resume command from QMP to make sure you have time to
>     connect to
>     the socket.
> 
> I added an event that is emitted every keypress. It also sends the qcode 
> of the key pressed.
> https://github.com/gs-niteesh/qemu/pull/1/commits/1684f1f499e67ec4af5f75d0cc09eb1ecf9be709 
> <https://github.com/gs-niteesh/qemu/pull/1/commits/1684f1f499e67ec4af5f75d0cc09eb1ecf9be709>
> After doing this, I think I have a basic understanding of how the event 
> stuff works and also
> what happens when a command is issued from the shell.

Good!

> I have summarized my understanding below, please correct me if I am 
> wrong anywhere.

> 1) The JSON files under qemu/qapi define the QMP messages. These JSON 
> files are then
> compiled into their C representations during the build time.

Yep! They are processed using the scripts/qapi/ python package, the QAPI 
generator, which builds those definitions into concrete C types, wires 
up the command handlers for the QMP socket, and so on.

> 2) These are then registered using qmp_register_command.

Yeah, but in most cases the code generator actually handles this part 
for you. Every QMP command we have is (to my knowledge) defined as a 
'command' in the JSON files.

All one has to do as the implementor is to write a function named 
"qmp_my_command_name" with the correct arguments and types. (And make 
sure it gets linked into the final binary!)

> 3) When a QMP request is initiated, the commands respective C function 
> is found from the
> registered list of commands and is dispatched. One of the main functions 
> responsible for the
> finding and dispatching of qmp_* functions is qmp_dispatch in 
> qapi/qmp-dispatch.c. Which
> is invoked from monitor/qmp.c upon a QMP request. The result is then 
> published to the user
> through monitor_qmp_respond -> qmp_send_response.

I believe so. I haven't actually looked too closely at how the API 
wrangler/dispatcher code works. The high-level abstraction is actually 
pretty good in most cases.

> Similar stuff happens to events too, the difference being, the function 
> definitions are autogenerated
> depending on their schema, whereas for commands only the function 
> prototypes are generated.
> The events can be emitted through qapi_event_send_EVENT_NAME functions. 
> These functions
> convert C to JSON and call qapi_event_emit which then finally calls the 
> monitor function to display an
> event to the user.
> 

Yep, exactly.

> Few things I couldn't figure out and understand are
> 1) Who informs the monitor that the command is been issued? Since there 
> are many ways to
> connect to the monitor, I think there should be a generic API which 
> informs about input data.
> But I can't find the code behind all this.

Yes. monitor/qmp.c handles the implementation of the monitor, but 
doesn't specify the actual transports for how the data arrives.

We rely on the chardev for that. See the signature for monitor_init_qmp, 
which receives a "chardev" and then uses it to start listening for data.

> Before sending this mail, I decided to give this another try and found
> qemu_chr_fe_set_handlers is responsible for register the handlers for 
> input and output. Is that
> right? And also does chr_fe mean character_front_end?
> 

QEMU likes to separate out the idea of a frontend and a backend to a 
device. A virtual device presented to a guest as some specific model of 
hardware is the frontend.

The way we achieve the functionality of that device on the user's 
physical machine is the device backend. For character devices, 
(chardev), the backend might just be stdio on your terminal.

...QMP is acting kind of like a frontend device in that it's a user of a 
backend, but it's not really a guest-facing device. FE/BE distinctions 
get kind of weird at times for that reason.

> 2) I couldn't understand QEMU co-routines in general. In this case, I 
> couldn't understand the
> coroutine code in qmp_dispatch in qapi/qmp-dispatch.c. Also please 
> explain OOB in simple
> terms? How are they different from normal commands? And also their 
> relation with coroutines.
> 

Coroutines are a type of "cooperative" user scheduling. In Linux, this 
means that the user process itself switching between tasks at its own 
discretion, independent of the Linux scheduler.

It is "cooperative" because each task needs to indicate when it is ready 
to yield, they are not pre-empted. When a task needs to wait for an 
operation to be ready, it can yield to allow another task to run.

In C on Linux, you could implement this with stackswaps (makecontext, 
swapcontext, setcontext and so on), but there are other ways, and other 
OSes that need an implementation. Look at `coroutine-ucontext.c` for one 
possible implementation.

QMP uses them to dispatch certain commands; those marked as such in 
those qapi JSON files. Look at the definition for 'block_resize'.

OOB commands are complicated, check the docs/devel/qmp-spec.txt file for 
more info on those. Simply (with lots of caveats and gotchas) is that 
QMP commands are processed one at a time in FIFO order. OOB commands, 
however, will "skip the queue" and may be processed immediately. That's 
roughly why "OOB" exists; it's to send critical commands like "cancel" 
or "exit" to try and un-jam QEMU when it gets stuck processing a 
previous command.

Because of this, the handling over what threading context we execute 
those commands in is handled a little differently / more carefully.

> Thanks,
> Niteesh.
> 

--js


