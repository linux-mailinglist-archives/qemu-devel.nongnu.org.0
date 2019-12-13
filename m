Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D011E45F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 14:10:48 +0100 (CET)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifkiW-0003i2-0X
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 08:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50344)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ifkeX-0007p3-T2
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:06:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ifkeW-0007oC-Lv
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:06:41 -0500
Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149]:48220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ifkeW-0007lX-G0
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 08:06:40 -0500
Received: from player772.ha.ovh.net (unknown [10.108.16.72])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id ABE5211AFBB
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2019 14:06:38 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 2DBB5D3CF9D4;
 Fri, 13 Dec 2019 13:06:34 +0000 (UTC)
Subject: Re: [PATCH 13/13] ppc/pnv: Drop PnvChipClass::type
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <157623836852.360005.1112241220707384093.stgit@bahia.lan>
 <157623844102.360005.12070225703151669294.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <25632233-8059-3566-cea7-a8ba2805b53c@kaod.org>
Date: Fri, 13 Dec 2019 14:06:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157623844102.360005.12070225703151669294.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10150550612337265491
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelledggeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedu
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.61.149
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

On 13/12/2019 13:00, Greg Kurz wrote:
> It isn't used anymore.

Fantastic !=20

> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,=20

C.

> ---
>  hw/ppc/pnv.c         |    5 -----
>  include/hw/ppc/pnv.h |    9 ---------
>  2 files changed, 14 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index cc40b90e9cd2..232b4a25603c 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1132,7 +1132,6 @@ static void pnv_chip_power8e_class_init(ObjectCla=
ss *klass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PnvChipClass *k =3D PNV_CHIP_CLASS(klass);
> =20
> -    k->chip_type =3D PNV_CHIP_POWER8E;
>      k->chip_cfam_id =3D 0x221ef04980000000ull;  /* P8 Murano DD2.1 */
>      k->cores_mask =3D POWER8E_CORE_MASK;
>      k->core_pir =3D pnv_chip_core_pir_p8;
> @@ -1156,7 +1155,6 @@ static void pnv_chip_power8_class_init(ObjectClas=
s *klass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PnvChipClass *k =3D PNV_CHIP_CLASS(klass);
> =20
> -    k->chip_type =3D PNV_CHIP_POWER8;
>      k->chip_cfam_id =3D 0x220ea04980000000ull; /* P8 Venice DD2.0 */
>      k->cores_mask =3D POWER8_CORE_MASK;
>      k->core_pir =3D pnv_chip_core_pir_p8;
> @@ -1180,7 +1178,6 @@ static void pnv_chip_power8nvl_class_init(ObjectC=
lass *klass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PnvChipClass *k =3D PNV_CHIP_CLASS(klass);
> =20
> -    k->chip_type =3D PNV_CHIP_POWER8NVL;
>      k->chip_cfam_id =3D 0x120d304980000000ull;  /* P8 Naples DD1.0 */
>      k->cores_mask =3D POWER8_CORE_MASK;
>      k->core_pir =3D pnv_chip_core_pir_p8;
> @@ -1360,7 +1357,6 @@ static void pnv_chip_power9_class_init(ObjectClas=
s *klass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PnvChipClass *k =3D PNV_CHIP_CLASS(klass);
> =20
> -    k->chip_type =3D PNV_CHIP_POWER9;
>      k->chip_cfam_id =3D 0x220d104900008000ull; /* P9 Nimbus DD2.0 */
>      k->cores_mask =3D POWER9_CORE_MASK;
>      k->core_pir =3D pnv_chip_core_pir_p9;
> @@ -1449,7 +1445,6 @@ static void pnv_chip_power10_class_init(ObjectCla=
ss *klass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      PnvChipClass *k =3D PNV_CHIP_CLASS(klass);
> =20
> -    k->chip_type =3D PNV_CHIP_POWER10;
>      k->chip_cfam_id =3D 0x120da04900008000ull; /* P10 DD1.0 (with NX) =
*/
>      k->cores_mask =3D POWER10_CORE_MASK;
>      k->core_pir =3D pnv_chip_core_pir_p10;
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 4972e93c2619..f78fd0dd967c 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -38,14 +38,6 @@
>  #define PNV_CHIP_GET_CLASS(obj) \
>       OBJECT_GET_CLASS(PnvChipClass, (obj), TYPE_PNV_CHIP)
> =20
> -typedef enum PnvChipType {
> -    PNV_CHIP_POWER8E,     /* AKA Murano (default) */
> -    PNV_CHIP_POWER8,      /* AKA Venice */
> -    PNV_CHIP_POWER8NVL,   /* AKA Naples */
> -    PNV_CHIP_POWER9,      /* AKA Nimbus */
> -    PNV_CHIP_POWER10,     /* AKA TBD */
> -} PnvChipType;
> -
>  typedef struct PnvChip {
>      /*< private >*/
>      SysBusDevice parent_obj;
> @@ -123,7 +115,6 @@ typedef struct PnvChipClass {
>      SysBusDeviceClass parent_class;
> =20
>      /*< public >*/
> -    PnvChipType  chip_type;
>      uint64_t     chip_cfam_id;
>      uint64_t     cores_mask;
> =20
>=20


