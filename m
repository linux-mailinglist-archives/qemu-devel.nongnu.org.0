Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC924425480
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:42:30 +0200 (CEST)
Received: from localhost ([::1]:59480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTfI-0007g5-1E
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTU0-0003Cr-3r
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTTu-0002xT-Vf
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633613439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zR4nEuaNv6DWy0QUUaQsXbvDuG+2nDew9Vax6DCjHIg=;
 b=MnvJFi26eVqf0LzZGdE5FS5crnN7KjmHGX48Oaf5fxnc/3h0PftFBYhqKoEQBnsVA5W8eO
 4gd6453qFsTBJ41amTwjKImh6NqcMatiqlURQ2cH8+19SoXLzM02HTElo6ehcyqqcrdlPT
 lYeATGre92Ic0KqEexoDx9GTWYHCsoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-NJK-P3QjMl2Ux484LsY5FA-1; Thu, 07 Oct 2021 09:30:37 -0400
X-MC-Unique: NJK-P3QjMl2Ux484LsY5FA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A681006AA7;
 Thu,  7 Oct 2021 13:30:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D04D25F4EA;
 Thu,  7 Oct 2021 13:30:35 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:30:16 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 4/5] block/nvme: Pass BDRVNVMeState* handle to
 nvme_free_queue_pair()
Message-ID: <YV72aJe1G6ttvcfU@stefanha-x1.localdomain>
References: <20211006164931.172349-1-philmd@redhat.com>
 <20211006164931.172349-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006164931.172349-5-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FgFO5fDk3NjL43LV"
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

--FgFO5fDk3NjL43LV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 06:49:30PM +0200, Philippe Mathieu-Daud=E9 wrote:
> In the next commit we want to access BDRVNVMeState from
> nvme_free_queue_pair() callee. Pass it along first.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--FgFO5fDk3NjL43LV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFe9mgACgkQnKSrs4Gr
c8igNQgAluvivngMEvZleOV4COQxCPLGellyxh3BYBzM43ZPkMORQhXj+jHyWcbs
BRQSLH6YbAVEti7/HSLbG0dIxBqbqFUp3Kh8qGW4w+2rNGt4SJoAALd+1BajQ+1r
0BlozOYrb5lLsJPXMX2hkPZMY3NfocBzuj1IORRBk5bRWAhtlU7lhgvTTY27ns/G
FUCM+1LmfxCE/sT6/LXbxdDdLDdk5nSUpS/evU3p9X/Y5XOeXQ6M6eCHPiwKk7GW
gIrbVz43hLosrHPsgbB0NAAt3ZmLAgrqJ0kcBZxRtYl/JD0JUfr5aqGBT4mnieke
XnrcZsLcRbCGg9nhFeMKdvfd8YSPrA==
=wrKl
-----END PGP SIGNATURE-----

--FgFO5fDk3NjL43LV--


