Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB90A48384F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 22:22:57 +0100 (CET)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4UnA-0001YT-Ea
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 16:22:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Ul5-0007A4-Nm; Mon, 03 Jan 2022 16:20:47 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:35591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Ul3-0003SA-1Y; Mon, 03 Jan 2022 16:20:47 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.17])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2843BD5530F6;
 Mon,  3 Jan 2022 22:20:41 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 22:20:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0013f227288-d041-4e67-8350-cd5aba265c1e,
 2FB4A63B976BE1634B5E5BEF676EDDCED9FE10A5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e52685ef-d9d6-9ad4-dd7a-a12d9feeaf13@kaod.org>
Date: Mon, 3 Jan 2022 22:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/17] ppc/pnv: enable pnv-phb4 user devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <e62ca8df-25a2-222c-1ffe-12fc52a4a82f@kaod.org>
 <91929906-0ade-51ce-295f-38cd68c519b9@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <91929906-0ade-51ce-295f-38cd68c519b9@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3df71617-7727-4c99-9333-64105c661218
X-Ovh-Tracer-Id: 7541559054259882976
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefuddgudegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/3/22 19:58, Daniel Henrique Barboza wrote:
> 
> 
> On 1/3/22 05:21, Cédric Le Goater wrote:
>> Hello Daniel,
>>
>> On 12/28/21 20:37, Daniel Henrique Barboza wrote:
>>> Hi,
>>>
>>> This series implements pnv-phb4 user devices for the powernv9 machine.
>>> It also includes a couple of pnv-phb3 and pnv-phb3-root-port fixes that
>>> were also applied for the pnv4 equivalents.
>>>
>>> During the enablement I had to rollback from the previously added
>>> support for user creatable pnv-phb4-pec devices. The most important
>>> reason is user experience. PEC devices that doesn't spawn the PHB
>>> devices will be just a placeholder to add PHBs, having no use of their
>>> own as far as the user sees it. From this standpoint it makes more sense
>>> to just create all PECs and attach the PHBs the user wants on them.
>>> Patch 14 also describes technical reasons to rollback this support.
>>>
>>> The series is rebased using Cedric's 'powernv-6.2' branch [1]i, which
>>> includes the '[PATCH 0/5] ppc/pnv: Preliminary cleanups before user
>>> created PHBs' patches [2].
>>
>> It would be easier if you based the patchset on mainline. It's not
>> a problem to resend patches of another person or/and even rework
>> them to fit your needs.
> 
> Sure, I'll send the v2 based on the mainline + the required patches.

Let me merge a couple first. It should reduce the overhead. I will drop
these :

   ppc/pnv: Attach PHB3 root port device when defaults are enabled
   ppc/pnv: Attach PHB4 root port device when defaults are enabled

They are in the way for your changes.

Thanks,

C.

