Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A344DE771
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 11:28:59 +0100 (CET)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVWKP-0000U3-C8
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 06:28:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nVWES-0007VX-3d
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 06:22:48 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:45805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nVWEN-0006FI-Hm
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 06:22:47 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KLH4n1zQCz4xc2; Sat, 19 Mar 2022 21:22:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1647685353;
 bh=sFmhnnjF74CkDiyPv0EnOeaokul4yzyLYI6yn5WdcWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eEUdLW5QkOShAoEQZUbOPmNeoNKq+HCcP4wBv5NYaXmx2HwbusbqvEH7eMXJgqdC2
 qlINe81MZnWFpt+AsmNAam//aC0k343TB4rneVpRfXxRcH34jZ96c4RsNuItlacwTI
 GccjxHr4iLcxFWngQaBmzk37UzhabG0L+pIB65Bo=
Date: Sat, 19 Mar 2022 20:43:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: Question about vmstate_register(), dc->vmsd and instance_id
Message-ID: <YjWluwTn8GtjfQgT@yekko>
References: <38c43d66-e57c-e0fe-d35f-c411d40d6611@gmail.com>
 <CAFEAcA8eZ0G=ZxyCv7xCk-ZE7R_t6BnDtbGCsYgSBuLwyHprsQ@mail.gmail.com>
 <YjNh2jSDpWvLJ1S3@work-vm> <YjP/5jzGh48ts5V+@yekko>
 <caff9323-89c8-a44b-bf7a-882711efd5a6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ea/A7r2KYduOnszR"
Content-Disposition: inline
In-Reply-To: <caff9323-89c8-a44b-bf7a-882711efd5a6@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ea/A7r2KYduOnszR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 04:51:10PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/18/22 00:43, David Gibson wrote:
> > On Thu, Mar 17, 2022 at 04:29:14PM +0000, Dr. David Alan Gilbert wrote:
> > > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > > On Thu, 17 Mar 2022 at 14:03, Daniel Henrique Barboza
> > > > <danielhb413@gmail.com> wrote:
> > > > > I've been looking into converting some vmstate_register() calls t=
o use dc->vmsd,
> > > > > using as a base the docs in docs/devel/migration.rst. This doc me=
ntions that we
> > > > > can either register the vmsd by using vmstate_register() or we ca=
n use dc->vmsd
> > > > > for qdev-based devices.
> > > > >=20
> > > > > When trying to convert this vmstate() call for the qdev alternati=
ve (hw/ppc/spapr_drc.c,
> > > > > drc_realize()) I found this:
> > > > >=20
> > > > >       vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vm=
state_spapr_drc,
> > > > >                        drc);
> > > > >=20
> > > > > spapr_drc_index() is an unique identifier for these DRC devices a=
nd it's being used
> > > > > as instance_id. It is not clear to me how we can keep using this =
same instance_id when
> > > > > using the dc->vmsd alternative. By looking a bit into migration f=
iles I understood
> > > > > that if dc->vmsd is being used the instance_id is always autogene=
rated. Is that correct?
> > > >=20
> > > > Not entirely. It is the intended common setup, but because changing
> > > > the ID value breaks migration compatibility there is a mechanism
> > > > for saying "my device is special and needs to set the instance ID
> > > > to something else" -- qdev_set_legacy_instance_id().
> > >=20
> > > Yes, this is normally only an issue for 'system' or memory mapped
> > > devices;  for things hung off a bus that has it's own device naming,
> > > then each instance of a device has it's own device due to the bus name
> > > so instance_id's aren't used.  Where you've got a few of the
> > > same device with the same name, and no bus for them to be named by, t=
hen
> > > the instance_id is used to uniquify them.
>=20
>=20
> Thanks for the info. qdev_set_legacy_instance_id() was the missing piece =
I was
> looking for to continue with the dc->vmsd transition I'd like to do.
>=20
>=20
> >=20
> > Thanks for the information.  I remember deciding at the time that just
> > using vmsd wouldn't work for the DRCs because we needed this fixed
> > index.  At the time either qdev_set_legacy_instance_id() didn't exist,
> > or I didn't know about it, hence the explicit vmstate_register() call
> > so that an explicit instance id could be supplied.
> >=20
>=20
> This is the commit that introduced DRC migration:
>=20
>=20
> commit a50919dddf148b0a2008db4a0593dbe69e1059c0
> Author: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
> Date:   Mon May 22 16:35:49 2017 -0300
>=20
>     hw/ppc: migrating the DRC state of hotplugged devices
>=20
>=20
> I'd say you can cut yourself some slack this time. Blame that guy
> instead.

Man, not that guy again! ;-)

I think I must have done something similar with some other migration
component.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ea/A7r2KYduOnszR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmI1pbMACgkQgypY4gEw
YSJ/JA//eEFzYRuU5ZhTffOgoEwwJBNviKU+51GZbRoOzolxTw8ikOaj2jnjGVlX
jEMERXzde2LgfCe2n5rmxg/zSrhTCMmQeViSa2IGH48GWEkeLvG0fJwuMmN0X8/O
FFEA8p0AHG1EaFWFG1p0WXHcY+JB+1XWLkUTQpIuRv7R/+cwFBJ0nn9Cv7Kt+Inh
4iwAVIdnz50i73ZpNQZYxEyjhSOpK/hH6OHK6orU81CqmTJHe5OWxdhMUYNutuT3
vRoI1YdbxXbyOPZbWz0BMfMqlWpvef5OzoTItpb9QzdK8zIRsXXS4B+3vvWdLCRu
2LrGXS4yFLzR7UuFqRbIoNjSm2QTQ9Aaq/JhLa//HTJ/p51KXXFRRQnxB6d4jyiN
RVBfE+m+I5MAV1PJMhvkpirwBmsOs5H5tHAhVcLLD6mteDo0Y0bpCZBybIosklmH
U9Px2gN8UvaTZL+nh/L65h1xO/UqqvdHUoNKuqCpZ1fjDerPKkOKE7hj7iwADPab
H90eFINcQ+DlxK5zPlp+fzrvXV0MOPVdZ+2NnNS5wsR9odM3XctBjFTMlaYwXjWc
IOtehMpeKq6nPobrgma1WnPap6CfgzJTzqy6tnjgE/GhxZ3aWloIpiPl2HM71Gu8
6vhkrP1TUwuYMI0IGBnf4LErW6fnQ8nXrpPJ2c8kNkbKfCna7g0=
=bhLC
-----END PGP SIGNATURE-----

--ea/A7r2KYduOnszR--

