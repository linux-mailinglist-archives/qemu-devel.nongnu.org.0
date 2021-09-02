Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65003FEAD8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 10:53:17 +0200 (CEST)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLiTE-0000Lr-SV
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 04:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLiSA-0007z4-Ls
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:52:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLiS8-0000mN-42
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630572727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0J5u/QKKBww+5039buzbi0Cvy5uw5Y2n4lAUj/+qGE=;
 b=JtZtKRz5glcJwSO/EMT0qOPXpWnxrYiFCrKxllk7iSgW73Q8bCq+3Vzj2g4wmI/Pl+G3kZ
 futTqyFbKIS0UbxjpR0AU9AqvHU5h/Kw2KFloQgMGdyp+PYYzm2hhiLlQa0kkoPus8CTko
 s6kQqbujHDRCtc7LXPpbn/wrVUlQBkQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-WbFCvWQ5P9OKavnNTjW4FQ-1; Thu, 02 Sep 2021 04:52:06 -0400
X-MC-Unique: WbFCvWQ5P9OKavnNTjW4FQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 w28-20020a2e161c000000b001ba14fc0cd4so374472ljd.10
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 01:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q0J5u/QKKBww+5039buzbi0Cvy5uw5Y2n4lAUj/+qGE=;
 b=t+xC4jPr2L5+38HcSq4y1zx6SH8aERWkQjLhWXToHM+4YbWBMQVHsjc5M8tpvWfuxe
 /akTLQtQ+V8K5io5BRXSBSMpaNptLWi77+hDws4eOY9sy59LUR/rFzStjE15+JAeaeO5
 aRazxAmAB3zUlq6A60/j1eAis5u2XFZfhJXKKWjuxKXR1shxPEhEV9Lp3MAIeRZCTQjD
 UVbB5DI3URffJox14gkupre70V+uU4KbsqngxB9jru0GW+pkoNrooXxsgPmv+JZAsCLS
 e8v3CsU/s/lCompXLJ3RrX2CrcLONgijM7kqbnNXwMw90bJvDMadeiSb6iL4CRrQJSl1
 DUqQ==
X-Gm-Message-State: AOAM530ichHcGnj50E+ZOAQOh/9MUVnkk6lUFkVHW+YFlbjg/wySaUMl
 7G1Vlce1HvHvubF7hH4Dpfd1L2gfMh1gAn8ScPNl81Ju3Bt7DzZbHUp1+2rsx8Mr9O7OlmgMSU6
 AeTclZxjZL5OYiX4KiZ8TxFVIonKoNRc=
X-Received: by 2002:a05:6512:16a0:: with SMTP id
 bu32mr1821249lfb.322.1630572724828; 
 Thu, 02 Sep 2021 01:52:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+GG56rQlthIZAkvU5ebE3ZX5o38m+r3OuP3nVzo/cY5dUHISt7UKoTw3EUWzLb/QxeIuRdrgcxpQeHDLl9Vo=
X-Received: by 2002:a05:6512:16a0:: with SMTP id
 bu32mr1821218lfb.322.1630572724434; 
 Thu, 02 Sep 2021 01:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTCJRSue5NQ8qzPn@redhat.com>
In-Reply-To: <YTCJRSue5NQ8qzPn@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 05:52:15 -0300
Message-ID: <CAJ6HWG45Xb2uc3OdJctL7SFxmrH0ZhDwQMBDAmS1TuDgiCrCMA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 5:21 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Passos wro=
te:
> > Hello Daniel, thanks for the feedback !
> >
> > On Tue, Aug 31, 2021 at 10:17 AM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
> > >
> > > On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> > > > Call qio_channel_set_zerocopy(true) in the start of every multifd t=
hread.
> > > >
> > > > Change the send_write() interface of multifd, allowing it to pass d=
own
> > > > flags for qio_channel_write*().
> > > >
> > > > Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping=
 the
> > > > other data being sent at the default copying approach.
> > > >
> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > ---
> > > >  migration/multifd-zlib.c | 7 ++++---
> > > >  migration/multifd-zstd.c | 7 ++++---
> > > >  migration/multifd.c      | 9 ++++++---
> > > >  migration/multifd.h      | 3 ++-
> > > >  4 files changed, 16 insertions(+), 10 deletions(-)
> > >
> > > > @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
> > > >              }
> > > >
> > > >              if (used) {
> > > > -                ret =3D multifd_send_state->ops->send_write(p, use=
d, &local_err);
> > > > +                ret =3D multifd_send_state->ops->send_write(p, use=
d, MSG_ZEROCOPY,
> > > > +                                                          &local_e=
rr);
> > >
> > > I don't think it is valid to unconditionally enable this feature due =
to the
> > > resource usage implications
> > >
> > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > >
> > >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens
> > >    if the socket option was not set, the socket exceeds its optmem
> > >    limit or the user exceeds its ulimit on locked pages."
> >
> > You are correct, I unfortunately missed this part in the docs :(
> >
> > > The limit on locked pages is something that looks very likely to be
> > > exceeded unless you happen to be running a QEMU config that already
> > > implies locked memory (eg PCI assignment)
> >
> > Do you mean the limit an user has on locking memory?
>
> Yes, by default limit QEMU sees will be something very small.
>
> > If so, that makes sense. I remember I needed to set the upper limit of =
locked
> > memory for the user before using it, or adding a capability to qemu bef=
ore.
> >
> > Maybe an option would be trying to mlock all guest memory before settin=
g
> > zerocopy=3Don in qemu code. If it fails, we can print an error message =
and fall
> > back to not using zerocopy (following the idea of a new io_async_writev=
()
> > I told you in the previous mail).
>
> Currently ability to lock memory is something that has to be configured
> when QEMU starts, and it requires libvirt to grant suitable permissions
> to QEMU. Memory locking is generally undesirable because it prevents
> memory overcommit. Or rather if you are allowing memory overcommit, then
> allowing memory locking is a way to kill your entire host.

You mean it's gonna consume too much memory, or something else?

>
> I don't think we can unconditionally grant ability to lock arbitrary
> guest RAM at startup, just to satisfy a possible desire to use zerocopy
> migration later. Granting it at runtime feels questionable as you now
> need to track and predict how much locked memory you've allowed, and
> also have possible problems with revokation.

(I am really new to this, so please forgive me if I am asking dumb or
overly basic questions)

What does revokation means in this context?
You give the process hability to lock n MB of memory, and then you take it?
Why would that happen? Is Locked memory a limited resource?

>
> Possibly you could unconditionally grant ability to lock a small amount
> of guest RAM at startup, but how small can it be, while still making a
> useful difference to migration. It would imply we also need to be very
> careful with migration to avoid having too large an amount of outstanding
> zerocopy requests to exceed the limit.

Yeah, having to decide on a value that would be ok to lock is very
complex, given we can migrate with multifd, which can make this value grow
a lot. Except if we only allow a few of those fds to really use zerocopy.

>
> IOW, the only clear place in which we can use zerocopy, is where we are
> already forced to accept the penalty of locked memory at startup. eg when
> the guest is using huge pages and no overcommit, or possibly when the gue=
st
> is using PCI device assignment,

It would be something already, given that those scenarios are the ones with
the largest number of pages to migrate. But I understand we could give it a=
 try
on other scenarios.

> though in the latter I can't remember if
> we allow entire of guest RAM to be locked or not.

If I recall correctly on a previous discussion, this was the case at least =
for
PCI passthrough.

>
> Overall the memory locking needs look like a significant constraint that
> will affect ability to use this feature.
>

I Agree, there is a lot to take in account.
In any way, those constraints could be checked at the same function as
the setsockopt() right?
(Setting up configs to improve the chance of zerocopy would probably only
happen at/before qemu starting, right?)

Best regards,
Leonardo


