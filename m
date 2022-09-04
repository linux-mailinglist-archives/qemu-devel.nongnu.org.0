Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE75AC1E8
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 02:51:44 +0200 (CEST)
Received: from localhost ([::1]:56782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUdrS-0000SC-Tq
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 20:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oUdnt-0005rV-8I
 for qemu-devel@nongnu.org; Sat, 03 Sep 2022 20:48:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oUdnr-0000KV-Gt
 for qemu-devel@nongnu.org; Sat, 03 Sep 2022 20:48:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id bp20so6433095wrb.9
 for <qemu-devel@nongnu.org>; Sat, 03 Sep 2022 17:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gYkMN/MnlbJ+Xjxx57cfPyFl/rxATMfkGauySCOG1e0=;
 b=phhrKtZr98Pic2Itu3RgoHdZTODiZIoh7qXm0UEYhoJKM/gtXZuGTC2+YCKoxIggQZ
 oB5DWcSrdCDCvEoWnszo6L1ZkOgWFeqHw4X1mJMOHziSXqAeEWrr30SQbHM1nrhWnKqo
 81g3A6BJuLxLY/4RG4GfDQLB9yqkrXcJwYfSvVfoEw/Cmw4JwyWifm86UKm/VVr+wcVh
 cZ6BUxRfZHxGPA74OJjxPACStIosJInyjTFCGcrGaLP5P4X0PT0+5No3+m24rrQ+g9IW
 G9MK0dOO+4tBb5w+2kilHcaVta1SMn4pjISSa6BTKzm65vIdBxWdKm082t4OtxbR2ivI
 7fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gYkMN/MnlbJ+Xjxx57cfPyFl/rxATMfkGauySCOG1e0=;
 b=WWiBMRUeKAsfkhI36OuWdRHJkR8zq0Th/+bHNx6MSugX/lRuZyuRrAtpQpjqLtG5RS
 gQcJm3UISsgROVzJBWg2fZFC8/TmwWseSc/09k45ZhC5YKTTwBWX2qzbTT3lr+XEtvQH
 ISHew/whMzzWtfFn2ByJCHDc3v6gDRid24fF9b0EguaizBstBOqTMMOIvutC86/Ljhmc
 sbesdmhOxo+pC/dT7M6/TlRon1r7e7lAaJqvc1WFT82ELUWax98ItPt9CiPZ6PwLyD6Z
 +xbwRqh3NvCyWrxPVVJvgAc38h65UdcW2JWe8odnJwJncl4zgfdtOFY4Pcnl4IBuHC11
 CWcw==
X-Gm-Message-State: ACgBeo1TIq1n7PjDoiO2D0bDZN/h9yf/mgj6fgzP96qkAKbD5Hi3XTBA
 Irstg3x/+q/QMSq++UPDAXJk2w==
X-Google-Smtp-Source: AA6agR4S8Lr5S6TpuxHJo34yaZQ2ZGoOdMakLb7ZAk0D4YUHEVi27yLgDGugo31AEyz/9h0raZbDgg==
X-Received: by 2002:a05:6000:696:b0:226:f89d:55b2 with SMTP id
 bo22-20020a056000069600b00226f89d55b2mr7712706wrb.133.1662252477184; 
 Sat, 03 Sep 2022 17:47:57 -0700 (PDT)
Received: from [192.168.10.136] ([78.19.130.69])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d522b000000b00226d473ebd6sm4840238wra.86.2022.09.03.17.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Sep 2022 17:47:56 -0700 (PDT)
Message-ID: <fc947302-23b4-7fd2-99d1-67793ee45070@linaro.org>
Date: Sun, 4 Sep 2022 01:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] RISC-V: Add support for Ztso
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, qemu-devel@nongnu.org
References: <20220902034412.8918-1-palmer@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220902034412.8918-1-palmer@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/22 04:44, Palmer Dabbelt wrote:
> -#define TCG_GUEST_DEFAULT_MO 0
> +/*
> + * RISC-V has two memory models: TSO is a bit weaker than Intel (MMIO and
> + * fetch), and WMO is approximately equivilant to Arm MCA.  Rather than
> + * enforcing orderings on most accesses, just default to the target memory
> + * order.
> + */
> +#ifdef TCG_TARGET_SUPPORTS_MCTCG_RVTSO
> +# define TCG_GUEST_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
> +#else
> +# define TCG_GUEST_DEFAULT_MO (0)
> +#endif

TCG_GUEST_DEFAULT_MO should be allowed to be variable.  Since I've not tried that, it may 
not work, but making sure that it does would be the first thing to do.

> --- a/tcg/i386/tcg-target.h
> +++ b/tcg/i386/tcg-target.h
> @@ -236,6 +236,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>  #include "tcg/tcg-mo.h"
>  
>  #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
> +#define TCG_TARGET_SUPPORTS_MCTCG_RVTSO 1

Um, no.  There's no need for this hackery...

> +#ifdef TCG_TARGET_SUPPORTS_MCTCG_RVTSO
> +    /*
> +     * We only support Ztso on targets that themselves are already TSO, which
> +     * means there's no way to provide just RVWMO on those targets.  Instead
> +     * just default to telling the guest that Ztso is enabled.:
> +     */
> +    DEFINE_PROP_BOOL("ztso", RISCVCPU, cfg.ext_ztso, true),
> +#endif

... you can just as well define the property at runtime, with a runtime check on 
TCG_TARGET_DEFAULT_MO.

Though, honestly, I've had patches to add the required barriers sitting around for the 
last few releases, to better support things like x86 on aarch64.  I should just finish 
that up.


r~

