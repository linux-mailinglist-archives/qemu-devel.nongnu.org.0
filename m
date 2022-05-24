Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D850B53276F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:23:19 +0200 (CEST)
Received: from localhost ([::1]:53336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntRh8-0003IW-Q9
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntRet-0002MZ-3L
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntRer-00055s-Gq
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653387656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xN1zlC+JPwOjuLSADbTThmiRBNNWk+4P/B0MbIjo6cA=;
 b=DxrYBN/2pdXLhmar1pdby5nbpl1HqU/jkAFdzRzaMWK7c38BdP6YLo03ZG+e3GpZrV9p8l
 kIxIKQ8yLep3kH9GVE5rQJIEjNxudikkFaMfN/Us/jCjlbmKUKCGg+C8iDy2UGzkZ+Pvx3
 WPq1AZIl+MMAP7TFQg28Z5dTTmlNAO4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-glYlclRvOcKa6sK1TF3rrQ-1; Tue, 24 May 2022 06:20:51 -0400
X-MC-Unique: glYlclRvOcKa6sK1TF3rrQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59B573C1022F;
 Tue, 24 May 2022 10:20:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE965492C3B;
 Tue, 24 May 2022 10:20:48 +0000 (UTC)
Date: Tue, 24 May 2022 11:20:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <Yoyxf4XDxhl4pDhr@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com>
 <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
 <67993f7d-bc84-9929-0a28-10a441c3d5bd@redhat.com>
 <YoySiI+ReM2O8WEs@stefanha-x1.localdomain>
 <584d7d1a-94cc-9ebb-363b-2fddb8d79f5b@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="43zg45ctIgSAc08O"
Content-Disposition: inline
In-Reply-To: <584d7d1a-94cc-9ebb-363b-2fddb8d79f5b@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--43zg45ctIgSAc08O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 11:17:06AM +0200, Paolo Bonzini wrote:
> On 5/24/22 10:08, Stefan Hajnoczi wrote:
> > On Tue, May 24, 2022 at 09:55:39AM +0200, Paolo Bonzini wrote:
> > > On 5/22/22 17:06, Stefan Hajnoczi wrote:
> > > > However, I hit on a problem that I think Emanuele and Paolo have al=
ready
> > > > pointed out: draining is GS & IO. This might have worked under the =
1 IOThread
> > > > model but it does not make sense for multi-queue. It is possible to=
 submit I/O
> > > > requests in drained sections. How can multiple threads be in draine=
d sections
> > > > simultaneously and possibly submit further I/O requests in their dr=
ained
> > > > sections? Those sections wouldn't be "drained" in any useful sense =
of the word.
> > >=20
> > > Yeah, that works only if the drained sections are well-behaved.
> > >=20
> > > "External" sources of I/O are fine; they are disabled using is_extern=
al, and
> > > don't drain themselves I think.
> >=20
> > I/O requests for a given BDS may be executing in multiple AioContexts,
> > so how do you call aio_disable_external() on all relevant AioContexts?
>=20
> With multiqueue yeah, we have to replace aio_disable_external() with
> drained_begin/end() callbacks; but I'm not talking about that yet.
>=20
> > > In parallel to the block layer discussions, it's possible to work on
> > > introducing a request queue lock in virtio-blk and virtio-scsi.  That=
's the
> > > only thing that relies on the AioContext lock outside the block layer.
> >=20
> > I'm not sure what the request queue lock protects in virtio-blk? In
> > virtio-scsi I guess a lock is needed to protect SCSI target emulation
> > state?
>=20
> Yes, but even in virtio-blk there is this code that runs in the main thre=
ad
> and is currently protected by aio_context_acquire/release:
>=20
>     blk_drain(s->blk);
>=20
>     /* We drop queued requests after blk_drain() because blk_drain()
>      * itself can produce them. */
>     while (s->rq) {
>         req =3D s->rq;
>         s->rq =3D req->next;
>         virtqueue_detach_element(req->vq, &req->elem, 0);
>         virtio_blk_free_request(req);
>     }
>=20
> Maybe it's safe to run it without a lock because it runs after
> virtio_set_status(vdev, 0) but I'd rather play it safe and protect s->rq
> with a lock.

What does the lock protect?

A lock can prevent s->rq or req->vq corruption but it cannot prevent
request leaks. This loop's job is to free all requests so there is no
leak. If a lock is necessary then this code is already broken in a more
fundamental way because it can leak.

Stefan

--43zg45ctIgSAc08O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKMsX8ACgkQnKSrs4Gr
c8jigQf+M/6qUC4hljxC38JYpVCGTYsgfnG8d4phLmnYXbCC9ftynWxJSEtCHIdr
ttw7hzhrrp1+oM9g2O3NrlzL7SRtPVxd/jm0i5pIzn6hHMkeasX7DMUQT9yXu520
vRP0ZcA3EViqZVpeXTg+pLIlJvlqmgJcrRw6nfLGYcwGNdxeY1W+ml2SP5tXXjdj
wUZgVJpK8zm2SQj/HRayfDiBN2BNi/fvcl8Bk5rZIUBEnn38JGZtCIpwY6S3VBsr
hXSl2o4tToDYevogiFMgksYllg+dUQajQxfiR/h68RNpipG5tUkUOHf4YzWfQdkQ
LxvMYT0vGXq4pwIHdx6/xQ9cHkD86w==
=qAsB
-----END PGP SIGNATURE-----

--43zg45ctIgSAc08O--


