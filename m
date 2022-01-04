Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD5B483FA0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 11:08:47 +0100 (CET)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gkI-0004cQ-9O
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 05:08:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4gin-0003ZR-Fv
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 05:07:13 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:42373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4gil-0002pr-FA
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 05:07:13 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5640820425;
 Tue,  4 Jan 2022 10:07:07 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 4 Jan
 2022 11:07:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005c7aa6e82-2bc4-43e0-891c-5e4eb1f9eac5,
 DC41CA294A1AC0AE13D8E7EBC58C249E9ADF812E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0dd83750-d91b-06cc-e013-551034d4439c@kaod.org>
Date: Tue, 4 Jan 2022 11:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 00/19] ppc/pnv: Add support for user created PHB3/PHB4
 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211213132830.108372-1-clg@kaod.org>
 <8cc4ad78-48e9-5e01-cae8-d89f9ee8a3a1@kaod.org>
 <770d6df3-dff1-84b7-f6db-09f9458f6261@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <770d6df3-dff1-84b7-f6db-09f9458f6261@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3b25eeeb-b37d-48a1-9d4d-79a2ceb8793c
X-Ovh-Tracer-Id: 2038441785485659043
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 10:56, Daniel Henrique Barboza wrote:
> 
> 
> On 12/15/21 13:56, Cédric Le Goater wrote:
>> On 12/13/21 14:28, Cédric Le Goater wrote:
>>> Hello,
>>>
>>> On the POWER8 processor, powernv8 machine, PHB3 devices can simply be
>>> created with :
>>>
>>>     -device pnv-phb3,chip-id=0,index=1
>>>
>>> with a maximum of 3 PHB3s per chip, each PHB3 adding a new PCIe bus.
>>>
>>> On the POWER9 processor, powernv9 machine, the logic is different. The
>>> the chip comes with 3 PHB4 PECs (PCI Express Controller) and each PEC
>>> can have several PHBs :
>>>
>>>    * PEC0 provides 1 PHB  (PHB0)
>>>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>>>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
>>>
>>> The PEC devices can be created with :
>>>
>>>     -device pnv-phb4-pec,chip-id=0,index=1
>>>
>>> And the number of added PHB4 devices depends on the PEC index. Each
>>> PHB4 adds a new PCIe bus.
>>>
>>> The following changes are mostly cleanups and improvements of the
>>> PHB3/4 realize routines to enable support. One important change is
>>> related to the way the powernv machine populates the device tree. It
>>> depends on the object hierarchy and it is necessary to reparent user
>>> created devices to the chip they belong to (see PATCH 5). PHB3 is a
>>> little more sophisticated because of its SysBusDevice nature (see
>>> PATCH 6).
>>>
>>> It would be preferable for libvirt and user to add one PHB4 (one PCIe
>>> bus) at a time but that's another step. The plan is to merge real soon
>>> the first patches which are required cleanups of the models and give
>>> some more time for the last ones.
>>
>> Applied patches 1-14 which are simple cleanups to ppc-next.
> 
> Did you also push patches 15-19? Or these were the ones that you decided to
> discard?

1-14 are now merged in mainline. I dropped patches 15-19 because they are
in the way for your changes.

Thanks,

C.

