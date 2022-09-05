Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67FB5AD91F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:37:53 +0200 (CEST)
Received: from localhost ([::1]:42320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGym-0001qo-Ll
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGvJ-0004l7-8o; Mon, 05 Sep 2022 14:34:19 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:34662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGv5-0003xO-J3; Mon, 05 Sep 2022 14:34:16 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso23186336fac.1; 
 Mon, 05 Sep 2022 11:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=pHoPx1702MI6NDh1yw+dJB5iUyhOmXBu91q1C0JuJD8=;
 b=NmysZD4gVMszbQxUl6s0A5832ahV4CQKramqU1bKjjjsXZOBHqm1N8+RfgPZA3O6Jo
 HZ1eQOc445ufYjuDsZt5tyrn6640aXdPT7ahQU3Mvn0XNq80WwuXf3a6T99Yf0nWBF61
 /xsmCjP+ByrLugCauKThAFA/WdfP721gqMa8Jeo6J+tZcnY3UpfdgZLFPx7USkMtwJvN
 tp9noGzQsk1bMkNv9gEtxwD2FXxaqzA4QNMr9BRUCa7KjBg8/zmQW0qY3yU+pfYHzmX/
 KCuog1GWEZGy0x5nK5DS7VEmiPovJ12vE7neP+r3dYyDBw040K03/v45j0xjOo62yNYj
 7yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pHoPx1702MI6NDh1yw+dJB5iUyhOmXBu91q1C0JuJD8=;
 b=lzFsoN6D7I7XsSIbjBb5sgkyb7pcvXKOS5lhI7AJF6VsP1RtNrWqYyNlokNFiOZ+vP
 Y0w5UvrrohCyYs5csIiZT72m5U+scqe9Bbgycd3piTwwSKwufwb6xjdg1X8g0OzKSuRI
 fY0QcqcUUkLKi0E5StlKEoq4PRe+mMIXkqe4yWBhhySvBwJvn0Ds+2hI9D4K6Jg5BSLw
 CT0KI2hNdhHQq8MZnb1qBTK5+IJ7U2t3vRdm1+AFVvRIeE4EP5HPyAp/TNF60S+f3bG8
 mJzxjRjgQ+pV8NVbmQtFdrMR+f9lLLc56l4Mhr+w5XBaAJTfOuxJtzxC4zOfspM8d0LD
 eJqQ==
X-Gm-Message-State: ACgBeo3Z7qug7sC7G1ulXM2Cf0Rp4GY9xFrXKBC1H9Fndb2anAlfW1Nf
 dKuChydaKrRT+fyfQCSCkvANe73FKnaNAA==
X-Google-Smtp-Source: AA6agR5GNTRGZyhRAujgEMK0loUVrTQxz0UyUJi+PcY48ZrVIVnXB9KK3nMVRETOwWXFZM+J9eLrSA==
X-Received: by 2002:a05:6870:c1d3:b0:126:8942:24e6 with SMTP id
 i19-20020a056870c1d300b00126894224e6mr5306744oad.111.1662402841054; 
 Mon, 05 Sep 2022 11:34:01 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 l21-20020a9d7a95000000b00616d25dc933sm4855433otn.69.2022.09.05.11.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:34:00 -0700 (PDT)
Message-ID: <aae044c0-eef2-2b57-a1a4-c4bcfbcf38da@gmail.com>
Date: Mon, 5 Sep 2022 15:33:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 19/19] target/ppc: Clear fpstatus flags on VSX_ROUND
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-20-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-20-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.716,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Fix xsrdpic and other instructions not clearing the flags and saving
> incorrect values to FPSCR.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>




>   target/ppc/fpu_helper.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index fd3a966371..be47d73b14 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -3172,6 +3172,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
>       int i;                                                             \
>       FloatRoundMode curr_rounding_mode;                                 \
>                                                                          \
> +    helper_reset_fpstatus(env);                                        \
> +                                                                       \
>       if (rmode != FLOAT_ROUND_CURRENT) {                                \
>           curr_rounding_mode = get_float_rounding_mode(&env->fp_status); \
>           set_float_rounding_mode(rmode, &env->fp_status);               \

