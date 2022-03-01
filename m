Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B464C81C3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 04:50:48 +0100 (CET)
Received: from localhost ([::1]:51900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOtXD-0008KP-Gg
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 22:50:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOtNQ-0003kb-61; Mon, 28 Feb 2022 22:40:40 -0500
Received: from [2404:9400:2221:ea00::3] (port=39575 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOtNL-00067C-Vu; Mon, 28 Feb 2022 22:40:39 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K731B6GnBz4xcq; Tue,  1 Mar 2022 14:40:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1646106030;
 bh=hMGfEUdpriKtPbNKcultP9ztAfnq6hSjYmLoku1nvrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WEJGpLcYltB7UUwxCtEGk6NjibqLjWkGjxLVCys0a3ME5tHPfhsQN1MuDI1zykdBD
 dJImMhEzjTyAeYKaM2zfp7MNP44Cb/aute9wL7V07cG6XQX9Mw9UG9dN61sdpIyXIu
 oV1129wynXMXTOKjG2KOE5jedo93/J1tMkKr5SfQ=
Date: Tue, 1 Mar 2022 14:14:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 03/14] hw/ppc/spapr_caps.c: use g_autofree in
 spapr_cap_set_string()
Message-ID: <Yh2PqitZSjl/nR2D@yekko>
References: <20220228175004.8862-1-danielhb413@gmail.com>
 <20220228175004.8862-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YBT0mpxdgU0HLcMQ"
Content-Disposition: inline
In-Reply-To: <20220228175004.8862-4-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YBT0mpxdgU0HLcMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 02:49:53PM -0300, Daniel Henrique Barboza wrote:
> And get rid of the 'out' label since it's now used.

s/used/unused/
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_caps.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 6167431271..aab313ffb1 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -120,7 +120,7 @@ static void spapr_cap_set_string(Object *obj, Visitor=
 *v, const char *name,
>      SpaprCapabilityInfo *cap =3D opaque;
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
>      uint8_t i;
> -    char *val;
> +    g_autofree char *val =3D NULL;
> =20
>      if (!visit_type_str(v, name, &val, errp)) {
>          return;
> @@ -128,20 +128,18 @@ static void spapr_cap_set_string(Object *obj, Visit=
or *v, const char *name,
> =20
>      if (!strcmp(val, "?")) {
>          error_setg(errp, "%s", cap->possible->help);
> -        goto out;
> +        return;
>      }
>      for (i =3D 0; i < cap->possible->num; i++) {
>          if (!strcasecmp(val, cap->possible->vals[i])) {
>              spapr->cmd_line_caps[cap->index] =3D true;
>              spapr->eff.caps[cap->index] =3D i;
> -            goto out;
> +            return;
>          }
>      }
> =20
>      error_setg(errp, "Invalid capability mode \"%s\" for cap-%s", val,
>                 cap->name);
> -out:
> -    g_free(val);
>  }
> =20
>  static void spapr_cap_get_pagesize(Object *obj, Visitor *v, const char *=
name,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YBT0mpxdgU0HLcMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIdj6MACgkQgypY4gEw
YSKoIw/8D8GquYlywtm3ADZNFCPTG96we0QMZcnHieTlcCDYHe2OWaV3hrSPDLIk
Md0gr+kJ6Xcoih8Ap+JSCmIM+hSj4gT3cv4oEzfwycQbbtf4CUIvq3/sxvn/KYfr
JnRHeoqZY2ZD2SJQ3Uo7W/sNXHhk+gduNSZLO0IpXBLzsip4Me8pAUffaVjD35Km
hpNQyU6EvDiXuewk1pu7Pa6xSRi472p8aSWuk/KHj93VLj0CITMQvqcVvsdhTgug
+mmJJkVyzmUWExmeymOFbFYWYD4CyVs62YWJXuwZRAHqV+JW+cDryX5H9bOPZm4L
UYmeTBVNA9856ry6SmqH07mlCp9mB/Mj3x2XkOJLKYEdu+nsvt6lFhvOxnnx4POL
6kCjzyqRWlVpe+EEVkCJw7u0sebmwiW3rk7oUTMkViSY4VHfR7BElNeE+jfdEBOg
TNga1ZIUd+8a9YpsyMC1hXI0kBx9C9JZW1X4+c72TxVz0/hjGoV+QMArWbMsxIoz
OWafnEROV4Y8qUI8QGYGqeL7Kol2YHy9xMGJiIuKtO6iTDJ4QoM3VeLlzwuDSX26
hpCrzX29AoZ4Htrs/7m1gTgrEdWtd/pkQWN+1hOYb3nbhrL4WQcKgyfSmcr6MSbN
htAvfTHIgUz/WIoqHqbLlr4j5yfeHcMMFLfUt2oTOlbTSl/TbXk=
=PlHf
-----END PGP SIGNATURE-----

--YBT0mpxdgU0HLcMQ--

