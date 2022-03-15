Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5AB4D9A35
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:18:10 +0100 (CET)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5Bp-0002vt-Ux
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:18:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU531-0005pl-Ou
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:09:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU52x-0005o9-MB
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647342539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P/scX3IDrdNOO9W0lkgNRKbpSO8wMts3IbMfuTMOfKA=;
 b=TgciLBlFSE+q3rWqdl3Pq140DI8pyZ2trnM3YwetPVIAdsGeQlmGGqoE+AlZmZwndBcti6
 NN7mAf4jvoMV4sr6Mo4tTpABV7nKRpX4MZ7p1G/g/DmjLER04d1Dk0aGcF6Q88J17OGp8p
 vV7bHonqCe755IilbmmK+VBJQ+eYGJE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-Ez_ajyQxPcKxe7x0Bw8JxA-1; Tue, 15 Mar 2022 07:08:54 -0400
X-MC-Unique: Ez_ajyQxPcKxe7x0Bw8JxA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0401285A5BE;
 Tue, 15 Mar 2022 11:08:54 +0000 (UTC)
Received: from localhost (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF7177CB83C;
 Tue, 15 Mar 2022 11:08:53 +0000 (UTC)
Date: Tue, 15 Mar 2022 11:08:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v2 4/6] vduse-blk: implements vduse-blk export
Message-ID: <YjBzxAvvUuXBfGPn@stefanha-x1.localdomain>
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-5-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TAWENp0RyGHbcVEL"
Content-Disposition: inline
In-Reply-To: <20220215105943.90-5-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TAWENp0RyGHbcVEL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:59:41PM +0800, Xie Yongji wrote:
> This implements a VDUSE block backends based on
> the libvduse library. We can use it to export the BDSs
> for both VM and container (host) usage.
>=20
> The new command-line syntax is:
>=20
> $ qemu-storage-daemon \
>     --blockdev file,node-name=3Ddrive0,filename=3Dtest.img \
>     --export vduse-blk,node-name=3Ddrive0,id=3Dvduse-export0,writable=3Don
>=20
> After the qemu-storage-daemon started, we need to use
> the "vdpa" command to attach the device to vDPA bus:
>=20
> $ vdpa dev add name vduse-export0 mgmtdev vduse

The per-QEMU export id is used as the global vdpa device name. If this
becomes a problem in the future then a new --export
vduse-blk,vdpa-dev-name=3D option can be added.

> +    case VIRTIO_BLK_T_GET_ID: {
> +        size_t size =3D MIN(iov_size(&elem->in_sg[0], in_num),
> +                          VIRTIO_BLK_ID_BYTES);
> +        snprintf(elem->in_sg[0].iov_base, size, "%s", vblk_exp->export.i=
d);

Please use iov_from_buf(). The driver is allowed to submit as many
in_sg[] elements as it wants and a compliant virtio-blk device
implementation must support that.

Here is the VIRTIO specification section that covers message framing:
https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x=
1-280004

> +    features =3D (1ULL << VIRTIO_F_IOMMU_PLATFORM) |
> +               (1ULL << VIRTIO_F_VERSION_1) |
> +               (1ULL << VIRTIO_RING_F_EVENT_IDX) |
> +               (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
> +               (1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
> +               (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
> +               (1ULL << VIRTIO_BLK_F_SEG_MAX) |
> +               (1ULL << VIRTIO_BLK_F_TOPOLOGY) |
> +               (1ULL << VIRTIO_BLK_F_BLK_SIZE);

The VIRTIO_F_ and VIRTIO_RING_F_ feature bits report the capabilities of
libvduse. They should probably be defined in libvduse. That way no
changes to vduse-blk.c are required when libvduse changes:

  features =3D LIBVDUSE_VIRTIO_FEATURES |
             (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
	     ...;

--TAWENp0RyGHbcVEL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIwc8QACgkQnKSrs4Gr
c8gqTwgAjSdCUjMyErOvsLIrXDi6VVV3DURL6KdUriLWVhbn6yaNu9fvzxqbNIWa
D9Nekhg5/KCAXnwh2nT4SHL8gSBjIAYVnrlFq9JeBZSiW7ydTdzhOXveYG0KRzrX
p73lyVm2OSezXoLiqmx9KxlqVlXvDd5DprH36P0CjDuA4uF68SOFqdBlRjsEG1GR
hA6zvwQcUuG4yPlLC8YfcecYyFARk6NnP0d3D11l4bTdPTlmddQbxzQAhS6/kgFv
ud+GOYeycIPaZg5GgDeR+6iLUsQa+ZDO7HHgHb0C99gtyxpGZttGrYVsjplzrHt+
spLk+JU4ACU6A+DVVPkdt7JQWmRMqw==
=5Kro
-----END PGP SIGNATURE-----

--TAWENp0RyGHbcVEL--


