Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A227044D7B5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:58:34 +0100 (CET)
Received: from localhost ([::1]:55278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAb3-0005Ll-Cl
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAa3-0004fD-93
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:57:31 -0500
Received: from [2a00:1450:4864:20::42e] (port=35517
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAa1-00049V-34
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:57:30 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i5so10012627wrb.2
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 05:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=eAgc/SsoaeWsKC104WQEcLTKgKfBAOANOmiDmfOIY1w=;
 b=mCQ7Aqrogbs59f4us6W8+9TEDZ5z4DXluLAOznRSRrPUvhGvGqptn7vTfzwmXmEiEE
 suKui11Vp6zJyCt0JBc/CcVZgWTLrLy1qvsL8PIlxKE52tNK8D0zW+ZJTbhO+M0tRVTU
 2LatUIFs7tlP/Mfbrj0lb9VKctsvpqMgqF+aMYC7KEcUhTfdYqQaqubNZ8K5vbm+Kp4q
 D4bICSX+5zaFd9a3/H9F1nJEIu4fyziZ043LZubxncnigdFoZzsihkWeclW9gq2qym2v
 SegsgQzLj/2LPKxT7iWdfnHeS/rUs2sCYtXJd16tXiqObD92XBFLmy4lZMmauK98sKFb
 DQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eAgc/SsoaeWsKC104WQEcLTKgKfBAOANOmiDmfOIY1w=;
 b=FemCCXnqObwP2XtgYLac+88vahRp82kqAMJ5kxTw3Que0CCkU+TGIjCOfZSSYqF7uc
 KcBbWZB28JTVdRvkcgfXrqIIv8IGZNZMVZQUDZ1U6PUM36rV8ZdKdaKcXdekp7kbQQqN
 T7hekRUfxS24wLbxVeBiA4pA6/RogRCfo8gcl+TxVFheCYoMz1r8nnMqDiWaRqvEVOCl
 dvTR/zb2CRV+xb1RgtO296pWlQtEdx3LB/XQDWJPrVs4DTxIoM7+JeRmWS1w5k94kzn9
 PoLz+sDOpcL7fEmV0iirDYSLjsu+b5iX+dK5wjyUJLzLLOZa9XKivdkCFbp42kSLH40G
 X+aQ==
X-Gm-Message-State: AOAM530WLJB75vXjPWX2URhSyVfC9h5Hv/dj7pvi8W9aEZAtUSniKDWf
 TT8boTMbEjM9ThSqxAYL2NO3CgH4ZH3c8/fQvt4=
X-Google-Smtp-Source: ABdhPJwbwXASzkN3gMUs4RD2iK7DKnPS2xvkII5fWj3v211MSqd2b0TpPrQSNL3ayOR1HpdfZszo5g==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr9423699wrp.20.1636639047481; 
 Thu, 11 Nov 2021 05:57:27 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id l18sm3095049wrt.81.2021.11.11.05.57.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 05:57:26 -0800 (PST)
Subject: Re: [PULL 0/4] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211111110656.237727-1-richard.henderson@linaro.org>
Message-ID: <7d3ab0f0-236e-8b79-864a-b6d5b6f09ae4@linaro.org>
Date: Thu, 11 Nov 2021 14:57:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111110656.237727-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/11/21 12:06 PM, Richard Henderson wrote:
> The following changes since commit 1b9fc6d8ba6667ceb56a3392e84656dcaed0d676:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-11-11 09:56:22 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211111
> 
> for you to fetch changes up to d58f01733b94845b0c2232018a2bedb6a2347ec5:
> 
>    tcg/s390x: Fix tcg_out_vec_op argument type (2021-11-11 11:47:58 +0100)
> 
> ----------------------------------------------------------------
> appease coverity vs extract2
> update docs for ctpop opcodes
> tcg/s390x build fix for gcc11
> 
> ----------------------------------------------------------------
> Miroslav Rezanina (1):
>        tcg/s390x: Fix tcg_out_vec_op argument type
> 
> Philippe Mathieu-Daudé (1):
>        tcg: Remove TCI experimental status
> 
> Richard Henderson (2):
>        tcg/optimize: Add an extra cast to fold_extract2
>        tcg: Document ctpop opcodes
> 
>   docs/about/build-platforms.rst | 10 ++++++----
>   meson.build                    |  4 ++--
>   tcg/optimize.c                 |  2 +-
>   tcg/s390x/tcg-target.c.inc     |  3 ++-
>   meson_options.txt              |  2 +-
>   scripts/meson-buildoptions.sh  |  3 +--
>   tcg/README                     |  6 ++++++
>   7 files changed, 19 insertions(+), 11 deletions(-)

Applied, thanks.

r~


