Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E98D4A7936
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 21:09:13 +0100 (CET)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLwF-0004CT-NP
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 15:09:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFL1h-00006h-52
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:11:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFL1H-0004nl-QQ
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643828954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3CPKdR/Aj1+kTdr5R9beItXqUHcXadClqp34cT2oa5Y=;
 b=ZsdlIfOO6JbuNnhrZNewsq/hcNblpuaFYaKrI+/d3APWORHJzAs5/S7H8yfyeZ/udVhhWP
 zQs9DghMrGt0/pRwiJrYQGpNenPupFaiN4Jc1BIKgHBghl9esr9+2PPwkZ2l4Dx8WQ7Au0
 xFbAZD2gg1tnp7CCYvS9g8X3HyVOayE=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-qPXa6HUNNn-GzhKh1CXmfw-1; Wed, 02 Feb 2022 14:09:11 -0500
X-MC-Unique: qPXa6HUNNn-GzhKh1CXmfw-1
Received: by mail-ua1-f69.google.com with SMTP id
 a33-20020ab04964000000b00338cdb3a41cso240978uad.18
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 11:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3CPKdR/Aj1+kTdr5R9beItXqUHcXadClqp34cT2oa5Y=;
 b=GCKuvl1gzqJE2tkM3XRO8P21GZcYA3cKHiErifV9GnVYXkd1Pj56MimewG1VxipMFE
 98O+lSukUXDN7IHWsddTXGaqqgAPeBMVHWHf1/omxheltXA7lVQoRTMB3mEMIMGwu4Kx
 EfL0JclpIEQ142RzUUAwGVveNSfajKiHn1CiM9n9odnGguzNPUuAwtBhkh4gVf9HSXJG
 69Pn6DbRL13NMHUyIaye8tkdIxbMzBvtpcm458NaQkdbF498D1Qb9fy5pHyxV0Yt94QO
 XychIRFJlK+bw3znxOEr8HkkToMzl/ASmUQ2mCqqx0dvGo8vM3vjF4Hns6WRgnh621Pm
 8Mlw==
X-Gm-Message-State: AOAM530aZ9bNUD6jSg51l1xK9h496yk/GBM66qRF7h6LsVmcJi/SGtuj
 yDrIxRvqYgqD7buPupIiTyN4U5Zufc41t5740uGBtY1KL1+tQV92or1cMk4J+12Tc5Cpqx5t98z
 hGwZt2l4ZOVwjWwQ+p9zLigE77PyCAoE=
X-Received: by 2002:a67:d194:: with SMTP id w20mr12250372vsi.35.1643828950950; 
 Wed, 02 Feb 2022 11:09:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOxPM56yhnm2MX0CPtMP4Y7mR2acNE8TKu2zFQwfWMyHjtJjoBl9obVeFo4fczjppu612FbMhMRMl+QukN1F8=
X-Received: by 2002:a67:d194:: with SMTP id w20mr12250353vsi.35.1643828950607; 
 Wed, 02 Feb 2022 11:09:10 -0800 (PST)
MIME-Version: 1.0
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <20220201041134.1237016-5-jsnow@redhat.com>
 <YfkzwdbIaGF5TcVZ@redhat.com>
 <CAFn=p-YKS8UXm3+LPsbjKh-_EkQ--efTW60KfQDa8ZAOVMmHjQ@mail.gmail.com>
 <YfmN+w7zh4qx27q/@redhat.com>
In-Reply-To: <YfmN+w7zh4qx27q/@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 2 Feb 2022 14:08:59 -0500
Message-ID: <CAFn=p-bTFrJSF+TtkzyjQhBcTKe3AeWoJJT=O+mS-LiKZVHDnQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] python/aqmp: add socket bind step to legacy.py
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 2:46 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 01.02.2022 um 19:32 hat John Snow geschrieben:
> > On Tue, Feb 1, 2022 at 8:21 AM Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > Am 01.02.2022 um 05:11 hat John Snow geschrieben:
> > > > The synchronous QMP library would bind to the server address during
> > > > __init__(). The new library delays this to the accept() call, because
> > > > binding occurs inside of the call to start_[unix_]server(), which is an
> > > > async method -- so it cannot happen during __init__ anymore.
> > > >
> > > > Python 3.7+ adds the ability to create the server (and thus the bind()
> > > > call) and begin the active listening in separate steps, but we don't
> > > > have that functionality in 3.6, our current minimum.
> > > >
> > > > Therefore ... Add a temporary workaround that allows the synchronous
> > > > version of the client to bind the socket in advance, guaranteeing that
> > > > there will be a UNIX socket in the filesystem ready for the QEMU client
> > > > to connect to without a race condition.
> > > >
> > > > (Yes, it's a bit ugly. Fixing it more nicely will have to wait until our
> > > > minimum Python version is 3.7+.)
> > > >
> > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > ---
> > > >  python/qemu/aqmp/legacy.py   |  3 +++
> > > >  python/qemu/aqmp/protocol.py | 41 +++++++++++++++++++++++++++++++++---
> > > >  2 files changed, 41 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> > > > index 0890f95b16..6baa5f3409 100644
> > > > --- a/python/qemu/aqmp/legacy.py
> > > > +++ b/python/qemu/aqmp/legacy.py
> > > > @@ -56,6 +56,9 @@ def __init__(self, address: SocketAddrT,
> > > >          self._address = address
> > > >          self._timeout: Optional[float] = None
> > > >
> > > > +        if server:
> > > > +            self._aqmp._bind_hack(address)  # pylint: disable=protected-access
> > >
> > > I feel that this is the only part that really makes it ugly. Do you
> > > really think this way is so bad that we can't make it an official public
> > > interface in the library?
> > >
> > > Kevin
> > >
> >
> > Good question.
> >
> > I felt like I'd rather use the 'start_serving' parameter of
> > loop.create_server(...), added in python 3.7; see
> > https://docs.python.org/3/library/asyncio-eventloop.html#asyncio.loop.create_server
> > Python 3.6 is already EOL, but we still depend on it for our build and
> > I wasn't prepared to write the series that forces us on to 3.7,
> > because RHEL uses 3.6 as its native python. I'll have to update the
> > docker files, etc -- and I'm sure people will be kind of unhappy with
> > this, so I am putting it off. People were unhappy enough with the move
> > to Python 3.6.
>
> Yes, I understand. In theory - I haven't really thought much about it -
> it feels like whether you create a separate socket in a first step and
> pass it to the server that is created in the second step (for 3.6) or
> you start an idle server in the first step and then let it start serving
> in the second step (for 3.7+) should be an implementation detail if we
> get the external API right.
>
> > I also felt as though the async version has no real need for a
> > separate bind step -- you can just start the server in a coroutine and
> > wait until it yields, then proceed to launch QEMU. It's easy in that
> > paradigm. If this bind step is only for the benefit of the legacy.py
> > interface, I thought maybe it wasn't wise to commit to supporting it
> > if it was something I wanted to get rid of soon anyway. There's also
> > the ugliness that if you use the early bind step, the arguments passed
> > to accept() are now ignored, which is kind of ugly, too. It's not a
> > *great* interface. It doesn't spark joy.
>
> Right, that's probably a sign that the interfaces aren't completely
> right. I'm not sure which interfaces. As long as it's just _bind_hack()
> and it's only used in an API that is going away in the future, that's no
> problem. But it could also be a sign that the public interfaces aren't
> flexible enough.
>

Yeah, I agree. It's not flexible enough. I think the sync.py
development will force me to understand where I have come to rest on
the conveniences of asyncio and force the design to be more flexible
overall.

> > I have some patches that are building a "sync.py" module that's meant
> > to replace "legacy.py", and it's in the development of that module
> > that I expect to either remove the bits I am unhappy with, or commit
> > to supporting necessary infrastructure that's just simply required for
> > a functional synchronous interface to work. I planned to start
> > versioning the "qemu.qmp" package at 0.0.1, and the version that drops
> > legacy.py I intend to version at 0.1.0.
>
> If I understand these version numbers correctly, this also implies that
> there is no compatibility promise yet. So maybe what to make a public
> interface isn't even a big concern yet.

Right. (Still, I didn't want to upload anything to PyPI I just
outwardly had no intention of supporting at all. It felt polite, even
in "alpha".)

>
> I guess the relevant question in the context of this patch is whether
> sync.py will need a similar two-phase setup as legacy.py. Do you think
> you can do without it when you have to reintroduce this behaviour here
> to fix bugs?
>

Hm, honestly, no. I think you'll still need the two-phase in the sync
version no matter what -- if you expect to be able to launch QMP and
QEMU from the same process, anyway. I suppose it's just a matter of
what you *call* it and what/where the arguments are.

I could just call it bind(), and it does whatever it needs to (Either
creating a socket or, in 3.7+, instantiating more of the asyncio loop
machinery).
The signature for accept() would need to change to (perhaps)
optionally accepting no arguments; i.e. you can do either of the
following:

(1) qmp.bind('/tmp/sock')
    qmp.accept()

(2) qmp.accept('/tmp/sock')

The risk is that the interface is just a touch more complex, the docs
get a bit more cluttered, there's a slight loss of clarity, the
accept() method would need to check to make sure you didn't give it an
address argument if you've already given it one, etc. Necessary
trade-off for the flexibility, though.

I've got some ideas, thanks.

> > All that said, I'm fairly wishy-washy on it, so if you have some
> > strong feelings, lemme know. There may be some real utility in just
> > doubling down on always creating our own socket object. I just haven't
> > thought through everything here, admittedly.
>
> No, I don't have strong feelings about this. I don't even really know
> the code. I just saw that you were unhappy with the solution and thought
> I could try to be the rubber duck that makes you figure out something
> that you're happy with. ;-)

I appreciate it! There's some improvements I can make, but I think
there's still time to polish it yet, and for right now I'll just push
ahead with the hack to get Peter's tests green.

>
> Kevin
>


