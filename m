Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF68315139
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:09:08 +0100 (CET)
Received: from localhost ([::1]:56786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ThT-0007w8-Pb
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1l9TWp-00021H-OT
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:58:07 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1l9TWf-000878-So
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:58:07 -0500
Received: by mail-il1-x132.google.com with SMTP id q9so16153412ilo.1
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 05:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hk3eMWnXrpDyeL/SNVQ6tVtuG2mrzqzlCQddB7G+zpI=;
 b=qMD0kKVpeE4PVBbDJVoz0oyV+0XJS+1w+r68PygNKufUWBtkqSewCLYwWDTbWQQ2NF
 Acqiai32YHpUuNfis0qMGifk1Snua61PvodpFD9UtuvnBFQUCwunElJVxRBDe7YV6R7N
 1Oi0p+Gn9IYJnIQ3Xf5JyYI4la4WgBRFDM4q/8V+35asNmyzyWNThhiocrNwh2ybItlr
 BatL6Ao7UrjyRpu3rplc9fj3rF7/iQNbcnQZnuLtp2BxQz3/0N3AhVg7drjJl/U6+YBw
 Qg0ppKKcCfQT+teBhRb4Y3Kjs+FoZxOhNOp6dcgkEnYBMie0JUUC0JdITLD6xfMK9OsK
 NnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hk3eMWnXrpDyeL/SNVQ6tVtuG2mrzqzlCQddB7G+zpI=;
 b=sSVjTRnwmKlL5h3hR1x8Ugn5pYmMzbInE3+OXvHbjput6BaBGZGj0Aqjoxke+qhcny
 59v5ehTs3vqoFyCg6qUHV/KCaxRYodDz0FnnlU6beYR4yhuG6cx9hf51aRNjGKnCRRZX
 eLUZ/aHTN8dNGME9ec4v/vSF6gmPPgx0hIzYrtyo3o1vIwid17nkh+3q60pkAfiGWkZk
 K5GX9g8SjVlrQQ4I3lD0EgF55d6TYDjj8vhHtdb57QSbCvIHBch7ri9LjtnK/YX7F3ev
 ndUQS1U5M4bqAKIKoe9GD1Y9ciWigtT13a6M5pn04ULGY36WTXzU0dshPpo3NkiXPsEB
 F1xQ==
X-Gm-Message-State: AOAM533foHV/lQMDFVgh2rhM+KI9wjaFIpKomiD4JLNStCkn/pCExFH0
 wfRnvWuQ0YLpAet99wVn9at9tP3aUT8B7oMPlGI=
X-Google-Smtp-Source: ABdhPJx3baFIzLPpi/vTIyKqT+jf/4EfIqUAto+Q+9iDqUs7YgqiMC/kR3HqiZt8YprZgp4xTpaZeZPb6nUg+kmLs0M=
X-Received: by 2002:a05:6e02:130e:: with SMTP id
 g14mr19488592ilr.90.1612879074653; 
 Tue, 09 Feb 2021 05:57:54 -0800 (PST)
MIME-Version: 1.0
References: <CAN6ztm-jdqqz=RteqcnSPObqatS8yiA9_QYVu_Csuvz3HjFCsQ@mail.gmail.com>
 <8962e94a-80d4-6272-3b4e-f81dfa43ad37@redhat.com>
In-Reply-To: <8962e94a-80d4-6272-3b4e-f81dfa43ad37@redhat.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Tue, 9 Feb 2021 19:27:28 +0530
Message-ID: <CAN6ztm93eFZdtN6CTreoM-s-kF7m8f6oxpOWyez2V=3sTaOSUw@mail.gmail.com>
Subject: Re: Interested in contributing to QEMU
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004f7bb305bae7ac69"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000004f7bb305bae7ac69
Content-Type: text/plain; charset="UTF-8"

Hello John,
On Mon, Feb 8, 2021 at 8:44 PM John Snow <jsnow@redhat.com> wrote:

> On 2/7/21 12:01 PM, Niteesh G. S. wrote:
> > Hello all,
> >
> > I am Niteesh, a junior student(3rd year) pursuing Electronics and
> > Communication
> > engineering. I was also a GSoC student for RTEMS last year. My main area
> of
> > interest is low-level development (OS, Emulators, Hardware design, etc).
> >
>
> QEMU certainly is the right place for low-level!
>
> > I wanted to start contributing from last year itself but was occupied
> > with academic
> > work. I have started working on small patches. My ultimate goal is to
> > learn about
> > how QEMU works, contribute and learn as much as possible.
> >
> > I tried going through the Arduino emulation code. I was able to
> > understand it from
> > a high level but couldn't understand underlying details. I went through
> > few blog
> > posts related to QEMU internals but they didn't help much. I plan to
> > step through
> > the code but the sheer size of the codebase is scary(Tips regarding
> > debugging are
> > very much welcomed). AFAIK the source code is mostly the documentation
> for
> > QEMU. If someone knows any docs or articles that will help a beginner
> > get started
> > it would be great.
> >
>
> Depending on what you'd like to debug, the debugging tips are going to
> be different. I am not sure of the quality of our Arduino code as I have
> not touched it personally.
>
> Anything concrete you'd like to ask about how QEMU works? You can always
> stop by the IRC channel to ask some questions if you're afraid of
> cluttering up the email list.


Which one in your opinion will yield a faster response, Mailing list or IRC?
My problem with IRC is, I don't have an IRC bouncer set up so I miss
some conversations. Which one is simpler to use? There are many options
available. Is there something that will not require me to host a server?

See the end of this mail for instructions on how to join, if you need them.


I am already part of the QEMU IRC channel. But thanks for these
instructions.

>
> > I would also like to take part in GSoC this year. I find the below two
> > projects interesting
> > 1)
> >
> https://wiki.qemu.org/Google_Summer_of_Code_2020#QEMU_emulated_Arduino_board_visualizer
> > <
> https://wiki.qemu.org/Google_Summer_of_Code_2020#QEMU_emulated_Arduino_board_visualizer
> >
> > This one is from last year AFAIK no one has worked on it. If so I would
> like
> > to work on it. I have CC'ed the mentors of this project to share some
> > more details
> > regarding it. Have you guys decided on the netlist parser lib, UI lib?
> > Is there something
> > that I could work on or read to get myself familiarized with the JSON
> > event IO stuff?
> >
>
> I don't think we have the events this project described in the latest
> development branch of QEMU, but maybe Phil has something in development
> somewhere. I'll let him answer you, but, it's likely they intend to use
> QMP here, which is relevant below, too:
>

OK and thanks.

>
> > 2)
> >
> https://wiki.qemu.org/Google_Summer_of_Code_2021#Interactive.2C_asynchronous_QEMU_Machine_Protocol_.28QMP.29_text_user_interface_.28TUI.29
> > <
> https://wiki.qemu.org/Google_Summer_of_Code_2021#Interactive.2C_asynchronous_QEMU_Machine_Protocol_.28QMP.29_text_user_interface_.28TUI.29
> >
> > This is something that I don't know much about. I have a basic idea
> > about what
> > QMP is but I never used it. The docs say that the Async QMP library is a
> > work
> > in progress. If someone can hook me up with some small tasks in this
> > library it would
> > be really helpful in improving my understanding.
> >
>
> 1) About QMP and QAPI:
>
> QMP is the JSON-like runtime protocol that QEMU supports. These two
> documents should get you started on understanding what QMP is and how it
> works:
>
>
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/qmp-intro.txt
>
>
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/qmp-spec.txt
>
> There's a python script (scripts/qmp/qmp-shell) that can be used to
> issue an unsupported* short-hand syntax that translates into "real" QMP.
> Or, as qmp-intro.txt says, you can use telnet or socat to copy/paste
> JSON straight into the socket.
>
> The commands that QMP accepts are defined by QAPI; those are defined in
> ./qapi/*.json -- a component called the QAPI generator digests this
> information and generates the runtime server code that handles parsing
> and dispatch.
>
>
> 2) About QMP Events
>
> Normally, after the initial handshake, QMP is a call-and-response
> protocol. The client sends an RPC request, the server executes the
> command and sends the response.
>
> QMP also supports asynchronous events, though. At any point, QMP can
> send an unprompted status message that informs the client of some state
> change within QEMU. This is seen most often for changes in the system
> emulator runstate, i.e. if QEMU is paused or resumed, etc.
>
> (It's also used for reporting block device errors, long-running task
> status updates like backup, etc.)
>
> It's likely that Phil wants to use this functionality to send
> information about GPIO state changes such that a client can render a
> meaningful visualization.
>


> 3) About AQMP
>
> QEMU today has a QMP library written in Python at ./python/qemu/qmp.py.
> This is a synchronous library that blocks execution until the command is
> done executing on the server.
>
> We have augmented it over the years to support caching events we
> received while waiting for execution to finish (for later retrieval),
> but it requires the caller to go back and check those cached events. It
> does not offer event handling callbacks. It is a very low-level library
> that is prone to race conditions depending on how the test using it is
> written.
>
> qmp-shell uses the old qmp library: it does not show you incoming events
> as they happen. You have to press "enter" with an empty buffer to coax
> the shell to check for new events and print them for you, which can be a
> little annoying if you want live updates.
>
> I started writing AQMP using Python's asyncio/await keywords to create a
> more modern, flexible QMP library to replace it. One of the hopes I have
> for this library is that it will handle asynchronous events much more
> nicely. It's my hope that qmp-shell can be upgraded to use this newer
> library instead.
>
> The AQMP library is about half finished: It supports all of the basic
> functionality of the protocol, but needs work on the callback API for
> dispatching event responses. It also likely needs a lot of testing and
> polish that's likely to become obvious as anyone tries to integrate it
> into a real program like a theoretical qmp-shell-2.0.
>

Thank you so much for the detailed answer. This helped a lot.
After reading the docs and messing around with simple commands.
I am confused about few things.

1) What is the difference between QMPShell and HMPShell? My understanding
after going through code and doco is both talk to QEMU using QMP and
basically
do the same thing but HMPShell is a subset of QMP shell which is
more human-friendly
compared to QMPShell. Is that right?

2) When I press <CTRL-A> - C in QEMU I get a monitor prompt, after
reading the man page I go to know that I can use telnet or socat to control
as well. Is this another interface to QEMU which uses QMP?

4) Understanding my project
>
> If you're still interested in my project, I'd recommend trying out
> qmp-shell against a running QEMU instance and issuing a few basic,
> boring commands ("query-status" is a good candidate) and seeing how that
> works.
>
> Then, I'd take a look at some of the other projects I mentioned
> (mitmproxy, irssi) to get a sense of what the work is here. This is
> largely a UI/API programming task, and there's real work to do on the
> AQMP library, but it's probably closer to the surface than the deep
> technical internals of QEMU.
>
> It might be a good introductory project that helps you get a better
> overview of the internals of QEMU if you're interested in more
> hardware-related aspects, but it still requires you have at least some
> interested in UI programming and API design.
>
> Phil's project might involve hardware specifics quite a bit more than
> mine, while still teaching you some overview of QMP as a necessity of
> the project.
>

TBH UI and Async are both quite new to me, I have only done CLI
stuff since there isn't much UI in low-level dev. I also wanted to try out
async
dev at a serious scale but never got an opportunity to do so. My rationale
behind choosing Phil's project is it would let me learn about the hardware
emulation and more importantly the visualization stuff using QEMU. But since
your project involves also async stuff I would love to work on your project
if
you allow me to ;).


> If you remain interested after the above, I can point you towards some
> more concrete tasks that need doing for you to get a fairly concrete
> sense of what the project entails.
>

Please, If you have any small tasks pending, I would like to work on them.


>
> > I would like to work on these projects even outside of GSoC if someone
> > is ready to
> > mentor in their free time :).
> >
>

Thanks,
Niteesh.

> Feel free to join #qemu-gsoc on irc.oftc.net. If you've not joined an
> IRC channel before, it's kind of like a prehistoric slack channel.
>
> Linux GUI: xchat, hexchat
> Linux TUI: irssi, WeeChat
>
> OSX GUI: LimeChat, Colloquy (I've never used either)
> OSX TUI: irssi and weechat should be available via ports (Not tried.)
>
> Windows GUI: mIRC, XChat
>
>
> I'm jsnow on OFTC. You can use my nickname at the start of a message
> ("jsnow: Hello, this is Niteesh from the mailing list") and it will show
> me a notification -- but the hours I am paying attention to IRC are
> around 10AM - 7PM EST. (15:00 - 00:00 GMT)
>
> I can be around later by request (00:00 - 05:00 GMT) if you give me some
> advance notice.
>
> > Thanks
> > Niteesh.
> >
> >
>
>

--0000000000004f7bb305bae7ac69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hello John,</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">On Mon, Feb 8, 2021 at 8:44 PM John Snow &lt;<a href=3D"mailto:j=
snow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br></div=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 2/7/21 12:01 PM, Niteesh G. S. wrote:<br>
&gt; Hello all,<br>
&gt; <br>
&gt; I am Niteesh, a junior student(3rd year) pursuing Electronics and <br>
&gt; Communication<br>
&gt; engineering. I was also a GSoC student for RTEMS last year. My main ar=
ea of<br>
&gt; interest is low-level development (OS, Emulators, Hardware design, etc=
).<br>
&gt; <br>
<br>
QEMU certainly is the right place for low-level!<br>
<br>
&gt; I wanted to start contributing from last year itself but was occupied =
<br>
&gt; with academic<br>
&gt; work. I have started working on small patches. My ultimate goal is to =
<br>
&gt; learn about<br>
&gt; how QEMU works, contribute=C2=A0and learn as much as possible.<br>
&gt; <br>
&gt; I tried going through the Arduino emulation code. I was able to <br>
&gt; understand it from<br>
&gt; a high level but couldn&#39;t understand underlying details. I went th=
rough <br>
&gt; few blog<br>
&gt; posts related to QEMU internals but they didn&#39;t help much. I plan =
to <br>
&gt; step through<br>
&gt; the=C2=A0code but the=C2=A0sheer size of the codebase is scary(Tips re=
garding <br>
&gt; debugging are<br>
&gt; very much welcomed). AFAIK the source code is mostly the documentation=
 for<br>
&gt; QEMU. If someone knows any docs or articles that will help a beginner =
<br>
&gt; get started<br>
&gt; it would be great.<br>
&gt; <br>
<br>
Depending on what you&#39;d like to debug, the debugging tips are going to =
<br>
be different. I am not sure of the quality of our Arduino code as I have <b=
r>
not touched it personally.<br>
<br>
Anything concrete you&#39;d like to ask about how QEMU works? You can alway=
s <br>
stop by the IRC channel to ask some questions if you&#39;re afraid of <br>
cluttering up the email list<span class=3D"gmail_default" style=3D"font-siz=
e:small">.</span></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Which one in your opinion will yield a faster=
 response, Mailing list or IRC?</div><div class=3D"gmail_default" style=3D"=
font-size:small">My problem with IRC is, I don&#39;t have an IRC bouncer se=
t up so I miss</div><div class=3D"gmail_default" style=3D"font-size:small">=
some conversations. Which one is simpler to use? There are many options</di=
v></div><div class=3D"gmail_default" style=3D"font-size:small">available. I=
s there something that will not require me to host a server?</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
See the end of this mail for instructions on how to join, if you need them.=
</blockquote><div>=C2=A0</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">I am already part of the QEMU IRC channel. But thanks for these i=
nstructions.</div><div><span class=3D"gmail_default" style=3D"font-size:sma=
ll"></span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I would also like to take part in GSoC this year. I find the below two=
 <br>
&gt; projects=C2=A0interesting<br>
&gt; 1) <br>
&gt; <a href=3D"https://wiki.qemu.org/Google_Summer_of_Code_2020#QEMU_emula=
ted_Arduino_board_visualizer" rel=3D"noreferrer" target=3D"_blank">https://=
wiki.qemu.org/Google_Summer_of_Code_2020#QEMU_emulated_Arduino_board_visual=
izer</a> <br>
&gt; &lt;<a href=3D"https://wiki.qemu.org/Google_Summer_of_Code_2020#QEMU_e=
mulated_Arduino_board_visualizer" rel=3D"noreferrer" target=3D"_blank">http=
s://wiki.qemu.org/Google_Summer_of_Code_2020#QEMU_emulated_Arduino_board_vi=
sualizer</a>&gt;<br>
&gt; This one is from last year AFAIK no one has worked on it. If so I woul=
d like<br>
&gt; to work on it. I have CC&#39;ed the mentors of this project to share s=
ome <br>
&gt; more details<br>
&gt; regarding it. Have you guys decided on the netlist parser lib, UI lib?=
 <br>
&gt; Is there something<br>
&gt; that I could work on=C2=A0or read to get myself familiarized with the =
JSON <br>
&gt; event IO stuff?<br>
&gt; <br>
<br>
I don&#39;t think we have the events this project described in the latest <=
br>
development branch of QEMU, but maybe Phil has something in development <br=
>
somewhere. I&#39;ll let him answer you, but, it&#39;s likely they intend to=
 use <br>
QMP here, which is relevant below, too:<br></blockquote><div>=C2=A0</div><d=
iv><span class=3D"gmail_default" style=3D"font-size:small">OK and thanks.</=
span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; 2) <br>
&gt; <a href=3D"https://wiki.qemu.org/Google_Summer_of_Code_2021#Interactiv=
e.2C_asynchronous_QEMU_Machine_Protocol_.28QMP.29_text_user_interface_.28TU=
I.29" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Google_Sum=
mer_of_Code_2021#Interactive.2C_asynchronous_QEMU_Machine_Protocol_.28QMP.2=
9_text_user_interface_.28TUI.29</a> <br>
&gt; &lt;<a href=3D"https://wiki.qemu.org/Google_Summer_of_Code_2021#Intera=
ctive.2C_asynchronous_QEMU_Machine_Protocol_.28QMP.29_text_user_interface_.=
28TUI.29" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Google=
_Summer_of_Code_2021#Interactive.2C_asynchronous_QEMU_Machine_Protocol_.28Q=
MP.29_text_user_interface_.28TUI.29</a>&gt;<br>
&gt; This is something that I don&#39;t know much about. I have a basic ide=
a <br>
&gt; about what<br>
&gt; QMP is but I never used it. The docs say=C2=A0that the Async QMP libra=
ry is a <br>
&gt; work<br>
&gt; in progress. If someone can hook me up with some small tasks in this <=
br>
&gt; library it would<br>
&gt; be really helpful in improving my understanding.<br>
&gt; <br>
<br>
1) About QMP and QAPI:<br>
<br>
QMP is the JSON-like runtime protocol that QEMU supports. These two <br>
documents should get you started on understanding what QMP is and how it <b=
r>
works:<br>
<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/=
qmp-intro.txt" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu=
-project/qemu/-/blob/master/docs/interop/qmp-intro.txt</a><br>
<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/=
qmp-spec.txt" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-=
project/qemu/-/blob/master/docs/interop/qmp-spec.txt</a><br>
<br>
There&#39;s a python script (scripts/qmp/qmp-shell) that can be used to <br=
>
issue an unsupported* short-hand syntax that translates into &quot;real&quo=
t; QMP. <br>
Or, as qmp-intro.txt says, you can use telnet or socat to copy/paste <br>
JSON straight into the socket.<br>
<br>
The commands that QMP accepts are defined by QAPI; those are defined in <br=
>
./qapi/*.json -- a component called the QAPI generator digests this <br>
information and generates the runtime server code that handles parsing <br>
and dispatch.<br>
<br>
<br>
2) About QMP Events<br>
<br>
Normally, after the initial handshake, QMP is a call-and-response <br>
protocol. The client sends an RPC request, the server executes the <br>
command and sends the response.<br>
<br>
QMP also supports asynchronous events, though. At any point, QMP can <br>
send an unprompted status message that informs the client of some state <br=
>
change within QEMU. This is seen most often for changes in the system <br>
emulator runstate, i.e. if QEMU is paused or resumed, etc.<br>
<br>
(It&#39;s also used for reporting block device errors, long-running task <b=
r>
status updates like backup, etc.)<br>
<br>
It&#39;s likely that Phil wants to use this functionality to send <br>
information about GPIO state changes such that a client can render a <br>
meaningful visualization.<br></blockquote><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
3) About AQMP<br>
<br>
QEMU today has a QMP library written in Python at ./python/qemu/qmp.py. <br=
>
This is a synchronous library that blocks execution until the command is <b=
r>
done executing on the server.<br>
<br>
We have augmented it over the years to support caching events we <br>
received while waiting for execution to finish (for later retrieval), <br>
but it requires the caller to go back and check those cached events. It <br=
>
does not offer event handling callbacks. It is a very low-level library <br=
>
that is prone to race conditions depending on how the test using it is <br>
written.<br>
<br>
qmp-shell uses the old qmp library: it does not show you incoming events <b=
r>
as they happen. You have to press &quot;enter&quot; with an empty buffer to=
 coax <br>
the shell to check for new events and print them for you, which can be a <b=
r>
little annoying if you want live updates.<br>
<br>
I started writing AQMP using Python&#39;s asyncio/await keywords to create =
a <br>
more modern, flexible QMP library to replace it. One of the hopes I have <b=
r>
for this library is that it will handle asynchronous events much more <br>
nicely. It&#39;s my hope that qmp-shell can be upgraded to use this newer <=
br>
library instead.<br>
<br>
The AQMP library is about half finished: It supports all of the basic <br>
functionality of the protocol, but needs work on the callback API for <br>
dispatching event responses. It also likely needs a lot of testing and <br>
polish that&#39;s likely to become obvious as anyone tries to integrate it =
<br>
into a real program like a theoretical qmp-shell-2.0.<br></blockquote><div>=
<br></div><div class=3D"gmail_default" style=3D"font-size:small"></div><div=
><span class=3D"gmail_default">Thank you so much for the detailed answer. T=
his helped a lot.</span></div><div class=3D"gmail_default" style=3D"font-si=
ze:small">After reading the docs and messing around with simple commands.</=
div><div class=3D"gmail_default" style=3D"font-size:small">I am confused ab=
out few things.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">1) What i=
s the difference between QMPShell and HMPShell? My understanding</div><div =
class=3D"gmail_default" style=3D"font-size:small">after going through code =
and doco is both talk to QEMU using QMP and basically</div><div class=3D"gm=
ail_default" style=3D"font-size:small">do the same thing but HMPShell is a =
subset of QMP shell which is more=C2=A0human-friendly</div><div class=3D"gm=
ail_default" style=3D"font-size:small">compared to QMPShell. Is that right?=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">2) When I press &lt;CTRL=
-A&gt; - C in QEMU I get a monitor prompt, after</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">reading the man page I go to know that I =
can use telnet or socat to control</div><div class=3D"gmail_default" style=
=3D"font-size:small">as well. Is this another interface to QEMU which uses =
QMP?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
4) Understanding my project<br>
<br>
If you&#39;re still interested in my project, I&#39;d recommend trying out =
<br>
qmp-shell against a running QEMU instance and issuing a few basic, <br>
boring commands (&quot;query-status&quot; is a good candidate) and seeing h=
ow that <br>
works.<br>
<br>
Then, I&#39;d take a look at some of the other projects I mentioned <br>
(mitmproxy, irssi) to get a sense of what the work is here. This is <br>
largely a UI/API programming task, and there&#39;s real work to do on the <=
br>
AQMP library, but it&#39;s probably closer to the surface than the deep <br=
>
technical internals of QEMU.<br>
<br>
It might be a good introductory project that helps you get a better <br>
overview of the internals of QEMU if you&#39;re interested in more <br>
hardware-related aspects, but it still requires you have at least some <br>
interested in UI programming and API design.<br>
<br>
Phil&#39;s project might involve hardware specifics quite a bit more than <=
br>
mine, while still teaching you some overview of QMP as a necessity of <br>
the project.<br></blockquote><div>=C2=A0</div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">TBH UI and Async are both quite new to me, I=
 have only done CLI</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">stuff since there isn&#39;t much UI in low-level dev. I also wanted to=
 try out async</div><div class=3D"gmail_default" style=3D"font-size:small">=
dev at a serious scale but never got an opportunity=C2=A0to do so. My ratio=
nale</div><div class=3D"gmail_default" style=3D"font-size:small">behind cho=
osing Phil&#39;s project is it would let me learn about the hardware</div><=
div class=3D"gmail_default" style=3D"font-size:small">emulation and more im=
portantly the visualization stuff using QEMU. But since</div><div class=3D"=
gmail_default" style=3D"font-size:small">your project involves also async s=
tuff I would love to work on your project if</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">you allow me to ;).</div></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
If you remain interested after the above, I can point you towards some <br>
more concrete tasks that need doing for you to get a fairly concrete <br>
sense of what the project entails.<br></blockquote><div>=C2=A0</div><div><s=
pan class=3D"gmail_default" style=3D"font-size:small">Please, If you have a=
ny small tasks pending, I would like to work on them.</span></div><div><spa=
n class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I would like to work on these projects even outside of GSoC if someone=
 <br>
&gt; is ready to<br>
&gt; mentor in their free time :).<br>
&gt; <br></blockquote><div>=C2=A0</div><div><span class=3D"gmail_default" s=
tyle=3D"font-size:small">Thanks,</span></div><div><span class=3D"gmail_defa=
ult" style=3D"font-size:small">Niteesh.</span>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Feel free to join #qemu-gsoc on <a href=3D"http://irc.oftc.net" rel=3D"nore=
ferrer" target=3D"_blank">irc.oftc.net</a>. If you&#39;ve not joined an <br=
>
IRC channel before, it&#39;s kind of like a prehistoric slack channel.<br>
<br>
Linux GUI: xchat, hexchat<br>
Linux TUI: irssi, WeeChat<br>
<br>
OSX GUI: LimeChat, Colloquy (I&#39;ve never used either)<br>
OSX TUI: irssi and weechat should be available via ports (Not tried.)<br>
<br>
Windows GUI: mIRC, XChat<br>
<br>
<br>
I&#39;m jsnow on OFTC. You can use my nickname at the start of a message <b=
r>
(&quot;jsnow: Hello, this is Niteesh from the mailing list&quot;) and it wi=
ll show <br>
me a notification -- but the hours I am paying attention to IRC are <br>
around 10AM - 7PM EST. (15:00 - 00:00 GMT)<br>
<br>
I can be around later by request (00:00 - 05:00 GMT) if you give me some <b=
r>
advance notice.<br>
<br>
&gt; Thanks<br>
&gt; Niteesh.<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000004f7bb305bae7ac69--

