Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526BB3FEB9B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:54:49 +0200 (CEST)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjQm-00004z-DK
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLjLL-0001wT-VA
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLjLJ-0006mQ-Rr
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630576147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYKR0QCT+xyLYJouFIh61OgGuM1goY5Mu5WjCxkoSAQ=;
 b=VfbSasyndQMd345GE7i0NIBxz6F/WZ0DAG9dCWsoOOZ+xAiNYYeMZfSILz37PA6pwnkIc/
 X3YHRMfToKickRWwKPAE1/SngbDeOP/nyarcQhJKsFy18vd0nyP13KI0F9MM0aDGK28L8n
 soalEJviz2N9eNm5uddswripfzGmzW0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251--K9aUMb4PdeSTUZbc17M7A-1; Thu, 02 Sep 2021 05:48:56 -0400
X-MC-Unique: -K9aUMb4PdeSTUZbc17M7A-1
Received: by mail-lj1-f199.google.com with SMTP id
 v2-20020a2e2f02000000b001dc7ee2a7b8so427970ljv.20
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 02:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XYKR0QCT+xyLYJouFIh61OgGuM1goY5Mu5WjCxkoSAQ=;
 b=mMYPCzOt0cyK0a2InETiHQo/ft3KJAKlY0zIXK3SWy8hmTXNiTxyWXmcz6nCQulz0l
 VX7ZnBG60fGrB9+lJeKFU+IskvM/tBumNihxYbxw6J3WqiZj9DXuEl1nGlNKVd4z910T
 RHHxFlozOHxZuDaK0M8NNv5xTS2gNL2s/wBcmCXL2nZllaWrFzS4FypYYSFjW3cgtG4d
 jUogMA7DrD+1+iSdcplG4m0kutkO+u4iVfPG2u+iiMztINN7YB7tITiPZZNPQSBt5B2N
 wRLtdngO4isNobqIxujx8XQHtQaE+0nzOcrDB6pzzXzp+QBNqabURx4aHj5KNiCROl7l
 VZ0Q==
X-Gm-Message-State: AOAM533QwfpfLn6o9JBHE0AuAhaT06SbseJpRK6Zd+3UzF/lwRT8hPoL
 eor8Z4R62Ty7H+dUO9wNALvyrje2vOqtMzw2bnbEJo8IJc/Kz3flghCuSKKvRjmpO33+RRYFEtu
 omiikmTvSTE1L2E3F8wimJcpWop+rPsg=
X-Received: by 2002:ac2:46fb:: with SMTP id q27mr1990514lfo.595.1630576135331; 
 Thu, 02 Sep 2021 02:48:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbbNknCMsR4siHPmQ8C2gi3ADYySthntyMd/FPU2xNC11UJ2GwPjW//+qCJXsai9mZjo7iEW+kK53/lDD5V5c=
X-Received: by 2002:ac2:46fb:: with SMTP id q27mr1990488lfo.595.1630576134968; 
 Thu, 02 Sep 2021 02:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTCJRSue5NQ8qzPn@redhat.com>
 <CAJ6HWG45Xb2uc3OdJctL7SFxmrH0ZhDwQMBDAmS1TuDgiCrCMA@mail.gmail.com>
 <YTCXSoETM7UfeMQE@redhat.com>
In-Reply-To: <YTCXSoETM7UfeMQE@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 06:49:06 -0300
Message-ID: <CAJ6HWG7wLtEDY-X6wxdH9zG14NOdOCQ1YX0YBxTFEnbhJy6ozw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Sep 2, 2021 at 6:20 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Sep 02, 2021 at 05:52:15AM -0300, Leonardo Bras Soares Passos wro=
te:
> > On Thu, Sep 2, 2021 at 5:21 AM Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
> > >
> > > On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Passos=
 wrote:
> > > > Hello Daniel, thanks for the feedback !
> > > >
> > > > On Tue, Aug 31, 2021 at 10:17 AM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
> > > > >
> > > > > On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> > > > > > Call qio_channel_set_zerocopy(true) in the start of every multi=
fd thread.
> > > > > >
> > > > > > Change the send_write() interface of multifd, allowing it to pa=
ss down
> > > > > > flags for qio_channel_write*().
> > > > > >
> > > > > > Pass down MSG_ZEROCOPY flag for sending memory pages, while kee=
ping the
> > > > > > other data being sent at the default copying approach.
> > > > > >
> > > > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > > > ---
> > > > > >  migration/multifd-zlib.c | 7 ++++---
> > > > > >  migration/multifd-zstd.c | 7 ++++---
> > > > > >  migration/multifd.c      | 9 ++++++---
> > > > > >  migration/multifd.h      | 3 ++-
> > > > > >  4 files changed, 16 insertions(+), 10 deletions(-)
> > > > >
> > > > > > @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaq=
ue)
> > > > > >              }
> > > > > >
> > > > > >              if (used) {
> > > > > > -                ret =3D multifd_send_state->ops->send_write(p,=
 used, &local_err);
> > > > > > +                ret =3D multifd_send_state->ops->send_write(p,=
 used, MSG_ZEROCOPY,
> > > > > > +                                                          &loc=
al_err);
> > > > >
> > > > > I don't think it is valid to unconditionally enable this feature =
due to the
> > > > > resource usage implications
> > > > >
> > > > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > > > >
> > > > >   "A zerocopy failure will return -1 with errno ENOBUFS. This hap=
pens
> > > > >    if the socket option was not set, the socket exceeds its optme=
m
> > > > >    limit or the user exceeds its ulimit on locked pages."
> > > >
> > > > You are correct, I unfortunately missed this part in the docs :(
> > > >
> > > > > The limit on locked pages is something that looks very likely to =
be
> > > > > exceeded unless you happen to be running a QEMU config that alrea=
dy
> > > > > implies locked memory (eg PCI assignment)
> > > >
> > > > Do you mean the limit an user has on locking memory?
> > >
> > > Yes, by default limit QEMU sees will be something very small.
> > >
> > > > If so, that makes sense. I remember I needed to set the upper limit=
 of locked
> > > > memory for the user before using it, or adding a capability to qemu=
 before.
> > > >
> > > > Maybe an option would be trying to mlock all guest memory before se=
tting
> > > > zerocopy=3Don in qemu code. If it fails, we can print an error mess=
age and fall
> > > > back to not using zerocopy (following the idea of a new io_async_wr=
itev()
> > > > I told you in the previous mail).
> > >
> > > Currently ability to lock memory is something that has to be configur=
ed
> > > when QEMU starts, and it requires libvirt to grant suitable permissio=
ns
> > > to QEMU. Memory locking is generally undesirable because it prevents
> > > memory overcommit. Or rather if you are allowing memory overcommit, t=
hen
> > > allowing memory locking is a way to kill your entire host.
> >
> > You mean it's gonna consume too much memory, or something else?
>
> Essentially yes.

Well, maybe we can check for available memory before doing that,
but maybe it's too much effort.

>
> > > I don't think we can unconditionally grant ability to lock arbitrary
> > > guest RAM at startup, just to satisfy a possible desire to use zeroco=
py
> > > migration later. Granting it at runtime feels questionable as you now
> > > need to track and predict how much locked memory you've allowed, and
> > > also have possible problems with revokation.
> >
> > (I am really new to this, so please forgive me if I am asking dumb or
> > overly basic questions)
> >
> > What does revokation means in this context?
> > You give the process hability to lock n MB of memory, and then you take=
 it?
> > Why would that happen? Is Locked memory a limited resource?
>
> Consider a VM host with 64 GB of RAM and 64 GB of swap, and an
> overcommit ratio of 1.5. ie we'll run VMs with 64*1.5 GB of RAM
> total.
>
> So we can run 3 VMs each with 32 GB of RAM, giving 96 GB of usage
> which exceeds physical RAM. Most of the time this may well be fine
> as the VMs don't concurrently need their full RAM allocation, and
> worst case they'll get pushed to swap as the kernel re-shares
> memory in respose to load. So perhaps each VM only needs 20 GB
> resident at any time, but over time one VM can burst upto 32 GB
> and then 12 GB of it get swapped out later when inactive.
>
> But now consider if we allowed 2 of the VMs to lock memory for
> purposes of migration. Those 2 VMs can now pin 64 GB of memory
> in the worst case, leaving no free memory for the 3rd VM or
> for the OS. This will likely take down the entire host, regardless
> of swap availability.
>
> IOW, if you are overcomitting RAM you have to be extremely
> careful about allowing any VM to lock memory. If you do decide
> to allow memory locking, you need to make sure that the worst
> case locked memory amount still leaves enough unlocked memory
> for the OS to be able to effectively manage the overcommit
> load via swap.  We definitely can't grant memory locking to
> VMs at startup in this scenario, and if we grant it at runtime,
> we need to be able to revoke it again later.
>
> These overcommit numbers are a bit more extreme that you'd
> usually do in real world, but it illustrates the genreal
> problem. Also bear in mind that QEMU has memory overhead
> beyond the guest RAM block, which varies over time, making
> accounting quite hard. We have to also assume that QEMU
> could have been compromised by a guest breakout, so we
> can't assume that migration will play nice - we have to
> assume the worst case possible, given the process ulimits.
>

Yeah, that makes sense. Thanks for this illustration and elucidation !

I assume there is no way of asking the OS to lock memory, and if there is
no space available, it fails and rolls back the locking.

If there was, the VM2 would fail the locking and we could achieve
MSG_ZEROCOPY at least in VM1.

But thinking in a better way, if both could lock the required memory, and l=
ittle
was available to VM3,  it could experience major slowdown, as would the
host OS. Yeah, that would be complex.

>
> > > Overall the memory locking needs look like a significant constraint t=
hat
> > > will affect ability to use this feature.
> > >
> >
> > I Agree, there is a lot to take in account.
> > In any way, those constraints could be checked at the same function as
> > the setsockopt() right?
>
> QEMU could possibly check its ulimits to see if it is possible, but it
> would be safer to require a migration capability to be explicitly set
> by the mgmt app to opt-in to zerocopy.

Yeah, that would make sense. Let the mgmt app check system resources
and choose where to request zerocopy.  It also has access to knowing if
that process has enough memory locked.

>
> > (Setting up configs to improve the chance of zerocopy would probably on=
ly
> > happen at/before qemu starting, right?)
>
> Usually, but you can change ulimits on the fly for a process. I'm just
> not sure of semantics if you reduce limits and existing usage exceeds
> the reduced value.

Yeah, that's a good question.

>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

Best regards,
Leonardo Bras


