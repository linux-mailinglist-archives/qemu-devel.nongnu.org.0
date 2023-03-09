Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D60B6B23BF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:13:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paF8e-0007w4-Le; Thu, 09 Mar 2023 07:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paF8a-0007su-Ql
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:12:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paF8W-00031S-Q7
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678363963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AfcaMq2YgSOC6gM8oR/DxXq+QcR0sXZ5A5VrTtVotDk=;
 b=NrAMPZf9r+cH3dQZ69ahJ1Ih85Mf/sCj/9ol+y3fu2PUBQNJNIV2vi/oGYSPE3RF0+izb8
 fsRY0PPSYN5QLjUFUuhL0rx4SVuq38nJoad+KgrZBL+5Lm7bxd7fjRzXWOtkOdE3gD5B0W
 Reb9jJxzKsFM+olybjHy4zRUtovHVVQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-yQWf9MzEPyORvf_WgEBshA-1; Thu, 09 Mar 2023 07:12:41 -0500
X-MC-Unique: yQWf9MzEPyORvf_WgEBshA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50F521869B76;
 Thu,  9 Mar 2023 12:12:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3D3740CF8ED;
 Thu,  9 Mar 2023 12:12:40 +0000 (UTC)
Date: Thu, 9 Mar 2023 07:12:39 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 2/3] block: make BlockBackend->disable_request_queuing
 atomic
Message-ID: <20230309121239.GA370169@fedora>
References: <20230307210427.269214-1-stefanha@redhat.com>
 <20230307210427.269214-3-stefanha@redhat.com>
 <04798520-3989-c081-a8d1-63ba9356f1ce@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5bMcA8UIKFMqZvO/"
Content-Disposition: inline
In-Reply-To: <04798520-3989-c081-a8d1-63ba9356f1ce@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--5bMcA8UIKFMqZvO/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 12:18:00PM +0100, Paolo Bonzini wrote:
> On 3/7/23 22:04, Stefan Hajnoczi wrote:
> >   static int coroutine_fn GRAPH_RDLOCK
> > @@ -1271,7 +1271,8 @@ static void coroutine_fn blk_wait_while_drained(B=
lockBackend *blk)
> >   {
> >       assert(blk->in_flight > 0);
> > -    if (qatomic_read(&blk->quiesce_counter) && !blk->disable_request_q=
ueuing) {
> > +    if (qatomic_read(&blk->quiesce_counter) &&
> > +        !qatomic_read(&blk->disable_request_queuing)) {
>=20
> The qatomic_inc in blk_inc_in_flight() made me a bit nervous that
> smp_mb__after_rmw() was needed there, but it's okay.

Yes. I wrote it under the assumption that sequentially consistent
operations like qatomic_inc() are implicit barriers.

> First, anyway blk_wait_while_drained() has to _eventually_ pause the devi=
ce,
> not immediately.  Even if it misses that blk->quiesce_counter =3D=3D 1, t=
he I/O
> will proceed and it'll just take a little more polling before
> bdrv_drained_begin() exits.
>=20
> Second, I checked with CPPMEM the barriers in AIO_WAIT_WHILE() and
> aio_wait_kick() save the day, even if loading blk->quiesce_counter is
> reordered before the incremented value (1) is stored to blk->in_flight.
>=20
> The CPPMEM model here uses mo_relaxed to force all possible kinds of havo=
c:
>=20
> int main() {
>   atomic_int quiesce_counter =3D 0;
>   atomic_int waiters =3D 0;
>   atomic_int in_flight =3D 0;
>=20
>   {{{ { quiesce_counter.store(1, mo_relaxed);
>         waiters.store(1, mo_relaxed);    // AIO_WAIT_WHILE starts here
>         atomic_thread_fence(mo_seq_cst);
>         in_flight.load(mo_relaxed).readsvalue(1); } // if 1, sleep
>=20
>   ||| { in_flight.store(1, mo_relaxed);  // bdrv_inc_in_flight
>         quiesce_counter.load(mo_relaxed).readsvalue(1); // go down "if"
>         in_flight.store(0, mo_release);  // bdrv_dec_in_flight
>         atomic_thread_fence(mo_seq_cst); // aio_wait_kick starts here
>         waiters.load(mo_relaxed).readsvalue(0); }   // if 0, do not wake
>   }}};
>=20
>   return 0;
> }
>=20
>=20
> Because CPPMEM shows no execution consistent with the buggy .readsvalue(),
> either AIO_WAIT_WHILE will not go to sleep or it will be woken up with
> in_flight =3D=3D 0.  The polling loop ends and drained_end restarts the
> coroutine from blk->queued_requests.

Okay.

Stefan

--5bMcA8UIKFMqZvO/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQJzTYACgkQnKSrs4Gr
c8ji0QgAx7bcLh2brstovthghM49RjTLp/p/NfEP7WgVY8XCbn3nalN+q1hWBLPC
aoPdGGiiyI+GmOBEgIgTJBKgZBRgxw1Dv8iO+jsR/nv8pjfmaM3xbmGkvhUEwI0M
R2jvXhV7r8RKiHlj3vF4xg5s/LHOB1dz7+3TEvZVIU28ewkkDXWpEdtGo1fdRmip
cUoaul3dFnEu/dpfZ7td/1DMULxpcVggs5R6kNBevJSlAxKapgjH6K5WXZZDUdYU
cerfDmIXT5Iyx3iNlEp8W5wnsWf0aV9tmHQB3jbE9uXcE9E30YPPLZqgxXDJLG4a
uM3sdeJ/wNMSwllGM+GSx2m11mb4jQ==
=0Ito
-----END PGP SIGNATURE-----

--5bMcA8UIKFMqZvO/--


