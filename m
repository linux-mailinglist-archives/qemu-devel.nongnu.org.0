Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B91488323
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 12:13:00 +0100 (CET)
Received: from localhost ([::1]:54124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n69ed-00066A-Ce
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 06:12:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n69dS-0005Gb-P7
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 06:11:46 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:52281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n69dP-00005j-P6
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 06:11:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.179])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EC8CF20A34;
 Sat,  8 Jan 2022 11:11:40 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sat, 8 Jan
 2022 12:11:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00426e4afd4-d8fc-441c-863c-80d276838804,
 ADB8EF57020A8067B2D906C441EB5525CE9E7931) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <97527835-3c83-69e9-d1c8-873c4d549b19@kaod.org>
Date: Sat, 8 Jan 2022 12:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 17/18] ppc/pnv: Introduce user creatable pnv-phb4
 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-18-danielhb413@gmail.com>
 <4c3eab1f-e435-b468-96e3-9f3d78430534@kaod.org>
 <3464eb94-7905-fe0d-7924-8cd22d1a555e@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <3464eb94-7905-fe0d-7924-8cd22d1a555e@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fc71a800-bd33-40ce-a4d0-d44e62803f59
X-Ovh-Tracer-Id: 8172907424940526560
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> +        object_property_set_int(OBJECT(phb), "index",
>>> +                                phb->phb_id, &error_abort);
>>> +
>>> +        pnv_phb4_set_stack_phb_props(stack, phb);
>>> +
>>> +        /* Assign the phb to the stack */
>>> +        stack->phb = phb;
>>
>> The stack object should check the validity of the stack->phb pointer always.
> 
> 
> What do you mean by "check the validity"?
> 

I am thinking of the usage of 'stack->phb', for instance in the routine
pnv_phb4_update_regions(). We should add an assert there.

Your changes seem to cleanup the stack <-> phb relation quite a lot. Which
is good.

Thanks,

C.

