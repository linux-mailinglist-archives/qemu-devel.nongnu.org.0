Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4574E369D42
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:23:32 +0200 (CEST)
Received: from localhost ([::1]:53804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la591-0006xH-Cf
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la57B-0006A8-MQ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:21:37 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la577-0006lD-Fv
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:21:37 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m11so35035324pfc.11
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c7g9kHeWLdyeV/h53nXryVS28IRXYsSvt6QHqZlDJJg=;
 b=wStjw/qTMP9qnJqQPg+FJqERqfUq61Tg290HZ/BPExTPnYYl10dTDEJofz7IhphVLN
 G+upRuS9mBwYHRCrUpHGwsUNWsINywvVwOx3sHUVztKWSPGVQlEA8FKP2kczDwp17owx
 zlIHF3q3/AfTzFwBvY00OOP4sA3irxx6fVToUBh0x8+NWkaViUPu8LnuvaEZsG7Je/HP
 OjiNwTRELkzU1sRp3ZyNA13JJu27aEhRvgxOs535UX+6v1tfJW7P0mcDCLruSI+LfDqt
 JWRcbIwNontRhpLxk+1OfpXPU75STEEOTPqu2ha3Q4uUba2GxeVsxnmdG1ECnLc3mPCM
 KEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c7g9kHeWLdyeV/h53nXryVS28IRXYsSvt6QHqZlDJJg=;
 b=tsBndtiCvrdN42TAI28k1UgynscyGtlx9tgBGKjgjVKg3FHV7PjCwcWS+LUmuJugSE
 odVCkRXcYi9N7E8qn61IMyyEvkcKrjg0wZ7144yL3+xNu8WTQH2fkxSm8FdT9GonzuVl
 u/OmKtzkdBzrYbx6zIwgA9aQzxwedXCVUX/KJDOHJh0vOUT+++2dozGDx9RD/lA6H0Dk
 /o+vjH4tIRYLwoYQlzabpmosnpi3cYkAPyjYHai1Yxh7dQIRp2YZFuyvCj9Q0MlcUhuO
 T1W0DZABCHHFTDC39W0GYm/V01wymKnHVThU2jyT8DtuEFfTJSW9+6gKLeeOYZKhBBn7
 ZXQw==
X-Gm-Message-State: AOAM532GCORAx2rdV3v31uXRatxxU5EzlKprDXV6WEz7Ffs0IbtxjlS2
 mskNk6cVAlLRYTmlCH22crUziA==
X-Google-Smtp-Source: ABdhPJwlLMX/89WhF/iUkCvmLmJc+l4UOZSjrAGZSGkDXSEkm8pLNo9JuFLd7enPGTCewOqljRiPMA==
X-Received: by 2002:aa7:8d84:0:b029:1f8:3449:1bc6 with SMTP id
 i4-20020aa78d840000b02901f834491bc6mr5818884pfr.76.1619220092084; 
 Fri, 23 Apr 2021 16:21:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id m9sm5720199pgt.65.2021.04.23.16.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:21:31 -0700 (PDT)
Subject: Re: [PULL 22/24] bsd-user: create target_arch_cpu.h
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-13-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <580732c3-91e0-9a85-0218-77e2b82bc269@linaro.org>
Date: Fri, 23 Apr 2021 16:21:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-13-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Create target_arch_cpu.h to house the target_cpu_loop and target_cpu_init
> functions. These are the empty files that will be populated by moving the
> appropriate cpu-specific functions out of main.c. This work pre-dates the
> linux-user work that moved these to cpu-loop.c, so was done differently. As
> there's a number of things linux-user did differently than bsd-user in their
> time of divergence, and as the recertification of the code to redo it the same
> way will take a fair amount of effort, a separate effort to address the
> divergence once everything is in the tree and we can create a common qemu-user
> directory for the munane common elements between the two.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h     | 22 ++++++++++++++++++++++
>   bsd-user/i386/target_arch_cpu.h    | 22 ++++++++++++++++++++++
>   bsd-user/main.c                    |  1 +
>   bsd-user/sparc/target_arch_cpu.h   | 22 ++++++++++++++++++++++
>   bsd-user/sparc64/target_arch_cpu.h | 19 +++++++++++++++++++
>   bsd-user/x86_64/target_arch_cpu.h  | 19 +++++++++++++++++++
>   6 files changed, 105 insertions(+)
>   create mode 100644 bsd-user/arm/target_arch_cpu.h
>   create mode 100644 bsd-user/i386/target_arch_cpu.h
>   create mode 100644 bsd-user/sparc/target_arch_cpu.h
>   create mode 100644 bsd-user/sparc64/target_arch_cpu.h
>   create mode 100644 bsd-user/x86_64/target_arch_cpu.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

