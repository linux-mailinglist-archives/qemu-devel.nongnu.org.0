Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2874A685A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:06:13 +0100 (CET)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2Dz-0004ms-FH
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:06:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nExxQ-0004fr-Sl
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:32:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nExxE-0002Hn-Hl
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643740355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rqme4kKHJ2/wK3dAQ/2+DAAfn9IVDY6ktn5lRIhJG+Y=;
 b=RgaFIH1uweX5TxW6IYWCDY2O6KfZEYbLCr8A2fgRyUo1AaKinC9lJzM2yvzhMnthEfVrAQ
 jnbjvUBso2M2X4Xfnq+ak/JYGEZ3i7I2fvaqxYLMicJwuWWvwbUGtbKQ/RL6jI5SvA3HOO
 xNn53/RzyTAXbte3INlPQva0240Wx60=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-cHh81DZ5O-C7I-Xc7Xty2Q-1; Tue, 01 Feb 2022 13:32:31 -0500
X-MC-Unique: cHh81DZ5O-C7I-Xc7Xty2Q-1
Received: by mail-vk1-f200.google.com with SMTP id
 b65-20020a1f1b44000000b0031e531f939fso2909245vkb.15
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rqme4kKHJ2/wK3dAQ/2+DAAfn9IVDY6ktn5lRIhJG+Y=;
 b=L8NbLIYeI7BfIKocRUSKXAmFScMcjO+ocpdeN9krcvQ0AlOtevVTBpzsaeMKeXvv3q
 qfgzDbgR5YEct9clK64zwL4kt/lN7dpnCdcjY0R11+Y8U0sIM+8ao0d8teV5qGQllY2Z
 ucWAiCBczcXwFOjiCRkgduPP+ZfhzcK+NUYcJ31MROvIttIOkSC1r86DqfUyNYogFLOY
 6hP9VeQcOzp6thlkB8XiwmBqcrrwp+BNxVnxvDrkZ2kNCXwWSBvwaCVdNkWxOk9lFeC1
 gTzMzwfT0sIKJNdqSq/kFOrt2YqeyQwkHFilrUU1Mpj7udvL5mx15Mds1hpqO4cpesVK
 UkWA==
X-Gm-Message-State: AOAM530pUMmc+hL3P8mlu6CLv9afXi1uaBqYW6KRf7mWI3UL+cvpncwd
 XR1QadzUgthESwAGsEexFIsm6VhMHXPlYgLOCHM2MKneDLYbLguDNwyEZCt2DFsfiSBwQc21f9O
 95B2HxWK8urjc9p5xs57aaZWeQd0MOxk=
X-Received: by 2002:ab0:986:: with SMTP id x6mr10757999uag.50.1643740350573;
 Tue, 01 Feb 2022 10:32:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRJDgW5uGFG9eYj+kkO9Xd5xmfThpHLTAVxuY7Q9W5uW3y4Ym+SiticfSzYnXXkPAUSxJ5cCIfid5SuyHHucI=
X-Received: by 2002:ab0:986:: with SMTP id x6mr10757986uag.50.1643740350280;
 Tue, 01 Feb 2022 10:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <20220201041134.1237016-5-jsnow@redhat.com>
 <YfkzwdbIaGF5TcVZ@redhat.com>
In-Reply-To: <YfkzwdbIaGF5TcVZ@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 1 Feb 2022 13:32:19 -0500
Message-ID: <CAFn=p-YKS8UXm3+LPsbjKh-_EkQ--efTW60KfQDa8ZAOVMmHjQ@mail.gmail.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 8:21 AM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 01.02.2022 um 05:11 hat John Snow geschrieben:
> > The synchronous QMP library would bind to the server address during
> > __init__(). The new library delays this to the accept() call, because
> > binding occurs inside of the call to start_[unix_]server(), which is an
> > async method -- so it cannot happen during __init__ anymore.
> >
> > Python 3.7+ adds the ability to create the server (and thus the bind()
> > call) and begin the active listening in separate steps, but we don't
> > have that functionality in 3.6, our current minimum.
> >
> > Therefore ... Add a temporary workaround that allows the synchronous
> > version of the client to bind the socket in advance, guaranteeing that
> > there will be a UNIX socket in the filesystem ready for the QEMU client
> > to connect to without a race condition.
> >
> > (Yes, it's a bit ugly. Fixing it more nicely will have to wait until our
> > minimum Python version is 3.7+.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/aqmp/legacy.py   |  3 +++
> >  python/qemu/aqmp/protocol.py | 41 +++++++++++++++++++++++++++++++++---
> >  2 files changed, 41 insertions(+), 3 deletions(-)
> >
> > diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> > index 0890f95b16..6baa5f3409 100644
> > --- a/python/qemu/aqmp/legacy.py
> > +++ b/python/qemu/aqmp/legacy.py
> > @@ -56,6 +56,9 @@ def __init__(self, address: SocketAddrT,
> >          self._address = address
> >          self._timeout: Optional[float] = None
> >
> > +        if server:
> > +            self._aqmp._bind_hack(address)  # pylint: disable=protected-access
>
> I feel that this is the only part that really makes it ugly. Do you
> really think this way is so bad that we can't make it an official public
> interface in the library?
>
> Kevin
>

Good question.

I felt like I'd rather use the 'start_serving' parameter of
loop.create_server(...), added in python 3.7; see
https://docs.python.org/3/library/asyncio-eventloop.html#asyncio.loop.create_server
Python 3.6 is already EOL, but we still depend on it for our build and
I wasn't prepared to write the series that forces us on to 3.7,
because RHEL uses 3.6 as its native python. I'll have to update the
docker files, etc -- and I'm sure people will be kind of unhappy with
this, so I am putting it off. People were unhappy enough with the move
to Python 3.6.

I also felt as though the async version has no real need for a
separate bind step -- you can just start the server in a coroutine and
wait until it yields, then proceed to launch QEMU. It's easy in that
paradigm. If this bind step is only for the benefit of the legacy.py
interface, I thought maybe it wasn't wise to commit to supporting it
if it was something I wanted to get rid of soon anyway. There's also
the ugliness that if you use the early bind step, the arguments passed
to accept() are now ignored, which is kind of ugly, too. It's not a
*great* interface. It doesn't spark joy.

I have some patches that are building a "sync.py" module that's meant
to replace "legacy.py", and it's in the development of that module
that I expect to either remove the bits I am unhappy with, or commit
to supporting necessary infrastructure that's just simply required for
a functional synchronous interface to work. I planned to start
versioning the "qemu.qmp" package at 0.0.1, and the version that drops
legacy.py I intend to version at 0.1.0.

All that said, I'm fairly wishy-washy on it, so if you have some
strong feelings, lemme know. There may be some real utility in just
doubling down on always creating our own socket object. I just haven't
thought through everything here, admittedly.

--js


