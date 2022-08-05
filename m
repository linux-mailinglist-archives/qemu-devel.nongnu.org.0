Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267F958AEDC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:28:16 +0200 (CEST)
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK17P-0003Zo-90
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oK165-0001sU-4B; Fri, 05 Aug 2022 13:26:53 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:42999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oK163-0003jW-54; Fri, 05 Aug 2022 13:26:52 -0400
Received: by mail-vs1-xe33.google.com with SMTP id b124so3079452vsc.9;
 Fri, 05 Aug 2022 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=2aFTJcxZ/VFmHYryxvWDpdPGEgv7VX6/EhjaoGXmjCA=;
 b=GehSlePScUkdyMIipQeXFAq+SlinRcMFT3C2d2dItidr+olbQzxf+hlSl/91/tdVo7
 IuhmmBgw/u8co3+AXgEPf59HTV5kJL4fcTpFaUF3pT/f0k6EvbkHA3XR1kYwW4arpu1u
 4qTK4wdqqgLs84GXnQO/m7byp1yiQkRSNwpMeZLapwmXoXAq7C6q8wSw6Q5Uku4UyPTs
 VFtnz2xwWH3QxkGncFnZ+yg8gpbHLW3STGoT4LC8XA2Mx4aSa/ABzuzEgNXLlyQ8MFnk
 obsqOYMcwMLy1OmWZiOIkZLTml9dQnvXLyGOZqowhH4aXcvOEJtGQ8XYzBMGFDOTbBuO
 dxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2aFTJcxZ/VFmHYryxvWDpdPGEgv7VX6/EhjaoGXmjCA=;
 b=yior860oXn1jE8zP/AoSbritfH6noi8VusLCd0fMR0QMuAHk3pZTaCKcR4+A5xNYyJ
 ZpeTHwVONYFu6VIlltnwrqOhb0uygu6zfmyKfhEuIChqqh5jzZvMof2tmH3pdthLXHz7
 jmoWs6MhoJ0Ftxz25+Rzfu3EDGqb29fxCZT/RvpU1dGXRKK72rM7uFq6q01jFUHqEvXq
 4+iloMZPMxJbTVZvRUkkKo6w15J8e7Gu3Dw5S0xfGGYcfDFvMkbGvb0RGDOZZgnSWWW7
 14CMaS8HrGebQ4/WrvZ+SDOzCxIysmhVT1TGcOiR8su19CW4B/k5zxujdVuTYKCAckQo
 qgdQ==
X-Gm-Message-State: ACgBeo2fw8a8Jaob3AbqnPkg1AMpACRyA62OpdNdJYRgpb2C/W8c87JW
 RqNUFwpHE7BeaFEgVQ4ODT8=
X-Google-Smtp-Source: AA6agR4BP6EBje03Fl31Ff/A2koedWWCjrf6Ly4AXRBcfHdrOf1QF5KeeBnwOnoS3WkIhKaL5SSI0w==
X-Received: by 2002:a67:d509:0:b0:383:6b4c:3648 with SMTP id
 l9-20020a67d509000000b003836b4c3648mr3603164vsj.15.1659720409585; 
 Fri, 05 Aug 2022 10:26:49 -0700 (PDT)
Received: from [192.168.10.102] ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 1-20020a670801000000b0035fbcd4c849sm3194541vsi.18.2022.08.05.10.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 10:26:49 -0700 (PDT)
Message-ID: <d35a72e4-0f04-e70a-15eb-4c3cea183a92@gmail.com>
Date: Fri, 5 Aug 2022 14:26:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] target/ppc: Bugfix FP when OE/UE are set
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
 <20220805141522.412864-3-lucas.araujo@eldorado.org.br>
 <9e0592b7-3388-1707-bbf7-849a84c6e998@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <9e0592b7-3388-1707-bbf7-849a84c6e998@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/5/22 14:17, Richard Henderson wrote:
> On 8/5/22 07:15, Lucas Mateus Castro(alqotel) wrote:
>> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
>>
>> When an overflow exception occurs and OE is set the intermediate result
>> should be adjusted (by subtracting from the exponent) to avoid rounding
>> to inf. The same applies to an underflow exceptionion and UE (but adding
>> to the exponent). To do this set the fp_status.rebias_overflow when OE
>> is set and fp_status.rebias_underflow when UE is set as the FPU will
>> recalculate in case of a overflow/underflow if the according rebias* is
>> set.
>>
>> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
>> ---
>>   target/ppc/cpu.c        | 2 ++
>>   target/ppc/fpu_helper.c | 2 --
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
>> index 401b6f9e63..0ebac04bc4 100644
>> --- a/target/ppc/cpu.c
>> +++ b/target/ppc/cpu.c
>> @@ -120,6 +120,8 @@ void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
>>           val |= FP_FEX;
>>       }
>>       env->fpscr = val;
>> +    env->fp_status.rebias_overflow  = (FP_OE & env->fpscr) ? true : false;
>> +    env->fp_status.rebias_underflow = (FP_UE & env->fpscr) ? true : false;
> 
> No point in the ?: operator.
> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 

Amended in the tree. No need to re-send.


diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 0ebac04bc4..947a4bfe1f 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -120,8 +120,8 @@ void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
          val |= FP_FEX;
      }
      env->fpscr = val;
-    env->fp_status.rebias_overflow  = (FP_OE & env->fpscr) ? true : false;
-    env->fp_status.rebias_underflow = (FP_UE & env->fpscr) ? true : false;
+    env->fp_status.rebias_overflow  = FP_OE & env->fpscr;
+    env->fp_status.rebias_underflow = FP_UE & env->fpscr;
      if (tcg_enabled()) {
          fpscr_set_rounding_mode(env);
      }


Thanks,


Daniel

> 
> r~
> 
>>       if (tcg_enabled()) {
>>           fpscr_set_rounding_mode(env);
>>       }
>> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
>> index 134804628b..c17575de5d 100644
>> --- a/target/ppc/fpu_helper.c
>> +++ b/target/ppc/fpu_helper.c
>> @@ -344,7 +344,6 @@ static inline int float_overflow_excp(CPUPPCState *env)
>>       bool overflow_enabled = !!(env->fpscr & FP_OE);
>>       if (overflow_enabled) {
>> -        /* XXX: should adjust the result */
>>           /* Update the floating-point enabled exception summary */
>>           env->fpscr |= FP_FEX;
>>           /* We must update the target FPR before raising the exception */
>> @@ -363,7 +362,6 @@ static inline void float_underflow_excp(CPUPPCState *env)
>>       /* Update the floating-point exception summary */
>>       env->fpscr |= FP_FX;
>>       if (env->fpscr & FP_UE) {
>> -        /* XXX: should adjust the result */
>>           /* Update the floating-point enabled exception summary */
>>           env->fpscr |= FP_FEX;
>>           /* We must update the target FPR before raising the exception */
> 

