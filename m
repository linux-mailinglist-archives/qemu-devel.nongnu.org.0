Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9C41717A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:04:05 +0200 (CEST)
Received: from localhost ([::1]:47110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjvw-0001KI-FH
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrz-0006WP-Vg
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:00 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:41681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjry-0002gP-GD
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:59 -0400
Received: by mail-qt1-x835.google.com with SMTP id t2so2608843qtx.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k2XE0Zcdylp5t/teu6ip+jkUHwkM/1QG+OhIFGslejA=;
 b=pWcdGeLfQaxatD2OHD1H5+5VW4NF8dM0muIa3hwuRsEE8AXzK/pH3yZ5H3rqwBi2mh
 Zcn6h9H5ayTt5mE4Vz99/1kBDY2zEYK2wEchsPVErbr/Cu4RbKS9IMK5R5DU5ACOcyf3
 xflvefhIC5BkxVlmNKstS64RgO08LR+b9n3JGu2sM6qf9BYuDDIAWGMWHW8CJFS8unVa
 4OXaAxdNIpiji4LV+pCGisQzy847nOdi40ph1oolQsHlxjoOvsX4yMA3fpPFpM5XN42n
 IXm5eY4bMg5PxCnrCrb+FYsC2aiEJlxYjmk13qK9qlg6lYyTayoxbIaCYxcwTCFvmjQQ
 JtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k2XE0Zcdylp5t/teu6ip+jkUHwkM/1QG+OhIFGslejA=;
 b=edhqhl57LvDfYe35FHi9inGV6+NT2h8CmRUxe78vDEEXbMCmSg2D6Gbw8VGwgdv4CR
 ESHLIlthaoluqpegu/QSax0//md9KaGyajQz3OLPFhncwh0Sr4OMq6QsELk3CYsfJ3h7
 CngV0W+ciauahIgEKJxnEkEhVSm/1XGMmYTnIt8X2uwat4vFhDRbTxmnfQbn8r9zot6K
 1YedB5z2vKE+n4D56c47/048f5yPoQYBPrdP2eQO9riz2WTNZqVZh1uqOy9AL3vJVSJb
 cayUXSeGxHP6kZLpykAumB8rHWci8BM219pk8ihJn4TAltz5KkJ1y5CuTtU5Orkuqfpm
 Tm5g==
X-Gm-Message-State: AOAM5308WcWquNixQn6nMlvOzbPkSfYc9w/WhhhheTapZlkGZ5id9vd+
 WcCTWUHNZtvTnj2cOq8i7WygdA==
X-Google-Smtp-Source: ABdhPJzYbt1R4sgVJ/iFbS068I/n3jZsnZJpdWWYjmFf5L+8OHm8kv0EjKWn7tBILHvG0/UJ6bznOA==
X-Received: by 2002:aed:2796:: with SMTP id a22mr3658582qtd.250.1632484797603; 
 Fri, 24 Sep 2021 04:59:57 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id h9sm6440651qkl.4.2021.09.24.04.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:59:57 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] bsd-user/mmap.c: line wrap change
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f652fbf-89ab-fa90-ad1d-1c612f166444@linaro.org>
Date: Thu, 23 Sep 2021 10:41:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922045636.25206-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kevans@freebsd.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:56 PM, Warner Losh wrote:
> Keep the shifted expression on one line. It's the same number of lines
> and easier to read like this.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index bafbdacd31..8b763fffc3 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -399,8 +399,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
>                  prot & PROT_WRITE ? 'w' : '-',
>                  prot & PROT_EXEC ? 'x' : '-');
>           if (flags & MAP_ALIGNMENT_MASK) {
> -            printf("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK)
> -                    >> MAP_ALIGNMENT_SHIFT);
> +            printf("MAP_ALIGNED(%u) ",
> +                   (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
>           }
>           if (flags & MAP_GUARD) {
>               printf("MAP_GUARD ");
> 

I suppose.

If you're touching these lines at all it might be better to convert them all to qemu_log, 
protected by CPU_LOG_PAGE.  Then you can drop the ifdefs as well.


r~

