Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2581B5AD8F7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:22:36 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGjy-0001VS-Ul
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGgn-0007hH-Eg; Mon, 05 Sep 2022 14:19:18 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:44824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGgh-0001RZ-Vo; Mon, 05 Sep 2022 14:19:17 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11eab59db71so22956868fac.11; 
 Mon, 05 Sep 2022 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=iVlYEDSzW1S/x4kxDGKjvvrk0DgJmCy+iOZcGFwhXI8=;
 b=beZfKUv+xeFDvvcszj0BPEdsjIMa3vL4YOYX3lXfHZuhOmDUyQFPpwXCQS1A/kv9O7
 73uTdqLusrNP7gEQ6BoBixoh0NZ/lk79ynkZBLTg7mWP/zV1yzS1L7eXdICss7k/AFp/
 tCWcoPHwFPXe9O9AGcFCrlUKjQJ8zMbn+ALvJwn+rqGIWTqhZUaJC7PGX8TNIThg/Fco
 oAEB9/1iBb9P7TbRbRsz0Xhru3Cs8N5YsUnlYL0rA7qLJKDg3bb5iLEYqIhds+eSMgZn
 dcHecslih3bjrP4GPcX+hAM43hkoZrhSn4BxAf8jkciIFl/esP3uqUddx8Luph0Io3/H
 4CxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=iVlYEDSzW1S/x4kxDGKjvvrk0DgJmCy+iOZcGFwhXI8=;
 b=gYrZbsD0IPeum0lDqlCY5RiYJ5MWIn/jtOYoR1ooRt+1yJFVEPt44r080IPuQMfdBP
 N0R+LFgfax03hqxKmHqTIJf2vi2O/gBowE/ceOy+gy9QA6Ej8CpUQbLcG63HYZ0zYbvM
 E3wVh2bfL03xqcm7gxrlhN6qBPX8Ru8zuB5ANfFSaZ3o3A1jovw+Hz+PKzN8I5RmMeUZ
 KubrPBZpYe+/dna2sKaZlqe6NKLkXlivkuwwTgsQhOC+M9e6sa9HprkcGqyf9Gfk5DEa
 soszADownDnTS+mF3WZPEhgHEa0ECyDp7MfatitYVfRJ9fjplcrvs6Qpry64sNYMjZ9X
 FoqQ==
X-Gm-Message-State: ACgBeo0USiRgAkQmyU0whVbyisz8xfPjwe9s5FXv/yzVOQZvQHG7jVWw
 uy+mnsKTwf46Ueo9RAuV6A4=
X-Google-Smtp-Source: AA6agR6jeg93+t3Xb91IELg0se/lMiejsK0U22obeX+bITdhu+pJOmPGCQTRGkrZIxDHe0LDEShARA==
X-Received: by 2002:a05:6870:608f:b0:fe:340d:df8e with SMTP id
 t15-20020a056870608f00b000fe340ddf8emr9464940oae.15.1662401950392; 
 Mon, 05 Sep 2022 11:19:10 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 t14-20020a056870638e00b0011dca1bd2cdsm5802609oap.0.2022.09.05.11.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:19:09 -0700 (PDT)
Message-ID: <ade46e06-38ce-82c9-028e-c19ae0290441@gmail.com>
Date: Mon, 5 Sep 2022 15:19:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 03/19] target/ppc: Zero second doubleword in DFP
 instructions
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-4-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-4-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.716,
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



On 9/1/22 10:17, Víctor Colombo wrote:
> Starting at PowerISA v3.1, the second doubleword of the registers
> used to store results in DFP instructions are supposed to be zeroed.
> 
>  From the ISA, chapter 7.2.1.1 Floating-Point Registers:
> """
> Chapter 4. Floating-Point Facility provides 32 64-bit
> FPRs. Chapter 5. Decimal Floating-Point also employs
> FPRs in decimal floating-point (DFP) operations. When
> VSX is implemented, the 32 FPRs are mapped to
> doubleword 0 of VSRs 0-31. (...)
> All instructions that operate on an FPR are redefined
> to operate on doubleword element 0 of the
> corresponding VSR. (...)
> and the contents of doubleword element 1 of the
> VSR corresponding to the target FPR or FPR pair for these
> instructions are set to 0.
> """
> 
> Before, the result stored at doubleword 1 was said to be undefined.
> 
> With that, this patch changes the DFP facility to zero doubleword 1
> when using set_dfp64 and set_dfp128. This fixes the behavior for ISA
> 3.1 while keeping the behavior correct for previous ones.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/dfp_helper.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
> index 5ba74b2124..be7aa5357a 100644
> --- a/target/ppc/dfp_helper.c
> +++ b/target/ppc/dfp_helper.c
> @@ -42,13 +42,16 @@ static void get_dfp128(ppc_vsr_t *dst, ppc_fprp_t *dfp)
>   
>   static void set_dfp64(ppc_fprp_t *dfp, ppc_vsr_t *src)
>   {
> -    dfp->VsrD(0) = src->VsrD(1);
> +    dfp[0].VsrD(0) = src->VsrD(1);
> +    dfp[0].VsrD(1) = 0ULL;
>   }
>   
>   static void set_dfp128(ppc_fprp_t *dfp, ppc_vsr_t *src)
>   {
>       dfp[0].VsrD(0) = src->VsrD(0);
>       dfp[1].VsrD(0) = src->VsrD(1);
> +    dfp[0].VsrD(1) = 0ULL;
> +    dfp[1].VsrD(1) = 0ULL;
>   }
>   
>   static void set_dfp128_to_avr(ppc_avr_t *dst, ppc_vsr_t *src)

