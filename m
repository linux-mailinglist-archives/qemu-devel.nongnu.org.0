Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A62553E587
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:46:10 +0200 (CEST)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEvg-0004pR-UP
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyEnO-0000lS-Ue
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 11:37:35 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:55953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyEnM-0002nu-A3
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 11:37:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.108])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A5D5522411;
 Mon,  6 Jun 2022 15:37:21 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 6 Jun 2022
 17:37:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004410b57ac-7c4b-4681-89d1-dd5215229ee4,
 A840C3071F53FBBEF021525C5A7AF27807DA8D8A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ec17bc9d-e1cb-3315-6b5e-88ec6d75c7bb@kaod.org>
Date: Mon, 6 Jun 2022 17:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Help: How do I make a machine with 2 separate ARM SoC's?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>
CC: Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>
References: <8C1AB09A-AFB3-469A-8333-C3D1802D14AE@fb.com>
 <CAFEAcA8LnnAnTqSw5Mm_01KAORn9qVnNsWbouXpJ6X_B=sZ0hw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8LnnAnTqSw5Mm_01KAORn9qVnNsWbouXpJ6X_B=sZ0hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 45459f49-ddef-4b75-9721-2791df49e61e
X-Ovh-Tracer-Id: 2247577689298209760
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Hello Peter M.,

[ ... ]

> Another device that does some moderately complicated things with
> MemoryRegions is the hw/arm/armsse.c SoC, which has several CPUs
> and has some per-CPU devices.
> 
> I think we have not thus far had a model of a board where different
> CPUs see radically different things (only ones where they can see
> minor differences), so you'll probably run into places where the
> APIs are a bit clunky (and we can perhaps have a go at making
> them a bit less so). What I would do is make the system_memory
> container be used by whatever is the "main" application processor
> SoC in your board. If the two SoCs really see absolutely different
> worlds with no shared devices at all, then you'll want to create
> a new empty container for the second SoC. If they do have some
> board-level shared devices, then you'll want to do something a little
> more complicated with aliases.
> 
> If you find the SoC device models you're using hardcode use of
> system_memory or address_space_memory you should treat those as
> bugs to be fixed. Other loose ends (like monitor commands that
> assume the system address space) can be ignored: having those
> operate on the 'application processor' SoC is fine, I think.

On the CPU topic, I think we will need to change the GIC device
to stop using qemu_get_cpu() in the CPU interface init routine
and in the GIC realize routine, since this is global to the machine.
I am having the same problem when trying to model a multi SoC board
with a GIC device on each chip.

What would be a good approach to loop only on the CPUs related
to a GIC device ? Could we tag the CPUs and the GIC in some way
to filter the unrelated CPUs ? Or pass a CPU list to the GIC
device ?

Thanks,

C.

> Overall, this is definitely doable but will involve a fair
> about of slogging through territory where nobody has yet
> broken a trail for you :-)
> 
> -- PMM


