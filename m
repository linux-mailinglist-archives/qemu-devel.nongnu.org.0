Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF53210A3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:02:32 +0100 (CET)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4Ih-0001Op-GK
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lE4GM-0007z9-76; Mon, 22 Feb 2021 01:00:06 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38015 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lE4GI-0005r1-PU; Mon, 22 Feb 2021 01:00:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DkWjj0wd7z9sRf; Mon, 22 Feb 2021 16:59:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613973593;
 bh=D5RHglyh1wgC5THfT2bpR1YamC9jR+S7EUzTGkwMQzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nWbZFYIk2HcIgUXc+W5PRSGkpdrPYhcGEsv5eCqFyViiq8JQvPUE5/rjSHLPAzTiN
 TVruGuFEJdTNhzQMrQ0aUqDBADu0V/Y8QR6Ahczka3dpXj3uNGTKqPiw6fZ4jKcPpe
 xYV+gYX+AG0+qkHllCEmvJylrbfAvJ1SheZonCzk=
Date: Mon, 22 Feb 2021 16:54:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 7/7] spapr_drc.c: use DRC reconfiguration to cleanup
 DIMM unplug state
Message-ID: <YDNHLvD+iVj8jqNQ@yekko.fritz.box>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-8-danielhb413@gmail.com>
 <YCyAAe4dJzpsgQ0x@yekko.fritz.box>
 <5026c1ed-ebbc-99fc-ac7e-146fe6c9d32b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ViYkE8EuWg1hPoen"
Content-Disposition: inline
In-Reply-To: <5026c1ed-ebbc-99fc-ac7e-146fe6c9d32b@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ViYkE8EuWg1hPoen
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 06:31:46PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 2/16/21 11:31 PM, David Gibson wrote:
> > On Thu, Feb 11, 2021 at 07:52:46PM -0300, Daniel Henrique Barboza wrote:
> > > Handling errors in memory hotunplug in the pSeries machine is more co=
mplex
> > > than any other device type, because there are all the complications t=
hat other
> > > devices has, and more.
>=20
> [...]
>=20
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index ecce8abf14..4bcded4a1a 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -3575,6 +3575,36 @@ static SpaprDimmState *spapr_recover_pending_d=
imm_state(SpaprMachineState *ms,
> > >       return spapr_pending_dimm_unplugs_add(ms, avail_lmbs, dimm);
> > >   }
> > > +void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
> > > +                                           PCDIMMDevice *dimm)
> > > +{
> > > +    SpaprDimmState *ds =3D spapr_pending_dimm_unplugs_find(spapr, di=
mm);
> > > +    SpaprDrc *drc;
> > > +    uint32_t nr_lmbs;
> > > +    uint64_t size, addr_start, addr;
> > > +    int i;
> > > +
> > > +    if (ds) {
> > > +        spapr_pending_dimm_unplugs_remove(spapr, ds);
> > > +    }
> >=20
> > Hrm... how would !ds arise?  Could this just be an assert?
>=20
> !ds would appear if we do not assert g_assert(drc->dev) down there, where=
 you
> suggested down below that a malicious/buggy code would trigger it, for ex=
ample.
> With that assert in place then this less likely to occcur.
>=20
> I guess what I can do here is:
>=20
> - remove the g_assert(drc->dev) from down below, since it's more related =
to the
> logic of this function;
>=20
> - here, check if drc->dev is NULL. Return doing nothing if that's the cas=
e (all the
> function relies on drc->dev being valid);
>=20
> - if drc->dev is not NULL, then we can g_assert(ds) and proceed with the =
rest of
> the function
>=20
> This way we become a little more tolerant on drc->dev being NULL, but if =
drc->dev
> is valid we will expect a unplug dimm state to always exist and
> assert it.

Seems reasonable.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ViYkE8EuWg1hPoen
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAzRy4ACgkQbDjKyiDZ
s5Lg8Q/+K6QaykQcfECTjszw11EPnC4pTJKvuE5IWV5RPb2rts74VRJEdsS8msmu
ZmX0oWCG1IAJ/wN8FwzMwvYy3Gr0EJWwL7hG0+sX8os/hvp8B7Lrh1WdPynjuU7N
9skxivrb27IwVm2icbQxnVVWYS+vVd/dMn8Mo9OHOVDJ/rz+GWmZgQxKsRdhPleF
6zvsSU4afmh2vh7LbYEO20edJf+q1gBow9Cjcwc1Atuhgj8Ddgsnr3sEeMJFBcLF
tuGxHkHXgJ9h0wcgGj7dL4dnmwNo5aoOSL9T58rugqbOPl7i3AT7REGP1AlMNlEv
lXQVC3+4ZdgTZI5sERDIR+lyWz0v//+L2r0KVqUvt+kkj7fwzYumgM5CqU7z5tyn
N1zrDsXP+/09CjH9/GjJEiSbgUlgG3LsctN0/SYBYOigHFpCg2/blDA6fhqJ3iYN
1Tp+dCd6i4Ije7Jdbd+ndwdD03+kPOqoECKU4G9H63LYAD+zqPK5chx9ba2vmfky
MDhY/3FLWeGHpRlIkuFFPVfpFK4iO5w1yoaF1fFXq5JOQLy5rAAzSuT4jfxUALyT
EPqQjm2xh7ytJM6Qo7fvYJ9NmAi++gS51sS1faUkIo8fIE+5TdKE6+u4wVPwfHm3
P+8V1hE7Nhfgh/NMb03BcK5iXbPa6xrezmFzjdjUJg4NWyFTeWU=
=AojL
-----END PGP SIGNATURE-----

--ViYkE8EuWg1hPoen--

