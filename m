Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F383C750B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:39:50 +0200 (CEST)
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LRl-0004lW-LR
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3LQl-0003wk-OP
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:38:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3LQk-00032g-0v
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626194325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o9JqE7Bwl3fQGGiw8Feden1ZY4HIBKR1JRhTshIv3SQ=;
 b=VtxqpzGwb6oANrPHjyTXJcSfDP6ZEZC0ih1cUFO6mkuSoq74N0x/tC198igEAIGhOv6JaP
 VwRhL+DAewoTd3EUoH1U3gxRDvsslIWTxM2Qb5xiTcpjp0A7CsGxouW7QTVN9F6akClgzv
 aHbU2c2aUaGtP+wbIm+I+XlC2y8i9Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-Yds1BeeuMiOQxME85KwmnA-1; Tue, 13 Jul 2021 12:38:42 -0400
X-MC-Unique: Yds1BeeuMiOQxME85KwmnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2C9F18414A0;
 Tue, 13 Jul 2021 16:38:40 +0000 (UTC)
Received: from localhost (ovpn-112-172.ams2.redhat.com [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E9DE6091B;
 Tue, 13 Jul 2021 16:38:39 +0000 (UTC)
Date: Tue, 13 Jul 2021 17:38:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YO3BjpNHumrPUab1@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
 <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
 <YOb31YOF8Q3t9RoK@stefanha-x1.localdomain>
 <629fb077-9d0a-7c33-0b2e-d055c0493005@redhat.com>
 <YO2QvuBqbw58fuo/@stefanha-x1.localdomain>
 <37a92342-37a1-151b-7fbd-31604a792938@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <37a92342-37a1-151b-7fbd-31604a792938@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CJTepEJPq2MLmM00"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--CJTepEJPq2MLmM00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 06:18:39PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> 13.07.2021 16:10, Stefan Hajnoczi wrote:
> > On Mon, Jul 12, 2021 at 10:41:46AM +0200, Emanuele Giuseppe Esposito wr=
ote:
> > >=20
> > >=20
> > > On 08/07/2021 15:04, Stefan Hajnoczi wrote:
> > > > On Thu, Jul 08, 2021 at 01:32:12PM +0200, Paolo Bonzini wrote:
> > > > > On 08/07/21 12:36, Stefan Hajnoczi wrote:
> > > > > > > What is very clear from this patch is that it
> > > > > > > is strictly related to the brdv_* and lower level calls, beca=
use
> > > > > > > they also internally check or even use the aiocontext lock.
> > > > > > > Therefore, in order to make it work, I temporarly added some
> > > > > > > aiocontext_acquire/release pair around the function that
> > > > > > > still assert for them or assume they are hold and temporarly
> > > > > > > unlock (unlock() - lock()).
> > > > > >=20
> > > > > > Sounds like the issue is that this patch series assumes AioCont=
ext locks
> > > > > > are no longer required for calling the blk_*()/bdrv_*() APIs? T=
hat is
> > > > > > not the case yet, so you had to then add those aio_context_lock=
() calls
> > > > > > back in elsewhere. This approach introduces unnecessary risk. I=
 think we
> > > > > > should wait until blk_*()/bdrv_*() no longer requires the calle=
r to hold
> > > > > > the AioContext lock before applying this series.
> > > > >=20
> > > > > In general I'm in favor of pushing the lock further down into sma=
ller and
> > > > > smaller critical sections; it's a good approach to make further a=
udits
> > > > > easier until it's "obvious" that the lock is unnecessary.  I have=
n't yet
> > > > > reviewed Emanuele's patches to see if this is what he's doing whe=
re he's
> > > > > adding the acquire/release calls, but that's my understanding of =
both his
> > > > > cover letter and your reply.
> > > >=20
> > > > The problem is the unnecessary risk. We know what the goal is for
> > > > blk_*()/bdrv_*() but it's not quite there yet. Does making changes =
in
> > > > block jobs help solve the final issues with blk_*()/bdrv_*()?
> > >=20
> > > Correct me if I am wrong, but it seems to me that the bdrv_*()/blk_*(=
)
> > > operation mostly take care of building, modifying and walking the bds=
 graph.
> > > So since graph nodes can have multiple AioContext, it makes sense tha=
t we
> > > have a lock when modifying the graph, right?
> > >=20
> > > If so, we can simply try to replace the AioContext lock with a graph =
lock,
> > > or something like that. But I am not sure of this.
> >=20
> > Block graph manipulation (all_bdrv_states and friends) requires the BQL=
.
> > It has always been this way.
> >=20
> > This raises the question: if block graph manipulation is already under
> > the BQL and BlockDriver callbacks don't need the AioContext anymore, wh=
y
>=20
> I don't believe that block drivers are thread-safe now. They have some mu=
texes.. But who make an audit of thread-safety?

Emanuele :)

FWIW I took a look at the stream, mirror, and backup jobs today and
couldn't find anything that's unsafe after this series. I was expecting
to find issues but I think Emanuele and Paolo have taken care of them.

> > are aio_context_acquire() calls still needed in block jobs?
> >=20
> > AIO_WAIT_WHILE() requires that AioContext is acquired according to its
> > documentation, but I'm not sure that's true anymore. Thread-safe/atomic
> > primitives are used by AIO_WAIT_WHILE(), so as long as the condition
> > being waited for is thread-safe too it should work without the
> > AioContext lock.
> >=20
> > Back to my comment about unnecessary risk, pushing the lock down is a
> > strategy for exploring the problem, but I'm not sure those intermediate
> > commits need to be committed to qemu.git/master because of the time
> > required to review them and the risk of introducing (temporary) bugs.
>=20
> I agree. Add my bit of criticism:
>=20
> What I dislike about the whole thread-safe update you do:
>=20
> 1. There is no proof of concept - some good example of multiqueue, or som=
ething that uses mutliple threads and shows good performance. Something tha=
t works, and shows where are we going to and why it is good. That may be dr=
aft patches with a lot of "FIXME" and "TODO", but working. For now I feel t=
hat I've spent my time to reviewing and proving to myself thread-safety of =
two previous thread-safe series, but I don't have a hope to see a benefit o=
f it in the near future..

The multi-queue block layer should improve performance in cases where
the bottleneck is a single IOThread. It will allow users to assign more
than one IOThread.

But I think the bigger impact of this work will be addressing
long-standing problems with the block layer's programming model. We
continue to have IOThread bugs because there are many undocumented
assumptions. With the multi-queue block layer the code switches to a
more well-understood multi-threaded programming model and hopefully
fewer issues will arise because there is no problematic AioContext lock
to worry about.

Stefan

--CJTepEJPq2MLmM00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDtwY4ACgkQnKSrs4Gr
c8gt4Qf+Ilx8IF9IWuzXxJrXsBmcds28prlQ8AOj3RgofjSXTSzABhDD/rpb0UQ5
Whh5y+ShCWHPALxmCig/stgIS/bdDAXUhlHUjSo2x6qrrWQFhZCNBvo11vyRCfvj
O/O2r07lQV2GhaxGV18i2wIxvEhvrR4p91q8nwJteWxWHRjO0uqDITN5p9cZcC5f
jVRhWjRsOFSWqSxtvTCUnH/Ed5urkwWT3gXtoygfs1BjbOuRFhVwn2fv5in0ZVo2
JgnZyS/s8ea7Y7vKsHCZmWDTPS9j5EYlxBiMzKP01iKaMlWHQpdapGqs4+ZcxEFe
HXFFXNl2w7QW5cGwrunmi/wXElMe5A==
=/krX
-----END PGP SIGNATURE-----

--CJTepEJPq2MLmM00--


