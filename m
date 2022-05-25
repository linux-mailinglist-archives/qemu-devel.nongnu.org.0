Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E1F53430B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 20:34:31 +0200 (CEST)
Received: from localhost ([::1]:41948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntvq2-00007h-Bu
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 14:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntvo4-0007F5-Tu
 for qemu-devel@nongnu.org; Wed, 25 May 2022 14:32:28 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntvo3-0003e2-6o
 for qemu-devel@nongnu.org; Wed, 25 May 2022 14:32:28 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPGJh-1oCpCV0SOT-00PZhT; Wed, 25 May 2022 20:32:14 +0200
Message-ID: <00893670-4a9b-35e9-9042-76c1f58e18ca@vivier.eu>
Date: Wed, 25 May 2022 20:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 03/17] target/m68k: Fix coding style in
 m68k_interrupt_all
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-4-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8gQalOz3JeTiL6rz0n1QJZawwFYvYitU9WNliviugFwWwZ/EkKr
 DclSHbDdE/cYLJjK0osgTc6yD6S79p6y57rVsTSe5I0k89W5UmpF40FAIQJYSSikFwfS8gB
 zjfjX1s9SpO83Ix5gl1wVDKF1oFnu/UGb9W0Qz1MJSDyvDvuRdDDf0fZem8NKbHZD3yGsbK
 U3TD60WLMyxKY21HMIsrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MGwv0PKLgA8=:+BToH9qL5cXFBuqbUfPw6H
 +hrZcloJdGon386HIXlYmC9qfLrKVyLS5OjyJzDHae1aspGLuWt2gCwkk+cas3di41EcBCM12
 yxM3sBMIia3YSf3o8u3o81bNn8ES6EqGPVartoJ6RNXaFVm8oOMCQFuoJFizZk3XZlxpbvEsj
 YAamwWcrWCwcBnbmib3+srOf5/QQYVIAXV79TZp+TzVBKEBMXhDGIaqxpPvm1bdytW4g+wG25
 DDGssbFcCeR/GY+ztn4U/To2WT3Borci8D5j9NJ71dI/Kab2iFSbo82KRNicw4QCTlCeOWPl4
 s3yu3fwUo9Fm0VbdoTd0YKgIdMLxU4XygIZx/9H7fOtIJCOxn4zm/K016Nj1h7bySmD5tkynR
 PlOSNctgvdgatp4toRsfIwxCZTH8mm4raL0R1QoefnYl1D4i7zjjPCrpJ/5fcvR2xmXS2DMFN
 fODe45EqRJRolaXfy9U5ooY7xt9rWL6+Wau0rysmdi4oOdDIApvMPRPyDO6POjp7+ZCuzV8Qp
 PZshm/eKdW9xCfFxbn3sICM2uGkOiawR0SLKgp5GtFYKLweqS3ayHYMNIR5g1gOU2/Yx9nXQC
 yXhf3toOuX9YZ4kBfGVjdXCxy9xasggZXsPCKIwZabshqG5rujreAgh9+fJkwyW2tSnGWDOYh
 8X3l4pGFEjy4ct4OpJ1fsWbZa5YkFPhBHA/HtRw4UPmDxopEOXGlBZ5ZzbKmJbiKROek+ZoY7
 vuzW6Z5iCMDQ3RlOWpIwq0izV36Et4iScVlaWg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/04/2022 à 19:53, Richard Henderson a écrit :
> Add parenthesis around & vs &&.
> 
> Remove assignment to sr in function call argument -- note that
> sr is unused after the call, so the assignment was never needed,
> only the result of the & expression.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/op_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 2b94a6ec84..0f41c2dce3 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -408,11 +408,11 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
>           break;
>   
>       case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
> -        if (is_hw && oldsr & SR_M) {
> +        if (is_hw && (oldsr & SR_M)) {
>               do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
>               oldsr = sr;
>               env->aregs[7] = sp;
> -            cpu_m68k_set_sr(env, sr &= ~SR_M);
> +            cpu_m68k_set_sr(env, sr & ~SR_M);
>               sp = env->aregs[7];
>               if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
>                   sp &= ~1;

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


