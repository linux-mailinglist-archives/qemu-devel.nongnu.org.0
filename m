Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D838CB7A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:01:47 +0200 (CEST)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8Wv-0000nP-Eh
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lk8Un-0007q7-ND
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:59:33 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:47047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lk8Ul-0006lA-7S
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:59:33 -0400
Received: by mail-ej1-x633.google.com with SMTP id u21so31419620ejo.13
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+93tNL1a27IRgMK70FPdlQ4m/QxwXn9bdOxKCrd4CDI=;
 b=EG6waEXGIee4Hfa0NG/hBC3v2M/pdv+AJ+ZXTTrQgAqY3WGwjrp9fK90QzH/UFzdte
 u+gZRiazOKos/YXcOLzLesZh/yMTaQCkz82ANa2kQnPaa9XX1AIHPLqiTLjBsCebdLw2
 3iSvM9nxeI2OaJQPTYg6C9LHMVcrDBMuJaudE7XBPXlLrY/xEIJYAkeF/mIaKCPt6b54
 H1nxiJZInV137Qg7n/UcgXBdd/kSGTGXzTYAM3DwqA+SZOBpctRqJHBQyaPwKd5F6Ts9
 1X4wN64Q+3Ldthm6qogRitUn966pjpUxv4X3KkasvQ9aAK+CDZs8Y7CxRk4f4XBcOniu
 5l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+93tNL1a27IRgMK70FPdlQ4m/QxwXn9bdOxKCrd4CDI=;
 b=IoWVGOkUDrzfAQYOOzuw6jVlr+NBwsyLTMpXlH3rSzw8M+qH7O9g5oEXs640bNk4wf
 4hlcKkDqc9Pc6/1xQOQodQ8FDUyRGz9PHpz8qgAMLHMd9Ssu3pUqzgSgz5Jcf87vYJe+
 ojVB73x3BvxAAXYaaf7QNgHxGFMuapUbTShbqLgjq0ZOCZtaNJQOH9c3LiptCnu/1ud6
 W0Palq6uQFX4cCiVPOg2ljyG2q5nXlfvaXUfpmIJfix7ZZPW6L6nrYGK9WsA3lbnLOGH
 Uv1RFBOyvPlv79RXdCSZCXyK0WKBVAv2SuMRLjSuerCx0m3C6Q30L4oMZ8Zi2VXHj/S2
 qGTg==
X-Gm-Message-State: AOAM5314+OalHCvZE3xXCmyYm11Hr9FtetpcVtpBHBBbFLderYmtczWT
 rMg7OoC3KYT0V2BZzlhad9/VxiekcqhJFtsHe7g=
X-Google-Smtp-Source: ABdhPJwmzlneXM7G/FSjE6g7eUzKufSQahUW1W/bmtCZ5XaiC2h0ntla1xkesDviSXzXgZiwTRBPhl/ezyYlPBUEmyU=
X-Received: by 2002:a17:906:5291:: with SMTP id
 c17mr11072341ejm.527.1621616369113; 
 Fri, 21 May 2021 09:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
 <YKU/k/DIJd6gMLvw@redhat.com> <87lf88pmyn.fsf@dusky.pond.sub.org>
 <YKfHGC79w0uv41Zd@t490s> <YKfg6j4mPjvjSrcF@redhat.com>
 <YKfmLgz59nv5Ef5u@redhat.com>
In-Reply-To: <YKfmLgz59nv5Ef5u@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 21 May 2021 20:59:17 +0400
Message-ID: <CAJ+F1CL_fTN8W2McRA-XXmY6HTy47GZdHz8aB4wxee_7hnyL2g@mail.gmail.com>
Subject: Re: A bug of Monitor Chardev ?
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a4a57a05c2d9fb1c"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: chenjiashang@huawei.com, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a4a57a05c2d9fb1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, May 21, 2021 at 8:56 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Fri, May 21, 2021 at 05:33:46PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Fri, May 21, 2021 at 10:43:36AM -0400, Peter Xu wrote:
> > >
> > > I think the original problem was that if qemu_chr_fe_set_handlers() i=
s
> called
> > > in main thread, it can start to race somehow within execution of the
> function
> > > qemu_chr_fe_set_handlers() right after we switch context at:
> > >
> > >     qemu_chr_be_update_read_handlers(s, context);
> > >
> > > Then the rest code in qemu_chr_fe_set_handlers() will continue to run
> in main
> > > thread for sure, but the should be running with the new iothread
> context, which
> > > introduce a race condition.
> > >
> > > Running qemu_chr_be_update_read_handlers() in BH resolves that becaus=
e
> then all
> > > things run in the monitor iothread only and natually serialized.
> >
> > The first message in this thread, however, claims that it is *not*
> > in fact serialized, when using the BH.
> >
> > > So the new comment looks indeed not fully right, as the chr device
> should be
> > > indeed within main thread context before qemu_chr_fe_set_handlers(),
> it's just
> > > that the race may start right away if without BH when context switch
> happens
> > > for the chr.
> >
> > It sounds like both the comment and the code are potentially wrong.
>
>
> I feel like our root cause problem that the original code was trying to
> workaround, is that the chardev is "active" from the very moment it is
> created, regardless of whether the frontend is ready to use it.
>
> IIUC, in this case the socket chardev is already listen()ing and
> accept()ing incoming clients off the network, before the monitor
> has finished configuring its hooks into the chardev. This means
> that the initial listen()/accept() I/O watches are using the
> default GMainContext, and the monitor *has* to remove them and
> put in new watches on the thread private GMainContext.
>
> To eliminate any risk of races, we need to make it possible for the
> monitor to configure the GMainContext on the chardevs *before* any
> I/O watches are configured.
>
> This in turn suggests that we need to split the chardev initialization
> into two phases. First we have the basic chardev creation, with object
> creation, option parsing/sanity checking, socket creation, and then
> second we have the actual activation where the I/O watches are added.
>
> IOW,  qemu_chr_new() is the former and gets run from generic code in
> the main() method, or in QMP chardev_add.  A new 'qemu_chr_activate'
> method would be called by whatever frontend is using the chardev,
> after registering a custom GMainContext.
>
> This would involve updating every single existing user of chardevs
> to add a call to qemu_chr_activate, but that's worth it to eliminate
> the race by design, rather than workaround it.
>


What about my earlier suggestion to add a new
"qemu_chr_be_disable_handlers()" (until update_read_handlers is called
again to enable them and the set a different context)?


--=20
Marc-Andr=C3=A9 Lureau

--000000000000a4a57a05c2d9fb1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 21, 2021 at 8:56 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Fri, May 21, 2021 at 05:33:46PM +0100, Daniel P. Berrang=C3=A9 w=
rote:<br>
&gt; On Fri, May 21, 2021 at 10:43:36AM -0400, Peter Xu wrote:<br>
&gt; &gt; <br>
&gt; &gt; I think the original problem was that if qemu_chr_fe_set_handlers=
() is called<br>
&gt; &gt; in main thread, it can start to race somehow within execution of =
the function<br>
&gt; &gt; qemu_chr_fe_set_handlers() right after we switch context at:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0qemu_chr_be_update_read_handlers(s, context);<=
br>
&gt; &gt; <br>
&gt; &gt; Then the rest code in qemu_chr_fe_set_handlers() will continue to=
 run in main<br>
&gt; &gt; thread for sure, but the should be running with the new iothread =
context, which<br>
&gt; &gt; introduce a race condition.<br>
&gt; &gt; <br>
&gt; &gt; Running qemu_chr_be_update_read_handlers() in BH resolves that be=
cause then all<br>
&gt; &gt; things run in the monitor iothread only and natually serialized.<=
br>
&gt; <br>
&gt; The first message in this thread, however, claims that it is *not*<br>
&gt; in fact serialized, when using the BH. <br>
&gt; <br>
&gt; &gt; So the new comment looks indeed not fully right, as the chr devic=
e should be<br>
&gt; &gt; indeed within main thread context before qemu_chr_fe_set_handlers=
(), it&#39;s just<br>
&gt; &gt; that the race may start right away if without BH when context swi=
tch happens<br>
&gt; &gt; for the chr.<br>
&gt; <br>
&gt; It sounds like both the comment and the code are potentially wrong.<br=
>
<br>
<br>
I feel like our root cause problem that the original code was trying to<br>
workaround, is that the chardev is &quot;active&quot; from the very moment =
it is<br>
created, regardless of whether the frontend is ready to use it.<br>
<br>
IIUC, in this case the socket chardev is already listen()ing and<br>
accept()ing incoming clients off the network, before the monitor<br>
has finished configuring its hooks into the chardev. This means<br>
that the initial listen()/accept() I/O watches are using the<br>
default GMainContext, and the monitor *has* to remove them and<br>
put in new watches on the thread private GMainContext.<br>
<br>
To eliminate any risk of races, we need to make it possible for the<br>
monitor to configure the GMainContext on the chardevs *before* any<br>
I/O watches are configured.<br>
<br>
This in turn suggests that we need to split the chardev initialization<br>
into two phases. First we have the basic chardev creation, with object<br>
creation, option parsing/sanity checking, socket creation, and then<br>
second we have the actual activation where the I/O watches are added.<br>
<br>
IOW,=C2=A0 qemu_chr_new() is the former and gets run from generic code in<b=
r>
the main() method, or in QMP chardev_add.=C2=A0 A new &#39;qemu_chr_activat=
e&#39;<br>
method would be called by whatever frontend is using the chardev,<br>
after registering a custom GMainContext.<br>
<br>
This would involve updating every single existing user of chardevs<br>
to add a call to qemu_chr_activate, but that&#39;s worth it to eliminate<br=
>
the race by design, rather than workaround it.<br></blockquote><div><br></d=
iv><div><br></div><div>What about my earlier suggestion to add a new &quot;=
qemu_chr_be_disable_handlers()&quot; (until update_read_handlers is called =
again to enable them and the set a different context)? <br></div></div><br =
clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-An=
dr=C3=A9 Lureau<br></div></div>

--000000000000a4a57a05c2d9fb1c--

