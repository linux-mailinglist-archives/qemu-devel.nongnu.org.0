Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1508111C8A1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:47 +0100 (CET)
Received: from localhost ([::1]:56488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifKGA-0000mi-3s
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 03:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ifKEP-0007fn-LI
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 03:53:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ifKEN-0005A0-Oq
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 03:53:57 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:57151)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1ifKEM-000562-RX
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 03:53:55 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N0o3X-1hljX01xWn-00wlFA; Thu, 12 Dec 2019 09:53:51 +0100
Subject: Re: [PATCH 23/28] target/m68k: Use cpu_*_mmuidx_ra instead of
 MMU_MODE{0,1}_SUFFIX
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20191212040039.26546-1-richard.henderson@linaro.org>
 <20191212040039.26546-24-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ff7e0037-08b4-a989-3f52-d70fdf97f739@vivier.eu>
Date: Thu, 12 Dec 2019 09:53:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212040039.26546-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:40GpAu44usl7gEeJhaVXdBmiBdCqyI1WESvyMNtm2WjHvU4I7xn
 yULRTwEAjL1dZX9JfKoQ/o/ZNDJlFjXbPincdNYSQztqQD1RgMXIAl/9bkdrMEhcdE7Xlp1
 MXgHTnj5i0uJaTbTE7gIi9Lztun0vWTVfo2m9jREAE7oY895wkJ4PjXAkaGrxlarJ9OZei0
 6GLEKlnpSIbuZn25MBKcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d75ctQPRePA=:Lv3qHLZgG6gCrIG497xYqf
 BAcqK9EjH+4e2Ouitzkr6X4oiH6956Ui4+4/6dwJNQO2NvZx3h2rGW9B0uw4HgAzGjCYKPtje
 Ul/DtobWVRZAXFENHc6iCdnRS6wqhcvYw9cjFvTbXWvxqOTymP16m5u1+H7+D815JKSZm5lZn
 DnrfvndlFAsjw7mxRDJEghowGh1etJ/uXbwqh/k/vokfT+8LkI+d0T+lUeEw2zIddseHKO50b
 LGDxFSYF2zLh5wVQLOJjOmIfE3rZRyXXieAC4b80eG4nkgWL0rnCRYohzc6nwYHqjtnEGjzNA
 5u7ntwd4rqpfmHItmuDTSj6BBkLj5IEsBouyQf7J7Ab8eJbEEnn5vmUxVyiyMLzs7YQmwqeZI
 HjXRziQyAtdIroSs9x7xwN4B8v+sviS1G9uWg4J1IqEVfztG1yUl4+mfomyO98mRGP5Rwu6Av
 5tvBjkNtlp1l63bqCZyeDlAkPutBye4HEcL6MqCW27/6cNIzEG4SnkMvUDW0qVDDHaH32yJIC
 LMvBCekIljtGXSLEOwKjDNlyoTbHD8ZBN9Ut2tNbZCo+pP6/JtX5DF0ELh2NP/qNA7oY80Bzm
 JdYrP4tLJBmFoT61CUwfUmCEbQ3n0IiLNTDAD1Wfx+0u6Vh3gBCjyWd++vKZRAhh2bWFbF65M
 q7rnxHQVf4Zdwl8VYHe6zO47JoENTkdUps3V2ovIDIe6yCRJeV1N8dfITPdCi8CxMEZe+cwlF
 sTSbtodSiM4O4xgA3HHTyGxsex4QfK7aHD9jg1esiui44ZJp4wj6/3uNYFv3PE6eown0fY/dq
 9gBLEQkUl13yPtTtLAB/RjjPIdLGTrRLlyncXsHRR2PQsVYXf2uonI2aIyWviN/aHi3I/2Lj5
 xBMFTKAggIsVL8BQ3IaehRpFI2sRVS9Qh5xTJ8khg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.13
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Le 12/12/2019 à 05:00, Richard Henderson a écrit :
> The generated *_user functions are unused.  The *_kernel functions
> have a couple of users in op_helper.c; use *_mmuidx_ra instead,
> with MMU_KERNEL_IDX.
> 
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/cpu.h       | 2 --
>  target/m68k/op_helper.c | 5 +++++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 20de3c379a..89af14e899 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -516,8 +516,6 @@ enum {
>  #define cpu_list m68k_cpu_list
>  
>  /* MMU modes definitions */
> -#define MMU_MODE0_SUFFIX _kernel
> -#define MMU_MODE1_SUFFIX _user
>  #define MMU_KERNEL_IDX 0
>  #define MMU_USER_IDX 1
>  static inline int cpu_mmu_index (CPUM68KState *env, bool ifetch)
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index bc4f845e3f..96a4951c21 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -36,6 +36,11 @@ static inline void do_interrupt_m68k_hardirq(CPUM68KState *env)
>  
>  #else
>  
> +#define cpu_lduw_kernel(e, p)    cpu_lduw_mmuidx_ra(e, p, MMU_KERNEL_IDX, 0)
> +#define cpu_ldl_kernel(e, p)     cpu_ldl_mmuidx_ra(e, p, MMU_KERNEL_IDX, 0)
> +#define cpu_stw_kernel(e, p, v)  cpu_stw_mmuidx_ra(e, p, v, MMU_KERNEL_IDX, 0)
> +#define cpu_stl_kernel(e, p, v)  cpu_stl_mmuidx_ra(e, p, v, MMU_KERNEL_IDX, 0)
> +
>  static void cf_rte(CPUM68KState *env)
>  {
>      uint32_t sp;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

