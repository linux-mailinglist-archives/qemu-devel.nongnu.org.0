Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B3E564CF0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:32:30 +0200 (CEST)
Received: from localhost ([::1]:49652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8EhC-0002C7-1L
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EU8-0000ig-RH
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:19:01 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EU7-0001eo-97
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:19:00 -0400
Received: by mail-pl1-x62f.google.com with SMTP id k14so7624563plh.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sydlkRCb1776ecRlPlH0RjZMkjWLQiOBckBt8iLQoSw=;
 b=tVC6bHLWcyFXLnQYynBSrWLItUc82p8mc9A7PdQALskiRWgNMxq1Lz5htgE8sZXrKz
 cNQTRGkYtRLHFZSCoscbTAtegEXE/gW9cRIPg3tiWV5QIu4SFpG4tP4bZjzVFnmIKMNT
 QyWloamZMuf3uLE7PmwxChqtEpCgdakbWSfw3hoRf2cvM/pWyXx9EiFYjDzqr98eRCeA
 WwQCwTfS/wvJage0AZgZuCNlNb3+HqaKI/V5xkWr2tYPzbcEOPNZ0FuEANE/CX4WaEMV
 Efd5ni/MQnlk5ZE1O0cSfn06/GVuxQDeJW3xNDA1oBY2SH/KExKQ2K6Rtp5cD2ZUHN/1
 UmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sydlkRCb1776ecRlPlH0RjZMkjWLQiOBckBt8iLQoSw=;
 b=El10w3ysc7TtxvLBkxskt0K8IAAUZbqlm49ISD2XMGOzy2FGlTlwpLl9ky5yk/ywJ/
 165mrXeZyUzAFYbI/ha6/YSe7JcEbK3a7JFyAN1xOezbwWzS+maY4Q7cWsfCOD+da8zN
 pKZDtH6+5ZRKLGTVrwktmGT+XbCiWdaL4T+bZmODeeSrWlp+Ves8c/PUArx243+UPtJ8
 +YsDin46544evOKdA2DREB7wH5LJ+kgwWHGaayoJtSYqaQB1nI04WwzGO08w4WbwmPkQ
 qRgkzukjyItIN/PcDRsCiX1QmZeCFct5/SmuLiuArN1tTNVBdZKtGi4+F5vrZdF0jNjm
 jaWw==
X-Gm-Message-State: AJIora/PWXAncsvVSnZ+LvCiYc+fitNHNOj7sMWBxgty4EdK97Pch+7B
 JpZBLMDQmPmE4ByDu+pMTMXBJQ==
X-Google-Smtp-Source: AGRyM1toC13eFVxdH/EeZsN63XXOStIQ4UVb1mIhQWxGDIDdYb8/y8ITYUG7HAqVo0OmiBkQz++hlg==
X-Received: by 2002:a17:902:cec4:b0:16a:16d6:f67f with SMTP id
 d4-20020a170902cec400b0016a16d6f67fmr32445948plg.139.1656911937624; 
 Sun, 03 Jul 2022 22:18:57 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a170902e74a00b0016bdb688097sm2235343plf.142.2022.07.03.22.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:18:56 -0700 (PDT)
Message-ID: <87c56b26-62cb-a047-2da8-9af047640542@linaro.org>
Date: Mon, 4 Jul 2022 10:48:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 08/11] target/loongarch: Fix the meaning of ECFG reg's VS
 field
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-9-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-9-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 7/1/22 15:04, Xiaojuan Yang wrote:
> By the manual of LoongArch CSR, the VS field(18:16 bits) of
> ECFG reg means that the number of instructions between each
> exception entry is 2^VS.

Is it a typo in the manual that says "2VS", i.e. multiplication?

If so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 4c8f96bc3a..04e5e47da4 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -219,6 +219,10 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
>       env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV, 0);
>       env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE, 0);
>   
> +    if (vec_size) {
> +        vec_size = (1 << vec_size) * 4;
> +    }
> +
>       if  (cs->exception_index == EXCCODE_INT) {
>           /* Interrupt */
>           uint32_t vector = 0;


