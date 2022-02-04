Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C05E4A91A0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 01:28:24 +0100 (CET)
Received: from localhost ([::1]:50684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFmSd-0003V3-PA
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 19:28:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFmQ3-00013e-2E
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 19:25:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFmPz-000238-GB
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 19:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643934338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMtXCBQyrGJNIUeqvU5ckMKvJF2KrMCLShRgWyhtyUM=;
 b=BoVWq+TlZu/prAmg1jq7XisGHuwMbwSOKnXbyX8W8sy1Uk4HY+JVt8/8V6TnxnY8/eg1c6
 NjVO6Pb2p4m5KB4ej4wyq42R4IApk7INCxd2AQa4nVWqNNiHjwrvTHCOUHI1JTf8qebCi8
 bZ0/CFeEyCAcvq4FzdQM39Cq7dMZgXc=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-xQIKl9lDMaOmpD8R9iAg2A-1; Thu, 03 Feb 2022 19:25:35 -0500
X-MC-Unique: xQIKl9lDMaOmpD8R9iAg2A-1
Received: by mail-ua1-f69.google.com with SMTP id
 y7-20020ab05607000000b003065444c62dso2563452uaa.13
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 16:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TMtXCBQyrGJNIUeqvU5ckMKvJF2KrMCLShRgWyhtyUM=;
 b=Zap7qoPuwWQhpSrlHG2HK/2QZA8n28jBIXasedi2h+mLo8ClVDSV0bs2Q8xm9SzTDk
 ZS+Do6joTfaFW5VDLj0Xfu/qNkL/KCJKFQfEtupoktI1wzP6qAvdryYDKEn3psVAfpje
 8Rqy1Z8/29/lJ/EZqemEkjNenI1/OOOmf+jH4iPnA0ng8pj94vWHW5U3T9ZiZR4R6Gkr
 dc/Z2XgHoDnscbQvpSYcQhPt7Dxbpz65Sf5yIDIUPyD5FncLPuuOZUe1VBWYwvaabrRB
 XEdnEFNUxWo+CuSV+5xMaLHdSasqHNP46LohPQ8kKrNLd+uXZL7rDXTe8H1LpHA/AkVK
 HNRQ==
X-Gm-Message-State: AOAM533t+jQIBW420vPdcKQ3vykOY0W6Vnqehsq71xTZNNu0+u96A+/U
 +Eov+b7zzoHS3COW7qbdVyLJ2PqfYT7yoeyA5mpUPzDC9Lb1O0V42/PvACWU1EFCnOMY5HM8H+3
 3G2mEy1ZVY57HKD435QUHx6pyNTpqaZM=
X-Received: by 2002:a67:e901:: with SMTP id c1mr226229vso.38.1643934335050;
 Thu, 03 Feb 2022 16:25:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1Kn3PbZadwTVzb8/0lUB2YoNr67wv+rUu6NsuJMWoZHEgRBAAbE2n8OqFL4immF9uObBX1meTPiU/AcavbqA=
X-Received: by 2002:a67:e901:: with SMTP id c1mr226215vso.38.1643934334697;
 Thu, 03 Feb 2022 16:25:34 -0800 (PST)
MIME-Version: 1.0
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <20220201041134.1237016-5-jsnow@redhat.com>
 <YfkzwdbIaGF5TcVZ@redhat.com>
 <CAFn=p-YKS8UXm3+LPsbjKh-_EkQ--efTW60KfQDa8ZAOVMmHjQ@mail.gmail.com>
 <YfmN+w7zh4qx27q/@redhat.com>
 <CAFn=p-bTFrJSF+TtkzyjQhBcTKe3AeWoJJT=O+mS-LiKZVHDnQ@mail.gmail.com>
 <Yfuil8CJf6cgzMEv@redhat.com>
In-Reply-To: <Yfuil8CJf6cgzMEv@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 3 Feb 2022 19:25:23 -0500
Message-ID: <CAFn=p-bXdopOEerEVrugRPr=sEZZZMniLUVeAWc86Zv3YfOBLQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] python/aqmp: add socket bind step to legacy.py
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 3, 2022 at 4:38 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Wed, Feb 02, 2022 at 02:08:59PM -0500, John Snow wrote:
> > On Tue, Feb 1, 2022 at 2:46 PM Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > Am 01.02.2022 um 19:32 hat John Snow geschrieben:
> > > > On Tue, Feb 1, 2022 at 8:21 AM Kevin Wolf <kwolf@redhat.com> wrote:
> > > > >
> > > > > Am 01.02.2022 um 05:11 hat John Snow geschrieben:
> > > > > > The synchronous QMP library would bind to the server address du=
ring
> > > > > > __init__(). The new library delays this to the accept() call, b=
ecause
> > > > > > binding occurs inside of the call to start_[unix_]server(), whi=
ch is an
> > > > > > async method -- so it cannot happen during __init__ anymore.
> > > > > >
> > > > > > Python 3.7+ adds the ability to create the server (and thus the=
 bind()
> > > > > > call) and begin the active listening in separate steps, but we =
don't
> > > > > > have that functionality in 3.6, our current minimum.
> > > > > >
> > > > > > Therefore ... Add a temporary workaround that allows the synchr=
onous
> > > > > > version of the client to bind the socket in advance, guaranteei=
ng that
> > > > > > there will be a UNIX socket in the filesystem ready for the QEM=
U client
> > > > > > to connect to without a race condition.
> > > > > >
> > > > > > (Yes, it's a bit ugly. Fixing it more nicely will have to wait =
until our
> > > > > > minimum Python version is 3.7+.)
> > > I guess the relevant question in the context of this patch is whether
> > > sync.py will need a similar two-phase setup as legacy.py. Do you thin=
k
> > > you can do without it when you have to reintroduce this behaviour her=
e
> > > to fix bugs?
> > >
> >
> > Hm, honestly, no. I think you'll still need the two-phase in the sync
> > version no matter what -- if you expect to be able to launch QMP and
> > QEMU from the same process, anyway. I suppose it's just a matter of
> > what you *call* it and what/where the arguments are.
> >
> > I could just call it bind(), and it does whatever it needs to (Either
> > creating a socket or, in 3.7+, instantiating more of the asyncio loop
> > machinery).
> > The signature for accept() would need to change to (perhaps)
> > optionally accepting no arguments; i.e. you can do either of the
> > following:
> >
> > (1) qmp.bind('/tmp/sock')
> >     qmp.accept()
> >
> > (2) qmp.accept('/tmp/sock')
> >
> > The risk is that the interface is just a touch more complex, the docs
> > get a bit more cluttered, there's a slight loss of clarity, the
> > accept() method would need to check to make sure you didn't give it an
> > address argument if you've already given it one, etc. Necessary
> > trade-off for the flexibility, though.
>
> Doing a bind() inside an accept() call is really strange
> design IMHO.
>

Yeah, it was possibly a mistake to use the same names as the very
famous and widely known POSIX calls. I didn't intend for them to be
precisely 1:1.

What I intended was that each QMPClient() object could either receive
an incoming connection or dial out and make one. I happened to name
these accept() and connect(). Under the hood, we do "whatever we have
to" in order to make those methods work. This was the simplest
possible interface I could imagine; and it also mimics the (sync) qmp
code in python/qemu/qmp. That code doesn't have distinct
bind-listen-accept steps; it performs bind and listen immediately
during __init__, then socket.accept() is called during the accept()
method call.

However, In python asyncio, we're encouraged to use the
asyncio.start_server() and asyncio.start_unix_server() functions
instead. These are async calls, and they cannot occur during
__init__(), because __init__() isn't an async coroutine. This compels
us to move the bind step out of init and into an async method. In the
interest of keeping the new interface looking very similar to the old
one, I pushed the entirety of the bind-listen-accept sequence into the
async accept(...) method.

A little weird, but that's why it happened that way. (The concept of a
QMP client being the socket server is also a little weird and defies
the traditional expectation, too, IMO. Oh well, we're here now.)

For comparison, the sync interface:

qmp =3D QEMUMonitorProtocol('qemu.sock', server=3DTrue)  # bind(), listen()
qmp.accept()  # accept()

And the async interface:

qmp =3D QMPClient()
await qmp.accept('qemu.sock')  # bind, listen, and accept

That said, I could probably make this interface a lot more traditional
for actual /servers/. I have patches to add a QMPServer() class, but
it adopted the "exactly one peer" limitation that QMPClient() has. If
you think there is some value in developing the idea further, I could
refactor the code to be a *lot* more traditional and have a listening
server that acts as a factory for generating connected client
instances. It just isn't something that I think I'll have merge ready
in less than a week.

> bind() is a one-time-only initialization operation for startup,
> where as accept() is a runtime operation invoked repeatedly.
>
> bind() is also an op that is reasonably likely to fail
> due to something already holding the socket address, and thus
> an error condition that you want to report to an application
> during its early startup phase.

Yeah, oops. I was focused on keeping the number of public calls low,
but that didn't help me out here.

Lemme see what I can do.

--js


