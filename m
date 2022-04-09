Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF0D4FAACA
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:34:55 +0200 (CEST)
Received: from localhost ([::1]:57608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndHnK-0000av-IO
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHko-0007sv-N0
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:32:18 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHkn-0002fh-5P
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:32:18 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 ku13-20020a17090b218d00b001ca8fcd3adeso14856091pjb.2
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YUdq7AuAx6RE1moO/IQCqS2arBxXNMwukd1fD21BErA=;
 b=svvCp7aLDgSj4/cp0MO5VFepz9dMVU0KRzyNPoP+dUyFJeyLhFO9GRtrPAC/6KSiP8
 r6HesDsElUCYxO3PWkmWEayK/A0qFMYwcntMGGgMXPFwZPhUd1gkLR6COa/9pjTbq+E0
 NGXVpuSUIjCYGAs5m8ZCE88tVNBSVOXyhoNgIlIgUfxGN1klkAZMy19x6zPDhtSFJ+mu
 uX1lr0nDwJMLmm0P/FZ/Fex41CssJGUC5FVzxDfav662O4D0XsjlKtdWDvaREeFPioQS
 jQNT7U1Wfn+f0gNW3sJkvh0etfLQKoKr7fBCbM1AFwr2mT4HmqnSgHPfUEI45qFnPG4J
 +Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YUdq7AuAx6RE1moO/IQCqS2arBxXNMwukd1fD21BErA=;
 b=1Axy0glrzCeT/7oeQreDmD1qdWZFp7eiOfhRfQpMIPEd6ZrLVmGaQob1ZnDBfNeNVR
 SO0kyPPcy2v4856PtCtwA2sJQbO04B/bGgq/VdQz5/QdMyW9JFc8GnI9pvLony626xoU
 5hK0zm6wafVrbWMc7qULuVugorAB+4YTIpYEWu6VXBS+vP0HnSSqsC5IpDLI7vUwxzGx
 fbXv1Ud4wO1Ewh8lyqVg9Xyn3rhz+G2DjJwIvBTZ0E2eo36MgRycrGoGbMrAHIJtD9up
 HPOCAy8DanUHmrrOc3+EckDCrsrsaZkPhP1RGOeUWN2CDWfj8XnqiW1esUg25k/1y1sD
 eE6w==
X-Gm-Message-State: AOAM531Gl9xR/DQy/tELvhZ0RzL7QJoJSAeZ3+wffoHGpxR8i9droS9Z
 ATheOhC0vI84gpcP31K1BCPVig==
X-Google-Smtp-Source: ABdhPJxfaZ+xcJ9o6tfHBBTOLYHtShwXEr+PscCCRiqADFVT1waFFAAm5JRrf8eql+Xo7lQoQLsAmw==
X-Received: by 2002:a17:90a:4982:b0:1cb:5c8f:e3be with SMTP id
 d2-20020a17090a498200b001cb5c8fe3bemr6513698pjh.108.1649536335667; 
 Sat, 09 Apr 2022 13:32:15 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a056a00239500b004fb02a7a45bsm30706233pfc.214.2022.04.09.13.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:32:15 -0700 (PDT)
Message-ID: <ca73a8a2-745e-b1a2-ac21-55cdd1574760@linaro.org>
Date: Sat, 9 Apr 2022 13:32:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 32/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_vlpi_pending()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the function gicv3_redist_vlpi_pending(), which was
> previously left as a stub.  This is the function that is called by
> the CPU interface when it changes the state of a vLPI.  It's similar
> to gicv3_redist_process_vlpi(), but we know that the vCPU is
> definitely resident on the redistributor and the irq is in range, so
> it is a bit simpler.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index be36978b45c..eadf5e8265e 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -1009,9 +1009,28 @@ void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
>   void gicv3_redist_vlpi_pending(GICv3CPUState *cs, int irq, int level)
>   {
>       /*
> -     * The redistributor handling for changing the pending state
> -     * of a vLPI will be added in a subsequent commit.
> +     * Change the pending state of the specified vLPI.
> +     * Unlike gicv3_redist_process_vlpi(), we know here that the
> +     * vCPU is definitely resident on this redistributor, and that
> +     * the irq is in range.
>        */
> +    uint64_t vptbase, ctbase;
> +
> +    vptbase = FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, PHYADDR) << 16;
> +
> +    if (set_pending_table_bit(cs, vptbase, irq, level)) {
> +        if (level) {
> +            /* Check whether this vLPI is now the best */
> +            ctbase = cs->gicr_vpropbaser & R_GICR_VPROPBASER_PHYADDR_MASK;
> +            update_for_one_lpi(cs, irq, ctbase, true, &cs->hppvlpi);
> +            gicv3_cpuif_virt_irq_fiq_update(cs);
> +        } else {
> +            /* Only need to recalculate if this was previously the best vLPI */
> +            if (irq == cs->hppvlpi.irq) {
> +                gicv3_redist_update_vlpi(cs);
> +            }
> +        }
> +    }

I'll note that looks a lot like the previous patch, modulo "resident".
Perhaps this could be better factored?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

