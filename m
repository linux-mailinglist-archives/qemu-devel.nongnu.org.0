Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F40D4199D2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:59:43 +0200 (CEST)
Received: from localhost ([::1]:44258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtyg-0006fA-49
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUttF-0007eq-DG
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:54:05 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:53181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUtt9-0003on-Gg
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:54:05 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D00F920F44;
 Mon, 27 Sep 2021 16:53:54 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 27 Sep
 2021 18:53:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0056f28b1ef-f30f-446e-a3e2-ddc08e1f8265,
 7A1C2730502A6E1581EB46D208322E62E5328AE4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d3050737-d5bf-bfc3-8e3b-fa2e62ee4407@kaod.org>
Date: Mon, 27 Sep 2021 18:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 1/7] qemu: Split machine_ppc.py acceptance tests
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-2-david@gibson.dropbear.id.au>
 <c4ba52a1-46f9-0e74-92b3-c57e617f6f08@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c4ba52a1-46f9-0e74-92b3-c57e617f6f08@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: edf8d9d5-12af-4ab7-b05c-ac629de55536
X-Ovh-Tracer-Id: 17807795877256006529
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedutedufeeufeefvdejieeiffelgeetgfeltdfhleeuveeiteegkeeuvdfftdetheenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.136,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org, wainersm@redhat.com,
 hpoussin@reactos.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 18:44, Philippe Mathieu-Daudé wrote:
> Hi David,
> 
> On 9/27/21 06:48, David Gibson wrote:
>> machine_ppc.py contains tests for 3 different ppc based machine types.  It
>> is listed in MAINTAINERS along with the PPC TCG cpu code.  That's not
>> really accurate though, since it's really more about testing those machines
>> than the CPUs.
>>
>> Therefore, split it up into separate files for the separate machine types,
>> and list those along with their machine types in MAINTAINERS.
>>
>> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>   MAINTAINERS                          |  4 +-
>>   tests/acceptance/machine_ppc.py      | 69 ----------------------------
>>   tests/acceptance/ppc_mpc8544ds.py    | 32 +++++++++++++
>>   tests/acceptance/ppc_pseries.py      | 35 ++++++++++++++
>>   tests/acceptance/ppc_virtex_ml507.py | 34 ++++++++++++++
>>   5 files changed, 104 insertions(+), 70 deletions(-)
>>   delete mode 100644 tests/acceptance/machine_ppc.py
>>   create mode 100644 tests/acceptance/ppc_mpc8544ds.py
>>   create mode 100644 tests/acceptance/ppc_pseries.py
>>   create mode 100644 tests/acceptance/ppc_virtex_ml507.py
> 
> Since I'm preparing an integration-testing pull request,
> I'll queue this single patch directly, to avoid future
> merge conflicts.
> 

Should I resend this patch ?

http://patchwork.ozlabs.org/project/qemu-devel/patch/20210817093036.1288791-1-clg@kaod.org/

Thanks,

C.

