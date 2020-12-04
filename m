Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68402CE8B2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 08:39:55 +0100 (CET)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl5h4-0002iF-Lr
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 02:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kl5fC-000291-Kf; Fri, 04 Dec 2020 02:37:58 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:48627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kl5f8-0003Wa-V7; Fri, 04 Dec 2020 02:37:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0628A7147E7C;
 Fri,  4 Dec 2020 08:37:42 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 4 Dec 2020
 08:37:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001b569db9f-6a0d-41df-a981-1a48422025c8,
 977776E1094EFD99122EFBBE6561ABC933400753) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Fri, 4 Dec 2020 08:37:41 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0] MAINTAINERS: Add Greg Kurz as co-maintainer for ppc
Message-ID: <20201204083741.4e017945@bahia.lan>
In-Reply-To: <20201204001113.271220-1-david@gibson.dropbear.id.au>
References: <20201204001113.271220-1-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 54460fae-4909-4357-b7df-05dc7776bd43
X-Ovh-Tracer-Id: 16665007475163961638
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeijedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefftedvgeduuefgheeltddtieegheejhfekleduuddtffejffeuleffgfevtdeknecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
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
Cc: aik@ozlabs.ru, peter.maydell@linaro.org, qemu-ppc@nongnu.org,
 lvivier@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  4 Dec 2020 11:11:13 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> Greg has agreed to be co-maintainer of the ppc target and machines.
> This should avoid repeats of the problem we had in qemu-5.2 where a
> last minute fix was needed while I was on holiday.
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---

Acked-by: Greg Kurz <groug@kaod.org>

>  MAINTAINERS | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> I've also applied this change to my ppc-for-6.0 branch.
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68bc160f41..bb7e3b3203 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -272,6 +272,7 @@ F: tests/tcg/openrisc/
> =20
>  PowerPC TCG CPUs
>  M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Maintained
>  F: target/ppc/
> @@ -394,6 +395,7 @@ F: target/mips/kvm.c
> =20
>  PPC KVM CPUs
>  M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>
>  S: Maintained
>  F: target/ppc/kvm.c
> =20
> @@ -1183,18 +1185,21 @@ PowerPC Machines
>  ----------------
>  405
>  M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Odd Fixes
>  F: hw/ppc/ppc405_boards.c
> =20
>  Bamboo
>  M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Odd Fixes
>  F: hw/ppc/ppc440_bamboo.c
> =20
>  e500
>  M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Odd Fixes
>  F: hw/ppc/e500*
> @@ -1208,6 +1213,7 @@ F: pc-bios/u-boot.e500
> =20
>  mpc8544ds
>  M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Odd Fixes
>  F: hw/ppc/mpc8544ds.c
> @@ -1216,6 +1222,7 @@ F: hw/ppc/mpc8544_guts.c
>  New World (mac99)
>  M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>  R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Odd Fixes
>  F: hw/ppc/mac_newworld.c
> @@ -1235,6 +1242,7 @@ F: pc-bios/qemu_vga.ndrv
>  Old World (g3beige)
>  M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>  R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Odd Fixes
>  F: hw/ppc/mac_oldworld.c
> @@ -1248,6 +1256,8 @@ F: pc-bios/qemu_vga.ndrv
> =20
>  PReP
>  M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Maintained
>  F: hw/ppc/prep.c
> @@ -1264,6 +1274,7 @@ F: tests/acceptance/ppc_prep_40p.py
> =20
>  sPAPR
>  M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Supported
>  F: hw/*/spapr*
> @@ -1281,6 +1292,7 @@ F: tests/qtest/libqos/rtas*
>  PowerNV (Non-Virtualized)
>  M: C=C3=A9dric Le Goater <clg@kaod.org>
>  M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Maintained
>  F: hw/ppc/pnv*
> @@ -1300,6 +1312,8 @@ F: hw/ppc/virtex_ml507.c
> =20
>  sam460ex
>  M: BALATON Zoltan <balaton@eik.bme.hu>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Maintained
>  F: hw/ppc/sam460ex.c
> @@ -2078,8 +2092,9 @@ F: tests/qtest/fw_cfg-test.c
>  T: git https://github.com/philmd/qemu.git fw_cfg-next
> =20
>  XIVE
> -M: David Gibson <david@gibson.dropbear.id.au>
>  M: C=C3=A9dric Le Goater <clg@kaod.org>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Supported
>  F: hw/*/*xive*


