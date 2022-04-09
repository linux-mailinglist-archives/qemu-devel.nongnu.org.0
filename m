Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045594FAA28
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:31:28 +0200 (CEST)
Received: from localhost ([::1]:57946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFrr-0002JB-07
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFoh-0000PR-4R
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:28:12 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFoS-0001ZC-3Y
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:27:57 -0400
Received: by mail-pg1-x534.google.com with SMTP id s21so6083823pgv.13
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wUlkeDhv7NXit+7GP4IeBt4N9K5HfgvZj8A7hWj5d4E=;
 b=UJgQH3oHbpqzFgq8lhQxCxBF2/nS1CmsQsdLB4sMRXb5g7EAsa1Osf78H8DoxZpa3s
 WHVsInvzBXlfiHuDdMXX6k/w708mu9nCjFvf/oeFq9FDrTJy+CffJ42pT8OhYICbIPof
 xiJDDi4EI9SVIVn8EBYZV/lIfaewJkvfVnby4ZVEItnqs151F6R4tQrxzMQMs9/B/BcU
 oYnGx1HUUpqq6xdnrAk6/f+fSKJBuORTZk/cpOmAHH45mFhJ4QMagzRqlvGLKEQ90cfy
 ySZJLGTjeEDz9w1M6VzKayXIupBFvIvR+WCr1wDM+DSx2ogx8Cu8HMDXwjorZ3uhL2JO
 uGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wUlkeDhv7NXit+7GP4IeBt4N9K5HfgvZj8A7hWj5d4E=;
 b=rMIeoeA+Ds1N1wvXPNAOkxPb/HJAdW2mtkd1V4XzONNn0rTgvPWxR73SSqICP9QVKT
 aWraMhh0LiZEWc85mWyd75b2NTRu2n6GHyCpxrlzy98xj51khlaTFZpZhVCub8oyO5u2
 THie07QD4/g+Pt1q0HDFOcNwdrU6VGPtIx/ahDCwr76RYaaIVxbp6bQ1HOcg8nU+S1WZ
 St8eWon8Z7ngOopes6OC1Zhr0abdomLnvTuHWexZKljVIK7pRyu1SMwqCRurGu2VNkh/
 3JIQ2U02LPqFeKULRVIDKuTRSUylgImPLJc1tAalyGqfQDQoNzTq+kAt18RZdcx0ArUk
 KX7w==
X-Gm-Message-State: AOAM533hZ4yoSn1rnWCHJ+oLqDnRfHd05EHYAb/cCwu3k2krc58iGbLe
 ju9lLyCJpd1e1jbFhcYbd1c9RpHueGWO5A==
X-Google-Smtp-Source: ABdhPJz+HVpTXrl15iuenN+djGdFfKRBc+ufHHfAkCusTzJ4I16q759/MR4FzRFLC5A9cQUaJX9Quw==
X-Received: by 2002:a65:47c1:0:b0:39c:c448:2712 with SMTP id
 f1-20020a6547c1000000b0039cc4482712mr12270293pgs.6.1649528874262; 
 Sat, 09 Apr 2022 11:27:54 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa7820e000000b004f7134a70cdsm28707191pfi.61.2022.04.09.11.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:27:53 -0700 (PDT)
Message-ID: <2306c281-ac26-683e-e697-e50b1e121b86@linaro.org>
Date: Sat, 9 Apr 2022 11:27:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 20/41] hw/intc/arm_gicv3_its: Implement VMOVI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the GICv4 VMOVI command, which moves the pending state
> of a virtual interrupt from one redistributor to another. As with
> MOVI, we handle the "parse and validate command arguments and
> table lookups" part in the ITS source file, and pass the final
> results to a function in the redistributor which will do the
> actual operation. As with the "make a VLPI pending" change,
> for the moment we leave that redistributor function as a stub,
> to be implemented in a later commit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 23 +++++++++++
>   hw/intc/arm_gicv3_its.c    | 82 ++++++++++++++++++++++++++++++++++++++
>   hw/intc/arm_gicv3_redist.c | 10 +++++
>   hw/intc/trace-events       |  1 +
>   4 files changed, 116 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

