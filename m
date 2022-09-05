Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A35AD923
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:41:11 +0200 (CEST)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVH1z-0005EX-15
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGtN-0003W0-OF; Mon, 05 Sep 2022 14:32:39 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGtE-0003cg-9B; Mon, 05 Sep 2022 14:32:12 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11f11d932a8so23124822fac.3; 
 Mon, 05 Sep 2022 11:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=VjGtFCQFn7oXKsAfEt3Xnpy9PXJlf1HjoB5Zi5VkA/4=;
 b=jn2Zq97GUP8WNItAStV33MhHqH1LtZ8hElZzAaVrYQTpVHDF+3H9f573Ve4OgQ7cTm
 m5FOX3P9qdqPuRg3AOQVQ7HFWnP+Jx3ulSd8v2h+s1xKTd6u6/J5jh62vmghXPwpUfJu
 1MxRmSgOt74mQwJm+Mise/KBzVaMlH471ocWKeCWR73YD6ptKZZS9jh08auxC9anih9S
 i4k92SvSZZ59pnZP/9qWrEyjRYklNU+umQjyGpJHjsK4N6ZWPzoHRW4pgd0dps0YIa9o
 VemJ4jfQm7QAyeb/++UIYS2WxsyzdCcJ4e6iQd2piiQCKBexD6bkbUJFFkCBu8lldpnw
 tU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VjGtFCQFn7oXKsAfEt3Xnpy9PXJlf1HjoB5Zi5VkA/4=;
 b=QTlJOJTfMFPlqcZ8vUZOrQ4Gi8dDswtXUZAlUsAdcfvDI7opZWE14jUjzPEAIVHiDe
 CMuse0HZ1tLO4D+yl/iPd0HBA0TzNOSw3LbvAxKZRrVihrYnicp/kNDQ6Acyhuo0UBYo
 1p4ehp8nHQgaq6FbvjD7QaGd1FVcW4mhr8qTCcO87Ajvg64GPyb4DLCXzXIcwIbngyfk
 Fchr35KA7vdkbs1E2IaJcoLh914GC5KV179J5smbPAEGIbEa8P8z7SJiyU8XJODgWn3B
 Wwb91JvfXRqBxBtIuv0apb+DiK76w4vgPdKHZcHRznL4l0Zgsm7KzZfQ+SLqS0UpALAu
 GPlw==
X-Gm-Message-State: ACgBeo0Vr2Ud+jbbmz4upKqw8Od4ljFQ+OeseOgsjobTnHK5p6Lo+Jz/
 ShfqCsS+HvB6IXzXjGafk5w=
X-Google-Smtp-Source: AA6agR5YcbS5KS7DHznGsOhofkkjf3U6xxSx/spJl3b3baIYmvF2gCGi7PG4CQVC5YDeUDaOSA3mzQ==
X-Received: by 2002:a54:4405:0:b0:343:23df:4ac5 with SMTP id
 k5-20020a544405000000b0034323df4ac5mr7817634oiw.69.1662402726582; 
 Mon, 05 Sep 2022 11:32:06 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 43-20020a9d062e000000b0063695ad0cbesm4833371otn.66.2022.09.05.11.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:32:06 -0700 (PDT)
Message-ID: <5c700011-3ba5-189d-97a7-06915e7f56e7@gmail.com>
Date: Mon, 5 Sep 2022 15:32:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 10/19] target/ppc: Clear fpstatus flags on VSX_CVT_FP_TO_FP
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-11-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-11-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

IIUC all the changes from patches 8-10 are based on the logic explained
in the commit message of patch 08. Problem is that patches 9 and 10 are
lacking context per themselves.

I'd rather either have patches 9 and 10 squashed into patch 8, or patches
9 and 10 need more meat in their commit messages.


Thanks,


Daniel

>   target/ppc/fpu_helper.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index ceb70ed36e..8a20413a78 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2692,6 +2692,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
>       ppc_vsr_t t = { };                                             \
>       int i;                                                         \
>                                                                      \
> +    helper_reset_fpstatus(env);                                    \
> +                                                                   \
>       for (i = 0; i < nels; i++) {                                   \
>           t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);        \
>           if (unlikely(stp##_is_signaling_nan(xb->sfld,              \

