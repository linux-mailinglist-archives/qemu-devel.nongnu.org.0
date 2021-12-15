Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD0E475E39
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:09:16 +0100 (CET)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXmF-0002Za-AW
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:09:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXa0-0007xl-0A
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:56:36 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:58483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXZx-00036f-6a
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:56:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 27C5D2143D;
 Wed, 15 Dec 2021 16:56:31 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:56:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0010fbfd126-689a-4d56-9393-99ebe9c713f0,
 739007483752B88DC6223A1C4664F5533176B921) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
Message-ID: <8cc4ad78-48e9-5e01-cae8-d89f9ee8a3a1@kaod.org>
Date: Wed, 15 Dec 2021 17:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 00/19] ppc/pnv: Add support for user created PHB3/PHB4
 devices
Content-Language: en-US
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20211213132830.108372-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dcb10e3f-02fb-4c3e-8390-8c2ae6efe9f9
X-Ovh-Tracer-Id: 2179460746465610659
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 14:28, Cédric Le Goater wrote:
> Hello,
> 
> On the POWER8 processor, powernv8 machine, PHB3 devices can simply be
> created with :
> 
>     -device pnv-phb3,chip-id=0,index=1
> 
> with a maximum of 3 PHB3s per chip, each PHB3 adding a new PCIe bus.
> 
> On the POWER9 processor, powernv9 machine, the logic is different. The
> the chip comes with 3 PHB4 PECs (PCI Express Controller) and each PEC
> can have several PHBs :
> 
>    * PEC0 provides 1 PHB  (PHB0)
>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
> 
> The PEC devices can be created with :
> 
>     -device pnv-phb4-pec,chip-id=0,index=1
> 
> And the number of added PHB4 devices depends on the PEC index. Each
> PHB4 adds a new PCIe bus.
> 
> The following changes are mostly cleanups and improvements of the
> PHB3/4 realize routines to enable support. One important change is
> related to the way the powernv machine populates the device tree. It
> depends on the object hierarchy and it is necessary to reparent user
> created devices to the chip they belong to (see PATCH 5). PHB3 is a
> little more sophisticated because of its SysBusDevice nature (see
> PATCH 6).
> 
> It would be preferable for libvirt and user to add one PHB4 (one PCIe
> bus) at a time but that's another step. The plan is to merge real soon
> the first patches which are required cleanups of the models and give
> some more time for the last ones.

Applied patches 1-14 which are simple cleanups to ppc-next.

Thanks,

C.

