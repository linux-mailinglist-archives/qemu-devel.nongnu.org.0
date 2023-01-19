Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88E673F5E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 17:56:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIYC3-0008Bc-E1; Thu, 19 Jan 2023 11:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIYC2-0008BU-6q
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:55:14 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIYBz-0001Ns-Qy
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:55:13 -0500
Received: by mail-wr1-x436.google.com with SMTP id h16so2448231wrz.12
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 08:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I1MWHjIBjbxbMGNgx0aRTifupFBpK1b8M8CTzalvPmw=;
 b=ZDyY+t00q3ND4GQdcp33gh3dU0uyPkt38Em7YysKIWhqlmQ9OcRzmGPH6fdPjRMVQr
 ekXrTxZKnLt9pM5qko4y7sTBwkdbCRReEdIJTOUdvGK5jGNNa3Lp90TLPjy5aUqiKxIf
 cONQJXBEE/Fyjmqn1hYW8Tf32aUnqRnk9Xtp2jXX54InzeDA20TWeH5w+LILQ2+BTwQJ
 /JJ07sn8z6qMaL4oP7aTt6fpquFhj6DNmoXiLT6yu2SiDmfqzvMCkbhrD6vZMTZMZYTZ
 5OVffJfz9xnVp5CSj01Gx8zN4LPuOgbAsuyxtPLIkCjCNesaSuNSLgxvPO6eiJ3oLrSp
 LL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I1MWHjIBjbxbMGNgx0aRTifupFBpK1b8M8CTzalvPmw=;
 b=Cg4b0YW2+4u7Hw59DhZDlJ15JOOZPxGeOxE8yJHOLMYOIe4DYsh3KjfB0IcY3YosC8
 xrL54AmvxAfmXJcni1hIBhj5xvpYeqSCwaxeuzyG/kkXFEP5yfRMhkdB44cBg5sgDWTx
 +tuBhEcwXRtNox+N+TKkc1FbOpX5EqBCYxIuhDkbBKy/HffyG+QkxKgSdKdDbV3zOyh1
 nj5kBSrWWAwagDxGBACacZZKpMaRib2p+wgmuUQi5g282yqrZybHAGAuHXY/udC5gfX1
 8GdS3AQVAgsyi2WktxNa8/k0atHkPQO7vLSmOa/AnClQTz0i4FFXvk3Fbcl7aXMSo9J5
 yC1g==
X-Gm-Message-State: AFqh2kokS5ZgCGmTYYPEyVvxdDWZJ6GKb/Vi5eePH/201XsboYgNr1z3
 CgFywq5zwE6CyIt/5xKRJ2zEYw==
X-Google-Smtp-Source: AMrXdXskzL1ukmvdyoiGITdviAmOVPGVWwD85z30++vfKjuaIQrKF4ucPvMRgh3jdVYLkVpi1ScAPQ==
X-Received: by 2002:a5d:65cc:0:b0:2be:493f:3b2d with SMTP id
 e12-20020a5d65cc000000b002be493f3b2dmr1817324wrw.10.1674147308006; 
 Thu, 19 Jan 2023 08:55:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y15-20020adffa4f000000b002bbec19c8acsm29285137wrr.64.2023.01.19.08.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:55:07 -0800 (PST)
Message-ID: <87dcde43-0531-658d-94ae-2595f560d4c8@linaro.org>
Date: Thu, 19 Jan 2023 17:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tcg: Mark tcg helpers noinline to avoid an issue with LTO
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, idan.horowitz@gmail.com
References: <20230119165006.742073-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119165006.742073-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 17:50, Richard Henderson wrote:
> Marking helpers __attribute__((noinline)) prevents an issue
> with GCC's ipa-split pass under --enable-lto.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1454
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> Idan, please give this a try.  By inspection, it fixes the issue
> with s390x's helper_divs32 function.
> 
> 
> r~
> 
> ---
>   include/exec/helper-proto.h | 32 ++++++++++++++++++++++++--------
>   1 file changed, 24 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


