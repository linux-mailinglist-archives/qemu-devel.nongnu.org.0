Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C63188D6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:00:00 +0100 (CET)
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9hX-00051E-TV
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA9ft-0004SC-1w
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:58:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA9fm-0007lK-V1
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613041088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0he4+2eZwGD3CFePFY/pIAu7o/38P7ohkkDvtz60dd4=;
 b=AvT4CeA6X5umIxvdRiRu90a4x9iwo6SYlOFEdNbcNQ+BKq55M4QsbGX+47AMmSnHLiBTN9
 mJp32HmICKzRk4WMFTJy6PBMfR0jGDrO9L+C0cH9zbG18nGgLQUnPpJ7giGineSDIPmHCg
 16PFG3lgPpQvHyiHsTjAptGKvNmeNA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-LFXD8icDOQa6XMDycUWPyw-1; Thu, 11 Feb 2021 05:58:05 -0500
X-MC-Unique: LFXD8icDOQa6XMDycUWPyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 091A5107ACED
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 10:58:05 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26EF15D9DC;
 Thu, 11 Feb 2021 10:57:55 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:57:55 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 08/24] DAX: virtio-fs: Fill in slave commands for mapping
Message-ID: <20210211105755.GI247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-9-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-9-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PMULwz+zIGJzpDN9"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PMULwz+zIGJzpDN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:08PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Fill in definitions for map, unmap and sync commands.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> with fix by misono.tomohiro@fujitsu.com
> ---
>  hw/virtio/vhost-user-fs.c | 115 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 111 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 78401d2ff1..5f2fca4d82 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -37,15 +37,122 @@
>  uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, VhostUserFSSlave=
Msg *sm,
>                                   int fd)
>  {
> -    /* TODO */
> -    return (uint64_t)-1;
> +    VHostUserFS *fs =3D VHOST_USER_FS(dev->vdev);
> +    if (!fs) {
> +        /* Shouldn't happen - but seen on error path */
> +        error_report("Bad fs ptr");
> +        return (uint64_t)-1;
> +    }

If a non-vhost-user-fs vhost-user device backend sends this message
VHOST_USER_FS() -> object_dynamic_cast_assert() there will either be an
assertion failure (CONFIG_QOM_CAST_DEBUG) or the pointer will be
silently cast to the wrong type (!CONFIG_QOM_CAST_DEBUG).

Both of these outcomes are not suitable for input validation. We need to
fail cleanly here:

  VhostUserFS *fs =3D (VHostUserFS *)object_dynamic_cast(OBJECT(dev->vdev),
                                                       TYPE_VHOST_USER_FS);
  if (!fs) {
      ...handle failure...
  }

>  uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev,
>                                     VhostUserFSSlaveMsg *sm)
>  {
> -    /* TODO */
> -    return (uint64_t)-1;
> +    VHostUserFS *fs =3D VHOST_USER_FS(dev->vdev);
> +    if (!fs) {
> +        /* Shouldn't happen - but seen on error path */
> +        error_report("Bad fs ptr");
> +        return (uint64_t)-1;
> +    }

Same here.

--PMULwz+zIGJzpDN9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlDbIACgkQnKSrs4Gr
c8hW6gf/aJgUGTdbX9p4a37+cBG404CPh6LK05bKhArHTzvD0Di9MMv/SwxxdDSQ
eWXa4SirTGJZNv3wZ9IuQlCYpD3BMrA87cFiIqVSQRRn+ZModcKPmEm74rXXilF3
Red1R5fmtseU4rv+dlvYhM1ZMUvL1TRNAoqhwIMuGj1UPfFXTqWVkqSvhEQNA7Mr
Pu9m0KNtlz3Kf7fVXdAADxYKm3gJnIsPJ/7aO2YTtScVL+IOGMuJEbAhgqucMWpK
2rtR3SB/7Zdz1K9RZtGUFTvQF9vNQhzMU4K7fEtizNfwdczbCIZwpYjsz6cn284G
GoO4T+ppmC5mOvNvdKssUWffQPIxYw==
=/5Gk
-----END PGP SIGNATURE-----

--PMULwz+zIGJzpDN9--


