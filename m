Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F594730E3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:49:36 +0100 (CET)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwna3-0004sD-CR
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnQj-00019T-Aa
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:39:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnQg-0001cp-Rv
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639409994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nkai7aZR8Nuubz0pNzVpRXRDdkFGHxHKP3uHLHRGGjw=;
 b=WuDYk+9ojplu8DpvD/GPIeosqa2/JrD3KHjpm91wpaElPY3TfnvU1Rtvo6QpZ7+4Fzyw2c
 pZLz06GLKw61rBNkTh9wQyhgYKjmYyeZkM4QbttPolPW7aJ+vpqExblVGpMDqpodkPQoOi
 /FuQ5V+tV0YyBoBTnNXmuVSVPbs/sgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-4p4JpcnmOYuM1Th2TcqMcA-1; Mon, 13 Dec 2021 10:39:50 -0500
X-MC-Unique: 4p4JpcnmOYuM1Th2TcqMcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D51CA192CC40;
 Mon, 13 Dec 2021 15:39:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61866608BA;
 Mon, 13 Dec 2021 15:39:42 +0000 (UTC)
Date: Mon, 13 Dec 2021 15:39:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 1/4] block_int: make bdrv_backing_overridden static
Message-ID: <YbdpPYU08Iy5hcH3@stefanha-x1.localdomain>
References: <20211130094633.277982-1-eesposit@redhat.com>
 <20211130094633.277982-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211130094633.277982-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w6SubyXPdyun1SdE"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--w6SubyXPdyun1SdE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 04:46:30AM -0500, Emanuele Giuseppe Esposito wrote:
> bdrv_backing_overridden is only used in block.c, so there is
> no need to leave it in block_int.h
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c                   | 4 +++-
>  include/block/block_int.h | 3 ---
>  2 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--w6SubyXPdyun1SdE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3aT0ACgkQnKSrs4Gr
c8jGewgAltLgdMVgE2x4gniRtDOo+Wnj+fqcv5hPstCp83Un68Bk5GuKXOzHQLIR
OVZ1aUWUtjN/mPoBrASPDMjdC08bB5uHhvT1JezIkdEc+KLV/4DXYDZPV3MJiPiF
qXKtGtCa4Ay1YnYFuyqhN4cfCoO+lKBnr9q7Bfy/4nZDlmXjMB9tMWLU55vMEj6q
qtJAwQ/46ZcI7kfb7PjCcTD6TU+dEhitSupmDjuDrTh1WRX379zD1PDBzzSYN37W
4zomiCyeQKPTMbjnRNUv8DtAbMHxm0NqyzLzT9sQ+6LRSjnCBNSmBFLloCW1eOyT
ub0csEXeK4Kw9lzna3aSZjT4KEZY5A==
=a87O
-----END PGP SIGNATURE-----

--w6SubyXPdyun1SdE--


