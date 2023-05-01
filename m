Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F86F32E9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:32:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVUy-0006yn-R9; Mon, 01 May 2023 11:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVUw-0006y5-8P
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:31:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVUu-00061W-DM
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682955087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FeodN4Hdc6MvbzSait5m9+aqT38XFqa6cP0gQtlJ82k=;
 b=JbJq9EvOvbOCed9qBegY/44X6a3KEvcQkfdJ4GvF7pKP+qf9mJve9g7cqIPRH0hPRGkLir
 ITCOdjMiReAuh3uuxRqbrzQCnZH/W/gnq0Pbs7JB/+rTxfEiAj75x+lzW3SxhZ05mWidHV
 uvt+uuYYs7sefN0Nv+z7r54CnC1NWtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-EjsizLKtOfSitBQ29su3Fg-1; Mon, 01 May 2023 11:31:16 -0400
X-MC-Unique: EjsizLKtOfSitBQ29su3Fg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAB121818841;
 Mon,  1 May 2023 15:31:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45ED71121331;
 Mon,  1 May 2023 15:31:01 +0000 (UTC)
Date: Mon, 1 May 2023 11:30:59 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 05/20] test-bdrv-drain: Don't modify the graph in
 coroutines
Message-ID: <20230501153059.GG14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-6-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3ZAOzW7Y/3VGwRny"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-6-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--3ZAOzW7Y/3VGwRny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:43PM +0200, Kevin Wolf wrote:
> test-bdrv-drain contains a few test cases that are run both in coroutine
> and non-coroutine context. Running the entire code including the setup
> and shutdown in coroutines is incorrect because graph modifications can
> generally not happen in coroutines.
>=20
> Change the test so that creating and destroying the test nodes and
> BlockBackends always happens outside of coroutine context.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/unit/test-bdrv-drain.c | 112 +++++++++++++++++++++++------------
>  1 file changed, 75 insertions(+), 37 deletions(-)
>=20
> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> index d9d3807062..765ae382da 100644
> --- a/tests/unit/test-bdrv-drain.c
> +++ b/tests/unit/test-bdrv-drain.c
> @@ -188,6 +188,25 @@ static void do_drain_begin_unlocked(enum drain_type =
drain_type, BlockDriverState
>      }
>  }
> =20
> +static BlockBackend * no_coroutine_fn test_setup(void)
> +{
> +    BlockBackend *blk;
> +    BlockDriverState *bs, *backing;
> +
> +    blk =3D blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
> +    bs =3D bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
> +                              &error_abort);
> +    blk_insert_bs(blk, bs, &error_abort);
> +
> +    backing =3D bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_ab=
ort);
> +    bdrv_set_backing_hd(bs, backing, &error_abort);
> +
> +    bdrv_unref(backing);
> +    bdrv_unref(bs);
> +
> +    return blk;
> +}
> +
>  static void do_drain_end_unlocked(enum drain_type drain_type, BlockDrive=
rState *bs)
>  {
>      if (drain_type !=3D BDRV_DRAIN_ALL) {
> @@ -199,25 +218,19 @@ static void do_drain_end_unlocked(enum drain_type d=
rain_type, BlockDriverState *
>      }
>  }
> =20
> -static void test_drv_cb_common(enum drain_type drain_type, bool recursiv=
e)
> +static void test_drv_cb_common(BlockBackend *blk, enum drain_type drain_=
type,
> +                               bool recursive)
>  {
> -    BlockBackend *blk;
> -    BlockDriverState *bs, *backing;
> +    BlockDriverState *bs =3D blk_bs(blk);
> +    BlockDriverState *backing =3D bs->backing->bs;
>      BDRVTestState *s, *backing_s;
>      BlockAIOCB *acb;
>      int aio_ret;
> =20
>      QEMUIOVector qiov =3D QEMU_IOVEC_INIT_BUF(qiov, NULL, 0);
> =20
> -    blk =3D blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
> -    bs =3D bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
> -                              &error_abort);
>      s =3D bs->opaque;
> -    blk_insert_bs(blk, bs, &error_abort);
> -
> -    backing =3D bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_ab=
ort);
>      backing_s =3D backing->opaque;
> -    bdrv_set_backing_hd(bs, backing, &error_abort);
> =20
>      /* Simple bdrv_drain_all_begin/end pair, check that CBs are called */
>      g_assert_cmpint(s->drain_count, =3D=3D, 0);
> @@ -252,44 +265,53 @@ static void test_drv_cb_common(enum drain_type drai=
n_type, bool recursive)
> =20
>      g_assert_cmpint(s->drain_count, =3D=3D, 0);
>      g_assert_cmpint(backing_s->drain_count, =3D=3D, 0);
> -
> -    bdrv_unref(backing);
> -    bdrv_unref(bs);
> -    blk_unref(blk);
>  }
> =20
>  static void test_drv_cb_drain_all(void)
>  {
> -    test_drv_cb_common(BDRV_DRAIN_ALL, true);
> +    BlockBackend *blk =3D test_setup();
> +    test_drv_cb_common(blk, BDRV_DRAIN_ALL, true);
> +    blk_unref(blk);
>  }
> =20
>  static void test_drv_cb_drain(void)
>  {
> -    test_drv_cb_common(BDRV_DRAIN, false);
> +    BlockBackend *blk =3D test_setup();
> +    test_drv_cb_common(blk, BDRV_DRAIN, false);
> +    blk_unref(blk);
> +}
> +
> +static void test_drv_cb_co_drain_all_entry(void)

Missing coroutine_fn.

> +{
> +    BlockBackend *blk =3D blk_all_next(NULL);
> +    test_drv_cb_common(blk, BDRV_DRAIN_ALL, true);
>  }
> =20
>  static void test_drv_cb_co_drain_all(void)
>  {
> -    call_in_coroutine(test_drv_cb_drain_all);
> +    BlockBackend *blk =3D test_setup();
> +    call_in_coroutine(test_drv_cb_co_drain_all_entry);
> +    blk_unref(blk);
>  }
> =20
> -static void test_drv_cb_co_drain(void)
> +static void test_drv_cb_co_drain_entry(void)

Missing coroutine_fn.

>  {
> -    call_in_coroutine(test_drv_cb_drain);
> +    BlockBackend *blk =3D blk_all_next(NULL);
> +    test_drv_cb_common(blk, BDRV_DRAIN, false);
>  }
> =20
> -static void test_quiesce_common(enum drain_type drain_type, bool recursi=
ve)
> +static void test_drv_cb_co_drain(void)
>  {
> -    BlockBackend *blk;
> -    BlockDriverState *bs, *backing;
> -
> -    blk =3D blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
> -    bs =3D bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
> -                              &error_abort);
> -    blk_insert_bs(blk, bs, &error_abort);
> +    BlockBackend *blk =3D test_setup();
> +    call_in_coroutine(test_drv_cb_co_drain_entry);
> +    blk_unref(blk);
> +}
> =20
> -    backing =3D bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_ab=
ort);
> -    bdrv_set_backing_hd(bs, backing, &error_abort);
> +static void test_quiesce_common(BlockBackend *blk, enum drain_type drain=
_type,
> +                                bool recursive)
> +{
> +    BlockDriverState *bs =3D blk_bs(blk);
> +    BlockDriverState *backing =3D bs->backing->bs;
> =20
>      g_assert_cmpint(bs->quiesce_counter, =3D=3D, 0);
>      g_assert_cmpint(backing->quiesce_counter, =3D=3D, 0);
> @@ -307,30 +329,46 @@ static void test_quiesce_common(enum drain_type dra=
in_type, bool recursive)
> =20
>      g_assert_cmpint(bs->quiesce_counter, =3D=3D, 0);
>      g_assert_cmpint(backing->quiesce_counter, =3D=3D, 0);
> -
> -    bdrv_unref(backing);
> -    bdrv_unref(bs);
> -    blk_unref(blk);
>  }
> =20
>  static void test_quiesce_drain_all(void)
>  {
> -    test_quiesce_common(BDRV_DRAIN_ALL, true);
> +    BlockBackend *blk =3D test_setup();
> +    test_quiesce_common(blk, BDRV_DRAIN_ALL, true);
> +    blk_unref(blk);
>  }
> =20
>  static void test_quiesce_drain(void)
>  {
> -    test_quiesce_common(BDRV_DRAIN, false);
> +    BlockBackend *blk =3D test_setup();
> +    test_quiesce_common(blk, BDRV_DRAIN, false);
> +    blk_unref(blk);
> +}
> +
> +static void test_quiesce_co_drain_all_entry(void)

Missing coroutine_fn.

> +{
> +    BlockBackend *blk =3D blk_all_next(NULL);
> +    test_quiesce_common(blk, BDRV_DRAIN_ALL, true);
>  }
> =20
>  static void test_quiesce_co_drain_all(void)
>  {
> -    call_in_coroutine(test_quiesce_drain_all);
> +    BlockBackend *blk =3D test_setup();
> +    call_in_coroutine(test_quiesce_co_drain_all_entry);
> +    blk_unref(blk);
> +}
> +
> +static void test_quiesce_co_drain_entry(void)

Missing coroutine_fn.

> +{
> +    BlockBackend *blk =3D blk_all_next(NULL);
> +    test_quiesce_common(blk, BDRV_DRAIN, false);
>  }
> =20
>  static void test_quiesce_co_drain(void)
>  {
> -    call_in_coroutine(test_quiesce_drain);
> +    BlockBackend *blk =3D test_setup();
> +    call_in_coroutine(test_quiesce_co_drain_entry);
> +    blk_unref(blk);
>  }
> =20
>  static void test_nested(void)
> --=20
> 2.40.0
>=20

--3ZAOzW7Y/3VGwRny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP2zMACgkQnKSrs4Gr
c8i4YQgAhSAZtITHzIX52aU7dDtyHVqbZXAdNT9CRPMoA9T03EaeJCqaY+jky5oe
SrJYJ3PDiHKhSvtDknaQrtB8ZPKsoEg0nzuOs1abS/+Mf6N8okkwuMEiPgvIqHh8
ux+ONNZNNRxgl3n8fLFCFIiW90+fuqgNfxPMlORWZA8GhYVWRjuXO+wYcGdaO0Mc
zkFy8HO958w//3bL+rsUfeDGoZcnYo/gYntUrig+YN+NK7fDmDwd/c+1zVFFK6AE
Hm4/REO8kDWMEFs4JyfVuY/Jx0ZPe/9KIaYHtfIBMDZ7rNuh/eQYE2NhMEhONm/W
UycKV4kGFIunRzq+BpPuC+aSSUCc2A==
=R/R1
-----END PGP SIGNATURE-----

--3ZAOzW7Y/3VGwRny--


