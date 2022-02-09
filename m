Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B614AF1D7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 13:37:30 +0100 (CET)
Received: from localhost ([::1]:35796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHmDx-00050E-5Q
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 07:37:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHm8t-0002br-KX
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:32:15 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:34739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHm8k-0002VJ-DO
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:32:15 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E81EA245A4;
 Wed,  9 Feb 2022 12:31:17 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 13:31:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006323a903d-474f-4b52-8b81-873e2c0340fa,
 D657DFC387B0B0E2C5DD546C0716E11BBFCF4DEE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.223.183
Message-ID: <a2159a5a-18a5-8737-0ac9-df1505f73da1@kaod.org>
Date: Wed, 9 Feb 2022 13:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH 0/3] tests/tcg/ppc64le: fix the build of TCG tests
 with Clang
Content-Language: en-US
To: <matheus.ferst@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 82c9209a-b3dd-4b23-b8bb-f48315efd33b
X-Ovh-Tracer-Id: 12976277902012418924
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgjeehvdeltefghfehvdefffetieeggfeihfekiefhudejteehudekleevjedtveenucffohhmrghinhepghhnuhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>, danielhb413@gmail.com,
 alex.bennee@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Matheus,

[ Adding Miroslav ]

On 2/8/22 21:31, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Based-on: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg06506.html
> 
> As the configuration scripts used -mbig and -mlittle, building PPC tests
> with Clang was silently skipped. With the patch to fix these options[1],
> "make check-tcg" fails because of build and runtime errors. This patch
> series tries to fix some of these problems.
> 
> The first patch fixes "tests/tcg/ppc64le/mtfsf.c" by removing the
> GCC-only builtins used to emit mtfsf and mffs. We can emit these insns
> with inline asm instead.
> 
> The second patch addresses differences in the output of float_madds.c.
> The __builtin_fmaf used in this test emits fmadds with GCC and xsmaddasp
> with LLVM. The first insn had rounding errors fixed in
> d04ca895dc7f ("target/ppc: Add helpers for fmadds et al"), we apply
> a similar fix to xsmaddasp.
> 
> Then we have the build errors of tests/tcg/ppc64le/bcdsub.c. According
> to GCC docs[2], the '-mpower8-vector' flag provides some bcdsub
> builtins, so it'd be reasonable to assume that the rest of the toolchain
> knows about the insn if the compiler accepts this flag. Clang supports
> this flag since version 3.6[3], but the insn and builtins were only
> added in LLVM 14[4]. I couldn't find a good solution. Should we write a
> test to check for this insn at configuration time? Should we detect the
> compiler at build time and emit the insns with ".long" and fixed
> registers?
> 
> Even building with Clang 14, the test will fail in runtime because
> LLVM doesn't like "__int128" in inline asm. No error or warning is
> emitted, but the generated code only loads one doubleword of the VSR.
> The third patch of this series avoids this issue by using a vector
> type for VSR values.
> 
> Finally, it seems that the insns tested by
> tests/tcg/ppc64le/byte_reverse.c are not yet supported by LLVM. Since
> the configuration script uses '-mpower10' to check for POWER10 support
> and Clang doesn't support this flag, "make check-tcg" doesn't fail. We
> should probably change this check in the future, but since LLVM support
> of POWER10 seems incomplete, I guess we can leave it for now.

gitlab didn't spot any issues with the 4 patches applied. Should we merge
all patches :

   Use long endian options for ppc64
   tests/tcg/ppc64le: Use vector types instead of __int128
   target/ppc: change xs[n]madd[am]sp to use float64r32_muladd
   tests/tcg/ppc64le: use inline asm instead of __builtin_mtfsf

and see how we can address the LLVM support for P10 later ?

Thanks,

C.
  
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg06506.html
> [2] https://gcc.gnu.org/onlinedocs/gcc-8.3.0/gcc/PowerPC-AltiVec_002fVSX-Built-in-Functions.html
> [3] https://github.com/llvm/llvm-project/commit/59eb767e11d4ffefb5f55409524e5c8416b2b0db
> [4] https://github.com/llvm/llvm-project/commit/c933c2eb334660c131f4afc9d194fafb0cec0423
> 
> Matheus Ferst (3):
>    tests/tcg/ppc64le: use inline asm instead of __builtin_mtfsf
>    target/ppc: change xs[n]madd[am]sp to use float64r32_muladd
>    tests/tcg/ppc64le: Use vector types instead of __int128
> 
>   target/ppc/fpu_helper.c    | 54 ++++++++--------------
>   tests/tcg/ppc64le/bcdsub.c | 92 +++++++++++++++++++++-----------------
>   tests/tcg/ppc64le/mtfsf.c  | 19 ++++----
>   3 files changed, 80 insertions(+), 85 deletions(-)
> 


