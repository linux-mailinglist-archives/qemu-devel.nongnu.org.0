Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22CF3F6E77
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:29:54 +0200 (CEST)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkXx-0007EO-LH
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGi-0000kY-1a; Wed, 25 Aug 2021 00:12:08 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGg-0007Xd-5D; Wed, 25 Aug 2021 00:12:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbv2b2Qz9t54; Wed, 25 Aug 2021 14:11:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864699;
 bh=F1Ejx5L3c4uOPejRq4XUGB+qeX4A81syeodR1EyTYFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwdv3IQb+7KKDqy0xWhfY6oRsi4+i0EJpsuNFMkms5xX8P1E0h40/1r8GO3TaO7Zl
 wtPb9LRlGlx4sJKOV8pasT0rH5PKay+oQ97hHjIxDCnHfyNLY54fRR/P9oIyIeQO82
 ZG6TGvCebv9r5dK9vWq01efgWsR81U10Lab1txjU=
Date: Wed, 25 Aug 2021 13:55:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 7/7] memory_hotplug.c: send DEVICE_UNPLUG_GUEST_ERROR
 in acpi_memory_hotplug_write()
Message-ID: <YSW/R096DU/oUCpl@yekko>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-8-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dnle06mNOJVmKGrg"
Content-Disposition: inline
In-Reply-To: <20210825004835.472919-8-danielhb413@gmail.com>
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, armbru@redhat.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dnle06mNOJVmKGrg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 09:48:35PM -0300, Daniel Henrique Barboza wrote:
> MEM_UNPLUG_ERROR is deprecated since the introduction of
> DEVICE_UNPLUG_GUEST_ERROR. Keep emitting both while the deprecation of
> MEM_UNPLUG_ERROR is pending.
>=20
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/acpi/memory_hotplug.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 6a71de408b..d0fffcf787 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -8,6 +8,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-acpi.h"
>  #include "qapi/qapi-events-machine.h"
> +#include "qapi/qapi-events-qdev.h"
> =20
>  #define MEMORY_SLOTS_NUMBER          "MDNR"
>  #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
> @@ -178,8 +179,16 @@ static void acpi_memory_hotplug_write(void *opaque, =
hwaddr addr, uint64_t data,
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> +
> +                /*
> +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_GUEST_ER=
ROR
> +                 * while the deprecation of MEM_UNPLUG_ERROR is
> +                 * pending.
> +                 */
>                  qapi_event_send_mem_unplug_error(dev->id ? : "",
>                                                   error_get_pretty(local_=
err));
> +                qapi_event_send_device_unplug_guest_error(!!dev->id, dev=
->id,
> +                                                          dev->canonical=
_path);
>                  error_free(local_err);
>                  break;
>              }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dnle06mNOJVmKGrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElv0cACgkQbDjKyiDZ
s5ISgA/+IzraGg6xM8sNVEqM3mLt7DOVFpS+kjFB71aV/WTq61K8Urqu8pLCqRLw
Oy2XHpoGCWMpzhUwUdQFOqq0guilj8JSYKEJZmovItCElm4uZ8q8mj3ScRvcdBpR
7wgg9PUJkzlwqEO9brOViPCd38WN+bl3+8b5Hl4G/l+byrgBTHm8BpAxPRY1S0mc
T1MJy8VzBFSWNIotzoJkgKhcDzNFsGDmVhzfs12PLR3ug6MtHOEB8S1sYfDiQK/j
gDfZRQ88wtAmSiio+H8peQayvJOaLGbwf2Mvn86411CjB8SeLzyVfg5BMp4LmQe7
M2AQ36C0+VYdhurHZmqpMieO4OM7mZU1h5LNaBV8bGCclX1FXS8FJuRCs4SPmECO
lK0ejN1QezyDVLk6HkkRRcXIE4QZtvKDYJoROXgPRk9K9wk8uHp5f5c7vqPi51yp
4ubhxd5hGOhZ2vdFI13UlOjD9+PgnVW1E6yF5qrZJlqmbf98zjbizm+NQeKKXnd0
1JgxMCHDMGqw9y0ZRTNr3/z5bweBVMZpsxj4kNDHiMZcSsUxkzUbCCHefnHY63Yt
Mk81jsTHATsz2JjsV7gnruWz79S4U+erOijNU0Z06sYiaOZGeCKDSNtbpgiVFt9v
IHBiwgoyu+bWppQErCYE5RjcC5an2sS7LJlvmhksl7yM+Mu1fhU=
=QTHv
-----END PGP SIGNATURE-----

--dnle06mNOJVmKGrg--

