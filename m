Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D715135D9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:57:28 +0200 (CEST)
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4e7-000693-RZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk4cW-0005EL-Ma
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk4cT-00069A-GB
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651154144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=INpV1U/8tL7c6+DXXjVUYPR2mKOOEUuaRe18Q4IwKoo=;
 b=L6708EJEhv95H4/S2JfluXRB1SrhZX0LiupdzGAXC/1rpan/lFmGoS6lGts0TF7I4bmg59
 8KLilc0a13fLcqOE/9+6+pPMEbOeZUF8b3jyn8/6M+t9WFCFHw5rR2O6b5A4GdMq99XoWn
 uy3bMWpuqZirePYv4Xd+xG99EvslZL4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-QrDb-t17PzmewVWLGw7nyA-1; Thu, 28 Apr 2022 09:55:36 -0400
X-MC-Unique: QrDb-t17PzmewVWLGw7nyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6622486B8A8;
 Thu, 28 Apr 2022 13:55:36 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF452C2813B;
 Thu, 28 Apr 2022 13:55:35 +0000 (UTC)
Date: Thu, 28 Apr 2022 14:55:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 5/8] block.c: wrlock in bdrv_replace_child_noperm
Message-ID: <Ymqc1nkfoQaW9J2L@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oxDTZj2CTxLZU56N"
Content-Disposition: inline
In-Reply-To: <20220426085114.199647-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oxDTZj2CTxLZU56N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 04:51:11AM -0400, Emanuele Giuseppe Esposito wrote:
> The only problem here is ->attach and ->detach callbacks
> could call bdrv_{un}apply_subtree_drain(), which itself
> will use a rdlock to navigate through all nodes.
> To avoid deadlocks, take the lock only outside the drains,
> and if we need to both attach and detach, do it in a single
> critical section.
>=20
> Therefore change ->attach and ->detach to return true if they
> are modifying the lock, so that we don't take it twice or release
> temporarly.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c                          | 31 +++++++++++++++++++++++++++----
>  block/block-backend.c            |  6 ++++--
>  include/block/block_int-common.h |  8 ++++++--
>  3 files changed, 37 insertions(+), 8 deletions(-)
>=20
> diff --git a/block.c b/block.c
> index b2eb679abb..6cd87e8dd3 100644
> --- a/block.c
> +++ b/block.c
> @@ -1434,21 +1434,26 @@ static void bdrv_inherited_options(BdrvChildRole =
role, bool parent_is_format,
>      *child_flags =3D flags;
>  }
> =20
> -static void bdrv_child_cb_attach(BdrvChild *child)
> +static bool bdrv_child_cb_attach(BdrvChild *child)
>  {
>      BlockDriverState *bs =3D child->opaque;
> =20
>      assert_bdrv_graph_writable(bs);
>      QLIST_INSERT_HEAD(&bs->children, child, next);
> =20
> +    /* Paired with bdrv_graph_wrlock() in bdrv_replace_child_noperm */
> +    bdrv_graph_wrunlock();
> +
>      if (child->role & BDRV_CHILD_COW) {
>          bdrv_backing_attach(child);
>      }
> =20
>      bdrv_apply_subtree_drain(child, bs);
> +
> +    return true;
>  }
> =20
> -static void bdrv_child_cb_detach(BdrvChild *child)
> +static bool bdrv_child_cb_detach(BdrvChild *child)
>  {
>      BlockDriverState *bs =3D child->opaque;
> =20
> @@ -1458,8 +1463,13 @@ static void bdrv_child_cb_detach(BdrvChild *child)
> =20
>      bdrv_unapply_subtree_drain(child, bs);
> =20
> +    /* Paired with bdrv_graph_wrunlock() in bdrv_replace_child_noperm */
> +    bdrv_graph_wrlock();
> +
>      assert_bdrv_graph_writable(bs);
>      QLIST_REMOVE(child, next);
> +
> +    return true;
>  }
> =20
>  static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState =
*base,
> @@ -2842,6 +2852,7 @@ static void bdrv_replace_child_noperm(BdrvChild **c=
hildp,
>      BlockDriverState *old_bs =3D child->bs;
>      int new_bs_quiesce_counter;
>      int drain_saldo;
> +    bool locked =3D false;
> =20
>      assert(!child->frozen);
>      assert(old_bs !=3D new_bs);
> @@ -2868,8 +2879,12 @@ static void bdrv_replace_child_noperm(BdrvChild **=
childp,
>           * are already gone and we only end the drain sections that came=
 from
>           * elsewhere. */
>          if (child->klass->detach) {
> -            child->klass->detach(child);
> +            locked =3D child->klass->detach(child);
> +        }
> +        if (!locked) {
> +            bdrv_graph_wrlock();
>          }
> +        locked =3D true;
>          assert_bdrv_graph_writable(old_bs);
>          QLIST_REMOVE(child, next_parent);
>      }
> @@ -2880,6 +2895,10 @@ static void bdrv_replace_child_noperm(BdrvChild **=
childp,
>      }
> =20
>      if (new_bs) {
> +        if (!locked) {
> +            bdrv_graph_wrlock();
> +            locked =3D true;
> +        }
>          assert_bdrv_graph_writable(new_bs);
>          QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
> =20
> @@ -2896,10 +2915,14 @@ static void bdrv_replace_child_noperm(BdrvChild *=
*childp,
>           * drain sections coming from @child don't get an extra .drained=
_begin
>           * callback. */
>          if (child->klass->attach) {
> -            child->klass->attach(child);
> +            locked =3D !(child->klass->attach(child));

O_O I don't understand what the return value of ->attach() means. It has
the opposite meaning to the return value of ->detach()?

>          }
>      }
> =20
> +    if (locked) {
> +        bdrv_graph_wrunlock();
> +    }
> +
>      /*
>       * If the old child node was drained but the new one is not, allow
>       * requests to come in only after the new node has been attached.
> diff --git a/block/block-backend.c b/block/block-backend.c
> index e0e1aff4b1..5dbd9fceae 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -282,7 +282,7 @@ static int blk_root_inactivate(BdrvChild *child)
>      return 0;
>  }
> =20
> -static void blk_root_attach(BdrvChild *child)
> +static bool blk_root_attach(BdrvChild *child)
>  {
>      BlockBackend *blk =3D child->opaque;
>      BlockBackendAioNotifier *notifier;
> @@ -295,9 +295,10 @@ static void blk_root_attach(BdrvChild *child)
>                  notifier->detach_aio_context,
>                  notifier->opaque);
>      }
> +    return false;
>  }
> =20
> -static void blk_root_detach(BdrvChild *child)
> +static bool blk_root_detach(BdrvChild *child)
>  {
>      BlockBackend *blk =3D child->opaque;
>      BlockBackendAioNotifier *notifier;
> @@ -310,6 +311,7 @@ static void blk_root_detach(BdrvChild *child)
>                  notifier->detach_aio_context,
>                  notifier->opaque);
>      }
> +    return false;
>  }
> =20
>  static AioContext *blk_root_get_parent_aio_context(BdrvChild *c)
> diff --git a/include/block/block_int-common.h b/include/block/block_int-c=
ommon.h
> index 5a04c778e4..dd058c1fd8 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -857,8 +857,12 @@ struct BdrvChildClass {
>      void (*activate)(BdrvChild *child, Error **errp);
>      int (*inactivate)(BdrvChild *child);
> =20
> -    void (*attach)(BdrvChild *child);
> -    void (*detach)(BdrvChild *child);
> +    /*
> +     * Return true if the graph wrlock is taken/released,

What does "taken/released" mean? Does it mean released by attach and
taken by detach?

Also, please document which locks are held when these callbacks are
invoked.

> +     * false if the wrlock state is not changed.
> +     */
> +    bool (*attach)(BdrvChild *child);
> +    bool (*detach)(BdrvChild *child);
> =20
>      /*
>       * Notifies the parent that the filename of its child has changed (e=
=2Eg.
> --=20
> 2.31.1
>=20

--oxDTZj2CTxLZU56N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqnNYACgkQnKSrs4Gr
c8iLAgf+LWN8Xeow6u1D2tt+UY4csinxSq0w69Vwj33DgwYNGNO7W/uqe7XB+5cH
rUbKrrzytdiVzQq46FmgDuStfDmwOl7JJUBquE04Wh/OVgmOIMy4qh6DfEeG5Wfq
mnVFpXSpzvksxRgmiwbIsMB58kE0AVx0bu/lVW2vRwyuPqT9Sp2VMwOQNvyqDXIG
2TpiIwvv/WoMt03XPPoWDAw2WMi/e78vD41rYVl+xwfAISbXtMhfQrgIr+PzdV8j
+uSmdfnvy+olGtM9TigKK3TJDiZaDdQB5mPXElVQGAvDJyq8NI8y7w+fFffVsKg7
CXDiiNhsFKm+JZdburrH9yThjCf9FA==
=B7Nv
-----END PGP SIGNATURE-----

--oxDTZj2CTxLZU56N--


