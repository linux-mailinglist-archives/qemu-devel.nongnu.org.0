Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D45962E293
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:08:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviLl-0007xn-FH; Thu, 17 Nov 2022 12:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oviLj-0007rU-5d
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:06:51 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oviLg-0001hK-6W
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:06:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 81B6514016209;
 Thu, 17 Nov 2022 18:06:38 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 18:06:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004c1e5a7f0-f2cb-4d68-b248-bbd63170e733,
 247B43F2E41D7204BC7F135E5139F4EBEC0764F5) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 17 Nov 2022 18:06:33 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>, "=?UTF-8?B?Q8OpZHJpYw==?=
 Le Goater" <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-8.0] MAINTAINERS: downgrade PPC KVM/TCG CPUs and
 pSeries to 'Odd Fixes'
Message-ID: <20221117180633.4264cc1d@bahia>
In-Reply-To: <20221117153218.182835-1-danielhb413@gmail.com>
References: <20221117153218.182835-1-danielhb413@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: c11c9ba8-4012-43ee-be00-8ebcfd2f53cd
X-Ovh-Tracer-Id: 7646549219303070115
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuueeijedtleeluedthfetjeffieetffeuvefffeeftedvieefueejgfdugeetueenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdptghlgheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=groug@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 17 Nov 2022 12:32:18 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> The maintainer is no longer being paid to maintain these components. All
> maintainership work is being done in his personal time since the middle
> of the 7.2 development cycle.
>=20

Great thanks Daniel for all your contributions over
the years, and for being the one steering the vessel
to the dry dock. This is it.

> Change the status of PPC KVM CPUs, PPC TCG CPUs and the pSeries machine
> to 'Odd Fixes', reflecting that the maintainer no longer has exclusive
> time to dedicate to them. It'll also (hopefully) keep expectations under
> check when/if these components are used in a customer product.
>=20
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index be151f0024..1d43153e5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -264,7 +264,7 @@ R: C=C3=A9dric Le Goater <clg@kaod.org>
>  R: David Gibson <david@gibson.dropbear.id.au>
>  R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
> -S: Maintained
> +S: Odd Fixes
>  F: target/ppc/
>  F: hw/ppc/ppc.c
>  F: hw/ppc/ppc_booke.c
> @@ -389,7 +389,7 @@ M: Daniel Henrique Barboza <danielhb413@gmail.com>
>  R: C=C3=A9dric Le Goater <clg@kaod.org>
>  R: David Gibson <david@gibson.dropbear.id.au>
>  R: Greg Kurz <groug@kaod.org>
> -S: Maintained
> +S: Odd Fixes
>  F: target/ppc/kvm.c
> =20
>  S390 KVM CPUs
> @@ -1367,7 +1367,7 @@ R: C=C3=A9dric Le Goater <clg@kaod.org>
>  R: David Gibson <david@gibson.dropbear.id.au>
>  R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
> -S: Maintained
> +S: Odd Fixes
>  F: hw/*/spapr*
>  F: include/hw/*/spapr*
>  F: hw/*/xics*


