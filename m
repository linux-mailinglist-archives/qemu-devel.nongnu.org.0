Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8FF319DF8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 13:13:12 +0100 (CET)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAXJv-0003Fv-Vu
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 07:13:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lAXHX-0002MF-9e
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:10:43 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:40451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lAXHU-00037t-4a
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:10:43 -0500
Received: by mail-io1-xd2e.google.com with SMTP id z21so7658926iob.7
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 04:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EZ4RcBbd+cyOK71AmD0/tINVpSGbqtki1tlOsOd0aUU=;
 b=r4QIpXbQN3YAsaP25zaSYwLcdlfSqd3AdCnsIHpr0pesVwFaFJHMBI1WxPz1FPb9Sb
 nkcNNzPZL9rKOPif4H4u/Ir5FMdHpZLcnaOk9IhmqpRv4KJLaGl4wI5U8GTL7+ak/Ht5
 hagGd7NhWeMog3qusw3lQGqsh72MudqyPCrvCXGvIdywVToaXoA/locp/qr9wzvI8vxP
 Hxi6Y/gT1FV/A0ufMHbihjTQuueQjgoK7uNSoLeT6RjLEQRUnxEHrNw5+3Jtf69jfu7C
 4BHVwDny/WcSBTYhKq0Sfd5wsONKvMKrK+xwrc4hN+GtFFpOE76eR4euY5qMB7sj3N+B
 xczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZ4RcBbd+cyOK71AmD0/tINVpSGbqtki1tlOsOd0aUU=;
 b=Js9NMVYHsquEXz2OO+7UoDRAsJe9sc0Xfmcse81M3LBK+t/E5OcoVmne4Ez5FHVqsl
 6YE3zlWKVeyrduYBVhH8rV33RQbmDlYAOHsqc/zOFkbot9PCBpEzxG+TjIRj8v8wexb4
 M99vzTtOcrra+W7tiURQRJMhNTAc4JQP4wxpTWlZdahsn+Sy8ADaE86OkvM1peYuNoJg
 JK+hq6FzV/C/Q2bmD7P+o+7iak4tI1MyCzkOdZhUjD1KUTmY1vji4RyWHJjW3NJLgX8N
 wb4KCs+jX7rhNSTROqKhLs+DT9/P1JoMk+Y2dX7fK4KsVO8l93TMl66i1ugufUPeeIRy
 SFZw==
X-Gm-Message-State: AOAM530iIc2ceCMrbUeFpggqEcU/Hiumg8ol41DOEZmo8CZbDlvEeG7n
 BMI8LX6k11KwrfMUmMzbWlIAFWYdbMFdMzkSHIA=
X-Google-Smtp-Source: ABdhPJwQhQr7/iYc3k9VsNPUrb9m7K9PV3pUO6Q3ADrD3tfUmpKmCXfjmwASprT5NRZl8W7W1FMNm0OjzSbRUgBO4Ag=
X-Received: by 2002:a02:9083:: with SMTP id x3mr2304753jaf.17.1613131837700;
 Fri, 12 Feb 2021 04:10:37 -0800 (PST)
MIME-Version: 1.0
References: <CAN6ztm-jdqqz=RteqcnSPObqatS8yiA9_QYVu_Csuvz3HjFCsQ@mail.gmail.com>
 <8962e94a-80d4-6272-3b4e-f81dfa43ad37@redhat.com>
 <CAN6ztm93eFZdtN6CTreoM-s-kF7m8f6oxpOWyez2V=3sTaOSUw@mail.gmail.com>
 <9965cb74-96aa-cc4d-01bb-aa7ff6fd8db5@redhat.com>
In-Reply-To: <9965cb74-96aa-cc4d-01bb-aa7ff6fd8db5@redhat.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Fri, 12 Feb 2021 17:40:11 +0530
Message-ID: <CAN6ztm8OOwqxfU6s6krDac4npePuCOB_xXOzBU=b+QfG3FbhQg@mail.gmail.com>
Subject: Re: Interested in contributing to QEMU
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000297c0e05bb2286ff"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd2e.google.com
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000297c0e05bb2286ff
Content-Type: text/plain; charset="UTF-8"

Hello John,

On Wed, Feb 10, 2021 at 10:33 PM John Snow <jsnow@redhat.com> wrote:

> On 2/9/21 8:57 AM, Niteesh G. S. wrote:
> > Hello John,
> > On Mon, Feb 8, 2021 at 8:44 PM John Snow <jsnow@redhat.com
> > <mailto:jsnow@redhat.com>> wrote:
> >     On 2/7/21 12:01 PM, Niteesh G. S. wrote:
>
> [...]
>
> >
> >
> > Which one in your opinion will yield a faster response, Mailing list or
> IRC?
> > My problem with IRC is, I don't have an IRC bouncer set up so I miss
> > some conversations. Which one is simpler to use? There are many options
> > available. Is there something that will not require me to host a server?
> >
>
> Indeed one of the problems with IRC :)
>
> IRC can be faster if you happen to join at the right time, when people
> are around and paying attention. We generally conduct interviews and
> meetings for GSoC/Outreachy at scheduled times on IRC.
>
> If you don't get an answer fairly quickly on IRC, send a mail. If you'd
> like to chat more interactively than mail allows, try and ask for an
> explicit time for someone to meet with you on IRC.
>
OK.

> >     See the end of this mail for instructions on how to join, if you
> >     need them.
> >
> > I am already part of the QEMU IRC channel. But thanks for these
> > instructions.
> >
>
> Sorry, I wasn't sure! I try to be aware that IRC is increasingly a thing
> that only weird old coots use :p
>
> [...]
>
> >
> >
> > Thank you so much for the detailed answer. This helped a lot.
> > After reading the docs and messing around with simple commands.
> > I am confused about few things.
> >
> > 1) What is the difference between QMPShell and HMPShell? My understanding
> > after going through code and doco is both talk to QEMU using QMP and
> > basically
> > do the same thing but HMPShell is a subset of QMP shell which is
> > more human-friendly
> > compared to QMPShell. Is that right?
> >
>
> "It's complicated ..."
>
> HMP shell is an older protocol that QEMU has that is meant to be more
> human-friendly, yes. Many of its commands are implemented in terms of
> QMP commands, but not all of them. It isn't right to call it a "subset".
>
> QMP was introduced to create an API that was more machine-friendly than
> HMP, but we didn't finish porting everything from HMP to QMP, for a few
> reasons.
>
> (1) HMP does not have any backwards compatibility promises; this makes
> it more appealing for various debugging commands and alpha/beta versions
> of commands. QMP is meant to have fairly strict backwards compatibility
> and a reliable API.
>
> (2) QMP is designed as a control channel and not a data transfer
> channel, so some commands that may transmit large amounts of data or
> take indeterminate amounts of time have remained stuck in HMP without a
> proper QMP equivalent.
>
> Naturally, you can use QMP to issue HMP-only commands if you want. There
> are a few uses of this in ./tests/qemu-iotests to do various "unsafe"
> things.
>
> Daniel Berrange is working on porting "savevm" from HMP to QMP as one of
> our last holdouts that isn't just debugging/query stuff.
>
> Whether or not we want to sunset HMP long-term is, AFAIK, an unresolved
> question. There are obvious uses for a user-friendly shell. Part of the
> qmp-shell revamp project is to investigate the viability of a
> user-friendly shell backed only by QMP, where the "friendly" bits are
> outside of QEMU proper and not subject to backwards compatibility promises.
>
> > 2) When I press <CTRL-A> - C in QEMU I get a monitor prompt, after
> > reading the man page I go to know that I can use telnet or socat to
> control
> > as well. Is this another interface to QEMU which uses QMP?
> >
>
> I'm not sure I know what this keypress does! If you see a prompt,
> though, it's HMP. Type "help" and send a newline.
>
> The QMP protocol is described somewhere in /docs/ like I pointed out in
> my reply. You should get a greeting and you should be able to post a qmp
> capabilities handshake and get a reply.
>
Thank you for the explanation.

>
> >     4) Understanding my project
> >
> >     If you're still interested in my project, I'd recommend trying out
> >     qmp-shell against a running QEMU instance and issuing a few basic,
> >     boring commands ("query-status" is a good candidate) and seeing how
> >     that
> >     works.
> >
> >     Then, I'd take a look at some of the other projects I mentioned
> >     (mitmproxy, irssi) to get a sense of what the work is here. This is
> >     largely a UI/API programming task, and there's real work to do on the
> >     AQMP library, but it's probably closer to the surface than the deep
> >     technical internals of QEMU.
> >
> >     It might be a good introductory project that helps you get a better
> >     overview of the internals of QEMU if you're interested in more
> >     hardware-related aspects, but it still requires you have at least
> some
> >     interested in UI programming and API design.
> >
> >     Phil's project might involve hardware specifics quite a bit more than
> >     mine, while still teaching you some overview of QMP as a necessity of
> >     the project.
> >
> > TBH UI and Async are both quite new to me, I have only done CLI
> > stuff since there isn't much UI in low-level dev. I also wanted to try
> > out async
> > dev at a serious scale but never got an opportunity to do so. My
> rationale
> > behind choosing Phil's project is it would let me learn about the
> hardware
> > emulation and more importantly the visualization stuff using QEMU. But
> since
> > your project involves also async stuff I would love to work on your
> > project if
> > you allow me to ;).
> >
>
> Yup, understood.
>
> >     If you remain interested after the above, I can point you towards
> some
> >     more concrete tasks that need doing for you to get a fairly concrete
> >     sense of what the project entails.
> >
> > Please, If you have any small tasks pending, I would like to work on
> them.
> >
>
> OK: I think I need to be careful about "issuing" work to someone who
> isn't (yet) accepted into the program -- I shouldn't misrepresent this
> arrangement -- but I can give you some more research tips that may help
> you find your footing.
>
> We can work on getting to know QMP a bit better; it sounds like it'd be
> relevant for both projects.
>
> Try using '-qmp qmp.sock,server,nowait' when you boot up QEMU and then
> open the qmp.sock file with socat and try messing with it.
>
> Try going to ./qapi/ in the source tree and "git grep event" to find
> some event definitions. try grepping for that event name in the QEMU
> tree at large and try to work out how QEMU emits these events.
>
> Try *adding* an event somewhere in ./qapi/ and modifying QEMU to emit
> this event. Try using rlwrap and socat to connect to this QMP socket and
> verify that your event is being sent over the wire. Depending on where
> you add the event, it may be helpful to start QEMU in a paused state and
> issue a resume command from QMP to make sure you have time to connect to
> the socket.
>

I added an event that is emitted every keypress. It also sends the qcode of
the key pressed.
https://github.com/gs-niteesh/qemu/pull/1/commits/1684f1f499e67ec4af5f75d0cc09eb1ecf9be709
After doing this, I think I have a basic understanding of how the event
stuff works and also
what happens when a command is issued from the shell.
I have summarized my understanding below, please correct me if I am wrong
anywhere.
1) The JSON files under qemu/qapi define the QMP messages. These JSON files
are then
compiled into their C representations during the build time.
2) These are then registered using qmp_register_command.
3) When a QMP request is initiated, the commands respective C function is
found from the
registered list of commands and is dispatched. One of the main functions
responsible for the
finding and dispatching of qmp_* functions is qmp_dispatch in
qapi/qmp-dispatch.c. Which
is invoked from monitor/qmp.c upon a QMP request. The result is then
published to the user
through monitor_qmp_respond -> qmp_send_response.
Similar stuff happens to events too, the difference being, the function
definitions are autogenerated
depending on their schema, whereas for commands only the function
prototypes are generated.
The events can be emitted through qapi_event_send_EVENT_NAME functions.
These functions
convert C to JSON and call qapi_event_emit which then finally calls the
monitor function to display an
event to the user.

Few things I couldn't figure out and understand are
1) Who informs the monitor that the command is been issued? Since there are
many ways to
connect to the monitor, I think there should be a generic API which informs
about input data.
But I can't find the code behind all this.
Before sending this mail, I decided to give this another try and found
qemu_chr_fe_set_handlers is responsible for register the handlers for input
and output. Is that
right? And also does chr_fe mean character_front_end?

2) I couldn't understand QEMU co-routines in general. In this case, I
couldn't understand the
coroutine code in qmp_dispatch in qapi/qmp-dispatch.c. Also please explain
OOB in simple
terms? How are they different from normal commands? And also their relation
with coroutines.

Thanks,
Niteesh.

>
> For more hardware-oriented avenues of exploration, I'd encourage
> reaching out to phil, who seems to have a knack for finding weird
> embedded devices to babysit :)
>
> >
> >      > I would like to work on these projects even outside of GSoC if
> >     someone
> >      > is ready to
> >      > mentor in their free time :).
> >      >
> >
> > Thanks,
> > Niteesh.
> >
> >     Feel free to join #qemu-gsoc on irc.oftc.net <http://irc.oftc.net>.
> >     If you've not joined an
> >     IRC channel before, it's kind of like a prehistoric slack channel.
> >
> >     Linux GUI: xchat, hexchat
> >     Linux TUI: irssi, WeeChat
> >
> >     OSX GUI: LimeChat, Colloquy (I've never used either)
> >     OSX TUI: irssi and weechat should be available via ports (Not tried.)
> >
> >     Windows GUI: mIRC, XChat
> >
> >
> >     I'm jsnow on OFTC. You can use my nickname at the start of a message
> >     ("jsnow: Hello, this is Niteesh from the mailing list") and it will
> >     show
> >     me a notification -- but the hours I am paying attention to IRC are
> >     around 10AM - 7PM EST. (15:00 - 00:00 GMT)
> >
> >     I can be around later by request (00:00 - 05:00 GMT) if you give me
> >     some
> >     advance notice.
> >
> >      > Thanks
> >      > Niteesh.
> >      >
> >      >
> >
>
>

--000000000000297c0e05bb2286ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hello John,</div></div><div dir=3D"ltr"><div dir=3D"ltr"><div=
 style=3D"font-size:small"><br></div></div><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 10, 2021 at 10:33 PM John Snow=
 &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 2/9/21 8:57 AM, Niteesh G. S. wrote:<br>
&gt; Hello John,<br>
&gt; On Mon, Feb 8, 2021 at 8:44 PM John Snow &lt;<a href=3D"mailto:jsnow@r=
edhat.com" target=3D"_blank">jsnow@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow=
@redhat.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2/7/21 12:01 PM, Niteesh G. S. wrote:<br>
<br>
[...]<br>
<br>
&gt; <br>
&gt; <br>
&gt; Which one in your opinion will yield a faster response, Mailing list o=
r IRC?<br>
&gt; My problem with IRC is, I don&#39;t have an IRC bouncer set up so I mi=
ss<br>
&gt; some conversations. Which one is simpler to use? There are many option=
s<br>
&gt; available. Is there something that will not require me to host a serve=
r?<br>
&gt; <br>
<br>
Indeed one of the problems with IRC :)<br>
<br>
IRC can be faster if you happen to join at the right time, when people <br>
are around and paying attention. We generally conduct interviews and <br>
meetings for GSoC/Outreachy at scheduled times on IRC.<br>
<br>
If you don&#39;t get an answer fairly quickly on IRC, send a mail. If you&#=
39;d <br>
like to chat more interactively than mail allows, try and ask for an <br>
explicit time for someone to meet with you on IRC.<br></blockquote><div><sp=
an class=3D"gmail_default" style=3D"font-size:small">OK.</span>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0See the end of this mail for instructions on how to=
 join, if you<br>
&gt;=C2=A0 =C2=A0 =C2=A0need them.<br>
&gt; <br>
&gt; I am already part of the QEMU IRC channel. But thanks for these <br>
&gt; instructions.<br>
&gt; <br>
<br>
Sorry, I wasn&#39;t sure! I try to be aware that IRC is increasingly a thin=
g <br>
that only weird old coots use :p<br>
<br>
[...]<br>
<br>
&gt; <br>
&gt; <br>
&gt; Thank you so much for the detailed answer. This helped a lot.<br>
&gt; After reading the docs and messing around with simple commands.<br>
&gt; I am confused about few things.<br>
&gt; <br>
&gt; 1) What is the difference between QMPShell and HMPShell? My understand=
ing<br>
&gt; after going through code and doco is both talk to QEMU using QMP and <=
br>
&gt; basically<br>
&gt; do the same thing but HMPShell is a subset of QMP shell which is <br>
&gt; more=C2=A0human-friendly<br>
&gt; compared to QMPShell. Is that right?<br>
&gt; <br>
<br>
&quot;It&#39;s complicated ...&quot;<br>
<br>
HMP shell is an older protocol that QEMU has that is meant to be more <br>
human-friendly, yes. Many of its commands are implemented in terms of <br>
QMP commands, but not all of them. It isn&#39;t right to call it a &quot;su=
bset&quot;.<br>
<br>
QMP was introduced to create an API that was more machine-friendly than <br=
>
HMP, but we didn&#39;t finish porting everything from HMP to QMP, for a few=
 <br>
reasons.<br>
<br>
(1) HMP does not have any backwards compatibility promises; this makes <br>
it more appealing for various debugging commands and alpha/beta versions <b=
r>
of commands. QMP is meant to have fairly strict backwards compatibility <br=
>
and a reliable API.<br>
<br>
(2) QMP is designed as a control channel and not a data transfer <br>
channel, so some commands that may transmit large amounts of data or <br>
take indeterminate amounts of time have remained stuck in HMP without a <br=
>
proper QMP equivalent.<br>
<br>
Naturally, you can use QMP to issue HMP-only commands if you want. There <b=
r>
are a few uses of this in ./tests/qemu-iotests to do various &quot;unsafe&q=
uot; <br>
things.<br>
<br>
Daniel Berrange is working on porting &quot;savevm&quot; from HMP to QMP as=
 one of <br>
our last holdouts that isn&#39;t just debugging/query stuff.<br>
<br>
Whether or not we want to sunset HMP long-term is, AFAIK, an unresolved <br=
>
question. There are obvious uses for a user-friendly shell. Part of the <br=
>
qmp-shell revamp project is to investigate the viability of a <br>
user-friendly shell backed only by QMP, where the &quot;friendly&quot; bits=
 are <br>
outside of QEMU proper and not subject to backwards compatibility promises.=
<br>
<br>
&gt; 2) When I press &lt;CTRL-A&gt; - C in QEMU I get a monitor prompt, aft=
er<br>
&gt; reading the man page I go to know that I can use telnet or socat to co=
ntrol<br>
&gt; as well. Is this another interface to QEMU which uses QMP?<br>
&gt; <br>
<br>
I&#39;m not sure I know what this keypress does! If you see a prompt, <br>
though, it&#39;s HMP. Type &quot;help&quot; and send a newline.<br>
<br>
The QMP protocol is described somewhere in /docs/ like I pointed out in <br=
>
my reply. You should get a greeting and you should be able to post a qmp <b=
r>
capabilities handshake and get a reply.<br></blockquote><div><span class=3D=
"gmail_default" style=3D"font-size:small">Thank you for the explanation.</s=
pan>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A04) Understanding my project<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If you&#39;re still interested in my project, I&#39=
;d recommend trying out<br>
&gt;=C2=A0 =C2=A0 =C2=A0qmp-shell against a running QEMU instance and issui=
ng a few basic,<br>
&gt;=C2=A0 =C2=A0 =C2=A0boring commands (&quot;query-status&quot; is a good=
 candidate) and seeing how<br>
&gt;=C2=A0 =C2=A0 =C2=A0that<br>
&gt;=C2=A0 =C2=A0 =C2=A0works.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Then, I&#39;d take a look at some of the other proj=
ects I mentioned<br>
&gt;=C2=A0 =C2=A0 =C2=A0(mitmproxy, irssi) to get a sense of what the work =
is here. This is<br>
&gt;=C2=A0 =C2=A0 =C2=A0largely a UI/API programming task, and there&#39;s =
real work to do on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0AQMP library, but it&#39;s probably closer to the s=
urface than the deep<br>
&gt;=C2=A0 =C2=A0 =C2=A0technical internals of QEMU.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It might be a good introductory project that helps =
you get a better<br>
&gt;=C2=A0 =C2=A0 =C2=A0overview of the internals of QEMU if you&#39;re int=
erested in more<br>
&gt;=C2=A0 =C2=A0 =C2=A0hardware-related aspects, but it still requires you=
 have at least some<br>
&gt;=C2=A0 =C2=A0 =C2=A0interested in UI programming and API design.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Phil&#39;s project might involve hardware specifics=
 quite a bit more than<br>
&gt;=C2=A0 =C2=A0 =C2=A0mine, while still teaching you some overview of QMP=
 as a necessity of<br>
&gt;=C2=A0 =C2=A0 =C2=A0the project.<br>
&gt; <br>
&gt; TBH UI and Async are both quite new to me, I have only done CLI<br>
&gt; stuff since there isn&#39;t much UI in low-level dev. I also wanted to=
 try <br>
&gt; out async<br>
&gt; dev at a serious scale but never got an opportunity=C2=A0to do so. My =
rationale<br>
&gt; behind choosing Phil&#39;s project is it would let me learn about the =
hardware<br>
&gt; emulation and more importantly the visualization stuff using QEMU. But=
 since<br>
&gt; your project involves also async stuff I would love to work on your <b=
r>
&gt; project if<br>
&gt; you allow me to ;).<br>
&gt; <br>
<br>
Yup, understood.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0If you remain interested after the above, I can poi=
nt you towards some<br>
&gt;=C2=A0 =C2=A0 =C2=A0more concrete tasks that need doing for you to get =
a fairly concrete<br>
&gt;=C2=A0 =C2=A0 =C2=A0sense of what the project entails.<br>
&gt; <br>
&gt; Please, If you have any small tasks pending, I would like to work on t=
hem.<br>
&gt; <br>
<br>
OK: I think I need to be careful about &quot;issuing&quot; work to someone =
who <br>
isn&#39;t (yet) accepted into the program -- I shouldn&#39;t misrepresent t=
his <br>
arrangement -- but I can give you some more research tips that may help <br=
>
you find your footing.<br>
<br>
We can work on getting to know QMP a bit better; it sounds like it&#39;d be=
 <br>
relevant for both projects.<br>
<br>
Try using &#39;-qmp qmp.sock,server,nowait&#39; when you boot up QEMU and t=
hen <br>
open the qmp.sock file with socat and try messing with it.<br>
<br>
Try going to ./qapi/ in the source tree and &quot;git grep event&quot; to f=
ind <br>
some event definitions. try grepping for that event name in the QEMU <br>
tree at large and try to work out how QEMU emits these events.<br>
<br>
Try *adding* an event somewhere in ./qapi/ and modifying QEMU to emit <br>
this event. Try using rlwrap and socat to connect to this QMP socket and <b=
r>
verify that your event is being sent over the wire. Depending on where <br>
you add the event, it may be helpful to start QEMU in a paused state and <b=
r>
issue a resume command from QMP to make sure you have time to connect to <b=
r>
the socket.<br></blockquote><div>=C2=A0</div><div><span class=3D"gmail_defa=
ult" style=3D"font-size:small">I added an event that is emitted every keypr=
ess. It also sends the qcode of the=C2=A0</span><span class=3D"gmail_defaul=
t">key pressed.</span>=C2=A0</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><a href=3D"https://github.com/gs-niteesh/qemu/pull/1/commits/=
1684f1f499e67ec4af5f75d0cc09eb1ecf9be709" target=3D"_blank">https://github.=
com/gs-niteesh/qemu/pull/1/commits/1684f1f499e67ec4af5f75d0cc09eb1ecf9be709=
</a></div><div class=3D"gmail_default" style=3D"font-size:small">After doin=
g this, I think I have a basic understanding of how the event stuff works a=
nd also</div><div class=3D"gmail_default" style=3D"font-size:small">what ha=
ppens when a command is issued from the shell.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">I have summarized my understanding below, p=
lease correct me if I am wrong anywhere.</div><div class=3D"gmail_default" =
style=3D"font-size:small">1) The JSON files under qemu/qapi define the QMP =
messages. These JSON files are then</div><div class=3D"gmail_default" style=
=3D"font-size:small">compiled into their C representations during the build=
 time.</div><div class=3D"gmail_default" style=3D"font-size:small">2) These=
 are then registered using qmp_register_command.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">3) When a QMP request is initiated, the c=
ommands respective C function is found from the</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">registered list of commands and is dispatc=
hed. One of the main functions responsible for the</div><div class=3D"gmail=
_default" style=3D"font-size:small">finding and dispatching of qmp_* functi=
ons is qmp_dispatch in qapi/qmp-dispatch.c. Which</div><div class=3D"gmail_=
default" style=3D"font-size:small">is invoked from monitor/qmp.c upon a QMP=
 request. The result is then published to the user</div><div class=3D"gmail=
_default" style=3D"font-size:small">through monitor_qmp_respond -&gt; qmp_s=
end_response.</div><div class=3D"gmail_default" style=3D"font-size:small">S=
imilar stuff happens to events too, the difference being, the function defi=
nitions are autogenerated</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">depending on their schema, whereas for commands only the functio=
n prototypes are generated.</div><div class=3D"gmail_default" style=3D"font=
-size:small">The=C2=A0events can be emitted through qapi_event_send_EVENT_N=
AME functions. These functions</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">convert C to JSON and call qapi_event_emit which then final=
ly calls the monitor function to display an</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">event to the user.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Few things I couldn&#39;t figure out and understand =
are</div><div class=3D"gmail_default" style=3D"font-size:small">1) Who info=
rms the monitor that the command is been issued? Since there are many ways =
to</div><div class=3D"gmail_default" style=3D"font-size:small">connect to t=
he monitor, I think there should be a generic API which informs about input=
 data.</div><div class=3D"gmail_default" style=3D"font-size:small">But I ca=
n&#39;t find the code behind all this.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Before sending this mail, I decided to give this an=
other try and found </div><div class=3D"gmail_default" style=3D"font-size:s=
mall">qemu_chr_fe_set_handlers is responsible for register=C2=A0the handler=
s for input and output. Is that</div><div class=3D"gmail_default" style=3D"=
font-size:small">right? And also does chr_fe mean character_front_end?</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">2) I couldn&#39;t understand =
QEMU co-routines in general. In this case, I couldn&#39;t understand the</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">coroutine code in=
 qmp_dispatch in qapi/qmp-dispatch.c. Also please explain OOB in simple</di=
v><div class=3D"gmail_default" style=3D"font-size:small">terms? How are the=
y different from normal commands? And also their relation with coroutines.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Thanks,</div><div class=
=3D"gmail_default" style=3D"font-size:small">Niteesh.</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
For more hardware-oriented avenues of exploration, I&#39;d encourage <br>
reaching out to phil, who seems to have a knack for finding weird <br>
embedded devices to babysit :)<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I would like to work on these projects even o=
utside of GSoC if<br>
&gt;=C2=A0 =C2=A0 =C2=A0someone<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; is ready to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; mentor in their free time :).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Niteesh.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Feel free to join #qemu-gsoc on <a href=3D"http://i=
rc.oftc.net" rel=3D"noreferrer" target=3D"_blank">irc.oftc.net</a> &lt;<a h=
ref=3D"http://irc.oftc.net" rel=3D"noreferrer" target=3D"_blank">http://irc=
.oftc.net</a>&gt;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0If you&#39;ve not joined an<br>
&gt;=C2=A0 =C2=A0 =C2=A0IRC channel before, it&#39;s kind of like a prehist=
oric slack channel.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Linux GUI: xchat, hexchat<br>
&gt;=C2=A0 =C2=A0 =C2=A0Linux TUI: irssi, WeeChat<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0OSX GUI: LimeChat, Colloquy (I&#39;ve never used ei=
ther)<br>
&gt;=C2=A0 =C2=A0 =C2=A0OSX TUI: irssi and weechat should be available via =
ports (Not tried.)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Windows GUI: mIRC, XChat<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m jsnow on OFTC. You can use my nickname at t=
he start of a message<br>
&gt;=C2=A0 =C2=A0 =C2=A0(&quot;jsnow: Hello, this is Niteesh from the maili=
ng list&quot;) and it will<br>
&gt;=C2=A0 =C2=A0 =C2=A0show<br>
&gt;=C2=A0 =C2=A0 =C2=A0me a notification -- but the hours I am paying atte=
ntion to IRC are<br>
&gt;=C2=A0 =C2=A0 =C2=A0around 10AM - 7PM EST. (15:00 - 00:00 GMT)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I can be around later by request (00:00 - 05:00 GMT=
) if you give me<br>
&gt;=C2=A0 =C2=A0 =C2=A0some<br>
&gt;=C2=A0 =C2=A0 =C2=A0advance notice.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Niteesh.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
<br>
</blockquote></div></div>
</div>

--000000000000297c0e05bb2286ff--

