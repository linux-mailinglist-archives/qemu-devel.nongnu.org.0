Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1029318B3E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:57:16 +0100 (CET)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABX1-0005P9-Rl
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABIc-0001w5-EX
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:42:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABIa-000191-C0
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613047339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h81IYv2WRGmn1Wp1FVXMWL3SZTLTuO1imMmPFUN5Xtc=;
 b=fOXUHMbDv8BGkoAY48+ZESDVra18vHSDCjETPsam2u0L6IdvpWYKI8yZH7skswbDgqKMCW
 EvQbk8ItIwQ8q4JgpspNB9O3C+t0+X8Jq2ipofWkNi8NlqT+/pErxVvY5af3JwsluyTmNf
 qO9luzdyWNrzOiBj+E+leYVP0LwDdBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-HlZ0mghhM2CYfiUhdZCI9A-1; Thu, 11 Feb 2021 07:42:17 -0500
X-MC-Unique: HlZ0mghhM2CYfiUhdZCI9A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD98801978
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:42:16 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5BB47092D;
 Thu, 11 Feb 2021 12:42:01 +0000 (UTC)
Date: Thu, 11 Feb 2021 12:42:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 14/24] DAX: virtiofsd: route se down to destroy method
Message-ID: <20210211124200.GO247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-15-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-15-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V7BlxAaPrdhzdIM1"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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

--V7BlxAaPrdhzdIM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:14PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> We're going to need to pass the session down to destroy so that it can
> pass it back to do the remove mapping.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c  | 6 +++---
>  tools/virtiofsd/fuse_lowlevel.h  | 2 +-
>  tools/virtiofsd/passthrough_ll.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--V7BlxAaPrdhzdIM1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlJhgACgkQnKSrs4Gr
c8hghwgAra6W5sssj/Tvl+kCSWvJKsc4e7drZ0BkASSShPe2fk2CuIVDhIdRv7UW
wMI/QMV274uzA7osBsW3NDVE7JjN64ixt9EeJzOQzpugLf9mnDMxy9WOWOegUzyP
mJvbzH36OWSj6TveM+vb0FhSh7AHQy2kZjLSUzdQhWicEnqaWgGXp6YQJyAX808Z
VKfiDTvVEC/o2qCK2NRJUgUxbnHJ4+5w3CHpSSRoJ5lcwYP9Q/MEZ4tFxcDpNtOr
w6p+z/nbIIf+i3JmGOqd9JI812tQrJDf2XZ8e1xz+E5TBlJZDjGImObvO7VqZKnv
BA32QbY5oTyIl/nsPEJ/tq8j0zcipQ==
=kiAP
-----END PGP SIGNATURE-----

--V7BlxAaPrdhzdIM1--


