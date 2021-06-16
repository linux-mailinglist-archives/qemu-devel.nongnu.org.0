Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C08D3A9335
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 08:53:16 +0200 (CEST)
Received: from localhost ([::1]:49130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltPQJ-0004Yq-LC
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 02:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ltPHK-0004cg-Cr; Wed, 16 Jun 2021 02:43:58 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ltPHI-0004MI-1U; Wed, 16 Jun 2021 02:43:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G4bHm5BbDz9sWl; Wed, 16 Jun 2021 16:43:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623825828;
 bh=0DUu3lRXHR5DG1pEITL4goniGx2aulSUC1BfVV9JgjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jbxU1j+/RFjQmjbDIZbimBwBlipo5xpwvyWuBbjA8MAYuIS7pl9gKknejHD5kazmB
 MUVT8A+jDbzmztt5uyi3zR8drgTiZyPx8PS2IaAgeVwh6vGdAoCMYVRI11amfBJXde
 6GJPcHGB07Otyld8YUvQ9i/3AEnRdn8S2VcdsgD0=
Date: Wed, 16 Jun 2021 16:18:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate
 priviledged addresses
Message-ID: <YMmXuwiH2bpDtzda@yekko>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
 <c2ffffa6-2868-f7ab-78c6-1f29eaafc4e5@linaro.org>
 <1c27c473-be10-41cf-d633-bcd838fed78e@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/3EEa2dC3thOhUKR"
Content-Disposition: inline
In-Reply-To: <1c27c473-be10-41cf-d633-bcd838fed78e@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/3EEa2dC3thOhUKR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 08:32:32AM -0300, Bruno Piazera Larsen wrote:
> On 14/06/2021 19:37, Richard Henderson wrote:
> > On 6/14/21 12:16 PM, Bruno Larsen (billionai) wrote:
> > > This patch changes ppc_cpu_get_phys_page_debug so that it is now
> > > able to translate both, priviledged and real mode addresses
> > > independently of whether the CPU executing it has those permissions
> > >=20
> > > This was mentioned by Fabiano as something that would be very useful =
to
> > > help with debugging, but could possibly constitute a security issue if
> > > that debug function can be called in some way by prodution code. the
> > > solution was implemented such that it would be trivial to wrap it aro=
und
> > > ifdefs for building only with --enable-debug, for instance, but we are
> > > not sure this is the best approach, hence why it is an RFC.
> > >=20
> > > Suggested-by: Fabiano Rosas<farosas@linux.ibm.com>
> > > Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> > > ---
> > > =A0 target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
> > > =A0 1 file changed, 23 insertions(+)
> >=20
> > I think the first part is unnecessary.=A0 Either the cpu is in supervis=
or
> > mode or it isn't, and gdb should use the correct address space.=A0 If y=
ou
> > really want to force supervisor lookup from a guest that is paused in
> > usermode, I suppose you could force MSR.PR=3D1 while you're performing =
the
> > access and set it back afterward.
> I don't see why GDB should not be able to see supervisor level addresses
> just because the CPU can't. when debugging, we wanna see exactly what QEMU
> sees, not what the guest sees, right?

That kind of depends whether you mean gdb attached to the gdb socket
provided by qemu - in which case I think you want it to see what the
guest sees - or gdb debugging qemu itself, in which case it does want
to see what qemu sees, but doesn't use this code path AFAIK.

> Now, if this is changing more than
> just privilege level, I agree there is a problem, but I wouldn't think it=
 is
> the case...

> > I think the second part is actively wrong -- real-mode address lookup
> > will (for the most part) always succeed.=A0 Moreover, the gdb user will
> > have no idea that you've silently changed addressing methods.
>=20
> I disagree. Real-mode address will mostly fail, since during the boot
> process Linux kernels set the MMU to use only virtual addresses, so real
> mode addresses only work when debugging the firmware or the early setup of
> the kernel. After that, GDB can basically only see virtual addresses.
>=20
> Maybe there is a better way to handle this by having GDB warn the user th=
at
> the CPU can not decode the address in it's current state, but I do think =
it
> is a good tool to have, as it would've made debugging the first RFC on th=
is
> topic a bit easier, and farosas was actively complaining that isn't a
> feature yet.
>=20
> >=20
> > r~

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/3EEa2dC3thOhUKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDJl7sACgkQbDjKyiDZ
s5KneQ/9FkpPbjxYEtoW5tWVU6ilwrdKk2afl4j02c4zHU0gnJrWr6nPGDq45TRA
32mM0JX7WN+L0XaUGIjl/ajt0b93yPdllL5bFETQxVAmWemcgqgpA/N+kIO2f8Z1
4N+FEIC7wDtKSgmIxTlFXp6tjNPt59ZGYTjFhEon2SuOx5jQqVWAmKssmpKnDCaY
Kjfa5KZR2HHUQ0L/OSN2Igx4e5CMFUV8bZCOx5iNjHk7p+AL+42iWIGxa2B9Mty/
9RLTBkoRnJiUaePvBK6rW4+sc3Soh8bQ8foN+dvvJKRaRFHj59NsYCJdFO3r6CbK
UTshrEWxlV0oIqUncJBb1+2QB+8FFRcE/hompa3ZiNdc9nTg3hI75gppyKqSgJhU
RA4f4iOZCXuxtxrYH3JQoGfKFCw2DJzlCAvXi8cLcy1AAjVMqHfcX4Uau90AmoYE
+s3osQgyTwfjkZQq34lwcr/7NvMYjkQs1jOS5x3ybi1XF6Mm1PcXvSmlr80N98F7
+g0Cq8JZ38T3RM7hFz052mvytLJ1POk65QqYI1WEfiw4ArQZoLdlIfWxnxKXGPTU
58KuVLmpZz5WB4DeR2ZK1ZXoKG2LqBABIwgo5WRA4x5DGlTFgVHi9zgrdgtsKRrA
goE/GNzf+Bc6WbHgN8gbDyHFKMju7m9Wn9IskzMazbFwClUS0GY=
=rwXC
-----END PGP SIGNATURE-----

--/3EEa2dC3thOhUKR--

