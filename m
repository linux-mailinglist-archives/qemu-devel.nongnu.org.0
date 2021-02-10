Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682D93173FA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 00:09:39 +0100 (CET)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yc5-0001Bv-Sz
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 18:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l9yAP-0000XP-5x
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:41:01 -0500
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:44284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l9yAL-00066x-Ov
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:41:00 -0500
Received: by mail-ua1-x929.google.com with SMTP id a31so1115271uae.11
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5xXNaD6xtHuwH3GzhshVA5tPGDYEXQIStj387XEN33Y=;
 b=gXLeGslVzNnnhJJMhKs5wYXU0FOEeHFmlnx9/L9smXTUflOXtk/9TObCaP/TlkOXI+
 uxpP8QjXXYx4l4GxX3Q/SdlGjXZZMihkZl5pajIkay3DM5k0V2gxQYvrOjOQvJ8vnSvR
 g2o6WggPDK4vJisQ+tPEXX4aLbUHq2q22+zETGKiMnAMKZmsfsQoOku+Ti2tUF7JwNEX
 zupqQsSNN0iPJqsyM0L3XFaBUhF9JqjaBYv25EC/9r2xomdm3WzxjvVlaER+RgwjL83V
 vd1oB/JeX4/HV39Eq+ZHSMkeFv8BA3OaGDQFOXqImZUtTxJw1V4VYoP6ZF7Fscb7r/we
 ggyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5xXNaD6xtHuwH3GzhshVA5tPGDYEXQIStj387XEN33Y=;
 b=etf12WxpKJRcwn/xT4b/4cEdUfWhyV1VhfVnblnoRY6SkFc/r+2bGjoCziyD2rloeE
 EKzG7MvWwyRB0Cc81oqkpPZDxROz6GUHJSnSaw47zv/alX3V0x1AjNy22SHmJY+qS9SM
 CGvt9a+clXFncUyfde0Xtew4V/x0RDf9z4AZmrng1qivfe9CICQUZg4yGydyJVyOsesH
 wJc17LySka4BRk+Qs8FsgHsWWQTHEOwrzTNW96WCul7KfV+DhCBYetTTi8v2Dq2WSVLk
 mMN0JObvhicEtjXEy3wB3fQ9b90SK2xzoeWCc9Im+CIIbTNJIJ0e46uwB1mXzkiPp6Tl
 IV7w==
X-Gm-Message-State: AOAM533JHh9w3i9BhIaexVFOuJVCo3aQpn3MZ8MHdIOitpYjb7SNobS3
 BB2YUQCauyvwcxQcp09Ix6+uVdNEKkspqLN4+C2wXQ==
X-Google-Smtp-Source: ABdhPJyHHuk1FVUBaSpo3G9D/XoKZIV1cTzdVCfGccKUPtr01d9MqvvPd7otqPvOsbkAH4tFIYMWCDhtPAtFoFPDrZs=
X-Received: by 2002:a9f:24b6:: with SMTP id 51mr3483145uar.91.1612996855344;
 Wed, 10 Feb 2021 14:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20210203233539.1990032-1-dje@google.com>
 <20210204100349.GF549438@redhat.com>
 <CADPb22THtnaRgz3MAa+=U+dgZeZR4+FDO_SvpfsqKbnSJRnOmA@mail.gmail.com>
 <CADPb22Q2k0EpEG6=h=Riswitpha0okeEeoP9Use3yfYtV7t6ZA@mail.gmail.com>
 <20210210093102.GB1240644@redhat.com>
 <CADPb22QzGYw3z9tgVgcZv3vywVN_ejt_PjUrHmB4O-DLkAeT=Q@mail.gmail.com>
 <20210210164919.GL1240644@redhat.com>
In-Reply-To: <20210210164919.GL1240644@redhat.com>
From: Doug Evans <dje@google.com>
Date: Wed, 10 Feb 2021 14:40:17 -0800
Message-ID: <CADPb22Sdk1Ao5wGFBEiJ2mNqeRfo81vp1U1gXYA9caf9Ht1n4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3]
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="000000000000969ec205bb0318f2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=dje@google.com; helo=mail-ua1-x929.google.com
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

--000000000000969ec205bb0318f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 8:49 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Feb 10, 2021 at 08:31:40AM -0800, Doug Evans wrote:
> > On Wed, Feb 10, 2021 at 1:31 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> > > On Tue, Feb 09, 2021 at 06:16:57PM -0800, Doug Evans wrote:
> > > > On Thu, Feb 4, 2021 at 10:25 AM Doug Evans <dje@google.com> wrote:
> > > >
> > > > > On Thu, Feb 4, 2021 at 2:03 AM Daniel P. Berrang=C3=A9 <
> berrange@redhat.com
> > > >
> > > > > wrote:
> > > > >
> > > > >> On Wed, Feb 03, 2021 at 03:35:36PM -0800, dje--- via wrote:
> > > > >> > Add support for ipv6 host forwarding
> > > > >> >
> > > > >> > This patchset takes the original patch from Maxim,
> > > > >> >
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
> > > > >> > and updates it.
> > > > >> >
> > > > >> > New option: -ipv6-hostfwd
> > > > >> >
> > > > >> > New commands: ipv6_hostfwd_add, ipv6_hostfwd_remove
> > > > >> >
> > > > >> > These are the ipv6 equivalents of their ipv4 counterparts.
> > > > >>
> > > > >> Before I noticed this v3, I send a reply to your v2 sugesting
> > > > >> that we don't need to add any new commands/options. We can
> > > > >> use existing inet_parse() helper function to parse the address
> > > > >> info and transparently support IPv4/6 in the existing commands
> > > > >> and options. This matches normal practice elsewhere in QEMU
> > > > >> for IP dual stack.
> > > > >>
> > > > >
> > > > > I'm all for this, fwiw.
> > > > >
> > > >
> > > >
> > > > I should say I'm all for not adding new commands/options.
> > > > Looking at inet_parse() it cannot be used as-is.
> > > > The question then becomes: Will refactoring it buy enough?
> > >
> > > What's the problem your hitting with inet_parse ?
> > >
> >
> >
> > First, this is the inet_parse() function we're talking about, right?
> >
> > int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
> >
> >
> https://gitlab.com/qemu-project/qemu/-/blob/master/util/qemu-sockets.c#L6=
18
>
> Yes, that's right.
>


Thanks, just wanted to be sure.

The syntax it supports is not the same as what's needed for host forwarding=
.
inet_parse: address:port,option1,option2 (where options are to=3D,ipv4,etc)=
.
hostfwd: address:port-address:port
If we wanted to have a utility that parsed "address:port" for v4+v6 then
we'd have to split the "address:port" part out of inet_parse.

Plus the way inet_parse() parses the address, which is fine for its
purposes, is with sscanf.
Alas the terminating character is not the same (',' vs '-').
IWBN to retain passing sscanf a constant format string so that the compiler
can catch various errors,
and if one keeps that then any kind of refactor loses some appeal.
[Though one could require all callers to accept either ',' or '-' as the
delimiter.]

--000000000000969ec205bb0318f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Feb 10, 2021 at 8:49 AM Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Wed, Feb 10, 2021 at 08:31:40AM -0800, Doug Evans wrote:<=
br>
&gt; On Wed, Feb 10, 2021 at 1:31 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Tue, Feb 09, 2021 at 06:16:57PM -0800, Doug Evans wrote:<br>
&gt; &gt; &gt; On Thu, Feb 4, 2021 at 10:25 AM Doug Evans &lt;<a href=3D"ma=
ilto:dje@google.com" target=3D"_blank">dje@google.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, Feb 4, 2021 at 2:03 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redha=
t.com</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; On Wed, Feb 03, 2021 at 03:35:36PM -0800, dje--- vi=
a wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt; Add support for ipv6 host forwarding<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; This patchset takes the original patch from Ma=
xim,<br>
&gt; &gt; &gt; &gt;&gt; &gt; <a href=3D"https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg569573.html" rel=3D"noreferrer" target=3D"_blank">https:=
//www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html</a><br>
&gt; &gt; &gt; &gt;&gt; &gt; and updates it.<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; New option: -ipv6-hostfwd<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; New commands: ipv6_hostfwd_add, ipv6_hostfwd_r=
emove<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; These are the ipv6 equivalents of their ipv4 c=
ounterparts.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Before I noticed this v3, I send a reply to your v2=
 sugesting<br>
&gt; &gt; &gt; &gt;&gt; that we don&#39;t need to add any new commands/opti=
ons. We can<br>
&gt; &gt; &gt; &gt;&gt; use existing inet_parse() helper function to parse =
the address<br>
&gt; &gt; &gt; &gt;&gt; info and transparently support IPv4/6 in the existi=
ng commands<br>
&gt; &gt; &gt; &gt;&gt; and options. This matches normal practice elsewhere=
 in QEMU<br>
&gt; &gt; &gt; &gt;&gt; for IP dual stack.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I&#39;m all for this, fwiw.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I should say I&#39;m all for not adding new commands/options=
.<br>
&gt; &gt; &gt; Looking at inet_parse() it cannot be used as-is.<br>
&gt; &gt; &gt; The question then becomes: Will refactoring it buy enough?<b=
r>
&gt; &gt;<br>
&gt; &gt; What&#39;s the problem your hitting with inet_parse ?<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; First, this is the inet_parse() function we&#39;re talking about, righ=
t?<br>
&gt; <br>
&gt; int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)=
<br>
&gt; <br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/util/qem=
u-sockets.c#L618" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/q=
emu-project/qemu/-/blob/master/util/qemu-sockets.c#L618</a><br>
<br>
Yes, that&#39;s right.<br></blockquote><div><br></div><div><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Thanks, just wanted to be =
sure.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">The syntax it suppo=
rts is not the same as what&#39;s needed for host forwarding.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">inet_parse: address:port,opt=
ion1,option2 (where options are to=3D,ipv4,etc).</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">hostfwd: address:port-address:port</div><=
div class=3D"gmail_default" style=3D"font-size:small">If we wanted to have =
a utility that parsed &quot;address:port&quot; for v4+v6 then we&#39;d have=
 to split the &quot;address:port&quot; part out of inet_parse.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Plus the way inet_parse() parses the =
address, which is fine for its purposes, is with sscanf.</div><div class=3D=
"gmail_default" style=3D"font-size:small">Alas the terminating character is=
 not the same (&#39;,&#39; vs &#39;-&#39;).</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">IWBN to retain passing sscanf a constant forma=
t string so that the compiler can catch various errors,</div><div class=3D"=
gmail_default" style=3D"font-size:small">and if one keeps that then any kin=
d of refactor loses some appeal.</div><div class=3D"gmail_default" style=3D=
"font-size:small">[Though one could require all callers to accept either &#=
39;,&#39; or &#39;-&#39; as the delimiter.]</div></div></div>

--000000000000969ec205bb0318f2--

