Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A594C0126
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 19:22:20 +0100 (CET)
Received: from localhost ([::1]:40182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZnl-0005iy-6s
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 13:22:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMZlN-0003z6-Jm
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:19:49 -0500
Received: from [2607:f8b0:4864:20::634] (port=36735
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMZlL-0003LH-V6
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:19:49 -0500
Received: by mail-pl1-x634.google.com with SMTP id u5so16367848ple.3
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 10:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rYF7WfyU6OAFKardTA4nmAm46+cnQQObR7krKm/z5xY=;
 b=d1FGY36HtudcZpEQVCIttXLIz+/0u/wSPIZqCuFI+5ZyZRe9AncRH9wsoK34bhjQwK
 QojTfYFxw/0tFZmWj2zP7699MlXnqGTcFrQnwuiP+z+VHeDYkazrHIIQn90SZrHpZtr7
 p5W0sqtg5NbqWYJje5SqEGZcFaPo1++u/v81f98uN2I4mXaO9S91tdCTubzanioMgm0c
 hG/U6Uy8+vveK9BPTfP8pO2tTAiG+9QBMnpzf+4ietpzwwmQ9kqxXr4SAQwQsGG+dPVr
 OoOczanRUrlTAiXpwiy/RJxD7tFX0+G8HM86W2bTBaARCYKfhEcvt0cEhGtl+9wAbwff
 In+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rYF7WfyU6OAFKardTA4nmAm46+cnQQObR7krKm/z5xY=;
 b=3IvQ/B485tE3XTdMxolUS3eciKrVzDNxj2XQxENSBj2rhnQW0Ny99fUnuR3KWS1X68
 SuNpeR8XM4iDgLmR1swzkm+hd8QtbIHIjEaHebUWyqBdFFylqUNzs5r3M6RC0VaD/8Ug
 KRnEEeRikP7icInJAie08GCPVwIobapf5iWdCl7R9Xz8T1ZemBlV7Sv5nIycMVHFezRu
 rQ1rgUcCI9OFulDCNzIg84vRcO/FUaD7TJJ22vI03x6sb9d5MmMvmo8fcEwgZdm5zuBx
 2Q7uoAyHtcqu9XZOCnzvl7h4HF7vU0wJBa1a6qyny0bNXH1zykn5D+jXxkG55rygYlBj
 Tefg==
X-Gm-Message-State: AOAM5311bjffE2LJhQaBT6f51/0FGbXqVI1Ug4MzIVq9MbA8IvQlZjV4
 B/8YwCYggQkDLtO0XN+aMPwDdw==
X-Google-Smtp-Source: ABdhPJyOKT/c7Mn2inQKz6Viq/Sm5nXSZqgjze9mWX3iW8mmutgrrVkU92UGDWLTBKmlYhHFWJraIg==
X-Received: by 2002:a17:90b:33cb:b0:1b9:fa5a:1d7d with SMTP id
 lk11-20020a17090b33cb00b001b9fa5a1d7dmr5360642pjb.103.1645553985948; 
 Tue, 22 Feb 2022 10:19:45 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id m19sm17942683pfk.215.2022.02.22.10.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 10:19:45 -0800 (PST)
Message-ID: <1a91eed5-36cc-f90b-108b-44b622d4b596@linaro.org>
Date: Tue, 22 Feb 2022 08:19:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 02/47] target/ppc: moved vector even and odd
 multiplication to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.castro@eldorado.org.br>
> 
> Moved the instructions vmulesb, vmulosb, vmuleub, vmuloub,
> vmulesh, vmulosh, vmuleuh, vmulouh, vmulesw, vmulosw,
> muleuw and vmulouw from legacy to decodetree. Implemented
> the instructions vmulesd, vmulosd, vmuleud, vmuloud.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 | 28 +++++++++-------
>   target/ppc/insn32.decode            | 22 ++++++++++++
>   target/ppc/int_helper.c             | 36 ++++++++++++++------
>   target/ppc/translate/vmx-impl.c.inc | 52 +++++++++++++++++++----------
>   target/ppc/translate/vmx-ops.c.inc  | 15 ++-------
>   tcg/ppc/tcg-target.c.inc            |  6 ++++
>   6 files changed, 107 insertions(+), 52 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +void helper_VMULESD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> +{
> +    muls64(&r->VsrD(1), &r->VsrD(0), a->VsrSD(0), b->VsrSD(0));
> +}
> +void helper_VMULOSD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> +{
> +    muls64(&r->VsrD(1), &r->VsrD(0), a->VsrSD(1), b->VsrSD(1));
> +}
> +void helper_VMULEUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> +{
> +    mulu64(&r->VsrD(1), &r->VsrD(0), a->VsrD(0), b->VsrD(0));
> +}
> +void helper_VMULOUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> +{
> +    mulu64(&r->VsrD(1), &r->VsrD(0), a->VsrD(1), b->VsrD(1));
> +}

Did I mention before that these are trivially implemented inline?


r~

