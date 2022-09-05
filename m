Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340D95AD943
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:51:30 +0200 (CEST)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVHBw-0004Ay-Sp
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGwW-00067M-N4; Mon, 05 Sep 2022 14:35:33 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:44544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGwK-0004Fq-0B; Mon, 05 Sep 2022 14:35:30 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-11eab59db71so23037639fac.11; 
 Mon, 05 Sep 2022 11:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RLWnmLdyoLt2/Sq+8kSPPrUW+zDIQztfj0p7EogHG5s=;
 b=neQ8DxHAX+cnubnMRpvNc9HnGZzOoEbwLXooGC8/ssVr99ed3lqicrxW9u6GtDnLAu
 kdJbIp8J5AHCXg5DPyJyWFha8ecHN1eFWyZBNP/cZKVSRjrKnfpqR0mgsyKV+98VnELv
 M/qkm1WspMzoN9QaNhctXkBgR+D1L+B22HhgYWr+UY/sdFuPDl29wZo0oLa17D7oZScd
 AJRLsE9hbrlad30HClNLhhWreoKtEDk81cRxBr9E6wnGWcK8WlAiY/X2ZSjn3CDFxF+m
 79/11NPO/yB6uTpB1xqHACBHAB4CCPezBGZE1vaAZ8vp90sylg3UDE17DRgeybXLybCV
 LOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RLWnmLdyoLt2/Sq+8kSPPrUW+zDIQztfj0p7EogHG5s=;
 b=TDDnUL8QcHIdzqHBySfco44WktZn+aNdnhPvvKQpPMD3lM8Ax9rM8EWZiWwpI+AwNu
 2uVek1AWClmb2sAHitx3oChzKKF1RIyNnaJbo5OD3CjCyV3PVNy/fQh50jqRUNfoTyMI
 So3kdn6KO+0EgUwda67SmMsSNeIdxlHlhGpkqXoaLu8FyrzvTt9rHR3uZaZKFj0MNaOP
 JLs3LEBfcMAoapwGjGAt20AIpUXa1wHTP9QjjAUl2zwW05HH8Vx74iNbgQmwBbFDz9eT
 XCQluAptRbQ9y+Q/zUDUfODzVGgNvNuyFPZRmRuFBAAil3CaBbX8Y7Vxj1m8/o2367Q0
 dvfQ==
X-Gm-Message-State: ACgBeo2SsXICVBIb3jlWOxRuBtRfvi1NFb87PWKlskBPQBBpNTppI9ef
 TZ3UzqdYBFrq+kd0i+n8e18=
X-Google-Smtp-Source: AA6agR5MrUi/Ms+/3zMQOsIaMJF9e89NIvdmfOhpLQdKfH0gT9WeKVEpA17qKXS6zfP33WEaustcJQ==
X-Received: by 2002:aca:eb8a:0:b0:342:fe17:e18 with SMTP id
 j132-20020acaeb8a000000b00342fe170e18mr7923261oih.295.1662402918506; 
 Mon, 05 Sep 2022 11:35:18 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 k13-20020a056870f10d00b00118687c3907sm2863442oac.24.2022.09.05.11.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:35:18 -0700 (PDT)
Message-ID: <76477a1d-df06-0502-49d7-ef4a42560020@gmail.com>
Date: Mon, 5 Sep 2022 15:35:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 08/19] target/ppc: Clear fpstatus flags on
 VSX_CVT_INT_TO_FP_VECTOR
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-9-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-9-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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
> Fix xscvsdqp incorrectly not clearing the FI bit.
> Power ISA states that xscvsdqp should always set FPSCR.FI=0
> Right now, QEMU sometimes is incorrectly setting the flag to 1.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/fpu_helper.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index da79c64eca..94029883c7 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -3126,6 +3126,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
>   {                                                                       \
>       ppc_vsr_t t = *xt;                                                  \
>                                                                           \
> +    helper_reset_fpstatus(env);                                         \
>       t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);                 \
>       helper_compute_fprf_##ttp(env, t.tfld);                             \
>                                                                           \

