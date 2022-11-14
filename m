Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890F8628EE2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouieT-0003hH-Ml; Mon, 14 Nov 2022 18:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ouie1-0001eb-N5
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ouhTk-0003xW-4j
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 16:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668463135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1a659pXAKoJXP9UzxAcAcnRk2B3xn8zxa1Xss+/7DsY=;
 b=WJsiKk2CcpjJnu7H4afm3zFqrmcNmtPAaGHX38Fm4PwHF2x14rvd94CKAfvXXv81n6O1Cs
 PlP2EE9l5iJPYcv6ksjnIX8+DrX2kaTuweXaMWZwLZ8vJ1BseltRP/2fQ+MvBJYyXW4Ul4
 IqDllrkv0Zp7M0rqop1fyBr+oHO5XDQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-fzbfaavkMXyxyxnbQbkvfA-1; Mon, 14 Nov 2022 16:58:53 -0500
X-MC-Unique: fzbfaavkMXyxyxnbQbkvfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2429B85A59D;
 Mon, 14 Nov 2022 21:58:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 881C663A78;
 Mon, 14 Nov 2022 21:58:52 +0000 (UTC)
Date: Mon, 14 Nov 2022 16:58:43 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/2] target-arm queue for rc1
Message-ID: <Y3K6E1eCxMCNdTs1@fedora>
References: <20221114155201.425027-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Mw6P8J2fjIL/VzBO"
Content-Disposition: inline
In-Reply-To: <20221114155201.425027-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--Mw6P8J2fjIL/VzBO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 03:51:59PM +0000, Peter Maydell wrote:
> Hi; here's the arm pullreq for rc1. Just one bugfix and
> a MAINTAINERS file update...
>=20
> thanks
> -- PMM
>=20
> The following changes since commit 305f6f62d9d250a32cdf090ddcb7e3a5b26a34=
2e:
>=20
>   Merge tag 'pull-la-20221112' of https://gitlab.com/rth7680/qemu into st=
aging (2022-11-12 09:17:06 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-ar=
m-20221114
>=20
> for you to fetch changes up to d9721f19cd05a382f4f5a7093c80d1c4a8a1aa82:
>=20
>   hw/intc/arm_gicv3: fix prio masking on pmr write (2022-11-14 15:10:58 +=
0000)

Applied, thanks!

Stefan

>=20
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/intc/arm_gicv3: fix prio masking on pmr write
>  * MAINTAINERS: Update maintainer's email for Xilinx CAN
>=20
> ----------------------------------------------------------------
> Jens Wiklander (1):
>       hw/intc/arm_gicv3: fix prio masking on pmr write
>=20
> Vikram Garhwal (1):
>       MAINTAINERS: Update maintainer's email for Xilinx CAN
>=20
>  hw/intc/arm_gicv3_cpuif.c | 3 +--
>  MAINTAINERS               | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>=20

--Mw6P8J2fjIL/VzBO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNyuhMACgkQnKSrs4Gr
c8iyWQgAjBMdwXZHxAAY0+CConOjgg7mX8lZLjrQmqFg//hi+aQ88TsJcqGc07ZH
6dTeF+7qSZSItZ5sjLYSHGto8mRg7HguLc7B7Zv27mH/Hxn4CtWwwm1lZDjJKzNm
cQEWC6K3Mb9gAMyJgq+V32Ft8UQmClH1JddaAOjXml3Eb10B7scKciU3TTjs/yko
NsGRGvrW0sEgpF/NBZvffmuORIqdvxOtaTCF1IM32O7WB4JNgYKIMZ8t5bRhmt93
o13niyEsmt3R3LDMDtkwjI4eIwp/oN5Jwn9DphmimJR0/REqF/kGvziT8nP4uyxQ
oYbkaYs2Gl3NDSBpJD62yp5xJnbzjg==
=vEM9
-----END PGP SIGNATURE-----

--Mw6P8J2fjIL/VzBO--


