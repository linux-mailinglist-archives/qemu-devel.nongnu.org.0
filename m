Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D1B5793C3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:04:04 +0200 (CEST)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhH1-0001W9-Tv
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhFp-00007Y-W4
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:02:51 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:40927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhFo-0002mM-8a
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:02:49 -0400
Received: by mail-qk1-x733.google.com with SMTP id g1so9744720qki.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2fA+r5/9rhRoLqX5tG8y/2ajNDa8wiiN34tV5AEToms=;
 b=i67FaJFXMIYtXMIYDmlqEigqxV6WauTb/lCUfAyVv6rpUXGLqeBkvbz38+u77m4cES
 6Dt+EcxflcnFsNDeTLORgKFZGH5moR7tZzvzc4vIgrYrkPoNYSSnenYLP454H+43Fhry
 GvJZkaUMkR95X1AHoAtqx/SfjBycn/BROD9uosD9neaIf5OEMGwGiPmNM+odV2yCzjbv
 PfI0rAHXEz9ZNmZe3GJ9NfXLwL6POZNPMMvMtiwk2XJCI/o9u/GfyB/O+qIVpUixt7xa
 FILd2aCzOCCEqBZ9uTTgBZlwmUucDx6bHwv4K6B7lAjXvigyGSa8Y9DZBI9s/GBcejPI
 pgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2fA+r5/9rhRoLqX5tG8y/2ajNDa8wiiN34tV5AEToms=;
 b=E7DHv6io0f7CSmHu/B2gyTPmZzy3zvp1n5L89svb4fUZ4qbxPhit9Wm0lrw+ODP+P/
 ApBOOeVcQ3w6o87bvrnNdpTMu0Bga8gWJ2zHJm7l/+H8fsz2WCiKP1urzGbw2F3UxGLt
 GwC8Lac+hw0n3ojr7Z9/JbOBwg2EMBxvQhsfVmFJCPZeopgWWNfAvJlBE0ZZkAZW01YI
 CND4acb03qLf7QM994rH8mhU/xNIdfqZtanEDVM4lUDBvZrzDGyGzd0iexIIffLPQvY9
 Qau/JzhYaKh80jZElMRavifd/0yhKHH7NYFglq2t2P/0NxMfOxP6DKQXipRmfgX+AqTL
 VJZA==
X-Gm-Message-State: AJIora8lP1aAiurXRsXDtCCFYFluEIirhEDoMlzfzZXpxPDca651Jx3Z
 JPEQSWkWbcjENwjzahCHFvdcug==
X-Google-Smtp-Source: AGRyM1vEjFFy74v+6AspgLWyxqwhbXYzQy0eY5BlwcQcvSsZWTeOrlNUhe0F3P73Aoz7TUMqZvSpag==
X-Received: by 2002:a05:620a:1f6:b0:6b5:d8da:b247 with SMTP id
 x22-20020a05620a01f600b006b5d8dab247mr9281565qkn.405.1658214167085; 
 Tue, 19 Jul 2022 00:02:47 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 x27-20020a05620a0b5b00b006b5e43466ebsm5843561qkg.59.2022.07.19.00.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 00:02:46 -0700 (PDT)
Message-ID: <81a6374e-dd14-6e74-dd6a-53f8d4fd4db0@linaro.org>
Date: Tue, 19 Jul 2022 12:32:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] target/loongarch/cpu: Fix cpucfg default value
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220715064829.1521482-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220715064829.1521482-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/15/22 12:18, Xiaojuan Yang wrote:
> We should config cpucfg[20] to set value for the scache's ways, sets,
> and size arguments when loongarch cpu init. However, the old code
> wirte 'sets argument' twice, so we change one of them to 'size argument'.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Queued.


r~

> ---
>   target/loongarch/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 89ea971cde..4cfce8c9d2 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -406,7 +406,7 @@ static void loongarch_la464_initfn(Object *obj)
>       data = 0;
>       data = FIELD_DP32(data, CPUCFG20, L3IU_WAYS, 15);
>       data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 14);
> -    data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 6);
> +    data = FIELD_DP32(data, CPUCFG20, L3IU_SIZE, 6);
>       env->cpucfg[20] = data;
>   
>       env->CSR_ASID = FIELD_DP64(0, CSR_ASID, ASIDBITS, 0xa);


