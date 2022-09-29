Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790D75EFD5D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:47:24 +0200 (CEST)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odyZ9-0008HR-3b
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1ody2l-0001Cc-Bn; Thu, 29 Sep 2022 14:13:55 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:60321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1ody2i-0004gt-KR; Thu, 29 Sep 2022 14:13:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.28])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 67FCE12D46982;
 Thu, 29 Sep 2022 20:13:42 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 29 Sep
 2022 20:13:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0069069a725-ce8f-4862-b140-5feb5d0b12cc,
 570A36C992EE7D2C129880DC355ABC6BBB2ACD94) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 29 Sep 2022 20:13:40 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] MAINTAINERS: step back from PPC
Message-ID: <20220929201340.76e1096f@bahia>
In-Reply-To: <20220929180946.848721-1-clg@kaod.org>
References: <20220929180946.848721-1-clg@kaod.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 247ce50a-5e63-4ec3-8369-a33d677c96b8
X-Ovh-Tracer-Id: 16165107914742602147
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekueehfeevgeeuueekveduhedvjeehveeghffhkeeijefhtdffkeevudfggfdvleenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheptghlgheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Sep 2022 20:09:46 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> I am not active anymore on the PPC maintainership, degrade my self as
> standard Reviewer. Also degrade PowerNV and XIVE status since I am not
> funded for this work.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

End of an era. Thank you for all the dedication and accomplishments !

Reviewed-by: Greg Kurz <groug@kaod.org>

>  MAINTAINERS | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1729c0901cea..40f4984b439b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -267,8 +267,8 @@ F: hw/openrisc/
>  F: tests/tcg/openrisc/
> =20
>  PowerPC TCG CPUs
> -M: C=C3=A9dric Le Goater <clg@kaod.org>
>  M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: C=C3=A9dric Le Goater <clg@kaod.org>
>  R: David Gibson <david@gibson.dropbear.id.au>
>  R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
> @@ -392,8 +392,8 @@ F: target/mips/kvm*
>  F: target/mips/sysemu/
> =20
>  PPC KVM CPUs
> -M: C=C3=A9dric Le Goater <clg@kaod.org>
>  M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: C=C3=A9dric Le Goater <clg@kaod.org>
>  R: David Gibson <david@gibson.dropbear.id.au>
>  R: Greg Kurz <groug@kaod.org>
>  S: Maintained
> @@ -1365,8 +1365,8 @@ F: include/hw/rtc/m48t59.h
>  F: tests/avocado/ppc_prep_40p.py
> =20
>  sPAPR (pseries)
> -M: C=C3=A9dric Le Goater <clg@kaod.org>
>  M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: C=C3=A9dric Le Goater <clg@kaod.org>
>  R: David Gibson <david@gibson.dropbear.id.au>
>  R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
> @@ -1387,7 +1387,7 @@ F: tests/avocado/ppc_pseries.py
>  PowerNV (Non-Virtualized)
>  M: C=C3=A9dric Le Goater <clg@kaod.org>
>  L: qemu-ppc@nongnu.org
> -S: Maintained
> +S: Odd Fixes
>  F: docs/system/ppc/powernv.rst
>  F: hw/ppc/pnv*
>  F: hw/intc/pnv*
> @@ -2321,7 +2321,7 @@ T: git https://github.com/philmd/qemu.git fw_cfg-ne=
xt
>  XIVE
>  M: C=C3=A9dric Le Goater <clg@kaod.org>
>  L: qemu-ppc@nongnu.org
> -S: Supported
> +S: Odd Fixes
>  F: hw/*/*xive*
>  F: include/hw/*/*xive*
>  F: docs/*/*xive*


