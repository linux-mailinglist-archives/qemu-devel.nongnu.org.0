Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A0306AB0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 02:48:21 +0100 (CET)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4wPz-00010q-Up
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 20:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO6-0007uI-5I; Wed, 27 Jan 2021 20:46:22 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55353 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO1-0005Aw-W1; Wed, 27 Jan 2021 20:46:21 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DR3GQ59Rxz9sVv; Thu, 28 Jan 2021 12:46:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611798366;
 bh=bn/0bBDQgbLEtV49voGRL4hXcClT2bFkypVbCPHXMdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VrVQsBk0cP1bKMz+1hSXsTiHbLjlNE/amndphak5fg3nE+bM1N7bxF0E+6If8YLaU
 k/uKPr3ffOb30w2WkZvz0BC2XpbdhQv//NzWLqt6+YpA7rra95jCVRRDeHZyGnGyfW
 20o8WT41QzkJUs9OuDZMlkrQWTI1J2jaOOaYc6H8=
Date: Thu, 28 Jan 2021 11:44:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/7] ppc/pnv: Add trace events for PCI event notification
Message-ID: <20210128004436.GD18347@yekko.fritz.box>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W5WqUoFLvi1M7tJE"
Content-Disposition: inline
In-Reply-To: <20210126171059.307867-2-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--W5WqUoFLvi1M7tJE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 06:10:53PM +0100, C=E9dric Le Goater wrote:
> On POWER9 systems, PHB controllers signal the XIVE interrupt controller
> of a source interrupt notification using a store on a MMIO region. Add
> traces for such events.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/intc/pnv_xive.c       | 3 +++
>  hw/pci-host/pnv_phb4.c   | 3 +++
>  hw/intc/trace-events     | 3 +++
>  hw/pci-host/trace-events | 3 +++
>  4 files changed, 12 insertions(+)
>=20
> diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> index 5f69626b3a8d..ad43483612e5 100644
> --- a/hw/intc/pnv_xive.c
> +++ b/hw/intc/pnv_xive.c
> @@ -24,6 +24,7 @@
>  #include "hw/ppc/xive_regs.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/ppc/ppc.h"
> +#include "trace.h"
> =20
>  #include <libfdt.h>
> =20
> @@ -1319,6 +1320,8 @@ static void pnv_xive_ic_hw_trigger(PnvXive *xive, h=
waddr addr, uint64_t val)
>      uint8_t blk;
>      uint32_t idx;
> =20
> +    trace_pnv_xive_ic_hw_trigger(addr, val);
> +
>      if (val & XIVE_TRIGGER_END) {
>          xive_error(xive, "IC: END trigger at @0x%"HWADDR_PRIx" data 0x%"=
PRIx64,
>                     addr, val);
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 6328e985f81c..54f57c660a94 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -22,6 +22,7 @@
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "qom/object.h"
> +#include "trace.h"
> =20
>  #define phb_error(phb, fmt, ...)                                        \
>      qemu_log_mask(LOG_GUEST_ERROR, "phb4[%d:%d]: " fmt "\n",            \
> @@ -1257,6 +1258,8 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, =
uint32_t srcno)
>      uint64_t data =3D XIVE_TRIGGER_PQ | offset | srcno;
>      MemTxResult result;
> =20
> +    trace_pnv_phb4_xive_notify(notif_port, data);
> +
>      address_space_stq_be(&address_space_memory, notif_port, data,
>                           MEMTXATTRS_UNSPECIFIED, &result);
>      if (result !=3D MEMTX_OK) {
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 8ed397a0d587..45ddaf48df8e 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -236,3 +236,6 @@ xive_tctx_tm_write(uint64_t offset, unsigned int size=
, uint64_t value) "@0x0x%"P
>  xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@=
0x0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
>  xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "=
found NVT 0x%x/0x%x ring=3D0x%x"
>  xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "=
END 0x%x/0x%x @0x0x%"PRIx64
> +
> +# pnv_xive.c
> +pnv_xive_ic_hw_trigger(uint64_t addr, uint64_t val) "@0x%"PRIx64" val=3D=
0x%"PRIx64
> diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
> index d19ca9aef6f7..7d8063ac4212 100644
> --- a/hw/pci-host/trace-events
> +++ b/hw/pci-host/trace-events
> @@ -20,3 +20,6 @@ unin_data_write(uint64_t addr, unsigned len, uint64_t v=
al) "write addr 0x%"PRIx6
>  unin_data_read(uint64_t addr, unsigned len, uint64_t val) "read addr 0x%=
"PRIx64 " len %d val 0x%"PRIx64
>  unin_write(uint64_t addr, uint64_t value) "addr=3D0x%" PRIx64 " val=3D0x=
%"PRIx64
>  unin_read(uint64_t addr, uint64_t value) "addr=3D0x%" PRIx64 " val=3D0x%=
"PRIx64
> +
> +# pnv_phb4.c
> +pnv_phb4_xive_notify(uint64_t notif_port, uint64_t data) "notif=3D@0x%"P=
RIx64" data=3D0x%"PRIx64

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--W5WqUoFLvi1M7tJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmASCPQACgkQbDjKyiDZ
s5J5aBAAxfZhU3JZkOtafabY3hZspfv5wkMX9xQxYpSZEqCGDgAyCU34dWcpo1YO
4gt4kNnv6pSSuZPL9LB49JAgpArWvPzpPOcLLGsPUAOYY4K3nYa59wQ3lgFkRO3Y
izVXO9cekgfGDsZBAO6qT4iSyJxC5fNp4DYENAIp//uhLZ2O3UybT9POkjVwxBFq
e/v99pCG/938Dmcg9L4CExlAGR1662f7vGzNQiCDFTmqKu6cqXpR4ChqYL3lckmg
4CGzatcAY5jDF/fw7DCTKIV3doEhqEMZ8nLjVKjm8Ydcf+Vho7+8j3OyC0CgHSbX
76CaADvcVdE9I8aC/1eZFV2VfGVrboyqjDgqxtZxY2EHZGNRV8FGwFKyXDMT5QYP
pqmG9ROFmawLBdfN6Fpu/ZypkpJ2TPjlic+RTjy+aYWE6iLjwgngJYjkE3sAp3jk
0PTljZMY9RwDc4SfVNjJJVz0mHsXni87vm7zYZBADur1yY5I1DANuOkARrlpjqYA
d2rBJEcSGcXYm6EcBExJFYuXouRjdfQ8I/dfnHvY07D3FE6j24UtHmcj2wyGO6fu
SJ9gXqAxILFSNk+ll7o/6W/JU/iECxIYqHHfafrYcuXqZq4vimhflZNieMz7euzo
40wCRWFLrLI/kVgzv3unSexh0xHK2Rw9VPAgpqSd+oKkrp28mGw=
=xqFm
-----END PGP SIGNATURE-----

--W5WqUoFLvi1M7tJE--

