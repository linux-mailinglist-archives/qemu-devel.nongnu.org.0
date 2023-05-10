Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB826FD827
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:29:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweFI-00078w-TM; Wed, 10 May 2023 03:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweFH-00078j-2k
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:28:19 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweFF-0005E5-C6
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:28:18 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f315712406so234735075e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683703696; x=1686295696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8yh2+Mh4ZGz56gjttMaknwKBgjFb6g2g4dyQhKXa86A=;
 b=V5SSYe9Q0qEDvGOnNkdRVamSzAWiRx51ylAw3yMw8lFTLCRFkRieMYb8WC9RmZtIKJ
 nUt8yu5zBxWLT34hzi18wyOJfviZVJ+Uw4J57YxPZ2rI5tinBhPm3O2g4wakPPTCbAG4
 fBUQ8NwHDgvPk7/rw0g5Ax+6UQ0A0EQ+xHCw2kkhZ8uaIu2VUf6GeewFkejRkOZRAZVB
 c/XxBoGK0Y2cvnT4cc3DL8q9ruOkSRgNg+21AwjtfnkxZGjWjye/W4LWB3Gjf7HQ7N4U
 Me8ypLcFAZdsqg3mDhPKEUKHL6ktt4mReTIlXx9dUnT9ow0/R6P7xBpOBSNOnnP4NudH
 YZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683703696; x=1686295696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8yh2+Mh4ZGz56gjttMaknwKBgjFb6g2g4dyQhKXa86A=;
 b=doNafLmww97JIUuGGx90WYolQqYINfI9KESABuM4jGbpGOYeV/NJT++2m6AolRb2uP
 dtJoqgZc5o7atlXzeChBkHx87lwBMJ9Y49ACInT+XlLijP/MyoToervrcOxcDYuu2WlK
 FIwyBHwQLBy+q2icyMkoVz4likjfY0K4VBvkmnYZ6avjgiQDz+MsRcShzaRiWQBAQYv0
 1zPqV8H+PSoJ5NbivBUr+oROx9ibXOnMOO+o5cSDVAy5TiGZShJ6xyoMFr8jAFbhulMV
 YDWDrHixlADL/MHS95EQN60/wboMJJNpshPUqIhJ3y27pH+ZyG0QZB6nyNTnKtYdJgVq
 BkAQ==
X-Gm-Message-State: AC+VfDwloli7q+q7hRPr2Zs27QrRvy8y4phpuOdCM86y+KpAR8R68xBO
 c+9Byoh1yWAfDFg81q+1dObtCw==
X-Google-Smtp-Source: ACHHUZ4aHfyDWEeTqci5aKMjNUSKaw+WoU6TdITeRRIpm0nRTnKLhBGQ+q3GRrtkb1FPFtblzecc6Q==
X-Received: by 2002:a05:600c:21cf:b0:3f4:2aeb:30d with SMTP id
 x15-20020a05600c21cf00b003f42aeb030dmr3142529wmj.4.1683703695806; 
 Wed, 10 May 2023 00:28:15 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a1c7217000000b003f4ad703aecsm680806wmc.15.2023.05.10.00.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:28:15 -0700 (PDT)
Message-ID: <0e93b4db-7373-e684-c937-1fcf723f809e@linaro.org>
Date: Wed, 10 May 2023 09:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2] target/ppc: Fix fallback to MFSS for MFFS*
 instructions on pre 3.0 ISAs
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230506065240.3177798-1-richard.purdie@linuxfoundation.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230506065240.3177798-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/5/23 08:52, Richard Purdie wrote:
> The following commits changed the code such that the fallback to MFSS for MFFSCRN,
> MFFSCRNI, MFFSCE and MFFSL on pre 3.0 ISAs was removed and became an illegal instruction:
> 
>    bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
>    394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
>    3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree
> 
> The hardware will handle them as a MFFS instruction as the code did previously.
> This means applications that were segfaulting under qemu when encountering these
> instructions which is used in glibc libm functions for example.
> 
> The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also missing.
> 
> This patch restores the fallback to MFSS for these instructions on pre 3.0s ISAs
> as the hardware decoder would, fixing the segfaulting libm code. It and also ensures
> the MFSS instruction is used for currently reserved bits to handle other potential
> ISA additions more correctly.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   target/ppc/insn32.decode           | 19 ++++++++++++-------
>   target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++------
>   2 files changed, 36 insertions(+), 13 deletions(-)
> 
> v2 - switch to use decodetree pattern groups per feedback
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index f8f589e9fd..3c4e2c2fc2 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -390,13 +390,18 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
>   
>   ### Move To/From FPSCR
>   
> -MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
> -MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
> -MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
> -MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
> -MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
> -MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
> -MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
> +{
> +  # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should be ignored
> +  [
> +    MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
> +    MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
> +    MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
> +    MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
> +    MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
> +    MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
> +  ]
> +  MFFS            111111 ..... ----- ----- 1001000111 .   @X_t_rc
> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Fixes: bf8adfd88b ("target/ppc: Move mffscrn[i] to decodetree")
Fixes: 394c2e2fda ("target/ppc: Move mffsce to decodetree")
Fixes: 3e5bce70ef ("target/ppc: Move mffsl to decodetree")


