Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0EA4C8685
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:32:25 +0100 (CET)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOxvk-0005bz-9g
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:32:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nOxsD-0003mw-1E
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:28:45 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:40921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nOxsA-0005kk-A2
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:28:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.206])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0017023CCF;
 Tue,  1 Mar 2022 08:28:31 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Mar
 2022 09:28:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0038d37af1f-5b3a-46b2-b388-86bad7d69235,
 24806437EA66095D5A0A0E3C988328111B43E697) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0012b372-04fb-55a7-2786-b1091d3a7e58@kaod.org>
Date: Tue, 1 Mar 2022 09:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ppc/pnv: fix default PHB4 QOM hierarchy
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220218202804.413157-1-danielhb413@gmail.com>
 <d8042dac-2a16-1b69-e334-58bae188d88e@kaod.org>
 <9f33be37-40a9-e308-a5d7-fefff1b0de3c@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <9f33be37-40a9-e308-a5d7-fefff1b0de3c@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ad953408-5557-4064-bab4-425f0cbd9e2e
X-Ovh-Tracer-Id: 15649727232851610592
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtuddguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 14:51, Daniel Henrique Barboza wrote:
> 
> 
> On 2/26/22 10:49, Cédric Le Goater wrote:
>> On 2/18/22 21:28, Daniel Henrique Barboza wrote:
>>> Commit 3f4c369ea63e ("ppc/pnv: make PECs create and realize PHB4s")
>>> changed phb4_pec code to create the default PHB4 objects in
>>> pnv_pec_default_phb_realize(). In this process the stacks[] PEC array was
>>> removed and each PHB4 object is tied together with its PEC via the
>>> phb->pec pointer.
>>>
>>> This change also broke the previous QOM hierarchy - the PHB4 objects are
>>> being created and not being parented to their respective chips. This can
>>> be verified by 'info pic' in a powernv9 domain with default settings.
>>> pnv_chip_power9_pic_print_info() will fail to find the PHBs because
>>> object_child_foreach_recursive() won't find any.
>>>
>>> The solution is to set the parent chip and the parent bus, in the same
>>> way done for user created PHB4 devices, for all PHB4 devices.
>>>
>>> Fixes: 3f4c369ea63e ("ppc/pnv: make PECs create and realize PHB4s")
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
>>
>> What about the pnv-phb3/4-root-port devices ? Should we attached
>> them also to the QOM hierarchy ?
> 
> 
> I guess it wouldn't hurt. I'll see what I can do.

I took it as it is for ppc-7.0. Changes can come after. Nothing critical.

Thanks,

C.


