Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53632135396
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 08:14:48 +0100 (CET)
Received: from localhost ([::1]:56542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipS1m-0002Cr-TD
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 02:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ipS0x-00018n-5I
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 02:13:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ipS0u-0004yw-CG
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 02:13:53 -0500
Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216]:44056)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ipS0r-0004sX-Vc
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 02:13:51 -0500
Received: from player168.ha.ovh.net (unknown [10.109.146.19])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id C43D614A3EF
 for <qemu-devel@nongnu.org>; Thu,  9 Jan 2020 08:13:47 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player168.ha.ovh.net (Postfix) with ESMTPSA id 6157CDFC2B54;
 Thu,  9 Jan 2020 07:13:39 +0000 (UTC)
Subject: Re: [PATCH 5/7] target/ppc: Add privileged message send facilities
To: David Gibson <david@gibson.dropbear.id.au>
References: <20191128134700.16091-1-clg@kaod.org>
 <20191128134700.16091-6-clg@kaod.org> <20191217040048.GM6242@umbus.fritz.box>
 <8f906ec1-bc56-3e14-640a-572c862f4bea@kaod.org>
 <20200109014521.GJ8586@umbus.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2f676176-1fcf-8753-12bc-8d2c9fb94061@kaod.org>
Date: Thu, 9 Jan 2020 08:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109014521.GJ8586@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 15180226972375747480
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehledgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduieekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.72.216
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>>  void helper_book3s_msgclr(CPUPPCState *env, target_ulong rb)
>>>>  {
>>>> -    int irq = book3s_dbell2irq(rb);
>>>> +    int irq = book3s_dbell2irq(rb, 1);
>>>
>>> true/false are preferred to 0/1 for bool types.
>>
>> yes or a define ?
> 
> Sorry, I don't understand the question.  The second argument to
> book3s_dbell2irq() is a 'bool' type, so the parameter should be 'true'
> rather than '1'.

Yes. I was thinking of adding defines for the 'true' and 'false' value
to clarify what the parameter is doing. But it does not seem really 
useful now.

Thanks,

C.

