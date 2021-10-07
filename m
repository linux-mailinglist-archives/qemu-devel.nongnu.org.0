Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0714B425439
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:36:57 +0200 (CEST)
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTZw-0004ZB-1n
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTTQ-0002Yn-5N
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:30:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTTO-0002Zx-Kh
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633613409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NKQVSpYD0DbUQNsjC46XNEOscrjsmrS/nVrRtKhbrVA=;
 b=KFjwLzsYfp2fW5FRx5OGUTbVqivVon6mn4cMUSta0ksKxH3Bsi400oJ2gotseXhAlUYXci
 lEDQ1SMcqTf0s6MEfkp4Xrga2hSGpmImG0KU6iiqCk02/dr6lfp3v7XQuXN3VDTz5aMtkW
 mtxHSsBhJlj99pjp65f08lyHltW0U3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-z40Ysg8aOLGUTBkGP-UHkw-1; Thu, 07 Oct 2021 09:30:02 -0400
X-MC-Unique: z40Ysg8aOLGUTBkGP-UHkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3183F1006AA8;
 Thu,  7 Oct 2021 13:30:01 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD4C05D9DE;
 Thu,  7 Oct 2021 13:29:53 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:29:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/5] block/nvme: Automatically free qemu_memalign() with
 QEMU_AUTO_VFREE
Message-ID: <YV72StJRdw4Mp/7W@stefanha-x1.localdomain>
References: <20211006164931.172349-1-philmd@redhat.com>
 <20211006164931.172349-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006164931.172349-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ukNacQZb0echXRZZ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ukNacQZb0echXRZZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 06:49:27PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Since commit 4d324c0bf65 ("introduce QEMU_AUTO_VFREE") buffers
> allocated by qemu_memalign() can automatically freed when using
> the QEMU_AUTO_VFREE macro. Use it to simplify a bit.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ukNacQZb0echXRZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFe9kkACgkQnKSrs4Gr
c8gk+QgAhkVzYkywfuLcWW/zS+VV3ttNZh3pzv3xVD8NLMT9BfwtKIhgItLRBWq+
HhM18TNpyh0WDWRdJ5vyOvrI92GgUuxLMafddPkb6yhc/SSuiaiiOsOQlNQ37B6c
oAQXBXJ3hSY2oTHPgjAgNFOSyNuEBYzkFuLsssHEESWDLnwCTvk6AA6cbJgspvGk
ErezAdFEhjRC/UMW2CuJKKTBluHHDuhWXQNy3bKBrjN8rWd6kB1f24S5IxZkAj8P
CNUlWsVYGhXahzAnnz0GjFoBDdV3uIe+l2IfLTNuFIi1ojxlH4/4MixVl0ubvMB1
JKfF5sLX670XZ9awu55vDCRSvjzBVA==
=JIzb
-----END PGP SIGNATURE-----

--ukNacQZb0echXRZZ--


