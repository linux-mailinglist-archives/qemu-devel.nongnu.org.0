Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F091355BC35
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 23:44:15 +0200 (CEST)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5wWl-0000pD-1o
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 17:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5wSp-0006Lh-QZ; Mon, 27 Jun 2022 17:40:12 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:45870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5wSn-0007Rr-2D; Mon, 27 Jun 2022 17:40:11 -0400
Received: by mail-oi1-x22c.google.com with SMTP id u9so14617539oiv.12;
 Mon, 27 Jun 2022 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2gaGYGIP9PDQmVVzHZTf4lVYHqjUdg3oYtg2YXFipfo=;
 b=M/5a5Pk3YNwm6qKjfqLHyMmrwsqRpiUKu6dJtuRScaiFvbJ6GFK3HrRhJSWyKshLQU
 eEUJ9JziCqqt5/QMzIf+jSbqaGfjdBpC9y/rcp05wJs1CTHQqvsu8RoVOqsvwvGOuCNz
 2Vd0EhIC3O0OBjwORLQIr+gaj9SYlZEbpMbfosqzbTlZ1cbgs3eTggu7yFIMmPFBS/pM
 hwjc/3Z1dOEiLwXpxm1XHvv5gyCEUo1ltynZ7rBfSYEtxRwSneUFfMZdc3ZfYcf8h2NM
 CU6hz0+Ra+VPIYGWlkkIYYMlVkR5CEsyf5K8JFEI0qwLmwhLEhqxGg7F55joboHnFieg
 PEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2gaGYGIP9PDQmVVzHZTf4lVYHqjUdg3oYtg2YXFipfo=;
 b=ChfRKOhJHQuS2VsKPircebeqHToWS+npl5Innhi54V2R+8gR4cKbuPx7+sF9QCR47n
 0cLZvyVnG+/wYcmsFL8UB0akfVrry4yL3F+29PSmQQpq5RYraIblsqE88R23XimInGIl
 LLSp06ZFVE8jIF4cg6sM6kwjSNzV8DbeEhxUVtZE/V9CrmIhKHhSzYSwwT7iFJp1qsdk
 C1GgwYuDkrDNUf4SZNcLd4592pDNhlEhzR1opVXXXBQWfWnCEq96ziT3nSgGc2l5w+GF
 6qEukHnYGJpuIueELNG3gHoGXwPB07mjvLXg/uS/uuJuU+8ZeGoV8EezkejwL62ufqyF
 yhmg==
X-Gm-Message-State: AJIora8c3wLJNgvEgnfBMgylZwIPUNeSxs+Zs8vCeBZSFJVLRUp7jLj5
 PJ7rfjowcJO4CiNtOxJkpsY=
X-Google-Smtp-Source: AGRyM1vFoOThA5XdCvun66zy0O94SbyAjvB0HgA6VGbXPlXikII9CFiR2eUXoVR30hrkrfdQkZPczQ==
X-Received: by 2002:a05:6808:e88:b0:335:256f:1524 with SMTP id
 k8-20020a0568080e8800b00335256f1524mr8975096oil.82.1656366007246; 
 Mon, 27 Jun 2022 14:40:07 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a056870959700b000f5f4ad194bsm8521956oao.25.2022.06.27.14.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 14:40:06 -0700 (PDT)
Message-ID: <29790153-d0d9-2256-41b5-82a1b38d1046@gmail.com>
Date: Mon, 27 Jun 2022 18:40:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc: Change FPSCR_* to follow POWER ISA numbering
 convention
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, lucas.coutinho@eldorado.org.br,
 leandro.lupori@eldorado.org.br
References: <20220622193203.127698-1-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220622193203.127698-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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



On 6/22/22 16:32, Víctor Colombo wrote:
> FPSCR_* bit values in QEMU are in the 'inverted' order from what Power
> ISA defines (e.g. FPSCR.FI is bit 46 but is defined as 17 in cpu.h).
> Now that PPC_BIT_NR macro was introduced to fix this situation for the
> MSR bits, we can use it for the FPSCR bits too.
> 
> Also, adjust the comments to make then fit in 80 columns
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

Queued in gitlab.com/danielhb/qemu/tree/ppc-next with the typo fixed.


Thanks,


Daniel

>   target/ppc/cpu.h | 72 ++++++++++++++++++++++++------------------------
>   1 file changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6d78078f37..c78f64cced 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -694,42 +694,42 @@ enum {
>   
>   /*****************************************************************************/
>   /* Floating point status and control register                                */
> -#define FPSCR_DRN2   34 /* Decimal Floating-Point rounding control           */
> -#define FPSCR_DRN1   33 /* Decimal Floating-Point rounding control           */
> -#define FPSCR_DRN0   32 /* Decimal Floating-Point rounding control           */
> -#define FPSCR_FX     31 /* Floating-point exception summary                  */
> -#define FPSCR_FEX    30 /* Floating-point enabled exception summary          */
> -#define FPSCR_VX     29 /* Floating-point invalid operation exception summ.  */
> -#define FPSCR_OX     28 /* Floating-point overflow exception                 */
> -#define FPSCR_UX     27 /* Floating-point underflow exception                */
> -#define FPSCR_ZX     26 /* Floating-point zero divide exception              */
> -#define FPSCR_XX     25 /* Floating-point inexact exception                  */
> -#define FPSCR_VXSNAN 24 /* Floating-point invalid operation exception (sNan) */
> -#define FPSCR_VXISI  23 /* Floating-point invalid operation exception (inf)  */
> -#define FPSCR_VXIDI  22 /* Floating-point invalid operation exception (inf)  */
> -#define FPSCR_VXZDZ  21 /* Floating-point invalid operation exception (zero) */
> -#define FPSCR_VXIMZ  20 /* Floating-point invalid operation exception (inf)  */
> -#define FPSCR_VXVC   19 /* Floating-point invalid operation exception (comp) */
> -#define FPSCR_FR     18 /* Floating-point fraction rounded                   */
> -#define FPSCR_FI     17 /* Floating-point fraction inexact                   */
> -#define FPSCR_C      16 /* Floating-point result class descriptor            */
> -#define FPSCR_FL     15 /* Floating-point less than or negative              */
> -#define FPSCR_FG     14 /* Floating-point greater than or negative           */
> -#define FPSCR_FE     13 /* Floating-point equal or zero                      */
> -#define FPSCR_FU     12 /* Floating-point unordered or NaN                   */
> -#define FPSCR_FPCC   12 /* Floating-point condition code                     */
> -#define FPSCR_FPRF   12 /* Floating-point result flags                       */
> -#define FPSCR_VXSOFT 10 /* Floating-point invalid operation exception (soft) */
> -#define FPSCR_VXSQRT 9  /* Floating-point invalid operation exception (sqrt) */
> -#define FPSCR_VXCVI  8  /* Floating-point invalid operation exception (int)  */
> -#define FPSCR_VE     7  /* Floating-point invalid operation exception enable */
> -#define FPSCR_OE     6  /* Floating-point overflow exception enable          */
> -#define FPSCR_UE     5  /* Floating-point underflow exception enable          */
> -#define FPSCR_ZE     4  /* Floating-point zero divide exception enable       */
> -#define FPSCR_XE     3  /* Floating-point inexact exception enable           */
> -#define FPSCR_NI     2  /* Floating-point non-IEEE mode                      */
> -#define FPSCR_RN1    1
> -#define FPSCR_RN0    0  /* Floating-point rounding control                   */
> +#define FPSCR_DRN2   PPC_BIT_NR(29) /* Decimal Floating-Point rounding ctrl. */
> +#define FPSCR_DRN1   PPC_BIT_NR(30) /* Decimal Floating-Point rounding ctrl. */
> +#define FPSCR_DRN0   PPC_BIT_NR(31) /* Decimal Floating-Point rounding ctrl. */
> +#define FPSCR_FX     PPC_BIT_NR(32) /* Floating-point exception summary      */
> +#define FPSCR_FEX    PPC_BIT_NR(33) /* Floating-point enabled exception summ.*/
> +#define FPSCR_VX     PPC_BIT_NR(34) /* Floating-point invalid op. excp. summ.*/
> +#define FPSCR_OX     PPC_BIT_NR(35) /* Floating-point overflow exception     */
> +#define FPSCR_UX     PPC_BIT_NR(36) /* Floating-point underflow exceptio     */
> +#define FPSCR_ZX     PPC_BIT_NR(37) /* Floating-point zero divide exception  */
> +#define FPSCR_XX     PPC_BIT_NR(38) /* Floating-point inexact exception      */
> +#define FPSCR_VXSNAN PPC_BIT_NR(39) /* Floating-point invalid op. excp (sNan)*/
> +#define FPSCR_VXISI  PPC_BIT_NR(40) /* Floating-point invalid op. excp (inf) */
> +#define FPSCR_VXIDI  PPC_BIT_NR(41) /* Floating-point invalid op. excp (inf) */
> +#define FPSCR_VXZDZ  PPC_BIT_NR(42) /* Floating-point invalid op. excp (zero)*/
> +#define FPSCR_VXIMZ  PPC_BIT_NR(43) /* Floating-point invalid op. excp (inf) */
> +#define FPSCR_VXVC   PPC_BIT_NR(44) /* Floating-point invalid op. excp (comp)*/
> +#define FPSCR_FR     PPC_BIT_NR(45) /* Floating-point fraction rounded       */
> +#define FPSCR_FI     PPC_BIT_NR(46) /* Floating-point fraction inexact       */
> +#define FPSCR_C      PPC_BIT_NR(47) /* Floating-point result class descriptor*/
> +#define FPSCR_FL     PPC_BIT_NR(48) /* Floating-point less than or negative  */
> +#define FPSCR_FG     PPC_BIT_NR(49) /* Floating-point greater than or neg.   */
> +#define FPSCR_FE     PPC_BIT_NR(50) /* Floating-point equal or zero          */
> +#define FPSCR_FU     PPC_BIT_NR(51) /* Floating-point unordered or NaN       */
> +#define FPSCR_FPCC   PPC_BIT_NR(51) /* Floating-point condition code         */
> +#define FPSCR_FPRF   PPC_BIT_NR(51) /* Floating-point result flags           */
> +#define FPSCR_VXSOFT PPC_BIT_NR(53) /* Floating-point invalid op. excp (soft)*/
> +#define FPSCR_VXSQRT PPC_BIT_NR(54) /* Floating-point invalid op. excp (sqrt)*/
> +#define FPSCR_VXCVI  PPC_BIT_NR(55) /* Floating-point invalid op. excp (int) */
> +#define FPSCR_VE     PPC_BIT_NR(56) /* Floating-point invalid op. excp enable*/
> +#define FPSCR_OE     PPC_BIT_NR(57) /* Floating-point overflow excp. enable  */
> +#define FPSCR_UE     PPC_BIT_NR(58) /* Floating-point underflow excp. enable */
> +#define FPSCR_ZE     PPC_BIT_NR(59) /* Floating-point zero divide excp enable*/
> +#define FPSCR_XE     PPC_BIT_NR(60) /* Floating-point inexact excp. enable   */
> +#define FPSCR_NI     PPC_BIT_NR(61) /* Floating-point non-IEEE mode          */
> +#define FPSCR_RN1    PPC_BIT_NR(62)
> +#define FPSCR_RN0    PPC_BIT_NR(63) /* Floating-point rounding control       */
>   /* Invalid operation exception summary */
>   #define FPSCR_IX     ((1 << FPSCR_VXSNAN) | (1 << FPSCR_VXISI)  | \
>                         (1 << FPSCR_VXIDI)  | (1 << FPSCR_VXZDZ)  | \

