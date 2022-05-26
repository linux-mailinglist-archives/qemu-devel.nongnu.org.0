Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D76534C60
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:16:41 +0200 (CEST)
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu9bk-0005Sh-1Q
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9Bz-0000tE-Fj
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9Bx-0004yP-Rz
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653555001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9TBal7OrGDoxVi456SQ4sfM7Ym6QqsHyaFKBaqqEPCY=;
 b=XuEhf4gA+7C1QiANfVByPZRdy11DZDxqLL2Cc9qRgLzRSj97UycXX0ra/DtFpUXh2iSERX
 q/JljPy5ThivSwT8mZkWxaKP/Y8QzJJpZa1ZphfimSenYbxUhggxDZ7NSZmhcqNwwnYqw9
 TQWfyZ5Fhe5MUyekn0nPpNeoB8tppCo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-7KNhExeWNlCr5AkTvZc1dw-1; Thu, 26 May 2022 04:49:58 -0400
X-MC-Unique: 7KNhExeWNlCr5AkTvZc1dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2973C80088A;
 Thu, 26 May 2022 08:49:58 +0000 (UTC)
Received: from localhost (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA318C15E71;
 Thu, 26 May 2022 08:49:57 +0000 (UTC)
Date: Thu, 26 May 2022 09:49:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>
Subject: Re: [PATCH v3 04/10] crypto: Make block callbacks return 0 on success
Message-ID: <Yo8/NbfNa27Roghh@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-5-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W4Gp99czQjGxsavi"
Content-Disposition: inline
In-Reply-To: <20220519144841.784780-5-afaria@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--W4Gp99czQjGxsavi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 03:48:34PM +0100, Alberto Faria wrote:
> They currently return the value of their headerlen/buflen parameter on
> success. Returning 0 instead makes it clear that short reads/writes are
> not possible.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  block/crypto.c                 | 52 +++++++++++++++++-----------------
>  block/qcow2.c                  | 22 +++++++-------
>  crypto/block-luks.c            |  8 +++---
>  crypto/block.c                 |  6 ++--
>  include/crypto/block.h         | 32 ++++++++++-----------
>  tests/unit/test-crypto-block.c | 38 ++++++++++++-------------
>  6 files changed, 79 insertions(+), 79 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--W4Gp99czQjGxsavi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKPPzUACgkQnKSrs4Gr
c8hl0QgAhuEsIF+50bPi9kq7VxrGR9tblluhyCHUYnuF6chnHqmEPjF1ygl2t475
Tf9310LLHB7VRC3uT7L5eLAupjL0wFidkdKgQEqF5E7Qyl+D7JXcSKQwqIBLWO1V
5usZ/ISeQSbOEv9HI3G7Vd+UAw6bGUtSvE8pbkAkzw5O9SaBZjlytTAYCe4UjGWL
5Sc3UY0MU8Cj3u0uqC6yzWb7qCLFtn9P5SLlHugdK1M2Qo+VILXClzfqaZ9HXgAa
asgOV/TU+c7H+BoptwtvVLEVVPCSUTYL+7L3FerIi+Vx5bNU/WXi33QacqvsNS3X
3gvmZlxcmHDh/h9sl8UrA2JVMrInqQ==
=4j/F
-----END PGP SIGNATURE-----

--W4Gp99czQjGxsavi--


