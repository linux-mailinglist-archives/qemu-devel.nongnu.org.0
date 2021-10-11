Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79D2429747
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 21:07:17 +0200 (CEST)
Received: from localhost ([::1]:36192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma0do-0002G3-UX
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 15:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma0cr-0001Xw-Oh
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:06:17 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma0cp-0007ym-Eu
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:06:16 -0400
Received: by mail-pf1-x431.google.com with SMTP id t15so1899884pfl.13
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 12:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mY5KLwTcu11mT63hmQyY3YPkkD2Bfczm0fE25RmyR6w=;
 b=u069f/UlPorseQtSgw4ilcFGsS35UKf4dMLYquIQx/T8o7FAbT+cBnjlDkUI9crHin
 powbaT7aR19+/SNnd5aFY+x1S6TDjkx2BhotDMXnYPXrJ5Hnhmz7pTs7SK1v34JnvJIz
 b6WW8584zY+pTJ02zWkaoWQNNg0P2hWqTHY/U+s1bql9kSI7CNFbKqamWE67A+nmKROU
 nHYLoRr8CRMmeK7MZIosYA20HBeceGravh8wyuUmuxym3VPfXAP/BG7AoJsHXHgHOn1L
 7g5/YHq9sr6mM3YC7u27p+f47WA9gtE+Fnt428DaF73nmUMoumOmyXoQ3egukbtigTRV
 aSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mY5KLwTcu11mT63hmQyY3YPkkD2Bfczm0fE25RmyR6w=;
 b=yY1YZAVp/geE634YF4eLmlqWjjMkmBzEKqG/AayknvPB+vcT6xwKt4VDRCHXSNtAiM
 rH5JNvJdGHbksXvNhljtE4objRAVziS15L3Xn2JkjIrdTKDWY2hEfI23HN0p/QuvY/2r
 0j9whd+Ce6OonPdJi6KzQR226iXh1KMHUZ+e9fCe8uJDv1iFpy8ubFTeY/E8zQIz1mvw
 9wPseDUkP2YGSb/RYIjy7aYzo6MIwxoJ83+c4gz17YQXJbWSBgxTSBnhMtL1Yvz97+IL
 Y7PNjtphAvV6O+ehZXATNA4WT8lpqdJ9N/xg6a2K4/kUMJ/tkSMDYhVUVJG0cbMSm1qE
 JUvw==
X-Gm-Message-State: AOAM531iTFY94WG0yMP+aUjoN2u2P20cr/a3A4/oTJqblFzuNpGZEp+N
 eJ6VjUMHvG3+7BVX4j5bzKl43g==
X-Google-Smtp-Source: ABdhPJw6HtOVoImUY3JUL0g02sxZGJP/F5IaXREaQQK9Nqe3cuUgoSvJ68OVAGOdiqdH8FHx5a70sA==
X-Received: by 2002:a63:4f56:: with SMTP id p22mr19627420pgl.134.1633979173923; 
 Mon, 11 Oct 2021 12:06:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm216625pjb.8.2021.10.11.12.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 12:06:13 -0700 (PDT)
Subject: Re: [PATCH 0/9] nios2: Enable cross compile and fix signals
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
Message-ID: <72265bb4-4173-9ce9-12d6-da2a115d34cc@linaro.org>
Date: Mon, 11 Oct 2021 12:06:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

On 10/1/21 8:33 AM, Richard Henderson wrote:
> Patches 2, 3, and 5 have appeared before.
> 
> The patch for the kuser page has been updated to use the commpage
> infrastructure, which needed expanding just a bit to handle the
> page being at the beginning of the address space.
> 
> Getting the toolchain built allowed the code to actually be tested,
> which showed up a few more problems in the testsuite.
> 
> I have already pushed the debian-nios2-cross image to gitlab, much
> like we did for hexagon and its locally built toolchain.
> 
> 
> r~
> 
> 
> Richard Henderson (9):
>    tests/docker: Add debian-nios2-cross image
>    linux-user/nios2: Properly emulate EXCP_TRAP
>    linux-user/nios2: Fixes for signal frame setup
>    linux-user/elfload: Rename ARM_COMMPAGE to HI_COMMPAGE
>    linux-user/nios2: Map a real kuser page
>    linux-user/nios2: Fix EA vs PC confusion
>    linux-user/nios2: Fix sigmask in setup_rt_frame
>    linux-user/nios2: Use set_sigmask in do_rt_sigreturn
>    tests/tcg: Enable container_cross_cc for nios2
> 
>   target/nios2/cpu.h                            |  2 +-
>   linux-user/elfload.c                          | 66 +++++++++++--
>   linux-user/nios2/cpu_loop.c                   | 93 +++++++++---------
>   linux-user/nios2/signal.c                     | 56 +++++------
>   linux-user/signal.c                           |  2 -
>   target/nios2/translate.c                      | 26 +++--
>   tests/docker/Makefile.include                 | 19 ++++
>   .../dockerfiles/debian-nios2-cross.docker     | 34 +++++++
>   .../build-toolchain.sh                        | 97 +++++++++++++++++++
>   tests/tcg/configure.sh                        |  6 ++
>   10 files changed, 302 insertions(+), 99 deletions(-)
>   create mode 100644 tests/docker/dockerfiles/debian-nios2-cross.docker
>   create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.docker.d/build-toolchain.sh
> 


