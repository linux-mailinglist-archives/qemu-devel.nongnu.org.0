Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793DF21BD85
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 21:20:54 +0200 (CEST)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtyZp-0003kk-6q
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 15:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtyYY-0003Jf-EG
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 15:19:34 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtyYW-0003wL-My
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 15:19:34 -0400
Received: by mail-pj1-x1041.google.com with SMTP id mn17so3019555pjb.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 12:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=c2H+Fzts6jlxRmP7ALD3tcuRMWGFAO43A0XGsGTY3DA=;
 b=ryuE6Qx1IQgjaCbtMQthSHtBmFlOuLEXubEHZBomSmX1ktDVHI8YfGn1wnbF8ki0/F
 tgLyADUr0HPtrh5wHeQrRku4LEVJ3IhlqcVuH15JZ+ls6RuPEmd7N7dbT6gTMBdnHUlz
 k+ItWvKe3eBaJzhd3SJxT2cVUThFWkcIxDtiVSeGQkGyqGLFq9J09DI8jfjn93G2r42d
 Oz8/QpA/hzlimNyw9HzVA+Xm/OGFWM743OkTWkwZ9ay38GxTGRlFS84iFdqgFyDb2JUc
 DAiwzYw25sLjhYNiEkRerVOZMpyUCU5+VSlWOg6yG7yMo9WQPAddpQ+wCYjBnqEt7QBp
 FXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c2H+Fzts6jlxRmP7ALD3tcuRMWGFAO43A0XGsGTY3DA=;
 b=dv1YXcLhgbWomqitc5t04uuB6sGY3Yr5mPL2ReIZ/pvJuC23UdM60g5LUh+gmM4VNV
 xff7/b/Lw9gxQAt2BNzEimdOSn+HPCl6fuosHli7WFQD+eDHaZ3auFmQsLZDOgrbuXfY
 9Z8MerMMUhuSY7Clolae0039ugo8r6Sfcipfz0JhJ6rEie8f7XPMPvX2zrWkNXdHlxui
 S4oqArysJ/HIemc/0UU9Y2bi2ppf82bslvWAPhn+Lxja8Mcqd36VyxaehjU7rTKNzk7X
 KvAW/CtgUTVtKMbtUO7YxxaXABrKnOJVYSV5fJ2JFlm1d2rPO+cOOcqXWxFsmD6Ck5Fm
 BdTA==
X-Gm-Message-State: AOAM530XWUN4GnrDytt0vlLLzb6Wrcdf7EFVf6ZPq6N6v4yc6FZS6aun
 sAKOurYQvbI5lGjDpSc5ySJ8M79CDZo=
X-Google-Smtp-Source: ABdhPJys+PudYMWUftyJKTFgX+8Qy8jEeKU8LST78MhIwrO/ozcCM3V1tR4E6JofrFKJza3rULnWgQ==
X-Received: by 2002:a17:902:bb8a:: with SMTP id
 m10mr4325021pls.137.1594408770283; 
 Fri, 10 Jul 2020 12:19:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id c3sm6743673pfo.203.2020.07.10.12.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 12:19:29 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: remove all dependencies on a (re)configure
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200708175335.31292-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6b6f12d-4917-7256-0583-63f77951bb4f@linaro.org>
Date: Fri, 10 Jul 2020 12:19:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708175335.31292-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/20 10:53 AM, Alex Bennée wrote:
> The previous code was brittle and missed cases such as the mipn32
> variants which for some reason has the 64 bit syscalls. This leads to
> a number of binary targets having deps lines like:
> 
>   all.clang-sanitizer/mipsn32el-linux-user/linux-user/signal.d
>   140:  /home/alex/lsrc/qemu.git/linux-user/mips64/syscall_nr.h \
>   455:/home/alex/lsrc/qemu.git/linux-user/mips64/syscall_nr.h:
> 
>   all.clang-sanitizer/mipsn32el-linux-user/linux-user/syscall.d
>   146:  /home/alex/lsrc/qemu.git/linux-user/mips64/syscall_nr.h \
>   485:/home/alex/lsrc/qemu.git/linux-user/mips64/syscall_nr.h:
> 
> which in turn would trigger the re-generation of syscall_nr.h in the
> source tree (thanks to generic %/syscall_nr.h rules). The previous
> code attempts to clean it out but misses edge cases but fails.
> 
> After spending a day trying to understand how this was happening I'm
> unconvinced that there are not other such breakages possible with this
> "caching". As we add more auto-generated code to the build it is likely
> to trip up again. Apply a hammer to the problem.
> 
> Fixes: 91e5998f18 (which fixes 5f29856b852d and 4d6a835dea47)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

