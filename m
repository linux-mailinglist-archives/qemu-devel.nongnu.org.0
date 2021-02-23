Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94083322486
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 04:10:00 +0100 (CET)
Received: from localhost ([::1]:45618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEO5H-0008U4-KK
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 22:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO3B-0006JC-5m; Mon, 22 Feb 2021 22:07:49 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53973 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO39-0003Il-CT; Mon, 22 Feb 2021 22:07:48 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl3rT6cSfz9sWF; Tue, 23 Feb 2021 14:07:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614049657;
 bh=UD/5fGlaCikEPjWUZiQqoCY2ogyb1RrSBEzhJmHlNis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5fvsb6I1gUZXwATWD5JC24qCq1RnYSJuY3dPLvpBiAiVxTim1YnIlmc/JfJXYKpG
 1mgVoGcH6ilod4c52t8hgR/ODO9eE5BamgFH4KlmU6e83Gtl5zYWfqqu61K9qAVYfT
 g8RWIluekdLDHCUVEPaykOFOoDRwg+BZY57bNbQo=
Date: Tue, 23 Feb 2021 12:56:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v13] spapr: Implement Open Firmware client interface
Message-ID: <YDRgvLAMAfLjt+Id@yekko.fritz.box>
References: <20210209110252.110107-1-aik@ozlabs.ru>
 <a1a58715-970c-2bb8-9b06-de92563c0efe@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4K4Ox7ZI6hJH39cs"
Content-Disposition: inline
In-Reply-To: <a1a58715-970c-2bb8-9b06-de92563c0efe@ozlabs.ru>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4K4Ox7ZI6hJH39cs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 10:48:51PM +1100, Alexey Kardashevskiy wrote:
> Ping?
>=20
> I need community support here :) I am hearing that having this mode helps
> heaps with development in fully emulated environments as this skips SLOF
> entirely, for example. Another rumour I am hearing is that there is inter=
est
> in running grub in the userspace which this VOF thing makes handy
> too.

Yeah, sorry.  I finally allocated time today to go through this in
detail.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4K4Ox7ZI6hJH39cs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0YLoACgkQbDjKyiDZ
s5LXCw//dsRmxMnf8r+NosuWkNy3OIi8xsGjiEyr0SUmYCzQ34Y1Z0ijA7b7K6C/
SQ6x/meHh1La15wsaUDRtEcMpNalAOxn3oE3qAhxHKbedj25jilo1aXpqF/Dk0q4
r7H3zSBcSoUM4i7fL9+VkHYgTwauxCQqrtslac3JxcjGT7Cq5MR82XuVA6M3s5Np
yBHu5AVJovFKk2hl069iOtyZzZcqR/KhDirjMQSrNVD1bvuq/vqfk6n37zokbsUD
ximpYhpYTBpOCRmfo+sBl3wE+uqpbwuxYv82GGbYK8KGqTgdMasTbB46a/twBahj
G2zmcmN1hN4sTu2Ls48ZTP+ciiA7dcr4nhKsmOMl7zLFw1ggGsKZPu5zVaEaAnzK
KEiTPK4CVjA/XquorZkeHlMk+snbWdc2ve/m2EuQ7jGB2jXQc4s8ALKHGRXBpUUR
Irk1d1odyhX+Jorm4BGa96KjpIDuRtMthJRUeu7hJsh3lvDhtO8a1wqT4BxKjimj
u+nqIGVqCziPaNSEPW/LRnKw7FoTarQPUxdYu3vmV2qJd+xic80Myx5tUxXBD8NY
1HvWHJbnvv0EeUAw/41Yho0upY+aN2h4g0oY/aMK8MxZhkvv0QR2VIrgQGH60W7R
SUGd4EsTGPn6RTU2AuFKUQzhha3Z3xJXg21Q3vg18rFnUH+vUzU=
=dBKo
-----END PGP SIGNATURE-----

--4K4Ox7ZI6hJH39cs--

