Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38478316C81
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:24:10 +0100 (CET)
Received: from localhost ([::1]:53054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tDl-0001I0-9k
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l9suC-0006ge-Oj
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:03:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l9su7-0005xw-Qa
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612976629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ajLml0cFkdNQ2lAUJlMZbFc5EJsRDMwdZLLJUxj5r4=;
 b=ikjhQV+9vBFRZgk//0GMGM5sDyDM3y85sn1GglNV3Yi18G1uDY9D6Mi4B7kmiVds9v2973
 mdA8g2krGjm/vwBBgHloSY43ToaZaGUH3INzfkhKJdjzx3m6BOzc1cMi07R2eDVEO11yyV
 c/wSn65G82aLlsEP0NhYvUDdDkT/CO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-fCtUTkscN26j5GKIEOhdgg-1; Wed, 10 Feb 2021 12:03:47 -0500
X-MC-Unique: fCtUTkscN26j5GKIEOhdgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02B4C104ED6A;
 Wed, 10 Feb 2021 17:03:46 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79DCC18AA1;
 Wed, 10 Feb 2021 17:03:45 +0000 (UTC)
Subject: Re: Interested in contributing to QEMU
To: "Niteesh G. S." <niteesh.gs@gmail.com>, qemu-devel@nongnu.org
References: <CAN6ztm-jdqqz=RteqcnSPObqatS8yiA9_QYVu_Csuvz3HjFCsQ@mail.gmail.com>
 <8962e94a-80d4-6272-3b4e-f81dfa43ad37@redhat.com>
 <CAN6ztm93eFZdtN6CTreoM-s-kF7m8f6oxpOWyez2V=3sTaOSUw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <9965cb74-96aa-cc4d-01bb-aa7ff6fd8db5@redhat.com>
Date: Wed, 10 Feb 2021 12:03:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAN6ztm93eFZdtN6CTreoM-s-kF7m8f6oxpOWyez2V=3sTaOSUw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:57 AM, Niteesh G. S. wrote:
> Hello John,
> On Mon, Feb 8, 2021 at 8:44 PM John Snow <jsnow@redhat.com 
> <mailto:jsnow@redhat.com>> wrote:
>     On 2/7/21 12:01 PM, Niteesh G. S. wrote:

[...]

> 
> 
> Which one in your opinion will yield a faster response, Mailing list or IRC?
> My problem with IRC is, I don't have an IRC bouncer set up so I miss
> some conversations. Which one is simpler to use? There are many options
> available. Is there something that will not require me to host a server?
> 

Indeed one of the problems with IRC :)

IRC can be faster if you happen to join at the right time, when people 
are around and paying attention. We generally conduct interviews and 
meetings for GSoC/Outreachy at scheduled times on IRC.

If you don't get an answer fairly quickly on IRC, send a mail. If you'd 
like to chat more interactively than mail allows, try and ask for an 
explicit time for someone to meet with you on IRC.

>     See the end of this mail for instructions on how to join, if you
>     need them.
> 
> I am already part of the QEMU IRC channel. But thanks for these 
> instructions.
> 

Sorry, I wasn't sure! I try to be aware that IRC is increasingly a thing 
that only weird old coots use :p

[...]

> 
> 
> Thank you so much for the detailed answer. This helped a lot.
> After reading the docs and messing around with simple commands.
> I am confused about few things.
> 
> 1) What is the difference between QMPShell and HMPShell? My understanding
> after going through code and doco is both talk to QEMU using QMP and 
> basically
> do the same thing but HMPShell is a subset of QMP shell which is 
> more human-friendly
> compared to QMPShell. Is that right?
> 

"It's complicated ..."

HMP shell is an older protocol that QEMU has that is meant to be more 
human-friendly, yes. Many of its commands are implemented in terms of 
QMP commands, but not all of them. It isn't right to call it a "subset".

QMP was introduced to create an API that was more machine-friendly than 
HMP, but we didn't finish porting everything from HMP to QMP, for a few 
reasons.

(1) HMP does not have any backwards compatibility promises; this makes 
it more appealing for various debugging commands and alpha/beta versions 
of commands. QMP is meant to have fairly strict backwards compatibility 
and a reliable API.

(2) QMP is designed as a control channel and not a data transfer 
channel, so some commands that may transmit large amounts of data or 
take indeterminate amounts of time have remained stuck in HMP without a 
proper QMP equivalent.

Naturally, you can use QMP to issue HMP-only commands if you want. There 
are a few uses of this in ./tests/qemu-iotests to do various "unsafe" 
things.

Daniel Berrange is working on porting "savevm" from HMP to QMP as one of 
our last holdouts that isn't just debugging/query stuff.

Whether or not we want to sunset HMP long-term is, AFAIK, an unresolved 
question. There are obvious uses for a user-friendly shell. Part of the 
qmp-shell revamp project is to investigate the viability of a 
user-friendly shell backed only by QMP, where the "friendly" bits are 
outside of QEMU proper and not subject to backwards compatibility promises.

> 2) When I press <CTRL-A> - C in QEMU I get a monitor prompt, after
> reading the man page I go to know that I can use telnet or socat to control
> as well. Is this another interface to QEMU which uses QMP?
> 

I'm not sure I know what this keypress does! If you see a prompt, 
though, it's HMP. Type "help" and send a newline.

The QMP protocol is described somewhere in /docs/ like I pointed out in 
my reply. You should get a greeting and you should be able to post a qmp 
capabilities handshake and get a reply.

>     4) Understanding my project
> 
>     If you're still interested in my project, I'd recommend trying out
>     qmp-shell against a running QEMU instance and issuing a few basic,
>     boring commands ("query-status" is a good candidate) and seeing how
>     that
>     works.
> 
>     Then, I'd take a look at some of the other projects I mentioned
>     (mitmproxy, irssi) to get a sense of what the work is here. This is
>     largely a UI/API programming task, and there's real work to do on the
>     AQMP library, but it's probably closer to the surface than the deep
>     technical internals of QEMU.
> 
>     It might be a good introductory project that helps you get a better
>     overview of the internals of QEMU if you're interested in more
>     hardware-related aspects, but it still requires you have at least some
>     interested in UI programming and API design.
> 
>     Phil's project might involve hardware specifics quite a bit more than
>     mine, while still teaching you some overview of QMP as a necessity of
>     the project.
> 
> TBH UI and Async are both quite new to me, I have only done CLI
> stuff since there isn't much UI in low-level dev. I also wanted to try 
> out async
> dev at a serious scale but never got an opportunity to do so. My rationale
> behind choosing Phil's project is it would let me learn about the hardware
> emulation and more importantly the visualization stuff using QEMU. But since
> your project involves also async stuff I would love to work on your 
> project if
> you allow me to ;).
> 

Yup, understood.

>     If you remain interested after the above, I can point you towards some
>     more concrete tasks that need doing for you to get a fairly concrete
>     sense of what the project entails.
> 
> Please, If you have any small tasks pending, I would like to work on them.
> 

OK: I think I need to be careful about "issuing" work to someone who 
isn't (yet) accepted into the program -- I shouldn't misrepresent this 
arrangement -- but I can give you some more research tips that may help 
you find your footing.

We can work on getting to know QMP a bit better; it sounds like it'd be 
relevant for both projects.

Try using '-qmp qmp.sock,server,nowait' when you boot up QEMU and then 
open the qmp.sock file with socat and try messing with it.

Try going to ./qapi/ in the source tree and "git grep event" to find 
some event definitions. try grepping for that event name in the QEMU 
tree at large and try to work out how QEMU emits these events.

Try *adding* an event somewhere in ./qapi/ and modifying QEMU to emit 
this event. Try using rlwrap and socat to connect to this QMP socket and 
verify that your event is being sent over the wire. Depending on where 
you add the event, it may be helpful to start QEMU in a paused state and 
issue a resume command from QMP to make sure you have time to connect to 
the socket.

For more hardware-oriented avenues of exploration, I'd encourage 
reaching out to phil, who seems to have a knack for finding weird 
embedded devices to babysit :)

> 
>      > I would like to work on these projects even outside of GSoC if
>     someone
>      > is ready to
>      > mentor in their free time :).
>      >
> 
> Thanks,
> Niteesh.
> 
>     Feel free to join #qemu-gsoc on irc.oftc.net <http://irc.oftc.net>.
>     If you've not joined an
>     IRC channel before, it's kind of like a prehistoric slack channel.
> 
>     Linux GUI: xchat, hexchat
>     Linux TUI: irssi, WeeChat
> 
>     OSX GUI: LimeChat, Colloquy (I've never used either)
>     OSX TUI: irssi and weechat should be available via ports (Not tried.)
> 
>     Windows GUI: mIRC, XChat
> 
> 
>     I'm jsnow on OFTC. You can use my nickname at the start of a message
>     ("jsnow: Hello, this is Niteesh from the mailing list") and it will
>     show
>     me a notification -- but the hours I am paying attention to IRC are
>     around 10AM - 7PM EST. (15:00 - 00:00 GMT)
> 
>     I can be around later by request (00:00 - 05:00 GMT) if you give me
>     some
>     advance notice.
> 
>      > Thanks
>      > Niteesh.
>      >
>      >
> 


