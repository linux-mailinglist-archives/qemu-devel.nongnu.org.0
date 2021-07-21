Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0F33D0904
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:36:53 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65qe-0006Qr-Gf
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65ne-0003cA-W7; Wed, 21 Jul 2021 02:33:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34363 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65nb-0006q3-Iq; Wed, 21 Jul 2021 02:33:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GV5Pv5sgsz9sXN; Wed, 21 Jul 2021 16:33:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626849219;
 bh=YLrLGNEaUpETsn74FJpnhHt8tWYmTYGQX4Ew0/pJglQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D8VgbDukNryjgybdnE8sml6bAqHxq8cs2Zf0yqfhS2sYSo5qFMVyheVTi7RnAnmXk
 SPRI3oqC0/UywN3ei/FoHAzoWNpL7L42AQOGYgSZAfEt/dk4kM9CGaAZxuraqichxs
 TcZL4IHAN5wS5IfHqoPAQDm/LjVtRsWrYhYSHP2s=
Date: Wed, 21 Jul 2021 16:23:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH for-6.2 v6 7/7] memory_hotplug.c: send
 DEVICE_UNPLUG_ERROR in acpi_memory_hotplug_write()
Message-ID: <YPe9R4xj/BiQlJqz@yekko>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-8-danielhb413@gmail.com>
 <20210719171324-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RmrrlS5U/wPiAddH"
Content-Disposition: inline
In-Reply-To: <20210719171324-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, armbru@redhat.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RmrrlS5U/wPiAddH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 05:13:44PM -0400, Michael S. Tsirkin wrote:
> On Mon, Jul 19, 2021 at 05:08:27PM -0300, Daniel Henrique Barboza wrote:
> > MEM_UNPLUG_ERROR is deprecated since the introduction of
> > DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
> > MEM_UNPLUG_ERROR is pending.
> >=20
> > CC: Michael S. Tsirkin <mst@redhat.com>
> > CC: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>=20
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Michael, can I assume I have your ack for 1/7 as well?
=20
> Pls merge with rest of series.
>=20
> > ---
> >  hw/acpi/memory_hotplug.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> > index e37acb0367..a0772fe083 100644
> > --- a/hw/acpi/memory_hotplug.c
> > +++ b/hw/acpi/memory_hotplug.c
> > @@ -8,6 +8,7 @@
> >  #include "qapi/error.h"
> >  #include "qapi/qapi-events-acpi.h"
> >  #include "qapi/qapi-events-machine.h"
> > +#include "qapi/qapi-events-qdev.h"
> > =20
> >  #define MEMORY_SLOTS_NUMBER          "MDNR"
> >  #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
> > @@ -181,10 +182,19 @@ static void acpi_memory_hotplug_write(void *opaqu=
e, hwaddr addr, uint64_t data,
> > =20
> >                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> > =20
> > +                /*
> > +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> > +                 * while the deprecation of MEM_UNPLUG_ERROR is
> > +                 * pending.
> > +                 */
> >                  if (dev->id) {
> >                      qapi_event_send_mem_unplug_error(dev->id, error_pr=
etty);
> >                  }
> > =20
> > +                qapi_event_send_device_unplug_error(!!dev->id, dev->id,
> > +                                                    dev->canonical_pat=
h,
> > +                                                    true, error_pretty=
);
> > +
> >                  error_free(local_err);
> >                  break;
> >              }
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RmrrlS5U/wPiAddH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD3vUcACgkQbDjKyiDZ
s5IMfA/9HTRXz454qe5m5IUge7oyoh6Yo0kU4ygp+xGIWC0HNVipOInTFzSyuQJU
cLYyIgAU2JawHCh/5/gCpVx/C95HWMX5xC2D7nbCJPJRfihrrRCtra26hly8Dw5b
KWbMB7mYBEPzTHyt8mt1d95sqkE6qPKdZ6k3jnKCSVxxkCUCrj60EF0P5vYbeSG7
67rmi47Uc80q5tAJSVSnRD6VQPrrAAvVquBlixkPkJ3bpZaASNG0b2LD9qxYNAy7
IbDHrvlGGToRdnx8hHXMmEabGRyd457ByBZN61x9SIfv2F7cjyuhPd+tqtc5VqpX
9wl+c6g4TQu9l2ecCJoHugoU/qAdB7xo1oiUg5gUTsRnI3BnDp+gD3ETq/LaOPaJ
n3wf9NySz5O3XT2kcO6ihpirILwWRjvt1NcP6Bh2q3zbLn61Y9F8sp5S2e3GU4nV
NUvsU4/ZWu2sq4mpSKroPJyWiEKj1OUsTD6Pv7EZWLiP8w5anTVRPg8fxcTuIfQ0
ZmvrJAu5GWEPv+vnRh3IJonv992A7UKz5JZQBBGB04zqMcb5ZhIcdpMLN/dQPVlx
YpzqM/npmClv6nOQ4i4p93v5UA1PpD8RouTT574AyMwoDEyvy4BEaP9zHQzgD3JP
Dlu2VcsMPnDfof5xnP3xQZVjXJJ9G08419P59o1jrpLm0KkEXxw=
=zRsm
-----END PGP SIGNATURE-----

--RmrrlS5U/wPiAddH--

