Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E648232248D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 04:13:32 +0100 (CET)
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEO8h-0003xj-Q3
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 22:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO37-0006EJ-NR; Mon, 22 Feb 2021 22:07:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45053 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO34-0003Dt-7G; Mon, 22 Feb 2021 22:07:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl3rT1gBqz9sVr; Tue, 23 Feb 2021 14:07:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614049657;
 bh=K6Z3D59FDsiQ92Y/dGZ2W2dh1e9j1RvXDv3f8ds8kvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cv8ZtfqO3fbRlzqHOK1lfINVPhd6+xnfqaY9Ey3Wm3V+jTB43LmuOwMLgk+dCBNSi
 O/NLWHcjMI3fzo2xsSdu+xzT2RAM9BU18txAPdWXQsK4e51t7zirOW8AeLczA1/Jct
 zbuoLlpazDHW0J+OlEi9v2TSl6vG/OHunwH0Vt6g=
Date: Tue, 23 Feb 2021 11:13:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 2/5] spapr: rename spapr_drc_detach() to
 spapr_drc_unplug_request()
Message-ID: <YDRIjXPwLM35nc3P@yekko.fritz.box>
References: <20210222194531.62717-1-danielhb413@gmail.com>
 <20210222194531.62717-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HGGeAy1srSswKZd0"
Content-Disposition: inline
In-Reply-To: <20210222194531.62717-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


--HGGeAy1srSswKZd0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 04:45:28PM -0300, Daniel Henrique Barboza wrote:
> spapr_drc_detach() is not the best name for what the function does. The
> function does not detach the DRC, it makes an uncommited attempt to do
> it.  It'll mark the DRC as pending unplug, via the 'unplug_request'
> flag, and only if the DRC state is drck->empty_state it will detach the
> DRC, via spapr_drc_release().
>=20
> This is a contrast with its pair spapr_drc_attach(), where the function
> is indeed creating the DRC QOM object. If you know what
> spapr_drc_attach() does, you can be misled into thinking that
> spapr_drc_detach() is removing the DRC from QEMU internal state, which
> isn't true.
>=20
> The current role of this function is better described as a request for
> detach, since there's no guarantee that we're going to detach the DRC in
> the end.  Rename the function to spapr_drc_unplug_request to reflect
> what is is doing.
>=20
> The initial idea was to change the name to spapr_drc_detach_request(),
> and later on change the unplug_request flag to detach_request. However,
> unplug_request is a migratable boolean for a long time now and renaming
> it is not worth the trouble. spapr_drc_unplug_request() setting
> drc->unplug_request is more natural than spapr_drc_detach_request
> setting drc->unplug_request.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr.c             | 6 +++---
>  hw/ppc/spapr_drc.c         | 4 ++--
>  hw/ppc/spapr_pci.c         | 4 ++--
>  hw/ppc/trace-events        | 2 +-
>  include/hw/ppc/spapr_drc.h | 2 +-
>  5 files changed, 9 insertions(+), 9 deletions(-)
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
> index f1c7479816..b00e9609ae 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1723,12 +1723,12 @@ static void spapr_pci_unplug_request(HotplugHandl=
er *plug_handler,
>                       * functions, even if their unplug weren't requested
>                       * beforehand.
>                       */
> -                    spapr_drc_detach(func_drc);
> +                    spapr_drc_unplug_request(func_drc);
>                  }
>              }
>          }
> =20
> -        spapr_drc_detach(drc);
> +        spapr_drc_unplug_request(drc);
> =20
>          /* if this isn't func 0, defer unplug event. otherwise signal re=
moval
>           * for all present functions
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

--HGGeAy1srSswKZd0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0SI0ACgkQbDjKyiDZ
s5JCgQ/+NGJiHWNSVNugg3eXoT1zXvt9LPyMtulJzRh187BFXlcfD6sfTsuPtG39
ilyKWRpX1xw8nisdruHxlv4KGUoVs3b0f79Hq6WAdRScNcbcXQI1soRcBwEhBe1K
3ITBe1kJAM97N3VU4ujaMP4saYQCvNVQYffg0WSeGAeKwD63gXt2VNbvDrjV10Cx
e3CW2F4XJyQSokh8KKtcQAyx88r+NKCGtdcluzVP/XsY+MgKGhkRc6JGiELmNQ3b
lwbemJ+6vOGYo1mhy7+ppfFDKHesH/2ty7K+hCGLdwlb/qpQHvHN69mW8kffFNhe
vvCo1oNDLhuTULcsxjockV8eLxuUd+i8a5h2IhT0L8vATfwz2BEE+8KPXkf5L1yj
qCR2wZwzTLauc4HZnKUS6VI9Aowl8E50yL7DVCyXoG0BZy+r0LT3k4Cx2GHsdh7A
2gqDG+u5cfBCZN7oZVbX0jv+V2BugsQ+bFVc5kjyTdS7BKE3Vsu3Ps11TFJCvgaq
srtQTfn/c9Y4eemR88PRVS69cJVxHyVCb1lcr+pK0m4kjv9Z9vJp9b3Q2Ejkwa3g
hadHbtjVYdEb16qrsWWxA0HYfRw1r50qLdZM374rXFglFq0Db0tHoS1wlDez3YUa
GfzIKvAx/nbxpQ5+lFrtbIJtyKXSiuy0VSkPHLOveYNM3Da4QVM=
=NIRv
-----END PGP SIGNATURE-----

--HGGeAy1srSswKZd0--

