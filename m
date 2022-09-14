Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8F75B820C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 09:32:58 +0200 (CEST)
Received: from localhost ([::1]:39408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYMtF-0001Fs-Qe
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 03:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oYMqO-0007zr-3a; Wed, 14 Sep 2022 03:30:00 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:50043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oYMqL-0005Ev-31; Wed, 14 Sep 2022 03:29:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 848981289C890;
 Wed, 14 Sep 2022 09:29:52 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 14 Sep
 2022 09:29:51 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00505f7b27f-6bc5-4a3c-9a4f-b642adc56c2b,
 6464241036B73DE4A97B8AD469DDB011F00B0909) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <52948dfd-a296-aab4-5797-90bf99ae37ce@kaod.org>
Date: Wed, 14 Sep 2022 09:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 00/20] ppc4xx_sdram QOMify and clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1663097286.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <cover.1663097286.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f87c8a18-c534-4727-b0c1-d080b827c55d
X-Ovh-Tracer-Id: 9435041222466571171
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduhedguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.628,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/13/22 21:52, BALATON Zoltan wrote:
> This is the end of the QOMify series started by Cédric. This series
> handles the SDRAM controller models to clean them up, QOMify and unify
> them and at least partially clean up the mess that has accumulated
> around these in the past. This includes the not yet merged patches
> from the last series and new ones that change the DDR2 version used by
> sam460ex.


I made comments on the first ~10 patches. Let's try to agree on these
first. We will see the remaining ones in a second patchset.

Thanks,

C.



> v3: Fix patches that got squashed during rebase
> v2: address some review comments and try to avoid compile problem with
> gcc 12.2 (untested)
> 
> BALATON Zoltan (20):
>    ppc440_bamboo: Remove unnecessary memsets
>    ppc4xx: Introduce Ppc4xxSdramBank struct
>    ppc4xx_sdram: Get rid of the init RAM hack
>    ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
>    ppc440_bamboo: Add missing 4 MiB valid memory size
>    ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
>    ppc4xx_sdram: QOM'ify
>    ppc4xx_sdram: Drop extra zeros for readability
>    ppc440_sdram: Split off map/unmap of sdram banks for later reuse
>    ppc440_sdram: Implement enable bit in the DDR2 SDRAM
>    ppc440_sdram: Get rid of the init RAM hack
>    ppc440_sdram: Rename local variable for readibility
>    ppc4xx_sdram: Rename functions to prevent name clashes
>    ppc440_sdram: Move RAM size check to ppc440_sdram_init
>    ppc440_sdram: QOM'ify
>    ppc4xx_sdram: Move ppc4xx DDR and DDR2 SDRAM controller models
>      together
>    ppc4xx_sdram: Use hwaddr for memory bank size
>    ppc4xx_sdram: Rename local state variable for brevity
>    ppc4xx_sdram: Generalise bank setup
>    ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
> 
>   hw/ppc/meson.build      |   3 +-
>   hw/ppc/ppc405.h         |   8 +-
>   hw/ppc/ppc405_boards.c  |  22 +-
>   hw/ppc/ppc405_uc.c      |  33 +-
>   hw/ppc/ppc440.h         |   4 -
>   hw/ppc/ppc440_bamboo.c  |  29 +-
>   hw/ppc/ppc440_uc.c      | 267 +--------------
>   hw/ppc/ppc4xx_devs.c    | 413 -----------------------
>   hw/ppc/ppc4xx_sdram.c   | 723 ++++++++++++++++++++++++++++++++++++++++
>   hw/ppc/sam460ex.c       |  48 +--
>   hw/ppc/trace-events     |   1 +
>   include/hw/ppc/ppc4xx.h |  66 +++-
>   12 files changed, 847 insertions(+), 770 deletions(-)
>   create mode 100644 hw/ppc/ppc4xx_sdram.c
> 


