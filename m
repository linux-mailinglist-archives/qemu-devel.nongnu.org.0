Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E65983FC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 15:22:59 +0200 (CEST)
Received: from localhost ([::1]:57870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOfUA-0001nT-H1
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 09:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oOfOr-0004Px-JF
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:17:31 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:49475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oOfOo-0000UI-P1
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:17:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.173])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6709421845;
 Thu, 18 Aug 2022 13:17:22 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 18 Aug
 2022 15:17:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001a0d182a4-4c85-4cde-9d3c-b60687083624,
 138D267EF392F478FDB2EE7689F651729D1C1BCC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <aed974eb-2723-9a4b-bf36-d16b319bf127@kaod.org>
Date: Thu, 18 Aug 2022 15:17:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 00/31] QOMify PPC4xx devices and minor clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c53454fb-3521-4493-93d2-150288785bbd
X-Ovh-Tracer-Id: 4315011396386589603
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeljefhieetffeltdefteeutdekhfefuedttdevteffffffgedttdekieeftdetkeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Daniel,

On 8/17/22 17:08, BALATON Zoltan wrote:
> Hello,
> 
> This is based on gitlab.com/danielhb/qemu/tree/ppc-7.2
> 
> This series contains the rest of Cédric's OOM'ify patches modified
> according my review comments and some other clean ups I've noticed
> along the way.

I think patches 01-24 are good for merge.
  
> v2 now also includes the sdram changes after some clean up to simplify
> it. This should now be the same state as Cédric's series. I shall
> continue with the ppc440_sdram DDR2 controller model used by the
> sam460ex but that needs a bit more chnages. But it is independent of
> this series so this can be merged now and I can follow up later in a
> separate series.

I will take a look at the SDRAM changes later.

Thanks,

C.


  
> Regards,
> BALATON Zoltan
> 
> BALATON Zoltan (31):
>    ppc/ppc4xx: Introduce a DCR device model
>    ppc/ppc405: QOM'ify CPC
>    ppc/ppc405: QOM'ify GPT
>    ppc/ppc405: QOM'ify OCM
>    ppc/ppc405: QOM'ify GPIO
>    ppc/ppc405: QOM'ify DMA
>    ppc/ppc405: QOM'ify EBC
>    ppc/ppc405: QOM'ify OPBA
>    ppc/ppc405: QOM'ify POB
>    ppc/ppc405: QOM'ify PLB
>    ppc/ppc405: QOM'ify MAL
>    ppc4xx: Move PLB model to ppc4xx_devs.c
>    ppc4xx: Rename ppc405-plb to ppc4xx-plb
>    ppc4xx: Move EBC model to ppc4xx_devs.c
>    ppc4xx: Rename ppc405-ebc to ppc4xx-ebc
>    ppc/ppc405: Use an embedded PPCUIC model in SoC state
>    hw/intc/ppc-uic: Convert ppc-uic to a PPC4xx DCR device
>    ppc/ppc405: Use an explicit I2C object
>    ppc/ppc405: QOM'ify FPGA
>    ppc405: Move machine specific code to ppc405_boards.c
>    hw/ppc/Kconfig: Remove PPC405 dependency from sam460ex
>    hw/ppc/Kconfig: Move imply before select
>    ppc/ppc4xx: Fix sdram trace events
>    ppc4xx: Fix code style problems reported by checkpatch
>    ppc440_bamboo: Remove unnecessary memsets
>    ppc4xx: Introduce Ppc4xxSdramBank struct
>    ppc4xx_sdram: Get rid of the init RAM hack
>    ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
>    ppc440_bamboo: Add missing 4 MiB valid memory size
>    ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
>    ppc4xx_sdram: QOM'ify
> 
>   hw/intc/ppc-uic.c         |   26 +-
>   hw/ppc/Kconfig            |    3 +-
>   hw/ppc/ppc405.h           |  190 +++++--
>   hw/ppc/ppc405_boards.c    |  384 ++++++++-----
>   hw/ppc/ppc405_uc.c        | 1078 ++++++++++++-------------------------
>   hw/ppc/ppc440.h           |    5 +-
>   hw/ppc/ppc440_bamboo.c    |   63 ++-
>   hw/ppc/ppc440_uc.c        |   57 +-
>   hw/ppc/ppc4xx_devs.c      |  670 +++++++++++++++++------
>   hw/ppc/ppc4xx_pci.c       |   31 +-
>   hw/ppc/sam460ex.c         |   52 +-
>   hw/ppc/trace-events       |    3 -
>   hw/ppc/virtex_ml507.c     |    7 +-
>   include/hw/intc/ppc-uic.h |    6 +-
>   include/hw/ppc/ppc4xx.h   |  118 +++-
>   15 files changed, 1477 insertions(+), 1216 deletions(-)
> 


