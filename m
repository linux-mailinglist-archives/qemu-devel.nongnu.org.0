Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7F578B24
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:46:18 +0200 (CEST)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWh6-00041v-VE
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oDW58-0006Gt-Mj
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 15:07:02 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:56635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oDW56-00029s-SF
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 15:07:02 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPGBR-1nsPlK1nJ7-00PaKU; Mon, 18 Jul 2022 21:06:47 +0200
Message-ID: <24c90475-e653-c5d2-0372-a74b2d9f2d21@vivier.eu>
Date: Mon, 18 Jul 2022 21:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] linux-user/hppa: Fix segfaults on page zero
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <YtWNC56seiV6VenA@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <YtWNC56seiV6VenA@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jBlN5+lk5IvWC4yrRtNgx5kuY17KW+D3J/D4sblXk1EHqP5V1NF
 ARaxXcMD43owdg3E/HE25JilbFa5HI7WcfHy9w1zYCyc53vWd/qNEgQaepm6kT77SRtEi0i
 fAVpK3Rzg4jV7Deu2H2N1czT1qhu3VvqcC+C8Yi6yz3nOtjRAiPbUD1bfhYYNftKtAhRFK+
 bABUGKX4jdCaoL7kZ23cg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dtcZqOYpDmY=:xTF6Y9nle1cuvCzY8Lc55D
 EsETArazf2//wjNqXnR30g59/NDHyAEo7WtjVtt/N37oV7q5gpcHDg3mrSZGAEXpQK7ouZSVm
 KLp+sXoJmBKh1wvIIooD/l/3thLKjXZVBIqycZvp07t9Z/5kUxNhR0kZoXWNCQ3+UyRvXufjc
 kM3COfLYG07R0Awp76rVAFE9JIxVJUNqHxYK+ehvutpnXgmqlrEqE+aTubAcA3k1OtwhkNTWQ
 FlRskwXQKH+rpjj9pyB8+63m8AJWKcHzA64pBkiJv1+uNZxAUbYHi/K3LB6skorE6+dwNdbXC
 Xu8nYaNpDcpCHqyZRRJpfRn878kclADUfAj92xXJe95833DjduP2rDXZh7bK86LcnTcvl9vue
 BsNsKNPVRrxV2WsXSTl7OzJL6F/5JNYFwPStYdRqPh67ghNElXLaDsqFzuWQX4FfnZqdz4APy
 4loCwWmu6wSFiisxkZ52AKXgN4Jrjs6mPOSbcjB2BDw/v3ROxIuJYjPX8U8qS3syQAsyJxmpQ
 5UuH36kzdOcjbQHOif5QdO29nq9nz592BMcUWUGdhx2xh2POz7Gt8h/9xE0ORA5LKKkNLLJUS
 UluYCeKuFtgMWlrIQfBVfctHPa+lqhiCtR5pjfd+ctdXuerFlZXn/uooyTfpV2da1fxrDkzyu
 OxHZ/LmasteLFnTja9zXvEEerVKtA5T6d32kBZphuX4Tvgbx4dD7Zlg8AfmV3XVFMoO7agttd
 jWZ+DLgUi4qIHyRkGsg73ANl+flB0ACtSy/Klg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 18/07/2022 à 18:40, Helge Deller a écrit :
> This program:
> 
>      int main(void) { asm("bv %r0(%r0)"); return 0; }
> 
> produces on real hppa hardware the expected segfault:
> 
>      SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x3} ---
>      killed by SIGSEGV +++
>      Segmentation fault
> 
> But when run on linux-user you get instead internal qemu errors:
> 
> ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
> Bail out! ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
> ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)
> Bail out! ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)
> 
> Fix it by adding the missing case for the EXCP_IMP trap in
> cpu_loop() and raise a segfault.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
> Changes:
> 
> v2: Dropped the "+++" in the commit message - it confused b4 and git-am.
>      no functional changes.
> 
> ---
> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index a576d1a249..8f374aeef6 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -143,6 +143,9 @@ void cpu_loop(CPUHPPAState *env)
>               env->iaoq_f = env->gr[31];
>               env->iaoq_b = env->gr[31] + 4;
>               break;
> +        case EXCP_IMP:
> +            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq_f);
> +            break;
>           case EXCP_ILL:
>               force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
>               break;
> 
> 
> 
Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


