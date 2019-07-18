Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98BE6C919
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 08:09:57 +0200 (CEST)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnzc4-0001NN-V4
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 02:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hnzbs-0000q5-2H
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 02:09:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hnzbq-0001Ts-Hw
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 02:09:44 -0400
Received: from 4.mo173.mail-out.ovh.net ([46.105.34.219]:46404)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hnzbq-0001T6-Aw
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 02:09:42 -0400
Received: from player739.ha.ovh.net (unknown [10.108.57.18])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id C523D1130A7
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 08:09:39 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player739.ha.ovh.net (Postfix) with ESMTPSA id A9BBB82BF627;
 Thu, 18 Jul 2019 06:09:34 +0000 (UTC)
To: Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>
References: <20190718053236.6721-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5b84b792-379d-b9cf-0b25-0cb47858e62e@kaod.org>
Date: Thu, 18 Jul 2019 08:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718053236.6721-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 946600350507109184
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieeggddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.34.219
Subject: Re: [Qemu-devel] [PATCH] ppc/pnv: Set default ram size to 2GB
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

On 18/07/2019 07:32, Joel Stanley wrote:
> This makes the powernv machine easier for end users as the default
> initrd address is now within RAM.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> --
> This replaces https://patchwork.ozlabs.org/patch/1132438/
>=20
>  hw/ppc/pnv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index bd4531c82260..8cef6d17f111 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1358,7 +1358,7 @@ static void pnv_machine_class_init(ObjectClass *o=
c, void *data)
>                                        * storage */
>      mc->no_parallel =3D 1;
>      mc->default_boot_order =3D NULL;
> -    mc->default_ram_size =3D 1 * GiB;
> +    mc->default_ram_size =3D 2 * GiB;
>      xic->icp_get =3D pnv_icp_get;
>      xic->ics_get =3D pnv_ics_get;
>      xic->ics_resend =3D pnv_ics_resend;
>=20


