Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF29382698
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 10:17:27 +0200 (CEST)
Received: from localhost ([::1]:44424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liYRK-0007s6-Ls
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 04:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liYQK-0007BU-1J; Mon, 17 May 2021 04:16:24 -0400
Received: from ozlabs.org ([203.11.71.1]:47993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liYQH-0000GB-N5; Mon, 17 May 2021 04:16:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FkBmH1BTNz9sWQ; Mon, 17 May 2021 18:16:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621239375;
 bh=VLA3gvvsiXoFh0I/e1eLHWVERSXAKdwhl1aO73EqWk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6lSdKXF3QxQqqqxobP3R/qWL449I8BME6te3HMM5m5R0H34nzCjaUTJSDvkC2Wz9
 TgtqlZ+2VRlBQOsLVu25NBh+uCUTsbGQN/TOffD2paqx8pr9tw3npgXzhGJ7Nmr7K8
 7x+I6lbt8dbbrB5Cq6f18Bxj26l1QGWCA9SevMOA=
Date: Mon, 17 May 2021 18:16:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH v3] ppc/spapr: Add support for
 H_SCM_PERFORMANCE_STATS hcall
Message-ID: <YKImSifcquZgwaUh@yekko>
References: <20210515073759.10505-1-vaibhav@linux.ibm.com>
 <YKIL/Gqc50GO+UTk@yekko> <20210517095531.6a9502c1@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0cnz+zCxgaKeRWPg"
Content-Disposition: inline
In-Reply-To: <20210517095531.6a9502c1@bahia.lan>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, aneesh.kumar@linux.ibm.com,
 bharata@linux.vnet.ibm.com, qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, imammedo@redhat.com,
 Vaibhav Jain <vaibhav@linux.ibm.com>, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0cnz+zCxgaKeRWPg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 09:55:31AM +0200, Greg Kurz wrote:
> On Mon, 17 May 2021 16:23:56 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Sat, May 15, 2021 at 01:07:59PM +0530, Vaibhav Jain wrote:
> [...]
> > > +    rc =3D (result =3D=3D MEMTX_OK) ?
> > > +        scm_perf_check_rr_buffer(perfstats, addr, size, &num_stats) :
> > > +        H_PRIVILEGE;
> >=20
> > This is a bit cryptic.  Just deal with the memtx error first, then run
> > the buffer validation.  Actually, you can unify the exit paths for
> > these and the success case by using a goto label near the end which
> > has the g_free() and return rc.
> >=20
>=20
> It seems all the g_free() calls could even be avoided by
> converting perfstats to g_autofree.

That's an even better idea.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0cnz+zCxgaKeRWPg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCiJkgACgkQbDjKyiDZ
s5IL1g/8DpbakTze5scSER2wuYdSQqYrmmPDQvOK8vbwMoMsjAuatJjsqvbMSsY+
gfoc2JaYzi+DIZ57lcGSjlgixDnkCYRbMZBUUrKB57zCUEAVxWCULto42dU9H3fH
U4lK6ZXQMnwzUwMRcBUc+4O8ZHIV2WTciwwWQYzVmQHAWFCjf5kVKFJRElu7UypD
7pMpMBR9XHAh2l+n5XkshWzaEx3cGnv2b23ek2IZmACKCxMzMB7j2nmq2qWHa01s
oNQy3BLRJCHc4LfjZfXLZPO99kTxg3ifgZwqHvjROF7WN/v3fTA4OdxvO7CWhitd
rrLvfkrPjX9HoPjbMdvOYkzsqq0TcJ55qpCx8gnf9A8kDew6yexJGNZgoOYhUnX8
4W8nlogtjQ3pTArCc7MLIN6kEdOveCFaFrKBslccc9UXq41eHX0f9qUaGm9Q9Hc/
EmFmwloxzyR4Fq+dPfry1QHjK1TWf7CF65V1e0jZhuqV7qC3bH3iYQ97n7v9id1g
DyDvDb3rVd4XjLxmt8OdzoWpVtjFmTiEbGurf6wqBhIis1Ip1D3dAGzov/d+bnGT
z7shXCuAQ9rP+w7EuHhzAZucCxNa+/g4TTA92O2GX9/IKEKgnEmqCz2ATafCzbTF
3Bph/qzFBMLzdZTjMGU3++eZk5XXrXuAAi2X6WHaLcfrTOVXWtw=
=y2Jr
-----END PGP SIGNATURE-----

--0cnz+zCxgaKeRWPg--

