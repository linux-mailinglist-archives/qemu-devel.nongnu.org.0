Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4F380108
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 02:01:07 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhLGM-0006ai-T2
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 20:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lhLED-0003rS-0C; Thu, 13 May 2021 19:58:53 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:47487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lhLE9-0007oB-RE; Thu, 13 May 2021 19:58:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fh7sd3QqYz9sWY; Fri, 14 May 2021 09:58:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620950325;
 bh=jSjrJe7yg9QmAd48m2CC9cHHABh092WyWTA9kbNPIJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JZx7ZfNaeoqZB9mnZLxIeHgLfjNQ3qgIdqdHdchV8D7hEMyd6CfhLau+3j/ceFKwJ
 cuJfWiVhcc4PD+S/BjsQUWCWYj0Beb/lU5KqvP5uAgzOKe5gfWmJeMbhB8mDKhmYZ4
 CKW4fKFCE2p0a760d3PUU7YMXq4xxI3JcsaG6Jdw=
Date: Fri, 14 May 2021 09:36:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 01/10] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
Message-ID: <YJ236b4eraeUY1XH@yekko>
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dttmHqDLDEWEvI6L"
Content-Disposition: inline
In-Reply-To: <20210513163858.3928976-2-philmd@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dttmHqDLDEWEvI6L
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 06:38:49PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Per the kconfig.rst:
>=20
>   A device should be listed [...] ``imply`` if (depending on
>   the QEMU command line) the board may or  may not be started
>   without it.
>=20
> This is the case with the NVDIMM device (it is certainly possible
> to start a machine without NVDIMM) , so use the 'imply' weak
> reverse dependency to select the symbol.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

ppc part
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  default-configs/devices/ppc64-softmmu.mak | 1 -
>  hw/arm/Kconfig                            | 1 +
>  hw/i386/Kconfig                           | 1 +
>  hw/mem/Kconfig                            | 2 --
>  hw/ppc/Kconfig                            | 1 +
>  5 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/=
devices/ppc64-softmmu.mak
> index ae0841fa3a1..cca52665d90 100644
> --- a/default-configs/devices/ppc64-softmmu.mak
> +++ b/default-configs/devices/ppc64-softmmu.mak
> @@ -8,4 +8,3 @@ CONFIG_POWERNV=3Dy
> =20
>  # For pSeries
>  CONFIG_PSERIES=3Dy
> -CONFIG_NVDIMM=3Dy
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b887f6a5b17..67723d9ea6a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_VIRT
>      imply VFIO_PLATFORM
>      imply VFIO_XGMAC
>      imply TPM_TIS_SYSBUS
> +    imply NVDIMM
>      select ARM_GIC
>      select ACPI
>      select ARM_SMMUV3
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 7f91f30877f..66838fa397b 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -23,6 +23,7 @@ config PC
>      imply TPM_TIS_ISA
>      imply VGA_PCI
>      imply VIRTIO_VGA
> +    imply NVDIMM
>      select FDC
>      select I8259
>      select I8254
> diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
> index a0ef2cf648e..8b19fdc49f1 100644
> --- a/hw/mem/Kconfig
> +++ b/hw/mem/Kconfig
> @@ -7,6 +7,4 @@ config MEM_DEVICE
> =20
>  config NVDIMM
>      bool
> -    default y
> -    depends on (PC || PSERIES || ARM_VIRT)
>      select MEM_DEVICE
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index e51e0e5e5ac..66e0b15d9ef 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -3,6 +3,7 @@ config PSERIES
>      imply PCI_DEVICES
>      imply TEST_DEVICES
>      imply VIRTIO_VGA
> +    imply NVDIMM
>      select DIMM
>      select PCI
>      select SPAPR_VSCSI

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dttmHqDLDEWEvI6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCdt+kACgkQbDjKyiDZ
s5LR3w/+OqXRQjfiq2SHFQrpIX4ItYsFTG9bvEdagQOryZA4UnAvYVQQU7cvgdZt
p7lDOeHppW5FwyTl4Z/u+kxmA/qSTpo1UEk9PSt1jrSn4CFsz/LBhcDc+REiouKY
WeRaj3Hm9zTNiQRpRrPTR/O+7qPzMX8REu2d2iAm0/Fdxzx2YOqIwQcNVElKa2Jg
CuaDb3JQewmp9IbjzFOXaiSbYGGmSZIe/t+1+bl7QIBOhcK3iJ4FWH/6rBIwbLft
iqbujCoFUCS3X0RHqGJBQk0kLXX3rBbduuYeIh68vNp3zrd1fgTvkcPVLD04+KR4
l0kXot2ZIl2kQ8wYP/Pl83n5tIhfmGeAlNAA5WTCvSIFqfBr9jQA8w3gCsZSr70e
kVu7IWA3c+5KPMU2+e4DBWb8CCGPl50gGh98KAUeml3MCJuEN4kZA4egnIdLlSQ9
2YWJ1XGHqD1y7o2sGgMgj9FKslqB3UoKeyhsn1YROGSuxfGtvedJB1pbrMzwEeg/
DVchfgp8c4S9qHdnmQnPwYBmNiOkGINEkCdAdJQhPSae9IzepaTGyLEUzCylVkT9
jaMT+PzVWwjhRzUTA2EIAmXgcV1yb1EZb8DYDa+WV0ymT43/4DlodJS2s1dcZ1NW
S4Udg4xPFTMFff9cMxxl/53TwljP9KTS4j5Cuw37s4qViZuX39g=
=OLkx
-----END PGP SIGNATURE-----

--dttmHqDLDEWEvI6L--

