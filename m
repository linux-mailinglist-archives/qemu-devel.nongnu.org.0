Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9CD2F10CB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:06:39 +0100 (CET)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyv1y-0000v7-4M
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kyv0E-0008N2-6X; Mon, 11 Jan 2021 06:04:50 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:57319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kyv0B-0002WD-Pq; Mon, 11 Jan 2021 06:04:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DDrSc4Wvkz9sW8; Mon, 11 Jan 2021 22:04:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610363072;
 bh=Ab5vmHX/pSSAWvPadvTlF4KfKETvH5u77KGErk2vMeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MzfjmUwWazU3zaGJsKJGH3JIroADXWgz+lFo5IKUaxnAwUh6Ya2KHex63TtnQ/BkS
 JC+RooKz+8OLXu/iJ4reWdlQKB15QpG/uspImrjH6DZ+FuzgB20M7Ec+v2kLUR82CP
 wHZg42LogAItjSy14fJ6PdfEsJHSnelexP8N031k=
Date: Mon, 11 Jan 2021 20:23:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 0/4] hw/ppc: Convert UIC device to QOM
Message-ID: <20210111092336.GA3051@yekko.fritz.box>
References: <20210108171212.16500-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <20210108171212.16500-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 05:12:08PM +0000, Peter Maydell wrote:
> This patchseries converts the PPC UIC "Universal Interrupt
> Controller" to a QOM device.  My main reason for doing it is that
> this fixes a couple of long-standing trivial Coverity issues -- the
> current ppcuic_init() function allocates an array of qemu_irqs which
> the callers then leak.  (The leak is trivial because it happens once
> when QEMU starts.)
>=20
> The first half of v1 is in master now, so this is just a
> respin of the last four patches.
>=20
> Changes v1->v2:
>  * fixed the bug in the sam460ex conversion handling of CINT
>    (tested that this now boots AROS OK to a desktop)
>  * other minor code style tweaks to patch 1 as per review

Applied to ppc-for-6.0, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/8GRYACgkQbDjKyiDZ
s5JEXxAA1OoL+5zKKK0Py0f2i1ER7AR6b2G86vbbZ7DYAA4UQgs84cKB9mc0+TRO
7tXFlJeU26DAOHGND7+TrXI1rI/H0zXSaaKFrX0WhaKCcRdd7LjV+S3jvtMCELbF
UOyXklGNy9QElpuwT7QlFUFjf3+k72CJ5VFZvVXJA3SVUHqoPJUYmM8ntoOMiJoW
m/ofvwzvm/dl2taA/aMC5SJHhBXJ1wvwDkAq8XtKl78wB81V+iXKXPu61Tn6ABXE
x7NOF8xhbPH/GHcROdVEgA44Lvx59K1itfrGxrTGzlkboEB6dzXH0cfffjssC9ot
qrO638+jhuw/sU2nM96OoPj/tLZBRXJd6GV9R1tOSllU6rhgdG4OzrgjPuQwfGZu
179Sq7ASCk02H7oucJRXh6cO7WDA70JD+blkxnONNK+fP72+lU/xrmUfM+S8LIJf
jniMbbsdyKQiSRSY6Sjw2Do2bFj43C1g4G+DO16VCJRsLce9oV/1bRx835DMfGIQ
3cHegNzpAdzH3P/9mNFGBLmPe7r0MafvcuKJnXcGrTTEjMtqO7ErKIJ/BJsP/AF/
Wa8gYWEWeYbg3kViFn9zxJI7Y4eclngmQ51B09343S2lAw9UQPQ9CIqkV1DDWaiC
/jXDyWN75CfDxYUuGAm4AmuC+FBmT/FIvdWltb74FRVVlgkcTCo=
=pANK
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--

