Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC01534D610
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:31:15 +0200 (CEST)
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvjO-0007fH-VB
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvQ5-0007eT-DN
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvQ1-0005YE-3f
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:11:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617037868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a7V/YmB0s79Agh2HeiDaIQqLa6BunRJuEJfcwBwWtLg=;
 b=HHNu05ZkThxCMlASSQxr1jHnDmlU4VY2i7Jkpo+8mCkb21tKqsgKSl9gXt2wCiraOLq9sm
 IvU27Ihd0Ebv1kxhz5BwKUxmLj0hkjEaXQZM1ERD9W98QZO1n/QjzgmTXUTyTU6wT2zt6a
 MWdHRgar00AFm+R7tnSx5fa8eYxaDPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-Hsnq_EV2NQiflYRzeQaJUQ-1; Mon, 29 Mar 2021 13:11:04 -0400
X-MC-Unique: Hsnq_EV2NQiflYRzeQaJUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B22CE185302F;
 Mon, 29 Mar 2021 17:11:02 +0000 (UTC)
Received: from localhost (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24CB05C582;
 Mon, 29 Mar 2021 17:10:58 +0000 (UTC)
Date: Mon, 29 Mar 2021 18:10:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 3/8] virtio: Add API to batch set host notifiers
Message-ID: <YGIKIUIJbkNTfXKC@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-4-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210325150735.1098387-4-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N5BpjKXt3q4B8eUX"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--N5BpjKXt3q4B8eUX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 04:07:30PM +0100, Greg Kurz wrote:
> Introduce VirtioBusClass methods to begin and commit a transaction
> of setting/unsetting host notifiers. These handlers will be implemented
> by virtio-pci to batch addition and deletion of ioeventfds for multiqueue
> devices like virtio-scsi-pci or virtio-blk-pci.
>=20
> Convert virtio_bus_set_host_notifiers() to use these handlers. Note that
> virtio_bus_cleanup_host_notifier() closes eventfds, which could still be
> passed to the KVM_IOEVENTFD ioctl() when the transaction ends and fail
> with EBADF. The cleanup of the host notifiers is thus pushed to a
> separate loop in virtio_bus_unset_and_cleanup_host_notifiers(), after
> transaction commit.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/virtio/virtio-bus.h |  4 ++++
>  hw/virtio/virtio-bus.c         | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>=20
> diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bu=
s.h
> index 6d1e4ee3e886..99704b2c090a 100644
> --- a/include/hw/virtio/virtio-bus.h
> +++ b/include/hw/virtio/virtio-bus.h
> @@ -82,6 +82,10 @@ struct VirtioBusClass {
>       */
>      int (*ioeventfd_assign)(DeviceState *d, EventNotifier *notifier,
>                              int n, bool assign);
> +
> +    void (*ioeventfd_assign_begin)(DeviceState *d);
> +    void (*ioeventfd_assign_commit)(DeviceState *d);

Please add doc comments for these new functions.

> +
>      /*
>       * Whether queue number n is enabled.
>       */
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index c9e7cdb5c161..156484c4ca14 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -295,6 +295,28 @@ int virtio_bus_set_host_notifier(VirtioBusState *bus=
, int n, bool assign)
>      return r;
>  }
> =20
> +static void virtio_bus_set_host_notifier_begin(VirtioBusState *bus)
> +{
> +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(bus);
> +    DeviceState *proxy =3D DEVICE(BUS(bus)->parent);
> +
> +    if (k->ioeventfd_assign_begin) {
> +        assert(k->ioeventfd_assign_commit);
> +        k->ioeventfd_assign_begin(proxy);
> +    }
> +}
> +
> +static void virtio_bus_set_host_notifier_commit(VirtioBusState *bus)
> +{
> +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(bus);
> +    DeviceState *proxy =3D DEVICE(BUS(bus)->parent);
> +
> +    if (k->ioeventfd_assign_commit) {
> +        assert(k->ioeventfd_assign_begin);
> +        k->ioeventfd_assign_commit(proxy);
> +    }
> +}
> +
>  void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n)
>  {
>      VirtIODevice *vdev =3D virtio_bus_get_device(bus);
> @@ -308,6 +330,7 @@ void virtio_bus_cleanup_host_notifier(VirtioBusState =
*bus, int n)
>      event_notifier_cleanup(notifier);
>  }
> =20
> +/* virtio_bus_set_host_notifier_begin() must have been called */
>  static void virtio_bus_unset_and_cleanup_host_notifiers(VirtioBusState *=
bus,
>                                                          int nvqs, int n_=
offset)
>  {
> @@ -315,6 +338,10 @@ static void virtio_bus_unset_and_cleanup_host_notifi=
ers(VirtioBusState *bus,
> =20
>      for (i =3D 0; i < nvqs; i++) {
>          virtio_bus_set_host_notifier(bus, i + n_offset, false);
> +    }
> +    /* Let address_space_update_ioeventfds() run before closing ioeventf=
ds */

assert(memory_region_transaction_depth =3D=3D 0)?

> +    virtio_bus_set_host_notifier_commit(bus);
> +    for (i =3D 0; i < nvqs; i++) {
>          virtio_bus_cleanup_host_notifier(bus, i + n_offset);
>      }
>  }
> @@ -327,17 +354,24 @@ int virtio_bus_set_host_notifiers(VirtioBusState *b=
us, int nvqs, int n_offset,
>      int rc;
> =20
>      if (assign) {
> +        virtio_bus_set_host_notifier_begin(bus);
> +
>          for (i =3D 0; i < nvqs; i++) {
>              rc =3D virtio_bus_set_host_notifier(bus, i + n_offset, true)=
;
>              if (rc !=3D 0) {
>                  warn_report_once("%s: Failed to set host notifier (%s).\=
n",
>                                   vdev->name, strerror(-rc));
> =20
> +                /* This also calls virtio_bus_set_host_notifier_commit()=
 */
>                  virtio_bus_unset_and_cleanup_host_notifiers(bus, i, n_of=
fset);
>                  return rc;
>              }
>          }
> +
> +        virtio_bus_set_host_notifier_commit(bus);
>      } else {
> +        virtio_bus_set_host_notifier_begin(bus);
> +        /* This also calls virtio_bus_set_host_notifier_commit() */
>          virtio_bus_unset_and_cleanup_host_notifiers(bus, nvqs, n_offset)=
;
>      }
> =20
> --=20
> 2.26.3
>=20

--N5BpjKXt3q4B8eUX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBiCiEACgkQnKSrs4Gr
c8h6lQgAou2K1bI5TzO22tNKgyuRVQzHQop1uie7HOXWSdv/iO36BnOe06JjQLvl
A5y2C/WYSqC0nvAL810BGv1CzVC0h1icM8zVDmv/21JhnCIM7ng/eWziseGzuXug
gplzz1yHCOuHAGCzJU2PVoqwKDQyxrnjDGvp81BQ/S4+DKyVklF20dsgnDCnA0Vk
z6lXpqPgLKt0BldK5d5eG/07W58v8K/tvs7l+Q/z+QG55iaW3PtsQbqW28S7gHla
EW8waovbepFzcujuibJZozlHmm+0WAj9eFfZJPDy7Ce0vKhOdQPtSBod+y31TNPI
mq5r3IoJ+FxCdzm32iBcDI5y6q7KcA==
=botk
-----END PGP SIGNATURE-----

--N5BpjKXt3q4B8eUX--


