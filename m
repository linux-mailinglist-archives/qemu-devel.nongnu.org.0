Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D729328A60
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 19:18:16 +0100 (CET)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGn7X-0000BW-HU
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 13:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGn5t-0008A4-FV
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:16:33 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGn5m-0001rm-8S
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:16:32 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 d13-20020a17090abf8db02900c0590648b1so2709424pjs.1
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 10:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7HCC2X4We49zVg/UCwZ6bpG6mzz9BGb2xfteFCdWDnE=;
 b=T7/bGYCHUN5/q4R0Kb1eAM9XkrLHA4EQfxaFIVTMsxiqRA3vjaXz4XYQl1DbENtfqU
 4bVIVpKEjqymp7336Hh93raJwKHbUB2fpf7CGO3/QgdPJkWeyIFts+6Pd+BTgL2CAEiS
 NPliqJ/0HbCnANNb4+XOn9+BiePpT3PtrOUuuiVSNtaBOTPRqr9lmygTjUXnhyZaMISv
 N/4OzukIUHOne5PVlJUuMn7ogwNYdMjCGnLDDosdd+nLIo9M+VK+x4jFRJoS/aFSIRvR
 HKp56QGTSPqwh7/LrtZQajiUhJH2sPN6T2apSYc5SEQ39NUUm5o3Q31rrrB5WRZ4oWti
 AoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7HCC2X4We49zVg/UCwZ6bpG6mzz9BGb2xfteFCdWDnE=;
 b=QH2QS70TiBzZWMqld4WKH32fv6SWO+DOlRX8SdCt8m4fNxCZ2EQcZM40ACYj+mR6Q4
 f+JMFyDn4RxF7Vusey3uFr1iqNa7WLNihGfDwhq9H1Yiuk9BMRXZgxnHHi7iwI/O5m9t
 2JRBEHU/ylgP7yHFd/SMkwx4kuAm+hmkAP+EGbyqp3+zJ2yxHIwAvrvRb0SrWvUS2NvT
 dy8W1AWvvrIEUbEdwLkhoB5Tb3H9fGkHx3DqhUcTAmV9Q56iNxSmzsRYsoBDSQiU3PuS
 7e0RJWlpsgR1/jHUwt1Yq2fpjleBt7MgIKXtoUy7BVgGn4LYxNpan5kw6a+llQ1MlIJc
 Xw9Q==
X-Gm-Message-State: AOAM533hcgGC9nh3bH+x8F3yubJm0fC61JIOI8rwEr6qtrTv8sIWPaPd
 dI9l10UK6ohJNFq1jfpdJCan8nnStXgSMA==
X-Google-Smtp-Source: ABdhPJwue7lh48wwglzkDRRRisAqtltH8YPjgKqhcs8nh6ufJpmhwB/MNvTwgmXnSAjLyvCOV1HTnA==
X-Received: by 2002:a17:902:904b:b029:e5:5cc5:877d with SMTP id
 w11-20020a170902904bb02900e55cc5877dmr1359144plz.50.1614622584429; 
 Mon, 01 Mar 2021 10:16:24 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o9sm16843913pfh.47.2021.03.01.10.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 10:16:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC v2 04/24] target/arm: move psci.c into tcg/sysemu/
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-5-cfontana@suse.de>
Message-ID: <3f51339c-27e6-ccdf-f470-5a987254df0e@linaro.org>
Date: Mon, 1 Mar 2021 10:16:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-5-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 05cebc8597..e18d475572 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -292,21 +292,15 @@ vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
>   /* Callback function for when a watchpoint or breakpoint triggers. */
>   void arm_debug_excp_handler(CPUState *cs);
>   
> -#if defined(CONFIG_USER_ONLY) || !defined(CONFIG_TCG)
> -static inline bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
> -{
> -    return false;
> -}
> -static inline void arm_handle_psci_call(ARMCPU *cpu)
> -{
> -    g_assert_not_reached();
> -}
> -#else

I don't see that removing this ifdef...

> @@ -10040,11 +10040,13 @@ void arm_cpu_do_interrupt(CPUState *cs)
>                         env->exception.syndrome);
>       }
>   
> +#ifndef CONFIG_USER_ONLY
>       if (arm_is_psci_call(cpu, cs->exception_index)) {
>           arm_handle_psci_call(cpu);
>           qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
>           return;
>       }
> +#endif /* CONFIG_USER_ONLY */

... is an improvement on adding this one.  Just leave the static inline stub 
alone.  At some point you move the do_interrupt pieces, and the stubs can be 
removed completely, perhaps?


r~

