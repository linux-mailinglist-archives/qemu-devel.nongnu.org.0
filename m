Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CF33E4DD9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 22:32:53 +0200 (CEST)
Received: from localhost ([::1]:45734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDBx6-0000yr-7A
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 16:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDBw8-00007a-6b
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:31:52 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDBw5-00007V-DF
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:31:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id l11so6246967plk.6
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 13:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KMEve89xNMBzBPNAnrPjvSkwCV57ckyf1pTfFAvQRgI=;
 b=Z8jQgS693/avFeCWCKwkt2W+hwlm4C592tXwfq3gj0W9cBTzPfUnZfpvKYsYaT0pia
 vqDHiRYz26TOffTSIZpwxesXDs7rJc69ceVgVmoZEsNgJxzbL70JKrqRV+iBdITy67JO
 CsebfPoQ0saCIs014V9NgAF1ajgB4+lFgmUdp7LLiSe0g5kYCettG2FPlUUX3dNp/LKf
 zQfysFZHO2uFYq6LPdzhXft2uIShoAoviSCliGTQRKjT5kZ7d6fqACaNtHhDgsT02Th+
 49CxQ7WCJo+4yD4l0w9PAO8iGF4Ojjk1EwpvqYfxY5WqifhOspumOyIgXum5eOx7kSiq
 sNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KMEve89xNMBzBPNAnrPjvSkwCV57ckyf1pTfFAvQRgI=;
 b=DWszlYls47gu+BkkNMeoLehuVQR2SrbTtiQgYuo+AbjnZMfE3KF2ADld2ihSg0yWcE
 QeHMOffUlXqefgIJGf4Ampf7ffPUQx8A1CZyNcNtjwRUGV433++0CN+Z0e+wp4mSRqRa
 GZyGA9tu7Q36573upjLQi7v87uR8MZt/jh2v8KTwVJaiXu9X9g001dp97i/PedMwMMFn
 Bkbs6LB8l3sfnJmSKwx2gbexQT8ak3zWiy0pMcSahbGFCv4ud6d818GlqYVUSwh3kqtn
 fvS+3sZaCrwATdCZCmVSwbHqxhGd7J+2hJZQUFYSITai7le6bznvAu6pvciTdB4n0MJ7
 MM3w==
X-Gm-Message-State: AOAM530QdozusiAC4KG0vzJVHKIw0M2esEHIh5mkK9du+VbSaXSHV0sM
 Csvlwylnw9BL53yb1gNDillCUQ==
X-Google-Smtp-Source: ABdhPJzO1TDm4wWeAHEkt3xE7E6qBL5bmyAv3diwBFFHiFzkeMwIIEmj5x1tCbT2EVnqwIy/Jf+bIA==
X-Received: by 2002:a17:90a:b00f:: with SMTP id
 x15mr26946130pjq.59.1628541107770; 
 Mon, 09 Aug 2021 13:31:47 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id 17sm395767pjd.3.2021.08.09.13.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 13:31:47 -0700 (PDT)
Subject: Re: [PATCH for 6.2 24/49] bsd-user: Include more things in qemu.h
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-25-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <530a8f22-9c21-c604-9be4-405ef1f93ba0@linaro.org>
Date: Mon, 9 Aug 2021 10:31:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-25-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
> Include more header files to match bsd-user fork.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 6c4ec61d76..02e6e8327a 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -18,11 +18,15 @@
>   #define QEMU_H
>   
>   
> +#include "qemu/osdep.h"
>   #include "cpu.h"
>   #include "exec/cpu_ldst.h"
> +#include "exec/exec-all.h"
> +//#include "trace/trace-bsd_user.h"
>   
>   #undef DEBUG_REMAP
>   #ifdef DEBUG_REMAP
> +#include <stdio.h>
>   #endif /* DEBUG_REMAP */

osdep.h will have included stdio.h.

> +//#include "target_os_vmparam.h"
> +//#include "target_os_signal.h"
> +//#include "hostdep.h"

Delete these?


r~


