Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB741B563
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:46:55 +0200 (CEST)
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVHBu-0000Qt-5p
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVH8p-0007NM-27
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:43:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVH8n-0003gi-0S
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632851020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZF8N5BtNAV4mMZiTYv2jGRoibh8QQkP7K9IMh29lHsU=;
 b=K0kDyi+xVN99EDlfIWgC4pmjQRaFREvGZ3sckOdqL1ohNzC14bkuCo/GEW7FVU+kzvqCv7
 kHmf0OIh+aVa+Pye7Jf99X8dC8veEvivqwpwYxUaLWKxHcw4bbdhJuagYBbjmzD+Q3auah
 jJ2P2qgZchW1cuJwN/ONFDAEJ9RTFeI=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-jmWnX2CINlWY5Mwc5SvLIQ-1; Tue, 28 Sep 2021 13:43:38 -0400
X-MC-Unique: jmWnX2CINlWY5Mwc5SvLIQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 i7-20020ac5cd87000000b0029443ee8a47so3341235vka.15
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 10:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZF8N5BtNAV4mMZiTYv2jGRoibh8QQkP7K9IMh29lHsU=;
 b=KDYjXtLoesI1wqAY62V0H+CsVFUCAiTHGg5U3g1IQ35iz/pUZ6DycJ0MNPGmbvQQ+5
 7TicyQcQiublXbciNcPHO1biLwwQYIngSTVpBioofFR1QU8ZxDxVZt3xjUDJz6pPlSuw
 fwpGyXIu338HtuW0npydr0R/EA2a0HYJr98OjdRGRsW3M7qAtkPz7JHUAJh+95rWnGRm
 IWf4F5nQQH/JMwM7lj6/JIsHZeY/jX2IL5cw2LxTFXANzCicAJ064SZeXbMd8qb8A5lW
 34bJ6pCnuUV472dlvkDp2Pdz+Zh/np5LAmHvxlElU0QRDq6G1Z1te4jCDtNpWw2fFGT2
 nRYQ==
X-Gm-Message-State: AOAM533fCogzMlL7heHFj30cgDmq6mEjwgvOQm2Cphnb0R5H5gwN1JuD
 k1hOK1RIjzG+AH5Tx2b9AdHVbLvkE1FIlYtmO0Mqur4E5Be/U/wQjOtGAsrmCSa+/qwbx2O7vmY
 KXtulGZPUyFIjKd6NgEWOV80fozZfpOg=
X-Received: by 2002:a67:f685:: with SMTP id n5mr6771340vso.31.1632851017834;
 Tue, 28 Sep 2021 10:43:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/K+kqv+VHgK31qH43WuXaNafq0PbZQb4XKV3xHeWwhbsr4Z7WadHWuR/YizcPNT7dTMicVrc21fGQ9gV3skc=
X-Received: by 2002:a67:f685:: with SMTP id n5mr6771310vso.31.1632851017632;
 Tue, 28 Sep 2021 10:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
 <YVMeUbGdnsTpwSbD@redhat.com>
In-Reply-To: <YVMeUbGdnsTpwSbD@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 28 Sep 2021 13:43:26 -0400
Message-ID: <CAFn=p-ZG6SAVDz-cOtviekvMvibw+ukhYmSOqH7UTrcH-9fCNA@mail.gmail.com>
Subject: Re: QAPI sync meeting
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e0a7d205cd11c0ac"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e0a7d205cd11c0ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 9:53 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Mon, Sep 27, 2021 at 12:55:34PM -0400, John Snow wrote:
> > Hiya,
> >
> > I'd like to propose that at least the three of us arrange a time to hav=
e
> a
> > meeting where we discuss our plans and ideas for QAPI going forward,
> > including rust, python, and golang extensions to the QAPI generator, wh=
at
> > we hope to accomplish with those projects, and so on.
> >
> > What I am hoping to get out of this for myself is a high-level overview
> of
> > people's plans for QAPI and to produce some notes on those plans so tha=
t
> I
> > can have a reference that we've all acknowledged as roughly accurate to
> be
> > able to keep the community's design goals for QAPI in mind as I continu=
e
> my
> > own development. Ultimately, I'd like some kind of rough draft of a "QA=
PI
> > roadmap".
> >
> > I know there was a rust meetup during KVM Forum, but I was unable to
> attend
> > due to the timing. I'd like to expand the focus a little more broadly t=
o
> > QAPI in general and discuss our "personal" roadmaps, goals, queued work=
,
> > etc so that we can collaboratively formulate a broader vision of our
> work.
> >
> > I'm posting to qemu-devel in case anyone else has an interest in this
> area
> > and would like to eavesdrop or share opinions, but we should probably
> come
> > up with an agenda first. So:
>
> I'd be interested in discussions
>
> >
> > Proposed agenda:
> >
> > Current projects, wishlists, and goals for QAPI:
> > - Markus (~10 min)
> > - Marc-Andre (~10 min) (Rust, dbus, etc?)
> > - jsnow (~10 min) (Python, golang, etc)
> >
> > Formulating short-term and long-term roadmaps:
> > - Open discussion, ~30 min
> > - Collaboratively produce a summary doc (etherpad?) outlining major wor=
k
> to
> > be done, separated into near and long terms
> > - Upload this summary to the QEMU wiki and mail it back out to qemu-dev=
el
> > - We probably won't exactly finish this bit, but we can resume on the
> > mailing list afterwards perfectly well.
> >
> > (Feel free to propose anything different for the meeting, this is just =
a
> > jumping off point for discussion.)
>
> My interest is in a roadmap for getting to a point where we have
> ability to configure QEMU  VMs in a "legacy free" way. By this I
> mean
>
>    - 100% of configuration is driven by QAPI defined schemas
>    - HMP and QemuOpts are banished/untangled from internals of
>      QEMU, such that they are just a shim around the canonical
>      QAPI and could even be done as a separate wrapper process
>    - May or may not involve qemu-system-XXX vs a new "qemu-vm" binary
>    - May or may not involve QMP vs a REST API taking QAPI JSON vs
>      something else.
>
>
More or less in agreement. Devil's in the details as always!


> > - Any weekday after 13:00 UTC. Wednesdays, Thursdays and Fridays work
> > particularly well for me at the moment.
> > - bluejeans and google meeting both work well for me. Open to
> alternatives.
>
> Are you suggesting a 1-off meeting or a regular meeting, or an adhoc
> set of meetings ?
>
>
I'm proposing a one-off here just for some initial discussion and planning.
(We didn't have a QAPI BoF at KVM Forum and I'd like something similar
now.) I don't expect we'll really "finish" plotting out a roadmap in a
single 60 minute meeting, but it will probably give us good, targeted
discussions on the ML to follow. If more meetings are desired to discuss
specific topics, I'm not against scheduling them as-needed.

(I personally don't really mind semi-regular sync-up meetings, like once
every other month or something to that effect -- it keeps me motivated and
on track. I suspect that Markus does not quite feel the same way about 'em,
so I'm just trying to not sign him up for stuff.)

--js

--000000000000e0a7d205cd11c0ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 28, 2021 at 9:53 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, Sep 27, 2021 at 12:55:34PM -0400, John Snow wrote:<br>
&gt; Hiya,<br>
&gt; <br>
&gt; I&#39;d like to propose that at least the three of us arrange a time t=
o have a<br>
&gt; meeting where we discuss our plans and ideas for QAPI going forward,<b=
r>
&gt; including rust, python, and golang extensions to the QAPI generator, w=
hat<br>
&gt; we hope to accomplish with those projects, and so on.<br>
&gt; <br>
&gt; What I am hoping to get out of this for myself is a high-level overvie=
w of<br>
&gt; people&#39;s plans for QAPI and to produce some notes on those plans s=
o that I<br>
&gt; can have a reference that we&#39;ve all acknowledged as roughly accura=
te to be<br>
&gt; able to keep the community&#39;s design goals for QAPI in mind as I co=
ntinue my<br>
&gt; own development. Ultimately, I&#39;d like some kind of rough draft of =
a &quot;QAPI<br>
&gt; roadmap&quot;.<br>
&gt; <br>
&gt; I know there was a rust meetup during KVM Forum, but I was unable to a=
ttend<br>
&gt; due to the timing. I&#39;d like to expand the focus a little more broa=
dly to<br>
&gt; QAPI in general and discuss our &quot;personal&quot; roadmaps, goals, =
queued work,<br>
&gt; etc so that we can collaboratively formulate a broader vision of our w=
ork.<br>
&gt; <br>
&gt; I&#39;m posting to qemu-devel in case anyone else has an interest in t=
his area<br>
&gt; and would like to eavesdrop or share opinions, but we should probably =
come<br>
&gt; up with an agenda first. So:<br>
<br>
I&#39;d be interested in discussions<br>
<br>
&gt; <br>
&gt; Proposed agenda:<br>
&gt; <br>
&gt; Current projects, wishlists, and goals for QAPI:<br>
&gt; - Markus (~10 min)<br>
&gt; - Marc-Andre (~10 min) (Rust, dbus, etc?)<br>
&gt; - jsnow (~10 min) (Python, golang, etc)<br>
&gt; <br>
&gt; Formulating short-term and long-term roadmaps:<br>
&gt; - Open discussion, ~30 min<br>
&gt; - Collaboratively produce a summary doc (etherpad?) outlining major wo=
rk to<br>
&gt; be done, separated into near and long terms<br>
&gt; - Upload this summary to the QEMU wiki and mail it back out to qemu-de=
vel<br>
&gt; - We probably won&#39;t exactly finish this bit, but we can resume on =
the<br>
&gt; mailing list afterwards perfectly well.<br>
&gt; <br>
&gt; (Feel free to propose anything different for the meeting, this is just=
 a<br>
&gt; jumping off point for discussion.)<br>
<br>
My interest is in a roadmap for getting to a point where we have<br>
ability to configure QEMU=C2=A0 VMs in a &quot;legacy free&quot; way. By th=
is I<br>
mean<br>
<br>
=C2=A0 =C2=A0- 100% of configuration is driven by QAPI defined schemas<br>
=C2=A0 =C2=A0- HMP and QemuOpts are banished/untangled from internals of<br=
>
=C2=A0 =C2=A0 =C2=A0QEMU, such that they are just a shim around the canonic=
al<br>
=C2=A0 =C2=A0 =C2=A0QAPI and could even be done as a separate wrapper proce=
ss<br>
=C2=A0 =C2=A0- May or may not involve qemu-system-XXX vs a new &quot;qemu-v=
m&quot; binary<br>
=C2=A0 =C2=A0- May or may not involve QMP vs a REST API taking QAPI JSON vs=
<br>
=C2=A0 =C2=A0 =C2=A0something else.<br>
<br></blockquote><div><br></div><div>More or less in agreement. Devil&#39;s=
 in the details as always!<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt; - Any weekday after 13:00 UTC. Wednesdays, Thursdays and Fridays work<=
br>
&gt; particularly well for me at the moment.<br>
&gt; - bluejeans and google meeting both work well for me. Open to alternat=
ives.<br>
<br>
Are you suggesting a 1-off meeting or a regular meeting, or an adhoc<br>
set of meetings ?<br>
<br></blockquote><div><br></div><div>I&#39;m proposing a one-off here just =
for some initial discussion and planning. (We didn&#39;t have a QAPI BoF at=
 KVM Forum and I&#39;d like something similar now.) I don&#39;t expect we&#=
39;ll really &quot;finish&quot; plotting out a roadmap in a single 60 minut=
e meeting, but it will probably give us good, targeted discussions on the M=
L to follow. If more meetings are desired to discuss specific topics, I&#39=
;m not against scheduling them as-needed.</div><div><br></div><div>(I perso=
nally don&#39;t really mind semi-regular sync-up meetings, like once every =
other month or something to that effect -- it keeps me motivated and on tra=
ck. I suspect that Markus does not quite feel the same way about &#39;em, s=
o I&#39;m just trying to not sign him up for stuff.)</div><div><br></div><d=
iv>--js<br></div><div>=C2=A0</div></div></div>

--000000000000e0a7d205cd11c0ac--


