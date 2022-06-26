Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B5755B156
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 12:52:06 +0200 (CEST)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Ps5-0004EX-1A
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 06:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5PpW-0002sw-8c
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 06:49:26 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5PpU-0001VP-Ny
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 06:49:26 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 n16-20020a17090ade9000b001ed15b37424so6782255pjv.3
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 03:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=eh4nZ4XVYVdK3eh2aHh9BEJgQ6/QWAX0pNzsYacVdOc=;
 b=ACD6QxirAY11vTFYVsRJM0LqzzveqsbCuUzdT3eRi8ypj04vbH8kIYraUznd/qR0j/
 A5eiIilR6cyhwyDb1rarR/LSkrq/NbdDXmjxmx2sEO6xzJabyLAWljv8+Xcduq2KfPX1
 3UcAQsUbB0RXbHXDCtisDnuVrW8J7xF0tTGLhv0erW7pf0ZcG1lqVYvJgq62v2JEju4m
 un5pp9ZHz5Mgrw7eCf6rsuUR1FpA7pNoVLkH6SVKt6w1EJ8MIaUG19kFN8gIqPCuI1Hj
 GzIpARtwxPuoWGkFeyeXSsA0bKk/C2Nl8x9rptHMym0MXsEMMMcugABwuV0MoJi8KgIe
 KuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eh4nZ4XVYVdK3eh2aHh9BEJgQ6/QWAX0pNzsYacVdOc=;
 b=5w4Y+EqLfbWNsWQ/kPRcw5hbudmyy7lJOhhkeEBItYJY52MsOJzcFwcFDZ8LJyt12R
 Efpx60sMftRr03F+X/lbMe+4SAxZ0Ju5XICDtJmoKw9kWrPG4m7h/1C5swnSeE9qFgXR
 OHmbqlVgF0TFGahrGA4svScSla36AA8xInrJm6gi3aujFCmJvc1jXwYK1FmIRIBtHfqO
 mnPXwEdj2zy0EScUYNK3/MF981nsyNf5K1EoffxUp6Cb+8TPcv9JGeT3FDI4fHa/SqB3
 pZhLPyMhM4IBjAuoYFtqO4ca1wGRGoofIACd3V4XlgILw0Kis8u6GDsN/PS+jF0XjvkI
 e+rw==
X-Gm-Message-State: AJIora+iJmTAxgrLSkTVCBKZJoz3gKW04wWrQY7YrEhmqrpxS4+jjK28
 6f8OLi1ty+TWUSLuB6SonLvEQw==
X-Google-Smtp-Source: AGRyM1vM5qf6L3uhK9r9NgNNbZrCZWxBqvrNpXk1hy7FDJA6E+pTH1WwUOcbOilkjf80qRPFtM6vow==
X-Received: by 2002:a17:902:dac1:b0:16a:3ebe:c722 with SMTP id
 q1-20020a170902dac100b0016a3ebec722mr8254280plx.169.1656240562847; 
 Sun, 26 Jun 2022 03:49:22 -0700 (PDT)
Received: from [192.168.44.231] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 mv24-20020a17090b199800b001d954837197sm7176652pjb.22.2022.06.26.03.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jun 2022 03:49:21 -0700 (PDT)
Message-ID: <ea652243-c114-628d-647e-a0df3f14d688@linaro.org>
Date: Sun, 26 Jun 2022 16:19:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tcg: Fix returned type in
 alloc_code_gen_buffer_splitwx_memfd()
Content-Language: en-US
To: Shaobo Song <shnusongshaobo@gmail.com>, qemu-devel@nongnu.org
References: <20220624150216.3627-1-shnusongshaobo@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220624150216.3627-1-shnusongshaobo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 6/24/22 20:32, Shaobo Song wrote:
>   This fixes a bug in POSIX-compliant environments. Since we had allocated
>   a buffer named 'tcg-jit' with read-write access protections we need a int
>   type to combine these access flags and return it, whereas we had inexplicably
>   return a bool type. It may cause an unnecessary protection change in
>   tcg_region_init().
> 
> Signed-off-by: Shaobo Song <shnusongshaobo@gmail.com>
> ---
>   tcg/region.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/region.c b/tcg/region.c
> index 71ea81d671..88d6bb273f 100644
> --- a/tcg/region.c
> +++ b/tcg/region.c
> @@ -548,7 +548,7 @@ static int alloc_code_gen_buffer_anon(size_t size, int prot,
>   #ifdef CONFIG_POSIX
>   #include "qemu/memfd.h"
>   
> -static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
> +static int alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
>   {
>       void *buf_rw = NULL, *buf_rx = MAP_FAILED;
>       int fd = -1;

Thanks, queued to tcg-next.


r~

