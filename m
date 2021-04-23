Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F87D369D19
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:05:22 +0200 (CEST)
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4rR-00011q-5C
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4pb-0008Hs-SU
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:29 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:56036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4pZ-0004Cj-Md
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:27 -0400
Received: by mail-pj1-x102d.google.com with SMTP id s14so19010286pjl.5
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3Ix9JcFJg5xC9UDMLqsaZ+/WQSW32LJszBV7f40ujqg=;
 b=nc+FJyVjVQb7qQBnrb7WxZgjUdtXQj+KdGqlaf+hjCZQSYMg8eXvcmlVdN2G7Jn092
 +VEDvNCo8p7D4Y8CCM0bTzS2D0MRNtw6MnljqAmQeg/bDp3tAkc3iPPpbFRkRjOyi9Db
 r3cLrMplkm8sRC3nTlCCNsjpHEOCXbC09c/w2AArz/BuRdu3lBwl2qM3zJKKhAm5K1Y8
 ZPO4CwCNrcNusTEDd0VVG18trTes34O+0QhMdOsS4AyFoc4kYQYrYQ9KffvwfauPudLx
 JVia0l8yj8+Yfzbty7YsMicV2oDWp7m/qQ8i1sLwlWItXxTkwnsjGgPRyiQAPNTI05Ks
 0Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Ix9JcFJg5xC9UDMLqsaZ+/WQSW32LJszBV7f40ujqg=;
 b=LLZujPP4hW8D7ZcRdRir8BymButRigdd41f09xYEeK+cO6+al+nZN985gHWjKVY+JE
 lcX6fK1FSvMbMtcvPxDmseVnkITF9llZJbL9J74wbj2PEgZ6LGoI0+7F6SI3CTBrJi1Y
 raIHLXqIzLgDIKO8ZBcRJCQs8JZ3YKA7rCsXoqU5TuPUHTCZrE8RHDn8UZSVxhAEkqEz
 Jpjg5mogt64+v3Wct9yIvlRwUS7zCWt3tRM1o6N77JKk1T8wPLeAlR1t7UkF+MZosqVF
 HdqXQ0ly390c0OK2OR12lfnI14hcc65xa4Kb4N6Gnd/m7eTLSUA6dtwLOqYvKWhra4Fw
 PoBw==
X-Gm-Message-State: AOAM532Nvbg75SRpJaYR5+KjspUfdCF7FyUgT2UifoApWLHwDGVeNsU8
 4FCeD2Dr2TMWMfsvIUdScCqlRw==
X-Google-Smtp-Source: ABdhPJzJy7Oc28n4wEVpGbaZBrPCyaZctvOWyjIZJYJ+MEpfuTeF0xiw3TRsD2dARNkYF8MPMt3Ljw==
X-Received: by 2002:a17:90a:c404:: with SMTP id
 i4mr8402518pjt.10.1619219004547; 
 Fri, 23 Apr 2021 16:03:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id y2sm5733984pgp.2.2021.04.23.16.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:03:24 -0700 (PDT)
Subject: Re: [PULL 04/24] bsd-user: style tweak: keyword space (
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203935.78225-1-imp@bsdimp.com>
 <20210423203935.78225-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60a29775-1ea4-b161-7e22-aa07388666aa@linaro.org>
Date: Fri, 23 Apr 2021 16:03:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203935.78225-4-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


