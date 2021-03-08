Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E6833120E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:23:53 +0100 (CET)
Received: from localhost ([::1]:57178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHjc-0007xm-FB
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lJHhh-0006jL-04
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:21:53 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:46159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lJHhe-0007em-2K
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:21:52 -0500
Received: by mail-qt1-x82e.google.com with SMTP id o1so7685118qta.13
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 07:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4E/0H/QA7nRZwFx1jrvckmj17ayjXpDQqV/2RCTxtk0=;
 b=Y/wDyMuVPoxEcKFMDOMF4F6pM2zIklW73y05Hl2sx9x8wgaKj16V+8wGRiid4ydxKE
 lVzQQiEH+/9G4xJ6zeZ8jer2o5LWHyQ+N0oRYuUjBRtOqoSARB/yPXUECPCsh75/EycO
 4kWmEtc1CR2olQUPaR2eGo9uv8JT66a5h2aQWGh7P7mR/MNKsokThGKatnlfS2cUjJCx
 +6vLmYHgsUSIYPOU0hfPxRcqmFAI6WfvbKHjDO1bad2U8rBEjqZUAuaEE02cuIjFIc7N
 ZbU0tmnUUBbLjmwBCxMS0/0dLnGST/z1CELXBIuUfWf26mSIvs4oO3HcD05VyKCAuiKI
 5QsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4E/0H/QA7nRZwFx1jrvckmj17ayjXpDQqV/2RCTxtk0=;
 b=XWJ02Wrvuzr0ln7g5A+IpnKz1LLIteEMNwtz9dD1OUE6Ks/izQJUlCtnp0e1Yqwrx2
 0anj4vcE+WNKt6YdfLk/JJCgjnpP81kEO6LU1qmjJlg1wsH3G1CB/vLHydwUHkhOP+ND
 uZR5FB2wDCEwnWd8WK1aNdNCgkVp4CqH24PZDMDJCShdmlgLHVQEEh9U9qFIaAYRTfBO
 iEUkBx0EYihy1lKVpjH6yaU+Ah7fyTV5zX/eiK3EqsIWo++ShY4iVZYNtxlxlvTqUhRA
 7PTJJa07GeVmxvRp4WuW7LZMnErdtw0ryfl3/J7v1rGAH/zSFqCB8n98OM6HLycFjp+u
 ArQQ==
X-Gm-Message-State: AOAM531RbZOqOwhyVvnswZDu4hOoLlNq3XYfOB60ZHl9ExBjVHfTNDAU
 1QB4zXAjiZS17PDyACVDVl61tMgi6chcSNRxqxzrwA==
X-Google-Smtp-Source: ABdhPJzMToCiYJIaROlC/TT2UHTqmdtzvVoyDmflbn5fhDSl1NDXnHQtIsyQF+qQzLFS9AEbVtvCalAqO5bVpuSC5iM=
X-Received: by 2002:ac8:18c:: with SMTP id x12mr7326442qtf.73.1615216906884;
 Mon, 08 Mar 2021 07:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20210307155654.993-1-imp@bsdimp.com>
 <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
 <CAFEAcA-kuUEYC7ovT4CELNDjGxnf_Y1scSb_dCmWQfvSeaOXjw@mail.gmail.com>
 <f6665ee9-e279-6a4d-687f-b94579d71b8d@redhat.com>
 <376579a6-091d-b923-4aca-b69ca942bada@redhat.com>
 <YEYVPsRcE1S9vuo3@redhat.com>
 <843150bc-7a6e-38e7-8957-22087ce0d80e@redhat.com>
In-Reply-To: <843150bc-7a6e-38e7-8957-22087ce0d80e@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 8 Mar 2021 08:21:34 -0700
Message-ID: <CANCZdfoS4n9Dcymj4G9pC=CZ3E_POvi8nSZwHfSqKoHORpYzZA@mail.gmail.com>
Subject: Re: RESEND [PATCH v2] bsd-user: Add new maintainers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f8a16a05bd07fdfe"
Received-SPF: none client-ip=2607:f8b0:4864:20::82e;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f8a16a05bd07fdfe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 8, 2021 at 6:14 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> On 3/8/21 1:14 PM, Daniel P. Berrang=C3=A9 wrote:
> > On Mon, Mar 08, 2021 at 12:55:10PM +0100, Thomas Huth wrote:
> >> On 08/03/2021 12.16, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Hi Peter,
> >>>
> >>> +Markus/Paolo/Laurent/Richard
> >>>
> >>> On 3/8/21 11:24 AM, Peter Maydell wrote:
> >>>> On Mon, 8 Mar 2021 at 10:09, Thomas Huth <thuth@redhat.com> wrote:
> >>>>>
> >>>>> On 07/03/2021 16.56, Warner Losh wrote:
> >>>>>> The FreeBSD project has a number of enhancements to bsd-user. Add
> myself
> >>>>>> as maintainer and Kyle Evans as a reviewer. Also add our github
> repo.
> >>>>>>
> >>>>>> Signed-off-by: Warner Losh <imp@bsdimp.com>
> >>>>>> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> >>>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >>>>>> ---
> >>>>>>    MAINTAINERS | 5 ++++-
> >>>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>>>>> index 26c9454823..ec0e935038 100644
> >>>>>> --- a/MAINTAINERS
> >>>>>> +++ b/MAINTAINERS
> >>>>>> @@ -2896,9 +2896,12 @@ F: thunk.c
> >>>>>>    F: accel/tcg/user-exec*.c
> >>>>>>
> >>>>>>    BSD user
> >>>>>> -S: Orphan
> >>>>>> +M: Warner Losh <imp@bsdimp.com>
> >>>>>> +R: Kyle Evans <kevans@freebsd.org>
> >>>>>> +S: Maintained
> >>>>>>    F: bsd-user/
> >>>>>>    F: default-configs/targets/*-bsd-user.mak
> >>>>>> +T: git https://github.com/qemu-bsd-user/qemu-bsd-user
> bsd-user-rebase-3.1
> >>>>>
> >>>>> BSD is not really my home turf, but since nobody else picked this u=
p
> and I
> >>>>> plan to send a pull request for a bunch of patches anyway this week=
,
> I can
> >>>>> also put it into my queue.
> >>>>
> >>>> Fine with me. (The v1 was in my to-review queue, but I'm currently
> >>>> running somewhat behind on processing patches.)
> >>>
> >>> This is a patch for mainstream QEMU, I'm having hard time
> >>> understanding the point of it. This is some official way
> >>> to say that BSD-user is not maintained in mainstream but
> >>> has to be used in the referred fork which is way different
> >>> that mainstream...
> >>>
> >>> I'd rather wait for more mainstream contributions from Warner
> >>> and Kyle, or blow the current orphan/dead code and import
> >>> bsd-user-rebase-3.1 adding the maintainer entries along, but
> >>> certainly not mark this dead code as maintained.
> >>>
> >>> Please convince me why I'm wrong, because I'd prefer NAck this
> >>> patch...
> >>
> >> The idea has been discussed here:
> >>
> >> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01399.html
> >>
> >> So this is not about declaring that bsd-user is maintained in a
> different
> >> repository, but about giving Warner et al. a chance to finally upstrea=
m
> >> their work.
> >
> > Yep, I think this change in MAINTAINERS file is primarily about
> signalling
> > intent for future
>

 Yes. Just so. We have the older fork that we're trying to port forward. If
people have changes as we do that, it sure would be nice to have them go
through us rather than create more conflict with the main tree. I don't
need to have a new set of conflicts with main because someone thought that
it would be a good idea to move the space before or after the '(' or after
in a bunch of files. It's just extra work if I have to do it as part of the
merging. Better that goes into the top of our queue so it's managed and
easy and a click on github than another half hour I have to spend sorting
that out when I'd rather be sorting out the substantial change that go on
upstream in other areas that legitimately do make things much better.

We talked about all this in the above thread, I thought, and I thought it
was all settled, so I was rather surprised to wake up to this thread this
morning.


> > Marking the subsystem as maintained isn't saying the current code is
> great,
> > just that there is someone committed to improving it hereafter.
>
> OK, thank Thomas / Daniel for explaining and referring to the "BSD-user
> plans" (which I didn't notice earlier).
>
> Warner, what about mentioning your plans here in this patch?
>

Where is there room in the MAINTAINERS file for that? How would you like me
to do that?


> Resumed ideally, else a simple link to the thread.
>

I'm not sure what you are asking here.


> > If we want to warn people that the current impl isn't great, that's goe=
s
> > back to the topic of having a way to classify QEMU features into qualit=
y
> > levels Tier 1/2/3.
>
> That indeed sounds good w.r.t. contributors / users expectations.
>
> I suppose 1=3Dhw_accel/security, 2=3Dtested, 3=3Drest?
>
> Not a single clue how to do that although.
>

Yup. Why invent something new just to make it harder for me to get things
into the tree? There's already the tiered maintainer stuff, and I'm trying
to get our stuff that turn the current bsd-user that's crap into something
that's quite solid.

The plans are to get our changes upstream so there's no daylight between
what we do and what's upstream, except for the newest system calls that are
being implemented just after they enter FreeBSD. We have a bunch of changes
that make bsd-user able to build tens of thousands of packages more or less
natively (the setup is a hybrid environment where the compilers are cross
compilers, but everything built is native and run in emulation).

I tried getting one big omnibus patch together, but qemu's head is moving
too fast, so those plans failed to ever reach the tip of the tree. In
discussions referenced in this thread, people suggested I submit changes to
the MAINTAINER stuff as a signal moving forward. I've submitted other
patches as well to get things going (those are already in). I plan on
submitting more, but wanted to get the simple stuff ironed out first.
QEMU's workflow is utterly alien to me, to be honest, but I wanted to be a
good citizen and learn on the basics before submitting things that were
harder to do and/or explain.

Anyway, I'm trying to learn the local customs here. I'm unsure what the
next step here is. Can someone explicitly tell me that? I thought all these
preliminaries were already sorted out.

Warner

--000000000000f8a16a05bd07fdfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 8, 2021 at 6:14 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 3/8/21 1:14 PM, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; On Mon, Mar 08, 2021 at 12:55:10PM +0100, Thomas Huth wrote:<br>
&gt;&gt; On 08/03/2021 12.16, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt;&gt; Hi Peter,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +Markus/Paolo/Laurent/Richard<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 3/8/21 11:24 AM, Peter Maydell wrote:<br>
&gt;&gt;&gt;&gt; On Mon, 8 Mar 2021 at 10:09, Thomas Huth &lt;<a href=3D"ma=
ilto:thuth@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt; wrote:<br=
>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 07/03/2021 16.56, Warner Losh wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; The FreeBSD project has a number of enhancements t=
o bsd-user. Add myself<br>
&gt;&gt;&gt;&gt;&gt;&gt; as maintainer and Kyle Evans as a reviewer. Also a=
dd our github repo.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:i=
mp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:ke=
vans@freebsd.org" target=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Reviewed-by: Thomas Huth &lt;<a href=3D"mailto:thu=
th@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 MAINTAINERS | 5 ++++-<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 4 insertions(+), 1 de=
letion(-)<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt;&gt;&gt;&gt;&gt;&gt; index 26c9454823..ec0e935038 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt; --- a/MAINTAINERS<br>
&gt;&gt;&gt;&gt;&gt;&gt; +++ b/MAINTAINERS<br>
&gt;&gt;&gt;&gt;&gt;&gt; @@ -2896,9 +2896,12 @@ F: thunk.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 F: accel/tcg/user-exec*.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 BSD user<br>
&gt;&gt;&gt;&gt;&gt;&gt; -S: Orphan<br>
&gt;&gt;&gt;&gt;&gt;&gt; +M: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om" target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +R: Kyle Evans &lt;<a href=3D"mailto:kevans@freebs=
d.org" target=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +S: Maintained<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 F: bsd-user/<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 F: default-configs/targets/*-bsd-user=
.mak<br>
&gt;&gt;&gt;&gt;&gt;&gt; +T: git <a href=3D"https://github.com/qemu-bsd-use=
r/qemu-bsd-user" rel=3D"noreferrer" target=3D"_blank">https://github.com/qe=
mu-bsd-user/qemu-bsd-user</a> bsd-user-rebase-3.1<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; BSD is not really my home turf, but since nobody else =
picked this up and I<br>
&gt;&gt;&gt;&gt;&gt; plan to send a pull request for a bunch of patches any=
way this week, I can<br>
&gt;&gt;&gt;&gt;&gt; also put it into my queue.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Fine with me. (The v1 was in my to-review queue, but I&#39=
;m currently<br>
&gt;&gt;&gt;&gt; running somewhat behind on processing patches.)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This is a patch for mainstream QEMU, I&#39;m having hard time<=
br>
&gt;&gt;&gt; understanding the point of it. This is some official way<br>
&gt;&gt;&gt; to say that BSD-user is not maintained in mainstream but<br>
&gt;&gt;&gt; has to be used in the referred fork which is way different<br>
&gt;&gt;&gt; that mainstream...<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;d rather wait for more mainstream contributions from War=
ner<br>
&gt;&gt;&gt; and Kyle, or blow the current orphan/dead code and import<br>
&gt;&gt;&gt; bsd-user-rebase-3.1 adding the maintainer entries along, but<b=
r>
&gt;&gt;&gt; certainly not mark this dead code as maintained.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Please convince me why I&#39;m wrong, because I&#39;d prefer N=
Ack this<br>
&gt;&gt;&gt; patch...<br>
&gt;&gt;<br>
&gt;&gt; The idea has been discussed here:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-01/m=
sg01399.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/ar=
chive/html/qemu-devel/2021-01/msg01399.html</a><br>
&gt;&gt;<br>
&gt;&gt; So this is not about declaring that bsd-user is maintained in a di=
fferent<br>
&gt;&gt; repository, but about giving Warner et al. a chance to finally ups=
tream<br>
&gt;&gt; their work.<br>
&gt; <br>
&gt; Yep, I think this change in MAINTAINERS file is primarily about signal=
ling<br>
&gt; intent for future<br></blockquote><div><br></div><div>=C2=A0Yes. Just =
so. We have the older fork that we&#39;re trying to port forward. If people=
 have changes as we do that, it sure would be nice to have them go through =
us rather than create more conflict with the main tree. I don&#39;t need to=
 have a new set of conflicts with main because someone thought that it woul=
d be a good idea to move the space before or after the &#39;(&#39; or after=
 in a bunch of files. It&#39;s just extra work if I have to do it as part o=
f the merging. Better that goes into the top of our queue so it&#39;s manag=
ed and easy and a click on github than another half hour I have to spend so=
rting that out when I&#39;d rather be sorting out the substantial change th=
at go on upstream in other areas that legitimately do make things much bett=
er.</div><div><br></div><div>We talked about all this in the above thread, =
I thought, and I thought it was all settled, so I was rather surprised to w=
ake up to this thread this morning.=C2=A0</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; Marking the subsystem as maintained isn&#39;t saying the current code =
is great,<br>
&gt; just that there is someone committed to improving it hereafter.<br>
<br>
OK, thank Thomas / Daniel for explaining and referring to the &quot;BSD-use=
r<br>
plans&quot; (which I didn&#39;t notice earlier).<br>
<br>
Warner, what about mentioning your plans here in this patch?<br></blockquot=
e><div><br></div><div>Where is there room in the MAINTAINERS file for that?=
 How would you like me to do that?</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Resumed ideally, else a simple link to the thread.<br></blockquote><div><br=
></div><div>I&#39;m not sure what you are asking here.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; If we want to warn people that the current impl isn&#39;t great, that&=
#39;s goes<br>
&gt; back to the topic of having a way to classify QEMU features into quali=
ty<br>
&gt; levels Tier 1/2/3.<br>
<br>
That indeed sounds good w.r.t. contributors / users expectations.<br>
<br>
I suppose 1=3Dhw_accel/security, 2=3Dtested, 3=3Drest?<br>
<br>
Not a single clue how to do that although.<br></blockquote><div><br></div><=
div>Yup. Why invent something new just to make it harder for me to get thin=
gs into the tree? There&#39;s already the tiered maintainer stuff, and I&#3=
9;m trying to get our stuff that turn the current bsd-user that&#39;s crap =
into something that&#39;s quite solid.</div><div><br></div><div>The plans a=
re to get our changes upstream so there&#39;s no daylight between what we d=
o and what&#39;s upstream, except for the newest system calls that are bein=
g implemented just after they enter FreeBSD. We have a bunch of changes tha=
t make bsd-user able to build tens of thousands of packages more or less na=
tively (the setup is a hybrid environment where the compilers are cross com=
pilers, but everything built is native and run in emulation).<br></div><div=
><br></div><div>I tried getting one big omnibus patch together, but qemu&#3=
9;s head is moving too fast, so those plans failed to ever reach the tip of=
 the tree. In discussions referenced in this thread, people suggested I sub=
mit changes to the MAINTAINER stuff as a signal moving forward. I&#39;ve su=
bmitted other patches as well to get things going (those are already in). I=
 plan on submitting more, but wanted to get the simple stuff ironed out fir=
st. QEMU&#39;s workflow is utterly alien to me, to be honest, but I wanted =
to be a good citizen and learn on the basics before submitting things that =
were harder to do and/or explain.</div><div><br></div><div>Anyway, I&#39;m =
trying to learn the local customs here. I&#39;m unsure what the next step h=
ere is. Can someone explicitly tell me that? I thought all these preliminar=
ies were already sorted out.</div><div><br></div><div>Warner<br></div></div=
></div>

--000000000000f8a16a05bd07fdfe--

