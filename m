Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F185132C1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:42:44 +0200 (CEST)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2Xk-000611-11
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk1eV-000556-OC
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk1eQ-0001gM-9f
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651142729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6/rBS1e6c/Kxquqa/bofeThY7oPxW26MApxldYuGpaE=;
 b=OahnFJFc7Ck4YHTBCfbfPXwf6vxZbeiQU65hqIsu7zvPUB0WcxWPb08TtuFP5T85ljVbYu
 brRaJiDw1l+cnBB3sLz7huaQtph23WF9Bn7E+lwiTl6ST27OrX2FMikxttC/59Ff3kckTU
 dCOLUL/axOKSRo4UjJ4gDsCxHpYQ4Ss=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-9luUYnLTNNOiAVQydfe_iw-1; Thu, 28 Apr 2022 06:45:26 -0400
X-MC-Unique: 9luUYnLTNNOiAVQydfe_iw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDE4629DD9AE;
 Thu, 28 Apr 2022 10:45:25 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5879B464508;
 Thu, 28 Apr 2022 10:45:25 +0000 (UTC)
Date: Thu, 28 Apr 2022 11:45:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YmpwRKUW5e3P/hhd@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <8f01c640-f876-568a-d6ff-bbb112e5154f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JUM8VNAVpI/8FKc5"
Content-Disposition: inline
In-Reply-To: <8f01c640-f876-568a-d6ff-bbb112e5154f@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JUM8VNAVpI/8FKc5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 08:55:35AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 26/04/2022 um 10:51 schrieb Emanuele Giuseppe Esposito:
> > Luckly, most of the cases where we recursively go through a graph are
> > the BlockDriverState callback functions in block_int-common.h
> > In order to understand what to protect, I categorized the callbacks in
> > block_int-common.h depending on the type of function that calls them:
> >=20
> > 1) If the caller is a generated_co_wrapper, this function must be
> >    protected by rdlock. The reason is that generated_co_wrapper create
> >    coroutines that run in the given bs AioContext, so it doesn't matter
> >    if we are running in the main loop or not, the coroutine might run
> >    in an iothread.
> > 2) If the caller calls it directly, and has the GLOBAL_STATE_CODE() mac=
ro,
> >    then the function is safe. The main loop is the writer and thus won't
> >    read and write at the same time.
> > 3) If the caller calls it directly, but has not the GLOBAL_STATE_CODE()
> >    macro, then we need to check the callers and see case-by-case if the
> >    caller is in the main loop, if it needs to take the lock, or delegate
> >    this duty to its caller (to reduce the places where to take it).
> >=20
> > I used the vrc script (https://github.com/bonzini/vrc) to get help find=
ing
> > all the callers of a callback. Using its filter function, I can
> > omit all functions protected by the added lock to avoid having duplicat=
es
> > when querying for new callbacks.
>=20
> I was wondering, if a function is in category (3) and runs in an
> Iothread but the function itself is not (currently) recursive, meaning
> it doesn't really traverse the graph or calls someone that traverses it,
> should I add the rdlock anyways or not?
>=20
> Example: bdrv_co_drain_end
>=20
> Pros:
>    + Covers if in future a new recursive callback for a new/existing
>      BlockDriver is implemented.
>    + Covers also the case where I or someone missed the recursive part.
>=20
> Cons:
>    - Potentially introducing an unnecessary critical section.
>=20
> What do you think?

->bdrv_co_drain_end() is a callback function. Do you mean whether its
caller, bdrv_drain_invoke_entry(), should take the rdlock around
->bdrv_co_drain_end()?

Going up further in the call chain (and maybe switching threads),
bdrv_do_drained_end() has QLIST_FOREACH(child, &bs->children, next) so
it needs protection. If the caller of bdrv_do_drained_end() holds then
rdlock then I think none of the child functions (including
->bdrv_co_drain_end()) need to take it explicitly.

Stefan

--JUM8VNAVpI/8FKc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqcEQACgkQnKSrs4Gr
c8i4/QgAnqPkTTStHPNOMuc1S5IINWKWKFpcNEYkrGYq9X/h7XIo+puX9IkeNfpz
P79XTb79oCK3ckzlxk3GQOPS5R8YulnEtUjNUVdGbpGhuoHgSaK/o/eOFYUh3477
3tie4J9UMXKbniEN54seJRqt0tSF5xkPpU8tnHwnd8mhF2vyebGyxt2nPJ2Le+eh
HssQjEREJnM6+uEkiQX1x9jCRSVmNAvrdrMInAJ4O6tGV8jOvw4GubmanwBo0RSI
cEaHlRAGuApxPelG51pDSJP19HjzU1TUBUbHmAOXfQLQr6R/lBJUTXMHp/UD6OSC
8MGATkcVfORsWDkerx00hcUw85KjKA==
=P0Wz
-----END PGP SIGNATURE-----

--JUM8VNAVpI/8FKc5--


