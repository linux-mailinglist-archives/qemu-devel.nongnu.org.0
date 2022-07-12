Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E922C571993
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:14:37 +0200 (CEST)
Received: from localhost ([::1]:39746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBEmj-0004AD-3U
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBEjj-0000xc-Dw
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:11:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBEjg-0002qQ-G0
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657627887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hUB6RzY1+/oEvYTZyxRDnPtB3AAIVD+YRfFRZz625+Y=;
 b=J9ktm5rkEFwoxf6S5L0uf5JJHAzvkLRqIgYUTx6vn4NL/xk2u3QQPmGAcaf+VafUJJ5EGR
 tpi2e4baJ398QR/pjJeEP126/QV7RHsEIriwv9T1TgwdcsIPgc7pubZ6YG28z0NY6/4Eqz
 JUCf3cxXBxZoABw8LIzuVKTz6Q4YR6c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-tSSbwSQOOUqQg6Y0JBdbrw-1; Tue, 12 Jul 2022 08:11:24 -0400
X-MC-Unique: tSSbwSQOOUqQg6Y0JBdbrw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BD5D811E83;
 Tue, 12 Jul 2022 12:11:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 142B2401E54;
 Tue, 12 Jul 2022 12:11:22 +0000 (UTC)
Date: Tue, 12 Jul 2022 13:11:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: its@irrelevant.dk
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Keith Busch <kbusch@kernel.org>,
 darren.kenny@oracle.com
Subject: Re: [QEMU 1/1] nvme: Fix misleading macro when mixed with ternary
 operator
Message-ID: <Ys1k6ameYujtE1TX@stefanha-x1.localdomain>
References: <d3fc4a90ba74d4874c445480b48d45b67c9322ae.1657200900.git.darren.kenny@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iIMBD4atD7ty3CIe"
Content-Disposition: inline
In-Reply-To: <d3fc4a90ba74d4874c445480b48d45b67c9322ae.1657200900.git.darren.kenny@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iIMBD4atD7ty3CIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2022 at 01:36:21PM +0000, Darren Kenny wrote:
> Using the Parfait source code analyser and issue was found in
> hw/nvme/ctrl.c where the macros NVME_CAP_SET_CMBS and NVME_CAP_SET_PMRS
> are called with a ternary operatore in the second parameter, resulting
> in a potentially unexpected expansion of the form:
>=20
>   x ? a: b & FLAG_TEST
>=20
> which will result in a different result to:
>=20
>   (x ? a: b) & FLAG_TEST.
>=20
> The macros should wrap each of the parameters in brackets to ensure the
> correct result on expansion.
>=20
> Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
> ---
>  include/block/nvme.h | 44 ++++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)

Klaus: ping

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--iIMBD4atD7ty3CIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLNZOkACgkQnKSrs4Gr
c8ijLAf/dpFf5X3cvWuQHX0X9WpwnZsMp/WF6PoyxVXXlpW1/Po4priRfcZp7JSB
fhQ5BEzgL7B6o5vsHQl4W6OQP24HffiffnXUDll6WkFX3k8sO1Jhn9KSqnf9X3Sv
byh2JELiQbZYaME5Lk+eesGFcoSmhCDrMdbBthps9Z8Z4rTtnnHk88f4EjIhaBjZ
UHDQBYcpPCjOeNcyru6fFhQl8xC7wj8W6H8BVyvyK+pkUFTfBO6TjBmkotTofDJV
DxuFThAv0QuE0e/VRDfDjwulDeqVO2AOjvvBeatRO9kBuba+gVPVWFQf7eVwt16u
yJqwNqf6zrf+E3k06SpdNYXNhuoSnA==
=qd/p
-----END PGP SIGNATURE-----

--iIMBD4atD7ty3CIe--


