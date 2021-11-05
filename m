Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E81446689
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 16:56:34 +0100 (CET)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1Zx-0003a3-Cv
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 11:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1W4-0000Ga-Ek
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:52:32 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:33555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1W2-0004yT-IR
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:52:32 -0400
Received: by mail-qk1-x72a.google.com with SMTP id p17so8028370qkj.0
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cfy1fXm4aA0ZDOHPRy57MLQFkuAcmaLsF8/hWn3uko8=;
 b=ZiCX2lwdVwW5TtnQx2lCmUNG/k7NEYGGUyki/LRwmhutpw5IdJtN+mvyR21fzsbKqw
 eOiOxWOfnmiAiZTU+YtUmFZuKMlnM/qqFFqrDiJkIzxdW7Jrh8Mdcc7a2C1AvpqyC6Mh
 VnaVi/qKcshMzLcdC3CuP5C2kU2BYPkgOuMJXpTlr70tUr4NxhxsJmuWhN+6HjadiEkm
 781J9Yn9nkrrNm2t/7kco5ufw4CDoZrWwEyc1lCXzNRGIgaAooZrgovfOTpX1QKYP8UM
 NVeqBoBvpmf0cYYd2ZxEAHwagJhQxwl+dcNxR73OfQaTvwHncd3er48EZgf4PPmT+0vF
 CtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cfy1fXm4aA0ZDOHPRy57MLQFkuAcmaLsF8/hWn3uko8=;
 b=hbLUFOOgLTyu9EINTlmOh1FbS1GQGdxc98mKM/YbCiYBtYUfCCi3Y0Gu9/vdy7qLPg
 1vmSLVJPCRQMHlVtD7hfolZ1fUgLBDGCi0fS3laVngo4ewIUGLMDHIcEChEdO/uqfKda
 l8SvoRv+sKlZ86/U9jBxHNhll7USQ47k1OY11f96ITnx7Ng/HH8aY+dARtNBb6zNwu/L
 +GAIyYz55B4R5lUl58RucpOiQsMYaXUcXdi0Jjm4mU+S/gDtXCjTziU3K3xuD4Dv8HHZ
 1TuvSGfmLoPL+fF2ySJM6XwVrTK+ZwRj9KVXAHWEPwXU8HKGRGgwfdrmt2EF5odmiuYJ
 3XYw==
X-Gm-Message-State: AOAM533YMKGZFQ3IXa5vBOqyeoqV42Zn590iN96uvonYPwdJoENOtD6I
 Ib8P1b56pNetYrYfwHIGUx9qqA==
X-Google-Smtp-Source: ABdhPJyMZ5JrJ8w0IQLoe7fOD9ipbzxYBso7ido5lFUqZ2TvFKUB8/1yhFEdEIiAvyZA1iEHGr8fgA==
X-Received: by 2002:a05:620a:2a01:: with SMTP id
 o1mr10991867qkp.305.1636127549375; 
 Fri, 05 Nov 2021 08:52:29 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id b5sm6324713qtb.1.2021.11.05.08.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 08:52:29 -0700 (PDT)
Subject: Re: [PATCH v4 01/36] bsd-user/mips*: Remove
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0901cff3-28ed-4a80-90b2-d2e4966e667a@linaro.org>
Date: Fri, 5 Nov 2021 11:52:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:18 PM, Warner Losh wrote:
> FreeBSD has dropped support for mips starting with FreeBSD 14. mips
> support has been removed from the bsd-user fork because updating it for
> new signal requirements. Remove it here since it is a distraction.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mips/target_arch_sysarch.h   | 69 ---------------------------
>   bsd-user/mips/target_syscall.h        | 52 --------------------
>   bsd-user/mips64/target_arch_sysarch.h | 69 ---------------------------
>   bsd-user/mips64/target_syscall.h      | 53 --------------------
>   4 files changed, 243 deletions(-)
>   delete mode 100644 bsd-user/mips/target_arch_sysarch.h
>   delete mode 100644 bsd-user/mips/target_syscall.h
>   delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
>   delete mode 100644 bsd-user/mips64/target_syscall.h
I'm somewhat surprised that sys/mips/mips still exists on the main branch?  But anyway,

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

