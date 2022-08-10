Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97058E6D7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 07:55:54 +0200 (CEST)
Received: from localhost ([::1]:50552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLeh7-0002Gt-1V
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 01:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLebt-00083M-RI
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:50:35 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:40213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLebp-0004Qd-6Q
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:50:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7C88A11DAB619;
 Wed, 10 Aug 2022 07:50:19 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 10 Aug
 2022 07:50:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0053efc9228-2276-4688-87bd-a50bd676867b,
 043EABA4B22CD34FCE1B70F8CBB6C707CA017DB3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ec20d3af-5f99-8e56-9352-75562c4548de@kaod.org>
Date: Wed, 10 Aug 2022 07:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: AST2600 support in QEMU
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Shivi Fotedar <sfotedar@nvidia.com>, Peter
 Delevoryas <peter@pjd.dev>, Jeremy Kerr <jk@ozlabs.org>, Klaus Jensen
 <its@irrelevant.dk>, Jonathan Cameron <jonathan.cameron@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Andrew Jeffery
 <andrew@aj.id.au>, "Amit Kumar (Engrg-SW)" <asinghal@nvidia.com>, Prasanna
 Karmalkar <pkarmalkar@nvidia.com>, "Tim Chen (SW-GPU)" <timch@nvidia.com>,
 Newton Liu <newtonl@nvidia.com>, Deepak Kodihalli <dkodihalli@nvidia.com>,
 qemu-arm <qemu-arm@nongnu.org>
References: <BY5PR12MB38917595B0306085EEBB1921B4629@BY5PR12MB3891.namprd12.prod.outlook.com>
 <CACPK8XfjXq6RW=M++UebfiGeij=GDSk5f6ZftNaL+2oeyCGnHw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XfjXq6RW=M++UebfiGeij=GDSk5f6ZftNaL+2oeyCGnHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 72d95958-5578-4506-84ee-9835959a8797
X-Ovh-Tracer-Id: 5123407530004417342
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeguddguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvefhleeuvefgjeejteevteffveeigefhvefgudetueeuvdelieffhfeikeelkeehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello,

On 8/10/22 04:37, Joel Stanley wrote:
> Hello Shivi,
> 
> I've added others to cc who may have some input.
> 
> On Tue, 9 Aug 2022 at 21:38, Shivi Fotedar <sfotedar@nvidia.com> wrote:
>>
>> Hello, we are looking for support for few features for AST2600 in QEMU, specifically
>>
>> PCIe RC support so BMC can talk to downstream devices for management functions.
> 
> I haven't seen any PCIe work done yet.

I haven't either. There is clearly a need now that we are moving
away from LPC.

>> MCTP controller to run MCTP protocol on top of PCIe or I2C.
> 
> What work would be required to do this on top of i2c?

I think Jonathan and Klaus worked on this. See :

   https://lore.kernel.org/qemu-devel/20220525121422.00003a84@Huawei.com/

>> I2C slave so BMC can talk to host CPU QEMU for IPMI
>
> Some support for slave mode was merged in v7.1.

yes.

Peter D. experimented with IPMI. See :

   https://lore.kernel.org/qemu-devel/20220630045133.32251-14-me@pjd.dev/

We also merged a new machine including a BMC ast2600 running OpenBMC
and an ast1030 SoC running OpenBIC. Work to interconnect them on the
same I2C bus is in progress.

Thanks,

C.

