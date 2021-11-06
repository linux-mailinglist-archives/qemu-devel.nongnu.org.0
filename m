Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA5C446F26
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 17:56:53 +0100 (CET)
Received: from localhost ([::1]:36770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjOzs-0007Ck-6p
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 12:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mjOyn-0006WY-Oi; Sat, 06 Nov 2021 12:55:45 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:33997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mjOyk-0002WD-01; Sat, 06 Nov 2021 12:55:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6A5EEC9E4968;
 Sat,  6 Nov 2021 17:55:30 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Sat, 6 Nov
 2021 17:55:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e02699de-2a97-4fec-866f-a192f30c144e,
 0F42570F59393370FB24324DC60E17D91301572C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.250.25.102
Message-ID: <aa8ad81f-db92-009c-e4f4-8d54455a098e@kaod.org>
Date: Sat, 6 Nov 2021 17:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] target/ppc, hw/ppc: Change maintainers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Daniel Henrique
 Barboza <danielhb413@gmail.com>
References: <20211105034640.53754-1-david@gibson.dropbear.id.au>
 <8e05f98a-6a46-f728-5035-fab10f5a209a@gmail.com>
 <880124b9-5cd1-7fcb-fdc6-3d3f8a1da2b6@amsat.org>
 <d7c12a79-107d-dfe6-ad7b-fde51f64ddf1@kaod.org>
 <bb0f4cb9-1c95-c45c-8eb9-b5504787fb1b@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <bb0f4cb9-1c95-c45c-8eb9-b5504787fb1b@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2800fdbd-69f7-47ea-a2fa-0013a8872bcd
X-Ovh-Tracer-Id: 12934901080641473327
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdekgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.407,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, groug@kaod.org, qemu-devel@nongnu.org,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> What we are going do will depend on inputs really. We have pseries
>> and KVM in focus because there is still business using the software
>> stack. TCG is extremely useful for pseries and powernv. We clearly
>> want to keep that running and improve it. Some parts have been barely
>> touched (and probably used) in the last 15 years. I think we should
>> drop some support to modernize the useful parts and ease maintenance.
> 
> Here let me recommend the ant work approach I'm doing for MIPS. Instead
> of dropping ISA extensions, I'm splitting them in various compile units,
> that way 1/ we can chose to build without them and 2/ sub-maintainers
> can maintain them separately. Having a finer grained MAINTAINERS
> entries allow to filter-out/in and reduce reviewers pressure.

OK. Yes, the goal is to ease maintenance, not to remove platforms or
CPUs. QEMU is the perfect project for legacy systems.

I am very willing to go in that direction and take the risk to break
a few things. We have been through such an episode when HV mode was
added for the PowerNV machine and we managed to fix all regressions,
down to OpenBIOS. Ben and his ppc32 knowledge helped a lot of course.

Untangling some parts won't be easy. Exception modeling for instance.
The instruction implementation shouldn't be too hard and it's being
modernized by Luis and Matheus. I guess we should improve our
testsuite to catch early any issues. An acceptance test for each
machine is a minimum.

Thanks,

C.


