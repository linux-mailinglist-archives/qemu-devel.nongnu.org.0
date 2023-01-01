Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ECB65AACB
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 18:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pC26Y-0006Qx-Gt; Sun, 01 Jan 2023 12:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pC26V-0006Qg-Jw
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 12:26:35 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pC26T-0008B0-TA
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 12:26:35 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M5wc7-1pA8IY1okt-007Tvx; Sun, 01 Jan 2023 18:26:29 +0100
Message-ID: <0e418e12-2738-133e-e212-7c7dbbc241c8@vivier.eu>
Date: Sun, 1 Jan 2023 18:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/4] target/m68k: pass sign directly into make_quotient()
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
 <20230101144339.60307-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230101144339.60307-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MEuksqeSUn7tQ1EGwlPTaJ7omiSssS8UvG9Z5TL+AuOwjpbhZot
 BsTP7Ev8g1A5kTa/8OvGZP4SvhXcM7qTW8C8z7NusDsAF+NPj5DmkUzxW9AOPMB3AkjBniN
 X7sF0rmy27yHNE6QOjIafa3Kg1VlJtJTnaaCpPiPKkrEhHu7bpv9vnMMMZ/1pWQqIe+pnCC
 hDOw7tTjZSegGqdEWe/dw==
UI-OutboundReport: notjunk:1;M01:P0:NmfNTzqvlys=;jf3MBgrpVlyVW8x68ymUBhD+PyZ
 8taJzlitYZCW5/kV7k7C7KNw1EKdsqKaaXs/JV8TwmBabV5uOyyX+ouU0F7nXe32JBM7nCeF3
 BeRt+5ha8HVZjiyvjE+UKcLeNpvK9MPZWLvzu43zgrTGIaKABTjDKPK5T9MJIiXue1+iai2O+
 /uJ+IDMkup4ZNDcDu6uz/cSlp6OtGneGGrdQRcBEz7Bvrco0Mw+2wjT0KfQUoLB9ykfqfuZ15
 CRS82/uLwy5+5KFAARg2Tam6eHkx1FKbmWgKuABiaDtNXiEik6J/g1X+88r6ElDcJaL7+kfTC
 GcUhsqejuTAbCp1BoCPMvv4mikH6OmeXShs36kpZsM7OaDw5KfXb+WqjR9y/w3S8jYTSIyave
 upawyf5J9H+ylBzSowOyLp6kNw2drQD6p16C8/lDanhZoEvs0GE0SEUWyXgzM3GF+ukcrIUNp
 /Dz7xHsAmq+DWZ0GMrmaZp98s7Rd1UairUBwM2A+1198k2rpvqHIm/5WkKQaiATIdQaR0ZdKL
 vIQam/aUbWfVEC1P0czuwulz2uXvkCe4a8398OuSD7a4aNLtPrte7eI9SGosIf6F3ckkZcrD9
 g2DzUOB40WZsI62lSA7mXcsaMVh1UmvHXye09Ncr+XX8FkZ0p60LGJFQRhKUORwgYG9zlwmWr
 ZlGVPrVvq2gcTuVUvGuM/qS7jHVXywFSKVvyDm6gLw==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.802,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 01/01/2023 à 15:43, Mark Cave-Ayland a écrit :
> This enables the quotient parameter to be changed from int32_t to uint32_t and
> also allows the extra sign logic in make_quotient() to be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/fpu_helper.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
> index 0932c464fd..ae839785fa 100644
> --- a/target/m68k/fpu_helper.c
> +++ b/target/m68k/fpu_helper.c
> @@ -515,15 +515,8 @@ uint32_t HELPER(fmovemd_ld_postinc)(CPUM68KState *env, uint32_t addr,
>       return fmovem_postinc(env, addr, mask, cpu_ld_float64_ra);
>   }
>   
> -static void make_quotient(CPUM68KState *env, int32_t quotient)
> +static void make_quotient(CPUM68KState *env, int sign, uint32_t quotient)
>   {
> -    int sign;
> -
> -    sign = quotient < 0;
> -    if (sign) {
> -        quotient = -quotient;
> -    }
> -
>       quotient = (sign << 7) | (quotient & 0x7f);
>       env->fpsr = (env->fpsr & ~FPSR_QT_MASK) | (quotient << FPSR_QT_SHIFT);
>   }
> @@ -536,7 +529,8 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
>           return;
>       }
>   
> -    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
> +    make_quotient(env, extractFloatx80Sign(res->d),
> +                  floatx80_to_int32(res->d, &env->fp_status));
>   }
>   
>   void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
> @@ -547,7 +541,8 @@ void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
>           return;
>       }
>   
> -    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
> +    make_quotient(env, extractFloatx80Sign(res->d),
> +                  floatx80_to_int32(res->d, &env->fp_status));
>   }
>   
>   void HELPER(fgetexp)(CPUM68KState *env, FPReg *res, FPReg *val)

I think you need an "abs(floatx80_to_int32())" in both cases as you do in PATCH 4

Thanks,
Laurent

