Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333D5EEFE1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:02:06 +0200 (CEST)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odoUf-0005TX-5H
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1odnr3-0000p5-FK
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:21:20 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1odnqx-0004rw-Eu
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:21:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id AF9CD23E06;
 Thu, 29 Sep 2022 07:20:57 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 29 Sep
 2022 09:20:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S0039f8ef0ba-cf3f-4128-8c13-f790ff5c4d3b,
 032C0FD8F8F6940E7188F9AF1C5F9DF4FDD15DF6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f3d289d5-16db-7d68-0ae0-b2003190b06d@kaod.org>
Date: Thu, 29 Sep 2022 09:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
 <CACPK8XeiadO=ACQdpFmvy5cAGe0C_LzC3ZPjPVMs_22bUDTcFg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XeiadO=ACQdpFmvy5cAGe0C_LzC3ZPjPVMs_22bUDTcFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ef4502d6-0222-4efb-9272-815fb10d767e
X-Ovh-Tracer-Id: 5141140451861170982
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegledguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghnughrvgifsegrjhdrihgurdgruhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/22 01:00, Joel Stanley wrote:
> On Wed, 28 Sept 2022 at 16:47, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> As the Cortex A7 MPCore Technical reference says :
>>
>>    "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
>>    uses 16 double-precision registers. When the FPU is implemented with
>>    NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
>>    This register bank is shared with NEON."
>>
>> Modify the mvfr0 register value of the cortex A7 to advertise only 16
>> registers when NEON is not available, and not 32 registers.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> 
> 
>> ---
>>   target/arm/cpu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 7ec3281da9aa..01dc74c32add 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1684,6 +1684,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>           cpu->isar.id_isar6 = u;
>>
>>           if (!arm_feature(env, ARM_FEATURE_M)) {
> 
> Can you explain why the test is put behind the !ARM_FEATURE_M check?

Do you mean the setting of MVFR0 ?

because it was close to the code clearing the SIMD bits (NEON)
of MVFR1 and it seemed more in sync with the specs :

    "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
     uses 16 double-precision registers. When the FPU is implemented with
     NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
     This register bank is shared with NEON."

(That said, M processors don't have NEON, so this part of the code
should never be reached )

It could be done outside of this test also because SIMDREG = 1 is
a valid value for M processors and the code path  :

     if (!cpu->has_neon && !cpu->has_vfp) {

will set MVFR0 to 0 later on if needed.


M55 seems to be a special case though :

     cpu->isar.mvfr1 = 0x12100211

these are the FPU and MVE bits.

C.

> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>> +            u = cpu->isar.mvfr0;
>> +            u = FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
>> +            cpu->isar.mvfr0 = u;
>> +
>>               u = cpu->isar.mvfr1;
>>               u = FIELD_DP32(u, MVFR1, SIMDLS, 0);
>>               u = FIELD_DP32(u, MVFR1, SIMDINT, 0);
>> --
>> 2.37.3
>>


