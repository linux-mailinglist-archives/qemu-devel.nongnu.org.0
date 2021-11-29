Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B934461A38
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:46:57 +0100 (CET)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhvk-0001qC-6r
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:46:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mrhuJ-0000Hx-Ii; Mon, 29 Nov 2021 09:45:27 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mrhuG-0004Qy-JW; Mon, 29 Nov 2021 09:45:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 73AF2CEB1B5B;
 Mon, 29 Nov 2021 15:45:21 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 15:45:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005cf356a56-1f73-4845-b619-ca874e837576,
 3279756C2EB34864E332BB908A933B747C53BE44) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d7b8a6e0-c82b-32eb-1f50-b514b02032e2@kaod.org>
Date: Mon, 29 Nov 2021 15:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 35/35] test/tcg/ppc64le: Add float reference files
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-36-richard.henderson@linaro.org>
 <41eda524-8e61-88e6-71ff-757fae97bc9b@kaod.org>
 <0e4d4227-4a67-7a6e-4f45-6416faebbc93@linaro.org>
 <45a736de-efe4-1638-65c7-28764c93248a@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <45a736de-efe4-1638-65c7-28764c93248a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 568661e4-dab5-4ebf-bf97-c702f02a66f1
X-Ovh-Tracer-Id: 16681614496621890467
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgdeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeekfeehfedvfeehgfejleevkeehieelheduveekfedvhfelteeivdfftddukeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.317,
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 12:16, Richard Henderson wrote:
> On 11/22/21 10:43 AM, Richard Henderson wrote:
>> On 11/21/21 6:47 PM, Cédric Le Goater wrote:
>>> I am getting an error with this test. See below.
>> ...
>>>   ### Rounding to nearest
>>>   from single: f32(-nan:0xffa00000)
>>> -  to double: f64(-nan:0x00fff4000000000000) (INVALID)
>>> +  to double: f64(-nan:0x00fff4000000000000) (OK)
>>
>> Well that's disconcerting.
>>
>> I can replicate this failure on an x86_64 host, but do not see the same error on a power9 ppc64le host.
> 
> Bah.  The test case is buggy.
> 
> It reads the fpscr for the flags *after* having gone through the printf for the result, at which point you are at the mercy of whatever other fp arithmetic libc chooses to do.
> 
> Fixed with
> 
> --- a/tests/tcg/multiarch/float_convs.c
> +++ b/tests/tcg/multiarch/float_convs.c
> @@ -51,8 +51,8 @@ static void convert_single_to_double(float input)
> 
>       output = input;
> 
> -    out_fmt = fmt_f64(output);
>       flag_fmt = fmt_flags();
> +    out_fmt = fmt_f64(output);
>       printf("  to double: %s (%s)\n", out_fmt, flag_fmt);
>       free(out_fmt);
>       free(flag_fmt);
> 
> But this alone of course causes other "failures", because we've got some incorrect reference files.

The only one I have seen so far is on hexagon:

   https://gitlab.com/legoater/qemu/-/jobs/1829273672

C.


