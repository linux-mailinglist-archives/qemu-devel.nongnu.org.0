Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718554DD3C0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 04:51:47 +0100 (CET)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV3eU-0004U7-0G
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 23:51:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nV3Y0-0002sB-Ml
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 23:45:04 -0400
Received: from [2404:9400:2221:ea00::3] (port=35065 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nV3Xy-0004vE-Bs
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 23:45:04 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KKVJX2LBpz4xvn; Fri, 18 Mar 2022 14:45:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1647575100;
 bh=IClvkkRizMu9vBKs6YFi70pATf+rG6vVGlIbIgZj4Jg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mqqLfiupf2oGhZ9pBppYGUdykQExbL/EZsbAPZ+QzpFUJEJowBBzSp05XKGDo3j3D
 Gp/4RarJxRCOR0cVaUNTw4V7c3mBxP27egkQPAAzC6Zy+Os/P6fCATMor/BrNjD2d+
 b8QO/8Jbj5NP3FjexePU3v2fKt1sl8cMRbactnqs=
Date: Fri, 18 Mar 2022 14:43:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Question about vmstate_register(), dc->vmsd and instance_id
Message-ID: <YjP/5jzGh48ts5V+@yekko>
References: <38c43d66-e57c-e0fe-d35f-c411d40d6611@gmail.com>
 <CAFEAcA8eZ0G=ZxyCv7xCk-ZE7R_t6BnDtbGCsYgSBuLwyHprsQ@mail.gmail.com>
 <YjNh2jSDpWvLJ1S3@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Mn7JW1lFhQfmQpIl"
Content-Disposition: inline
In-Reply-To: <YjNh2jSDpWvLJ1S3@work-vm>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Mn7JW1lFhQfmQpIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022 at 04:29:14PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Thu, 17 Mar 2022 at 14:03, Daniel Henrique Barboza
> > <danielhb413@gmail.com> wrote:
> > > I've been looking into converting some vmstate_register() calls to us=
e dc->vmsd,
> > > using as a base the docs in docs/devel/migration.rst. This doc mentio=
ns that we
> > > can either register the vmsd by using vmstate_register() or we can us=
e dc->vmsd
> > > for qdev-based devices.
> > >
> > > When trying to convert this vmstate() call for the qdev alternative (=
hw/ppc/spapr_drc.c,
> > > drc_realize()) I found this:
> > >
> > >      vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate=
_spapr_drc,
> > >                       drc);
> > >
> > > spapr_drc_index() is an unique identifier for these DRC devices and i=
t's being used
> > > as instance_id. It is not clear to me how we can keep using this same=
 instance_id when
> > > using the dc->vmsd alternative. By looking a bit into migration files=
 I understood
> > > that if dc->vmsd is being used the instance_id is always autogenerate=
d. Is that correct?
> >=20
> > Not entirely. It is the intended common setup, but because changing
> > the ID value breaks migration compatibility there is a mechanism
> > for saying "my device is special and needs to set the instance ID
> > to something else" -- qdev_set_legacy_instance_id().
>=20
> Yes, this is normally only an issue for 'system' or memory mapped
> devices;  for things hung off a bus that has it's own device naming,
> then each instance of a device has it's own device due to the bus name
> so instance_id's aren't used.  Where you've got a few of the
> same device with the same name, and no bus for them to be named by, then
> the instance_id is used to uniquify them.

Thanks for the information.  I remember deciding at the time that just
using vmsd wouldn't work for the DRCs because we needed this fixed
index.  At the time either qdev_set_legacy_instance_id() didn't exist,
or I didn't know about it, hence the explicit vmstate_register() call
so that an explicit instance id could be supplied.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Mn7JW1lFhQfmQpIl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIz/98ACgkQgypY4gEw
YSJyCRAAiAcpJfa9avGcOfZ5pPnmFBNce0PKmbjI45pQrdAjPZpSsHW7LBHzjqUN
uIhwOfcH7D7itHTAS6QoKQlGIWROejbBJa1KvceNh4pOyX0ayNiQ/HdxSteKcQVO
FmgyGlEGiYIJklYkFhesDviFROPENw0FCN+RwHKDjP4lZdOaaUmNqSIJoePHdVKZ
Gp/HfZy1iwhWysThRFkvUvWKvN70OQfF3FlvFQJFaWiBKZ9TsrO0cix/0oDKhVf2
SH3bTUZg8wPk+XIJowT31JN9zuQTIgVW43hjOsfUggam/FXG6/0CHKMFdCcTH7ec
xaGrQtm+z+u1HwDAvCy/evBPeTLHrOE/iCvogBFCRUsdtmiK9YriX0TV+d2/k4pk
TiecLzD8X46ef/eqUB0aECR6fawHoHW+0aAxz9E6D79BfK7GLHTZkCxapy11a70k
7K4X3S5jkOmgyQrjhwPRUwT/C4VmhobEqOfxVr0b+P/Fu8HqGbWEE5We543P0YCK
VMDniTIJSi2rJVjQr4cG8PsIxmCYsqnNjjjCEAFDyJPvo/kMTVJBp18uNgIfuyJN
cNKvl4PFRvgZf6IO/eu3X7H41OMSxR4xsqqwf9NTfDDil8cLHOhqtqR9euOlWRgJ
w1zQ1FK3o2+dLMaDGOMuvlU6DJzGloihheXBhqu6NBo+BPvIQsY=
=JWcA
-----END PGP SIGNATURE-----

--Mn7JW1lFhQfmQpIl--

