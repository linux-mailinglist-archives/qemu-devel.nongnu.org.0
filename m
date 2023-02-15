Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC8B697EF1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:58:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJE8-0006GE-9I; Wed, 15 Feb 2023 09:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJE6-0006Fq-8h
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:57:42 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJE4-0002eP-Be
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:57:41 -0500
Received: by mail-wr1-x436.google.com with SMTP id r2so19433996wrv.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UG0ZD9PAAkLYKsZxK0Y3oxn4AgQyCn5eh6r1f6BmtW8=;
 b=oFmyRccy/1nqATnrtZTcGCoXH61pnQEVSlphpJvsaBnLIjfdTaeQUoKZkGm0MGJ6aC
 vY3m8tjHdCDEySEjiQjl/J+X+9GMyFYg2+d9czmR7Aek9siqEjgb3PoGik4kx27VJieK
 MYmKMRw5ew2HTtU2Owbo/YRnhHbyejdlXyDrPChNnlkRrh1NRqsdlJVHqJZ0CB+nzY8P
 URWhYAp6g72+E3wSHZlA+mUQEpYBKdpUJSQBQvkuTfKa5H2rk1yjhqOJlEzf0gxjHbzd
 MA4sFhwPGMBMtbWvyyljl72VsqNjh6Z439nliZcYmL8ytclf1x8vNbF7W79Tv7xUNPCK
 qj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UG0ZD9PAAkLYKsZxK0Y3oxn4AgQyCn5eh6r1f6BmtW8=;
 b=hY4UZjTBEylx34bbRsQOsMohLPLFR9TCdDcsnyarTf4OkoWUpihbDmT0gKwkZo5Xd4
 2iIY0lr4QPX/o6hCd2LR0M3AHzOLLQIsV4uG6dOcBeJXDUh47sW+0xz976RjN0ZOhI+D
 IwlOucNuHKcNlxTs4U/R3ir8wmgBCILo7m3TIQZaN8mbqcz+Bx+vX1xVjlD4WwshVqd+
 067QjmnNf71NY7nxx3ia1sspS/GZzJP26C/SxVcDLdfpXMG1L2nkSOnD3dga5+kUToEv
 Jh+Iif6bTXFgHXgpcfNtWZtBNrnOreFG32x1Xu5R+MauF/HzkJTtJIni2pi9GX8ohOHM
 iMAg==
X-Gm-Message-State: AO0yUKVyeIdK7UwR8zinVMDVRiTvWhK1IT7ITjckq0SB1jiuwNrz/SYA
 G7+FKsKNXnEVBLik1fp7u6S0pQ==
X-Google-Smtp-Source: AK7set93K3AhgRK0pSeYgAYqGzSQ9gA79WArutoNCTGtcWPTcclHYUT9JbRJCPHzutOE5n4z+VvgcQ==
X-Received: by 2002:adf:e5cb:0:b0:2c3:f4bd:2582 with SMTP id
 a11-20020adfe5cb000000b002c3f4bd2582mr1694291wrn.46.1676473058767; 
 Wed, 15 Feb 2023 06:57:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k6-20020adfe8c6000000b002c55551e6e9sm8906121wrn.108.2023.02.15.06.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 06:57:38 -0800 (PST)
Message-ID: <32f0a378-2ae9-c711-19c8-837397c87c4a@linaro.org>
Date: Wed, 15 Feb 2023 15:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] gitlab-ci: Use artifacts instead of dumping logs in the
 Cirrus-CI jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230215142503.90660-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215142503.90660-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Thomas,

On 15/2/23 15:25, Thomas Huth wrote:
> The meson log files can get very big, especially if running the tests in
> verbose mode. So dumping those logs to the console was a bad idea, since
> gitlab truncates the output if it is getting too big. Let's publish the
> logs as artifacts instead. This has the disadvantage that you have to
> look up the logs on cirrus-ci.com now instead, but that's still better
> than not having the important part of the log at all since it got
> truncated.
> 
> Fixes: 998f334722 ("gitlab: show testlog.txt contents ...")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Note: I also tried to publish the junit xml files as artifacts
>   instead, but while the cirrus-ci docs claim to support it, I only
>   got unreadable XML output in my browser that way, so the .txt
>   files look like the better option to me.
> 
>   .gitlab-ci.d/cirrus/build.yml | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
> index 7ef6af8d33..a9444902ec 100644
> --- a/.gitlab-ci.d/cirrus/build.yml
> +++ b/.gitlab-ci.d/cirrus/build.yml
> @@ -32,6 +32,9 @@ build_task:
>       - $MAKE -j$(sysctl -n hw.ncpu)
>       - for TARGET in $TEST_TARGETS ;
>         do
> -        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
> -        || { cat meson-logs/testlog.txt; exit 1; } ;
> +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1 ;
>         done
> +  always:
> +    build_result_artifacts:
> +      path: build/meson-logs/*log.txt
> +      type: text/plain

How long is that log kept available?

