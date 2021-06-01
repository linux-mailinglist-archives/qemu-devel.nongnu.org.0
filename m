Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71501396BEC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 05:35:43 +0200 (CEST)
Received: from localhost ([::1]:58894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnvBu-0007uM-Hw
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 23:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnvAw-00070d-IR; Mon, 31 May 2021 23:34:42 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnvAv-0006yu-16; Mon, 31 May 2021 23:34:42 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so592065wmk.1; 
 Mon, 31 May 2021 20:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a/4wZk6eepGU3q1c8giw7C2nDAQVMmOn9kozWz7BdN8=;
 b=GcsnPdo45DdDo3dpzsssLhzuNrwhlztQpn0wCxG2WOqU8wxvNonUIFjRfh8Kw/UwDR
 /aVGQCb5CoZXWrnT+NS2o++77qXiRPxP+4TLEPrTBHglMlNq+ueiZT5FXAzW/LVJ4/y8
 gzx7f6mcK5MBoAEfpBSJI/8NQ7ZTRnGDD3YYNM2xZVYdm9PWUA26YQaR/dQx5oB4/CjM
 8U4T8dlA6/XpySwLGd2jXBc71Jv4Ae7895kfWZ5hbW5OlMAjcFyqmms7ZYG03wHUuc2R
 9ppi34DI55c5L+YHJSIdKULfeNfUd5eUAGbf/q8NOJEmiCsVU06c/Xn9r6+H21FebKr5
 ksAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a/4wZk6eepGU3q1c8giw7C2nDAQVMmOn9kozWz7BdN8=;
 b=D3O1FUS8EGlbVQHpMygTEAYSNxkRziOouLAzQTSDCS7CMdhU1x6ex3aSu6I1zBdiGU
 jfxVFP+03paX/Fu7vv2Wm8Umr7YhKAxWSi+yaRF6eA+5xOEfrnLISEJi5rSp/yyrrhsF
 QmeL2czjc9OB0jpOy9BBOl7A7U/0vimZRScccOJO5iz1LM/tjY/RCwMoCkuC+yqB6cHk
 PfyfSfxKi4vKwLCcV2YmPPqfGHtOdIy+xywIzuXLyCzi6MYTVAhSsEj4Hbh0VWpkK0R6
 TxwlbSxclHHSOURsqVEzqfVuvo+xQSZQl9OiBAmT0+ZjE5CS3s1/E7NrBT+V7uuzqK9d
 kz+g==
X-Gm-Message-State: AOAM533psJHIzO7/O2CVqMdCFdBupUhufp81Wep/G2iDyoTJ0s9nBBDu
 30TeFyT9xqxmqPFNcRcc60M=
X-Google-Smtp-Source: ABdhPJzWrvZNqUSk6s/cvjS5W3VLuHPOA+lzskqutgJhbYb06nZ27pykNdnghAkyHj9Thvu4sTRZ+Q==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr1994279wmk.64.1622518478781; 
 Mon, 31 May 2021 20:34:38 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id g21sm1674986wrb.46.2021.05.31.20.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 20:34:37 -0700 (PDT)
Subject: Re: [PATCH] target/hppa: Remove unused 'memory.h' header
To: qemu-devel@nongnu.org
References: <20210517101558.1040191-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ef946ba8-70f7-f6d5-24ad-01151da78131@amsat.org>
Date: Tue, 1 Jun 2021 05:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517101558.1040191-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.591,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent, can you take this reviewed patch via qemu-trivial?

On 5/17/21 12:15 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/hppa/cpu.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 61178fa6a2a..748270bfa31 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -22,7 +22,6 @@
>  
>  #include "cpu-qom.h"
>  #include "exec/cpu-defs.h"
> -#include "exec/memory.h"
>  
>  /* PA-RISC 1.x processors have a strong memory model.  */
>  /* ??? While we do not yet implement PA-RISC 2.0, those processors have
> 

