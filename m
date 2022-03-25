Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81414E7A0B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 18:34:23 +0100 (CET)
Received: from localhost ([::1]:43656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXnpO-0004Lm-Ga
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 13:34:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXnnx-0003WW-IC
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 13:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXnnt-0003VJ-T8
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 13:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648229568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PbXimZJdVg+wOzgIKS95qv/g1RtWWZLSt0TNCdPlaGw=;
 b=ZdrlhFVgs+Xcf9CR2ytEDKwGz2O+q6PClunfB1J7RS77IPZe6fCwce7q8UJft72cTpA9cc
 7UkvOKEDq2Eh0MV1CLgLHXgkr7ZHh63y5A2cgwqxRTc6M+HZ76LToUa2Fy1M3aOm5ggW0D
 Gk2r0OHatskLxOiJvGn/PkHXxFpbl6w=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-LP9fqVLxN1SoJXQeN67jCA-1; Fri, 25 Mar 2022 13:32:45 -0400
X-MC-Unique: LP9fqVLxN1SoJXQeN67jCA-1
Received: by mail-ua1-f70.google.com with SMTP id
 n9-20020ab065c9000000b00359ac6c2f63so878279uaq.11
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 10:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PbXimZJdVg+wOzgIKS95qv/g1RtWWZLSt0TNCdPlaGw=;
 b=CrGousmx3ddsiJmeB4BCC68nZ12Er58R+/rmRNtbWpLN9I4iYvkY7ZwC5hUzPATZUD
 NOQMp1p1FO/ZYnst3BPiLa2vk6DcpiBTMC4iV0kuYCkM/DRapo3kmQOB3VcH1X/1nE2k
 LtFo+F9t70s0Eoh0sfXIQmE/vZLrbPfGQbsCasI7rxtQkdEMYLsD6rJdTPrzAxmzQoGY
 wrM/BR3kRKmIWO7vNiQvDad6yxBxPx3jXyk7SF/2e9p+0DROBHzd8n3F8WgczI5BzqOF
 FGuiN2Q5cZTZjno1t7CACqAvzjD1vkP9Zch7qBXEtHDB0RDiAYPouIXX2oh7vsbYBYEm
 JcdQ==
X-Gm-Message-State: AOAM533bpZXb/YvJFF4xKGm3+1dqyUz0Ts995b/hvT/Vlv0ZG4Y3kaAY
 T/Pr0XF23UOK1OHOyzZqxDKwAPR4SMK03S8DyxsVatHcKGHTcry++EnMrpx/5Z/HTvgpfOg7RK6
 F2BWa9O6Wybv3E+P/IEMQNhKjcbh/jkg=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr6109667vsa.38.1648229563872; 
 Fri, 25 Mar 2022 10:32:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT70yxR0AfxuWoSvaJRZodTdZ460aBar5dpAjxTMoC6O90vGBm21TbnHjdqp6bjn5I4XVhdUDPgD1skmRV7ks=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr6109611vsa.38.1648229563268; Fri, 25 Mar
 2022 10:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-2-jsnow@redhat.com>
 <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
 <YjwzCM3/wZ4S2fxf@redhat.com> <Yjwzy97JAHKhvCHn@redhat.com>
 <CAFn=p-Zj24yJYvPTpnXLA3wG-Fm8okVTXM-QG0rSAjp3AJuCvQ@mail.gmail.com>
 <YjyNcDjRLWZGiEwU@redhat.com>
 <CAFn=p-aAfEABN3E7in78HEWhSV3ywVzDGiB-aHaPU2an3e9qfw@mail.gmail.com>
 <20220325145547.fjddkhdwfapmnokq@redhat.com>
In-Reply-To: <20220325145547.fjddkhdwfapmnokq@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 25 Mar 2022 13:32:34 -0400
Message-ID: <CAFn=p-biTOx7rROwdQbv-SKjxh2xW3z0=bFBHpyJXWvYHROMhQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] python/aqmp: add explicit GPLv2 license to legacy.py
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a0948105db0e59ee"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a0948105db0e59ee
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 25, 2022, 10:55 AM Eric Blake <eblake@redhat.com> wrote:

> On Thu, Mar 24, 2022 at 12:07:24PM -0400, John Snow wrote:
> ...
> > > Yep, as I mentioned, I don't want to see us abandon copyleft either.
> > >
> > > Of course everyone has their own preferred license, so I'm sure
> > > people who write apps with MIT, will think we should use MIT
> > > too. Ultimately though, if we choose LGPL, they can still use
> > > our module from an MIT licensed app, or any other licensed app
> > > for that matter.
> > >
> >
> > OK, thanks for your input here. My plan right now, then, is:
> >
> > (1) Relicense aqmp as LGPLv2+
> > (2) Fork into new repo as discussed previously on qemu-devel
> > (3) Work on dropping legacy.py (GPLv2) in favor of sync.py (LGPLv2+)
>
> That plan works for me.  I'm happy for any of my contributions to be
> widened to LGPLv2+, but not with the thought of abandoning copyleft by
> going all the way to MIT.
>

Thanks, it's helpful to know where people sit on this; it makes me feel
more comfortable with the choice.

In the future, we're probably going to work on Apache/MIT licensed QMP
libraries for other languages, but for a lib that is used in and grew out
of the QEMU tree itself, it didn't feel right to abandon copyleft, even for
a library.


> >
> > I plan to version the fledgling forked repo as 0.0.z until I drop
> > legacy.py, and then I'll version as 0.y.z for "a while", (A release or
> > two for QEMU?), and then tag v1.0.0.
> > (As we discussed earlier, with a non-finalized API, I'll be pinning
> > QEMU to use specific versions until it stabilizes.)
> >
> > I think you're right that we probably could relicense legacy.py
> > without too much fuss, I think the most significant contributions that
> > didn't come from Luiz or myself were made to docstrings, and only
> > extremely few contributions came from non-RH addresses. Still, I plan
> > to drop the whole file anyway, so I figured I'd side-step the
> > relicensing justification there, even if it's doable.
>
> I'm happy to relicense any of my contributions as needed (did I
> actually write any, or just provide reviews?), but as you say,
> sidestepping the process may get to the same end goal even faster.
>

Yeah. Part of it is that I intend to drop legacy.py *anyway*, as I had
always intended not to support this exact API - I have always considered it
compat glue for iotests.

(Increasingly off-topic below this point,)

The reason I haven't done this *yet* is because:

(1) I wanted to avoid even more churn in iotests, and I only recently got
aqmp fully stable as a replacement. I didn't want to move too much around
all at once.

(2) I am still waffling a little bit on the design of the sync interface. I
am planning to base my initial design of it based on "what comes up" as I
now wean machine.py off of legacy.py. I expect there will be cases where
some things that are very easy in asyncio will be cumbersome in the sync
interface, and I'll learn a lot just by *doing the replacement*.

Easier to make changes now than later, so ... even if I don't upstream the
switchover right away, the exercise will be informative.

(The goal is actually similar to the qemu_img and qemu_io changes: make qmp
stuff error by default, but add nice facilities for declaring anticipated
errors. This delves into json structure matching, event handling/waiting,
etc. I wanna make it *really* painless to write very thorough and rigorous
tests that give very good feedback on failure.)

(3) There are still a few design bugs in aqmp itself; we just avoid them.
There's a few loose ends and rough edges here and there. I'm not sure what
will happen to the overall design as I embark on fixing them. Maybe
nothing, maybe significant changes; It's too early for me to tell. I just
know where there's some ugly spots that I want to take a serious crack at
fixing before v1.0.

[If anyone is wondering what the flaws are, they're in my qemu fork issues
tracker. They'll be moved when I fork qemu.qmp out of qemu.git. I track
both ideas and actual bugs here.
https://gitlab.com/jsnow/qemu/-/issues?sort=created_date&state=opened ]

That said, I do have a prototype; I add a sync.py and then rebase legacy.py
on top of sync.py. It seems to work fine, but for due diligence I want to
try the exercise of doing a full native replacement without any compat
shims to see what I can learn about what patterns will be helpful and where
the ugly spots are.

(Maybe I should give a micro-talk and walk people through how to write
async native tests and really try to encourage participation there. This
obviously has uses outside of just "io"tests.

Do you think this is useful outside of / ahead of KVM Forum? I want to get
people writing lots and lots of tests.)


> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--000000000000a0948105db0e59ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 25, 2022, 10:55 AM Eric Blake &lt;<a href=
=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Thu, Mar 24, 2022 at 12:07:24PM -0400, John =
Snow wrote:<br>
...<br>
&gt; &gt; Yep, as I mentioned, I don&#39;t want to see us abandon copyleft =
either.<br>
&gt; &gt;<br>
&gt; &gt; Of course everyone has their own preferred license, so I&#39;m su=
re<br>
&gt; &gt; people who write apps with MIT, will think we should use MIT<br>
&gt; &gt; too. Ultimately though, if we choose LGPL, they can still use<br>
&gt; &gt; our module from an MIT licensed app, or any other licensed app<br=
>
&gt; &gt; for that matter.<br>
&gt; &gt;<br>
&gt; <br>
&gt; OK, thanks for your input here. My plan right now, then, is:<br>
&gt; <br>
&gt; (1) Relicense aqmp as LGPLv2+<br>
&gt; (2) Fork into new repo as discussed previously on qemu-devel<br>
&gt; (3) Work on dropping legacy.py (GPLv2) in favor of sync.py (LGPLv2+)<b=
r>
<br>
That plan works for me.=C2=A0 I&#39;m happy for any of my contributions to =
be<br>
widened to LGPLv2+, but not with the thought of abandoning copyleft by<br>
going all the way to MIT.<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Thanks, it&#39;s helpful to know where people sit =
on this; it makes me feel more comfortable with the choice.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">In the future, we&#39;re probably goi=
ng to work on Apache/MIT licensed QMP libraries for other languages, but fo=
r a lib that is used in and grew out of the QEMU tree itself, it didn&#39;t=
 feel right to abandon copyleft, even for a library.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
&gt; <br>
&gt; I plan to version the fledgling forked repo as 0.0.z until I drop<br>
&gt; legacy.py, and then I&#39;ll version as 0.y.z for &quot;a while&quot;,=
 (A release or<br>
&gt; two for QEMU?), and then tag v1.0.0.<br>
&gt; (As we discussed earlier, with a non-finalized API, I&#39;ll be pinnin=
g<br>
&gt; QEMU to use specific versions until it stabilizes.)<br>
&gt; <br>
&gt; I think you&#39;re right that we probably could relicense legacy.py<br=
>
&gt; without too much fuss, I think the most significant contributions that=
<br>
&gt; didn&#39;t come from Luiz or myself were made to docstrings, and only<=
br>
&gt; extremely few contributions came from non-RH addresses. Still, I plan<=
br>
&gt; to drop the whole file anyway, so I figured I&#39;d side-step the<br>
&gt; relicensing justification there, even if it&#39;s doable.<br>
<br>
I&#39;m happy to relicense any of my contributions as needed (did I<br>
actually write any, or just provide reviews?), but as you say,<br>
sidestepping the process may get to the same end goal even faster.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah. Par=
t of it is that I intend to drop legacy.py *anyway*, as I had always intend=
ed not to support this exact API - I have always considered it compat glue =
for iotests.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(Increasing=
ly off-topic below this point,)</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">The reason I haven&#39;t done this *yet* is because:</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">(1) I wanted to avoid even more chur=
n in iotests, and I only recently got aqmp fully stable as a replacement. I=
 didn&#39;t want to move too much around all at once.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">(2) I am still waffling a little bit on the d=
esign of the sync interface. I am planning to base my initial design of it =
based on &quot;what comes up&quot; as I now wean machine.py off of legacy.p=
y. I expect there will be cases where some things that are very easy in asy=
ncio will be cumbersome in the sync interface, and I&#39;ll learn a lot jus=
t by *doing the replacement*.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Easier to make changes now than later, so ... even if I don&#39;t ups=
tream the switchover right away, the exercise will be informative.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">(The goal is actually similar to=
 the qemu_img and qemu_io changes: make qmp stuff error by default, but add=
 nice facilities for declaring anticipated errors. This delves into json st=
ructure matching, event handling/waiting, etc. I wanna make it *really* pai=
nless to write very thorough and rigorous tests that give very good feedbac=
k on failure.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">(3) There=
 are still a few design bugs in aqmp itself; we just avoid them. There&#39;=
s a few loose ends and rough edges here and there. I&#39;m not sure what wi=
ll happen to the overall design as I embark on fixing them. Maybe nothing, =
maybe significant changes; It&#39;s too early for me to tell. I just know w=
here there&#39;s some ugly spots that I want to take a serious crack at fix=
ing before v1.0.</div><div dir=3D"auto"><br></div><div dir=3D"auto">[If any=
one is wondering what the flaws are, they&#39;re in my qemu fork issues tra=
cker. They&#39;ll be moved when I fork qemu.qmp out of qemu.git. I track bo=
th ideas and actual bugs here.=C2=A0<a href=3D"https://gitlab.com/jsnow/qem=
u/-/issues?sort=3Dcreated_date&amp;state=3Dopened">https://gitlab.com/jsnow=
/qemu/-/issues?sort=3Dcreated_date&amp;state=3Dopened</a> ]</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">That said, I do have a prototype; I a=
dd a sync.py and then rebase legacy.py on top of sync.py. It seems to work =
fine, but for due diligence I want to try the exercise of doing a full nati=
ve replacement without any compat shims to see what I can learn about what =
patterns will be helpful and where the ugly spots are.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">(Maybe I should give a micro-talk and walk p=
eople through how to write async native tests and really try to encourage p=
articipation there. This obviously has uses outside of just &quot;io&quot;t=
ests.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Do you think this =
is useful outside of / ahead of KVM Forum? I want to get people writing lot=
s and lots of tests.)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D=
"noreferrer noreferrer" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div></div></div>

--000000000000a0948105db0e59ee--


