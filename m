Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AECE40FB06
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:03:21 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFOa-0001fw-Ab
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRFNS-0000ww-8k
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:02:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRFNQ-0007IH-GS
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:02:10 -0400
Received: by mail-wr1-x430.google.com with SMTP id t18so15752679wrb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oLYBifoYFNc+HBPGEB4jAQGMsUs9rmG+c1Umb7r2LR8=;
 b=kxOQkkUg2NCnFycm1uwTGKYHS0FVvOBBy0FYf8yXQd2LyRHHWumNbLGnCMxhfCSGjl
 B0gbl56+0s0qSZ395KPF2SH8Sk8g0Gk281Ylf/78QYNQJ9Qh3qY6QWd1UDekvyNGbqBq
 FJ6IMt1KI5U9jQry+Y2hTpgVl468MQZ04sPoR7eMqz+y4YAL7PGWrSGOM8ArtAPeLpQd
 wOzjf2/1o5NqtoOPptnTuXy6nFS0prqr62NdssK0TDTnEOGk3Al5W8RbV3EZfqEhKz4r
 uap077Mrtvi5v2KxqjpARXlCH/38gxScgvChl1G2NkVsQHLOoS4lPaWmBP0uIALYYDva
 t6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oLYBifoYFNc+HBPGEB4jAQGMsUs9rmG+c1Umb7r2LR8=;
 b=lih30klbsjZ3XZFkeMy6eZvdWWPfMeFMzMRL6ANLc9DPb45XDIHnlT6cdBk8FW2Xh7
 Whq5RErHuKnmyPptz79G0jBX5hVCnQ0Av1V5o1nlyvUb8hhX50QPWT4lqEacHxwqFo1p
 xZIoc4ptF32mtwyuM6wyU+ULCXbPeIztx3S5hAe/fcUJKxGheKGNAmKfMY9r6LDgGREO
 Sk3JpH46vPdQnVIwxd2WQa/MmenV6sfPWETZnQ7DXszKI6WC/sgsjBF5rgFabITJ0o67
 JwWcOl2KAh4uP80i94//L4FZKZkBGUJyicTzHDdvvoLl0DG/WBcwDvPBQ8MN6j4CuoqK
 oatA==
X-Gm-Message-State: AOAM532ADVNX3rs0eDBZ7D6aHAwuWyKOjqUxwd36AtUQdUIr2qp6s9Vw
 W2AJsO0kVbL8lmFTz9Veytg=
X-Google-Smtp-Source: ABdhPJw4QZriG4liL+RI4TgIm307hppJWVFnQVzNLlD9VvyXe53exUXt0/hsMLWjjgx95yZG0CF7MQ==
X-Received: by 2002:adf:e404:: with SMTP id g4mr12630549wrm.143.1631890926927; 
 Fri, 17 Sep 2021 08:02:06 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id g22sm10032543wmp.39.2021.09.17.08.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 08:02:06 -0700 (PDT)
Subject: Re: [PATCH 1/9] bsd-user: Apply e6deac9cf99 from linux-user (zero
 anonymous memory)
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210917025635.32011-1-imp@bsdimp.com>
 <20210917025635.32011-2-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d9ca1949-7c57-e805-8f94-00e09ff9cb48@amsat.org>
Date: Fri, 17 Sep 2021 17:02:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917025635.32011-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
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
Cc: kevans@freebsd.org, Riku Voipio <riku.voipio@linaro.org>,
 Chen Gang <gang.chen.5i5j@gmail.com>,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 4:56 AM, Warner Losh wrote:
> From: Mikaël Urankar <mikael.urankar@gmail.com>
> 
> linux-user/mmap.c: Always zero MAP_ANONYMOUS memory in mmap_frag()

Please use it as subject, "bsd-user/mmap: Always zero MAP_ANONYMOUS
memory in mmap_frag()"

Then describe:

Similar to the equivalent linux-user commit e6deac9cf99, ...

> 
> When mapping MAP_ANONYMOUS memory fragments, still need notice about to
> set it zero, or it will cause issues.
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>

^ These tags were for another file, not this one, please
remove them.

> [ bsd-user merge by Mikaël Urankar, updated for untagged by Warner Losh ]
> Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/mmap.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index b40ab9045f..fc3c1480f5 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -180,10 +180,12 @@ static int mmap_frag(abi_ulong real_start,
>          if (prot_new != (prot1 | PROT_WRITE))
>              mprotect(host_start, qemu_host_page_size, prot_new);
>      } else {
> -        /* just update the protection */
>          if (prot_new != prot1) {
>              mprotect(host_start, qemu_host_page_size, prot_new);
>          }
> +        if (prot_new & PROT_WRITE) {
> +            memset(g2h_untagged(start), 0, end - start);
> +        }
>      }
>      return 0;
>  }
> 


