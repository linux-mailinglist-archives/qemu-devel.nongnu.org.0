Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC32389E1A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 08:41:32 +0200 (CEST)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljcN9-00062g-6j
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 02:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljcLy-0005H6-Ro; Thu, 20 May 2021 02:40:18 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60791 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljcLw-0001D0-Bu; Thu, 20 May 2021 02:40:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fm0V11RrKz9sWX; Thu, 20 May 2021 16:40:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621492809;
 bh=LvIt7mKsb/KyXpsqM9uGW29JAhKlgvlapJUV77w0s+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PWduVsN1MY/4wYcJsWV/9YEhiwMtRcJqMiegsFJpUIWXEDhkFdyVgx1rLGJ5CM4pS
 XLeIGyosQjwMsg2Qpdrytv7JQLa4M1VPJFymQVhgqINbVxEqzGaXj/dypYxQM9Tj94
 Tihfkjm1toabL6TxPb4uf0em8Jsgt6zTj/wgBaeQ=
Date: Thu, 20 May 2021 10:42:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Subject: Re: [PULL 00/48] ppc-for-6.1 queue 20210519
Message-ID: <YKWweU5YQRqd8Z8b@yekko>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
 <162143196022.17859.450741207443396482@0addf061776e>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HtwXTUgMo2cqrqVH"
Content-Disposition: inline
In-Reply-To: <162143196022.17859.450741207443396482@0addf061776e>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, peter.maydell@linaro.org, richard.henderson@linaro.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HtwXTUgMo2cqrqVH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 06:46:01AM -0700, no-reply@patchew.org wrote:
> Patchew URL:
> https://patchew.org/QEMU/20210519125148.27720-1-david@gibson.dropbear.id.=
au/

So, these style warnings are actually existing style problems just
being triggered in checkpatch by code motion.  Yes we'd like to clean
those up at some point, but holding off this re-org for that is not
worth it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HtwXTUgMo2cqrqVH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmClsHcACgkQbDjKyiDZ
s5KJNBAArxoQsjsSgR+4wRah984YDfL80fa3UgXZ5+3QzNUBnmXL2q7qRiKEzDOz
B68g7h32k9quvWmwQLOXD/mJeAm6abestOUWb8zYce8h4bTZazLxfZdqG0o+1Hbv
SHE44C0xpDEKWaon9h0DMxH/l0v3DFw5XvrvgNBBk0nguXIAwBUV43If9eJewAX5
9JNxlBRdY32+jftIWa/KKRUU33fl9bYngp9Fv63x9lwAP+TO91BTup/PC+qUtlMJ
Lti4Qh2jR79G/xFf3rdFiUZnIh/1zsq1hDNo6E7pdd318hBAHtxAzmC5yywUIwTu
/ihsUXeWDKp+I7KlVPFrtm5uyUcaOB2cUzYKwP0SrXh0woD4c4ilBGzozFSJcfVc
LkC+dFTcDS1AT3x1jonzzYvADmhCgm8uxGh1AQgkmLr6C0XFmG462DiM4Q4j9J0T
4gcFJrS06ESpGUvZKdWF5QCUe4ZivSXrYuoph9VAYfNQpM4Tnrb7ymNngQGkTplD
s7FZDuS/UNpEgIngRq4izyFgPpJkFVGX823urNNexqXJJ4Jx1PikTKciV7JIs85E
dPm5v2AvbZJgAetczyv/1L1F4X4x6V/lGZkr9bRKpZ5E0chh5uTFsiNt1WPyloOW
5zguTVZQtS84cBRp5J/srMrr+ehh4NB/kjw8UUzJU6yaeQErAMo=
=wWPJ
-----END PGP SIGNATURE-----

--HtwXTUgMo2cqrqVH--

