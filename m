Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28FB34FC75
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:18:03 +0200 (CEST)
Received: from localhost ([::1]:53616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRWzC-0003Un-5u
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRWve-0002bl-6d
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:14:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRWvb-0004BH-Cb
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617182058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bXER9d+cUkrKqoQn3Pt2pdwx177mNMtor62wmoeiBBs=;
 b=bgm4OVZb/nJYmzw8QW66Tk0uT7miGS2RQQ2wey3HfqDzRF9c552CPcThuVzF03X8QqlS2C
 N36UuGHemaoMF2lFxluV7+FfunsSItYrKD32nAnNIzZVKtymK9roln1Kxa5q39LaBse8/0
 rhY99sK+0RhHRGplv/mkqSnI1WeXYqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-n7m9HXGBMwCsLXYsIMnpvg-1; Wed, 31 Mar 2021 05:14:13 -0400
X-MC-Unique: n7m9HXGBMwCsLXYsIMnpvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36C98A0CB7;
 Wed, 31 Mar 2021 09:14:12 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE6147943E;
 Wed, 31 Mar 2021 09:14:11 +0000 (UTC)
Date: Wed, 31 Mar 2021 10:14:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: lagarcia@linux.ibm.com
Subject: Re: [PATCH v2] IOMMU not supported by vhost-user.
Message-ID: <YGQ9YhTALf+KSvCf@stefanha-x1.localdomain>
References: <a47b7a5dafcab0f3a662414ba6cbbc7eb280d478.1613591341.git.lagarcia@br.ibm.com>
MIME-Version: 1.0
In-Reply-To: <a47b7a5dafcab0f3a662414ba6cbbc7eb280d478.1613591341.git.lagarcia@br.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pJCjEkHnaL3lmn/n"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: farosas@br.ibm.com, gkurz@redhat.com, Leonardo Garcia <lagarcia@br.ibm.com>,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pJCjEkHnaL3lmn/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2021 at 04:55:12PM -0300, lagarcia@linux.ibm.com wrote:
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 2fdd5daf74..6ab760364b 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1849,6 +1849,13 @@ static int vhost_user_backend_init(struct vhost_de=
v *dev, void *opaque)
>              }
>          }
> =20
> +        if ((dev->vdev !=3D NULL) &&
> +            virtio_host_has_feature(dev->vdev, VIRTIO_F_IOMMU_PLATFORM) =
&&
> +            !(features & (1ULL << VIRTIO_F_IOMMU_PLATFORM))) {
> +            error_report("IOMMU is currently not supported with vhost-us=
er");

I think IOMMU *is* supported by vhost-user. It's just that specific
vhost-user backends might not implement it.

This error message can be made more specific:

  error_report("IOMMU is not supported by the connected vhost-user backend"=
);

Stefan

--pJCjEkHnaL3lmn/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBkPWIACgkQnKSrs4Gr
c8jJ9wf/QqdABW8Qx81mEYW/KXwHo4tn0myI//Oy6sbmEUPUdN/kWaRuvSbNW7/b
ZWFF3zYWFdjhScedkkUFJGzdhA9b2n2EbxOwlTTCfX4NRJZavjuORZkztarTQ1hk
bLwYPooIeNqts0X3uipK95bqyWns3euYI0QKKSxxSkm1GRaKwxHvtXSgniVoHBvz
fm6xvnTFV1xQmGgj7oPndZ9qsG45dbm03gw8O2lBGvWYAlvwYDSqyaDo62m0iFKt
Uev0VqG/Xxkd1LpveHcqd1VOm2egYcp2KdNrz4vGcAs/qO0ktf6DBLlq6qwSUfMP
B+24IzodBTssqlOCdlobxSFYdLdr1A==
=6bjX
-----END PGP SIGNATURE-----

--pJCjEkHnaL3lmn/n--


