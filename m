Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E84D9113
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 01:14:51 +0100 (CET)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTupt-0001WK-M3
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 20:14:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTuoL-0000f2-Dk
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 20:13:13 -0400
Received: from [2607:f8b0:4864:20::62d] (port=39878
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTuoJ-000835-CQ
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 20:13:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 9so14891333pll.6
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 17:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MVG/13FOYM41PEC2D5XQ1Nr3dCGqvgy1Mys6BAnjlxE=;
 b=TIN8NhsNe65UB3Rcjq5Xi63+O+GqBt85NldCWvqdbBjRq4bfx8aqZj+j2cxfVOxgYE
 v8V4JZY9zmPpyZo9GH3iK7gcMYq3RHjM+9poj9TLm3usXX1v6DhMJRpA50yKgyjzytoO
 SrKfosx3uoDgFotMMSIsTJp7PlcOxt91oGp5UHwGKOiOcKJPrRiBz9QDx+0gZDSxEFQG
 d5mmItpnWqxdevom7OkQUcS17P0O8hWls3pN1sVqiziXeVBThhyrnJ/3VpjU/WqINMT1
 4V6T7kiAOiyZVelIwe7wuEJPTV66jHNPE3t1FRylJY9HpSWDOllv+SuuqJ9WfjfSoJ1y
 fMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MVG/13FOYM41PEC2D5XQ1Nr3dCGqvgy1Mys6BAnjlxE=;
 b=Kdc6KulSUJMRHQ4SiOAknUvP5SSS2Wid39TJrUszTVR96mwH8l8r9Uz5vr1SfqDesS
 eNS/AAeFjIC0Ivkk8XB6UsKsvbXCH4KwhzsazVGlFA+AD5S7gCnb0nJMsjmw8R+ubkjO
 PsrWY3VC1AC/RF65TSqUAEH6u4N44xt+/SHTvnmxZL16RPPbqLeG4I0nqSwdscFeRTUi
 vlF0P4D59xhAvXlijEPwXpiUsE7xTLf2nsJ8oUcdyHsyTKqmGFarfGqnylBuvrUT9cQu
 /5bIwQXL7wJQ4DHZWeImPIPqZuxf7Cv9zzDOlBn2jPf2IWYtqMDIBcp/vMebfuGQnQAv
 +60Q==
X-Gm-Message-State: AOAM531bt9L5rhEXP6hxvl4LgALen0H9AMSFy9cLLg8Gko42wIoGl552
 kmD2ys7jJPUGLLCV6yGPSNl76w==
X-Google-Smtp-Source: ABdhPJxMyJF0yo5VpYX4fg48RSRDICdyfqBaMKbmpuy6MjPU1UTlX0kv4HRI/sr65Qh0VE9I4zkh9A==
X-Received: by 2002:a17:902:7c94:b0:14d:77d2:a72e with SMTP id
 y20-20020a1709027c9400b0014d77d2a72emr26189130pll.153.1647303189669; 
 Mon, 14 Mar 2022 17:13:09 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a639511000000b0038108d69e8fsm11700671pgd.53.2022.03.14.17.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 17:13:09 -0700 (PDT)
Message-ID: <b6b966c3-dd49-74aa-e9be-7da716d28a3b@linaro.org>
Date: Mon, 14 Mar 2022 17:13:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] ppc64: Avoid pt_regs struct definition
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
References: <20220314215138.1355256-1-raj.khem@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220314215138.1355256-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/22 14:51, Khem Raj wrote:
> +static inline uintptr_t host_signal_pc(host_sigcontext *uc)
> +{
> +    return uc->uc_mcontext.gp_regs[32];
> +}
> +
> +static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.gp_regs[32] = pc;
> +}
> +
> +static inline void *host_signal_mask(host_sigcontext *uc)
> +{
> +    return &uc->uc_sigmask;
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
> +{
> +    return uc->uc_mcontext.gp_regs[40] != 0x400
> +        && (uc->uc_mcontext.gp_regs[42] & 0x02000000);
> +}

Oh, dear.

I didn't realize that the symbolic constants are also in <asm/ptrace.h>. We really don't 
want magic numbers.  We'll have to have the include and use PT_NIP, PT_TRAP, PT_DSISR.


r~

