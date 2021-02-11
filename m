Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF8B318811
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:26:00 +0100 (CET)
Received: from localhost ([::1]:33042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9Ad-00050m-OP
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA92l-00069o-AJ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:17:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA92i-00081c-7T
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613038666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NB8+Zc3tiQOCfcH/ynUH135rp7iUgzhVEKgnyeEriBA=;
 b=iK+Qi7TXIlLa9rnd24eZ8L2rKjs3NWVcs/eKxjFq3LcBcJi9w3SDhojDOHkTiLLmp6KZpJ
 cOA+jkGnimkUo3cvoUgQ3Al/cDvUvJklhEwW/ZTAo06xvyTJH935FiGkpYzgoDqAOtIle/
 OY/WV0cusIe6+tK9wtkGRGTL3A1ZzA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-VX40dpoaMs6p5lQ3Fm2lBA-1; Thu, 11 Feb 2021 05:17:43 -0500
X-MC-Unique: VX40dpoaMs6p5lQ3Fm2lBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB901100CCC0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 10:17:42 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F67567CC0;
 Thu, 11 Feb 2021 10:17:24 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:17:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 05/24] DAX: virtio: Add shared memory capability
Message-ID: <20210211101723.GF247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-6-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-6-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
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

--DO5DiztRLs659m5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:05PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG'
> and the data structure 'virtio_pci_cap64' to go with it.
> They allow defining shared memory regions with sizes and offsets
> of 2^32 and more.
> Multiple instances of the capability are allowed and distinguished
> by the 'id' field in the base capability.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/virtio/virtio-pci.c | 20 ++++++++++++++++++++
>  hw/virtio/virtio-pci.h |  4 ++++
>  2 files changed, 24 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlBDMACgkQnKSrs4Gr
c8gveAgArWaZE1Fb9BZKC1pUHUzsnYYLBnOUihMMx0xOMzgF3A+OUXVgi+CkjOGz
CZ9rsnaV+Iy6+H8imuM91h06hi2NtZhY7dadwl1AlN8jUDMJ2k5pCXDQAaNCcPBX
6zsbhpGonzhaDBb9tEEm28aRKFA3PT3wy1qirXgnL+eXUv10seV5wHHN1ZlWj59z
b3XGri7GPpBL7+Crfw/kNdJ7M1R4qEMRhehaOk31QOqwuddDDEevpgGqnMI9Ac6+
Ju6j+Wqj4UO7rQB2GRSQeM+DAZLXWjpZKGKWbj5/BXIJDDf2v/LA43+9bKpDe3I5
EJJzN9W96XEqMvYNHZ0hk90/Nza7oQ==
=LU5a
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--


