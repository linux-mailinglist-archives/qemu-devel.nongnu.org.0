Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58F68B703
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 09:02:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwQn-0001U7-2K; Mon, 06 Feb 2023 03:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pOwQP-0001Td-VJ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:00:34 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pOwQN-00020c-C7
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:00:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5FEEA2978C;
 Mon,  6 Feb 2023 08:00:14 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 6 Feb
 2023 09:00:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001d944ee4b-4adc-4d62-b6ba-6ea7151685c5,
 CF69EBA19D99189A5BFA69977647E68A070273F7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0b763708-6a54-b789-1bbf-56c1c7ce708b@kaod.org>
Date: Mon, 6 Feb 2023 09:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/5] hw/ppc: Set QDev properties using QDev API (part 2/3)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: BALATON Zoltan <balaton@eik.bme.hu>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, Markus Armbruster <armbru@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20230203211623.50930-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230203211623.50930-1-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d0400208-7644-4098-bfc6-3b2de23b2f6e
X-Ovh-Tracer-Id: 12938278782158539698
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeghedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieekheekheehjefgffekffevgeeludffieetjeeugfeftdejkeeggfevffeviefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdpmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdphhhpohhushhsihhnsehrvggrtghtohhsrdhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgrrhhmsghruhesrhgvug
 hhrghtrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/3/23 22:16, Philippe Mathieu-Daudé wrote:
> part 1 [*] cover:
> --
> QEMU provides the QOM API for core objects.
> Devices are modelled on top of QOM as QDev objects.
> 
> There is no point in using the lower level QOM API with
> QDev; it makes the code more complex and harder to review.
> 
> I first converted all the calls using errp=&error_abort or
> &errp=NULL, then noticed the other uses weren't really
> consistent.

6/8 years ago, we converted models to QOM, supposedly because the qdev
interface was legacy and QOM was the new way. That's not true anymore ?

That said, I am ok with changes, even for the best practices. I would
like to know how to keep track. Do we have a model skeleton/reference ?

Thanks,

C.

> A QDev property defined with the DEFINE_PROP_xxx() macros
> is always available, thus can't fail. When using hot-plug
> devices, we only need to check for optional properties
> registered at runtime with the object_property_add_XXX()
> API. Some are even always registered in device instance_init.
> --
> 
> In this series PPC hw is converted. Only one call site in PNV
> forwards the Error* argument and its conversion is justified.
> 
> Based-on: <20230203180914.49112-1-philmd@linaro.org>
> (in particular [PATCH 02/19] hw/qdev: Introduce qdev_prop_set_link():
>   https://lore.kernel.org/qemu-devel/20230203180914.49112-3-philmd@linaro.org/)
> 
> [*] https://lore.kernel.org/qemu-devel/20230203180914.49112-1-philmd@linaro.org/
> 
> Philippe Mathieu-Daudé (5):
>    hw/misc/macio: Set QDev properties using QDev API
>    hw/pci-host/raven: Set QDev properties using QDev API
>    hw/ppc/ppc4xx: Set QDev properties using QDev API
>    hw/ppc/spapr: Set QDev properties using QDev API
>    hw/ppc/pnv: Set QDev properties using QDev API
> 
>   hw/intc/pnv_xive.c         | 11 ++++------
>   hw/intc/pnv_xive2.c        | 15 +++++---------
>   hw/intc/spapr_xive.c       | 11 ++++------
>   hw/intc/xics.c             |  4 ++--
>   hw/intc/xive.c             |  4 ++--
>   hw/misc/macio/macio.c      |  6 ++----
>   hw/pci-host/pnv_phb3.c     |  9 +++------
>   hw/pci-host/pnv_phb4.c     |  4 ++--
>   hw/pci-host/pnv_phb4_pec.c | 10 +++-------
>   hw/pci-host/raven.c        |  6 ++----
>   hw/ppc/e500.c              |  3 +--
>   hw/ppc/pnv.c               | 41 ++++++++++++++++----------------------
>   hw/ppc/pnv_psi.c           | 10 +++-------
>   hw/ppc/ppc405_boards.c     |  6 ++----
>   hw/ppc/ppc405_uc.c         |  6 +++---
>   hw/ppc/ppc440_bamboo.c     |  3 +--
>   hw/ppc/ppc4xx_devs.c       |  2 +-
>   hw/ppc/sam460ex.c          |  5 ++---
>   hw/ppc/spapr_irq.c         |  8 +++-----
>   19 files changed, 62 insertions(+), 102 deletions(-)
> 


