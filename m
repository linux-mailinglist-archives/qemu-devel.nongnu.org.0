Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF631DE19
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:26:43 +0100 (CET)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQb4-0001qt-V8
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCQYl-0000VM-9p
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:24:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCQYe-0005lX-RZ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613582651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=prGClKEbAowL5m/ig2FN3D1+Kydj3NJLTJWDC/Qhpu4=;
 b=YBsJdxKNlSpVfjsiS/W7QFbwzmOIiz7yc2ywwG71J/ZOsRFq1GR+T4Bh6C8H1tgp5rnC6N
 IVw1vORz/N8NseK1NWk2zpsTmstYiTFj+Fz92brg843MRBxumNGgc3x5QW+FkP/u0s1u8B
 xVqZLksh9O75q48eF0rrsXvMzeurPC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-G3vGFQMOOuygx2x5RO27Hw-1; Wed, 17 Feb 2021 12:24:09 -0500
X-MC-Unique: G3vGFQMOOuygx2x5RO27Hw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CAD3801975;
 Wed, 17 Feb 2021 17:24:07 +0000 (UTC)
Received: from localhost (ovpn-115-102.ams2.redhat.com [10.36.115.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E2D2100164C;
 Wed, 17 Feb 2021 17:24:02 +0000 (UTC)
Date: Wed, 17 Feb 2021 17:24:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v2 7/7] vhost: Route host->guest notification through
 shadow virtqueue
Message-ID: <20210217172401.GI269203@stefanha-x1.localdomain>
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-8-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209153757.1653598-8-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r4QXMf6/kyF/FvJJ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--r4QXMf6/kyF/FvJJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 04:37:57PM +0100, Eugenio P=E9rez wrote:
> @@ -40,6 +42,26 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>      }
>  }
> =20
> +/* Forward vhost notifications */
> +static void vhost_handle_call(EventNotifier *n)

The name vhost_shadow_vq_handle_call() expresses the purpose of the
function more clearly.

> @@ -75,8 +102,19 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
>      /* Check for pending notifications from the guest */
>      vhost_handle_guest_kick(&svq->host_notifier);
> =20
> +    r =3D dev->vhost_ops->vhost_set_vring_call(dev, &call_file);
> +    if (r !=3D 0) {
> +        error_report("Couldn't set call fd: %s", strerror(errno));
> +        goto err_set_vring_call;
> +    }

This ignores notifier_is_masked and always unmasks.

> @@ -1608,6 +1607,10 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, =
VirtIODevice *vdev, int n,
>      if (mask) {
>          assert(vdev->use_guest_notifier_mask);
>          file.fd =3D event_notifier_get_fd(&hdev->vqs[index].masked_notif=
ier);
> +    } else if (hdev->sw_lm_enabled) {
> +        VhostShadowVirtqueue *svq =3D hdev->shadow_vqs[n];
> +        EventNotifier *e =3D vhost_shadow_vq_get_call_notifier(svq);
> +        file.fd =3D event_notifier_get_fd(e);
>      } else {
>          file.fd =3D event_notifier_get_fd(virtio_queue_get_guest_notifie=
r(vvq));
>      }

Maybe you can extend this function so it can be called unconditionally
from both vhost_shadow_vq_start_rcu() and vhost_shadow_vq_stop_rcu(). It
would be a single place that invokes vhost_set_vring_call().

--r4QXMf6/kyF/FvJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAtUTEACgkQnKSrs4Gr
c8hq5gf/WPupi1xYyRBBSPKKAHCQeoJAEdrX2AQe3nE6V1pbI96pK+FAIZ1cxlYV
QHUGQlGN7ng9ajHBviW1upBxIcu5rM5vDG/KyQd71+Dgo1Opjfjm74/YWBF1ppaU
rj0dEkVcP97DsJ4yTJVwncSi9tuG9q4qsGmNforAH1dP2GaU8HjCx/xBEkEcVDGB
u6nUCH8c487YrVrRUos0fvNAnQyJPDs20zHXvo0zunCs8/7FdLjTn5ycQCS9zV9J
d6C7qV0+0gxE5y63qm3rSObzopdICdqRyDvghYs2nr6F4LOdN1F+NJAPXM1tgXDl
uxjmF6VoLMrN2SyW679rk2UJcaak9Q==
=swcz
-----END PGP SIGNATURE-----

--r4QXMf6/kyF/FvJJ--


