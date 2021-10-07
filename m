Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42AB424B95
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 03:18:04 +0200 (CEST)
Received: from localhost ([::1]:37404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYI2t-0007e2-B2
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 21:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mYHzI-0006sr-OP
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 21:14:21 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:52109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mYHzF-0004AY-U9
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 21:14:20 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HPtdG758Xz4xb9; Thu,  7 Oct 2021 12:14:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633569251;
 bh=eDphA9hOPvcwLLclPVenT6iR+6x9BgHc88PBV1CiSaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OhhrxPmGF6CPda52KJ4KLf8SkhezBfiYffrOIgsZGLuY9a9J3/XaFlDXUlSRllnGQ
 dxTCLfaRUn2sOLKOapocKFsCbbR2YjoxJdmFRJG9NCQerYM2v1fm7eHEr+PVfF6ZTV
 HwjSrEVoneMMnxDUMYiBu7DCfHktWIzn8qP5hZ5A=
Date: Thu, 7 Oct 2021 12:14:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Rust in Qemu BoF followup 2: Rust toolchain availability
Message-ID: <YV5J3WapCN9bfg5w@yekko>
References: <YVUaDrf5BXPkZu5r@yekko>
 <YVWVNxKQVEQflD0d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OC+4mprydFTOTf4b"
Content-Disposition: inline
In-Reply-To: <YVWVNxKQVEQflD0d@redhat.com>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: peter.maydell@linaro.org, emaste@freebsd.org, slp@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, sgarzare@redhat.com, alex.bennee@linaro.org,
 imp@bsdimp.com, brad@comstyle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OC+4mprydFTOTf4b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:45:11AM +0100, Daniel P. Berrang=E9 wrote:
> On Thu, Sep 30, 2021 at 11:59:42AM +1000, David Gibson wrote:
> > Hi again all,
> >=20
> > I've now done.. or at least started... the second part of my followup
> > from the KVM Forum BoF on Rust in Qemu.
> >=20
> > I've extended the page at https://wiki.qemu.org/RustInQemu with
> > information on Rust toolchain availability.  However, I found I had a
> > lot more open questions on this one, so there are quite a lot of gaps.
> >=20
> > In particular:
> >  * I haven't so far figured out how to definitively check package
> >    information for RHEL & SLES (they're not covered by repology, and
> >    RHEL module structure confuses me, even as a RedHatter)
>=20
> Don't worry about RHEL/SLES directly wrt repology.
>=20
> For RHEL, just use corresponding CentOS as a proxy
>=20
> For SLES, just use corresponding openSUSE version as a proxy

That makes sense, I've updated the table accordingly.

> >  * I'm not at all sure what criteria to use to consider something as
> >    having "good enough" rustup support, so that information is all
> >    blank so far
> >  * I've taken a bit of a stab in the dark about what Rust version is
> >    recent enough for our purposes (1.31.0).  I strongly suspect we're
> >    going to want to move that to something more recent, but I don't
> >    know what, which will mean revising a bunch of stuff
>=20
> Our platform support matrix defines what distros we target.
>=20
> IOW we would have a strong preference for a rust version that is present
> in those distros. Essentially tests/docker/dockerfiles/*.Dockerfile
> need to be able to pull in the rust packages from the distro, if
> we are to make it mandatory.

Works for me.  Let's definitely *not* be like Kata, which installs Go
& Rust from upstream binaries, and builds qemu & a guest kernel from
source in its CI runs.

> If rust is to be strictly optional, then we have way more flexibility
> in choosing the version. We do not need to cover all distros in the
> support matrixk *provided* the rust is only used for new functionality
> and we're not introducing it as a dependancy for existing functionality.

Right, but part of the point of this exercise is seeing if we can make
this mandatory, so that's the perspective I'm working from.

> ie existing features previously released must keep working across all
> distros in the matrix. new features from a release can set a higher
> bar, since by definition it can't regress existing usage.
>=20
>=20
> Regards,
> Daniel

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OC+4mprydFTOTf4b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFeSdoACgkQbDjKyiDZ
s5JCNRAAp3dI4DSNGTnwvIveyL2N32GdBVxLIK4VEFYiWZ1df/8T6+0TkvF3W65O
mPxnLkqhNz0Q3eNgilHiQncyKcjZ+XrqJkvRI4bYTKwv0I3EOsWSd/yiVWryZbpB
DsgfjWGcbrcHPk21IJCFJnBXjknllq8CQTz7KOeuZbSdJrUHGtmsY0k631u3rUvw
FQ6hRsK/nn91bmE7T5StPGAO9Cb1bZkrEz3S2iG3gFjZp06vcF9ZF+EFEfHoTnCW
ZQImpaTS/8OAldlouseJ/VFEdH5DKRnUb3S18toBQ9RDnDoZfVj7S6Uk2pmrTa6i
8lM9Tl9oqAUaeq6jkBhGdBRr1Np6QV1z3TZtuCmnf2rOsR3eNw9Kp8aUXCWGQ52p
fuIK84vp/veyKrR0OKdrmDJJwKwJyZbNySuzLtTeiko0EJN8O6aFR+pe/ecQD+Jq
7gTQ/vl3mvqheGBZacZ0ccICW5U1PFXFmz4+Cg/129ZanUCcRsuCOhEdbBtreqna
UkPQHpZYD6iWEnbX+SjV0J0NNz5wZzoCq7E6SZrgIwIivmVtC7fApHMYFda+flFb
g0zJOdEl4vukA9hpWev6ekjX4OuyB7AxVtkIBE25qGD0AEai2Z+1/skWBso2ybCt
WOe1yAe6JY8P/py3VUcWZkRLMjdpoIWGDB1kXNsgZYwIVAtm4Gg=
=g6f9
-----END PGP SIGNATURE-----

--OC+4mprydFTOTf4b--

