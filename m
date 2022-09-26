Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA035EAFA7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:23:35 +0200 (CEST)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocslS-0003Yg-Qw
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ocrcz-0007fW-I8
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:10:45 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:40423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ocrcv-00063i-K7
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:10:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9EAA2248B4;
 Mon, 26 Sep 2022 17:10:37 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 26 Sep
 2022 19:10:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00679be344d-2095-496f-823b-ad5788842beb,
 3F18426251CD380DC805342BE5D3F55DDA75F83F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cc7ed0de-327c-e2ea-e209-9cf951cfc8bd@kaod.org>
Date: Mon, 26 Sep 2022 19:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v6 00/25] ppc4xx_sdram QOMify and clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1664021647.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <cover.1664021647.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ce05edb8-3e13-44d1-a6d9-e222afae6ead
X-Ovh-Tracer-Id: 15928387457530825635
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/24/22 14:27, BALATON Zoltan wrote:
> This is the end of the QOMify series started by Cédric. This series
> handles the SDRAM controller models to clean them up, QOMify and unify
> them and at least partially clean up the mess that has accumulated
> around these in the past. This includes the not yet merged patches
> from the last series and new ones that change the DDR2 version used by
> sam460ex.
> 
> v6: Split patch moving sdram controller models together into smaller steps
> v5: Add functions the enable sdram controller and call it from boards
> v4: address more review comments
> v3: Fix patches that got squashed during rebase
> v2: address some review comments and try to avoid compile problem with
> gcc 12.2 (untested)
> 
> BALATON Zoltan (25):
>    ppc440_bamboo: Remove unnecessary memsets
>    ppc4xx: Introduce Ppc4xxSdramBank struct
>    ppc4xx_sdram: Get rid of the init RAM hack
>    ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
>    ppc440_bamboo: Add missing 4 MiB valid memory size
>    ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
>    ppc4xx_sdram: QOM'ify
>    ppc4xx_sdram: Drop extra zeros for readability
>    ppc440_sdram: Split off map/unmap of sdram banks for later reuse
>    ppc440_sdram: Implement enable bit in the DDR2 SDRAM controller
>    ppc440_sdram: Get rid of the init RAM hack
>    ppc440_sdram: Rename local variable for readability
>    ppc4xx_sdram: Rename functions to prevent name clashes
>    ppc440_sdram: Move RAM size check to ppc440_sdram_init
>    ppc440_sdram: QOM'ify
>    ppc440_uc.c: Move some macros to ppc4xx.h
>    ppc440_uc.c: Remove unneeded parenthesis
>    ppc440_uc.c: Move DDR2 SDRAM controller model to ppc4xx_sdram.c
>    ppc4xx_devs.c: Move DDR SDRAM controller model to ppc4xx_sdram.c
>    ppc4xx_sdram: Move ppc4xx_sdram_banks() to ppc4xx_sdram.c
>    ppc4xx_sdram: Use hwaddr for memory bank size
>    ppc4xx_sdram: Rename local state variable for brevity
>    ppc4xx_sdram: Generalise bank setup
>    ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
>    ppc4xx_sdram: Add errp parameter to ppc4xx_sdram_banks()
> 
>   hw/ppc/meson.build      |   3 +-
>   hw/ppc/ppc405.h         |   8 +-
>   hw/ppc/ppc405_boards.c  |  13 +-
>   hw/ppc/ppc405_uc.c      |  33 +-
>   hw/ppc/ppc440.h         |   4 -
>   hw/ppc/ppc440_bamboo.c  |  25 +-
>   hw/ppc/ppc440_uc.c      | 267 +-------------
>   hw/ppc/ppc4xx_devs.c    | 413 ----------------------
>   hw/ppc/ppc4xx_sdram.c   | 753 ++++++++++++++++++++++++++++++++++++++++
>   hw/ppc/sam460ex.c       |  44 +--
>   hw/ppc/trace-events     |   1 +
>   include/hw/ppc/ppc4xx.h |  65 +++-
>   12 files changed, 859 insertions(+), 770 deletions(-)
>   create mode 100644 hw/ppc/ppc4xx_sdram.c

Zoltan,

Could we add you as a MAINTAINER of these files ? You know them well now.
At least the ppc44* ones.

Thanks,

C.


