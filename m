Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CF3CCF77
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 10:53:30 +0200 (CEST)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5P1l-00020g-RL
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 04:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5P0v-0001Cj-2u
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 04:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5P0s-0001xt-AS
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 04:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626684753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=87ddR5Ki0qkripmOSHf58irUgp0ZfsLI+VAmAofe+Pg=;
 b=TwMYtNAhxAFB4iiFokBL+OFqaAm01t06+4FyqXl/E5IhSRtwYBYFipa3P3H2NKSQ9sPZM1
 ZOw1xinhqYvcyE1eCz7+qf14OsndN+alHQgUeJtybhkRxYf6EySYy6bFS8GUMIs6ExZOFB
 Czh2MP4wyKZDsbt5K1B7LvhuPvQbotY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-HHZI6nS_Nd665caxjljwXQ-1; Mon, 19 Jul 2021 04:52:32 -0400
X-MC-Unique: HHZI6nS_Nd665caxjljwXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C575A1084F40;
 Mon, 19 Jul 2021 08:52:30 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4084360C9D;
 Mon, 19 Jul 2021 08:52:30 +0000 (UTC)
Date: Mon, 19 Jul 2021 09:52:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 0/5] hw/nvme: fix mmio read
Message-ID: <YPU9TcHNXFqB6Cq7@stefanha-x1.localdomain>
References: <20210714060125.994882-1-its@irrelevant.dk>
 <YPUfFQpvpiYT2bKJ@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <YPUfFQpvpiYT2bKJ@apples.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KFHRRcKavl++VESz"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KFHRRcKavl++VESz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 08:43:33AM +0200, Klaus Jensen wrote:
> On Jul 14 08:01, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Fix mmio read issues on big-endian hosts. The core issue is that values
> > in the BAR is not stored in little endian as required.
> >=20
> > Fix that and add a regression test for this. This required a bit of
> > cleanup, so it blew up into a series.
> >=20
> > v2:
> >=20
> >   * "hw/nvme: use symbolic names for registers"
> >     Use offsetof(NvmeBar, reg) instead of explicit offsets (Philippe)
> >=20
> >   * "hw/nvme: fix mmio read"
> >     Use the st/ld API instead of cpu_to_X (Philippe)
> >=20
> > Klaus Jensen (5):
> >   hw/nvme: split pmrmsc register into upper and lower
> >   hw/nvme: use symbolic names for registers
> >   hw/nvme: fix out-of-bounds reads
> >   hw/nvme: fix mmio read
> >   tests/qtest/nvme-test: add mmio read test
> >=20
> >  include/block/nvme.h    |  60 +++++--
> >  hw/nvme/ctrl.c          | 362 +++++++++++++++++++++++-----------------
> >  tests/qtest/nvme-test.c |  26 +++
> >  3 files changed, 276 insertions(+), 172 deletions(-)
> >=20
>=20
> Oi,
>=20
> A review on patch 3 and 4 would be appreciated so this has a chance of
> reaching Peter for -rc0 :)

I have reviewed Patch 3. Unfortunately I don't have time to review the
rest right now but maybe you can ask a specific person on the CC list to
review other patches. A Reply-All to multiple people might not receive
any attention :).

Stefan

--KFHRRcKavl++VESz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD1PU0ACgkQnKSrs4Gr
c8gdZgf9G5EPGvdDE8XCLvwFtKeWHc6HDriDt8iEGXEdtuNpyHvXAoYY3X4FFz9M
LtbCU9q6hrmcIKAZ98sFFY2CVOLLGSH2HntEOQEnzq28Whl1XU2Y8cqoYicu5w9i
ACym5Hg4HRDwUgN0zD1bfpxtoxHXURsn51D+3ab7advhzb/glIWDbrtm+HZMyR6A
JEZHXzaOwaLMY2GgHEQzx3rymaJW867TbLA7DRS3N+TN9hkbIsLk5lv1W9DjMy+x
noKroHeEioyNBb0/T/X1kHfB6TVfh1DFwbpCEUdpqLgxECMiW33E0EaUUSf3QNYp
xTwpsmboVtY2SM1ibL8zk//ZdhbeJA==
=Cngq
-----END PGP SIGNATURE-----

--KFHRRcKavl++VESz--


