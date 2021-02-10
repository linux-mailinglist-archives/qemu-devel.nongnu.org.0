Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE1B316B57
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:34:19 +0100 (CET)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9sRX-0002xH-10
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l9sPd-00024d-VX
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:32:22 -0500
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:39922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l9sPb-0005sy-GN
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:32:21 -0500
Received: by mail-ua1-x933.google.com with SMTP id t15so752465ual.6
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 08:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ustJfVgqY7lue6RljdneFzEloZ8soH27LZYP3UkSTuk=;
 b=tarxhW35xcbd62X58Scv9IzrFOYaKauutFf03quVa6C9VXxwk7WGncWkDOYVoqPxqp
 icq3EQUXUf3BlGFj1x2AFyqiG5mQPws4Y+7thgTs/bOZbkUf7UtPWYyabVOxfuHA10N1
 EbkkqA/YylMCcelqD22V+cci1L2ZGB/ytLv2vWIaggXd+L6MXLMVFacGffNROkwiNEFY
 102xCxdoyAtF66SZ3P3vM6Le2z12aylf/pGFJEqZruezITpX3YNzMGjPcvtacUcTTPsb
 AgWqP/VB/MY+eekcrzkMh+C8RK1vyXOEbxrA15JOD589/mIMutc3fc2HTkUFc21RFMOm
 m6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ustJfVgqY7lue6RljdneFzEloZ8soH27LZYP3UkSTuk=;
 b=ZXNgRyiYaLKh+A3KqyISKUQ1JxIWozXl3GaLK/5Kg4Wo/ul6OymvUG8xSYFk7IwGCB
 SYdkLGrYIJNBC0QROCRy1DxRk8tH/lX2Q0T3bCE1nj+GpTMEhGBjKOvr29mTZckgGDjG
 yY6ss627NR2KcjVEqKoETjBR6hnCNqskBombKAUFn6XpqL/Gleb9VsPm+Qf4gpKQb9+p
 wXAY+DuI8VwMTOBMJ9+qjlr1+SZcT7THal2hHE9IancqMcgLG7a6o+B+TwoqMbUMYBcb
 d2btZy2ykweg+P9Raf1NWGV1VDYjj1H9NVtK34iDhwkMF8aLhrLI+ZV5/TynoJarsz4r
 dK6Q==
X-Gm-Message-State: AOAM532OJMYWa+oAxJWJzyexW72N6d1aJura22dP6KO0cqnYUDnX88TO
 rCqXde2vzKFemjKcCSxSCcPbBgyfch1eY0QksNdddw==
X-Google-Smtp-Source: ABdhPJxts3VvnlCQgfon2rGwh38k719EZWgQ6kagbhayWreOJLOSAgKCsQu5ieG6lsorFjqClVtu2UTgh35Ji8ZQouM=
X-Received: by 2002:ab0:6f0d:: with SMTP id r13mr2405313uah.8.1612974738093;
 Wed, 10 Feb 2021 08:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20210203233539.1990032-1-dje@google.com>
 <20210204100349.GF549438@redhat.com>
 <CADPb22THtnaRgz3MAa+=U+dgZeZR4+FDO_SvpfsqKbnSJRnOmA@mail.gmail.com>
 <CADPb22Q2k0EpEG6=h=Riswitpha0okeEeoP9Use3yfYtV7t6ZA@mail.gmail.com>
 <20210210093102.GB1240644@redhat.com>
In-Reply-To: <20210210093102.GB1240644@redhat.com>
From: Doug Evans <dje@google.com>
Date: Wed, 10 Feb 2021 08:31:40 -0800
Message-ID: <CADPb22QzGYw3z9tgVgcZv3vywVN_ejt_PjUrHmB4O-DLkAeT=Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3]
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="0000000000004c616e05bafdf237"
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=dje@google.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004c616e05bafdf237
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 1:31 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Tue, Feb 09, 2021 at 06:16:57PM -0800, Doug Evans wrote:
> > On Thu, Feb 4, 2021 at 10:25 AM Doug Evans <dje@google.com> wrote:
> >
> > > On Thu, Feb 4, 2021 at 2:03 AM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com
> >
> > > wrote:
> > >
> > >> On Wed, Feb 03, 2021 at 03:35:36PM -0800, dje--- via wrote:
> > >> > Add support for ipv6 host forwarding
> > >> >
> > >> > This patchset takes the original patch from Maxim,
> > >> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
> > >> > and updates it.
> > >> >
> > >> > New option: -ipv6-hostfwd
> > >> >
> > >> > New commands: ipv6_hostfwd_add, ipv6_hostfwd_remove
> > >> >
> > >> > These are the ipv6 equivalents of their ipv4 counterparts.
> > >>
> > >> Before I noticed this v3, I send a reply to your v2 sugesting
> > >> that we don't need to add any new commands/options. We can
> > >> use existing inet_parse() helper function to parse the address
> > >> info and transparently support IPv4/6 in the existing commands
> > >> and options. This matches normal practice elsewhere in QEMU
> > >> for IP dual stack.
> > >>
> > >
> > > I'm all for this, fwiw.
> > >
> >
> >
> > I should say I'm all for not adding new commands/options.
> > Looking at inet_parse() it cannot be used as-is.
> > The question then becomes: Will refactoring it buy enough?
>
> What's the problem your hitting with inet_parse ?
>


First, this is the inet_parse() function we're talking about, right?

int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)

https://gitlab.com/qemu-project/qemu/-/blob/master/util/qemu-sockets.c#L618

--0000000000004c616e05bafdf237
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Feb 10, 2021 at 1:31 AM Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Tue, Feb 09, 2021 at 06:16:57PM -0800, Doug Evans wrote:<=
br>
&gt; On Thu, Feb 4, 2021 at 10:25 AM Doug Evans &lt;<a href=3D"mailto:dje@g=
oogle.com" target=3D"_blank">dje@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Feb 4, 2021 at 2:03 AM Daniel P. Berrang=C3=A9 &lt;<a hre=
f=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&=
gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Wed, Feb 03, 2021 at 03:35:36PM -0800, dje--- via wrote:<b=
r>
&gt; &gt;&gt; &gt; Add support for ipv6 host forwarding<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; This patchset takes the original patch from Maxim,<br>
&gt; &gt;&gt; &gt; <a href=3D"https://www.mail-archive.com/qemu-devel@nongn=
u.org/msg569573.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail=
-archive.com/qemu-devel@nongnu.org/msg569573.html</a><br>
&gt; &gt;&gt; &gt; and updates it.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; New option: -ipv6-hostfwd<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; New commands: ipv6_hostfwd_add, ipv6_hostfwd_remove<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; These are the ipv6 equivalents of their ipv4 counterpart=
s.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Before I noticed this v3, I send a reply to your v2 sugesting=
<br>
&gt; &gt;&gt; that we don&#39;t need to add any new commands/options. We ca=
n<br>
&gt; &gt;&gt; use existing inet_parse() helper function to parse the addres=
s<br>
&gt; &gt;&gt; info and transparently support IPv4/6 in the existing command=
s<br>
&gt; &gt;&gt; and options. This matches normal practice elsewhere in QEMU<b=
r>
&gt; &gt;&gt; for IP dual stack.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m all for this, fwiw.<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; I should say I&#39;m all for not adding new commands/options.<br>
&gt; Looking at inet_parse() it cannot be used as-is.<br>
&gt; The question then becomes: Will refactoring it buy enough?<br>
<br>
What&#39;s the problem your hitting with inet_parse ?<br></blockquote><div>=
<br></div><div><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><font face=3D"arial, sans-serif">First, this is the inet_parse() funct=
ion we&#39;re talking about, right?</font></div><div class=3D"gmail_default=
" style=3D"font-size:small"><span style=3D"font-family:arial,sans-serif"><b=
r></span></div><div class=3D"gmail_default" style=3D"font-size:small">int i=
net_parse(InetSocketAddress *addr, const char *str, Error **errp)<br></div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small"><span style=3D"font-family:ari=
al,sans-serif"><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/maste=
r/util/qemu-sockets.c#L618">https://gitlab.com/qemu-project/qemu/-/blob/mas=
ter/util/qemu-sockets.c#L618</a></span></div></div></div>

--0000000000004c616e05bafdf237--

