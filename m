Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CCD4E61FD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 11:52:09 +0100 (CET)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXL4a-0002ld-Sj
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 06:52:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nXL1p-0001uW-Af
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 06:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nXL1n-0000d4-2Y
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 06:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648118954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MuGyHZaZbgrU9BlfbYH/MFdUdQ8wkHLkaGFWP8ehtac=;
 b=GSO4yB/XQEXykfaGEnRIykhvydSCp0UY+89x3pIz7WwImq1O6cxTqa/pB1Uy2v3iImA+TM
 /4NGcG0fHd777Bp2Ydv6fVo/LVWVH3Y573Jn0vlKnxFiaefkFqN2gSz0BVJF816S97fIU+
 fE6aNBRm6G/qL1zlJmfY4YxbsozbM2w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-GtS2CI1TPRqZ3Mx9YEd0-A-1; Thu, 24 Mar 2022 06:49:10 -0400
X-MC-Unique: GtS2CI1TPRqZ3Mx9YEd0-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8F681C06911;
 Thu, 24 Mar 2022 10:49:09 +0000 (UTC)
Received: from localhost (unknown [10.39.195.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24D35C27E95;
 Thu, 24 Mar 2022 10:49:09 +0000 (UTC)
Date: Thu, 24 Mar 2022 10:49:08 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH-for-7.0 0/2] misc: Fix misleading hexadecimal format
Message-ID: <YjxMpJuuGTuHrSZw@stefanha-x1.localdomain>
References: <20220323114718.58714-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iC0pKhxs9KLiHW1Q"
Content-Disposition: inline
In-Reply-To: <20220323114718.58714-1-philippe.mathieu.daude@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iC0pKhxs9KLiHW1Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 12:47:16PM +0100, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Fix 0x%d misleading format reported here:
> https://lore.kernel.org/qemu-devel/dab530d9-53d2-3d7d-c9ac-44906ba9b386@l=
inaro.org/
>=20
> Philippe Mathieu-Daud=E9 (2):
>   block: Fix misleading hexadecimal format
>   hw: Fix misleading hexadecimal format
>=20
>  block/parallels-ext.c | 2 +-
>  hw/i386/sgx.c         | 2 +-
>  hw/i386/trace-events  | 6 +++---
>  hw/misc/trace-events  | 4 ++--
>  hw/scsi/trace-events  | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)
>=20
> --=20
> 2.35.1
>=20

Nice fix, thank you!

Applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--iC0pKhxs9KLiHW1Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmI8TKQACgkQnKSrs4Gr
c8gsEggAwX6Z8VvJfi/k06sL4ClnP8mcsmMn0vtaByI362gISfQJgsMbL4K17Ce8
BvzmRxtEA5kb/GB3YulbUdybqk0ib6hWj8RxVGD0Pls/E6Cfr/nveJA7O3L86jiN
OX8ZNk24vSpheLsRK2ILWz+8g0qPs/5IhHqlcTAJ4SSNOwuqlmU7KlRo2tW+VEJb
cNOdUR8dEFa+8kIJf+xp7VzF7EkAXGCF2RF5UWxYcN43ZctJjjajMfOgWWIEmwUf
LzeplWz9aR5mMG79hjz6/OS4jAxWwK1gwwaNl2WWhr05v/cjyG+Bfe7+FhdnqeiF
ZW62J9N0w3Q1SCF1uOhl4xObOTs5ig==
=45Yj
-----END PGP SIGNATURE-----

--iC0pKhxs9KLiHW1Q--


