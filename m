Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DF95959DA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 13:23:28 +0200 (CEST)
Received: from localhost ([::1]:42984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNufP-0004Bz-BT
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 07:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oNubW-00089I-D8
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 07:19:26 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:47489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oNubU-0008Or-2Q
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 07:19:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.170])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8CBDA22294;
 Tue, 16 Aug 2022 11:19:21 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 16 Aug
 2022 13:19:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00246afd56c-7691-4eb8-9c41-d111a8813404,
 F9C770E940B196DD2347A7F94772438AA2E7EC4E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3f08d853-87fc-c396-5908-bbb12843dcf5@kaod.org>
Date: Tue, 16 Aug 2022 13:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 00/22] QOMify PPC4xx devices and minor clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660402839.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <cover.1660402839.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b7424f18-d413-46ae-b3fd-82635dc48ab7
X-Ovh-Tracer-Id: 9023243329596001187
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeljefhieetffeltdefteeutdekhfefuedttdevteffffffgedttdekieeftdetkeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/13/22 17:34, BALATON Zoltan wrote:
> Hello,
> 
> This is mased on gitlab.com/danielhb/qemu/tree/ppc-7.2
> 
> This series contains the rest of Cédric's patches modified according
> my review comments and some other small clean ups I've noticed along
> the way. I've kept the From line of Cédric for patches that were
> originally his even though they are modified a bit. Not sure what's
> the best way for this or what Cédric prefers.
> 
> The last sdram changes are not yet here because I'm still looking at
> those and will come back to them but this series is ready to merge
> unless there are comments that need further changes. Please let me
> know what do you think.

LGTM. In case you resend, may be change the names of the models which
are now common to PPC4xx. That's minor really.

I would dig the default case labels a little more before removing
them.

Thanks,

C.


> 
> Regards,
> BALATON Zoltan
> 
> BALATON Zoltan (22):
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
>    ppc4xx: Move EBC model to ppc4xx_devs.c
>    ppc/ppc405: Use an embedded PPCUIC model in SoC state
>    hw/intc/ppc-uic: Convert ppc-uic to a PPC4xx DCR device
>    ppc/ppc405: Use an explicit I2C object
>    ppc/ppc405: QOM'ify FPGA
>    ppc405: Move machine specific code to ppc405_boards.c
>    hw/ppc/Kconfig: Remove PPC405 dependency from sam460ex
>    hw/ppc/Kconfig: Move imply before select
>    ppc4xx: Drop empty default cases
>    ppc/ppc4xx: Fix sdram trace events
> 
>   hw/intc/ppc-uic.c         |   26 +-
>   hw/ppc/Kconfig            |    3 +-
>   hw/ppc/ppc405.h           |  182 +++++--
>   hw/ppc/ppc405_boards.c    |  360 +++++++++----
>   hw/ppc/ppc405_uc.c        | 1071 ++++++++++++-------------------------
>   hw/ppc/ppc440_bamboo.c    |    7 +-
>   hw/ppc/ppc440_uc.c        |   27 -
>   hw/ppc/ppc4xx_devs.c      |  473 +++++++++++++---
>   hw/ppc/sam460ex.c         |   37 +-
>   hw/ppc/trace-events       |    3 -
>   hw/ppc/virtex_ml507.c     |    7 +-
>   include/hw/intc/ppc-uic.h |    6 +-
>   include/hw/ppc/ppc4xx.h   |   71 ++-
>   13 files changed, 1223 insertions(+), 1050 deletions(-)
> 


