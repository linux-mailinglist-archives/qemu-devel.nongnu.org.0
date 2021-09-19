Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053DA410CDB
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:24:37 +0200 (CEST)
Received: from localhost ([::1]:47992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1UR-0006Er-TJ
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1Sp-0004lA-5s
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:22:55 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1Sn-0003ve-OZ
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:22:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso10503775wme.0
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V9gG56NXVFTMM8t6T7BVsNjFrNaKpJqHs5jrSioKafU=;
 b=We0660RtH6Vi0ivHjmwdQ0mZuj0HCAoycEfaVTX95f1SoTOJnyN+3009cZQvR3dD2M
 x41VGM/83wOep5c4IauuFG3Lqck9qfToI4EEgbYVOUEuKvfaFhhyLl2jMAJWOmySCw5i
 2i/16dASBTz8exIVhQzuIe1cEyVSngh4hfAwI6ZPbE+nHdK6Bp4QLmtRk7Hppyf4mw89
 uG+vbJaGMHK21NJ92aVqXbMYU9o0/+AqH3COcyuN1DMsAEiRluIHPLZGW99JVuNiwG+e
 6S5SivXTIAKjqRR0ZXP9s2eN/k50fijTeXxQ2NUN5AqsWIXRVerh3+lerWuvikDzqC8d
 9Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V9gG56NXVFTMM8t6T7BVsNjFrNaKpJqHs5jrSioKafU=;
 b=PvWZ3/zYNN6cvbimMbkd4FVwRTJqmFhsGg7t1iPSx713pwgS4jQwM6vaXxMOXKiwrt
 eJReJCmWxRvJCi/LeiH+xPPysE7yalbOyi28mfskr7uJT35eUBZQftcITPrFXpjJvfu3
 iOyRIvPscinTupEm+C97/lXHua3EkWIBKrQvfhNYPiRSxHXmsjLltQQj7JjZGZ7Njtfc
 pl4SMXl58eAvpOEILqwLDxPQxCa+GZ8dLb5VzHTottKbYRNFnvwSbEwpIcPMUSav66gH
 o0HF25PthNoWQnyM2nC9ID4A6As5v6Oy5CthBKZrwqss46L+Vl03cKvcVgwxx52CqT24
 il0Q==
X-Gm-Message-State: AOAM533G0b14M2FjK/z4nADPRGEVrIjlIkQKrAcvyXl7t4rzXFIsYAFf
 UFChDxwrNHtn33dLCyRshsn1C2bvo48=
X-Google-Smtp-Source: ABdhPJw6fYAYB6CU3HwJmwpYNAkJ6pSUc1HV8tlsPYN5jEPvG4Fp6Y8cKiZghZ8eBwTKGppHavlHoA==
X-Received: by 2002:a05:600c:22da:: with SMTP id
 26mr20745897wmg.100.1632075771969; 
 Sun, 19 Sep 2021 11:22:51 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id l15sm16975530wme.42.2021.09.19.11.22.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:22:51 -0700 (PDT)
Message-ID: <95b28dff-7a3c-73fa-2449-c41110e12642@amsat.org>
Date: Sun, 19 Sep 2021 20:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 19/41] hw/core: Add TCGCPUOps.record_sigsegv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 20:45, Richard Henderson wrote:
> Add a new user-only interface for updating cpu state before
> raising a signal.  This will replace tlb_fill for user-only
> and should result in less boilerplate for each guest.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 4a4c4053e3..e229a40772 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -114,6 +114,32 @@ struct TCGCPUOps {
>       */
>      bool (*io_recompile_replay_branch)(CPUState *cpu,
>                                         const TranslationBlock *tb);
> +#else
> +    /**
> +     * record_sigsegv:
> +     * @cpu: cpu context
> +     * @addr: faulting guest address
> +     * @access_type: access was read/write/execute
> +     * @maperr: true for invalid page, false for permission fault
> +     * @ra: host pc for unwinding
> +     *
> +     * We are about to raise SIGSEGV with si_code set for @maperr,
> +     * and si_addr set for @addr.  Record anything further needed
> +     * for the signal ucontext_t.
> +     *
> +     * If the emulated kernel does not provide anything to the signal
> +     * handler with anything besides the user context registers, and
> +     * the siginfo_t, then this hook need do nothing and may be omitted.
> +     * Otherwise, record the data and return; the caller will raise
> +     * the signal, unwind the cpu state, and return to the main loop.
> +     *
> +     * If it is simpler to re-use the sysemu tlb_fill code, @ra is provided
> +     * so that a "normal" cpu exception can be raised.  In this case,
> +     * the signal must be raised by the architecture cpu_loop.
> +     */

Shouldn't it have the QEMU_NORETURN attribute?

> +    void (*record_sigsegv)(CPUState *cpu, vaddr addr,
> +                           MMUAccessType access_type,
> +                           bool maperr, uintptr_t ra);
>  #endif /* CONFIG_SOFTMMU */
>  #endif /* NEED_CPU_H */
>  
> 


