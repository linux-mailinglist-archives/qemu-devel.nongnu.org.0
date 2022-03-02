Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE8E4CAA0F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:23:40 +0100 (CET)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRlL-0007f7-FP
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPRij-0006D2-Qf
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:20:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPRig-0005a4-Hs
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646238052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H9GCNn8OTb6o/j8zDitgxl27zQeZxX75m0yiyiN3YcU=;
 b=Vd/kyXylguLz66uvlTOdQDIFWjUcMEJw42psh4IJxoChvj7GXMeN0hYu5N6QBsOO3XjaTB
 /uMeQZi04q63ADVoJ0fk6TDMGWGE68MeDnLvbcW7Mcro4fTt6GIO3H4UcGb9w/8Lc7nYdC
 Ss1vJ7OUaqlrt6Zl1YZX98Cx1h1Gmu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-4chpkZNnPFmN5bgCZwAD5Q-1; Wed, 02 Mar 2022 11:20:51 -0500
X-MC-Unique: 4chpkZNnPFmN5bgCZwAD5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 115431006AA8;
 Wed,  2 Mar 2022 16:20:50 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02C45841C8;
 Wed,  2 Mar 2022 16:20:40 +0000 (UTC)
Date: Wed, 2 Mar 2022 16:20:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Message-ID: <Yh+ZV4zqgLvF0/Sw@stefanha-x1.localdomain>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <516a480e-15a0-896f-6ff8-4303e110210e@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Oq4e3GcNntqMMV5r"
Content-Disposition: inline
In-Reply-To: <516a480e-15a0-896f-6ff8-4303e110210e@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Oq4e3GcNntqMMV5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2022 at 02:07:30PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> 01.03.2022 17:21, Emanuele Giuseppe Esposito wrote:
> > This serie tries to provide a proof of concept and a clear explanation
> > on why we need to use drains (and more precisely subtree_drains)
> > to replace the aiocontext lock, especially to protect BlockDriverState
> > ->children and ->parent lists.
> >=20
> > Just a small recap on the key concepts:
> > * We split block layer APIs in "global state" (GS), "I/O", and
> > "global state or I/O".
> >    GS are running in the main loop, under BQL, and are the only
> >    one allowed to modify the BlockDriverState graph.
> >=20
> >    I/O APIs are thread safe and can run in any thread
> >=20
> >    "global state or I/O" are essentially all APIs that use
> >    BDRV_POLL_WHILE. This is because there can be only 2 threads
> >    that can use BDRV_POLL_WHILE: main loop and the iothread that
> >    runs the aiocontext.
> >=20
> > * Drains allow the caller (either main loop or iothread running
> > the context) to wait all in_flights requests and operations
> > of a BDS: normal drains target a given node and is parents, while
> > subtree ones also include the subgraph of the node. Siblings are
> > not affected by any of these two kind of drains.
> > After bdrv_drained_begin, no more request is allowed to come
> > from the affected nodes. Therefore the only actor left working
> > on a drained part of the graph should be the main loop.
> >=20
> > What do we intend to do
> > -----------------------
> > We want to remove the AioContext lock. It is not 100% clear on how
> > many things we are protecting with it, and why.
> > As a starter, we want to protect BlockDriverState ->parents and
> > ->children lists, since they are read by main loop and I/O but
> > only written by main loop under BQL. The function that modifies
> > these lists is bdrv_replace_child_common().
> >=20
> > How do we want to do it
> > -----------------------
> > We individuated as ideal subtitute of AioContext lock
> > the subtree_drain API. The reason is simple: draining prevents the ioth=
read to read or write the nodes, so once the main loop finishes
>=20
> I'm not sure it's ideal. Unfortunately I'm not really good in all that BQ=
L, AioContext locks and drains. So, I can't give good advice. But here are =
my doubts:
>=20
> Draining is very restrictive measure: even if drained section is very sho=
rt, at least on bdrv_drained_begin() we have to wait for all current reques=
ts, and don't start new ones. That slows down the guest. In the same time t=
here are operations that don't require to stop guest IO requests. For examp=
le manipulation with dirty bitmaps - qmp commands block-dirty-bitmap-add bl=
ock-dirty-bitmap-remove. Or different query requests..
>=20
> I see only two real cases, where we do need drain:
>=20
> 1. When we need a consistent "point-in-time". For example, when we start =
backup in transaction with some dirty-bitmap manipulation commands.
>=20
> 2. When we need to modify block-graph: if we are going to break relation =
A -> B, there must not be any in-flight request that want to use this relat=
ion.
>=20
> All other operations, for which we want some kind of lock (like AioContex=
t lock or something) we actually don't want to stop guest IO.

Yes, I think so too.

Block drivers should already be at a point where block-dirty-bitmap-add
and similar commands can be synchronized with just the qcow2 CoMutex.

Not every aio_context_acquire() needs to be replace by a drained
section. Some can safely be dropped because there are fine-grained locks
in place that provide sufficient protection.

Stefan

--Oq4e3GcNntqMMV5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIfmVcACgkQnKSrs4Gr
c8i5Ugf+PfTXRafxZBdNEyQfLNAsDUUh3T+azKQ4dvBbnXfqEfMHZoB8KX9KIafh
4W0x1Fi/rFzjCc4xcOWnWDnKk26L6TuIpViPXWftl5FrgLZyu9v7+wu6Vas2tSpj
/3yChhcSb2XGB1Q1xubn1oduj9g4S1sflS1qcCvjrOac7gW8Q8uOeRkTTVNDrz8A
uzQOzMXAcqmNdpy6ud60JwPieqwaS2Hh0Z8DVPISPNF27QhWFolCATGSqR5I3I/k
Et4Rp/S9JxFAcjGx3fH6RF64oXHde5h+sA1tLkTUdp3TZ81lzumGQPmLJNuQkm/3
5WHApptAEtYgeBhwfX7MHSlfzHLNFg==
=Iksv
-----END PGP SIGNATURE-----

--Oq4e3GcNntqMMV5r--


