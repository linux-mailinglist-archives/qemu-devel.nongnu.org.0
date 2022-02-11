Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99764B1CFA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 04:35:49 +0100 (CET)
Received: from localhost ([::1]:59844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIMiq-0002xq-J7
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 22:35:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIMgh-0001s1-Nz
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 22:33:35 -0500
Received: from [2607:f8b0:4864:20::42e] (port=45629
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIMgg-0000b7-4Z
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 22:33:35 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 9so11022144pfx.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 19:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lROn3cSfRDU8gI5izpOOqSipofUN8L8jNPRfpHEW2WU=;
 b=ZfgWIeMahKT+KhEu9m+m1MZJDOBIes/VBYvcuIg2EnYVK8E/J4Rmdi+mr4oWE5mvBt
 Ju+/D/JYoiCu16hdirIsJIT+z+MsddrMiZ4WQLlu+WOkhDek+U4YTV1zKcmP0W/+eJk2
 41R7bhU246BU48bdteFExE8ugF/jBagul3/fMlW+PA2QG9sdJwv6gOQW5ay+6PV2cnSm
 V2Pl0ljMnf14xM/MY7pXR+C4MBA42oPv33ouDvNXIB0hzxQnMX9qWNI4/KIBmCaJdANB
 1DbhZnwS+OMeyOg9yZlWppWAbzof7Y3AZKmjqfgU5yPkMYhxJ6LALBnMEO3h1VAL+OcH
 pUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lROn3cSfRDU8gI5izpOOqSipofUN8L8jNPRfpHEW2WU=;
 b=acbMoEmo7fvCM9qw4stJXgo4qeC4sTeWbitkwTl9wpRCCR/1gM0KvJ/RqANvmyHMkx
 EZ2esZd8d/m1ZtM1/ba/8dwhaw9N6hQkLN8Wn3cMf3dkgMYfZ872/5oxPUMxD9yJqqLa
 f1AP5AUPPUZMU4Rq9yJdQJBnDHgHX01vDxYhK/A8pMcAyBWL5TicD5V7rQyPYA9B62Au
 5NON93UbNjf6AGDKZLlTJ9ffPr+0RlHzeXVi40u2M2hx7H6D9sLzN+4o+YxE3msOJgki
 jkcMF2YLk24obMALOJLa85aE/anVA6z5cs+HGOmD5DODLKPSW3tyhXcEGQ6kkVnqSiX/
 2PGw==
X-Gm-Message-State: AOAM5335EH2ZVaSgrZWye9p3zUCqf+O53eSlI8smuJIDZ36AL8NM859x
 IFmv2SWro8ciferbryph2ANgDg==
X-Google-Smtp-Source: ABdhPJy9yhKq/WyREv/ih8vI6DLlgX8L20JCSmDa7IWrQaWuACbEeuFrMn4arUr+uYTgW9J/A3N+1w==
X-Received: by 2002:a63:6806:: with SMTP id d6mr8664368pgc.62.1644550412596;
 Thu, 10 Feb 2022 19:33:32 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y30sm4615791pfq.142.2022.02.10.19.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 19:33:32 -0800 (PST)
Message-ID: <d7694a46-8ed2-9e7a-feb1-7129a4aae0db@linaro.org>
Date: Fri, 11 Feb 2022 14:32:43 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Hexagon (target/hexagon) convert to OBJECT_DECLARE_TYPE
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220211033034.21107-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220211033034.21107-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/22 14:30, Taylor Simpson wrote:
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.h | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

