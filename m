Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD803BB688
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 07:01:48 +0200 (CEST)
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Gjr-00028m-H6
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 01:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0Ges-0008TG-Gu; Mon, 05 Jul 2021 00:56:38 -0400
Received: from ozlabs.org ([203.11.71.1]:58529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0Gep-0002Fc-Uv; Mon, 05 Jul 2021 00:56:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GJD191kdLz9sXM; Mon,  5 Jul 2021 14:56:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625460989;
 bh=znCPvsaG30plkYy6w8LmyzKWXlS23ny9jtpzagtTiXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wh4lJkPF1D1k8MPpi/dhAhJaf1rEMSYEcb/rjCsABCswKu2vBMPQHkSdqLfiamUQD
 TSVaCXRUUU3oNYdf+YreZfHT4hNUyXFvJjpJKRT6wt8/dxCthvU9wirtZcfRbWmZ3R
 xw3IyMl6bugWfaoCbGTNjGqk/rYWMB1vJ69QTf58=
Date: Mon, 5 Jul 2021 14:56:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 3/3] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
Message-ID: <YOKQ9vN/DOIMBcbD@yekko>
References: <20210621205907.244841-1-danielhb413@gmail.com>
 <20210621205907.244841-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DcjfbPMhDcEXqRhi"
Content-Disposition: inline
In-Reply-To: <20210621205907.244841-4-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, armbru@redhat.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DcjfbPMhDcEXqRhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 05:59:07PM -0300, Daniel Henrique Barboza wrote:
> MEM_UNPLUG_ERROR is deprecated since the introduction of
> DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
> MEM_UNPLUG_ERROR is pending.
>=20
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/acpi/memory_hotplug.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index af37889423..fb9f4d2de7 100644
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
> @@ -177,9 +178,17 @@ static void acpi_memory_hotplug_write(void *opaque, =
hwaddr addr, uint64_t data,
>              /* call pc-dimm unplug cb */
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
> +                const char *error_pretty =3D error_get_pretty(local_err);
> +
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> -                qapi_event_send_mem_unplug_error(dev->id,
> -                                                 error_get_pretty(local_=
err));
> +
> +                /*
> +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> +                 * while the deprecation of MEM_UNPLUG_ERROR is
> +                 * pending.
> +                 */
> +                qapi_event_send_mem_unplug_error(dev->id, error_pretty);
> +                qapi_event_send_device_unplug_error(dev->id, error_prett=
y);
>                  error_free(local_err);
>                  break;
>              }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DcjfbPMhDcEXqRhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDikPYACgkQbDjKyiDZ
s5IEOA//c8mcx8Y0dKsxpD1zJhHfh540qqDurRH2VFh4Wh+Zrh/YG+e9nkMNtazE
wYbQPfS0bZzu4mqWqjBksiXJSQFwiDZkmAgEo7Z6mq+vaMCX5Tl7ugDSBoJqBQdI
bV1mW1GbylLDKXFsQibPylx8tQWto9JkRZtblIwyvAUdlSVfQRzRRQtdyd2HoxDN
uYcf8rpU2Hibup7vzScK4bPuInanDeixJZUs9Mglkxtkwe3YfZDjcLCa5W01IwIc
WOnQMaGgAnax1pLXrc+Wwktanpf3CV8gsbRttpmfvbqS9SfMwVow1cyIoIRLfCIs
87azTUnnn7gblRWcs2Vvrbxj7ciNja0P2cKuaTQ4gm8mqtQYfOIH7DXmzSG3Lzu3
0TCAQ/rA9WFPO+fr1mn3Swr8GQEK8DfQdBfOrIHF9r1Im9HD5SrKrnd09DqAy0Tw
bbrKHGpW2vH96r5/SSCQJgtjvfEaEMzvrT+Qavs3IHhpfRIqvKuRwViOWMTtAC9c
LERrFZ+0WrFqaKkgt7q5yxbkG+BYlZstvOPMuFIcp+dZ4vAaMmyYp64LNZw7VGaK
1RUwupXYAp+wX6jesQBl4pFy75gAomcaC895LKDrzjpmOYZ4TMZ8U3zaWWnhGtMG
NKy83ODb+2j/7pux0Zm+ZiwIcuK0CMk+IWlPCehPLH3i9h9R2ug=
=zlb+
-----END PGP SIGNATURE-----

--DcjfbPMhDcEXqRhi--

