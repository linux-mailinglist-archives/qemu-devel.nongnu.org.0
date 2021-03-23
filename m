Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1FF34565B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 04:39:43 +0100 (CET)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOXtN-0001NY-QS
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 23:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOXsV-0000y2-3H; Mon, 22 Mar 2021 23:38:47 -0400
Received: from ozlabs.org ([203.11.71.1]:37219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOXsR-0002IW-AR; Mon, 22 Mar 2021 23:38:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4HC43S4gz9sVS; Tue, 23 Mar 2021 14:38:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616470704;
 bh=PAIldSaQmZR4IwjzABUp1bo/tdO4V86PHic9wh8DK7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BMdGvMx8mVLeHlNNUl9im+n7EHCgrQesfgjO5yWyEP6XW1B3cgtwMVVKrVlhC1Xmq
 WTUKwlmBnSXrU/QmueXdq4o41waTnh8ECK7EezE6Tfs2domh4vJcjcC41DiKtIEc92
 FYuu/xMxIPaI4LCe7l9bk94uEyiTvelPFb7MkHlI=
Date: Tue, 23 Mar 2021 14:33:28 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
Message-ID: <YFlhiNorrttIslFf@yekko.fritz.box>
References: <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box>
 <87mtvczvzw.fsf@dusky.pond.sub.org>
 <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
 <YErBpf7w25xho1so@yekko.fritz.box>
 <875z1w7ptm.fsf@dusky.pond.sub.org>
 <YFg7qYYBqGZuKSO+@yekko.fritz.box>
 <fc4b9be9-8fca-cfba-5c26-f3ad8ae8035c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xoF3EqLcSX3H42rs"
Content-Disposition: inline
In-Reply-To: <fc4b9be9-8fca-cfba-5c26-f3ad8ae8035c@redhat.com>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laine Stump <laine@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xoF3EqLcSX3H42rs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 01:06:53PM +0100, Paolo Bonzini wrote:
> On 22/03/21 07:39, David Gibson wrote:
> > > QEMU doesn't really keep track of "in flight" unplug requests, and as
> > > long as that's the case, its timeout even will have the same issue.
> > Not generically, maybe.  In the PAPR code we effectively do, by means
> > of the 'unplug_requested' boolean in the DRC structure.  Maybe that's
> > a mistake, but at the time I couldn't see how else to handle things.
>=20
> No, that's good.  x86 also tracks it in some registers that are accessible
> from the ACPI firmware.  See "PCI slot removal notification" in
> docs/specs/acpi_pci_hotplug.txt.
>=20
> > Currently we will resolve all "in flight" requests at machine reset
> > time, effectively completing those requests.  Does that differ from
> > x86 behaviour?
>=20
> IIRC on x86 the requests are instead cancelled, but I'm not 100%
> sure.

Ah... we'd better check that and try to make ppc consistent with
whatever it does.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xoF3EqLcSX3H42rs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZYYgACgkQbDjKyiDZ
s5JOlhAA5yQGaEKyr62+kEWOBC6fFwtm7MnkYVuQq/qbCyUXcDoCEy0HP/GO5X96
dB3MD8dNPVxb+scCNJlVy10SEz0KBmiy5kv1T11KX3ZVamHv2fY64cY5gbfp6l76
iNpS9NoBOq9EmN2P1zlkZ+lP4Pqprrn7xTFhoMWTu3wFhJESRdIxdrqaPpJbM7J5
oOLkiGI/+Sji2fgAnSvZLYqEdVNThc5Jj5AtSn1kkTPwEFyFN7G1gju6wrqrU6Kt
T7hV+f+wTaBIPktFm9DPaTy4Ripsuw3lBKnno6GvywHSDEoQTdlJcwvn8DJMyTE5
EG2fSk8O2bamYB6ZVxmIkY5uTaRUBJTcwp6vSfE8jB9StkHPF4JD9VJmUpWTQKc1
O7OxIkwPoH49V7jdO4KiOe+vptKIEq3z1ms3HkGGmCFlb2CrOSuQFe8OPGe3cuie
KJKmhzCLrVCqY4SQBEsNEN6oR3NgfSjqjIse4GI9/AYd1cyBeBcC+7n8NLFBznaU
0C+na4DllQtVh8YL+KmUzthmhhBeCIdjudEspKqgA1Bx1Mhemps2dohg89d2hqNy
FTLFMvELlZRfB54XjVsv+AuAhtCXc9oiZnSRy/hBjlhTw5vjCTuXU5ZM4da6x3dr
44oDDnyBqeq/cogKvgZzOIsxijqCWsuoXaZ3G7rIZXbxi+7F1WY=
=NJK9
-----END PGP SIGNATURE-----

--xoF3EqLcSX3H42rs--

