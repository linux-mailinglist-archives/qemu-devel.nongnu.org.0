Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF694AAD17
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:49:56 +0100 (CET)
Received: from localhost ([::1]:40864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUoV-00007Z-2T
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:49:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUnQ-0007EF-03
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:48:48 -0500
Received: from [2607:f8b0:4864:20::629] (port=46999
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUnN-0005Z6-Pm
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:48:47 -0500
Received: by mail-pl1-x629.google.com with SMTP id t9so6114966plg.13
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dkYoeM2PNsD6qNUeSR4it4xo8soGQ2a1YMZAa6/BiJs=;
 b=tId87fXoNefyyGq4ZJYEV15fzeXytBbbQYqlC3jFcSc7XEhxDsleXvI3fQP7TsauVh
 mj8vofzxmYcZapf75ZsEO2Zq4YsxdS0Mx+pVONhbRbov1jEkEKq2obpYVMR6FfEIAX55
 csqqUaPlO1/yABWQRzdl1kNxmpIN7xNsadiOfr2Z6AqH1YLTNV4yTxKxj3BA21tUpkIB
 ekid4SpVKBdXZvXyr64NGl5PZtNM4kZ/mgMZ7hRvXDzw7hPcazZBjsdjxHaSVAIFnMUf
 g+Ttiwj2SaI4ltWexBBcRfQZQiGLqJNSjCNdX/SMslYaNEQtq4xllb9+Th5egKYTv7oy
 GMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dkYoeM2PNsD6qNUeSR4it4xo8soGQ2a1YMZAa6/BiJs=;
 b=B5IBLhmEt8VfjzbluHYtiW3Lvcy8453l9oymBNrsWMvDeMeVDVgsF5gITnT6HPDBMc
 CD3ScxFw2L4GnBixiocCK8I/9MpuG1x9XHlK82as96tbvOR+6HFC5Ok3jzdHK+iS18F8
 b7Gm+5uhKKuRFv4YDgJe4Cmvs4lUV6K6sCGYGphmtLR54L24voHyoFmx26UbKc/WD/Jo
 UrCI/yyD8sDM1x4e+vH962vFxRMcdlxthWT2XJLtNt7TXTHXoD/j6TXSQ6RpA3u9cmg4
 HA3iokmf9/tDrssxwEQE4P60hOVq4Ievld9PiTRHjsDRdJKFEbiJfOg5FkBkMKfcJLa5
 bywQ==
X-Gm-Message-State: AOAM532iqmVpcFrZi8maJDSeeqyGN7oDNl7yy1fGw53MBBNDrzJ2OvpQ
 PVbPTGsEYMyDyn8/QNCMRpHdmA==
X-Google-Smtp-Source: ABdhPJwpdFWdUsj0oG1gC8wskv5hVYdNE9/2A9VgeF29QbrO2UE5Kd1TwKs5mLmw/iyQGx8L2aBmNQ==
X-Received: by 2002:a17:902:e746:: with SMTP id
 p6mr9866784plf.78.1644104924550; 
 Sat, 05 Feb 2022 15:48:44 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id u2sm7421508pfk.15.2022.02.05.15.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:48:44 -0800 (PST)
Message-ID: <630496e2-4602-e5ce-4d4f-4c3e1d992f2a@linaro.org>
Date: Sun, 6 Feb 2022 10:48:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/10] hw/remote: Add missing include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203193803.45671-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:37, Philippe Mathieu-Daudé wrote:
> Currently "qemu/error-report.h" is implicitly included, however
> if headers in include/ get refactored, we get:
> 
>    hw/remote/proxy-memory-listener.c: In function ‘proxy_memory_listener_commit’:
>    hw/remote/proxy-memory-listener.c:183:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Werror=implicit-function-declaration]
>      183 |         error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
>          |         ^~~~~~~~~~~~
>          |         error_report_err
> 
> Add the missing "qemu/error-report.h" header to avoid that.
> 
> Reviewed-by: Jagannathan Raman<jag.raman@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/remote/proxy-memory-listener.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

