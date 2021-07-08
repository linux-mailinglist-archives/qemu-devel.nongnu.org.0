Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08233C1446
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:26:23 +0200 (CEST)
Received: from localhost ([::1]:41754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1U2o-0006bb-Oh
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m1U11-0005Ei-QO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:24:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m1U0t-0003eY-9E
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625750661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rR3CIbwv19nBVHPhTroPJWLJK7uQtim4leRTmh2bULs=;
 b=OfYU8QFNd+ZKHtNlBdFT97WMLGQqIMvFfzd2gsInKvorlzfAzPk8MfVU99n7JOej4Rp2LU
 uJb+bBTtwAyNpaxRQqHCEJTfB+Viep3wbWiW31vL0RS2s85Dn9j9fciCR4guQYmaGVKqJp
 1q/l6qCoPpZBtciYR1oEuQyH0UkwVMs=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-mqrHZYDPMxOEptYcdUQzXw-1; Thu, 08 Jul 2021 09:24:19 -0400
X-MC-Unique: mqrHZYDPMxOEptYcdUQzXw-1
Received: by mail-ot1-f70.google.com with SMTP id
 d15-20020a9d4f0f0000b02904b276a589a4so2930736otl.22
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 06:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rR3CIbwv19nBVHPhTroPJWLJK7uQtim4leRTmh2bULs=;
 b=fccuEWG04Ki9G8HX3aJt1TEsDlHX2PQDhodtDjdKCWFl6uUE07yl5VnuTajQOOy1sN
 +O2kbsI0WnjUpicBF20flsZ1YKBEgmXTozV5ZDjYaPYyfWWQa/KNSob/ZCWURDBL/m/4
 8Rd/nRrQbHD6nWWB5oFWtHRaNp7JjqEGXKfobxojnyZDlvq9EdbPa5gsMJVfu49zl0dT
 NI2RyLYei9O7pxFYHlGr3OJH1BvWio1QTv6v++g5WW5Qb+UmBgps71ANHsrF2bjiOm+x
 HQu9wEa1QHiraImgCsfe6jZoLpgQhoSU4gOpM1drZ++raLidgoXhex1pOw+OIO+FXUBJ
 bwUw==
X-Gm-Message-State: AOAM532vh7/kYCpg6HR7dkPJwdZtl+/Cgrw+SPF8Gy32B73bTKch0nDd
 HPlPLYwsSaHd2mNksMSi2zLsiRT3yiJskVBMRS+AC33BlwiO2QP570YY4peUp/m8RJ+65Gv/UJN
 IbaLwoogZAN01maH5EHosDH27ucT+RSA=
X-Received: by 2002:aca:2212:: with SMTP id b18mr22149792oic.52.1625750658889; 
 Thu, 08 Jul 2021 06:24:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP7yZTySu/HME6avnyXDbrrhemCxaagjYvaqGPpVE+o0bp64ezaL5PEbTTS3zjSMAZAsqVnisQUEPSPArpz6I=
X-Received: by 2002:aca:2212:: with SMTP id b18mr22149775oic.52.1625750658677; 
 Thu, 08 Jul 2021 06:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210701041313.1696009-1-jsnow@redhat.com>
 <YOMG9t3aS1unmtx0@stefanha-x1.localdomain>
In-Reply-To: <YOMG9t3aS1unmtx0@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Date: Thu, 8 Jul 2021 09:24:07 -0400
Message-ID: <CAFn=p-YDkWNq=gh51O-g3mvi0pLRVaT0n1Dgj_a5VS_B3v_m-w@mail.gmail.com>
Subject: Re: [PATCH 00/20] python: introduce Asynchronous QMP package
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000810fc005c69c92e1"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000810fc005c69c92e1
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 5, 2021 at 9:20 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Jul 01, 2021 at 12:12:53AM -0400, John Snow wrote:
> > GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-async-qmp-aqmp
> > CI: https://gitlab.com/jsnow/qemu/-/pipelines/330003554
> > Docs: https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html
> > Based-on: <20210701020921.1679468-1-jsnow@redhat.com>
> >           [PULL 00/15] Python patches
> >
> > Hi!
> >
> > This patch series adds an Asynchronous QMP package to the Python
> > library. It offers a few improvements over the previous library:
> >
> > - out-of-band support
> > - true asynchronous event support
> > - avoids undocumented interfaces abusing non-blocking sockets
> >
> > This library serves as the basis for a new qmp-shell program that will
> > offer improved reconnection support, true asynchronous display of
> > events, VM and job status update notifiers, and so on.
> >
> > My intent is to eventually publish this library directly to PyPI as a
> > standalone package. I would like to phase out our usage of the old QMP
> > library over time; eventually replacing it entirely with this one.
> >
> > This series looks big by line count, but it's *mostly*
> > docstrings. Seriously!
> >
> > This package has *no* external dependencies whatsoever.
> >
> > Notes & Design
> > ==============
> >
> > Here are some notes on the design of how the library works, to serve as
> > a primer for review; however I also **highly recommend** browsing the
> > generated Sphinx documentation for this series.
> >
> > Here's that link again:
> > https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html
> >
> > The core machinery is split between the AsyncProtocol and QMP
> > classes. AsyncProtocol provides the generic machinery, while QMP
> > provides the QMP-specific details.
> >
> > The design uses two independent coroutines that act as the "bottom
> > half", a writer task and a reader task. These tasks run for the duration
> > of the connection and independently send and receive messages,
> > respectively.
> >
> > A third task, disconnect, is scheduled asynchronously whenever an
> > unrecoverable error occurs and facilitates coalescing of the other two
> > tasks.
> >
> > This diagram for how execute() operates may be helpful for understanding
> > how AsyncProtocol is laid out. The arrows indicate the direction of a
> > QMP message; the long horizontal dash indicates the separation between
> > the upper and lower half of the event loop. The queue mechanisms between
> > both dashes serve as the intermediaries between the upper and lower
> > half.
> >
> >                        +---------+
> >                        | caller  |
> >                        +---------+
> >                            ^ |
> >                            | v
> >                        +---------+
> >      +---------------> |execute()| -----------+
> >      |                 +---------+            |
> >      |                                        |
> > [-----------------------------------------------------------]
> >      |                                        |
> >      |                                        v
> > +----+------+    +----------------+    +------+-------+
> > | ExecQueue |    | EventListeners |    |Outbound Queue|
> > +----+------+    +----+-----------+    +------+-------+
> >      ^                ^                       |
> >      |                |                       |
> > [-----------------------------------------------------------]
> >      |                |                       |
> >      |                |                       v
> >   +--+----------------+---+       +-----------+-----------+
> >   | Reader Task/Coroutine |       | Writer Task/Coroutine |
> >   +-----------+-----------+       +-----------+-----------+
> >               ^                               |
> >               |                               v
> >         +-----+------+                  +-----+------+
> >         |StreamReader|                  |StreamWriter|
> >         +------------+                  +------------+
> >
> > The caller will invoke execute(), which in turn will deposit a message
> > in the outbound send queue. This will wake up the writer task, which
> > well send the message over the wire.
> >
> > The execute() method will then yield to wait for a reply delivered to an
> > execution queue created solely for that execute statement.
> >
> > When a message arrives, the Reader task will unblock and route the
> > message either to the EventListener subsystem, or place it in the
> > appropriate pending execution queue.
> >
> > Once a message is placed in the pending execution queue, execute() will
> > unblock and the execution will conclude, returning the result of the RPC
> > call to the caller.
> >
> > Ugly Bits
> > =========
> >
> > - MultiException is ... wonky. I am still working out how to avoid
> needing it.
> >   See patch 04/20 for details here, or see
> >   https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.error.html
> >
> >   Patch 06/20 also goes into details of the ugliness; see
> >   AsyncProtocol._results or view the same information here:
> >
> https://people.redhat.com/~jsnow/sphinx/html/_modules/qemu/aqmp/protocol.html#AsyncProtocol._results
> >
> > - There are quite a few lingering questions I have over the design of the
> >   EventListener subsystem; I wrote about those ugly bits in excruciating
> detail
> >   in patch 14/20.
> >
> >   You can view them formatted nicely here:
> >
> https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.events.html#experimental-interfaces-design-issues
> >
> > Patch Layout
> > ============
> >
> > Patches 1-2 are tiny pylint configuration changes.
> > Patches 3-5 begin to check in Async QMP components, they are small.
> > Patches 6-11 add a generic async message-based protocol class,
> >              AsyncProto. They are split as small as I could
> >              reasonably split them.
> > Patches 12-14 check in more QMP-specific components.
> > Patches 15-18 add qmp_protocol.py, the new 'QMP' class. They're split as
> >               far down as I could, I hope they're easy to review.
> > Patches 19-20 add a few finishing touches, they are small patches.
> >
> > Future Work
> > ===========
> >
> > These items are in progress:
> >
> > - A Synchronous QMP wrapper that allows this library to be easily used
> >   from non-async code; this will also allow me to prove it works well by
> >   demoing its replacement throughout iotests.
> >
> > - A QMP server class; to facilitate writing of unit tests.
> >
> > - Unit tests. Real unit tests.
> >
> > If you made it this far in the cover letter, congrats :)
> >
> > John Snow (20):
> >   python/pylint: Add exception for TypeVar names ('T')
> >   python/pylint: disable too-many-function-args
> >   python/aqmp: add asynchronous QMP (AQMP) subpackage
> >   python/aqmp: add error classes
> >   python/aqmp: add asyncio compatibility wrappers
> >   python/aqmp: add generic async message-based protocol support
> >   python/aqmp: add runstate state machine to AsyncProtocol
> >   python/aqmp: add logging to AsyncProtocol
> >   python/aqmp: add AsyncProtocol.accept() method
> >   python/aqmp: add _cb_inbound and _cb_inbound logging hooks
> >   python/aqmp: add AsyncProtocol._readline() method
> >   python/aqmp: add QMP Message format
> >   python/aqmp: add well-known QMP object models
> >   python/aqmp: add QMP event support
> >   python/aqmp: add QMP protocol support
> >   python/aqmp: Add message routing to QMP protocol
> >   python/aqmp: add execute() interfaces
> >   python/aqmp: add _raw() execution interface
> >   python/aqmp: add asyncio_run compatibility wrapper
> >   python/aqmp: add scary message
> >
> >  python/qemu/aqmp/__init__.py     |  61 +++
> >  python/qemu/aqmp/error.py        |  97 ++++
> >  python/qemu/aqmp/events.py       | 878 +++++++++++++++++++++++++++++++
> >  python/qemu/aqmp/message.py      | 207 ++++++++
> >  python/qemu/aqmp/models.py       | 133 +++++
> >  python/qemu/aqmp/protocol.py     | 851 ++++++++++++++++++++++++++++++
> >  python/qemu/aqmp/py.typed        |   0
> >  python/qemu/aqmp/qmp_protocol.py | 565 ++++++++++++++++++++
> >  python/qemu/aqmp/util.py         | 183 +++++++
> >  python/setup.cfg                 |   4 +-
> >  10 files changed, 2978 insertions(+), 1 deletion(-)
> >  create mode 100644 python/qemu/aqmp/__init__.py
> >  create mode 100644 python/qemu/aqmp/error.py
> >  create mode 100644 python/qemu/aqmp/events.py
> >  create mode 100644 python/qemu/aqmp/message.py
> >  create mode 100644 python/qemu/aqmp/models.py
> >  create mode 100644 python/qemu/aqmp/protocol.py
> >  create mode 100644 python/qemu/aqmp/py.typed
> >  create mode 100644 python/qemu/aqmp/qmp_protocol.py
> >  create mode 100644 python/qemu/aqmp/util.py
>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
>

Brave of you, thanks :)

I am working on a V2 presently, with a bunch of avocado unit tests, which
has revealed a few small bugs and inconsistencies. This version also adds a
mock QMPServer class alongside the client, for the purposes of testing. I
think once those pieces are done I will be quite happy to check it into the
tree as an "alpha" version, though I'd still be very happy to get more
feedback on the EventListener piece from anyone willing to browse the
"parts I don't like about this" section of the docs:

https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.events.html#experimental-interfaces-design-issues

--000000000000810fc005c69c92e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 5, 2021 at 9:20 AM Stefan=
 Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Thu, Jul 01, 2021 at 12:12:53AM -0400, John Snow wrote:<br>
&gt; GitLab: <a href=3D"https://gitlab.com/jsnow/qemu/-/commits/python-asyn=
c-qmp-aqmp" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/q=
emu/-/commits/python-async-qmp-aqmp</a><br>
&gt; CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/330003554" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipeline=
s/330003554</a><br>
&gt; Docs: <a href=3D"https://people.redhat.com/~jsnow/sphinx/html/qemu.aqm=
p.html" rel=3D"noreferrer" target=3D"_blank">https://people.redhat.com/~jsn=
ow/sphinx/html/qemu.aqmp.html</a><br>
&gt; Based-on: &lt;<a href=3D"mailto:20210701020921.1679468-1-jsnow@redhat.=
com" target=3D"_blank">20210701020921.1679468-1-jsnow@redhat.com</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[PULL 00/15] Python patches<br=
>
&gt; <br>
&gt; Hi!<br>
&gt; <br>
&gt; This patch series adds an Asynchronous QMP package to the Python<br>
&gt; library. It offers a few improvements over the previous library:<br>
&gt; <br>
&gt; - out-of-band support<br>
&gt; - true asynchronous event support<br>
&gt; - avoids undocumented interfaces abusing non-blocking sockets<br>
&gt; <br>
&gt; This library serves as the basis for a new qmp-shell program that will=
<br>
&gt; offer improved reconnection support, true asynchronous display of<br>
&gt; events, VM and job status update notifiers, and so on.<br>
&gt; <br>
&gt; My intent is to eventually publish this library directly to PyPI as a<=
br>
&gt; standalone package. I would like to phase out our usage of the old QMP=
<br>
&gt; library over time; eventually replacing it entirely with this one.<br>
&gt; <br>
&gt; This series looks big by line count, but it&#39;s *mostly*<br>
&gt; docstrings. Seriously!<br>
&gt; <br>
&gt; This package has *no* external dependencies whatsoever.<br>
&gt; <br>
&gt; Notes &amp; Design<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; Here are some notes on the design of how the library works, to serve a=
s<br>
&gt; a primer for review; however I also **highly recommend** browsing the<=
br>
&gt; generated Sphinx documentation for this series.<br>
&gt; <br>
&gt; Here&#39;s that link again:<br>
&gt; <a href=3D"https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html=
" rel=3D"noreferrer" target=3D"_blank">https://people.redhat.com/~jsnow/sph=
inx/html/qemu.aqmp.html</a><br>
&gt; <br>
&gt; The core machinery is split between the AsyncProtocol and QMP<br>
&gt; classes. AsyncProtocol provides the generic machinery, while QMP<br>
&gt; provides the QMP-specific details.<br>
&gt; <br>
&gt; The design uses two independent coroutines that act as the &quot;botto=
m<br>
&gt; half&quot;, a writer task and a reader task. These tasks run for the d=
uration<br>
&gt; of the connection and independently send and receive messages,<br>
&gt; respectively.<br>
&gt; <br>
&gt; A third task, disconnect, is scheduled asynchronously whenever an<br>
&gt; unrecoverable error occurs and facilitates coalescing of the other two=
<br>
&gt; tasks.<br>
&gt; <br>
&gt; This diagram for how execute() operates may be helpful for understandi=
ng<br>
&gt; how AsyncProtocol is laid out. The arrows indicate the direction of a<=
br>
&gt; QMP message; the long horizontal dash indicates the separation between=
<br>
&gt; the upper and lower half of the event loop. The queue mechanisms betwe=
en<br>
&gt; both dashes serve as the intermediaries between the upper and lower<br=
>
&gt; half.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 +---------+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | caller=C2=A0 |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 +---------+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | v<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 +---------+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 +---------------&gt; |execute()| -----------+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0+---------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |<br>
&gt; [-----------------------------------------------------------]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 v<br>
&gt; +----+------+=C2=A0 =C2=A0 +----------------+=C2=A0 =C2=A0 +------+---=
----+<br>
&gt; | ExecQueue |=C2=A0 =C2=A0 | EventListeners |=C2=A0 =C2=A0 |Outbound Q=
ueue|<br>
&gt; +----+------+=C2=A0 =C2=A0 +----+-----------+=C2=A0 =C2=A0 +------+---=
----+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|<br>
&gt; [-----------------------------------------------------------]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0v<br>
&gt;=C2=A0 =C2=A0+--+----------------+---+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-----=
------+-----------+<br>
&gt;=C2=A0 =C2=A0| Reader Task/Coroutine |=C2=A0 =C2=A0 =C2=A0 =C2=A0| Writ=
er Task/Coroutine |<br>
&gt;=C2=A0 =C2=A0+-----------+-----------+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-----=
------+-----------+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0v<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+-----+------+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +-----+------+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|StreamReader|=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |StreamWriter|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------------+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +------------+<br>
&gt; <br>
&gt; The caller will invoke execute(), which in turn will deposit a message=
<br>
&gt; in the outbound send queue. This will wake up the writer task, which<b=
r>
&gt; well send the message over the wire.<br>
&gt; <br>
&gt; The execute() method will then yield to wait for a reply delivered to =
an<br>
&gt; execution queue created solely for that execute statement.<br>
&gt; <br>
&gt; When a message arrives, the Reader task will unblock and route the<br>
&gt; message either to the EventListener subsystem, or place it in the<br>
&gt; appropriate pending execution queue.<br>
&gt; <br>
&gt; Once a message is placed in the pending execution queue, execute() wil=
l<br>
&gt; unblock and the execution will conclude, returning the result of the R=
PC<br>
&gt; call to the caller.<br>
&gt; <br>
&gt; Ugly Bits<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; - MultiException is ... wonky. I am still working out how to avoid nee=
ding it.<br>
&gt;=C2=A0 =C2=A0See patch 04/20 for details here, or see<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://people.redhat.com/~jsnow/sphinx/html/qe=
mu.aqmp.error.html" rel=3D"noreferrer" target=3D"_blank">https://people.red=
hat.com/~jsnow/sphinx/html/qemu.aqmp.error.html</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0Patch 06/20 also goes into details of the ugliness; see<br=
>
&gt;=C2=A0 =C2=A0AsyncProtocol._results or view the same information here:<=
br>
&gt;=C2=A0 =C2=A0<a href=3D"https://people.redhat.com/~jsnow/sphinx/html/_m=
odules/qemu/aqmp/protocol.html#AsyncProtocol._results" rel=3D"noreferrer" t=
arget=3D"_blank">https://people.redhat.com/~jsnow/sphinx/html/_modules/qemu=
/aqmp/protocol.html#AsyncProtocol._results</a><br>
&gt; <br>
&gt; - There are quite a few lingering questions I have over the design of =
the<br>
&gt;=C2=A0 =C2=A0EventListener subsystem; I wrote about those ugly bits in =
excruciating detail<br>
&gt;=C2=A0 =C2=A0in patch 14/20.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0You can view them formatted nicely here:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://people.redhat.com/~jsnow/sphinx/html/qe=
mu.aqmp.events.html#experimental-interfaces-design-issues" rel=3D"noreferre=
r" target=3D"_blank">https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp=
.events.html#experimental-interfaces-design-issues</a><br>
&gt; <br>
&gt; Patch Layout<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; Patches 1-2 are tiny pylint configuration changes.<br>
&gt; Patches 3-5 begin to check in Async QMP components, they are small.<br=
>
&gt; Patches 6-11 add a generic async message-based protocol class,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AsyncProto. They are s=
plit as small as I could<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reasonably split them.=
<br>
&gt; Patches 12-14 check in more QMP-specific components.<br>
&gt; Patches 15-18 add qmp_protocol.py, the new &#39;QMP&#39; class. They&#=
39;re split as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0far down as I co=
uld, I hope they&#39;re easy to review.<br>
&gt; Patches 19-20 add a few finishing touches, they are small patches.<br>
&gt; <br>
&gt; Future Work<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; These items are in progress:<br>
&gt; <br>
&gt; - A Synchronous QMP wrapper that allows this library to be easily used=
<br>
&gt;=C2=A0 =C2=A0from non-async code; this will also allow me to prove it w=
orks well by<br>
&gt;=C2=A0 =C2=A0demoing its replacement throughout iotests.<br>
&gt; <br>
&gt; - A QMP server class; to facilitate writing of unit tests.<br>
&gt; <br>
&gt; - Unit tests. Real unit tests.<br>
&gt; <br>
&gt; If you made it this far in the cover letter, congrats :)<br>
&gt; <br>
&gt; John Snow (20):<br>
&gt;=C2=A0 =C2=A0python/pylint: Add exception for TypeVar names (&#39;T&#39=
;)<br>
&gt;=C2=A0 =C2=A0python/pylint: disable too-many-function-args<br>
&gt;=C2=A0 =C2=A0python/aqmp: add asynchronous QMP (AQMP) subpackage<br>
&gt;=C2=A0 =C2=A0python/aqmp: add error classes<br>
&gt;=C2=A0 =C2=A0python/aqmp: add asyncio compatibility wrappers<br>
&gt;=C2=A0 =C2=A0python/aqmp: add generic async message-based protocol supp=
ort<br>
&gt;=C2=A0 =C2=A0python/aqmp: add runstate state machine to AsyncProtocol<b=
r>
&gt;=C2=A0 =C2=A0python/aqmp: add logging to AsyncProtocol<br>
&gt;=C2=A0 =C2=A0python/aqmp: add AsyncProtocol.accept() method<br>
&gt;=C2=A0 =C2=A0python/aqmp: add _cb_inbound and _cb_inbound logging hooks=
<br>
&gt;=C2=A0 =C2=A0python/aqmp: add AsyncProtocol._readline() method<br>
&gt;=C2=A0 =C2=A0python/aqmp: add QMP Message format<br>
&gt;=C2=A0 =C2=A0python/aqmp: add well-known QMP object models<br>
&gt;=C2=A0 =C2=A0python/aqmp: add QMP event support<br>
&gt;=C2=A0 =C2=A0python/aqmp: add QMP protocol support<br>
&gt;=C2=A0 =C2=A0python/aqmp: Add message routing to QMP protocol<br>
&gt;=C2=A0 =C2=A0python/aqmp: add execute() interfaces<br>
&gt;=C2=A0 =C2=A0python/aqmp: add _raw() execution interface<br>
&gt;=C2=A0 =C2=A0python/aqmp: add asyncio_run compatibility wrapper<br>
&gt;=C2=A0 =C2=A0python/aqmp: add scary message<br>
&gt; <br>
&gt;=C2=A0 python/qemu/aqmp/__init__.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 61 +++<b=
r>
&gt;=C2=A0 python/qemu/aqmp/error.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 97 =
++++<br>
&gt;=C2=A0 python/qemu/aqmp/events.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 878 +++++=
++++++++++++++++++++++++++<br>
&gt;=C2=A0 python/qemu/aqmp/message.py=C2=A0 =C2=A0 =C2=A0 | 207 ++++++++<b=
r>
&gt;=C2=A0 python/qemu/aqmp/models.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 133 +++++=
<br>
&gt;=C2=A0 python/qemu/aqmp/protocol.py=C2=A0 =C2=A0 =C2=A0| 851 ++++++++++=
++++++++++++++++++++<br>
&gt;=C2=A0 python/qemu/aqmp/py.typed=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A00<br>
&gt;=C2=A0 python/qemu/aqmp/qmp_protocol.py | 565 ++++++++++++++++++++<br>
&gt;=C2=A0 python/qemu/aqmp/util.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 183 =
+++++++<br>
&gt;=C2=A0 python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 10 files changed, 2978 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/__init__.py<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/error.py<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/events.py<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/message.py<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/models.py<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/protocol.py<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/py.typed<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/qmp_protocol.py<br>
&gt;=C2=A0 create mode 100644 python/qemu/aqmp/util.py<br>
<br>
Acked-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" target=
=3D"_blank">stefanha@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
>Brave of you, thanks :)<br></div><div><br></div><div>I am working on a V2 =
presently, with a bunch of avocado unit tests, which has revealed a few sma=
ll bugs and inconsistencies. This version also adds a mock QMPServer class =
alongside the client, for the purposes of testing. I think once those piece=
s are done I will be quite happy to check it into the tree as an &quot;alph=
a&quot; version, though I&#39;d still be very happy to get more feedback on=
 the EventListener piece from anyone willing to browse the &quot;parts I do=
n&#39;t like about this&quot; section of the docs:</div><div><br></div><div=
><a href=3D"https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.events.h=
tml#experimental-interfaces-design-issues">https://people.redhat.com/~jsnow=
/sphinx/html/qemu.aqmp.events.html#experimental-interfaces-design-issues</a=
></div></div></div>

--000000000000810fc005c69c92e1--


