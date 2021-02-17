Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D57C31D3C9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 02:31:02 +0100 (CET)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCBgD-0001KA-GY
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 20:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCBZO-0003qi-9Y; Tue, 16 Feb 2021 20:23:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39821 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCBZK-00061U-8h; Tue, 16 Feb 2021 20:23:58 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgKqL6HfPz9sVF; Wed, 17 Feb 2021 12:23:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613525022;
 bh=bnpI/JdvromNodQU8PwSNaacfqkdNQ9fz76UNwr2Wnc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BqoWSChS6ahKSbAf1LeA/YcVaNGsCqUweJGQ0+RIkJeZbZCv9pL02PgOPSB0SAS6f
 vpQG3akJnjZ4trNPqScCk2atoOGOhrG1jjp51UVGuC5Jq7QJaBd4QBsp4lph9S1lu2
 5nhvHVDNP3mM4CKX9pFNyGbyk2z/cdF7eJfL9IEo=
Date: Wed, 17 Feb 2021 11:58:46 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 4/7] spapr: rename spapr_drc_detach() to
 spapr_drc_unplug_request()
Message-ID: <YCxqRvigvKj8Cb7p@yekko.fritz.box>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DmqrORgae6S2UYS+"
Content-Disposition: inline
In-Reply-To: <20210211225246.17315-5-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DmqrORgae6S2UYS+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 07:52:43PM -0300, Daniel Henrique Barboza wrote:
> spapr_drc_detach() is not the best name for what the function does.
> The function does not detach the DRC, it makes an uncommited attempt
> to do it. It'll mark the DRC as pending unplug, via the 'unplug_request'
> flag, and only if the DRC state is drck->empty_state it will detach the
> DRC, via spapr_drc_release().
>=20
> This is a contrast with its pair spapr_drc_attach(), where the function is
> indeed creating the DRC QOM object. If you know what spapr_drc_attach()
> does, you can be misled into thinking that spapr_drc_detach() is removing
> the DRC from QEMU internal state, which isn't true.
>=20
> The current role of this function is better described as a request for
> detach, since there's no guarantee that we're going to detach the DRC in
> the end. Rename the function to spapr_drc_unplug_request to reflect what =
is is
> doing.
>=20
> The initial idea was to change the name to spapr_drc_detach_request(), and
> later on change the unplug_request flag to detach_request. However,
> unplug_request is a migratable boolean for a long time now and renaming it
> is not worth the trouble. spapr_drc_unplug_request() setting drc->unplug_=
request
> is more natural than spapr_drc_detach_request setting drc->unplug_request.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Good reasoning.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c             | 6 +++---
>  hw/ppc/spapr_drc.c         | 4 ++--
>  hw/ppc/spapr_pci.c         | 2 +-
>  hw/ppc/trace-events        | 2 +-
>  include/hw/ppc/spapr_drc.h | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 85fe65f894..b066df68cb 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3654,7 +3654,7 @@ static void spapr_memory_unplug_request(HotplugHand=
ler *hotplug_dev,
>                                addr / SPAPR_MEMORY_BLOCK_SIZE);
>          g_assert(drc);
> =20
> -        spapr_drc_detach(drc);
> +        spapr_drc_unplug_request(drc);
>          addr +=3D SPAPR_MEMORY_BLOCK_SIZE;
>      }
> =20
> @@ -3722,7 +3722,7 @@ void spapr_core_unplug_request(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
>      g_assert(drc);
> =20
>      if (!spapr_drc_unplug_requested(drc)) {
> -        spapr_drc_detach(drc);
> +        spapr_drc_unplug_request(drc);
>          spapr_hotplug_req_remove_by_index(drc);
>      }
>  }
> @@ -3985,7 +3985,7 @@ static void spapr_phb_unplug_request(HotplugHandler=
 *hotplug_dev,
>      assert(drc);
> =20
>      if (!spapr_drc_unplug_requested(drc)) {
> -        spapr_drc_detach(drc);
> +        spapr_drc_unplug_request(drc);
>          spapr_hotplug_req_remove_by_index(drc);
>      }
>  }
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 555a25517d..67041fb212 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -386,11 +386,11 @@ void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
>                               NULL, 0);
>  }
> =20
> -void spapr_drc_detach(SpaprDrc *drc)
> +void spapr_drc_unplug_request(SpaprDrc *drc)
>  {
>      SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> =20
> -    trace_spapr_drc_detach(spapr_drc_index(drc));
> +    trace_spapr_drc_unplug_request(spapr_drc_index(drc));
> =20
>      g_assert(drc->dev);
> =20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 1791d98a49..9334ba5dbb 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1726,7 +1726,7 @@ static void spapr_pci_unplug_request(HotplugHandler=
 *plug_handler,
>              if (state =3D=3D SPAPR_DR_ENTITY_SENSE_PRESENT) {
>                  /* Mark the DRC as requested unplug if needed. */
>                  if (!spapr_drc_unplug_requested(func_drc)) {
> -                    spapr_drc_detach(func_drc);
> +                    spapr_drc_unplug_request(func_drc);
>                  }
>                  spapr_hotplug_req_remove_by_index(func_drc);
>              }
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index 1e91984526..b4bbfbb013 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -50,7 +50,7 @@ spapr_drc_set_allocation_state(uint32_t index, int stat=
e) "drc: 0x%"PRIx32", sta
>  spapr_drc_set_allocation_state_finalizing(uint32_t index) "drc: 0x%"PRIx=
32
>  spapr_drc_set_configured(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_attach(uint32_t index) "drc: 0x%"PRIx32
> -spapr_drc_detach(uint32_t index) "drc: 0x%"PRIx32
> +spapr_drc_unplug_request(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_awaiting_quiesce(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_reset(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_realize(uint32_t index) "drc: 0x%"PRIx32
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index 8982927d5c..02a63b3666 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -243,7 +243,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner=
, uint32_t drc_type_mask);
>   * beforehand (eg. check drc->dev at pre-plug).
>   */
>  void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
> -void spapr_drc_detach(SpaprDrc *drc);
> +void spapr_drc_unplug_request(SpaprDrc *drc);
> =20
>  /*
>   * Reset all DRCs, causing pending hot-plug/unplug requests to complete.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DmqrORgae6S2UYS+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsakYACgkQbDjKyiDZ
s5KQtw/+P6MeKDxmacCgTP9bDc8CxUFeoJLz5uJWyMSMzfRxzFfZulH5RYRcYzSl
wz87e/X9SKskSlaUoMjWjn/q+KCVzV6PvcOHEqCHP7ktx3cu6mKrxDR4msts7KMe
XNcMB22+EW58wm+iXOaNpfLSjn5pIk9abgS7INhqA1p+3GblQ4v2/X4ck7EPHoKk
HxLScRQkWcak1NbY+bt/at7K3MJcMGQ/urFLCrC+Z2Lw8qOT0+n/XvEL4eRk+Gxp
YnDSSQ/zzBmTrVX9gLTCvbsjKuELM047govNNE9D4B1srT9TD9ij/HtjcojYB2uY
JXdwXaz8gY76cHHI7EHX4ZNkFn7RX0kB2ECqlu4JCFEwtfo/iIH9BW/YJsULFykU
mCXZyIGQTuPBm0+HTtKiNlv1oZ2j0I0YKAgsvP4eKv8YQyhKfwNwJh8b7GdIwqz/
1GtW4d+Ub3U/+V1rw3PxklVC/6t8PQJI7BT/CTh43VVvjF18CKTRvBFQsmrTSel1
sFKReibazLXlwDv69f5+ugMZlo8WwkvJOYzbACjjMKbQcDv3bX6q0eg5Wdnn5bKO
2EsR8usoUB3FTXto+jEeVjcKUtG80x7UIV8B7ArA+CouTRFg1BVM7QDNMcz1EITH
dyK68TBthpyaW02HEc9g3h2A82T13XsF62TSApJ1sN8RLnota/s=
=xaSj
-----END PGP SIGNATURE-----

--DmqrORgae6S2UYS+--

