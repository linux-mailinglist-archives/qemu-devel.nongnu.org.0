Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D96664F6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 21:46:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFhxJ-0001FB-RE; Wed, 11 Jan 2023 15:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pFhxI-0001En-2s
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 15:44:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pFhxG-0007Pw-2Y
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 15:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673469852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=olh93PeqHrCcMQX44E2c+kVw3NcIDuypCAUt97+v0WA=;
 b=UBg6HFGEz/WIbYHuDA6UsSXVRgJVUzTDDO4UL+j0GycmIVBzyOvS9+4MB0j6XUwS37EQbQ
 2UFiqoofp67AieQfBwyJNY7EORjZlqYE5iEgTk1kVCQpRl+3btNxn4XsRZevO+/bdbdFRG
 rEFPKltt8mvnbV4sUJzc0MVMcGi2Oks=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-qveNCBRjO0Kf_YkRptfEMw-1; Wed, 11 Jan 2023 15:44:10 -0500
X-MC-Unique: qveNCBRjO0Kf_YkRptfEMw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9998B29AA383;
 Wed, 11 Jan 2023 20:44:10 +0000 (UTC)
Received: from localhost (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2FCD492B00;
 Wed, 11 Jan 2023 20:44:09 +0000 (UTC)
Date: Wed, 11 Jan 2023 15:44:07 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, eesposit@redhat.com,
 kwolf@redhat.com
Subject: Re: [PATCH 11/15] block-backend: make queued_requests thread-safe
Message-ID: <Y78fl4ahsTl70Ok0@fedora>
References: <20221212125920.248567-1-pbonzini@redhat.com>
 <20221212125920.248567-12-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SPXQdIMgTbml5iA2"
Content-Disposition: inline
In-Reply-To: <20221212125920.248567-12-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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


--SPXQdIMgTbml5iA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2022 at 01:59:16PM +0100, Paolo Bonzini wrote:
> Protect quiesce_counter and queued_requests with a QemuMutex, so that
> they are protected from concurrent access in the main thread (for example
> blk_root_drained_end() reached from bdrv_drain_all()) and in the iothread
> (where any I/O operation will call blk_inc_in_flight()).
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c | 44 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 8 deletions(-)
>=20
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 627d491d4155..fdf82f1f1599 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -23,6 +23,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-block.h"
>  #include "qemu/id.h"
> +#include "qemu/thread.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/option.h"
>  #include "trace.h"
> @@ -85,6 +86,8 @@ struct BlockBackend {
>      NotifierList remove_bs_notifiers, insert_bs_notifiers;
>      QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;
> =20
> +    /* Protected by quiesce_lock.  */
> +    QemuMutex quiesce_lock;
>      int quiesce_counter;
>      CoQueue queued_requests;
> =20
> @@ -372,6 +375,7 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm,=
 uint64_t shared_perm)
> =20
>      block_acct_init(&blk->stats);
> =20
> +    qemu_mutex_init(&blk->quiesce_lock);
>      qemu_co_queue_init(&blk->queued_requests);
>      notifier_list_init(&blk->remove_bs_notifiers);
>      notifier_list_init(&blk->insert_bs_notifiers);
> @@ -490,6 +494,7 @@ static void blk_delete(BlockBackend *blk)
>      assert(QLIST_EMPTY(&blk->insert_bs_notifiers.notifiers));
>      assert(QLIST_EMPTY(&blk->aio_notifiers));
>      QTAILQ_REMOVE(&block_backends, blk, link);
> +    qemu_mutex_destroy(&blk->quiesce_lock);
>      drive_info_del(blk->legacy_dinfo);
>      block_acct_cleanup(&blk->stats);
>      g_free(blk);
> @@ -1451,11 +1456,25 @@ void blk_inc_in_flight(BlockBackend *blk)
>  {
>      IO_CODE();
>      qatomic_inc(&blk->in_flight);
> -    if (!blk->disable_request_queuing) {
> -        /* TODO: this is not thread-safe! */
> +
> +    /*
> +     * Avoid a continuous stream of requests from AIO callbacks, which
> +     * call a user-provided callback while blk->in_flight is elevated,
> +     * if the BlockBackend is being quiesced.
> +     *
> +     * This initial test does not have to be perfect: a race might
> +     * cause an extra I/O to be queued, but sooner or later a nonzero
> +     * quiesce_counter will be observed.
> +     */
> +    if (!blk->disable_request_queuing && qatomic_read(&blk->quiesce_coun=
ter)) {
> +        /*
> +         * ... on the other hand, it is important that the final check a=
nd
> +	 * the wait are done under the lock, so that no wakeups are missed.
> +         */
> +        QEMU_LOCK_GUARD(&blk->quiesce_lock);
>          while (blk->quiesce_counter) {
>              qatomic_dec(&blk->in_flight);
> -            qemu_co_queue_wait(&blk->queued_requests, NULL);
> +            qemu_co_queue_wait(&blk->queued_requests, &blk->quiesce_lock=
);
>              qatomic_inc(&blk->in_flight);
>          }
>      }
> @@ -2542,7 +2561,8 @@ static void blk_root_drained_begin(BdrvChild *child)
>      BlockBackend *blk =3D child->opaque;
>      ThrottleGroupMember *tgm =3D &blk->public.throttle_group_member;
> =20
> -    if (++blk->quiesce_counter =3D=3D 1) {
> +    qatomic_set(&blk->quiesce_counter, blk->quiesce_counter + 1);

Can drained begin race with drained end? If yes, then this atomic set
looks racy because drained end might be updating the counter at around
the same time. We should probably hold quiesce_lock?

> +    if (blk->quiesce_counter =3D=3D 1) {
>          if (blk->dev_ops && blk->dev_ops->drained_begin) {
>              blk->dev_ops->drained_begin(blk->dev_opaque);
>          }
> @@ -2560,6 +2580,7 @@ static bool blk_root_drained_poll(BdrvChild *child)
>  {
>      BlockBackend *blk =3D child->opaque;
>      bool busy =3D false;
> +
>      assert(blk->quiesce_counter);
> =20
>      if (blk->dev_ops && blk->dev_ops->drained_poll) {
> @@ -2576,14 +2597,21 @@ static void blk_root_drained_end(BdrvChild *child)
>      assert(blk->public.throttle_group_member.io_limits_disabled);
>      qatomic_dec(&blk->public.throttle_group_member.io_limits_disabled);
> =20
> -    if (--blk->quiesce_counter =3D=3D 0) {
> +    qemu_mutex_lock(&blk->quiesce_lock);
> +    qatomic_set(&blk->quiesce_counter, blk->quiesce_counter - 1);
> +    if (blk->quiesce_counter =3D=3D 0) {
> +        /* After this point, new I/O will not sleep on queued_requests. =
 */
> +        qemu_mutex_unlock(&blk->quiesce_lock);
> +
>          if (blk->dev_ops && blk->dev_ops->drained_end) {
>              blk->dev_ops->drained_end(blk->dev_opaque);
>          }
> -        while (qemu_co_enter_next(&blk->queued_requests, NULL)) {
> -            /* Resume all queued requests */
> -        }
> +
> +        /* Now resume all queued requests */
> +        qemu_mutex_lock(&blk->quiesce_lock);
> +        qemu_co_enter_all(&blk->queued_requests, &blk->quiesce_lock);
>      }
> +    qemu_mutex_unlock(&blk->quiesce_lock);
>  }
> =20
>  bool blk_register_buf(BlockBackend *blk, void *host, size_t size, Error =
**errp)
> --=20
> 2.38.1

--SPXQdIMgTbml5iA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmO/H5cACgkQnKSrs4Gr
c8hrJQgAtqlIizJnKMGsAaw+BKVZiB5hPfbwz9x9HPS75UhOhJlaOwxOUNTjRMJY
HXjKkXoi+gd6kKG6AdW6xHMJCx4Prq6xzwnUL+LcdKq2PFr04keInIj6wCd2NqCM
nXrb2VGI7lXuCObImTtu+XJdaBmKUf16P7D5E3LecaH5O2btit32Rl7Owz5oO+/b
/VT1DRsfeSDB+JKHXsv59pVQAnga/QuxBHlGiyTNxA7BdwB2lwRovL8/2Zy++cT/
Tbv5CxvAS/7rftcBXTqNgXSaVxk+Zl3Np4ysqxm+Y73WNndkkEst6FXRW1/+VL4m
PLGqE1YE8D5w/HJjVmqmv3IMJ6cKNQ==
=QhFI
-----END PGP SIGNATURE-----

--SPXQdIMgTbml5iA2--


