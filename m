Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CFE6A2889
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:36:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqyP-00005S-Ry; Sat, 25 Feb 2023 04:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVqyL-0008VR-SU
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:36:05 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVqy6-0003t5-KS
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:36:04 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 e18-20020a0568301e5200b00690e6abbf3fso947343otj.13
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nU3Sr9sW0OHe0Z/4Olmom+b23TU58A85hNfLjmftHag=;
 b=DI8ePVM1HWizD7EBMvimh9wOQ1OWvlkbESjtCPfUv3a0HExFjLu72Ut07Cr341kxA6
 EDj1uCa6SlLOCvT8QBxvYQKNTYhhdKIADY7fL/9364cXW89drSuqQeFZxsUAlUdjwPhW
 mNxXR7kyjE5LnDpPcQPzVa8sVcyf2Hs50cend931uSyKPba3NqFJ9Qp8mSEa0znZ1EwK
 1wBSGcjRX3eDcklPNAhtskR0C4fx+nwSp04X0+NzWhyTfhQ9sO/2KYsZpgKOwCMT6RUI
 8wfJwA9oSD6Ty0KupV/SGxdyRptoEFkIuQ7a6VLggRR1UNAx9erbClM+N40fIIGuZTa1
 w48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nU3Sr9sW0OHe0Z/4Olmom+b23TU58A85hNfLjmftHag=;
 b=D+zvEvTcAD/oUZAHJXfErSlm4m832bxLou31Z5v3puuQdF+D6zHQHXhMY2ZZ/VPR68
 8blvtfr1TOijTSRnWqgmOEuLw3smIQYR7/bQkp5qk8cQU6xOi1JcF9a4QNP2hU0VO4i+
 xVAyp3PbQg1U6fQl39FgGsPGkb9Wa8vlqfAMP0KPg2SWr80nZguH5/opYR8rkvn8Ejjg
 RAr5gyfXey+FYlqZ7hPW4sh3xJvTUWSwCiZmU4qQ38FvnhS1o7RS3y43mNMZITFhyxo2
 ALOHaMFZI8eaMvy+Bx9zhB6+AAcq89qhFiXT/ZTuBR8LxAsqBOuKpNdVcbqssNhGBf9J
 xb/Q==
X-Gm-Message-State: AO0yUKWDyQNz74Lqs3Vl0x63t4XnV9gJeWWsOKu5oHcD862h0bUgbpEN
 7JKWOmL3s5gS+7LBF2PCclLptgWwLxPsyB4R
X-Google-Smtp-Source: AK7set/qvoaKGzD5rTEFs0W9NS9QMpEke38mBVrNu7oA5blvABqdDt/nAHR0at6LX0R9DapOwKOVjg==
X-Received: by 2002:a05:6830:628d:b0:693:d998:f423 with SMTP id
 ce13-20020a056830628d00b00693d998f423mr1235007otb.14.1677317742024; 
 Sat, 25 Feb 2023 01:35:42 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a05683012d400b00690df568258sm441458otq.63.2023.02.25.01.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:35:41 -0800 (PST)
Message-ID: <c3a77f0a-3a82-0486-bbbb-ef710fce7d3a@ventanamicro.com>
Date: Sat, 25 Feb 2023 06:35:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 14/30] tcg: Use tcg_constant_ptr in do_dup
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
 <20230225085945.1798188-15-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225085945.1798188-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/25/23 05:59, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/tcg-op-gvec.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
> index a10d406bba..877b0b659b 100644
> --- a/tcg/tcg-op-gvec.c
> +++ b/tcg/tcg-op-gvec.c
> @@ -630,7 +630,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
>        * stores through to memset.
>        */
>       if (oprsz == maxsz && vece == MO_8) {
> -        TCGv_ptr t_size = tcg_const_ptr(oprsz);
> +        TCGv_ptr t_size = tcg_constant_ptr(oprsz);
>           TCGv_i32 t_val;
>   
>           if (in_32) {
> @@ -646,7 +646,6 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
>           if (in_64) {
>               tcg_temp_free_i32(t_val);
>           }
> -        tcg_temp_free_ptr(t_size);
>           tcg_temp_free_ptr(t_ptr);
>           return;
>       }

