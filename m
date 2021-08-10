Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3073E7BC5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:10:04 +0200 (CEST)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTOF-0005tU-Ik
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDTMI-0003dx-8G
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:08:02 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDTMC-0001xA-Sk
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:08:01 -0400
Received: by mail-pl1-x636.google.com with SMTP id d1so21467097pll.1
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p8EgCOYveSHoRGZhX2WPT0Yd+ZqgQd157WSm7Ibq7BE=;
 b=d5KjVbBAZVWvMBf7IH4CnIKIoRISrTWwEqcKIwHJ1fnprsHUadt+G27ExpKgTWnaQA
 cC87ujnR/94MTlFouAEZ+Rquhjn2Ux7tuDTggmlnazxJK3C+mlUFf5n2OKGjBdabQIr2
 29JyCBpzqX4WqrOLMUYopz5tg4S5LUvivKgMB1YZg3r8kJPI/VZ/4QWZfSe33G+2v4lB
 B3Ng64F0BtEChgheRN2T8F/2/6+oa2yyFPPinSSFXISO4470kDJ91/Mr9W5EVwHb5/9G
 TPLrfOy0zB9BFMzR9+cRuzPq03bZe7S59hr/yZA90oCIZhHY6A2McXn3tbROGKg1L/CP
 dPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p8EgCOYveSHoRGZhX2WPT0Yd+ZqgQd157WSm7Ibq7BE=;
 b=mKwRqz+KigepKslwLP3mR2Eyqyae4lx9rDdZy6WOjaEBKkq8swgofhg7lZVKb54Epw
 16lOsLvbIJ8052VBv2v6k61L89mHqssbzfn1pXWrXTeai2dRVNl9P+TdCAO2F2+uM7SO
 EDmvNQRZI2ZVH484BBrU1xL0SaczYcjw4b5qU/ieOvJPdA2mJYfZp0z68JHh3pTS0ODi
 7O+UchH6xOeYxs4SrWmpILtWx4qkjriP/FQ2BEGoRg1gn5Gci4NgKJvqgYO77V6u201w
 Xw5wBnJqMzHbFkOLKJ3cmICemzWBOu8+GBwR4yzbkZ97MRCEHTa+5aWihY3jruya7bDX
 xoTA==
X-Gm-Message-State: AOAM531KLHHDRXeHR2uR8TR9miBqt/72wVDJFXRNrHyaa9Y8/AMQD/zI
 6SWMTKFuR5z1xtybc8S6X7AMRA==
X-Google-Smtp-Source: ABdhPJxCMY2f7gafSOd8cY4ojZ0nkj2T6ted0uvT7g+K4NX1sMEp/w3jljf5B22ldzMBFNVJxGRyXg==
X-Received: by 2002:a05:6a00:d71:b029:3c7:6648:69c6 with SMTP id
 n49-20020a056a000d71b02903c7664869c6mr26261948pfv.63.1628608075436; 
 Tue, 10 Aug 2021 08:07:55 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id j187sm24063966pfb.132.2021.08.10.08.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:07:51 -0700 (PDT)
Subject: Re: [PATCH for 6.2 35/49] bsd-user: remove error_init
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-36-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0508e338-28e1-63fe-125c-c365761c5cb8@linaro.org>
Date: Tue, 10 Aug 2021 05:07:41 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-36-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> Error reporting isn't used, so gc it until it's used.
> 
> Signed-off-by: Warner Losh  <imp@bsdimp.com>

That's not true.  At minimum, tcg/ uses Error during alloc_code_gen_buffer.


r~

> ---
>   bsd-user/main.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index b5527537b4..7e20430fb7 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -34,7 +34,6 @@
>   #include "qapi/error.h"
>   #include "qemu.h"
>   #include "qemu/config-file.h"
> -#include "qemu/error-report.h"
>   #include "qemu/path.h"
>   #include "qemu/help_option.h"
>   #include "qemu/module.h"
> @@ -223,7 +222,6 @@ int main(int argc, char **argv)
>   
>       save_proc_pathname(argv[0]);
>   
> -    error_init(argv[0]);
>       module_call_init(MODULE_INIT_TRACE);
>       qemu_init_cpu_list();
>       module_call_init(MODULE_INIT_QOM);
> 


