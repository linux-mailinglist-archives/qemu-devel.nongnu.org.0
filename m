Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C7D41709D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:07:01 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTj2i-0006v2-IF
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTiy4-0000zR-Dy
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:02:19 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:44711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTixx-0001lR-6q
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:02:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AE51622A9F;
 Fri, 24 Sep 2021 11:02:01 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 24 Sep
 2021 13:02:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0025417c766-3707-4ab8-b675-c76c228db204,
 EA4874C54EC1FB151381C7D8681494D1EB26EF60) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1c7c111f-a1fe-973f-770f-fffab19e6a36@kaod.org>
Date: Fri, 24 Sep 2021 13:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/5] MAINTAINERS: Remove David & Greg as reviewers for
 a number of boards
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
 <20210924095536.441849-3-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210924095536.441849-3-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 921c349c-6386-42f0-87a0-1ea45c3eeb74
X-Ovh-Tracer-Id: 12693677024826198962
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, hpussin@reactos.org,
 aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 11:55, David Gibson wrote:
> Greg and I are moving towards other areas and no longer have capacity to
> act as regular reviewers for several of the secondary ppc machine types.
> So, remove ourselves as reviewers for Macintosh, PReP, sam460ex and
> pegasos2 in MAINTAINERS.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>   MAINTAINERS | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3408618f2a..20436be86f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1265,8 +1265,6 @@ F: hw/ppc/mpc8544_guts.c
>   
>   New World (mac99)
>   M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Odd Fixes
>   F: hw/ppc/mac_newworld.c
> @@ -1285,8 +1283,6 @@ F: pc-bios/qemu_vga.ndrv
>   
>   Old World (g3beige)
>   M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Odd Fixes
>   F: hw/ppc/mac_oldworld.c
> @@ -1300,8 +1296,6 @@ F: pc-bios/qemu_vga.ndrv
>   
>   PReP
>   M: Hervé Poussineau <hpoussin@reactos.org>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
>   F: hw/ppc/prep.c
> @@ -1356,8 +1350,6 @@ F: hw/ppc/virtex_ml507.c
>   
>   sam460ex
>   M: BALATON Zoltan <balaton@eik.bme.hu>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
>   F: hw/ppc/sam460ex.c
> @@ -1371,7 +1363,6 @@ F: roms/u-boot-sam460ex
>   
>   pegasos2
>   M: BALATON Zoltan <balaton@eik.bme.hu>
> -R: David Gibson <david@gibson.dropbear.id.au>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
>   F: hw/ppc/pegasos2.c
> 


