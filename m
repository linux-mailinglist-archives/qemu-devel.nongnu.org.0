Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C829477B11
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:52:22 +0100 (CET)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxuvV-0006Tp-5K
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:52:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxutT-0004Y8-0f
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:50:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxutQ-0006UD-Pu
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639677011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pni6e7XQALE8DvLVRdpELabg49TtWZDxO3UHNc5Qcsc=;
 b=IZtrasC6ypJjmktm5Xpz2E47sVe5sePrQIdM4tc9llldDuSyAh+PKzjuSEKWNRrEGAfK4E
 8MhHZQFO3OIj5DPbkCBvwL1eXBTFW2a7MQREW5ReEb1WJapCf288PwMKX4kVNzpZOdEHRV
 mlL14VsVJ1PrfRSphiPLI409nLQlkDg=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-1wDPZa7oOkCvla7vPLar-g-1; Thu, 16 Dec 2021 12:50:09 -0500
X-MC-Unique: 1wDPZa7oOkCvla7vPLar-g-1
Received: by mail-ua1-f72.google.com with SMTP id
 99-20020a9f246c000000b002f5cf140d32so4529596uaq.10
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pni6e7XQALE8DvLVRdpELabg49TtWZDxO3UHNc5Qcsc=;
 b=fihUkA7oeJ6DS7EdcXvdy34ZlmJN/FdD/7ZceetIE2jIvJsPYsevP79847BYAd9Ic+
 rZCU0OBz9MhLC7Us9wU0BIGlpsOICHXrEJ0GjQR7Jw2jskCW9qhltt/55QZc666gKSy2
 PcH9MjVhQE03nnBP3pMbnAIV/Y0pyGns1T/Pqz8L7IlpkKUwSrVz3nC1WqMZDNIoW6yx
 elwXOV83wXCHIhZ67Qs8YzI4ePd315DIoGZGOD0MFlewaKj4Ejxh6a+cjfXujDFcL3cH
 y7JdgC0tPGOseWLnmGI+d0rio6KHoNSl7802nkT994//WBKXvy9f1Cby5fFCQT7L6Kx8
 oO+g==
X-Gm-Message-State: AOAM532Plf7yylTBzkgydQDgN3Kxqg6DwOoN8ABVy21eQssv/Cm6G0zU
 bhCuIG8Ykk7/nEj7r+ES8n2P7hjtVZrkeNvcu+s3HqkRKtMuJC8rhbRGXGHPYgNCNQVOV//HzP8
 zH5JUA0phfdIyuz1zFRjY75+toJ+BJA0=
X-Received: by 2002:a05:6122:2158:: with SMTP id
 m24mr7285423vkd.1.1639677009275; 
 Thu, 16 Dec 2021 09:50:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9rUTMAEvOawWvMh7YKgx2MUZalvIJaawu3sJXwTK7Nnx6OSGCqLbFt4sQkTedbVGzNqsd2cfWaO9KDPjhrds=
X-Received: by 2002:a05:6122:2158:: with SMTP id
 m24mr7285401vkd.1.1639677009003; 
 Thu, 16 Dec 2021 09:50:09 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-13-jsnow@redhat.com>
 <1cfdbd81-810e-05e6-57cd-a63e9cb8bddb@virtuozzo.com>
In-Reply-To: <1cfdbd81-810e-05e6-57cd-a63e9cb8bddb@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 12:49:58 -0500
Message-ID: <CAFn=p-YHSU9ZC9sGa0FWQEXo8f+7xX6B9D=9VCHxKUEEB=LkPg@mail.gmail.com>
Subject: Re: [PATCH v2 12/25] python/machine: permanently switch to AQMP
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ab1c1d05d3470d1f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

--000000000000ab1c1d05d3470d1f
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 5:52 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 15.12.2021 22:39, John Snow wrote:
> > Remove the QEMU_PYTHON_LEGACY_QMP environment variable, making the
> > switch permanent. Update Exceptions and import paths as necessary.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/machine/machine.py | 18 +++++++-----------
> >   python/qemu/machine/qtest.py   |  2 +-
> >   2 files changed, 8 insertions(+), 12 deletions(-)
> >
> > diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> > index 67ab06ca2b..21fb4a4f30 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -40,21 +40,16 @@
> >       TypeVar,
> >   )
> >
> > -from qemu.qmp import (  # pylint: disable=import-error
> > +from qemu.aqmp import SocketAddrT
> > +from qemu.aqmp.legacy import (
> > +    QEMUMonitorProtocol,
> >       QMPMessage,
> >       QMPReturnValue,
> > -    SocketAddrT,
> >   )
> >
> >   from . import console_socket
> >
> >
> > -if os.environ.get('QEMU_PYTHON_LEGACY_QMP'):
> > -    from qemu.qmp import QEMUMonitorProtocol
> > -else:
> > -    from qemu.aqmp.legacy import QEMUMonitorProtocol
> > -
> > -
> >   LOG = logging.getLogger(__name__)
> >
> >
> > @@ -710,8 +705,9 @@ def events_wait(self,
> >           :param timeout: Optional timeout, in seconds.
> >                           See QEMUMonitorProtocol.pull_event.
> >
> > -        :raise QMPTimeoutError: If timeout was non-zero and no matching
> events
> > -                                were found.
> > +        :raise asyncio.TimeoutError:
> > +            If timeout was non-zero and no matching events were found.
> > +
> >           :return: A QMP event matching the filter criteria.
> >                    If timeout was 0 and no event matched, None.
> >           """
> > @@ -734,7 +730,7 @@ def _match(event: QMPMessage) -> bool:
> >               event = self._qmp.pull_event(wait=timeout)
> >               if event is None:
> >                   # NB: None is only returned when timeout is false-ish.
> > -                # Timeouts raise QMPTimeoutError instead!
> > +                # Timeouts raise asyncio.TimeoutError instead!
> >                   break
> >               if _match(event):
> >                   return event
> > diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
> > index f2f9aaa5e5..817c8a5425 100644
> > --- a/python/qemu/machine/qtest.py
> > +++ b/python/qemu/machine/qtest.py
> > @@ -26,7 +26,7 @@
> >       TextIO,
> >   )
> >
> > -from qemu.qmp import SocketAddrT  # pylint: disable=import-error
> > +from qemu.aqmp.protocol import SocketAddrT
>
> You can also import it simply from qemu.aqmp
>
>
Guess what order those patches got written in :)

You're right, I'll update this.


> >
> >   from .machine import QEMUMachine
> >
> >
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
>
Thanks

--000000000000ab1c1d05d3470d1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:52 AM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">15.12.2021 22:39, John Snow wrote:<br>
&gt; Remove the QEMU_PYTHON_LEGACY_QMP environment variable, making the<br>
&gt; switch permanent. Update Exceptions and import paths as necessary.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/machine.py | 18 +++++++-----------<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/qtest.py=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A02 files changed, 8 insertions(+), 12 deletions(-)<br>
&gt; <br>
&gt; diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mach=
ine.py<br>
&gt; index 67ab06ca2b..21fb4a4f30 100644<br>
&gt; --- a/python/qemu/machine/machine.py<br>
&gt; +++ b/python/qemu/machine/machine.py<br>
&gt; @@ -40,21 +40,16 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TypeVar,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -from qemu.qmp import (=C2=A0 # pylint: disable=3Dimport-error<br>
&gt; +from qemu.aqmp import SocketAddrT<br>
&gt; +from qemu.aqmp.legacy import (<br>
&gt; +=C2=A0 =C2=A0 QEMUMonitorProtocol,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QMPMessage,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QMPReturnValue,<br>
&gt; -=C2=A0 =C2=A0 SocketAddrT,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0from . import console_socket<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -if os.environ.get(&#39;QEMU_PYTHON_LEGACY_QMP&#39;):<br>
&gt; -=C2=A0 =C2=A0 from qemu.qmp import QEMUMonitorProtocol<br>
&gt; -else:<br>
&gt; -=C2=A0 =C2=A0 from qemu.aqmp.legacy import QEMUMonitorProtocol<br>
&gt; -<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0LOG =3D logging.getLogger(__name__)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -710,8 +705,9 @@ def events_wait(self,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:param timeout: Optional timeo=
ut, in seconds.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0See QEMUMonitorProtocol.pull_event.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise QMPTimeoutError: If timeout was no=
n-zero and no matching events<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 were found.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise asyncio.TimeoutError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If timeout was non-zero and=
 no matching events were found.<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:return: A QMP event matching =
the filter criteria.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I=
f timeout was 0 and no event matched, None.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; @@ -734,7 +730,7 @@ def _match(event: QMPMessage) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D self._=
qmp.pull_event(wait=3Dtimeout)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if event is None=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# =
NB: None is only returned when timeout is false-ish.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Timeouts ra=
ise QMPTimeoutError instead!<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Timeouts ra=
ise asyncio.TimeoutError instead!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br=
eak<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if _match(event)=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn event<br>
&gt; diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.=
py<br>
&gt; index f2f9aaa5e5..817c8a5425 100644<br>
&gt; --- a/python/qemu/machine/qtest.py<br>
&gt; +++ b/python/qemu/machine/qtest.py<br>
&gt; @@ -26,7 +26,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TextIO,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -from qemu.qmp import SocketAddrT=C2=A0 # pylint: disable=3Dimport-err=
or<br>
&gt; +from qemu.aqmp.protocol import SocketAddrT<br>
<br>
You can also import it simply from qemu.aqmp<br>
<br></blockquote><div><br></div><div>Guess what order those patches got wri=
tten in :)</div><div><br></div><div>You&#39;re right, I&#39;ll update this.=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0from .machine import QEMUMachine<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
<br>
Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@=
virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks <br></div></div></div>

--000000000000ab1c1d05d3470d1f--


