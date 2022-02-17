Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BFF4B9B7E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:52:01 +0100 (CET)
Received: from localhost ([::1]:41344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcW8-00049I-BO
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:52:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKbqu-0004Q6-S9
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:09:30 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:49235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKbqq-0007VL-Hp
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:09:23 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3F80024C9D;
 Thu, 17 Feb 2022 08:09:16 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 09:09:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0021ea18af3-53e5-44ec-9219-a002c2745215,
 55F2FA688E53E6193732986A11006D0DC4E95ED2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1646dc52-cab4-baa6-aac3-9c16b4f9d7d9@kaod.org>
Date: Thu, 17 Feb 2022 09:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 3/3] tests/tcg/ppc64le: Use vector types instead of
 __int128
Content-Language: en-US
To: <matheus.ferst@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
 <20220208203145.3844662-4-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220208203145.3844662-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 505c6df7-1ed2-4833-86f6-1dae139a0787
X-Ovh-Tracer-Id: 192528886542601065
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeejgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
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
Cc: danielhb413@gmail.com, alex.bennee@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 21:31, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> LLVM/Clang doesn't like inline asm with __int128, use a vector type
> instead.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> Alternatively, we could pass VSR values in GPR pairs, as we did in
> tests/tcg/ppc64le/non_signalling_xscv.c
> ---
>   tests/tcg/ppc64le/bcdsub.c | 92 +++++++++++++++++++++-----------------
>   1 file changed, 52 insertions(+), 40 deletions(-)
> 
> diff --git a/tests/tcg/ppc64le/bcdsub.c b/tests/tcg/ppc64le/bcdsub.c
> index 8c188cae6d..17403daf22 100644
> --- a/tests/tcg/ppc64le/bcdsub.c
> +++ b/tests/tcg/ppc64le/bcdsub.c
> @@ -1,6 +1,7 @@
>   #include <assert.h>
>   #include <unistd.h>
>   #include <signal.h>
> +#include <altivec.h>
>   
>   #define CRF_LT  (1 << 3)
>   #define CRF_GT  (1 << 2)
> @@ -8,6 +9,16 @@
>   #define CRF_SO  (1 << 0)
>   #define UNDEF   0
>   
> +#ifdef __LITTLE_ENDIAN__

Shouldn't we be using :

#if BYTE_ORDER == LITTLE_ENDIAN

instead ?

Thanks,

C.

> +#define HIGH(T) (T)[1]
> +#define LOW(T) (T)[0]
> +#define U128(H, L) (vector unsigned long long) {L, H}
> +#else
> +#define HIGH(T) (T)[0]
> +#define LOW(T) (T)[1]
> +#define U128(H, L) (vector unsigned long long) {H, L}
> +#endif
> +
>   #define BCDSUB(vra, vrb, ps)                    \
>       asm ("bcdsub. %1,%2,%3,%4;"                 \
>            "mfocrf %0,0b10;"                      \
> @@ -15,17 +26,18 @@
>            : "v" (vra), "v" (vrb), "i" (ps)       \
>            : );
>   
> -#define TEST(vra, vrb, ps, exp_res, exp_cr6)    \
> -    do {                                        \
> -        __int128 vrt = 0;                       \
> -        int cr = 0;                             \
> -        BCDSUB(vra, vrb, ps);                   \
> -        if (exp_res)                            \
> -            assert(vrt == exp_res);             \
> -        assert((cr >> 4) == exp_cr6);           \
> +#define TEST(vra, vrb, ps, exp_res_h, exp_res_l, exp_cr6)   \
> +    do {                                                    \
> +        vector unsigned long long vrt = U128(0, 0);         \
> +        int cr = 0;                                         \
> +        BCDSUB(vra, vrb, ps);                               \
> +        if (exp_res_h || exp_res_l) {                       \
> +            assert(HIGH(vrt) == exp_res_h);                 \
> +            assert(LOW(vrt) == exp_res_l);                  \
> +        }                                                   \
> +        assert((cr >> 4) == exp_cr6);                       \
>       } while (0)
>   
> -
>   /*
>    * Unbounded result is equal to zero:
>    *   sign = (PS) ? 0b1111 : 0b1100
> @@ -33,13 +45,13 @@
>    */
>   void test_bcdsub_eq(void)
>   {
> -    __int128 a, b;
> +    vector unsigned long long a, b;
>   
>       /* maximum positive BCD value */
> -    a = b = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999c);
> +    a = b = U128(0x9999999999999999, 0x999999999999999c);
>   
> -    TEST(a, b, 0, 0xc, CRF_EQ);
> -    TEST(a, b, 1, 0xf, CRF_EQ);
> +    TEST(a, b, 0, 0x0, 0xc, CRF_EQ);
> +    TEST(a, b, 1, 0x0, 0xf, CRF_EQ);
>   }
>   
>   /*
> @@ -49,21 +61,21 @@ void test_bcdsub_eq(void)
>    */
>   void test_bcdsub_gt(void)
>   {
> -    __int128 a, b, c;
> +    vector unsigned long long a, b, c;
>   
>       /* maximum positive BCD value */
> -    a = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999c);
> +    a = U128(0x9999999999999999, 0x999999999999999c);
>   
>       /* negative one BCD value */
> -    b = (__int128) 0x1d;
> +    b = U128(0x0, 0x1d);
>   
> -    TEST(a, b, 0, 0xc, (CRF_GT | CRF_SO));
> -    TEST(a, b, 1, 0xf, (CRF_GT | CRF_SO));
> +    TEST(a, b, 0, 0x0, 0xc, (CRF_GT | CRF_SO));
> +    TEST(a, b, 1, 0x0, 0xf, (CRF_GT | CRF_SO));
>   
> -    c = (((__int128) 0x9999999999999999) << 64 | 0x999999999999998c);
> +    c = U128(0x9999999999999999, 0x999999999999998c);
>   
> -    TEST(c, b, 0, a, CRF_GT);
> -    TEST(c, b, 1, (a | 0x3), CRF_GT);
> +    TEST(c, b, 0, HIGH(a), LOW(a), CRF_GT);
> +    TEST(c, b, 1, HIGH(a), (LOW(a) | 0x3), CRF_GT);
>   }
>   
>   /*
> @@ -73,45 +85,45 @@ void test_bcdsub_gt(void)
>    */
>   void test_bcdsub_lt(void)
>   {
> -    __int128 a, b;
> +    vector unsigned long long a, b;
>   
>       /* positive zero BCD value */
> -    a = (__int128) 0xc;
> +    a = U128(0x0, 0xc);
>   
>       /* positive one BCD value */
> -    b = (__int128) 0x1c;
> +    b = U128(0x0, 0x1c);
>   
> -    TEST(a, b, 0, 0x1d, CRF_LT);
> -    TEST(a, b, 1, 0x1d, CRF_LT);
> +    TEST(a, b, 0, 0x0, 0x1d, CRF_LT);
> +    TEST(a, b, 1, 0x0, 0x1d, CRF_LT);
>   
>       /* maximum negative BCD value */
> -    a = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999d);
> +    a = U128(0x9999999999999999, 0x999999999999999d);
>   
>       /* positive one BCD value */
> -    b = (__int128) 0x1c;
> +    b = U128(0x0, 0x1c);
>   
> -    TEST(a, b, 0, 0xd, (CRF_LT | CRF_SO));
> -    TEST(a, b, 1, 0xd, (CRF_LT | CRF_SO));
> +    TEST(a, b, 0, 0x0, 0xd, (CRF_LT | CRF_SO));
> +    TEST(a, b, 1, 0x0, 0xd, (CRF_LT | CRF_SO));
>   }
>   
>   void test_bcdsub_invalid(void)
>   {
> -    __int128 a, b;
> +    vector unsigned long long a, b;
>   
>       /* positive one BCD value */
> -    a = (__int128) 0x1c;
> -    b = 0xf00;
> +    a = U128(0x0, 0x1c);
> +    b = U128(0x0, 0xf00);
>   
> -    TEST(a, b, 0, UNDEF, CRF_SO);
> -    TEST(a, b, 1, UNDEF, CRF_SO);
> +    TEST(a, b, 0, UNDEF, UNDEF, CRF_SO);
> +    TEST(a, b, 1, UNDEF, UNDEF, CRF_SO);
>   
> -    TEST(b, a, 0, UNDEF, CRF_SO);
> -    TEST(b, a, 1, UNDEF, CRF_SO);
> +    TEST(b, a, 0, UNDEF, UNDEF, CRF_SO);
> +    TEST(b, a, 1, UNDEF, UNDEF, CRF_SO);
>   
> -    a = 0xbad;
> +    a = U128(0x0, 0xbad);
>   
> -    TEST(a, b, 0, UNDEF, CRF_SO);
> -    TEST(a, b, 1, UNDEF, CRF_SO);
> +    TEST(a, b, 0, UNDEF, UNDEF, CRF_SO);
> +    TEST(a, b, 1, UNDEF, UNDEF, CRF_SO);
>   }
>   
>   int main(void)


