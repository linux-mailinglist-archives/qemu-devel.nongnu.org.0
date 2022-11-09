Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD3623663
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 23:15:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ostKg-0002o5-7p; Wed, 09 Nov 2022 17:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ostKe-0002nk-Gw
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:14:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ostKc-0002z9-A8
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668032041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8W80mubGQ6BcERYizMKh7VpwVmz7MsCvQlUhnLE6V6A=;
 b=XIR5bEhJ8aZUMztEhKGIXh3kZx0QgkWUFbqWrcOc8BcQx8LKw6CLopck6v0l0RDGDehHqK
 THGlcc6g8uzHzKwoK1p365FbmpZj3MbioNqfppowk/DwaUgYsg2TeP/6EBhPZZJ/dfl3uo
 dyP7ZeK13+rlO9GfzMxTGYvBhVZqHwQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-P0s2ieIZOM6lggUK1HfNyw-1; Wed, 09 Nov 2022 17:13:57 -0500
X-MC-Unique: P0s2ieIZOM6lggUK1HfNyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14C0386EB21;
 Wed,  9 Nov 2022 22:13:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20869111CA01;
 Wed,  9 Nov 2022 22:13:55 +0000 (UTC)
Date: Wed, 9 Nov 2022 17:13:54 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 03/13] block: Revert .bdrv_drained_begin/end to
 non-coroutine_fn
Message-ID: <Y2wmInwu1OsufgOR@fedora>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-4-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ki6MYUT1w1UqmYIy"
Content-Disposition: inline
In-Reply-To: <20221108123738.530873-4-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--Ki6MYUT1w1UqmYIy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2022 at 01:37:28PM +0100, Kevin Wolf wrote:
> Polling during bdrv_drained_end() can be problematic (and in the future,
> we may get cases for bdrv_drained_begin() where polling is forbidden,
> and we don't care about already in-flight requests, but just want to
> prevent new requests from arriving).
>=20
> The .bdrv_drained_begin/end callbacks running in a coroutine is the only
> reason why we have to do this polling, so make them non-coroutine
> callbacks again. None of the callers actually yield any more.
>=20
> This means that bdrv_drained_end() effectively doesn't poll any more,
> even if AIO_WAIT_WHILE() loops are still there (their condition is false
> from the beginning). This is generally not a problem, but in
> test-bdrv-drain, some additional explicit aio_poll() calls need to be
> added because the test case wants to verify the final state after BHs
> have executed.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block_int-common.h | 10 ++++---
>  block.c                          |  4 +--
>  block/io.c                       | 49 +++++---------------------------
>  block/qed.c                      |  4 +--
>  block/throttle.c                 |  6 ++--
>  tests/unit/test-bdrv-drain.c     | 18 ++++++------
>  6 files changed, 30 insertions(+), 61 deletions(-)

Wow, surprisingly little has to change to make these non-coroutine_fn.

>=20
> diff --git a/include/block/block_int-common.h b/include/block/block_int-c=
ommon.h
> index 5a2cc077a0..0956acbb60 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -735,17 +735,19 @@ struct BlockDriver {
>      void (*bdrv_io_unplug)(BlockDriverState *bs);
> =20
>      /**
> -     * bdrv_co_drain_begin is called if implemented in the beginning of a
> +     * bdrv_drain_begin is called if implemented in the beginning of a
>       * drain operation to drain and stop any internal sources of request=
s in
>       * the driver.
> -     * bdrv_co_drain_end is called if implemented at the end of the drai=
n.
> +     * bdrv_drain_end is called if implemented at the end of the drain.
>       *
>       * They should be used by the driver to e.g. manage scheduled I/O
>       * requests, or toggle an internal state. After the end of the drain=
 new
>       * requests will continue normally.
> +     *
> +     * Implementations of both functions must not call aio_poll().
>       */
> -    void coroutine_fn (*bdrv_co_drain_begin)(BlockDriverState *bs);
> -    void coroutine_fn (*bdrv_co_drain_end)(BlockDriverState *bs);
> +    void (*bdrv_drain_begin)(BlockDriverState *bs);
> +    void (*bdrv_drain_end)(BlockDriverState *bs);
> =20
>      bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
>      bool coroutine_fn (*bdrv_co_can_store_new_dirty_bitmap)(
> diff --git a/block.c b/block.c
> index 3bd594eb2a..fed8077993 100644
> --- a/block.c
> +++ b/block.c
> @@ -1705,8 +1705,8 @@ static int bdrv_open_driver(BlockDriverState *bs, B=
lockDriver *drv,
>      assert(is_power_of_2(bs->bl.request_alignment));
> =20
>      for (i =3D 0; i < bs->quiesce_counter; i++) {
> -        if (drv->bdrv_co_drain_begin) {
> -            drv->bdrv_co_drain_begin(bs);
> +        if (drv->bdrv_drain_begin) {
> +            drv->bdrv_drain_begin(bs);
>          }
>      }
> =20
> diff --git a/block/io.c b/block/io.c
> index 34b30e304e..183b407f5b 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -250,55 +250,20 @@ typedef struct {
>      int *drained_end_counter;
>  } BdrvCoDrainData;
> =20
> -static void coroutine_fn bdrv_drain_invoke_entry(void *opaque)
> -{
> -    BdrvCoDrainData *data =3D opaque;
> -    BlockDriverState *bs =3D data->bs;
> -
> -    if (data->begin) {
> -        bs->drv->bdrv_co_drain_begin(bs);
> -    } else {
> -        bs->drv->bdrv_co_drain_end(bs);
> -    }
> -
> -    /* Set data->done and decrement drained_end_counter before bdrv_wake=
up() */
> -    qatomic_mb_set(&data->done, true);
> -    if (!data->begin) {
> -        qatomic_dec(data->drained_end_counter);
> -    }
> -    bdrv_dec_in_flight(bs);
> -
> -    g_free(data);
> -}
> -
> -/* Recursively call BlockDriver.bdrv_co_drain_begin/end callbacks */
> +/* Recursively call BlockDriver.bdrv_drain_begin/end callbacks */
>  static void bdrv_drain_invoke(BlockDriverState *bs, bool begin,
>                                int *drained_end_counter)
>  {
> -    BdrvCoDrainData *data;
> -
> -    if (!bs->drv || (begin && !bs->drv->bdrv_co_drain_begin) ||
> -            (!begin && !bs->drv->bdrv_co_drain_end)) {
> +    if (!bs->drv || (begin && !bs->drv->bdrv_drain_begin) ||
> +            (!begin && !bs->drv->bdrv_drain_end)) {
>          return;
>      }
> =20
> -    data =3D g_new(BdrvCoDrainData, 1);
> -    *data =3D (BdrvCoDrainData) {
> -        .bs =3D bs,
> -        .done =3D false,
> -        .begin =3D begin,
> -        .drained_end_counter =3D drained_end_counter,
> -    };
> -
> -    if (!begin) {
> -        qatomic_inc(drained_end_counter);
> +    if (begin) {
> +        bs->drv->bdrv_drain_begin(bs);
> +    } else {
> +        bs->drv->bdrv_drain_end(bs);
>      }
> -
> -    /* Make sure the driver callback completes during the polling phase =
for
> -     * drain_begin. */
> -    bdrv_inc_in_flight(bs);
> -    data->co =3D qemu_coroutine_create(bdrv_drain_invoke_entry, data);
> -    aio_co_schedule(bdrv_get_aio_context(bs), data->co);
>  }
> =20
>  /* Returns true if BDRV_POLL_WHILE() should go into a blocking aio_poll(=
) */
> diff --git a/block/qed.c b/block/qed.c
> index 013f826c44..301ff8fd86 100644
> --- a/block/qed.c
> +++ b/block/qed.c
> @@ -365,7 +365,7 @@ static void bdrv_qed_attach_aio_context(BlockDriverSt=
ate *bs,
>      }
>  }
> =20
> -static void coroutine_fn bdrv_qed_co_drain_begin(BlockDriverState *bs)
> +static void bdrv_qed_co_drain_begin(BlockDriverState *bs)

This function needs to be renamed s/_co_//.

>  {
>      BDRVQEDState *s =3D bs->opaque;
> =20
> @@ -1661,7 +1661,7 @@ static BlockDriver bdrv_qed =3D {
>      .bdrv_co_check            =3D bdrv_qed_co_check,
>      .bdrv_detach_aio_context  =3D bdrv_qed_detach_aio_context,
>      .bdrv_attach_aio_context  =3D bdrv_qed_attach_aio_context,
> -    .bdrv_co_drain_begin      =3D bdrv_qed_co_drain_begin,
> +    .bdrv_drain_begin         =3D bdrv_qed_co_drain_begin,
>  };
> =20
>  static void bdrv_qed_init(void)
> diff --git a/block/throttle.c b/block/throttle.c
> index 131eba3ab4..6e3ae1b355 100644
> --- a/block/throttle.c
> +++ b/block/throttle.c
> @@ -214,7 +214,7 @@ static void throttle_reopen_abort(BDRVReopenState *re=
open_state)
>      reopen_state->opaque =3D NULL;
>  }
> =20
> -static void coroutine_fn throttle_co_drain_begin(BlockDriverState *bs)
> +static void throttle_co_drain_begin(BlockDriverState *bs)

Same here.

>  {
>      ThrottleGroupMember *tgm =3D bs->opaque;
>      if (qatomic_fetch_inc(&tgm->io_limits_disabled) =3D=3D 0) {
> @@ -261,8 +261,8 @@ static BlockDriver bdrv_throttle =3D {
>      .bdrv_reopen_commit                 =3D   throttle_reopen_commit,
>      .bdrv_reopen_abort                  =3D   throttle_reopen_abort,
> =20
> -    .bdrv_co_drain_begin                =3D   throttle_co_drain_begin,
> -    .bdrv_co_drain_end                  =3D   throttle_co_drain_end,

Is throttle_co_drain_end() still marked coroutine_fn? It also need to be
renamed to throttle_drain_end().

> +    .bdrv_drain_begin                   =3D   throttle_co_drain_begin,
> +    .bdrv_drain_end                     =3D   throttle_co_drain_end,
> =20
>      .is_filter                          =3D   true,
>      .strong_runtime_opts                =3D   throttle_strong_runtime_op=
ts,
> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> index 24f34e24ad..695519ee02 100644
> --- a/tests/unit/test-bdrv-drain.c
> +++ b/tests/unit/test-bdrv-drain.c
> @@ -46,7 +46,7 @@ static void coroutine_fn sleep_in_drain_begin(void *opa=
que)
>      bdrv_dec_in_flight(bs);
>  }
> =20
> -static void coroutine_fn bdrv_test_co_drain_begin(BlockDriverState *bs)
> +static void bdrv_test_drain_begin(BlockDriverState *bs)
>  {
>      BDRVTestState *s =3D bs->opaque;
>      s->drain_count++;
> @@ -57,7 +57,7 @@ static void coroutine_fn bdrv_test_co_drain_begin(Block=
DriverState *bs)
>      }
>  }
> =20
> -static void coroutine_fn bdrv_test_co_drain_end(BlockDriverState *bs)
> +static void bdrv_test_drain_end(BlockDriverState *bs)
>  {
>      BDRVTestState *s =3D bs->opaque;
>      s->drain_count--;
> @@ -111,8 +111,8 @@ static BlockDriver bdrv_test =3D {
>      .bdrv_close             =3D bdrv_test_close,
>      .bdrv_co_preadv         =3D bdrv_test_co_preadv,
> =20
> -    .bdrv_co_drain_begin    =3D bdrv_test_co_drain_begin,
> -    .bdrv_co_drain_end      =3D bdrv_test_co_drain_end,
> +    .bdrv_drain_begin       =3D bdrv_test_drain_begin,
> +    .bdrv_drain_end         =3D bdrv_test_drain_end,
> =20
>      .bdrv_child_perm        =3D bdrv_default_perms,
> =20
> @@ -1703,6 +1703,7 @@ static void test_blockjob_commit_by_drained_end(voi=
d)
>      bdrv_drained_begin(bs_child);
>      g_assert(!job_has_completed);
>      bdrv_drained_end(bs_child);
> +    aio_poll(qemu_get_aio_context(), false);
>      g_assert(job_has_completed);
> =20
>      bdrv_unref(bs_parents[0]);
> @@ -1858,6 +1859,7 @@ static void test_drop_intermediate_poll(void)
> =20
>      g_assert(!job_has_completed);
>      ret =3D bdrv_drop_intermediate(chain[1], chain[0], NULL);
> +    aio_poll(qemu_get_aio_context(), false);
>      g_assert(ret =3D=3D 0);
>      g_assert(job_has_completed);
> =20
> @@ -1946,7 +1948,7 @@ static void coroutine_fn bdrv_replace_test_drain_co=
(void *opaque)
>   * .was_drained.
>   * Increment .drain_count.
>   */
> -static void coroutine_fn bdrv_replace_test_co_drain_begin(BlockDriverSta=
te *bs)
> +static void bdrv_replace_test_drain_begin(BlockDriverState *bs)
>  {
>      BDRVReplaceTestState *s =3D bs->opaque;
> =20
> @@ -1977,7 +1979,7 @@ static void coroutine_fn bdrv_replace_test_read_ent=
ry(void *opaque)
>   * If .drain_count reaches 0 and the node has a backing file, issue a
>   * read request.
>   */
> -static void coroutine_fn bdrv_replace_test_co_drain_end(BlockDriverState=
 *bs)
> +static void bdrv_replace_test_drain_end(BlockDriverState *bs)
>  {
>      BDRVReplaceTestState *s =3D bs->opaque;
> =20
> @@ -2002,8 +2004,8 @@ static BlockDriver bdrv_replace_test =3D {
>      .bdrv_close             =3D bdrv_replace_test_close,
>      .bdrv_co_preadv         =3D bdrv_replace_test_co_preadv,
> =20
> -    .bdrv_co_drain_begin    =3D bdrv_replace_test_co_drain_begin,
> -    .bdrv_co_drain_end      =3D bdrv_replace_test_co_drain_end,
> +    .bdrv_drain_begin       =3D bdrv_replace_test_drain_begin,
> +    .bdrv_drain_end         =3D bdrv_replace_test_drain_end,
> =20
>      .bdrv_child_perm        =3D bdrv_default_perms,
>  };
> --=20
> 2.38.1
>=20

--Ki6MYUT1w1UqmYIy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNsJiIACgkQnKSrs4Gr
c8iolwgAwJK/Px9p2VNLJoke7suTkUqQFC/mTWcowjNjjPnou9/atfu68O/JIX13
zzeDH/P1BLSma2+SsHgEMhiXgXrR1Em58rFMh0jmS07PnEfd4KvNsrQnvE/odCMA
ivmwDeTQf+kzmOjWYh/QZDd1hEEQUIg0cHBUlpU8VHmeR5tOoSnHkMfxaPq86hw4
OgUl8J4J7ziHT6buOgEvtyxL4OQ42YUxjc5E/yyoxG06tjcXRl0ZOPe5NFDw+o7q
FwZIQLYV1TuIwiz67oFygXuHHGpTc6a9s18NDvrSc//fkvySSWZ5qHdyD8uKNZE/
/JOwyWpcSY3kAhJlZrBmPto4hBo0sw==
=arbP
-----END PGP SIGNATURE-----

--Ki6MYUT1w1UqmYIy--


