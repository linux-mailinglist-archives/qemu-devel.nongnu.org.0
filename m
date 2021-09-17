Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B27410197
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 01:14:35 +0200 (CEST)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRN3y-0006UL-ED
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 19:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRN2d-0005gI-M5
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 19:13:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRN2Z-0004R7-II
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 19:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631920385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CrJMLXDeAkx6N+HWLhQjvpOy4/p3y2bbW9fvyddJpIA=;
 b=O6DaGsF9DVb+AO1eivufsSgmrFlj7VqpUErPxE+TSTRPUjHZ9RiDEUaJKF+V9fD9w9sAjq
 01H1nWWTTuLFmo7sUfF1qyIdAEJetD+S1hy/J9FuJfXVxWH3TW2BDVODqhtLkqwHrggUED
 YTsY+p42NRBJiMJI/u8qZWNa0iOwjLw=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-2T_HfNy9PwSdwxwiAAM_BQ-1; Fri, 17 Sep 2021 19:13:04 -0400
X-MC-Unique: 2T_HfNy9PwSdwxwiAAM_BQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 d18-20020a4a9cd2000000b0029afc2f9586so1678430ook.19
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 16:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CrJMLXDeAkx6N+HWLhQjvpOy4/p3y2bbW9fvyddJpIA=;
 b=LMS7Loi8jDSxHiopw4ldKQsVsikE53ocE72E21UizspBVdNxJmqg+Qt8bcTQiNxns3
 fSEYx6cYO1utBahD6KVF4Hz1BSyB9qMhFc98JGGE9U+mWaIyfbf39KPavPM+cgZzPno4
 LIboC2PC+i+S/Fjqx7/jX4hLsHcyzgv5LM0yP0eJsRrjEkjzC2fbAoCeBx3/Sm6Z/uq2
 Ft8Uslfg6t+0Ps04anvKqyiVesyng2l1zv894jarzsP7yvfyffGXrQU3w+XeU4rwnvma
 LH8JbdCMW4CZjCkv28SVsQgZGeKjGIAjXF9Wa3jXZy12FbijWDljSrHWcMIrzcVf1tyL
 E2FA==
X-Gm-Message-State: AOAM533rUggzOEmkZAU4KotQMPStqKFuaApX8AzqWJHOpkQE/DitvKNW
 FPrOIPsWkEtGzl+2IKS5g5qY67uAAw1Eqfmi+1+x/Xh3W8gob/s1T7ofbmZqev8nm7pUrPZaPdj
 Am8Pt+ONdHl83Smz9JszTWhTeqUJ+uXE=
X-Received: by 2002:aca:3887:: with SMTP id f129mr7565119oia.112.1631920383213; 
 Fri, 17 Sep 2021 16:13:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6UHrn5oxcyZfAzJrO6RxKz7TuGqbYgUllM0OM5F/6eMxn7EkcdoUsA5eR7jjGK6NxR7pnpeuzUcj3Vka3920=
X-Received: by 2002:aca:3887:: with SMTP id f129mr7565102oia.112.1631920382979; 
 Fri, 17 Sep 2021 16:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-10-jsnow@redhat.com>
 <f39831de-afc1-3152-777d-ec4af76c087e@redhat.com>
In-Reply-To: <f39831de-afc1-3152-777d-ec4af76c087e@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 19:12:51 -0400
Message-ID: <CAFn=p-Yo3=D5uCEE4_mN9BAuO_8ALe4rSOzZmU6Lt85okUk+8A@mail.gmail.com>
Subject: Re: [PATCH 09/15] python/machine: remove has_quit argument
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bac95b05cc3912e3"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bac95b05cc3912e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 9:59 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > If we spy on the QMP commands instead, we don't need callers to remembe=
r
> > to pass it. Seems like a fair trade-off.
> >
> > The one slightly weird bit is overloading this instance variable for
> > wait(), where we use it to mean "don't issue the qmp 'quit'
> > command". This means that wait() will "fail" if the QEMU process does
> > not terminate of its own accord.
> >
> > In most cases, we probably did already actually issue quit -- some
> > iotests do this -- but in some others, we may be waiting for QEMU to
> > terminate for some other reason.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/machine/machine.py | 35 +++++++++++++++++++--------------=
-
> >   tests/qemu-iotests/040         |  7 +------
> >   tests/qemu-iotests/218         |  2 +-
> >   tests/qemu-iotests/255         |  2 +-
> >   4 files changed, 23 insertions(+), 23 deletions(-)
>
> Looks good overall, some bikeshedding below.
>
> > diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> > index 056d340e35..6e58d2f951 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -170,6 +170,7 @@ def __init__(self,
> >           self._console_socket: Optional[socket.socket] =3D None
> >           self._remove_files: List[str] =3D []
> >           self._user_killed =3D False
> > +        self._has_quit =3D False
>
> Sounds a bit weird, because evidently it has quit.
>
> I mean, it was always more of a has_sent_quit or quit_issued, but now it
> really seems a bit wrong.
>
>
"quit_issued" seems like it might help overall, I'll do that.


> [...]
>
> > @@ -529,7 +526,9 @@ def wait(self, timeout: Optional[int] =3D 30) -> No=
ne:
> >           :param timeout: Optional timeout in seconds. Default 30
> seconds.
> >                           A value of `None` is an infinite wait.
> >           """
> > -        self.shutdown(has_quit=3DTrue, timeout=3Dtimeout)
> > +        # In case QEMU was stopped without issuing 'quit':
>
> This comment confused me more than anything and only looking at the
> function=E2=80=99s name and doc string was I able to understand why we ha=
ve
> has_quit =3D True here, and only by scratching my head asking myself why
> you=E2=80=99d write the comment did I understand the comment=E2=80=99s pu=
rpose.
>
> What isn=E2=80=99t quite clear in the comment is that we kind of expect
> _has_quit to already be True, because the VM was probably exited with
> `quit`.  But we don=E2=80=99t know for sure, so we have to force _has_qui=
t to True.
>
> But it=E2=80=99s also not necessary to explain, I think.  The idea is sim=
ply
> that this function should do nothing to make the VM quit, so it=E2=80=99s
> absolutely natural that we=E2=80=99d set _has_quit to True, because the c=
aller
> guarantees that they already made the VM quit.  No need to explain why
> this might already be True, and why it=E2=80=99s still OK.
>
> So I=E2=80=99d just say something like =E2=80=9CDo not send a `quit` to t=
he VM, just
> wait for it to exit=E2=80=9D.
>
>
I'll just drop the comment, then.


> Hanna
>
> > +        self._has_quit =3D True
> > +        self.shutdown(timeout=3Dtimeout)
> >
> >       def set_qmp_monitor(self, enabled: bool =3D True) -> None:
> >           """
>
>

--000000000000bac95b05cc3912e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 9:59 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.2=
1 07:40, John Snow wrote:<br>
&gt; If we spy on the QMP commands instead, we don&#39;t need callers to re=
member<br>
&gt; to pass it. Seems like a fair trade-off.<br>
&gt;<br>
&gt; The one slightly weird bit is overloading this instance variable for<b=
r>
&gt; wait(), where we use it to mean &quot;don&#39;t issue the qmp &#39;qui=
t&#39;<br>
&gt; command&quot;. This means that wait() will &quot;fail&quot; if the QEM=
U process does<br>
&gt; not terminate of its own accord.<br>
&gt;<br>
&gt; In most cases, we probably did already actually issue quit -- some<br>
&gt; iotests do this -- but in some others, we may be waiting for QEMU to<b=
r>
&gt; terminate for some other reason.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/machine.py | 35 +++++++++++++++++++---=
------------<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/040=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 7 +------<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/218=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/255=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A04 files changed, 23 insertions(+), 23 deletions(-)<br>
<br>
Looks good overall, some bikeshedding below.<br>
<br>
&gt; diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mach=
ine.py<br>
&gt; index 056d340e35..6e58d2f951 100644<br>
&gt; --- a/python/qemu/machine/machine.py<br>
&gt; +++ b/python/qemu/machine/machine.py<br>
&gt; @@ -170,6 +170,7 @@ def __init__(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._console_socket: Optional=
[socket.socket] =3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._remove_files: List[str] =
=3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._user_killed =3D False<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._has_quit =3D False<br>
<br>
Sounds a bit weird, because evidently it has quit.<br>
<br>
I mean, it was always more of a has_sent_quit or quit_issued, but now it <b=
r>
really seems a bit wrong.<br>
<br></blockquote><div><br></div><div>&quot;quit_issued&quot; seems like it =
might help overall, I&#39;ll do that.<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
[...]<br>
<br>
&gt; @@ -529,7 +526,9 @@ def wait(self, timeout: Optional[int] =3D 30) -&gt=
; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:param timeout: Optional timeo=
ut in seconds. Default 30 seconds.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0A value of `None` is an infinite wait.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.shutdown(has_quit=3DTrue, timeout=3D=
timeout)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # In case QEMU was stopped without issuin=
g &#39;quit&#39;:<br>
<br>
This comment confused me more than anything and only looking at the <br>
function=E2=80=99s name and doc string was I able to understand why we have=
 <br>
has_quit =3D True here, and only by scratching my head asking myself why <b=
r>
you=E2=80=99d write the comment did I understand the comment=E2=80=99s purp=
ose.<br>
<br>
What isn=E2=80=99t quite clear in the comment is that we kind of expect <br=
>
_has_quit to already be True, because the VM was probably exited with <br>
`quit`.=C2=A0 But we don=E2=80=99t know for sure, so we have to force _has_=
quit to True.<br>
<br>
But it=E2=80=99s also not necessary to explain, I think.=C2=A0 The idea is =
simply <br>
that this function should do nothing to make the VM quit, so it=E2=80=99s <=
br>
absolutely natural that we=E2=80=99d set _has_quit to True, because the cal=
ler <br>
guarantees that they already made the VM quit.=C2=A0 No need to explain why=
 <br>
this might already be True, and why it=E2=80=99s still OK.<br>
<br>
So I=E2=80=99d just say something like =E2=80=9CDo not send a `quit` to the=
 VM, just <br>
wait for it to exit=E2=80=9D.<br>
<br></blockquote><div><br></div><div>I&#39;ll just drop the comment, then. =
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
Hanna<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._has_quit =3D True<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.shutdown(timeout=3Dtimeout)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def set_qmp_monitor(self, enabled: bool =3D =
True) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
</blockquote></div></div>

--000000000000bac95b05cc3912e3--


