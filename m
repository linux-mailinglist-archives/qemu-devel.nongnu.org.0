Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC9B3295A9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 03:33:50 +0100 (CET)
Received: from localhost ([::1]:40404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGur7-0005AA-H9
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 21:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGupR-00048K-CW; Mon, 01 Mar 2021 21:32:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58319 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGupN-0005ov-GH; Mon, 01 Mar 2021 21:32:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DqLk446Bkz9sVw; Tue,  2 Mar 2021 13:31:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614652316;
 bh=sJZ+OjR/YCBp0DAcGkc+mnCMi2BPT9KabQYiiKAjr7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zxe4SeV4kHUvs3uaQurwi8r+gVwD2V/YkhggjO7r0P8Y/+23suaYDbdZcpE6xkY0v
 YqQTJkqEKcxQ8YtN4T/PhfXbPhjs9s3DHso3SPsUlgMG1azSR+u7ZtQP4hIQ45/zyW
 K15T457hBSIN8t5XewRXPrCtNhC6s+RHaCtZA94M=
Date: Tue, 2 Mar 2021 13:31:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v13] spapr: Implement Open Firmware client interface
Message-ID: <YD2jeWRfmI8eMdRg@yekko.fritz.box>
References: <20210209110252.110107-1-aik@ozlabs.ru>
 <YDRxdIIiX9gCLEFM@yekko.fritz.box>
 <e303c1ff-e5a9-2d65-5063-d49182bdb67f@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+gyyR3C0zXi45PDo"
Content-Disposition: inline
In-Reply-To: <e303c1ff-e5a9-2d65-5063-d49182bdb67f@ozlabs.ru>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+gyyR3C0zXi45PDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 11:19:38PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 23/02/2021 14:07, David Gibson wrote:
> > On Tue, Feb 09, 2021 at 10:02:52PM +1100, Alexey Kardashevskiy wrote:
> > > The PAPR platform which describes an OS environment that's presented =
by
> > > a combination of a hypervisor and firmware. The features it specifies
> > > require collaboration between the firmware and the hypervisor.
> > >=20
>=20
> [...]
>=20
> > > +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *=
spapr,
> > > +                                target_ulong opcode, target_ulong *a=
rgs)
> > > +{
> > > +    target_ulong of_client_args =3D ppc64_phys_to_real(args[0]);
> > > +    struct prom_args pargs =3D { 0 };
> > > +    char service[64];
> > > +    unsigned nargs, nret, i;
> > > +
> > > +    cpu_physical_memory_read(of_client_args, &pargs, sizeof(pargs));
> >=20
> > Need to check for read errors in case an out of bounds address is passe=
d.
>=20
>=20
> cpu_physical_memory_read() returns void and so does
> cpu_physical_memory_rw()

Sorry, I'd forgotten that was the case.

> but eventually called address_space_rw() returns an error code, should I
> switch to it?

Yes, I think that would be best.

> > > +    nargs =3D be32_to_cpu(pargs.nargs);
> > > +    if (nargs >=3D ARRAY_SIZE(pargs.args)) {
> > > +        return H_PARAMETER;
> > > +    }
> > > +
> > > +    cpu_physical_memory_read(be32_to_cpu(pargs.service), service,
> > > +                             sizeof(service));
> > > +    if (strnlen(service, sizeof(service)) =3D=3D sizeof(service)) {
> > > +        /* Too long service name */
> > > +        return H_PARAMETER;
> > > +    }
> > > +
> > > +    for (i =3D 0; i < nargs; ++i) {
> > > +        pargs.args[i] =3D be32_to_cpu(pargs.args[i]);
> >=20
> > In general I dislike in-place endian conversion of structs, since I
> > think it's less confusing to think of the endianness as a property of
> > the type.
>=20
> The type is uint32_t and there is no be32 in QEMU. I can have 2 copies of
> pargs if this makes reviewing easier, should I?

Even having 2 copies of the struct I don't really like.  Encoding the
endianness down to the individual field level is great when the tools
are available, but as you note qemu doesn't really have that.

But even without that, I like the endianness of structs to be fixed by
convention.  Otherwise when you see a struct instance it's not very
easy to tell if it's a pre-conversion or post-conversion version at
any point in the code.  That means later changes - even just simple
looking code motions can become very fragile, because they move things
to a point where the struct doesn't have the previously expected
endianness.

By preferred solution here when using a struct which needs to map
directly onto in-memory information with a specific endianness is to
*always* leave the struct in that endianness, and only convert when we
actually take things in or out of the struct to use them in
calculations.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+gyyR3C0zXi45PDo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA9o3cACgkQbDjKyiDZ
s5LZUg/+Mc4fsji6bPJ0y4UjxOcIhcgTfE9OqoKn0WseDV49IO7tkn8qbOyJZWVG
REIn4z0oIs1GQbNTOJDrq7ovB4OMZfVsaQwQxm4/ieP6bK8oYFlsTyLz4NmRmQh1
vVWalGq1SuiiwatuuYY6QbiOyCvX2Gz7NDCo2cvp1KDbuvMuSDA1Dh8UaZ0zBgnU
VmVS59e9LzHa8SsZVyeXqc8PHVsYWk6WLQQBRfc/pnx/7u6HYmNuqPCYxrS0CYRh
q11OZrXIt2vPsnn0UED9jEH0qZr6kNASUG6Yxs4diW18LBxpiJHKbHjzCQbDfQlv
vKlI3YglXrQQHEYpaDJUCjE4cHTQ1OiUosZxIlqkORJI2vGh9ZD6KvIHBdcNlrVp
PVgsqI36ZLBbRMjjN2I5Z3d7y/c44QDrcXbjPTnhiFcdkq7fO7sX16v9Kpb8gO9w
+fLMQbAmoZlpARg0MJDR0pEkGyWwcC/QW89rxDOE+8UMOsqr5i62pLt3QyzF1Ard
CB6CvDmJMdVRtYkSLlfqASMtWMwpZNVuIJvPTsgObElRuoHBw2E6NLmcDWfRvi0V
nousKtyEAYknZweiNcyX0HMbQFOhtk6/BLtxOOrGV2hGGm+MKwCcSAzY4JPk5mCa
go5Eh5gfo0IvUe7HYki6pTBzWjDkL9lR71qG+/OEIXObJML0VKQ=
=Nyf7
-----END PGP SIGNATURE-----

--+gyyR3C0zXi45PDo--

