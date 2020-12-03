Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C12CD491
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:29:06 +0100 (CET)
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmnJ-0006Bw-9Z
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkmkn-00057y-79
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:26:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkmke-0004RW-NN
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606994772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gBow2+nucIqd4usRvwBbIU3dzpwbBKqdk0435OxHovo=;
 b=DyM+M80BTjC5ESb6rlcC/8nvXnXgOjaFbieaixz9VsAZsz0vsceytNY/kd52MQi0j9JyOq
 +i3gfJ33WJI66VEb63wyEK5ep90Lwif+3VDBxqjQzUSyZvBI6WEj7bQf4SMW3GhgL5RA1B
 bh7p07Djq6JnWTVNWeEnzqyAwOxNQEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-7og0f5FfMoyF1vwYgyuw7A-1; Thu, 03 Dec 2020 06:26:08 -0500
X-MC-Unique: 7og0f5FfMoyF1vwYgyuw7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 656A38D90AC;
 Thu,  3 Dec 2020 11:25:44 +0000 (UTC)
Received: from localhost (ovpn-115-46.ams2.redhat.com [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC11127C3C;
 Thu,  3 Dec 2020 11:25:43 +0000 (UTC)
Date: Thu, 3 Dec 2020 11:25:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/2] nvme: updated shared header for copy command
Message-ID: <20201203112542.GF689053@stefanha-x1.localdomain>
References: <20201124071418.12160-1-its@irrelevant.dk>
 <20201124071418.12160-2-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20201124071418.12160-2-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NQTVMVnDVuULnIzU"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NQTVMVnDVuULnIzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 08:14:17AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Add new data structures and types for the Simple Copy command.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Fam Zheng <fam@euphon.net>
> ---
>  include/block/nvme.h | 45 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--NQTVMVnDVuULnIzU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/IyzYACgkQnKSrs4Gr
c8h9wQgApwRPEXZhRBMvO29VK4Sjo2RAnYCsD6wcCUvroJ5gmEwkbuaR6L5wRmpN
unkw5gq5OOoqhSrd8wpBLW0hdjRRLdKZv9/9WRD0jp5VTGBhGDTKOd249dev9JgJ
alKesU8nWLX1HNE3A29sR8Zk7hhU61aEohdbhwOmgJ9yr2RjUDcOOgE+ZkgSu0rH
d1BENBJfEggU51gowt99hsBP8svydOkF2TiJc66POx/mOK8pGAh9aaj0itSo1nih
SLtYPi3LL5xh9hhO/82MbC/iDWHyD2fMNwbPl6qrwhRZj9wEvaJPCVWQq0SLRnsf
k0lxLXDP0Y8NKDlmYN9AP0/PioTdBA==
=z+72
-----END PGP SIGNATURE-----

--NQTVMVnDVuULnIzU--


