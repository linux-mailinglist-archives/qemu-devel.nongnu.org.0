Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F2420E39
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:21:54 +0200 (CEST)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXNuj-0002nO-6D
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXNpV-0007q3-Ah
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:16:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXNpT-0000VF-G9
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633353386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lFT/ecJtwYuuSvHeiBaLQU6St/oFptnuC4kPcF+RXcU=;
 b=GFTwex0yLMdx4GTuuC82NeympmcxwCGN0b6tosCnRZhABZNatvYNpYs1sWJcDEZTjMR8YL
 ZT2sn0Xg8RfhNzTvfe0hKrq8J+bfLcAlHI7d5xp/R9lqSZgG8y0QEBSwHCzQCxUz2FUu0E
 +VnfKOjQ9nmza0XR2GfvQzdnDxxooMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-aWY20-WINsa3M9NL8HQxig-1; Mon, 04 Oct 2021 09:16:21 -0400
X-MC-Unique: aWY20-WINsa3M9NL8HQxig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 714061966321;
 Mon,  4 Oct 2021 13:16:20 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 054685C1CF;
 Mon,  4 Oct 2021 13:16:19 +0000 (UTC)
Date: Mon, 4 Oct 2021 14:16:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 02/13] virtiofsd: fuse.h header file changes for lock
 notification
Message-ID: <YVr+oqwYRx11MBug@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-3-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PWJ3mR2OGuOoHKef"
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

--PWJ3mR2OGuOoHKef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:26AM -0400, Vivek Goyal wrote:
> This change comes from fuse.h kernel header file udpate. Hence keeping
> it in a separate patch.

QEMU syncs include/standard-headers/linux/ from linux.git. Please
indicate the status of this fuse.h change:
- Is it already in a Linux release?
- Or is it already in linux.git?
- Or is it awaiting review from the kernel FUSE maintainer?

We need to wait for the kernel change to get into linux.git before
merging this patch in QEMU. This ensures that QEMU uses actual released
kernel interfaces that are guaranteed to be stable.

>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  include/standard-headers/linux/fuse.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/standard-headers/linux/fuse.h b/include/standard-hea=
ders/linux/fuse.h
> index cce105bfba..0b6218d569 100644
> --- a/include/standard-headers/linux/fuse.h
> +++ b/include/standard-headers/linux/fuse.h
> @@ -181,6 +181,8 @@
>   *  - add FUSE_OPEN_KILL_SUIDGID
>   *  - extend fuse_setxattr_in, add FUSE_SETXATTR_EXT
>   *  - add FUSE_SETXATTR_ACL_KILL_SGID
> + *  7.35
> + *  - add FUSE_NOTIFY_LOCK
>   */
> =20
>  #ifndef _LINUX_FUSE_H
> @@ -212,7 +214,7 @@
>  #define FUSE_KERNEL_VERSION 7
> =20
>  /** Minor version number of this interface */
> -#define FUSE_KERNEL_MINOR_VERSION 33
> +#define FUSE_KERNEL_MINOR_VERSION 35
> =20
>  /** The node ID of the root inode */
>  #define FUSE_ROOT_ID 1
> @@ -521,6 +523,7 @@ enum fuse_notify_code {
>  =09FUSE_NOTIFY_STORE =3D 4,
>  =09FUSE_NOTIFY_RETRIEVE =3D 5,
>  =09FUSE_NOTIFY_DELETE =3D 6,
> +=09FUSE_NOTIFY_LOCK =3D 7,
>  =09FUSE_NOTIFY_CODE_MAX,
>  };
> =20
> @@ -912,6 +915,12 @@ struct fuse_notify_retrieve_in {
>  =09uint64_t=09dummy4;
>  };
> =20
> +struct fuse_notify_lock_out {
> +=09uint64_t=09unique;
> +=09int32_t=09=09error;
> +=09int32_t=09=09padding;
> +};
> +
>  /* Device ioctls: */
>  #define FUSE_DEV_IOC_MAGIC=09=09229
>  #define FUSE_DEV_IOC_CLONE=09=09_IOR(FUSE_DEV_IOC_MAGIC, 0, uint32_t)
> --=20
> 2.31.1
>=20

--PWJ3mR2OGuOoHKef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFa/qIACgkQnKSrs4Gr
c8gDiggAwAEYEiiR4OACXXPGxDXx9Oh9d63cAUkTigcfLIfSzMa6Zb1Bfg2Y7I/4
+QWGuvM2x8hfQbOXo51HvSYM476aV9hhb6CBtws/e2nOc7e81nlPQ/IBGQq+m2ga
F+HVEs860qj7oq9Zi9X4z4PkHEQ7NZMOUiZwrccO1A8d/8sjxICbpClgbdJ7i+Cm
iWCH2teC7Pk1axNrgrYi62MPEmlurtNI/A2p3NKIGB38LYb1sX5OIsXuOW99m/Cp
IWJCp+Fs673fJu/Wpy5cfne5Y10tMlNtcaCh2XSojj+q7jVx4LHW+TU6YyaD1TId
0e6IbTAkruzj1tvgr6kZIBabhKS66A==
=j2KE
-----END PGP SIGNATURE-----

--PWJ3mR2OGuOoHKef--


