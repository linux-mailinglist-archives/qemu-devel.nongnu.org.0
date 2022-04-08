Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53774FA032
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 01:42:07 +0200 (CEST)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyEw-0003hX-Dm
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 19:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyCb-0002fH-LC
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:39:41 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:46695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyCZ-0007s2-Tw
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:39:41 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 j20-20020a17090ae61400b001ca9553d073so11099242pjy.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 16:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+qksoESPnTj4K0vnUbhto+MvlUyxPcGeT5AtaKBGPO0=;
 b=MBcSuB1f0AmW7CU925w3Yd1KDw8/FWK08fnw3txgIZNzEhRE3+cOc35BrnXHiYEC4g
 rF066D9jdTQ2xAWhpr141PxKavcpJBTCd1qYYoyvQO5IT4uGOJYeX69c/mY3nqfOF4B3
 VPkEWr/5i1BydP5DdumgZxp1ZPWq3AAFd600qQ6T56+1N/QdCdt1/ihEqcG7fsAn/ZKC
 0GlxuUhhC16vKjlmNNVuV4zbYYiFsigO+oNCkwT3FiJ+SMdlCBfVw3dcwwHynP4W8siv
 sDCWxPBNjDU6i+ItEBDVsrBOlLzIveg4oGFznwrl88y4LCY3wUXs7RDrYY6l+pstcn2S
 hjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+qksoESPnTj4K0vnUbhto+MvlUyxPcGeT5AtaKBGPO0=;
 b=JjtbJnm3XmHTpkQZD3jBUGA7A5rY8+y4ZcdOBlLfUTp3cYU6Dj2ySk/E12qiCV3EAI
 raGBXE+cT9crOZt5svXNfP0EZ6Kkzj2nukjzbWMWcS26/3DpIJr5R4gh73otVN0gHDkp
 TBTOXNbMhSJRkh9vo8FY3RIbBBdc2wFiwhNE88AyI+chWOmRm3twEz6WP1WFSayH/0qL
 O3fGFZS7YKpAh7f+l7A5S8N2fNmY65YSDRqQYKLDpkaeXxTPXwkY2j4GDQH+oyXwIPOI
 LAgcC4FTkpHxR0kS1rkXsHaUU5STdM+ibKDHrLBbDr6isjuYFoOIUzMhUVBywtRJroxq
 upfw==
X-Gm-Message-State: AOAM530mJAdqfoiGObhY/eRLawEA8zpfFA7PsKd9TnGN5IU+41Pk5q4P
 gitM9HvZFpeud4agkrzl4wA7sQ==
X-Google-Smtp-Source: ABdhPJx5uLMRZ8tRyxGOtw0z4bs3bToj1b/tHyFp9Yaw/oPnmfn3uUIm7gp+dUVHOz8ByHmtwugtJA==
X-Received: by 2002:a17:902:7c90:b0:156:255:c571 with SMTP id
 y16-20020a1709027c9000b001560255c571mr21512509pll.15.1649461178010; 
 Fri, 08 Apr 2022 16:39:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a17090acd0500b001b9c05b075dsm12967803pju.44.2022.04.08.16.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:39:37 -0700 (PDT)
Message-ID: <44ba8f25-1e3e-b41e-c83a-1f2c20655232@linaro.org>
Date: Fri, 8 Apr 2022 16:39:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 05/41] target/arm/cpu.c: ignore VIRQ and VFIQ if no EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
> In a GICv3, it is impossible for the GIC to deliver a VIRQ or VFIQ to
> the CPU unless the CPU has EL2, because VIRQ and VFIQ are only
> configurable via EL2-only system registers.  Moreover, in our
> implementation we were only calculating and updating the state of the
> VIRQ and VFIQ lines in gicv3_cpuif_virt_irq_fiq_update() when those
> EL2 system registers changed.  We were therefore able to assert in
> arm_cpu_set_irq() that we didn't see a VIRQ or VFIQ line update if
> EL2 wasn't present.
> 
> This assumption no longer holds with GICv4:
>   * even if the CPU does not have EL2 the guest is able to cause the
>     GIC to deliver a virtual LPI by programming the ITS (which is a
>     silly thing for it to do, but possible)
>   * because we now need to recalculate the state of the VIRQ and VFIQ
>     lines in more cases than just "some EL2 GIC sysreg was written",
>     we will see calls to arm_cpu_set_irq() for "VIRQ is 0, VFIQ is 0"
>     even if the guest is not using the virtual LPI parts of the ITS
> 
> Remove the assertions, and instead simply ignore the state of the
> VIRQ and VFIQ lines if the CPU does not have EL2.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

