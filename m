Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB64CC01C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:38:28 +0100 (CET)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmb4-0003dP-Tv
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:38:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPmYL-0001zF-LP
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:35:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPmYH-0002q4-7H
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646318130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fbMp/osdXrbtmQKZQG+gFlfsChHZaiPWRw8JRmKvmBY=;
 b=cr+8KpWo18lD04kSKEPxs0bKPGmc5cSyRx55DMgTN1RrbB3SBW7e45S+QuQ3ySRIiVEXVQ
 R569eASaI/1WxNaIjuKuQlvhXuB04SbQKsh/V/sh3nulNU7aBo7CrBOxAqOrhjhccCuHY+
 R3/3DnuRaMeeRfvVz/ZTIR20jLDdHnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-yUGR4HvmN3egBnDEWX34gg-1; Thu, 03 Mar 2022 09:35:27 -0500
X-MC-Unique: yUGR4HvmN3egBnDEWX34gg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 393FF835DE0;
 Thu,  3 Mar 2022 14:35:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D22DB7C023;
 Thu,  3 Mar 2022 14:34:39 +0000 (UTC)
Date: Thu, 3 Mar 2022 14:34:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v3 4/4] docs: vhost-user: add subsection for non-Linux
 platforms
Message-ID: <YiDR+u76HLeaOTi5@stefanha-x1.localdomain>
References: <20220303115911.20962-1-slp@redhat.com>
 <20220303115911.20962-5-slp@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xlV0CQk1kqL67PjT"
Content-Disposition: inline
In-Reply-To: <20220303115911.20962-5-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 John G Johnson <john.g.johnson@oracle.com>, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xlV0CQk1kqL67PjT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 12:59:11PM +0100, Sergio Lopez wrote:
> Add a section explaining how vhost-user is supported on platforms
> other than Linux.
>=20
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  docs/interop/vhost-user.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index edc3ad84a3..590a626b92 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -38,6 +38,24 @@ conventions <backend_conventions>`.
>  *Master* and *slave* can be either a client (i.e. connecting) or
>  server (listening) in the socket communication.
> =20
> +Support for platforms other than Linux
> +--------------------------------------
> +
> +While vhost-user was initially developed targeting Linux, nowadays is

s/is/it is/

> +supported on any platform that provides the following features:
> +
> +- The ability to share a mapping injected into the guest between
> +  multiple processes, so both QEMU and the vhost-user daemon servicing
> +  the device can access simultaneously the memory regions containing
> +  the virtqueues and the data associated with each request.

Please generalize this statement since there are other vhost-user
protocol features aside from guest RAM access that involve shared
memory:
1. VHOST_USER_SET_LOG_BASE
2. VHOST_USER_SET_INFLIGHT_FD

The exact requirement is:

  The vhost-user protocol relies on shared memory represented by a file
  descriptor so it can be passed over a UNIX domain socket and then
  mapped by the other process.

> +
> +- AF_UNIX sockets with SCM_RIGHTS, so QEMU can communicate with the
> +  vhost-user daemon and send it file descriptors when needed.
> +
> +- Either eventfd or pipe/pipe2. On platforms where eventfd is not
> +  available, QEMU will automatically fallback to pipe2 or, as a last

The noun is "fallback", the verb form is "fall back":
s/fallback/fall back/

It's worth mentioning that events are sent over pipe fds by writing an
8-byte value. The 8-byte value has no meaning and should not be
interpreted.

--xlV0CQk1kqL67PjT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIg0foACgkQnKSrs4Gr
c8iyIwf5AXwYmNsSKaWRTXuqaGB80K0YsAtK7xDq9CNFNPYCIw6ujWqc2lL5BOhU
5LMnzPFM4SwFKXXQLjg49xg243nblZySvUY6IaV3Zo49m2DW7m83qmwt63+TmKdh
ahvmzw5R+uvYLQ/7HA/Y117Lc2Avxedpj4lCWKMFzogCVU0DZzvQKoCdr/1Efa/3
4ZMeJ6WQUhzqatQmIkhD63V6fpEIuxQ3mkJP0AGA4S3SPmUe4+Fiht9ulLtPV7ZX
r1o0mgwtxho/Nm0KXuCKR9OyVd2eqlmM9IrxoR6UK7a6ALVKI7YMJ4gCW1UZzska
z3CV3kUJQDKxuprkI8Ro7EOJi59HWA==
=h/kO
-----END PGP SIGNATURE-----

--xlV0CQk1kqL67PjT--


