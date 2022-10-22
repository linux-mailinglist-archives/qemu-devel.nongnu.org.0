Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18844608B21
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 11:50:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omB0a-0002D8-FL; Sat, 22 Oct 2022 05:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omB00-00026w-Ei
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 05:41:00 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omAzy-0005gU-NQ
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 05:41:00 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c24so4431203plo.3
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zgzrIZ2L/N/KSO6yhxUpqP+H60zaGNCzHTytTB68pGg=;
 b=gFcbjFflB0tNRZt+Ua3aXDQk5EOpLqeyG7635TiIysE895YUc2kHV+E9bWseUz1zUB
 jqNKDDtNYBGk34L89tUxqGB3HqMQDqrm9ZSXOP2o6krX4fSJZrrcBiSa8olTFcAbqv3L
 HVIlH/U/KxiAv6UDEjK+AlzuXxcK3R3Crmnbq3CiGcjtAGp3uNqQ6zxPeUbRDqKCXOz/
 mvKvhDd8QP11aj2n4hzJ6qqk+77Iue4gV9YCcmhf8t0IaxUwmjKlg5w1i3JICaCI66ct
 EPJtfVi2cX/lXuc8yLmiEZcJguRSBPt0Kh4HzmABPnbF5V97W9Dagd2lGZzhag1xKxqh
 +ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zgzrIZ2L/N/KSO6yhxUpqP+H60zaGNCzHTytTB68pGg=;
 b=IjJoSaY5ss4vDy8jvPwNBVWvgG+hQKI0Cd0GgQsakO+HtKTuOM1RRSV9KMxTvBU7oj
 jDYd5uLkoPjn167Q/4Y/RWrfa6HjBXJevziCwccmfY7AgaGtPUXponvvcrgBRs/8/ScE
 7GtwEmtSdg3na1XOw+hvAV+xa88NoD8jMrAvxpa5cZ1BmRUICHWP1neQUw+NRnMb0XT3
 Sm/x57W/1RhLJSN1HzOWK0c+ss2AOK4tpKUotnYeer4W6QiEKYDiheaxoxIhrTdU3sHO
 ByR9uhbx1maqwuHY8ZGYmHYi2LM8qeLY6AEyZtFxH4MENoayOP0MDqfCqGaQmGCiVoto
 VdjQ==
X-Gm-Message-State: ACrzQf0FG/w+LrEe6VfpNuIdlrxrmCCYeetJ6xw7j9Pd4pYJKPruhw1M
 9mh2tQoeBNk6S4yxb/S5xUXjpA==
X-Google-Smtp-Source: AMsMyM5loQBgJQkWpzECMaoCr+eUCMwODlM+ci1XMo7L9OnUgeeBrg64FauKGD2XpYU1KgxAxdG+ag==
X-Received: by 2002:a17:90a:c782:b0:202:c73e:5488 with SMTP id
 gn2-20020a17090ac78200b00202c73e5488mr61812944pjb.202.1666431657125; 
 Sat, 22 Oct 2022 02:40:57 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z24-20020aa79598000000b0053e4baecc14sm3465921pfj.108.2022.10.22.02.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 02:40:56 -0700 (PDT)
Message-ID: <321f6e49-8370-07d1-47d3-53267e7dc4d3@linaro.org>
Date: Sat, 22 Oct 2022 19:40:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] Revert "accel/tcg: Init TCG cflags in vCPU thread handler"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org, Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20221021163409.3674911-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221021163409.3674911-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/22/22 02:34, Peter Maydell wrote:
> Commit a82fd5a4ec24d was intended to be a code cleanup, but
> unfortunately it has a bug. It moves the initialization of the
> TCG cflags from the "start a new vcpu" function to the
> thread handler; this is fine when each vcpu has its own thread,
> but when we are doing round-robin of vcpus on a single thread
> we end up only initializing the cflags for CPU 0, not for any
> of the others.
> 
> The most obvious effect of this bug is that running in icount
> mode with more than one CPU is broken; typically the guest
> hangs shortly after it brings up the secondary CPUs.
> 
> This reverts commit a82fd5a4ec24d923ff1e6da128c0fd4a74079d99.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops-mttcg.c | 5 +++--
>   accel/tcg/tcg-accel-ops-rr.c    | 7 ++++---
>   2 files changed, 7 insertions(+), 5 deletions(-)

Sorry about that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

