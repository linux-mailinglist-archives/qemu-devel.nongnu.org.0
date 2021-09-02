Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807823FEC30
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:33:34 +0200 (CEST)
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLk2H-0000pE-Ku
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLjuo-00048W-M5
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLjuj-00047x-17
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630578337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TfYS4ivhA3yziO9AvNX+ZwIzCWdlGRAtKUoj9Lh81fw=;
 b=P9rEv723+CYeu0u7A4PGh/4YwnR9Zji+gJA874zIQOd5L4Qn5G6vmPG0ixy0NDS6WzgKxp
 3xXIrah+kcHsfpkuzDLV8FhIGIgDQOoX7hob70WH63ZBkvGf/nikjOi9j/J2Ri6y+Weovl
 3ojLjNHgQyvNypt7rmYj2X9NRV8FWXk=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425--SbIrQ4oOYO49T8O7MEzmA-1; Thu, 02 Sep 2021 06:25:36 -0400
X-MC-Unique: -SbIrQ4oOYO49T8O7MEzmA-1
Received: by mail-lj1-f197.google.com with SMTP id
 p11-20020a2ea40b000000b001d68cffb055so474755ljn.6
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 03:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TfYS4ivhA3yziO9AvNX+ZwIzCWdlGRAtKUoj9Lh81fw=;
 b=N8XdQKn7iArTXAYHbAphNo7aIAx+1NAHqjrsZH1HFQccUFq5WXYCzDja1aKw8S2I9H
 Gr+ScPnqcAjxQjWfhQ41yAC6b91ZABXHfImcEyyae+kRuqo3AbjKQqymQopg/zpcXFEn
 7+/0g8zq6yIdKaJz53+1N+65Gd9p92OqOSV4HTI5uM9iCRyBX+avGt1wljNeKCuwMcqT
 Y0UV4bTbcLFL/2dIC3S6dCgyflMaSJnSrriNuBg8wXTT0LSY9LZ89GK87Of7+Sd3nPZ9
 NMpnGOZaXdKhHYwby0M5yH8LmLDd9RLI2BUGEvkx42ZOiPJrvf7dyxbwGkkNSzUDjyeW
 tMzg==
X-Gm-Message-State: AOAM531U6m840KrkUYlBK6x58RFQrFQjtp5Hv5cr+9c6a6MtH5hln5QQ
 u+XW4xm9o/jfcORBIwn+7d2Efg3ycCeBEpFq2NbI1MQLngv3bz2Jg6rhFn7AP4DtPTlxYN0/ykt
 7pT6WH5XL7Y9CCzWN3I/brg1k4XdCKdg=
X-Received: by 2002:a05:651c:10a2:: with SMTP id
 k2mr1915222ljn.262.1630578335201; 
 Thu, 02 Sep 2021 03:25:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxjpN6Jx7EesXpxLMghTm/E7SO8kVPY7G4JMPH2Hovs3cL+XhB4T0tFSTI+nyvVZD6vIJrv5HSRKCt0iUaLK8=
X-Received: by 2002:a05:651c:10a2:: with SMTP id
 k2mr1915190ljn.262.1630578334701; 
 Thu, 02 Sep 2021 03:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTCJRSue5NQ8qzPn@redhat.com>
 <CAJ6HWG45Xb2uc3OdJctL7SFxmrH0ZhDwQMBDAmS1TuDgiCrCMA@mail.gmail.com>
 <YTCXSoETM7UfeMQE@redhat.com>
 <CAJ6HWG7wLtEDY-X6wxdH9zG14NOdOCQ1YX0YBxTFEnbhJy6ozw@mail.gmail.com>
 <YTCgZnhwUCrPp1lP@redhat.com>
In-Reply-To: <YTCgZnhwUCrPp1lP@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 07:25:46 -0300
Message-ID: <CAJ6HWG4o2bkukJWXjjAyBjoAvRGiNr_7Sc5dQJQsmqufrrn3rQ@mail.gmail.com>
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

On Thu, Sep 2, 2021 at 6:59 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Sep 02, 2021 at 06:49:06AM -0300, Leonardo Bras Soares Passos wro=
te:
> > On Thu, Sep 2, 2021 at 6:20 AM Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
> > >
> > > On Thu, Sep 02, 2021 at 05:52:15AM -0300, Leonardo Bras Soares Passos=
 wrote:
> > > > On Thu, Sep 2, 2021 at 5:21 AM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
> > > > >
> > > > > On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Pa=
ssos wrote:
> > > > > > Hello Daniel, thanks for the feedback !
> > > > > >
> > > > > > On Tue, Aug 31, 2021 at 10:17 AM Daniel P. Berrang=C3=A9 <berra=
nge@redhat.com> wrote:
> > > > > > >
> > > > > > > On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote=
:
> > > > > > > > Call qio_channel_set_zerocopy(true) in the start of every m=
ultifd thread.
> > > > > > > >
> > > > > > > > Change the send_write() interface of multifd, allowing it t=
o pass down
> > > > > > > > flags for qio_channel_write*().
> > > > > > > >
> > > > > > > > Pass down MSG_ZEROCOPY flag for sending memory pages, while=
 keeping the
> > > > > > > > other data being sent at the default copying approach.
> > > > > > > >
> > > > > > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > > > > > ---
> > > > > > > >  migration/multifd-zlib.c | 7 ++++---
> > > > > > > >  migration/multifd-zstd.c | 7 ++++---
> > > > > > > >  migration/multifd.c      | 9 ++++++---
> > > > > > > >  migration/multifd.h      | 3 ++-
> > > > > > > >  4 files changed, 16 insertions(+), 10 deletions(-)
> > > > > > >
> > > > > > > > @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *=
opaque)
> > > > > > > >              }
> > > > > > > >
> > > > > > > >              if (used) {
> > > > > > > > -                ret =3D multifd_send_state->ops->send_writ=
e(p, used, &local_err);
> > > > > > > > +                ret =3D multifd_send_state->ops->send_writ=
e(p, used, MSG_ZEROCOPY,
> > > > > > > > +                                                          =
&local_err);
> > > > > > >
> > > > > > > I don't think it is valid to unconditionally enable this feat=
ure due to the
> > > > > > > resource usage implications
> > > > > > >
> > > > > > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.=
html
> > > > > > >
> > > > > > >   "A zerocopy failure will return -1 with errno ENOBUFS. This=
 happens
> > > > > > >    if the socket option was not set, the socket exceeds its o=
ptmem
> > > > > > >    limit or the user exceeds its ulimit on locked pages."
> > > > > >
> > > > > > You are correct, I unfortunately missed this part in the docs :=
(
> > > > > >
> > > > > > > The limit on locked pages is something that looks very likely=
 to be
> > > > > > > exceeded unless you happen to be running a QEMU config that a=
lready
> > > > > > > implies locked memory (eg PCI assignment)
> > > > > >
> > > > > > Do you mean the limit an user has on locking memory?
> > > > >
> > > > > Yes, by default limit QEMU sees will be something very small.
> > > > >
> > > > > > If so, that makes sense. I remember I needed to set the upper l=
imit of locked
> > > > > > memory for the user before using it, or adding a capability to =
qemu before.
> > > > > >
> > > > > > Maybe an option would be trying to mlock all guest memory befor=
e setting
> > > > > > zerocopy=3Don in qemu code. If it fails, we can print an error =
message and fall
> > > > > > back to not using zerocopy (following the idea of a new io_asyn=
c_writev()
> > > > > > I told you in the previous mail).
> > > > >
> > > > > Currently ability to lock memory is something that has to be conf=
igured
> > > > > when QEMU starts, and it requires libvirt to grant suitable permi=
ssions
> > > > > to QEMU. Memory locking is generally undesirable because it preve=
nts
> > > > > memory overcommit. Or rather if you are allowing memory overcommi=
t, then
> > > > > allowing memory locking is a way to kill your entire host.
> > > >
> > > > You mean it's gonna consume too much memory, or something else?
> > >
> > > Essentially yes.
> >
> > Well, maybe we can check for available memory before doing that,
> > but maybe it's too much effort.
>
> From a mgmt app POV, we assume QEMU is untrustworthy, so the mgmt
> app needs to enforce policy based on the worst case that the
> VM configuration allows for.
>
> Checking current available memory is not viable, because even
> if you see 10 GB free, QEMU can't know if that free memory is
> there to satisfy other VMs's worst case needs, or its own. QEMU
> needs to be explicitly told whether its OK to use locked memory,
> and an enforcement policy applied to it.


Yeah, it makes sense to let the mgmt app deal with that and enable/disable
the MSG_ZEROCOPY on migration whenever it sees fit.


>
>
> > > Consider a VM host with 64 GB of RAM and 64 GB of swap, and an
> > > overcommit ratio of 1.5. ie we'll run VMs with 64*1.5 GB of RAM
> > > total.
> > >
> > > So we can run 3 VMs each with 32 GB of RAM, giving 96 GB of usage
> > > which exceeds physical RAM. Most of the time this may well be fine
> > > as the VMs don't concurrently need their full RAM allocation, and
> > > worst case they'll get pushed to swap as the kernel re-shares
> > > memory in respose to load. So perhaps each VM only needs 20 GB
> > > resident at any time, but over time one VM can burst upto 32 GB
> > > and then 12 GB of it get swapped out later when inactive.
> > >
> > > But now consider if we allowed 2 of the VMs to lock memory for
> > > purposes of migration. Those 2 VMs can now pin 64 GB of memory
> > > in the worst case, leaving no free memory for the 3rd VM or
> > > for the OS. This will likely take down the entire host, regardless
> > > of swap availability.
> > >
> > > IOW, if you are overcomitting RAM you have to be extremely
> > > careful about allowing any VM to lock memory. If you do decide
> > > to allow memory locking, you need to make sure that the worst
> > > case locked memory amount still leaves enough unlocked memory
> > > for the OS to be able to effectively manage the overcommit
> > > load via swap.  We definitely can't grant memory locking to
> > > VMs at startup in this scenario, and if we grant it at runtime,
> > > we need to be able to revoke it again later.
> > >
> > > These overcommit numbers are a bit more extreme that you'd
> > > usually do in real world, but it illustrates the genreal
> > > problem. Also bear in mind that QEMU has memory overhead
> > > beyond the guest RAM block, which varies over time, making
> > > accounting quite hard. We have to also assume that QEMU
> > > could have been compromised by a guest breakout, so we
> > > can't assume that migration will play nice - we have to
> > > assume the worst case possible, given the process ulimits.
> > >
> >
> > Yeah, that makes sense. Thanks for this illustration and elucidation !
> >
> > I assume there is no way of asking the OS to lock memory, and if there =
is
> > no space available, it fails and rolls back the locking.
>
> Yes & no. On most Linux configs though it ends up being no, because
> instead of getting a nice failure, when host memory pressure occurs,
> the OOM Killer wakes up and just culls processes.

oh, right the OOM Killer :)

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

Thanks!

Best regards,
Leonardo


