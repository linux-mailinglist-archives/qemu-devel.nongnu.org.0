Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC061515A91
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 07:18:42 +0200 (CEST)
Received: from localhost ([::1]:38762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkfVB-0007EZ-JI
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 01:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nkfTx-0006Q2-BR
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 01:17:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nkfTu-0004lt-6b
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 01:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651295840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XApDeSlnKyBzNFhKvsIarv9fJYeVHZY/5R9JIyXZvhM=;
 b=cMoHKxMGVu+FBFGhfLiRStMM29AWyZkQwFAQnCa6UnhIAA6JuTXb/Jdym+9tCLedgcr9nq
 C80P5YE26YR0IVmFZq95d/NGRvV1LK/Vs07x5FBa99a+OhEOH+3TLXl/hYqvbp0Bfefh9X
 WCYF778Z+jKHPoQlS2J/xyOhruy9slg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-IysnV6iCO3-MPqkZphltvg-1; Sat, 30 Apr 2022 01:17:15 -0400
X-MC-Unique: IysnV6iCO3-MPqkZphltvg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2313229AB3E3;
 Sat, 30 Apr 2022 05:17:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73439416374;
 Sat, 30 Apr 2022 05:17:12 +0000 (UTC)
Date: Sat, 30 Apr 2022 06:17:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YmzGV8Evmet8RXUh@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <8f01c640-f876-568a-d6ff-bbb112e5154f@redhat.com>
 <YmpwRKUW5e3P/hhd@stefanha-x1.localdomain>
 <3b156b87-11d5-3eb7-f58a-94939f65ea8f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="62fOTn7hkvFpNlLb"
Content-Disposition: inline
In-Reply-To: <3b156b87-11d5-3eb7-f58a-94939f65ea8f@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--62fOTn7hkvFpNlLb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 11:56:09PM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 28/04/2022 um 12:45 schrieb Stefan Hajnoczi:
> > On Wed, Apr 27, 2022 at 08:55:35AM +0200, Emanuele Giuseppe Esposito wr=
ote:
> >>
> >>
> >> Am 26/04/2022 um 10:51 schrieb Emanuele Giuseppe Esposito:
> >>> Luckly, most of the cases where we recursively go through a graph are
> >>> the BlockDriverState callback functions in block_int-common.h
> >>> In order to understand what to protect, I categorized the callbacks in
> >>> block_int-common.h depending on the type of function that calls them:
> >>>
> >>> 1) If the caller is a generated_co_wrapper, this function must be
> >>>    protected by rdlock. The reason is that generated_co_wrapper create
> >>>    coroutines that run in the given bs AioContext, so it doesn't matt=
er
> >>>    if we are running in the main loop or not, the coroutine might run
> >>>    in an iothread.
> >>> 2) If the caller calls it directly, and has the GLOBAL_STATE_CODE() m=
acro,
> >>>    then the function is safe. The main loop is the writer and thus wo=
n't
> >>>    read and write at the same time.
> >>> 3) If the caller calls it directly, but has not the GLOBAL_STATE_CODE=
()
> >>>    macro, then we need to check the callers and see case-by-case if t=
he
> >>>    caller is in the main loop, if it needs to take the lock, or deleg=
ate
> >>>    this duty to its caller (to reduce the places where to take it).
> >>>
> >>> I used the vrc script (https://github.com/bonzini/vrc) to get help fi=
nding
> >>> all the callers of a callback. Using its filter function, I can
> >>> omit all functions protected by the added lock to avoid having duplic=
ates
> >>> when querying for new callbacks.
> >>
> >> I was wondering, if a function is in category (3) and runs in an
> >> Iothread but the function itself is not (currently) recursive, meaning
> >> it doesn't really traverse the graph or calls someone that traverses i=
t,
> >> should I add the rdlock anyways or not?
> >>
> >> Example: bdrv_co_drain_end
> >>
> >> Pros:
> >>    + Covers if in future a new recursive callback for a new/existing
> >>      BlockDriver is implemented.
> >>    + Covers also the case where I or someone missed the recursive part.
> >>
> >> Cons:
> >>    - Potentially introducing an unnecessary critical section.
> >>
> >> What do you think?
> >=20
> > ->bdrv_co_drain_end() is a callback function. Do you mean whether its
> > caller, bdrv_drain_invoke_entry(), should take the rdlock around
> > ->bdrv_co_drain_end()?
>=20
> Yes. The problem is that the coroutine is created in bs AioContext, so
> it might be in an iothread.
>=20
> >=20
> > Going up further in the call chain (and maybe switching threads),
> > bdrv_do_drained_end() has QLIST_FOREACH(child, &bs->children, next) so
> > it needs protection. If the caller of bdrv_do_drained_end() holds then
> > rdlock then I think none of the child functions (including
> > ->bdrv_co_drain_end()) need to take it explicitly.
>=20
> Regarding bdrv_do_drained_end and similar, they are either running in
> the main loop (or they will be, if coming from a coroutine) or in the
> iothread running the AioContext of the bs involved.
>=20
> I think that most of the drains except for mirror.c are coming from main
> loop. I protected mirror.c in patch 8, even though right now I am not
> really sure that what I did is necessary, since the bh will be scheduled
> in the main loop.
>=20
> Therefore we don't really need locks around drains.

Are you saying rdlock isn't necessary in the main loop because nothing
can take the wrlock while our code is executing in the main loop?

Stefan

--62fOTn7hkvFpNlLb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJsxlcACgkQnKSrs4Gr
c8hj3wf9HNxR8+d63ST16SBU7xHxSNKPdoTtP2GiNEwfIeMjZWNRnUUA15go6bKf
RLnfW1oxtOeyk05M/TFVbVVeCeOdTChqE3cqlMK/0BwvsKuKFLVr1WaFo1YcOYVl
p8KoqSJRV3z1Y4vIE/Sb3QBase2ZlugvHSXVM3nIVEE+o0ZCOgY3nNBopYgGVxwF
0fjh9caM6yEQptf/qpNMEVp3UgeAUnpqOiSkR/rwc8AqrVxSLiWRFOyMTLm2saRQ
dkfQanloWybTB2du2jpnnO9jb7Shis1g6V7uhLsk3q6RZi9rp1nSyEkHh2+p9fwN
xJT1jn9CRiufDnGtkKen0DTTTSCClA==
=2Sf7
-----END PGP SIGNATURE-----

--62fOTn7hkvFpNlLb--


