Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CB952667B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:48:52 +0200 (CEST)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXX8-0004pQ-Sv
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXW4-0003ue-HJ
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:47:44 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXW2-0000Y4-Lf
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:47:44 -0400
Received: by mail-pl1-x630.google.com with SMTP id q18so8306838pln.12
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2BuXh1qRrTpnzjaMrIL/iTjYhvZkAEAAOeFRevvO4vI=;
 b=Zy1oxu++EfiBIOyfTsrcRPOtf9o/GWlQgFvzz8wAY/Ai5flQnxyErZkb5moLOp0s7j
 FJTNJxUkEetofggrOzDId4I38+2uZQDhyLLAhYJOpBRHls5JrwxRf5JBuB4m9gDtdsPD
 PX9GlrCujWXmeP2HrrFZrcrhA9+mJq5NA44thHDAjijIpHvw/iQwn1DMif/8KEZCkW03
 SSUh5eYEAZXtCwbeqkAv/+ALtd02VBx6JtE1ITKk4D8Kpx0mzoywtl+XkLCZAgTpN/CT
 wWrcVz3D1ulFZncxfEx67x0eUC4qBK1ySEj8GZBigrAx/7kUv4sW/ApuLxs+zbCHXE5G
 +XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2BuXh1qRrTpnzjaMrIL/iTjYhvZkAEAAOeFRevvO4vI=;
 b=et9zdZQ1ngx4iH0f4loSSnBWbdck0W3pdnLcSn0qHAM0xaXEgjXxXq6JOltm5ER3Vr
 d3QxWXQ554JxeaweHuo1ZrGdIcnx6qq4ZjM4zHbPNiqyM9Uj4MWHyr4uoejsUoNpX8Ak
 1fIZqh+I1ET40ZpYGhgJEVqpYbFZSqeC5qvxT3wos1zfDXnEwE51LlDD819I4fqfQKXc
 Z5LnnIoc0qNEBWDtOb+4TiGuW02ZmpBDeuovVOted5XS7/Rglnc0nQ1VDfC2pLMPb6HC
 py2Te0UBtSAyv9+B4738OiEdJJqPni9s14t9tGB2Q37fmBPleafPzUHcXqSFlVE2i7Fp
 JNyw==
X-Gm-Message-State: AOAM533TuAj7nAcffnXlMh/CwYx5KrveSUcM7tc8gUQXS37qis4ixxCr
 WHl0ZDzQRw552dnIKk2JWMvDkw==
X-Google-Smtp-Source: ABdhPJwDhUCtLqZaK5IIdzDei3ZE3tbzvFFfZWOmIKSVsXYINa1DcXDA1ZvgaCgT3isc0T6mVPVYfg==
X-Received: by 2002:a17:90a:9483:b0:1dc:5fb2:9b89 with SMTP id
 s3-20020a17090a948300b001dc5fb29b89mr16494483pjo.235.1652456861045; 
 Fri, 13 May 2022 08:47:41 -0700 (PDT)
Received: from ?IPV6:2607:fb90:46a:1099:e682:8d73:3200:dae5?
 ([2607:fb90:46a:1099:e682:8d73:3200:dae5])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170903110d00b0015e8d4eb292sm2026628plh.220.2022.05.13.08.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:47:40 -0700 (PDT)
Message-ID: <51639c5c-9092-c4a2-c215-2cbdf110d347@linaro.org>
Date: Fri, 13 May 2022 08:47:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>,
 Itaru Kitayama <itaru.kitayama@gmail.com>
References: <20220513122852.4063586-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220513122852.4063586-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 5/13/22 05:28, Peter Maydell wrote:
> Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
> means that we don't provide the 6 counters that are required by the
> Arm BSA (Base System Architecture) specification if the CPU supports
> the Virtualization extensions.
> 
> Instead of having a single PMCR_NUM_COUNTERS, make each CPU type
> specify the PMCR reset value (obtained from the appropriate TRM), and
> use the 'N' field of that value to define the number of counters
> provided.
> 
> This means that we now supply 6 counters instead of 4 for:
>   Cortex-A9, Cortex-A15, Cortex-A53, Cortex-A57, Cortex-A72,
>   Cortex-A76, Neoverse-N1, '-cpu max'
> These CPUs remain with 4 counters:
>   Cortex-A7, Cortex-A8
> This CPU goes down from 4 to 3 counters:
>   Cortex-R5
> 
> TODO: A64FX -- I don't know the correct PMCR_EL0 reset value.
> 
> Note that because we now use the PMCR reset value of the specific
> implementation, we no longer set the LC bit out of reset.  This has
> an UNKNOWN value out of reset for all cores with any AArch32 support,
> so guest software should be setting it anyway if it wants it.
> 
> This change was originally landed in commit f7fb73b8cdd3f7 (during
> the 6.0 release cycle) but was then reverted by commit
> 21c2dd77a6aa517 before that release because it did not work with KVM.
> This version fixes that by creating the scratch vCPU in
> kvm_arm_get_host_cpu_features() with the KVM_ARM_VCPU_PMU_V3 feature
> if KVM supports it, and then only asking KVM for the PMCR_EL0 value
> if the vCPU has a PMU.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I'd forgotten that we'd dropped this fix in the 6.0 timeframe
> and never picked it back up again until Alex reminded me of it...
> 
> Changes since original attempt:
>   -- rebased
>   -- fix the code in kvm_arm_get_host_cpu_features() that reads PMCR_EL0
>   -- set PMCR value for new CPUs cortex-a76, neoverse-n1
>   -- set PMCR value for now-separated-out aarch32 -cpu max
>   -- TODO comment for a64fx
> 
> Shuuichirou, Itaru: this is another patch where we need to know
> an A64FX register value...
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

