Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDBB11B8C3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 17:29:27 +0100 (CET)
Received: from localhost ([::1]:45606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if4re-00059P-Eb
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 11:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1if4q1-0003mb-4J
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:27:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1if4py-0006Md-AF
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:27:43 -0500
Received: from 5.mo68.mail-out.ovh.net ([46.105.62.179]:39204)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1if4px-0006JP-Ss
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:27:42 -0500
Received: from player729.ha.ovh.net (unknown [10.109.146.137])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id DB30514F4E5
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 17:27:38 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id C6D6FD54E2A9;
 Wed, 11 Dec 2019 16:27:31 +0000 (UTC)
Subject: Re: [PATCH v2] ppc/pnv: Make PnvXScomInterface an incomplete type
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <157608025541.186670.1577861507610404326.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a3c0ab59-24e0-b230-db60-6ceb2fdadf70@kaod.org>
Date: Wed, 11 Dec 2019 17:27:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157608025541.186670.1577861507610404326.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1799751004743895872
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelhedgkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.62.179
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2019 17:04, Greg Kurz wrote:
> PnvXScomInterface is an interface instance. It should never be
> dereferenced. Drop the dummy type definition for extra safety,
> which is the common practice with QOM interfaces.
>=20
> While here also convert the bogus OBJECT_CHECK() to INTERFACE_CHECK().
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>


> ---
> v2: convert OBJECT_CHECK() to INTERFACE_CHECK()
> ---
>  include/hw/ppc/pnv_xscom.h |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 1c1d76bf9be5..306c22461587 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -22,13 +22,11 @@
> =20
>  #include "qom/object.h"
> =20
> -typedef struct PnvXScomInterface {
> -    Object parent;
> -} PnvXScomInterface;
> +typedef struct PnvXScomInterface PnvXScomInterface;
> =20
>  #define TYPE_PNV_XSCOM_INTERFACE "pnv-xscom-interface"
>  #define PNV_XSCOM_INTERFACE(obj) \
> -     OBJECT_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE)
> +    INTERFACE_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE=
)
>  #define PNV_XSCOM_INTERFACE_CLASS(klass)                \
>      OBJECT_CLASS_CHECK(PnvXScomInterfaceClass, (klass), \
>                         TYPE_PNV_XSCOM_INTERFACE)
>=20


