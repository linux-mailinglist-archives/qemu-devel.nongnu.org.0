Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6628848519C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 12:08:00 +0100 (CET)
Received: from localhost ([::1]:52568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5499-0008Uf-HS
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 06:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n546F-0006vo-JU
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:04:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n546E-00050y-3y
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641380696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SP1TuAiD6OC0rS67hAcQ0ni1QGJyfCx+F1mcCF+T4UU=;
 b=CDanKwSsS0zD/mRqtD/bmo6t0gsvlWiC8KWVJJh1eAbRiartgUKLqEht6UP7b2Qf9kdBUv
 VMP/yFsK2VouiAct7Yj5hZtgueYOBg9kFzvQk9Q7Y6awb5qGtlA61PPN1FlW4qkXHorIZh
 72V5PplMJkW5BBcJtzdBVpg2s9XUthU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-ZInJjpj9OuW45Y1bqBQ2Yg-1; Wed, 05 Jan 2022 06:04:53 -0500
X-MC-Unique: ZInJjpj9OuW45Y1bqBQ2Yg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 977ED1F2DA;
 Wed,  5 Jan 2022 11:04:52 +0000 (UTC)
Received: from localhost (unknown [10.39.194.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D18122DE1;
 Wed,  5 Jan 2022 11:04:40 +0000 (UTC)
Date: Wed, 5 Jan 2022 11:04:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [RFC 3/5] libvhost-user: Simplify VHOST_USER_REM_MEM_REG
Message-ID: <YdV7RoLgp6DinTod@stefanha-x1.localdomain>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
 <20211215222939.24738-4-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20211215222939.24738-4-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JBCbwICzoGpYhnOV"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JBCbwICzoGpYhnOV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:29:52PM +0000, Raphael Norwitz wrote:
> From: David Hildenbrand <david@redhat.com>
>=20
> Let's avoid having to manually copy all elements. Copy only the ones
> necessary to close the hole and perform the operation in-place without
> a second array.
>=20
> Signed-off-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 30 +++++++++++------------
>  1 file changed, 14 insertions(+), 16 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--JBCbwICzoGpYhnOV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHVe0YACgkQnKSrs4Gr
c8hM1Qf9F7LwIhGJHP9wjEcgpcjg8K0q0FnhPxW/WPKt8y1xhWQ7yqYOKeLIRfB1
9eWV5lpMzRR3yfWq2mxYVrDs9XewPZD1AQQIFkXgUqimVlYQKbdnOb8KI7hVsmfs
N35yF4d5u4clhVij9EsVonc/yxK4olP/RnFcqexgdwfPfrqyirJgqfiwhLWQ5JWH
7RxmhvBprLZwLnmMRwQEaOHnLeVQ1CItJsQLN6E/s87IpnA0spRVrNbn6v2YXPJS
0mePMhb4agxEot+6yWd9XBc9qQBSL6zptLlTRYlZr4DtSx1YvtppXDNv3q2G32sD
GcmNaslahVEOQ5Yyh7h77KmMokmr5w==
=4WrJ
-----END PGP SIGNATURE-----

--JBCbwICzoGpYhnOV--


