Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F5119643
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 22:26:26 +0100 (CET)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ien1V-0002dl-LG
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 16:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ien0C-0001Pv-Dt
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:25:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ien0B-0002Lc-DZ
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:25:04 -0500
Received: from 6.mo7.mail-out.ovh.net ([188.165.39.218]:38003)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ien0B-0002LC-7g
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:25:03 -0500
Received: from player731.ha.ovh.net (unknown [10.109.143.3])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6190A14216B
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 22:25:01 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player731.ha.ovh.net (Postfix) with ESMTPSA id 9BF43CF337F0;
 Tue, 10 Dec 2019 21:24:54 +0000 (UTC)
Date: Tue, 10 Dec 2019 22:24:53 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/2] ppc/pnv: populate the DT with realized XSCOM devices
Message-ID: <20191210222453.482c254b@bahia.tlslab.ibm.com>
In-Reply-To: <20191210135845.19773-3-clg@kaod.org>
References: <20191210135845.19773-1-clg@kaod.org>
 <20191210135845.19773-3-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 949415098346543499
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgudegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.39.218
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Dec 2019 14:58:45 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Some devices could be initialized in the instance_init handler but not
> realized for configuration reasons. Nodes should not be added in the DT
> for such devices.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/pnv_xscom.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index 006d87e970d9..6d3745a49e50 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -272,7 +272,10 @@ static int xscom_dt_child(Object *child, void *opaqu=
e)
>          PnvXScomInterface *xd =3D PNV_XSCOM_INTERFACE(child);
>          PnvXScomInterfaceClass *xc =3D PNV_XSCOM_INTERFACE_GET_CLASS(xd);
> =20
> -        if (xc->dt_xscom) {
> +        /*
> +         * Only "realized" devices should be configured in the DT
> +         */
> +        if (xc->dt_xscom && DEVICE(child)->realized) {
>              _FDT((xc->dt_xscom(xd, args->fdt, args->xscom_offset)));
>          }
>      }


