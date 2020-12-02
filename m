Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B602CB3A1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 04:58:05 +0100 (CET)
Received: from localhost ([::1]:44550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkJHI-0007wd-Mt
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 22:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkJEl-0006pT-1T; Tue, 01 Dec 2020 22:55:28 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45661 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkJEg-0007XI-WF; Tue, 01 Dec 2020 22:55:26 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cm4qd0TRwz9sRK; Wed,  2 Dec 2020 14:55:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606881309;
 bh=pr39beaK7K6McqYFye5BRacNNBtOpPkKrrP3VxiMzMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TAZ2OtFS/K4qlSDCUIy7WN42qtyTAlKa6f+ciFc1ZcAznn0N43yNhHiGSEo87SVlR
 oiJI+g+h2AVPyHtEUpqFnlj6pzdQxTm3ZjwbhkppSYewIzEiQbLC9Mqi8S2bt2I79J
 49/4PYr9VJA4zbTEICXRTAwxoZfJyh182OVvFYuU=
Date: Wed, 2 Dec 2020 14:16:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] target/ppc: Remove "compat" property of server class
 POWER CPUs
Message-ID: <20201202031642.GB7801@yekko.fritz.box>
References: <20201201131103.897430-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline
In-Reply-To: <20201201131103.897430-1-groug@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: libvir-list@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 02:11:03PM +0100, Greg Kurz wrote:
> This property has been deprecated since QEMU 5.0 by commit 22062e54bb68.
> We only kept a legacy hack that internally converts "compat" into the
> official "max-cpu-compat" property of the pseries machine type.
>=20
> According to our deprecation policy, we could have removed it for QEMU 5.2
> already. Do it now ; since ppc_cpu_parse_featurestr() now just calls the
> generic parent_parse_features handler, drop it as well.
>=20
> Users are supposed to use the "max-cpu-compat" property of the pseries
> machine type instead.

Applied, thanks.

>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  docs/system/deprecated.rst      |  7 ----
>  target/ppc/translate_init.c.inc | 59 ---------------------------------
>  2 files changed, 66 deletions(-)
>=20
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 565389697e84..09c8f380bc82 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -281,13 +281,6 @@ a future version of QEMU. It's unclear whether anybo=
dy is still using
>  CPU emulation in QEMU, and there are no test images available to make
>  sure that the code is still working.
> =20
> -``compat`` property of server class POWER CPUs (since 5.0)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -The ``compat`` property used to set backwards compatibility modes for
> -the processor has been deprecated. The ``max-cpu-compat`` property of
> -the ``pseries`` machine type should be used instead.
> -
>  ``lm32`` CPUs (since 5.2.0)
>  '''''''''''''''''''''''''''
> =20
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index 78cc8f043b92..e4082cfde746 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -10470,63 +10470,6 @@ static ObjectClass *ppc_cpu_class_by_name(const =
char *name)
>      return oc;
>  }
> =20
> -static void ppc_cpu_parse_featurestr(const char *type, char *features,
> -                                     Error **errp)
> -{
> -    Object *machine =3D qdev_get_machine();
> -    const PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(object_class_by_nam=
e(type));
> -
> -    if (!features) {
> -        return;
> -    }
> -
> -    if (object_property_find(machine, "max-cpu-compat")) {
> -        int i;
> -        char **inpieces;
> -        char *s =3D features;
> -        Error *local_err =3D NULL;
> -        char *compat_str =3D NULL;
> -
> -        /*
> -         * Backwards compatibility hack:
> -         *
> -         *   CPUs had a "compat=3D" property which didn't make sense for
> -         *   anything except pseries.  It was replaced by "max-cpu-compa=
t"
> -         *   machine option.  This supports old command lines like
> -         *       -cpu POWER8,compat=3Dpower7
> -         *   By stripping the compat option and applying it to the machi=
ne
> -         *   before passing it on to the cpu level parser.
> -         */
> -        inpieces =3D g_strsplit(features, ",", 0);
> -        *s =3D '\0';
> -        for (i =3D 0; inpieces[i]; i++) {
> -            if (g_str_has_prefix(inpieces[i], "compat=3D")) {
> -                warn_report_once("CPU 'compat' property is deprecated; "
> -                    "use max-cpu-compat machine property instead");
> -                compat_str =3D inpieces[i];
> -                continue;
> -            }
> -            if ((i !=3D 0) && (s !=3D features)) {
> -                s =3D g_stpcpy(s, ",");
> -            }
> -            s =3D g_stpcpy(s, inpieces[i]);
> -        }
> -
> -        if (compat_str) {
> -            char *v =3D compat_str + strlen("compat=3D");
> -            object_property_set_str(machine, "max-cpu-compat", v, &local=
_err);
> -        }
> -        g_strfreev(inpieces);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> -    }
> -
> -    /* do property processing with generic handler */
> -    pcc->parent_parse_features(type, features, errp);
> -}
> -
>  PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc)
>  {
>      ObjectClass *oc =3D OBJECT_CLASS(pcc);
> @@ -10905,8 +10848,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, v=
oid *data)
>      device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
> =20
>      cc->class_by_name =3D ppc_cpu_class_by_name;
> -    pcc->parent_parse_features =3D cc->parse_features;
> -    cc->parse_features =3D ppc_cpu_parse_featurestr;
>      cc->has_work =3D ppc_cpu_has_work;
>      cc->do_interrupt =3D ppc_cpu_do_interrupt;
>      cc->cpu_exec_interrupt =3D ppc_cpu_exec_interrupt;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/HBxoACgkQbDjKyiDZ
s5LFpxAAq1jRXMaTd32AhXlcDPWbFXFfKvfTqX7am0GJYLS8mQ9HUnDgeByBZkGT
Qd2y1XmY6crby6t8CAFnl8VdjGj7z1XgIYR5Z1x2X2ml02BRRyztN0LMdrW+J6TR
W1tzxF5dOvs6fSURIbpSDhsGUXz+AJnLVGZNL5Igrf9UThej8L/3RVgg4DwiWsun
smEX3M2OTVqKGR4upvVxgHsBE0bwTzpsMlb+lBQfpxqVLc6xwRJhVFZmtruf+GQI
WYpqAcPRh2FTfmBxEhsBNFecd8/g5r9NQLCZL7HAt+NVGVya2ze6UvK7wWPpve/H
QG34EgnJ6TL4IeCTfggfcB168h2sWqht21KdmOnb5jicf5qH6W+cAZ/F9oMPo8dZ
Rt2w9S0P8jOhrVZJhnZF5oajw++k/u9X8cmkCypGV9hHzDJ5O75e3kE3ealiuQ+o
1r+8qNFi2xpL+kzO/V9+tZ+4iJlQDjhw2r48FRCz8AX6cHx8zoEDhJWwQNH9ZjUf
hDlXtsX9f8y2Ns8JdWetYnNkj8dFPwtJ/3gU8SdTiYaXDZ2iE1n38IE6V4Bir7Uq
4ZWrnaeuYacd5Ba6Q3VRmQAxrRMdpNNkcZa38JjxbjVyQk2JHWhWxLEvRB+GgJVz
8mteHLKvuEDwJTiKSZG5lzJtsYxOj6pOOaQN7wOR28tqqgLA6pg=
=ITQf
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--

