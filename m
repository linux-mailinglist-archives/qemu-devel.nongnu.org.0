Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7905504843
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 18:08:02 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng7RR-0002dk-Ev
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 12:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng7LD-0004i4-Pi
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:01:35 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng7LB-0005TC-9J
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:01:35 -0400
Received: by mail-pl1-x630.google.com with SMTP id d15so10618473pll.10
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WqGoOwDRe2ez6Pe+QjG3aZDbNKNB7ISuaZKkBAzaNs0=;
 b=JID5aMFIvk1qh5hFyGVR6GmnXTug6QvZyVo7uc/54VzQYT+HwfPRMg7Fwm6uYfi1/Y
 FBUH4/uWxL2DNTN2K1IcumsI15kEBz7zvPPT+Pfmv+ezwjtHIS2H1vNBFq7HQFmppuK5
 S/7BCk69uPKgiGcMVe4q8qqQdoSAlMoW/WqcBqn1kUVR3Nh5iR02V/8gbeJitG8IZsuE
 TBzS/fuUwthsX06MPmqsKB/wxb5Xf5Kvr9bG31upko9Wmkh2HEnAjq+6jJYIsTPuGCl6
 73ouulFXvlvB4XQq6ejV9DgDgxqf3tfR+/qfbprvsTK2TNZGCLpS5StlqnNszkvi6cSt
 yFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WqGoOwDRe2ez6Pe+QjG3aZDbNKNB7ISuaZKkBAzaNs0=;
 b=1L5/CCFyqOoT/xh7MitEBF29PbjWkYdK5bbq7o4Kbz2LQzXhW4g2cJOEEQ7MQpEKsU
 uugDqgSBJd2uHAUlpr34b+AUemqCaQD6NxrcNFVMFoO9kfcEYZ+NFGwxrHesmPzbpbPO
 fyRr/bbFGTjeWIT91Lbyzz0mOs7AbFX7mtCVXhRhXr4t7ZmRBkKYj9Z/afbJrDTmZrVJ
 VhRJRK0ugAFPk6nFVFWSN8Ju45O6O4S7SYjOnESLxYS19zlQQ2t1D9KPnBREVkfvs75x
 p3x5CiBuMiga6qJBR1YdQopYByAzxVZVinbdy4Z5k2HT+cUYgkEpRO49qkrHgv+zLjdd
 dS7A==
X-Gm-Message-State: AOAM533hStNAieNfyCpRui2oj6urPY72XG5HKhTh8tvYxXDHXLeA5//3
 K7JIa74iWmGLRWu8yAeit1SbkQ==
X-Google-Smtp-Source: ABdhPJySRNyQ10BLqrW7OxsyNbPA0c8ltlbWFAPgmo4akW3sFh1DzU8EUlw9QuowcBLe86YiTFCGvA==
X-Received: by 2002:a17:90b:4c45:b0:1ca:7c3a:5b4d with SMTP id
 np5-20020a17090b4c4500b001ca7c3a5b4dmr14316911pjb.131.1650211291092; 
 Sun, 17 Apr 2022 09:01:31 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a056a00199400b005060849909esm10487523pfl.176.2022.04.17.09.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 09:01:30 -0700 (PDT)
Message-ID: <25932678-d75d-399b-826a-b33b63527610@linaro.org>
Date: Sun, 17 Apr 2022 09:01:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/rx: swap stack pointers on clrpsw/setpsw
 instruction
Content-Language: en-US
To: Tomoaki Kawada <i@yvt.jp>, qemu-devel@nongnu.org
References: <20220416032009.1897719-1-i@yvt.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220416032009.1897719-1-i@yvt.jp>
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 20:20, Tomoaki Kawada wrote:
> The control register field PSW.U determines which stack pointer register
> (ISP or USP) is mapped as R0. In QEMU, this is implemented by having a
> value copied between ISP or USP and R0 whenever PSW.U is updated or
> access to ISP/USP is made by an mvtc/mvic instruction. However, this
> update process was incorrectly omitted in the clrpsw/setpsw (clear/set
> PSW) instructions, causing stack pointers to go out-of-sync.

Good catch.

>           case PSW_U:
> +            z = tcg_const_i32(0);

Use tcg_constant_i32(), which does not require the free at the end.

> +
> +            /* (PSW.U ? USP : ISP) = R0 */
> +            tcg_gen_movcond_i32(TCG_COND_NE, cpu_usp,
> +                                cpu_psw_u, z, cpu_sp, cpu_usp);
> +            tcg_gen_movcond_i32(TCG_COND_EQ, cpu_isp,
> +                                cpu_psw_u, z, cpu_sp, cpu_isp);

Ok.

> +            /* Set PSW.U */
>               tcg_gen_movi_i32(cpu_psw_u, val);
> +
> +            /* R0 = (PSW.U ? USP : ISP) */
> +            tcg_gen_movcond_i32(TCG_COND_NE, cpu_sp,
> +                                cpu_psw_u, z, cpu_usp, cpu_isp);

You don't need a movcond here, because you know exactly what the new value of psw_u is 
during translate: val.  This should be an if statement here.


r~

