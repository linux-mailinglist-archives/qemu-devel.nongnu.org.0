Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C662A31882C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:32:56 +0100 (CET)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9HK-0005X6-MZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA9Au-0006V8-0c
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:26:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA9Ao-0002jx-6x
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613039169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=So+zZ05cnGQjH+sOy0ECYsTsoDZEfGyzP4ae/lFXyLY=;
 b=N5TSJ7YnpAHMvlI1CQMs01QZiIR6ctuTwzqw0Qjr4EQIowNegXW3Wbb8awH8Z8Y33iUG/6
 VaEELjsit0povEyYKXUsczJfawmn5SF0TGj4nbhW5TVPZr9XKfwOynhUJF86XGcmYPCWpx
 6rbfS/q0jdJCSA6Wjh9OQ1xKchm06LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-iUgNOIdIPVGrnDJnvIAVmQ-1; Thu, 11 Feb 2021 05:26:06 -0500
X-MC-Unique: iUgNOIdIPVGrnDJnvIAVmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEFDF803F47
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 10:26:05 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA6476268D;
 Thu, 11 Feb 2021 10:25:56 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:25:55 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 06/24] DAX: virtio-fs: Add cache BAR
Message-ID: <20210211102555.GG247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-7-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-7-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j2AXaZ4YhVcLc+PQ"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--j2AXaZ4YhVcLc+PQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:06PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> @@ -46,6 +51,26 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *=
vpci_dev, Error **errp)
>      }
> =20
>      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> +    cachesize =3D dev->vdev.conf.cache_size;
> +
> +    /*
> +     * The bar starts with the data/DAX cache
> +     * Others will be added later.
> +     */
> +    memory_region_init(&dev->cachebar, OBJECT(vpci_dev),
> +                       "vhost-fs-pci-cachebar", cachesize);

s/vhost-fs/vhost-user-fs/ for consistency. Only worth changing if you
respin.

> +    if (cachesize) {
> +        memory_region_add_subregion(&dev->cachebar, 0, &dev->vdev.cache)=
;
> +        virtio_pci_add_shm_cap(vpci_dev, VIRTIO_FS_PCI_CACHE_BAR, 0, cac=
hesize,
> +                               VIRTIO_FS_SHMCAP_ID_CACHE);
> +    }
> +
> +    /* After 'realized' so the memory region exists */
> +    pci_register_bar(&vpci_dev->pci_dev, VIRTIO_FS_PCI_CACHE_BAR,
> +                     PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                     PCI_BASE_ADDRESS_MEM_PREFETCH |
> +                     PCI_BASE_ADDRESS_MEM_TYPE_64,
> +                     &dev->cachebar);

Please include a comment explainig why it's okay to use BAR 2, which is
already used for the virtio-pci modern io bar (off by default):

    /*
     * virtio pci bar layout used by default.
     * subclasses can re-arrange things if needed.
     *
     *   region 0   --  virtio legacy io bar
     *   region 1   --  msi-x bar
     *   region 2   --  virtio modern io bar (off by default)
     *   region 4+5 --  virtio modern memory (64bit) bar
     *
     */

I guess the idea is that the io bar is available since it's off by
default. What happens if the io bar is enabled?

Should this bar registration should be conditional (only when cache size
is greater than 0)?

--j2AXaZ4YhVcLc+PQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlBjMACgkQnKSrs4Gr
c8jgpggAoNEPtR4HQ7BVPbSA4ugAaffqqeoLpyqr7Kf864GsSdgEZC7+SlSZjfxl
vme32YgLleKLA4f0S72KtPwbdrJepO6tWAhdmzCK40NWDah+IpyM1I5rsSqDpB8y
D2UgNh5px6RiCEiitxkAqwSLydIPEkvlH94SJUJ9wKqNiDi9DjI+81+CCMZ4FdDf
XpcBpUU7HYvnu5BScBwwcb94dU2Dog+VcQ9q3I5FAdg2u91oW2QK14apT8xjuyo8
0ZlHZuqcFV9jvr6pexc4XDBY8vdLa8UecG650rShNDIHC7PoZCkx1lif3yUjGE/R
gbEG5u/6cWXrfjW7mVsuTfRww4DbqQ==
=2swU
-----END PGP SIGNATURE-----

--j2AXaZ4YhVcLc+PQ--


