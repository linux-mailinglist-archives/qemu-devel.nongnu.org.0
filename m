Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAB2694EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:09:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdFn-0001kg-D8; Mon, 13 Feb 2023 13:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pRdFe-0001fw-Sa
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:08:31 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pRdFd-0002Cl-4F
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:08:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.108])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6B8E321650;
 Mon, 13 Feb 2023 18:08:25 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 13 Feb
 2023 19:08:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00688a89af2-f8f7-4ee6-ad8a-f6cd5018d3d3,
 F14F4AD8ED0BD1E75D9128D0FAA1081513448E0E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d08e92bd-1b7d-a669-c673-6df407aa3ac3@kaod.org>
Date: Mon, 13 Feb 2023 19:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] target/ppc: fix warning with clang-15
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, <qemu-devel@nongnu.org>
CC: <sw@weilnetz.de>, <kkostiuk@redhat.com>, <richard.henderson@linaro.org>,
 <alex.bennee@linaro.org>
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-5-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230213161352.17199-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 84a59eca-1ebe-4523-98a0-4fd6df22199e
X-Ovh-Tracer-Id: 8978207336007764774
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiuddguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpihgvrhhrihgtkhdrsghouhhvihgvrheslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhsfiesfigvihhlnhgvthiirdguvgdpkhhkohhsthhiuhhksehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdgrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/13/23 17:13, Pierrick Bouvier wrote:
> When compiling for windows-arm64 using clang-15, it reports a sometimes
> uninitialized variable. This seems to be a false positive, as a default
> case guards switch expressions, preventing to return an uninitialized
> value, but clang seems unhappy with assert definition.
> 
> Setting the rnd variable to zero does not hurt anyway.
> 
> ../target/ppc/dfp_helper.c:141:13: error: variable 'rnd' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]                                                                              assert(0); /* cannot get here */                                                                                                                                                                                    ^~~~~~~~~
> ../include/qemu/osdep.h:229:20: note: expanded from macro 'assert'                                                                                                                                        #define assert(x)  g_assert(x)                                                                                                                                                                                                         ^~~~~~~~~~~
> /clangarm64/bin/../include/glib-2.0/glib/gtestutils.h:235:49: note: expanded from macro 'g_assert'                                                                                                                               if G_LIKELY (expr) ; else \
>                                                  ^~~~~~~~~~~~~~~
> /clangarm64/bin/../include/glib-2.0/glib/gmacros.h:1186:25: note: expanded from macro 'G_LIKELY'
>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../target/ppc/dfp_helper.c:144:42: note: uninitialized use occurs here
>      decContextSetRounding(&dfp->context, rnd);
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/dfp_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
> index cc024316d5..0b4b280683 100644
> --- a/target/ppc/dfp_helper.c
> +++ b/target/ppc/dfp_helper.c
> @@ -69,7 +69,7 @@ struct PPC_DFP {
>   
>   static void dfp_prepare_rounding_mode(decContext *context, uint64_t fpscr)
>   {
> -    enum rounding rnd;
> +    enum rounding rnd = 0;
>   
>       switch ((fpscr & FP_DRN) >> FPSCR_DRN0) {
>       case 0:
> @@ -106,7 +106,7 @@ static void dfp_prepare_rounding_mode(decContext *context, uint64_t fpscr)
>   static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
>                                                     struct PPC_DFP *dfp)
>   {
> -    enum rounding rnd;
> +    enum rounding rnd = 0;
>       if (r == 0) {
>           switch (rmc & 3) {
>           case 0:


