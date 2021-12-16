Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C148477A0F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:12:14 +0100 (CET)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxuIf-0003yq-AG
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:12:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxuGg-0002Bi-IB
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:10:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxuGa-00045n-Ji
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639674603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lq3wNSQK3oH3RgR15pXfUe8xzfB188gKfbvMdAU/+CY=;
 b=hSZ9VrQJWTaUCsHYT5+b7lPY/rzOV6hNBZ1qP2nLoztmiqK90PBe87cWfYAC5tzmtGr34A
 7gWNWpRPvjpTVep4LBHbR6IhWWDla+w0DummCNe+4N6WStHXRLU+//PQ6k7LLQPc1w4y9M
 GRJ0mo2RUIbRJIOvwJOlQVx9jmML5S0=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-abYpw5XyPp6UZnlWd4nGug-1; Thu, 16 Dec 2021 12:10:01 -0500
X-MC-Unique: abYpw5XyPp6UZnlWd4nGug-1
Received: by mail-ua1-f72.google.com with SMTP id
 99-20020a9f246c000000b002f5cf140d32so4477746uaq.10
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lq3wNSQK3oH3RgR15pXfUe8xzfB188gKfbvMdAU/+CY=;
 b=z5wLmkzAfICVBscMunn8ZDgUEZPlGEfzcN4+FzD0IRXwtPLn0BnueMDsWWMcY0aLK/
 1ei0BSKafRamL5BN0fMBry89dPhnCaKNMcs3tJl4P4UbE/Drw3/ZADGYgz9zzF4jdGtM
 ICyC0sVuD4fpTJopVrIQADR296VXcJ0m8j7Rwc2+togG1wqAJA0ZIG8SN3CTd6f8YUB3
 KBImWLx6/FAlv6/dB75fcejaGk3jRjbw+/nM50D5s0E2JNlyvCml/3jvwmfmJIiOYja+
 Ms+ElAhAkNh/NORisGvFugdlBnI64Wi4TLcHWq8wN+EfotC4QT1Cl2hVNnWhs02I9JdY
 D2zA==
X-Gm-Message-State: AOAM530apiFeCs9C5eWrfk56P/NzZw6gRgBGNTjL9TE7nCnSTpJkyXeW
 P8QwStAVyJOv39q36eDku/uc43xK6uyzy5kDg27SKseHSALCsyCMiituelWNBjtpN4GbPenPN0r
 yzqbXSUN4rcLuQZqH0Upulu8dmrvR54s=
X-Received: by 2002:a05:6102:1ca:: with SMTP id
 s10mr6115130vsq.61.1639674601293; 
 Thu, 16 Dec 2021 09:10:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwkYkGV0WIgxw/K7K3/I3VMPLvDTnawSavJtmpbSFXmJN1gli4J1azqyX8GW9FvMPx9djGB4KwfG+fzeECKvM=
X-Received: by 2002:a05:6102:1ca:: with SMTP id
 s10mr6115105vsq.61.1639674601059; 
 Thu, 16 Dec 2021 09:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-2-jsnow@redhat.com>
 <bb4ea49a-1442-bc71-7ea8-262b86b692ab@virtuozzo.com>
In-Reply-To: <bb4ea49a-1442-bc71-7ea8-262b86b692ab@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 12:09:50 -0500
Message-ID: <CAFn=p-ZC7SxAfSmWvhqpQfxEN7wOdynt2-rPN8bY5j+93QJMJA@mail.gmail.com>
Subject: Re: [PATCH v2 01/25] python/aqmp: add __del__ method to legacy
 interface
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000024d10105d3467e26"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000024d10105d3467e26
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 4:31 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 15.12.2021 22:39, John Snow wrote:
> > asyncio can complain *very* loudly if you forget to back out of things
> > gracefully before the garbage collector starts destroying objects that
> > contain live references to asyncio Tasks.
> >
> > The usual fix is just to remember to call aqmp.disconnect(), but for the
> > sake of the legacy wrapper and quick, one-off scripts where a graceful
> > shutdown is not necessarily of paramount imporance, add a courtesy
> > cleanup that will trigger prior to seeing screenfuls of confusing
> > asyncio tracebacks.
> >
> > Note that we can't *always* save you from yourself; depending on when
> > the GC runs, you might just seriously be out of luck. The best we can do
> > in this case is to gently remind you to clean up after yourself.
> >
> > (Still much better than multiple pages of incomprehensible python
> > warnings for the crime of forgetting to put your toys away.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/aqmp/legacy.py | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> > index 9e7b9fb80b..2ccb136b02 100644
> > --- a/python/qemu/aqmp/legacy.py
> > +++ b/python/qemu/aqmp/legacy.py
> > @@ -16,6 +16,8 @@
> >   import qemu.qmp
> >   from qemu.qmp import QMPMessage, QMPReturnValue, SocketAddrT
> >
> > +from .error import AQMPError
> > +from .protocol import Runstate
> >   from .qmp_client import QMPClient
> >
> >
> > @@ -136,3 +138,19 @@ def settimeout(self, timeout: Optional[float]) ->
> None:
> >
> >       def send_fd_scm(self, fd: int) -> None:
> >           self._aqmp.send_fd_scm(fd)
> > +
> > +    def __del__(self) -> None:
> > +        if self._aqmp.runstate == Runstate.IDLE:
> > +            return
> > +
> > +        if not self._aloop.is_running():
> > +            self.close()
>
> As I understand, if close() was called by hand, runstate should already be
> IDLE, and we don't call close() twice here?
>
>
Right ... calling close() twice is actually OK (the second one just does
nothing) but what I am avoiding here is this scenario:

- close() was already called
- garbage collection runs while the event loop is running
- we should therefore NOT raise an exception.

The problem is that even if a second close() does nothing, we are not able
to call into it if we're already inside of an active event loop -- so in
order to achieve the no-op behavior from the GC context, I need to manually
check the runstate to determine if there /WILL/ be a problem when the GC
runs. If it's idle, there definitely won't be.


> > +        else:
> > +            # Garbage collection ran while the event loop was running.
> > +            # Nothing we can do about it now, but if we don't raise our
> > +            # own error, the user will be treated to a lot of traceback
> > +            # they might not understand.
> > +            raise AQMPError(
> > +                "QEMUMonitorProtocol.close()"
> > +                " was not called before object was garbage collected"
> > +            )
> >
>
> weak, as I'm far from understanding aqmp library:
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
>
thanks!
--js

--00000000000024d10105d3467e26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 4:31 AM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">15.12.2021 22:39, John Snow wrote:<br>
&gt; asyncio can complain *very* loudly if you forget to back out of things=
<br>
&gt; gracefully before the garbage collector starts destroying objects that=
<br>
&gt; contain live references to asyncio Tasks.<br>
&gt; <br>
&gt; The usual fix is just to remember to call aqmp.disconnect(), but for t=
he<br>
&gt; sake of the legacy wrapper and quick, one-off scripts where a graceful=
<br>
&gt; shutdown is not necessarily of paramount imporance, add a courtesy<br>
&gt; cleanup that will trigger prior to seeing screenfuls of confusing<br>
&gt; asyncio tracebacks.<br>
&gt; <br>
&gt; Note that we can&#39;t *always* save you from yourself; depending on w=
hen<br>
&gt; the GC runs, you might just seriously be out of luck. The best we can =
do<br>
&gt; in this case is to gently remind you to clean up after yourself.<br>
&gt; <br>
&gt; (Still much better than multiple pages of incomprehensible python<br>
&gt; warnings for the crime of forgetting to put your toys away.)<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/legacy.py | 18 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 18 insertions(+)<br>
&gt; <br>
&gt; diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py<b=
r>
&gt; index 9e7b9fb80b..2ccb136b02 100644<br>
&gt; --- a/python/qemu/aqmp/legacy.py<br>
&gt; +++ b/python/qemu/aqmp/legacy.py<br>
&gt; @@ -16,6 +16,8 @@<br>
&gt;=C2=A0 =C2=A0import qemu.qmp<br>
&gt;=C2=A0 =C2=A0from qemu.qmp import QMPMessage, QMPReturnValue, SocketAdd=
rT<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +from .error import AQMPError<br>
&gt; +from .protocol import Runstate<br>
&gt;=C2=A0 =C2=A0from .qmp_client import QMPClient<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -136,3 +138,19 @@ def settimeout(self, timeout: Optional[float]) -&=
gt; None:<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def send_fd_scm(self, fd: int) -&gt; None:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._aqmp.send_fd_scm(fd)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __del__(self) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._aqmp.runstate =3D=3D Runstate.ID=
LE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self._aloop.is_running():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.close()<br>
<br>
As I understand, if close() was called by hand, runstate should already be =
IDLE, and we don&#39;t call close() twice here?<br>
<br></blockquote><div><br></div><div>Right ... calling close() twice is act=
ually OK (the second one just does nothing) but what I am avoiding here is =
this scenario:</div><div><br></div><div>- close() was already called</div><=
div>- garbage collection runs while the event loop is running</div><div cla=
ss=3D"gmail_quote">- we should therefore NOT raise an exception.</div><div =
class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">The problem is t=
hat even if a second close() does nothing, we are not able to call into it =
if we&#39;re already inside of an active event loop -- so in order to achie=
ve the no-op behavior from the GC context, I need to manually check the run=
state to determine if there /WILL/ be a problem when the GC runs. If it&#39=
;s idle, there definitely won&#39;t be.<br></div>=C2=A0<div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Garbage collection ran wh=
ile the event loop was running.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Nothing we can do about i=
t now, but if we don&#39;t raise our<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # own error, the user will =
be treated to a lot of traceback<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # they might not understand=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise AQMPError(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;QEMUMon=
itorProtocol.close()&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; was no=
t called before object was garbage collected&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; <br>
<br>
weak, as I&#39;m far from understanding aqmp library:<br>
<br>
Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@=
virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
<br></blockquote><div><br></div>thanks!</div></div><div class=3D"gmail_quot=
e">--js<br></div></div>

--00000000000024d10105d3467e26--


