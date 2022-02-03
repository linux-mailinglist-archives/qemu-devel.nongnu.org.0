Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FE14A7EAD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 05:28:47 +0100 (CET)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFTji-0005KU-Kv
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 23:28:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFThm-0001xR-4n
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:26:46 -0500
Received: from [2607:f8b0:4864:20::631] (port=39694
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFThk-0002UM-AB
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:26:45 -0500
Received: by mail-pl1-x631.google.com with SMTP id x11so1137792plg.6
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 20:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iRCM7mXXnZuVOqkcLrXXLcCpWi6KRthzXINHZrPDhAI=;
 b=RS+pRBT7YwVg/wyNiMPrM8kX+Yj5QMy9r9fnaaCBmnnw9j6vvcfBAfgVMPMG4GQdA+
 MyOwnD4PQsE/ogbGbQocDwjnu1kPFoBXRdwlPCDzt3Vh0E+k7VfDWJZzLHMBoGuPK8l8
 nhmGD5/mjNL8eJOvWiPyqhgSkP+gQSiWGuFc/0I7vR3O4g+sdAR6U/rNSbdLptPYGodn
 7XDupEmphlAhJcqDkTyMe3NtCabTwlwSxbbUpj+jwG/IzDBzu931i3rB70p9K+c9yp6v
 zLvTczlAfWpKJf5NrwU8ktO4/u4oOKcSRWWt5C9FXttxiQCjlTm8ploZWrPPRHET1QAy
 8WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iRCM7mXXnZuVOqkcLrXXLcCpWi6KRthzXINHZrPDhAI=;
 b=njz/JTW3h9gLj2B7uv+uG2Gg9CSHyNfj1C4YLU5vGda3xeIwrtqKe90QsuXtcB/zLb
 jT3NtIzr8m0e+AgOFcE456WK2PByfNop8wLTSPecbttbtDGBru+pFC3eNuBIvEMO4rSc
 4pW3URJzWkDSyky3HPz2Qh/0MrDT7huWvSThDuucs76jAvelBsTZuQH5izfar7xsY3HY
 J9BYW2dlb4m+M91irZgTO8DBSt/eX6/IjwCj88tPh1kEUz7uhDhReLUY0b9KhUBQKSIH
 Ghjvm87BbfeUJIKqsuyijFBVicibCjeceiPsWyeGwBUmLwZKg5c9qtkZuUiBJFMw/ulp
 uYzg==
X-Gm-Message-State: AOAM533oPXWZvCIqp+9d5n0Bv4b8YYVajHBWS8efoEmmQHLTa/WbNLYv
 lRbwJGbq8Hfz4VeZyWCjamC0Xg==
X-Google-Smtp-Source: ABdhPJw63O5rF2Uh4AoE1qfQXGIfNR5inEsx0ZxMwJBSoRWkZNK37vfgeHXQR9S3tpfl95iM7gLMWw==
X-Received: by 2002:a17:903:41ca:: with SMTP id
 u10mr28240821ple.71.1643862403015; 
 Wed, 02 Feb 2022 20:26:43 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id p1sm18421831pfh.98.2022.02.02.20.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 20:26:42 -0800 (PST)
Message-ID: <c1a0c0b5-2d91-ca81-d3dd-77fa8250f278@linaro.org>
Date: Thu, 3 Feb 2022 15:26:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/13] hw/intc/arm_gicv3_its: Split error checks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:32, Peter Maydell wrote:
> In most of the ITS command processing, we check different error
> possibilities one at a time and log them appropriately. In
> process_mapti() and process_mapd() we have code which checks
> multiple error cases at once, which means the logging is less
> specific than it could be. Split those cases up.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 52 ++++++++++++++++++++++++-----------------
>   1 file changed, 31 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

