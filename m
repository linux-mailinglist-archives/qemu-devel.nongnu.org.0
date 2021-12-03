Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF226467530
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 11:37:32 +0100 (CET)
Received: from localhost ([::1]:39364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt5wZ-0004BX-Qz
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 05:37:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt5vY-0003Tm-SG
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:36:28 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:51063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt5vV-0005b9-LL
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:36:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5164B20DB4;
 Fri,  3 Dec 2021 10:36:23 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 3 Dec
 2021 11:36:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001b8cd5bd7-9277-4dd7-9b0c-484800ada087,
 327B7BE4A87BAA89609EF58271276ABDC6C19EF5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b85f3c68-7643-be41-9c7b-6475932725d6@kaod.org>
Date: Fri, 3 Dec 2021 11:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH for-7.0 00/35] target/ppc fpu fixes and cleanups
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0ccd0f78-daeb-4b8a-8f2a-827b8bfeda12
X-Ovh-Tracer-Id: 17520972876682529699
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
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

On 11/19/21 17:04, Richard Henderson wrote:
> This is a partial patch set showing the direction I believe
> the cleanups should go, as opposed to a complete conversion.
> 
> I add a bunch of float_flag_* bits that diagnose the reason
> for most float_flag_invalid, as guided by the requirements
> of the PowerPC VX* bits.  I have converted some helpers to
> use these new flags but not all.  A good signal for unconverted
> routines is the use of float*_is_signalling_nan, which should
> now be using float_flag_invalid_snan.
> 
> I added float64x32_* arithmetic routines, which take float64
> arguments and round the result to the range and precision of
> float32, while giving the result in float64 form.  This is
> exactly what PowerPC requires for its single-precision math.
> This fixes double-rounding problems that exist in the current
> code, and are visible in the float_madds test.
> 
> I add test reference files for float_madds and float_convs
> after fixing the bugs required to make the tests pass.
> 
> 
> r~
> 
> 
> Richard Henderson (35):
>    softfloat: Extend float_exception_flags to 16 bits
>    softfloat: Add flag specific to Inf - Inf
>    softfloat: Add flag specific to Inf * 0
>    softfloat: Add flags specific to Inf / Inf and 0 / 0
>    softfloat: Add flag specific to sqrt(-x)
>    softfloat: Add flag specific to convert non-nan to int
>    softfloat: Add flag specific to signaling nans
>    target/ppc: Update float_invalid_op_addsub for new flags
>    target/ppc: Update float_invalid_op_mul for new flags
>    target/ppc: Update float_invalid_op_div for new flags
>    target/ppc: Move float_check_status from FPU_FCTI to translate
>    target/ppc: Update float_invalid_cvt for new flags
>    target/ppc: Fix VXCVI return value
>    target/ppc: Remove inline from do_fri
>    target/ppc: Use FloatRoundMode in do_fri
>    target/ppc: Tidy inexact handling in do_fri
>    target/ppc: Clean up do_fri
>    target/ppc: Update fmadd for new flags
>    target/ppc: Split out do_fmadd
>    target/ppc: Do not call do_float_check_status from do_fmadd
>    target/ppc: Split out do_frsp
>    target/ppc: Update do_frsp for new flags
>    target/ppc: Use helper_todouble in do_frsp
>    target/ppc: Update sqrt for new flags
>    target/ppc: Update xsrqpi and xsrqpxp to new flags
>    target/ppc: Update fre to new flags
>    softfloat: Add float64r32 arithmetic routines
>    target/ppc: Add helpers for fmadds et al
>    target/ppc: Add helper for fsqrts
>    target/ppc: Add helpers for fadds, fsubs, fdivs
>    target/ppc: Add helper for fmuls
>    target/ppc: Add helper for frsqrtes
>    target/ppc: Update fres to new flags and float64r32
>    target/ppc: Use helper_todouble/tosingle in helper_xststdcsp
>    test/tcg/ppc64le: Add float reference files

I didn't see any regression, so I plan to queue the first 34 patches
for 7.0 and let you handle the last patch since there is a small fix
to address before.

Thanks,

C.

