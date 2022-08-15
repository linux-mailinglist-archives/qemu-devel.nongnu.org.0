Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28975927D7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 04:42:44 +0200 (CEST)
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNQ3v-00050Q-6J
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 22:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oNPzL-0001HH-JW; Sun, 14 Aug 2022 22:38:00 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:39547
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oNPzI-0001HZ-2n; Sun, 14 Aug 2022 22:37:59 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M5djk3Wtzz4xV3; Mon, 15 Aug 2022 12:37:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660531066;
 bh=CwFL05aon2HlzNjTpkWJWYU882XSQa8y5pieoFIkQxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X3BIu8NlYuP/PnvIUIM3h1pK83HfB/wHZdLBwOA6avkPUZgs8wTrCJPzf/LFTmySe
 6t/AJz9i+heuozbhM4NhCnlz5+e1qQ5VDVziid7mPYxzmSLnQ8NYKH7OYrR/aqA796
 oZM7+sK8KXe3U3rds3VWqD9oZROVInJ09G2d3eSk=
Date: Mon, 15 Aug 2022 12:37:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Message-ID: <Yvmxc27ueztj47Q+@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com>
 <YvCCbNOkX4ZtaoWl@yekko>
 <1991166b-a463-4812-a6fe-eae5299fc3f1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RPnrDEGYqcOxws4W"
Content-Disposition: inline
In-Reply-To: <1991166b-a463-4812-a6fe-eae5299fc3f1@gmail.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RPnrDEGYqcOxws4W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2022 at 07:23:09PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/8/22 00:26, David Gibson wrote:
> > On Fri, Aug 05, 2022 at 06:39:38AM -0300, Daniel Henrique Barboza wrote:
> > > The pSeries machine never bothered with the common machine->fdt
> > > attribute. We do all the FDT related work using spapr->fdt_blob.
> > >=20
> > > We're going to introduce HMP commands to read and save the FDT, which
> > > will rely on setting machine->fdt properly to work across all machine
> > > archs/types.
> > >=20
> > > Let's set machine->fdt in the two places where we manipulate the FDT:
> > > spapr_machine_reset() and CAS. spapr->fdt_blob is left untouched: what
> > > we want is a way to access the FDT from HMP, not replace
> > > spapr->fdt_blob.
> >=20
> > Given there is now an fdt field in the generic MACHINE structure, we
> > should be able to remove the one in spapr->fdt_blob, yes?
>=20
> I thought about it but I backed down when I realized that spapr->fdt_blob=
 is
> being migrated.
>=20
> At first glance it would be a matter of migrating ms->fdt and then removi=
ng
> spapr->fdt_blob, but then I got confused about how a migration to an older
> version would occur (e.g. QEMU 7.2 with ms->fdt to a QEMU 7.0 with
> spapr->fdt_blob).
>=20
> Migration to a newer QEMU would require us to move the spapr->version_id =
to 4
> and then handle the old version accordingly in spapr_post_load().
>=20
> Probably something to think about after this work is accepted.

Fair enough.  I'm confident the migration semantics can be worked out,
but it will require some care.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RPnrDEGYqcOxws4W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL5sWwACgkQgypY4gEw
YSJm4A//bH9c7q508FW6w1+tkQihu0ppSQC/5AUjjKpmgBH6INv+QqmqV4scIsID
cOSejgorBBr45BWHvQkAmwOVTxiv8qIiZ9CIXwJHnTvxZTqRuF+ifgXCFvd+iYAw
Wx/AW1tgWJ3657RBAtMAKCMBSUKi/SHoROWXTFFlFaGZlz1aW1ePDlfgnY5eZPtK
gVT7+FTjodz1wkduWAYun4nrP4n4y52/+jDORhpXwEhOgNnZ3ae3W7qHWsYqGHhO
wX0KlC/h39tIbZCmJVZIJVuxCifkLyxiCIo2GQ847M4aPYcmVSt7pY/3qRUR9m6E
ipG3hOmclqeEpNSeokGlBAhTOeYrWZm3fcUo6ysmXxuLfilMJjE9liVKSMNYaMtK
/oGCJrWI5F0qLMJRM3NK22WoG/eKgRQMg1notD8dwRYWvJu1+CssmIwJZJukDNyI
Xjft+x279f2Yb7BFDfAs3ZgcXR9WiyjFNR6uqf1c+zB6I5HXxV0zk4rrLFSFohqP
x+TGpJqipw/wqisB8y+nRDEpszp801bI+4VUZVuFuQw2N+9763zocyKSDBv+EInN
x8oRfGpVvAEWTaEBzf+KSm/53K05XsSPYnJj5wBOca217fVKDjFr3vXfryDm5fJI
IrHTx0ZVIxHFMd7uIjuYEo//HNYDnDlMaKVWjW93NtqkE9m28zA=
=/qra
-----END PGP SIGNATURE-----

--RPnrDEGYqcOxws4W--

