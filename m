Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD51037F25C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:36:48 +0200 (CEST)
Received: from localhost ([::1]:50548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh35b-0005Oh-VZ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sY-0007Hd-Bf; Thu, 13 May 2021 00:23:18 -0400
Received: from ozlabs.org ([203.11.71.1]:57945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sT-0004Z8-0N; Thu, 13 May 2021 00:23:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms4NjBz9t0T; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=6FDAqjrtV1e9H1fqQMUWMiRTtN2DYf6Adsfk68ek/YA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ajqAZukGTlPCc3YJMz7jxlsXutCLEnRAzDR9Fk9u9oh34hSkI8SwYy95l/dj04ox9
 zozpfFLXjA+WWgxLKHKS9a3/bN5cBI7+bovlKXx12phZNOlDzXa1sMtQhOB/LrFEZH
 q/b/kCaqxTtWf4rw2m3Hfc+iLcX9rtGSqVZDDwOU=
Date: Thu, 13 May 2021 13:54:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 06/11] target/ppc: updated vscr manipulation in machine.c
Message-ID: <YJyi9SmRVn6l6RT8@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-7-bruno.larsen@eldorado.org.br>
 <38a6063e-7b38-4469-891c-b5fce2be4ce7@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OjIItNROBgXNYRhT"
Content-Disposition: inline
In-Reply-To: <38a6063e-7b38-4469-891c-b5fce2be4ce7@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OjIItNROBgXNYRhT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 12:08:52PM -0500, Richard Henderson wrote:
> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> > Updated the code in machine.c to use the generic ppc_{store,get}_vscr
> > instead of helper style functions, so it can build without TCG
> >=20
> > Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> > ---
> >   target/ppc/machine.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> Squash this into patch 1.

Or don't since I already applied patch 1.  I've applied this one as
well.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OjIItNROBgXNYRhT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcovUACgkQbDjKyiDZ
s5JdDBAA4IpYTuGh/CwpExFz3oYGGfiG7ox6c05WqUQTeDks5gBRwOXWqcs4eURW
l8nItMb52v0JR7cGVCHU3Z0aMotb7NlZlVXfP4ujyMdqrBceV+80XWkZPWcbHnG7
V2eY3BOQDUR8rwqQRwdPXT5vzb2gR9/FvZZHQeCzPn7Ht2Xp9GjveRovLuVrOfHn
K6e+fAZ/o5eV9JS2p5FrJrv8qJoAgZAt7bdYmc/MTXyuJsz3ewdsVGuqbkLym1U5
AgxVXjkuPBzfsBX0oqbAZVEC1jkc5Q2//IXpAN0lLJ5vlzZtVPQPl1zjZ4/6qzh3
Xnpvk1BrTKl940udZQ8OiBU+BYRg1M1q4W7yxZRjj8/FBhosSuj6qJ1/oBe18cJD
shOmmJWXqSROWp6fozVSXrznkoRilCTKP/HoU9BMEI4WIFwQ5l+Dr85IkZ0euqeX
wjHmjUE03rEzLyktW9fJ/vS+AwBpQjcke+0JoX8mgWpeQHRzwfGrrWw3s2BwmvD6
Vujjk10IsnKSC7m3EnNytFVj+aFjm3Xqv2IutL9wIYgECXkXsjvso638CtQor1RI
dLKRKK0cyC7n0HGOkhwUs/bcpjKU9YXOXh8MoE7VnSeZiRgRtN8nlqyxYVXtXQLi
U98joR/0Lmv3P3BOcJPQOxQRWnLNkYhcmve9e2REkB8dyzykr0U=
=mIJl
-----END PGP SIGNATURE-----

--OjIItNROBgXNYRhT--

