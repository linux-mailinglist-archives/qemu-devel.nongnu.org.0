Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EDE4119FB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:42:30 +0200 (CEST)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMNB-00034T-Pw
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSM7B-0001Lb-Or
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:25:58 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSM78-0006F6-Q1
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:25:56 -0400
Received: by mail-pf1-x432.google.com with SMTP id m26so16761353pff.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=e+2yzMu6gjD553hBKuzERoiXfzqi3ZztAa42/O9RWHg=;
 b=Qjh30zAKGs0vkWERh0Yt8cWBalCs4TfHe3AKIg9sNVYUa1smbfxkHjlniSqh+Jz4UK
 JOytj+LSUXFd3G/WEnBuWG4Hj/0oqlt8liRXNabHMea0jkd1kBK5FOV9M7Xgqk97HWps
 VpMZfbW+XoJ7GcwvEjxR1OJFC4Je5vOmZWZfNXcIa7U+trwF1BbwW9oW4qKk1FcSST8J
 Ph7llJiXF0nub8ILAuwtpHL5C1FfVNM/O1ghiOmgg/zAEs8W+yaM6tJwBzOKHqGIS1Eu
 +TS972+40gQVBRroiUHlWgJus2zxwfiESbI+cspPV0XLCQkA9d5pq9S4m+bUw2x9gtXe
 IIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e+2yzMu6gjD553hBKuzERoiXfzqi3ZztAa42/O9RWHg=;
 b=BJLgJaHG+nYA4Q35N1KMh8OaL7GJlx7jvntaCGQzBGw9FHzlwC7LrCLb9VozHgdsWm
 kxs7QJmosk46mfGYWvzuxkrv2rJqB2l6/A/sBUY2T43QctHpp83ObCSd+6Vx7pCcGZ98
 RFf3uxrkzfPSkFh+WMFnHK+Ap6DyJBo3Rej19fVZf7137DhxJNZ12VDrHFMxtm4mfINC
 2jyCsj9qEubUe0b6nCcUn3fFvBayM5nNBY27qNhgoaIHk0RiJQdvXEUvcaLQSDJ0DNSK
 5JZ2NLQYaTmB20Q61Vp3LngEe7sgjGBSHMgqa7NVwx4QlcWDquDrdsyirJihFb3apslW
 q9sg==
X-Gm-Message-State: AOAM530+QHiGOwA+/C3tXM2E2ByHVMBiCsuIGd5x6KZZjZ0lcGjC6uoZ
 veMct4Q7jsulG8iYfJg9yPaxAcjxVQ1+Yw==
X-Google-Smtp-Source: ABdhPJwvDOFqRiL9yV1MB6M2bcCXUrgZK8+dF2LUgQlFZ122UYJ07g43Ls2eynyuLvw3BEx2layb+w==
X-Received: by 2002:a62:7b16:0:b0:443:56c4:33dc with SMTP id
 w22-20020a627b16000000b0044356c433dcmr22475852pfc.47.1632155153323; 
 Mon, 20 Sep 2021 09:25:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e15sm1110pjl.11.2021.09.20.09.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:25:53 -0700 (PDT)
Subject: Re: [PATCH 03/30] tcg/loongarch: Add the tcg-target.h file
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-4-git@xen0n.name>
 <c5104c22-e09f-d8b9-3429-fec2c52a7494@linaro.org>
 <c43cba8a-0b05-a2f2-9537-a38bccf57c87@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0657d67e-6d8d-f05e-a10f-a0d82f2420a5@linaro.org>
Date: Mon, 20 Sep 2021 09:25:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c43cba8a-0b05-a2f2-9537-a38bccf57c87@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 9:20 AM, WANG Xuerui wrote:
>>> + * Copyright (c) 2018 SiFive, Inc
>>
>> You may have copied too much from the riscv port?  :-)
> 
> First of all, thanks for the *extremely* quick review!
> 
> As for the copying, I admit that I thought the riscv port generally was doing things the 
> recent and preferred way, so most of the logic are only lightly touched. However the 
> LoongArch is substantially similar to riscv too, so much of the traits expressed here 
> would be the same regardless.
> 
> But in such a case of outstanding similarity, should I just drop my "copyright" line? I'm 
> actually okay with dropping if that's the best thing to do.

Yes, your own copyright is the correct thing in this case.


r~

