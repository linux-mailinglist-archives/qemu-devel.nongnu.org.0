Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B3E42123B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:04:45 +0200 (CEST)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPWG-00016Q-6Z
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXPSp-0006fz-5Z
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXPSm-0004DZ-9k
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633359667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nOT2BUI89myo+oDInnDAm/wEN+AbE+0bD4EN9PuaXRM=;
 b=CwpkPjwgYh05WHkCWaKp+f8iW/FFiJBUL6nZaOdIzcG4j4+K1GlL0KJdFZqWTVJjaLZYv+
 e+VYx0RIlz7t3MBfvNhKnzqYz4iSnxG9TyARVAD59zWfqIS4OiCj8udT79f118hfxsI73L
 5ho3eYHGYlJNrUAcIGfnRlIrcdPV2ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-Fi7A_YItPEuRludBUR3vPg-1; Mon, 04 Oct 2021 11:01:05 -0400
X-MC-Unique: Fi7A_YItPEuRludBUR3vPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8101836300;
 Mon,  4 Oct 2021 15:01:04 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23F0F5D9D3;
 Mon,  4 Oct 2021 15:01:03 +0000 (UTC)
Date: Mon, 4 Oct 2021 16:01:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 11/13] virtiofsd: Shutdown notification queue in the end
Message-ID: <YVsXLhZOUOI0Ubha@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-12-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-12-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rAauOsZfXI+2P2RT"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--rAauOsZfXI+2P2RT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:35AM -0400, Vivek Goyal wrote:
> So far we did not have the notion of cross queue traffic. That is, we
> get request on a queue and send back response on same queue. So if a
> request be being processed and at the same time a stop queue request
> comes in, we wait for all pending requests to finish and then queue
> is stopped and associated data structure cleaned.
>=20
> But with notification queue, now it is possible that we get a locking
> request on request queue and send the notification back on a different
> queue (notificaiton queue). This means, we need to make sure that

s/notificaiton/notification/

> notifiation queue has not already been shutdown or is not being

s/notifiation/notification/

> shutdown in parallel while we are trying to send a notification back.
> Otherwise bad things are bound to happen.
>=20
> One way to solve this problem is that stop notification queue in the
> end. First stop hiprio and all request queues. That means by the
> time we are trying to stop notification queue, we know no other
> request can be in progress which can try to send something on
> notification queue.
>=20
> But problem is that currently we don't have any control on in what
> order queues should be stopped. If there was a notion of whole device
> being stopped, then we could decide in what order queues should be
> stopped.
>=20
> Stefan mentioned that there is a command to stop whole device
> VHOST_USER_SET_STATUS but it is not implemented in libvhost-user
> yet. Also we probably could not move away from per queue stop
> logic we have as of now.
>=20
> As an alternative, he said if we stop all queue when qidx 0 is
> being stopped, it should be fine and we can solve the issue of
> notification queue shutdown order.
>=20
> So in this patch I am shutting down all queues when queue 0
> is being shutdown. And also changed shutdown order in such a
> way that notification queue is shutdown last.
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.=
c
> index c67c2e0e7a..a87e88e286 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -826,6 +826,11 @@ static void fv_queue_cleanup_thread(struct fv_VuDev =
*vud, int qidx)
>      assert(qidx < vud->nqueues);
>      ourqi =3D vud->qi[qidx];
> =20
> +    /* Queue is already stopped */
> +    if (!ourqi) {
> +        return;
> +    }
> +
>      /* qidx =3D=3D 1 is the notification queue if notifications are enab=
led */
>      if (!se->notify_enabled || qidx !=3D 1) {
>          /* Kill the thread */
> @@ -847,14 +852,25 @@ static void fv_queue_cleanup_thread(struct fv_VuDev=
 *vud, int qidx)
> =20
>  static void stop_all_queues(struct fv_VuDev *vud)
>  {
> +    struct fuse_session *se =3D vud->se;
> +
>      for (int i =3D 0; i < vud->nqueues; i++) {
>          if (!vud->qi[i]) {
>              continue;
>          }
> =20
> +        /* Shutdown notification queue in the end */
> +        if (se->notify_enabled && i =3D=3D 1) {
> +            continue;
> +        }
>          fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func=
__, i);
>          fv_queue_cleanup_thread(vud, i);
>      }
> +
> +    if (se->notify_enabled) {
> +        fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func=
__, 1);
> +        fv_queue_cleanup_thread(vud, 1);
> +    }
>  }
> =20
>  /* Callback from libvhost-user on start or stop of a queue */
> @@ -934,7 +950,16 @@ static void fv_queue_set_started(VuDev *dev, int qid=
x, bool started)
>           * the queue thread doesn't block in virtio_send_msg().
>           */
>          vu_dispatch_unlock(vud);
> -        fv_queue_cleanup_thread(vud, qidx);
> +
> +        /*
> +         * If queue 0 is being shutdown, treat it as if device is being
> +         * shutdown and stop all queues.
> +         */

Please expand this comment so it's clear why we do this.

--rAauOsZfXI+2P2RT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFbFy4ACgkQnKSrs4Gr
c8h9QAgAo2xf7s3y6KB+tuUW/hFmF5tu1An3P8nwC0b5G4u/PmmuTLDx2DA4981U
0r40ZfA8JJ/6AXTua48TUehuM97qBP1TtNDwdBsJXoobNJaf662n/YWht+snv/2m
ZPecZf+zAI7Jg3qfNBoOGBpFD+I6z1Fx5Vwcz2YLRdIhIu2M3KRUlUtpFLzE5q/j
1K2e0Q1S4tqVzj0hPaDMSiL61ww9vG7F1sngJWU/Ne48AemvBcCOPFqPLrLMJ58B
6H+vRLJCeyDmZ+GnrkfLAul5uIJQiKWPdeUUvRCXA0UPxZovf0aTIVOm0lIBfRuL
aADJzU8FPqjrg/PnG76qgSVY39ypVg==
=PVbP
-----END PGP SIGNATURE-----

--rAauOsZfXI+2P2RT--


