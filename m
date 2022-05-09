Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CF552061F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 22:44:32 +0200 (CEST)
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAF5-00036y-EY
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 16:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noADV-0002Dj-1q
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:42:53 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noADT-0002xa-B7
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:42:52 -0400
Received: by mail-pg1-x536.google.com with SMTP id k14so13022222pga.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=JUQ504MnQHGnlG80Ce1nCg0VwTC5aoJxM7f014+HvOw=;
 b=Ag7ev+ctd2hEGpmSHt5miOeUD05G3j8vmXWOXfvjlWv9tsHThea6RB5PJCgOnhITf7
 MUwzz7co/MeuMV27yLTRRJA5pplPW9hjJYUG79djXniW9hC/g8ykk3RsRIHyV0NztvpY
 DQdWmrv+QZTwwndszbtdNoWtdV2300xAbp+zRixPL8zwdSbmBBk34lT6zsZOz9oLX0lu
 73pe4IVIk8/sh+D0g9RktuYBnG3mopJ/b8cZoCdF5gWl3GoYXhJNJJWNsA0GKZaTtMi3
 qmfR9yxOvYQjRgj4zUw+uSw9S215j07GgRYkwp64QWH+dfy58drrXieOZM7R6tX2YRLZ
 iv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JUQ504MnQHGnlG80Ce1nCg0VwTC5aoJxM7f014+HvOw=;
 b=Y4fhq9/T8Fngxr42M/Ae7M3uvJCVDKloeMvI/5NDWmrD/3jH3d+gUy7OgVbfbfG1Uc
 Qlr55258m2SjxaGDs7PyaKeAYeD4p8GTDyrAE77kTtx2Vabfjxa+HUXdgkxINbA9fvwc
 whU5k2GV5KxQfB8fU9m79ShjsSnBQnF/LJ2VzdOT7LAVkHlXBcbJFIAVM103j/hhE08A
 qk7wAR8Oe9qoCUiCMlcguPbus7ct7mOY1HxjW1MCnD+XNJB8cbHxLwnx+ZRDGaeUtmo+
 NZq+N0sNHk+NKsBbuj8nWzKZzgY164QRjOajbTMKfNjqf7GenTD2xxd2Ck0nipWeLgzf
 EU+A==
X-Gm-Message-State: AOAM532S8LMP+X+4v4uXy1lhPQ8r7nYo4HdMVoS4INaseWxsphZLjU2g
 SWndGLG9aEwvr3e34P2tCsEtlw==
X-Google-Smtp-Source: ABdhPJwdLIyWsPA4U9Cd2PLnARBREmDjBjot7jglxwmEWIpbdiKbhYvd5tjqDfk15vAP9KhKTziz0Q==
X-Received: by 2002:a05:6a00:21c2:b0:4fe:81f:46c7 with SMTP id
 t2-20020a056a0021c200b004fe081f46c7mr17332545pfj.5.1652128969850; 
 Mon, 09 May 2022 13:42:49 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 z29-20020aa79f9d000000b0050dc7628170sm9099010pfr.74.2022.05.09.13.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 13:42:49 -0700 (PDT)
Message-ID: <517b84ca-a27d-c79b-b649-b8358ff60857@linaro.org>
Date: Mon, 9 May 2022 13:42:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: Drop unsupported_encoding() macro
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220509160443.3561604-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509160443.3561604-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 5/9/22 11:04, Peter Maydell wrote:
> The unsupported_encoding() macro logs a LOG_UNIMP message and then
> generates code to raise the usual exception for an unallocated
> encoding.  Back when we were still implementing the A64 decoder this
> was helpful for flagging up when guest code was using something we
> hadn't yet implemented.  Now we completely cover the A64 instruction
> set it is barely used.  The only remaining uses are for five
> instructions whose semantics are "UNDEF, unless being run under
> external halting debug":
>   * HLT (when not being used for semihosting)
>   * DCPSR1, DCPS2, DCPS3
>   * DRPS
> 
> QEMU doesn't implement external halting debug, so for us the UNDEF is
> the architecturally correct behaviour (because it's not possible to
> execute these instructions with halting debug enabled).  The
> LOG_UNIMP doesn't serve a useful purpose; replace these uses of
> unsupported_encoding() with unallocated_encoding(), and delete the
> macro.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a64.h | 9 ---------
>   target/arm/translate-a64.c | 8 ++++----
>   2 files changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

