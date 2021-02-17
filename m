Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948531D9AD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:44:05 +0100 (CET)
Received: from localhost ([::1]:39366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMBY-0008As-4K
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCM9M-0007FJ-Bd
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:41:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCM9J-0006Vp-Jb
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613565704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o7pHnryK4vudTBjeC8f619X85eskd6tV+DbXH60fnEw=;
 b=Z0IdcWDxeWRmyn5JymTTYuKp2AeJlSTnmhdUgbFtjuGynMcEtTIdOloDiPjRmek4jN6BGN
 AEQFWoUfJdHlr1dlOhZjmi/uc+LUOBli/1e/jm8+uh8sEAVwrDBR4VfS9tm4EA31Q4C/Jl
 nbB7vHFgXCFXqeevouPfwosaAvzxfgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-0GUgyPcyPuuw-vrWj6oRWg-1; Wed, 17 Feb 2021 07:41:42 -0500
X-MC-Unique: 0GUgyPcyPuuw-vrWj6oRWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED15191276;
 Wed, 17 Feb 2021 12:41:40 +0000 (UTC)
Received: from localhost (ovpn-115-102.ams2.redhat.com [10.36.115.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 128B018B5E;
 Wed, 17 Feb 2021 12:41:35 +0000 (UTC)
Date: Wed, 17 Feb 2021 12:41:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v2 2/7] virtio: Add virtio_queue_host_notifier_status
Message-ID: <20210217124134.GD269203@stefanha-x1.localdomain>
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-3-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209153757.1653598-3-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 04:37:52PM +0100, Eugenio P=E9rez wrote:
> This allows shadow virtqueue code to assert the queue status before
> making changes.
>=20
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/virtio.h | 1 +
>  hw/virtio/virtio.c         | 5 +++++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b7ece7a6a8..227cec13a8 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -316,6 +316,7 @@ void virtio_device_release_ioeventfd(VirtIODevice *vd=
ev);
>  bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
>  EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
>  void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)=
;
> +bool virtio_queue_host_notifier_status(const VirtQueue *vq);
>  void virtio_queue_host_notifier_read(EventNotifier *n);
>  void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContex=
t *ctx,
>                                                  VirtIOHandleAIOOutput ha=
ndle_output);
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 1fd1917ca0..53473ae4df 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3594,6 +3594,11 @@ EventNotifier *virtio_queue_get_host_notifier(Virt=
Queue *vq)
>      return &vq->host_notifier;
>  }
> =20
> +bool virtio_queue_host_notifier_status(const VirtQueue *vq)
> +{
> +    return vq->host_notifier_enabled;
> +}
> +
>  void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)

Since there is a virtio_queue_set_host_notifier_enabled() I suggest
calling this function virtio_queue_is_host_notifier_enabled() or
virtio_queue_get_host_notifier_enabled(). That way it's clear they
set/get the same thing.

Stefan

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAtDv4ACgkQnKSrs4Gr
c8jhrAgAlJQwWJbQYjx47mMJ+bFY4vIRCvNQ3f/HF9peIeT8o5se2dn0Gz+VOEr9
1tu8Jf+TzFZgbQ2W8aEoErRF2i02lVU/eMKdnyunQzg6tZR5JFx2Cbepb6P4Dg+t
yTL9xjzsJCJpBEeZfURzv7FE/CXDz3U/noLZMr1dlQOPqzYGmQbBnHoCt39dLNHK
u73peJWPVrU1pK/u/dNWvGXswN9zjYS/aLTPlqEZ1Dwm1A7gZy6sYm5JuJnocEtr
3fKfBNpa25P9RjK5U1Zr6rK/dI9vYNjgA6KeN1Ue7oioBmNG6E1dA+TUhrhChIw+
SCmXF2F/cfDF4O45jaymVRW4pGqSoA==
=iuaX
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--


