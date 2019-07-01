Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 393AF37D0C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 21:14:51 +0200 (CEST)
Received: from localhost ([::1]:54078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYxqc-00077i-Ed
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 15:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53352)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groug@kaod.org>) id 1hYxl1-0004T3-BX
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 15:09:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1hYxWL-0001ZY-Cg
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 14:53:55 -0400
Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132]:47962)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1hYxWJ-0001Jm-TU
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 14:53:52 -0400
Received: from player698.ha.ovh.net (unknown [10.109.160.253])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id D722123CB74
 for <qemu-devel@nongnu.org>; Thu,  6 Jun 2019 20:53:48 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 9162669118A3;
 Thu,  6 Jun 2019 18:53:44 +0000 (UTC)
Date: Thu, 6 Jun 2019 20:53:42 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20190606205342.7645a752@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <20190606174732.13051-1-clg@kaod.org>
References: <20190606174732.13051-1-clg@kaod.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 7006475123486595467
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeggedgudefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.132
Subject: Re: [Qemu-devel] [PATCH] ppc/pnv: activate the "dumpdtb" option on
 the powernv machine
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

On Thu,  6 Jun 2019 19:47:32 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> This is a good way to debug the DT creation for current PowerNV
> machines and new ones to come.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/pnv.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 046f0a83c8e5..ed6892466793 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -23,6 +23,7 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/cpus.h"
> +#include "sysemu/device_tree.h"
>  #include "hw/hw.h"
>  #include "target/ppc/cpu.h"
>  #include "qemu/log.h"
> @@ -554,6 +555,7 @@ static void pnv_reset(void)
>      /* Pack resulting tree */
>      _FDT((fdt_pack(fdt)));
> =20
> +    qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>      cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
>  }
> =20


