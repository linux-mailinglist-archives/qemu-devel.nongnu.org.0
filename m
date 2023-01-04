Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA14565D60F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:39:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD4vj-0002hR-MJ; Wed, 04 Jan 2023 09:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pD4va-0002gs-MU
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pD4vZ-0000w8-C5
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672843174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BoYQoEw1SmGfaWKWLt1LAGuvL4iUZ21a0Q4e9PMSNQc=;
 b=CYrNzuy2l09zQc9bOmkuRUo/qNz/xnN8wX/XD7uh1ZlPJ4zFj+VrgwM5tDSyfvcC8LZ9rx
 P4o9bJwoX/vWp+091EgKcXncIIHNuULYJPLvhV2OAkK+wlHszPetAwLj+/UKLLou34tYjN
 kTeMNBhJRizGo15xk3J44Vazko/r/b0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-RMrI9dPdMr6gURj0Z_DT7A-1; Wed, 04 Jan 2023 09:39:33 -0500
X-MC-Unique: RMrI9dPdMr6gURj0Z_DT7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9B31280BCA2;
 Wed,  4 Jan 2023 14:39:32 +0000 (UTC)
Received: from localhost (unknown [10.39.193.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B98A2166B30;
 Wed,  4 Jan 2023 14:39:32 +0000 (UTC)
Date: Wed, 4 Jan 2023 09:39:30 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alessandro Di Federico <ale@rev.ng>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Anton Johansson <anjo@rev.ng>, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: Re: [PATCH] Update scripts/meson-buildoptions.sh
Message-ID: <Y7WPoq2d/J0ZUpXG@fedora>
References: <20230102104113.3438895-1-ale@rev.ng>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gggjSiqnMs6aoT7l"
Content-Disposition: inline
In-Reply-To: <20230102104113.3438895-1-ale@rev.ng>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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


--gggjSiqnMs6aoT7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 02, 2023 at 11:41:13AM +0100, Alessandro Di Federico wrote:
> Note: `Makefile` relies on modification dates in the source tree to
> detect changes to `meson_options.txt`. However, git does not track
> those. Therefore, the following was necessary to regenerate
> `meson-buildoptions.sh`:
>=20
>     touch meson_options.txt
>     cd "$BUILD_DIR"
>     make update-buildoptions
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>  scripts/meson-buildoptions.sh | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

The discussion we're having is independent of this patch:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--gggjSiqnMs6aoT7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmO1j6IACgkQnKSrs4Gr
c8ggsggAq7wAdnNQ2yS7RH3uB1KsEkFi7GH6CY82EQjkkdJu5KclLRJ6Gd8VXN23
0CUV0QoOfpL48oUnsqf9PXRcBoltoQSMLp9hQmcOtOKdY6qy49StB/0pvaiI9biy
RiC7YZFjEzkFjYDu8BBkv0gGjwWishn2/nT32P0ITIv1jd6/yxFxbsvijpi05EeF
JZZlVfzn4Qlr+Sn+tdVsYW+LlVmLsH8hyMnxv/CxQfMj7pqUSG3cleMWuhB+OGja
l1Wc7U054HkPVQIibXHdQzatFQA2aFg1Au1FMlBxHofU/qnglxLIG4PB5MpciU0B
tDkiJdtbFkHyA1pt5+WU15MG4RLu5A==
=SPpl
-----END PGP SIGNATURE-----

--gggjSiqnMs6aoT7l--


