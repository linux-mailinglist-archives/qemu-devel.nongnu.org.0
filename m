Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2522F3BBF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:12:36 +0100 (CET)
Received: from localhost ([::1]:51806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQxt-00063G-MX
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzQwT-00050C-UC
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:11:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzQwP-0002l4-O2
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610485859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fanS8M9Ty3pe+qSwbaWez2zgKp+hzL0SRfEq5Tu9T0Y=;
 b=TisztU+IsDNq8bNPohALNmM1Tw3VAEM8xqHlWirksR4uAFSEXDwqLz4W8eXNE+as7LtTY7
 +XVOPLEebni0K+7eswmBIDYzSNVoEemrkV9DSPbrje+Lr43nPPmjjrS62Ob+Is1XYMhnE5
 9iUE4b49vpCbDijAqcMGtqA36hq503k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-J0s-f6OdNcu4l5nkdMXIRg-1; Tue, 12 Jan 2021 16:10:54 -0500
X-MC-Unique: J0s-f6OdNcu4l5nkdMXIRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EB0AB8100;
 Tue, 12 Jan 2021 21:10:53 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88DAF10013BD;
 Tue, 12 Jan 2021 21:10:49 +0000 (UTC)
Subject: Re: Call for Google Summer of Code 2021 project ideas
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
Date: Tue, 12 Jan 2021 16:10:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Stefan Hajnoczi <stefanha@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 6:47 AM, Stefan Hajnoczi wrote:
> Dear QEMU, KVM, and rust-vmm community,
> QEMU will apply for Google Summer of Code
> (https://summerofcode.withgoogle.com/) again this year.  This internship
> program offers paid, 10-week, remote work internships for
> contributing to open source.  QEMU can act as an umbrella organization
> for KVM kernel and rust-vmm projects too.
> 
> Please post project ideas on the QEMU wiki before February 14th:
> https://wiki.qemu.org/Google_Summer_of_Code_2021
> 
> What's new this year:
>   * The number of internship hours has been halved to 175 hours over
>     10 weeks. Project ideas must be smaller to fit and students will have
>     more flexibility with their working hours.
>   * Eligibility has been expanded to include "licensed coding school or
>     similar type of program".
> 
> Good project ideas are suitable for 175 hours (10 weeks half-day) work by a
> competent programmer who is not yet familiar with the codebase.  In
> addition, they are:
>   * Well-defined - the scope is clear
>   * Self-contained - there are few dependencies
>   * Uncontroversial - they are acceptable to the community
>   * Incremental - they produce deliverables along the way
> 
> Feel free to post ideas even if you are unable to mentor the project.
> It doesn't hurt to share the idea!
> 

I have one that is probably way too ambitious, but requires a particular 
skillset that might be of good interest to a student that has some 
experience in the area already.

The idea is for a TUI qmp-shell (maybe using urwid?) to create an 
irssi-like REPL interface for QMP. The idea would be to mimic the 
mitmproxy TUI interface (Check it out if you haven't!)

All the ideas below are extremely tentative to give a basic gist of what 
I mean; exact layouts/hotkeys/etc are for the sake of explanation only.

Essentially, I want an interface like this:

-----------------------------------------------------------
| QMP Mode                                                |
|=========================================================|
|                                                         |
| Welcome to the Qemu Machine Protocol shell.             |
| Please type /help or Ctrl+H to see available commands.  |
|                                                         |
|                                                         |
|                                                         |
|---------------------------------------------------------|
| >                                                       |
-----------------------------------------------------------

commands are entered in the bottom and appear in a log window above, 
appearing most-recent last, like irssi works.

As an example, let's say we issue block-dirty-bitmap-add:

--------------------------------------------------------
| > block-dirty-bitmap-add node=ide0hd0 name=mybitmap0 |
--------------------------------------------------------

(...syntax up for debate...! We want something easy to parse, but easy 
to type. For structured data, that's Hard.)

we press [Enter] to submit the command, and the history now shows:

-------------------------------------------------
| QMP Mode                                      |
|===============================================|
|                                               |
|                                               |
|                                               |
| [11:28] block-dirty-bitmap-add [Pending ...]  |
|-----------------------------------------------|
| >                                             |
-------------------------------------------------

After a few moments, the command resolves:

----------------------------------------
| QMP Mode                             |
|======================================|
|                                      |
|                                      |
|                                      |
| [11:28] block-dirty-bitmap-add [OK]  |
----------------------------------------
| >                                    |
----------------------------------------

The basic unit of history here is either an RPC call/response pair or an 
asynchronous QMP event.

Clicking on the history pane or pressing Alt+↑ or Alt+↓ (Mimics irssi 
keys for switching buffers, let's say it's user-configurable) to change 
focus to the history pane:

------------------------------------------------------------
| Command History Mode                                     |
|==========================================================|
|                                                          |
|                                                          |
|                                                          |
| [11:28] block-dirty-bitmap-add [OK]                      |
-----------------------------------------------------------|
| Use ↑ or ↓ to select a command, press [Enter] to inspect |
------------------------------------------------------------

Using the arrow keys, you can highlight the history item and then press 
<Enter> to change the log pane to a details pane for that item, showing:

------------------------------------------------------
| Details: block-dirty-bitmap-add                [X] |
|====================================================|
|                                                    |
| [11:28:01] -> {                                    |
|    "execute": "block-dirty-bitmap-add",            |
|    "arguments": {                                  |
|      "node": "ide0hd0",                            |
|      "name": "mybitmap0"                           |
|    }                                               |
| }                                                  |
|                                                    |
| [11:28:02] <- {                                    |
|   "return": {}                                     |
| }                                                  |
|                                                    |
|----------------------------------------------------|
| Press 'Q' or Backspace to close details pane       |
------------------------------------------------------

 From here, maybe you could do a few things, like press a button to view 
the raw QMP I/O for the purposes of copy-pasting elsewhere, or just 
press Q/H/Backspace to go back to the history view.


Interesting abilities this style of shell can provide:

(1) The ability to render asynchronous events from the server in the log 
window without overwriting the user's command buffer. (In contrast to 
qmp-shell today, which cannot show async events until the user presses 
enter again to prompt a check for them.)

(2) The ability to asynchronously reconnect to servers on connection 
failures.

(3) The ability to collapse command:response pairs into one summarized 
line in the log, which can be expanded for more information later with a 
keypress.

(4) (As a future add-on, beyond current scope) The ability to add a 
status pane widget that might show current running jobs, the current 
machine execution status, etc.



As options, users should be able to:

1. Choose the history display mode live at runtime:
   a) Summarized command history (as shown above)
   b) Summarized JSON history
      (one item per message, no grouping, purely linear,
       shows a one-line summary of the message.)
   c) Full JSON history
      (one item per message, JSON messages are rendered in full.)
   d) Pretty JSON history
      (one item per message, JSON messages are pretty-printed.)

   e.g. Ctrl+V could change the "verbosity" of the messages, and the
   history log will be re-rendered to reflect the new setting.

2. Customize hotkeys for switching between command mode and history 
mode; quitting the details view, etc.

3. toggle on/off automatic command execution logging; or manually 
(Ctrl+S?) save history to file. The format might need some light markup 
to indicate directionality, timestamps, and so on.



Other things that might be of interest, but are beyond the scope of a 
GSoC/Outreachy internship:

1. readline-esque hotkey functionality for the command input bar, 
including command history, autocomplete for command names, etc. If we 
aren't using readline itself anymore, these things will have to be 
implemented somehow. There are libraries that support this: 
https://github.com/rr-/urwid_readline

2. Recording execution macros; subsets of commands you wish to replay 
easily.

3. Raw input mode: allow the user to paste a raw JSON command directly 
into the command bar.

4. Configuring our GTK interface to open up qmp-shell inside one of the 
terminal panes. (Kevin Wolf suggested this or something like it once, 
and I rather like the idea.)

5. "Shell Builtins" -- analogous to the same in bash -- additional 
commands and routines that help perform certain actions that might 
require complex, multi-part steps.

6. Augmented commands -- commands that don't require multi-part phases, 
but ones in which the shell might offer enhanced readouts for. An 
example would be integrating Vladimir's block graph rendering script to 
automatically fire off when block-query is issued. (If the user has a 
graphical session running, the libraries are installed, etc.)



See alsos; prior art, &c:

- irssi as an example of continuous, asynchronous history:

https://irssi.org/

- mitmproxy, which heavily inspired this idea with its use of urwid to 
show a history of "packets" which can be interrogated later from within 
the interface

https://mitmproxy.org/

- aioconsole -- an async python REPL loop for interactively writing 
async code in python. It might have good ideas to steal!

https://pypi.org/project/aioconsole/

- urwid: a TUI framework for Python; it is used by mitmproxy to 
implement its interface.

http://urwid.org/

- urwid readline library: implements readline-esque hotkeys for urwid, 
but (maybe) doesn't respect readline config, if any. It is a 
reimplementation.

https://github.com/rr-/urwid_readline





Target skillset for students:
- Intermediate Python
- Some exposure to async programming, coroutines, etc.
- Some experience with GUI programming concepts, in any toolkit or language
- A willingness to use gradually typed python O:-)

I don't expect this project to involve much, if any, C; but familiarity 
with the linux shell ecosystem will be an asset when choosing default 
behaviors, mimicking other tools, etc.

I have already written a fully asyncio QMP library; I would expect this 
new library to be used. It should be fully operational, but might 
require API changes when we begin to use it for a serious endeavor.

> I will review project ideas and keep you up-to-date on QEMU's
> acceptance into GSoC.
> 
> For more background on QEMU internships, check out this video:
> https://www.youtube.com/watch?v=xNVCX7YMUL8
> 
> Stefan
> 


