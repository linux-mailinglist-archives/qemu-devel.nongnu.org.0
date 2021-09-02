Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600AC3FE9EB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:20:53 +0200 (CEST)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLh1o-0000xd-EL
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLgpg-0005w8-Ea
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:08:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLgpX-0005hV-Qe
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bW0A2/G9p0b//5mia/PUWMiunBKngulqBe+qRpBNjqo=;
 b=boppKqAl/EbQlk3haW8Q1SC92DibWl6cE1KPk1O3kiav0DPcKXRzRrJwMdtKq4gtibvkpg
 3GUVQtw00vmh4xSlQZLNvQ+JzLP3MFZOE0itf6kjUo3kbSkwQy7Cwkpi8iobyBIsgaimI5
 fpttF4m4ecZNsW6n3cCk4S+n0X+OfLE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-TPCYgIFcP5KzVHyOki71sg-1; Thu, 02 Sep 2021 03:07:30 -0400
X-MC-Unique: TPCYgIFcP5KzVHyOki71sg-1
Received: by mail-lf1-f72.google.com with SMTP id
 d4-20020ac241c4000000b003d8c755d4e0so441313lfi.13
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bW0A2/G9p0b//5mia/PUWMiunBKngulqBe+qRpBNjqo=;
 b=sSrK/toPl835jqULQ7VndSWh2WrFGDUD6BllB9uKs+ZVS4AwAjxBFqV+1Jf/6LHoKE
 LGa5ZyiZ6k2FLEH7q36sLuxqB/VKEqXqKOd7MEVeEtr9BqKdqw8+vS2vvxTSjt0X5SOI
 9Ca8dNaCBKG9z3PG3t6Z5KLxDSJzt8PfuZilIwl6mhE2dNMHyb0xsjBsphaMS/B8puSi
 vMZetLBZ+hztZxmu7l15nhn6A6dyTN0anLRopyh/eW3CLBpjRXp343s+rgIVzY0jq8gV
 FKJ7W8EbXlVevlr9wkT6nfQh94DS5VdWX1pphguBRfjVBLjxV+6zeVB2g+N5KPbe0XEO
 qVGA==
X-Gm-Message-State: AOAM533OajCYJ6iaAqRYat+gXR1rszBV+kGfkKu5f3qvwn9v+eZuiYw0
 CBDzPnGlrXNAXTeDc7ba8PV/NvKS6oQ2g+oDG4NbzeCvkwE6ZEvD48eFBGqIzPrP9GPcTN1Dvfb
 sEdmDgNEW6DGN+1zcGnNM6StlmtW8oyQ=
X-Received: by 2002:a05:6512:2291:: with SMTP id
 f17mr1523030lfu.489.1630566448663; 
 Thu, 02 Sep 2021 00:07:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt1mczgTg6IJ0Go7oOKJAkdMhxV5ZEEc39iQUIIFoqxJ3LUSKTVkJmSuWGi+hsXUrwlkaOeMU7l3/6lue9SCQ=
X-Received: by 2002:a05:6512:2291:: with SMTP id
 f17mr1522993lfu.489.1630566448193; 
 Thu, 02 Sep 2021 00:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com> <YS6QmOrN4qr055vR@t490s>
 <YS8+8EKboNvsB0zP@redhat.com>
In-Reply-To: <YS8+8EKboNvsB0zP@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 04:07:39 -0300
Message-ID: <CAJ6HWG6tSSYwesTyitPmiSDTMuiqkk4YeBzptni+46GPU9zKow@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
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

Hello Daniel,.
A few more comments:

On Wed, Sep 1, 2021 at 5:51 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Aug 31, 2021 at 04:27:04PM -0400, Peter Xu wrote:
> > On Tue, Aug 31, 2021 at 01:57:33PM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Tue, Aug 31, 2021 at 08:02:38AM -0300, Leonardo Bras wrote:
> > > > MSG_ZEROCOPY is a feature that enables copy avoidance in TCP/UDP so=
cket
> > > > send calls. It does so by avoiding copying user data into kernel bu=
ffers.
> > > >
> > > > To make it work, three steps are needed:
> > > > 1 - A setsockopt() system call, enabling SO_ZEROCOPY
> > > > 2 - Passing down the MSG_ZEROCOPY flag for each send*() syscall
> > > > 3 - Process the socket's error queue, dealing with any error
> > >
> > > AFAICT, this is missing the single most critical aspect of MSG_ZEROCO=
PY.
> > >
> > > It is non-obvious, but setting the MSG_ZEROCOPY flag turns sendmsg()
> > > from a synchronous call to an asynchronous call.
> > >
> > > It is forbidden to overwrite/reuse/free the buffer passed to sendmsg
> > > until an asynchronous completion notification has been received from
> > > the socket error queue. These notifications are not required to
> > > arrive in-order, even for a TCP stream, because the kernel hangs on
> > > to the buffer if a re-transmit is needed.
> > >
> > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > >
> > >   "Page pinning also changes system call semantics. It temporarily
> > >    shares the buffer between process and network stack. Unlike with
> > >    copying, the process cannot immediately overwrite the buffer
> > >    after system call return without possibly modifying the data in
> > >    flight. Kernel integrity is not affected, but a buggy program
> > >    can possibly corrupt its own data stream."
> > >
> > > AFAICT, the design added in this patch does not provide any way
> > > to honour these requirements around buffer lifetime.
> > >
> > > I can't see how we can introduce MSG_ZEROCOPY in any seemless
> > > way. The buffer lifetime requirements imply need for an API
> > > design that is fundamentally different for asynchronous usage,
> > > with a callback to notify when the write has finished/failed.
> >
> > Regarding buffer reuse - it indeed has a very deep implication on the b=
uffer
> > being available and it's not obvious at all.  Just to mention that the =
initial
> > user of this work will make sure all zero copy buffers will be guest pa=
ges only
> > (as it's only used in multi-fd), so they should always be there during =
the
> > process.
>
> That is not the case when migration is using TLS, because the buffers
> transmitted are the ciphertext buffer, not the plaintext guest page.

That makes sense.
I am still working my way on Migration code, and I ended up not
knowing that part.

I think we can work on KTLS for this case, and implement something
'like zerocopy' for this. I added more details in the previous mail I sent =
you.


>
> > In short, we may just want to at least having a way to make sure all ze=
ro
> > copied buffers are finished using and they're sent after some function =
returns
> > (e.g., qio_channel_flush()).  That may require us to do some accounting=
 on when
> > we called sendmsg(MSG_ZEROCOPY), meanwhile we should need to read out t=
he
> > ee_data field within SO_EE_ORIGIN_ZEROCOPY msg when we do recvmsg() for=
 the
> > error queue and keep those information somewhere too.
> >
> > Some other side notes that reached my mind..
> >
> > The qio_channel_writev_full() may not be suitable for async operations,=
 as the
> > name "full" implies synchronous to me.  So maybe we can add a new helpe=
r for
> > zero copy on the channel?
>
> All the APIs that exist today are fundamentally only suitable for sync
> operations. Supporting async correctly will definitely a brand new APIs
> separate from what exists today.

That's a great, I was thinking on implementing this as an optional method f=
or
QIOChannel, more details in the previous mail :).

(sorry, I ended up reading/replying the mails in thread order)

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


