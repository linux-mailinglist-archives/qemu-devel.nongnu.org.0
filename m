Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDB7454CE3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 19:13:57 +0100 (CET)
Received: from localhost ([::1]:58738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPRU-0007LB-Ht
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 13:13:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnPQK-00060A-UM
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:12:44 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:57419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnPQI-0005Ru-FP
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:12:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.13])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B2EDECC2F84D;
 Wed, 17 Nov 2021 19:12:39 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 19:12:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0013f72a961-7ab7-49a8-9c32-45aeb84301f5,
 E0AE69C6E5AA65AEB70FB41CD49354A0C9868CD0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.24.82
Message-ID: <e2bcae52-1802-5d75-9a3e-6fca8a69268f@kaod.org>
Date: Wed, 17 Nov 2021 19:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2] tests/tcg/ppc64le: Fix compile flags for
 byte_reverse
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20211117173353.7623-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211117173353.7623-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2cfa4e57-41cd-47d6-b9b1-003e0fe84214
X-Ovh-Tracer-Id: 5050505510668372899
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 18:33, Richard Henderson wrote:
> With a host compiler new enough to recognize power10 insns,
> CROSS_CC_HAS_POWER10 is true, but we do not supply the -cpu
> option to the compiler, resulting in
> 
> /tmp/ccAVdYJd.s: Assembler messages:
> /tmp/ccAVdYJd.s:49: Error: unrecognized opcode: `brh'
> /tmp/ccAVdYJd.s:78: Error: unrecognized opcode: `brw'
> /tmp/ccAVdYJd.s:107: Error: unrecognized opcode: `brd'
> make[2]: *** [byte_reverse] Error 1
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This looks fine. Queued for 6.2

I would need some education on how to run these tests and reproduce.

Thanks,

C.

> ---
>   tests/tcg/ppc64le/Makefile.target | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
> index 5e65b1590d..ba2fde5ff1 100644
> --- a/tests/tcg/ppc64le/Makefile.target
> +++ b/tests/tcg/ppc64le/Makefile.target
> @@ -9,18 +9,12 @@ PPC64LE_TESTS=bcdsub
>   endif
>   bcdsub: CFLAGS += -mpower8-vector
>   
> -PPC64LE_TESTS += byte_reverse
>   ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
> +PPC64LE_TESTS += byte_reverse
> +endif
> +byte_reverse: CFLAGS += -mcpu=power10
>   run-byte_reverse: QEMU_OPTS+=-cpu POWER10
>   run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
> -else
> -byte_reverse:
> -	$(call skip-test, "BUILD of $@", "missing compiler support")
> -run-byte_reverse:
> -	$(call skip-test, "RUN of byte_reverse", "not built")
> -run-plugin-byte_reverse-with-%:
> -	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
> -endif
>   
>   PPC64LE_TESTS += signal_save_restore_xer
>   
> 


