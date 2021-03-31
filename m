Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60042350346
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 17:24:05 +0200 (CEST)
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRchQ-0004T2-Er
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 11:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lRcgG-0003of-Aa; Wed, 31 Mar 2021 11:22:52 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lRcg9-0004kY-Ox; Wed, 31 Mar 2021 11:22:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E289B96445B7;
 Wed, 31 Mar 2021 17:22:40 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 31 Mar
 2021 17:22:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00440e642bc-9d39-4425-8d8c-5f99671e45d9,
 34F67B4AF11B3FB6BB2DF0D0E8ED693DFFA38C47) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.210.153.104
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
To: Michael Ellerman <mpe@ellerman.id.au>, David Gibson
 <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
 <YGFVc2lBhvzm5CSa@yekko.fritz.box>
 <9870aaba-9921-5c5d-113c-5be6cd098cf2@kaod.org>
 <91e406bf-c9c6-0734-1f69-081d3633332b@gmail.com>
 <YGPI5vgoI8JDO1HN@yekko.fritz.box> <87blazyl5w.fsf@mpe.ellerman.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <041ea566-62cd-0017-fbaa-bb56bd97d381@kaod.org>
Date: Wed, 31 Mar 2021 17:22:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87blazyl5w.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d2ee3f70-88c7-448f-b5c8-ef9b311208cc
X-Ovh-Tracer-Id: 10646509520474049458
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeivddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 6:58 AM, Michael Ellerman wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>> On Mon, Mar 29, 2021 at 03:32:37PM -0300, Daniel Henrique Barboza wrote:
> ...
>>
>>> We assign ibm,chip-id=0x0 to CPUs 0-3, but CPUs 2-3 are located in a
>>> different NUMA node than 0-1. This would mean that the same socket
>>> would belong to different NUMA nodes at the same time.
>>
>> Right... and I'm still not seeing why that's a problem.  AFAICT that's
>> a possible, if unexpected, situation under real hardware - though
>> maybe not for POWER9 specifically.
> 
> I think I agree.
> 
>>> I believe this is what Cedric wants to be addressed. Given that the
>>> property is called after the OPAL property ibm,chip-id, the kernel
>>> expects that the property will have the same semantics as in OPAL.
>>
>> Even on powernv, I'm not clear why chip-id is tied into the NUMA
>> configuration, rather than getting all the NUMA info from
>> associativity properties.
> 
> AFAIK we don't use chip-id for anything related to NUMA, if we do I'd
> consider that a bug.

Since PAPR only has NUMA nodes, is the use of chip-id in XIVE PAPR 
considered as a bug ? I would say so.

> We do use it for topology_physical_package_id(), but that's almost
> completely unused.

In that case, I think it should be fine to return -1 like under PowerVM.

Thanks,

C. 



