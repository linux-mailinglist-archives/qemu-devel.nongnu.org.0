Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DC83D4F6B
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 20:17:22 +0200 (CEST)
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7igj-0004Ff-Jn
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 14:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7iek-0002ln-0B
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:15:18 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7iei-0001n9-Hu
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:15:17 -0400
Received: by mail-pl1-x632.google.com with SMTP id d1so1689841pll.1
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4sHVQsVhKI99G8ByE1/r4ezdwMTQsXcLs00T+NdGBQU=;
 b=GSW7JfFuNUvcioWL5vlwDebDoQUzJfJfHnMEjCkohm6UNBmtmaiIPm9uc+O7qZLUP0
 nKYr51MZ49RK2CTqz0BXfegESc85o/vj4eI+uaz049bOwrnckUoR8nNqA/oujGVL5Thc
 mtaKalK9YK7mDzBMtysRmUVpTER75bYqdzQPNHlL7mcyQEJJI8v8dDFWBfWsGiIkjaFS
 xnnyotg+9QwvxOYs2d849RuK5x4GPtDZpewF6YLwTlA9EpyCHelpkhccm0FtUbsDhhPP
 FTIJ+Th2cuVIueGpfKD9qNToeZIC7ijOabkGYQ0YjLQJEKH9j/0Lmsl0oh6LCt+ZdB4T
 aybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4sHVQsVhKI99G8ByE1/r4ezdwMTQsXcLs00T+NdGBQU=;
 b=ozdkhQjQZrwyzAjQpbmFSvdWdy8Pt2Jvklqt4sKpbxpV5TIWK1GZgHcSE4O5ThBgey
 Big9wyFnPFyOlsaVDmEglgfQ8lm3IvPBXQcuQUG/TfiLFColReb3Hc86SUHEuCnC/y1o
 B+6cSUO3YP9lwABcopzD2KYwEag+ObXUeBBhq3xUtixI6iMpo5g5JrpPV5K968tyPeQL
 C1bG5+kPr9ljfJic/Nodct11rpCxcGqPHhZSYczx8EXWHBXZTpLKWpe+75XrcoaxG8ot
 FXtBJez5xOrKg3EO7ZQv7ed7ILT8cxs+SSV/HAtz/VBZhAqrlG2gKYRHND7YHctcyJGs
 z6XQ==
X-Gm-Message-State: AOAM530mwj3++wTJF/kGAh3549nHvTazHy0hJ6ywvWFqb08xD3vAddxc
 HM97ufsFOWW/EIkVXzzGMpnJ8E3AuiZllA==
X-Google-Smtp-Source: ABdhPJzyzY0Mkg8TXs5rFQGLa+ikGl8pBPk57yJvaeXtkUjj98LOcjMeZs7sV3AQFDLEO6VpcOnfeA==
X-Received: by 2002:a17:902:76c9:b029:12b:c907:e144 with SMTP id
 j9-20020a17090276c9b029012bc907e144mr9044417plt.5.1627236911792; 
 Sun, 25 Jul 2021 11:15:11 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id s24sm37770771pfg.186.2021.07.25.11.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:15:11 -0700 (PDT)
Subject: Re: [PATCH for-6.1 2/6] target/arm: Add missing 'return's after
 calling v7m_exception_taken()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c0859ae-ee1e-e000-1460-7f58a16a631f@linaro.org>
Date: Sun, 25 Jul 2021 08:15:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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

On 7/23/21 6:21 AM, Peter Maydell wrote:
> In do_v7m_exception_exit(), we perform various checks as part of
> performing the exception return.  If one of these checks fails, the
> architecture requires that we take an appropriate exception on the
> existing stackframe.  We implement this by calling
> v7m_exception_taken() to set up to take the new exception, and then
> immediately returning from do_v7m_exception_exit() without proceeding
> any further with the unstack-and-exception-return process.
> 
> In a couple of checks that are new in v8.1M, we forgot the "return"
> statement, with the effect that if bad code in the guest tripped over
> these checks we would set up to take a UsageFault exception but then
> blunder on trying to also unstack and return from the original
> exception, with the probable result that the guest would crash.
> 
> Add the missing return statements.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/m_helper.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

