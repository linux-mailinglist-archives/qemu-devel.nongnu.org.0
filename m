Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8729458BC7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 10:53:06 +0100 (CET)
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp60Y-0007ce-0H
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 04:53:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mp5z2-0006Dy-Es; Mon, 22 Nov 2021 04:51:32 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mp5z0-0000sz-96; Mon, 22 Nov 2021 04:51:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CCBBECD15B54;
 Mon, 22 Nov 2021 10:51:27 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 22 Nov
 2021 10:51:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045244d8c5-2872-49ca-9a37-a227bd56512f,
 416F395970A38A0BC3BF4248461703C95BA59510) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7d1b60d4-8450-9a6d-1579-d883741f4993@kaod.org>
Date: Mon, 22 Nov 2021 10:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 35/35] test/tcg/ppc64le: Add float reference files
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-36-richard.henderson@linaro.org>
 <41eda524-8e61-88e6-71ff-757fae97bc9b@kaod.org>
 <0e4d4227-4a67-7a6e-4f45-6416faebbc93@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <0e4d4227-4a67-7a6e-4f45-6416faebbc93@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2a841a15-ff46-4514-968e-6cac46086bec
X-Ovh-Tracer-Id: 7502715506136026019
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeekfeehfedvfeehgfejleevkeehieelheduveekfedvhfelteeivdfftddukeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 10:43, Richard Henderson wrote:
> On 11/21/21 6:47 PM, Cédric Le Goater wrote:
>> I am getting an error with this test. See below.
> ...
>>   ### Rounding to nearest
>>   from single: f32(-nan:0xffa00000)
>> -  to double: f64(-nan:0x00fff4000000000000) (INVALID)
>> +  to double: f64(-nan:0x00fff4000000000000) (OK)
> 
> Well that's disconcerting.
> 
> I can replicate this failure on an x86_64 host, but do not see the 
> same error on a power9 ppc64le host.

I do replicate on both x86_64 (rh9) and POWER9 (21.10).

The same ref file on 4 different P9 systems looks the same. make
check-tcg is behaving fine with it.

Updated here :

   https://gitlab.com/legoater/qemu/-/commit/3d5ab4afaa50c3771b9d3bc74bfd04d992dc3a07

CI in progress :

   https://gitlab.com/legoater/qemu/-/pipelines/413705207

C.

