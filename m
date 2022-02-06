Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECE4AAD3C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 01:40:37 +0100 (CET)
Received: from localhost ([::1]:57060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGVbU-0006v5-P3
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 19:40:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVXe-0005do-HE
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:36:34 -0500
Received: from [2607:f8b0:4864:20::1031] (port=43732
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVXZ-0003Xo-KO
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:36:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 v15-20020a17090a4ecf00b001b82db48754so9786629pjl.2
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 16:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mJV87jR44Sj2MdMx3n5e8ielNmhUC8TJ1aKp7oJYSg0=;
 b=UdWdQgACpmVmXenae+E+HadNAtMYhvH1wiZybJeDYbtK6Upq6ZdEPrjZ74wPH6SCiG
 FouGIVubcLpXz95l7DnjNWug5qOR+k7LQZPGAx/g3bKF1aosAhz8Iz0Oflr8TFEIaGZa
 PSaTwciumq3ZNNuOEQyE2aCFtZraci004/PxPENfe5HD0Ir4dcqgMN+esqiFAfRg+cw6
 upga21isUKs1gqf7Z8yLZnEitsW/KIkYFWZuPMQtmUBYH8L5d8Q+FcH536XhPJzdltld
 sGlz4cqle7NGytX4tzr8YarPD8fo2PtP2gll0C3Yt8Xhrlv8EnBYpW1vw4+k4/PkeZfs
 s2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mJV87jR44Sj2MdMx3n5e8ielNmhUC8TJ1aKp7oJYSg0=;
 b=wcmeedor8VExd5q9hTQ8QcVnLHITirPIb4+1XXXtZP3ZnuxFvGl91znIL08PLxOv0r
 l8ABeSw1qRbu8O/LhJ6QAWWGzKYwuuAzwQZyPuNZyWp2keZFUd14QXEx0+iQWGsYqJx8
 42/gWlmvgPXQITEbbdSPc5H7Uw5lxjYJjExl0mfnAltdeRs1eZuwDvFV5USsnylRtzA1
 TlbnPYv5AZuwWUUyZ0RMI593PDrv6wNzDhrKEyLkRJ6m5ZJndygWzg6ccftInbBT/Pz6
 wvzPjAuvox5aAWg23tkBdrp6qkND+DpTE/lZp01Qd9nnC/Y/FN/HBFu/FglYgz5m2uup
 Acwg==
X-Gm-Message-State: AOAM5308PZMl0bh6YCZZ0PbUFHtW4tVcpwC25kCs9a79e/SRLoJncvqG
 HrZeyLT+jH6SZTXNcxPJGSn6uw==
X-Google-Smtp-Source: ABdhPJwg2Lnj14Kn24Ve3X02ym6lyor55guSPPOt6u+SaJw9IvO6Wk0Vv2h1vjv0sGc7X68A/MrMaA==
X-Received: by 2002:a17:90b:1187:: with SMTP id
 gk7mr8850502pjb.199.1644107787801; 
 Sat, 05 Feb 2022 16:36:27 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id nn5sm5889292pjb.2.2022.02.05.16.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:36:27 -0800 (PST)
Message-ID: <a5fe4228-fb40-607b-8c07-0ae79e4d0c43@linaro.org>
Date: Sun, 6 Feb 2022 11:36:21 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/ppc: Change VSX instructions behavior to fill with
 zeros
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220204181944.65063-1-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204181944.65063-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: danielhb413@gmail.com, matheus.ferst@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 05:19, Víctor Colombo wrote:
> ISA v3.1 changed some VSX instructions behavior by changing what the
> other words/doubleword in the result should contain when the result is
> only one word/doubleword. e.g. xsmaxdp operates on doubleword 0 and
> saves the result also in doubleword 0.
> Before, the second doubleword result was undefined according to the
> ISA, but now it's stated that it should be zeroed.
> 
> Even tough the result was undefined before, hardware implementing these
> instructions already filled these fields with 0s. Changing every ISA
> version in QEMU to this behavior makes the results match what happens
> in hardware.
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> This patch is a proposal on a previous RFC I sent on this topic [1].
> I preferred this approach because it makes QEMU behavior closer to the
> real hardware.
> 
> The affected instructions have the following note in the ISA:
> 
> """
> Previous versions of the architecture allowed the
> contents of doubleword 1 of the result register to be
> undefined. However, all processors that support
> this instruction write 0s into doubleword 1 of the
> result register, as is required by this version of the
> architecture.
> """
> 
> This patch is not exhaustive as
> 1. some instructions that had its behavior changed are not 'corrected'
>      by this patch (mostly multiply-add instructions);
> 2. some instructions changed the behavior to also replicate the result
>      in the other word from the doubleword if the result is a single
>      word e.g. xscvdpuxws. So, this patch only focus on the 'zeroing'
>      part, not the replication;
> 
> Best regards,
> 
> -- Víctor
> 
> [1]https://lists.gnu.org/archive/html/qemu-ppc/2021-12/msg00198.html
> ---
>   target/ppc/fpu_helper.c             | 26 +++++++++++++-------------
>   target/ppc/translate/vsx-impl.c.inc |  4 +++-
>   2 files changed, 16 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

