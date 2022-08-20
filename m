Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ACD59AF2F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 19:35:35 +0200 (CEST)
Received: from localhost ([::1]:54496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPSNi-0000jA-9N
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 13:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPSLv-0007X1-FT
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 13:33:43 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPSLt-0003hJ-Qx
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 13:33:43 -0400
Received: by mail-pl1-x633.google.com with SMTP id x23so6585100pll.7
 for <qemu-devel@nongnu.org>; Sat, 20 Aug 2022 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kmvdbYYamAsV1AMc7z8OVkGEKo9ut99qosO5veM/fi0=;
 b=saXwsJ3Pm40FxQa/+97+45lAMiiFLG2hKwkdzdWX9/BMDs/L2ILUrETvXHVCmiG43m
 or55CldV66mmYcypm50IjAaHL9PKDucIK6zv7QrEjr5A9PaXXIzTl7DPc9h1zqTP4tUP
 W+SlUN7x9IQPR1hM8wcNcN335oexudSYi/hhUK+w9khEnx8PaX/brjh6G47k5+DvWEdp
 7f3Dk57RHg3pie4P5Ncsh/DoMXZiJFIXXQvF8xqAWeYHwNEsp6vQKnWSKxEfXZ+Iv1x0
 +zhS9rq1oa/+/W38Y/FgTHNZrF7BsPEzyIxLDhWKzGuanr5BJZMj5FzaXF+oAdm2RR1n
 JU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kmvdbYYamAsV1AMc7z8OVkGEKo9ut99qosO5veM/fi0=;
 b=jmiW4VysH6BP5yI1JJCSLQ/1Br0glN8HxSDFrrhAHOwyB0JmwxRTsDrS+vELyIG1aP
 Xu7ootcpWKfwatGVJxe79PeD9UX1dxQuje3NqRDqHQ8MtS4E4O4+5Tyx4LrVe59+dRfu
 E3ln6Cu5PtnP+dpewbcu9e+Ru9qup8M+I+dBdZEbzfUiLOxT4ENlcsV8kQIFvlx6SWee
 UIo2q14R2jLDZHa2wWYPCzFZ1SNLh9nugWfh8XwQGPawJdY3pA8IWAUwYuqWpMIPCsV/
 Yqu51sFAt7vdQrmy4fAOD6n8UhA6OhyDjZDZFV0rrFHRtnl66/80q444i7xKexbHm+LJ
 ZIcg==
X-Gm-Message-State: ACgBeo0uOxIcg8sK+dM01RtQebK73XnKzVm4bzNATYfiS+DSVHXHaFO7
 4Fu/Dtt0NBo6tb4O05mIIibzjQ==
X-Google-Smtp-Source: AA6agR72Xk4q0r9kR2ghPJU54mFXddMlT0NM5kjDtIXw0WDofDmmOlx977NUHH5M8wepJnogGzyh/w==
X-Received: by 2002:a17:90b:4b46:b0:1fa:f4a7:73d5 with SMTP id
 mi6-20020a17090b4b4600b001faf4a773d5mr6761523pjb.108.1661016819939; 
 Sat, 20 Aug 2022 10:33:39 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:142b:b2fd:5c12:7cf3?
 ([2602:47:d49d:ec01:142b:b2fd:5c12:7cf3])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a635550000000b004299489dd2bsm4599925pgm.8.2022.08.20.10.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Aug 2022 10:33:39 -0700 (PDT)
Message-ID: <949fb9c0-8e7f-d0bd-dbfa-e76067b867d8@linaro.org>
Date: Sat, 20 Aug 2022 10:33:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/10] target/arm: Implement FEAT_PMUv3p5 cycle counter
 disable bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/22 10:16, Peter Maydell wrote:
> FEAT_PMUv3p5 introduces new bits MDCR_EL2.HCCD and MDCR_EL3.SCCD,
> which disable the cycle counter from counting at EL2 and EL3.
> Add the code to support these bits.

While HCCD is v3p5, it seems MCCD (typo above) is v3p7.

> +    if (counter == 31) {
> +        /*
> +         * The cycle counter defaults to running. PMCR.DP says "disable
> +         * the cycle counter when event counting is prohibited".
> +         * Some MDCR bits disable the cycle counter specifically.
> +         */
> +        prohibited = prohibited && env->cp15.c9_pmcr & PMCRDP;
> +        if (cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
> +            if (el == 3) {
> +                prohibited = prohibited || (env->cp15.mdcr_el3 & MDCR_MCCD);
> +            } else if (el == 2) {
> +                prohibited = prohibited || (mdcr_el2 & MDCR_HCCD);
> +            }

But modulo the feature test, the behaviour looks right.


r~

