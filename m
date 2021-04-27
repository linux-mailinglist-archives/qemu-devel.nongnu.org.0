Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1600736BD0D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 03:59:02 +0200 (CEST)
Received: from localhost ([::1]:41926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbD09-0006Ql-4x
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 21:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy6-0003ph-VW; Mon, 26 Apr 2021 21:56:55 -0400
Received: from ozlabs.org ([203.11.71.1]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy1-0000hm-Ue; Mon, 26 Apr 2021 21:56:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTlHV4hT6z9sWC; Tue, 27 Apr 2021 11:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619488598;
 bh=FmpgvGTjB4+h4hwY1UCtBYkSJxQDhMlPmzScbXaZqzQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jun7YpGtxqyjTrNlofhCTfb4RLx65nArRx8WIQfSd1GHWT8P7W1/oWOz/mdqpDm+E
 on0ZL4+IwKZoVpWmiu2W8TEsd9/WGf4TryWWL5I4M6QTNIsN7B/186rig3dAARBXP0
 59tCWfeubSZhOlcGszQ1OzqfU6bEfAJ9/OAaR95g=
Date: Tue, 27 Apr 2021 11:45:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/5] hw/ppc/spapr_iommu: Register machine reset handler
Message-ID: <YIdso1hf+bXwZHmG@yekko.fritz.box>
References: <20210424162229.3312116-1-f4bug@amsat.org>
 <20210424162229.3312116-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lRIBJY4z0FMAdfYH"
Content-Disposition: inline
In-Reply-To: <20210424162229.3312116-2-f4bug@amsat.org>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lRIBJY4z0FMAdfYH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24, 2021 at 06:22:25PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The TYPE_SPAPR_TCE_TABLE device is bus-less, thus isn't reset
> automatically.  Register a reset handler to get reset with the
> machine.
>=20
> It doesn't seem to be an issue because it is that way since the
> device QDev'ifycation 8 years ago, in commit a83000f5e3f
> ("spapr-tce: make sPAPRTCETable a proper device").
> Still, correct to have a proper API usage.

So, the reason this works now is that we explicitly call
device_reset() on the TCE table from the TCE tables "owner", either a
PHB (spapr_phb_reset()) or a VIO device (spapr_vio_quiesce_one()).

I think we want either that, or the register_reset(), not both.

>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  hw/ppc/spapr_iommu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index 24537ffcbd3..f7dad1dc0fe 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -24,6 +24,7 @@
>  #include "sysemu/kvm.h"
>  #include "kvm_ppc.h"
>  #include "migration/vmstate.h"
> +#include "sysemu/reset.h"
>  #include "sysemu/dma.h"
>  #include "exec/address-spaces.h"
>  #include "trace.h"
> @@ -302,6 +303,11 @@ static const VMStateDescription vmstate_spapr_tce_ta=
ble =3D {
>      }
>  };
> =20
> +static void spapr_tce_reset_handler(void *dev)
> +{
> +    device_legacy_reset(DEVICE(dev));
> +}
> +
>  static void spapr_tce_table_realize(DeviceState *dev, Error **errp)
>  {
>      SpaprTceTable *tcet =3D SPAPR_TCE_TABLE(dev);
> @@ -324,6 +330,8 @@ static void spapr_tce_table_realize(DeviceState *dev,=
 Error **errp)
> =20
>      vmstate_register(VMSTATE_IF(tcet), tcet->liobn, &vmstate_spapr_tce_t=
able,
>                       tcet);
> +
> +    qemu_register_reset(spapr_tce_reset_handler, dev);
>  }
> =20
>  void spapr_tce_set_need_vfio(SpaprTceTable *tcet, bool need_vfio)
> @@ -425,6 +433,8 @@ static void spapr_tce_table_unrealize(DeviceState *de=
v)
>  {
>      SpaprTceTable *tcet =3D SPAPR_TCE_TABLE(dev);
> =20
> +    qemu_unregister_reset(spapr_tce_reset_handler, dev);
> +
>      vmstate_unregister(VMSTATE_IF(tcet), &vmstate_spapr_tce_table, tcet);
> =20
>      QLIST_REMOVE(tcet, list);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lRIBJY4z0FMAdfYH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHbJ0ACgkQbDjKyiDZ
s5LydBAAnqZtMLxlYhM4g3oljAvGbZrSNUYJFjsClyeaqc8nJKqMxlMwtbYv1omB
rk6He1E59eWe4K7u2RCAUUPVYxtNgDiHtm2NNW8a4uw0S1V/6Fh++2YyWoQl/Mw6
639TGtPT3hBirchp9cCPw+Im54zSGIIDQa8jvJ+hJt0+Xa6FG1XSmpdQcl4iKMph
HuQ8LC6nN51jtrA7a4oI54QuaLJBCfst0B7ljxZULPUQTQUpkRkNqIsiubERNvrV
aIwnSx0rtsHreqf691PcFAucz1HgXM43nVPkaNW/EjuocicC0xAANYXt3f1hp19W
0CTYR6mazF88HF+TApAYYWdFWqo9bxoe/WU7UIwqqwwX9glKTEjWjwRgFOvs346W
7zauaYOx2OeOmhpX5hQcAaUKd0yS3bIkiCP7PhmNtmKK48xb2tUyR9d5697dtrwZ
Aw2lERTAEtJLPSeYqE2xcVtRid4UnG0ufclPyCVgNn8by7T2c/idwFeLB6uh3Dvl
16rpGuuicHeTEYw5WwbWyzm3EZuco/uKOgS3/kMR7BnXaDPysrKdshzcLY8kESUE
oz3yIPMqRQNgdNTZCNGmg5MgBCEWE0kqc9f98jN5hQpZZJddyQkYIkWp8yIy69MB
YjMeFswxbhlYqB0BYrR+kuhXfTN08/77KvvEm1jaxsHnJaj562M=
=kFZT
-----END PGP SIGNATURE-----

--lRIBJY4z0FMAdfYH--

