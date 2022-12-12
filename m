Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E9564A3D7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:59:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kGJ-00042h-00; Mon, 12 Dec 2022 09:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p4kGC-00040v-Ex
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p4kG9-000176-9V
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670857103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uyBPOCYTlm8buL/eo+jVVWH/ySNEx049dp5TL0XCRd0=;
 b=APW7UfYcVvMohwjC4fbPt+TTRN1OMA9nszmX21C0hKfSlS2bQ/LOOo4gjaztzeDUfPweI4
 WqIfN+nNeT2BGxVqHBWrw31JWiSfs9o+Fyx+ufKfKb1oCCq5w/pEFr6278RkQGQleBiSbN
 idDwlpDBUFQiofFkj9ZMjy7f/hoRQoM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-GmPJeMPlOyecFc2arvJ1TQ-1; Mon, 12 Dec 2022 09:58:19 -0500
X-MC-Unique: GmPJeMPlOyecFc2arvJ1TQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73D988039A2;
 Mon, 12 Dec 2022 14:58:19 +0000 (UTC)
Received: from localhost (unknown [10.39.195.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA64B492B01;
 Mon, 12 Dec 2022 14:58:18 +0000 (UTC)
Date: Mon, 12 Dec 2022 09:58:15 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] mailmap: Fix Stefan Weil author email
Message-ID: <Y5dBh5Ssw8Aotmzo@fedora>
References: <20221208155535.28363-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NQDKM8IakA9wkc/5"
Content-Disposition: inline
In-Reply-To: <20221208155535.28363-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--NQDKM8IakA9wkc/5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 08, 2022 at 04:55:35PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Fix authorship of commits 266aaedc37~..ac14949821. See commit
> 3bd2608db7 ("maint: Add .mailmap entries for patches claiming
> list authorship") for rationale.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> ---
>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)

Sorry about that! I didn't notice I merged commits with mangled email
addresses.

I'll merge this after the release has been made on Tuesday.

Stefan

>=20
> diff --git a/.mailmap b/.mailmap
> index 35dddbe27b..fad2aff5aa 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -45,6 +45,7 @@ Ed Swierk <eswierk@skyportsystems.com> Ed Swierk via Qe=
mu-devel <qemu-devel@nong
>  Ian McKellar <ianloic@google.com> Ian McKellar via Qemu-devel <qemu-deve=
l@nongnu.org>
>  Julia Suvorova <jusual@mail.ru> Julia Suvorova via Qemu-devel <qemu-deve=
l@nongnu.org>
>  Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-dev=
el <qemu-devel@nongnu.org>
> +Stefan Weil <sw@weilnetz.de> Stefan Weil via <qemu-devel@nongnu.org>
> =20
>  # Next, replace old addresses by a more recent one.
>  Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <aleksandar.markov=
ic@mips.com>
> --=20
> 2.38.1
>=20

--NQDKM8IakA9wkc/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOXQYYACgkQnKSrs4Gr
c8hikQf/bOCbo0iKa5aGrURsAhRzcabVP00vpJC+e0PtlhIoIOr7jqpA/JgcbU0U
EJZ266k0WySw+G3Lw0MK20xLFR7HZ/UGBzTMW0r2lI+WhvouCoXqx3m1nqBM7PTC
OYb41PFyrJotn7gIlKxJf+bXdsiNsJhbE1gE2rKKFwiGJqbTZwj//Mz5WuXzEL1Q
D1ZearM8CwUiMLZ2I5MqpwG0EJRFUlvYJf89H6pvmzswOEWZFVSF9EP0T9zCemIz
4wzBVrnKsSnRtMvqXEdBdBLMuK4s+I+kI0Nxp7ZB5TLub1KsiKF0Gpz3HId/V0u9
dN/MAbq8rLeb4K63A+CNqyLPiKBipg==
=ssUG
-----END PGP SIGNATURE-----

--NQDKM8IakA9wkc/5--


