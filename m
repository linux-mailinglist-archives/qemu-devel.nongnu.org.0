Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A32F36A28C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:20:56 +0200 (CEST)
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMtj-0005Cb-BI
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMpd-00037D-V3
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:16:45 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMpP-0002al-W3
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:16:39 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so2973237pjv.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PizBMoYrYX4aGrXynfedUjr4v+QfB7Msdr0EDMLYBQw=;
 b=Dc/Q4aFPxrNndihf2yQUoQeonyKIBsH7k95LT16WEdFEGCIgCg+mFzAlTAwQAJK8I9
 7rJxhzaY38IRPTD+eqMSghk7wbo+kB79x9CABZbzLDa+3JE5IcJxIO1f7oyuNS2YH93S
 C/EXfjb5bdZwPyRLjeJsnkQrX0I8qBawL6OLREhx1d8I2WNMPUJ0pJMsyNJ9K40RiScR
 q+UfqKVg3LV0g2tTdr5gydWwImaFKfhsJxxRIFSvKV/rlwIO2RVWwYW0tqC0n+VAFklt
 EQX+Ed1ThUeZHJRWvG+moOxeiDOsGf8dTBGsXh0zIZe4JFdy0UQmrFSyIZhZr0Iv5TOK
 jdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PizBMoYrYX4aGrXynfedUjr4v+QfB7Msdr0EDMLYBQw=;
 b=QnSd9nuGX3m7d4zGAA6822YbR80G8Uss5ixfMitQRypzMHiZU0Vm005iefy39IkGYT
 G2E85zNSvMfT7MTz6RROjrHMDX8YKqEYZD7HLtzQvrpvRtl+5zA3uSpffMMYDeDchcQn
 tdQxigMRFILUYtUKdOWqHQXAzkNq/KR7NEXxK7PW+18AW2nCJdPmsj1ZYIV3+kznZtz4
 qgJ7PRCQf7oo71jGxVJtN+OkQd4N6aW5N/gxZapV00ht1ldfP/uUtQ55MC+lc3oDjg7o
 eHWygLC6mBtGpmpYIZEzg9vr2/tvbMLWu9VKs/+maXmkhP3YJOuphvBjGdufg2d9K7xI
 jdbA==
X-Gm-Message-State: AOAM530F8q/gQvEp96jgM7542TYOtwWC16jt/puQp0+2iWQlAP+GKTyT
 0qtfwfltcQdGdxjUfL+WWpSejQ==
X-Google-Smtp-Source: ABdhPJwA4HCQLZ8oWAnbLAviy61CSxjFuKeEN7VkZuLy+OBCppVbjL38WT4DoINdmSy02dZcGO6ahQ==
X-Received: by 2002:a17:90a:39cd:: with SMTP id
 k13mr12987655pjf.15.1619288185653; 
 Sat, 24 Apr 2021 11:16:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q19sm7570631pgv.38.2021.04.24.11.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:16:25 -0700 (PDT)
Subject: Re: [PATCH v2 40/48] bsd-user: style tweak: Use preferred block
 comments
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-41-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d42d8bb9-0294-488c-5d94-29326c4a3714@linaro.org>
Date: Sat, 24 Apr 2021 11:16:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-41-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/strace.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


