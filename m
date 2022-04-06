Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC3C4F60B5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 16:00:38 +0200 (CEST)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc6D7-000096-7x
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 10:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Ao-0006ix-2t
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:58:14 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:35481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Am-00053m-LI
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:58:13 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 d15-20020a9d72cf000000b005cda54187c3so1769105otk.2
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kR+sb7Bzfk81CyMsarmweyEXaK52EOlbciCPmWsKVtA=;
 b=yEPmn4HKT6+AJItC1BrCDf3T1++tqJeyH1PdajkjfpaYSUOcee+Y271FemlxTxJMQw
 NqJqfcugGpwCKi4/CHBUahYum9HhF3Z/9z2Xs7FYKolixeUl/ST/2A9ZylH7CgaFIolo
 sUEAqmmz7WLesvGT+bIrpaxDjXt/KssR/foViCPhOi8rfjAtnrEH5Av6MRxvOz3osZ85
 IcEpvYY2SrapH4dyPYBMc9F69gJL9Llu55ek4rwPOSG7XtESeeCjLpMFXM4LYc1l1kfD
 suO3mr7eQMcTzCJhrPlmFBDhAtsmFkI0wtVayeZ1v8K6Q8nnBqI4rnRawWWcikcTiRQh
 VkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kR+sb7Bzfk81CyMsarmweyEXaK52EOlbciCPmWsKVtA=;
 b=AqpaSNRWNIGs4SeM6VAtKKYh470nFRf9HYGQkdfqe0IpGEj7PymPAoL/IhoXdO1pTd
 KEK0DibSK8srWQ6SmAcEBpxUQy3cA+RGBgFq2Pkooze7fKNTCgHHrwTvJyozhiF4HjjS
 veWuqTkswOZuFydooJa0cZXSxCL10qt4gbHhcunDYQNyV6r+Ck5cYKUOOLk9brjIN0vr
 Yrc0CD79mtjwDXgWlqfoQlvEusAVaK/PdoP7OrQ+9gc/wxTRN77G+SqqTjE2yxzY+6cW
 aFSNlaBs0Tk9RLmZZUHcK7HWfBf+Sg1O0y+zC8Ua42vzEEUGobLSS4kmQ1rAB4E66p9p
 7Mhw==
X-Gm-Message-State: AOAM531MoCMbS7+QMLhL6s/EOuSZsKjERNMrmB31C97w+WKQhP420myA
 0APqaOgMxOLgcYZFe2VaO6P0vw==
X-Google-Smtp-Source: ABdhPJwxS8UScrCkjPQAhEZKwh0gKu3YUVaDJUaYDee/jPdq5oOUtWN00WkVrVaMl0Sy+rg9Lv043A==
X-Received: by 2002:a9d:4702:0:b0:5cd:481a:148a with SMTP id
 a2-20020a9d4702000000b005cd481a148amr3079780otf.200.1649253491390; 
 Wed, 06 Apr 2022 06:58:11 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 123-20020a4a0181000000b00324a1217e96sm6236959oor.35.2022.04.06.06.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:58:09 -0700 (PDT)
Message-ID: <cf3668fe-f5ab-716c-0df9-3cc3507e9245@linaro.org>
Date: Wed, 6 Apr 2022 08:58:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 14/18] hw/arm/exynos4210: Connect MCT_G0 and
 MCT_G1 to both combiners
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:46, Peter Maydell wrote:
> Currently for the interrupts MCT_G0 and MCT_G1 which are
> the only ones in the input range of the external combiner
> and which are also wired to the external GIC, we connect
> them only to the internal combiner and the external GIC.
> This seems likely to be a bug, as all other interrupts
> which are in the input range of both combiners are
> connected to both combiners. (The fact that the code in
> exynos4210_combiner_get_gpioin() is also trying to wire
> up these inputs on both combiners also suggests this.)
> 
> Wire these interrupts up to both combiners, like the rest.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/exynos4210.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

