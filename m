Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25B358721
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:27:11 +0200 (CEST)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVck-0005vM-QG
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUVb4-0004tn-8q
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:25:26 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUVb2-0001T6-Kx
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:25:25 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d8so1125335plh.11
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZFnbHYILMcI/VEmTPpT71qfojBQq5RkqI/zyNRTGWwE=;
 b=bVsm12VBGDYBAOiNIsFHwGKi128vH4KrJmaH/wPMuTIEMn1Mpg4s8vp1n1qaAgH05K
 xdCjewBu3cS7pXZvwKNW9nV5n0Yj9atXgFlEnjn03ffjqI5lvuJvScBlxAidT8YEzjDU
 KCFgKrC9KZWOqNwNg3iVf6u2/3KBhM+DForWtONsVTWXa9iQdunLox9r6Mi1Juse0Vvr
 LxonAmHVPaUiXNgduG95k/8RJYIBCVGGz/+6n35ZS6CRywNR9x4q3aiSKzNnhGSB8N6Q
 IlqrMH2PvOwfL+IvEgJqo040xTPMRPNa6h7d+IkafWdHFb1B4h9uwgffr8wFQV1DgDoe
 CcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZFnbHYILMcI/VEmTPpT71qfojBQq5RkqI/zyNRTGWwE=;
 b=rYzs+5dka5aKE/fWB5s/djG/Lyf4zOf4g/ojQpYNFBP4WkWoZk841ImasCB/mNB2Ib
 Pup4X5yuB449+F/V3qrhnCwzVDKcc244pPLSDVn/L8vK7Ftgw0vMFAYq4BTKbMdU2KJH
 20wCsEg4rfM+D3w9Igcva1tzUY0v+y5UZu3FdOuMwl2Pkazf7Yab7k7MRfVR4TKQsv+Q
 JEC5MrokZ9YaGxC1yIzIsQb3xrMjUv1qz9TbKehvnXOlf7g4e9Gptgxvgztbz0hhXBal
 LTaQjb7EYMLThxOo/KOl/rNDU50thhqGKvivPg94LYBqgW2/BteoLD0au2I884uMC7zY
 yrAA==
X-Gm-Message-State: AOAM533uEMbJTWqU0uOznd0Z8GUhN5kDQTgwPCh6ExAGGMXS+QmocVap
 c+Bi/hdMMXujuLeOz9JODIYz5g==
X-Google-Smtp-Source: ABdhPJzupFvfqE5y2taatN7M2OXYrRpQUe2chPpLATGUSidRjxsq7c+vYEV/gKDjtcaY37NkoZQpfg==
X-Received: by 2002:a17:90a:5407:: with SMTP id
 z7mr8929509pjh.228.1617891922818; 
 Thu, 08 Apr 2021 07:25:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w203sm24151236pfc.188.2021.04.08.07.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 07:25:22 -0700 (PDT)
Subject: Re: [PATCH v4 00/12] target/arm mte fixes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <CAFEAcA_9v7i1p59EThNPfuJHxXqwgavupV4otqaZMt9Q5d=SsA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18c76f1b-cba5-8205-b945-bb908d460bf2@linaro.org>
Date: Thu, 8 Apr 2021 07:25:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9v7i1p59EThNPfuJHxXqwgavupV4otqaZMt9Q5d=SsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 5:47 AM, Peter Maydell wrote:
>> Richard Henderson (12):
>>    accel/tcg: Preserve PAGE_ANON when changing page permissions
>>    target/arm: Check PAGE_WRITE_ORG for MTE writeability
>>    target/arm: Fix mte_checkN
>>    target/arm: Split out mte_probe_int
>>    target/arm: Fix unaligned checks for mte_check1, mte_probe1
>>    test/tcg/aarch64: Add mte-5
>>    target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
>>    target/arm: Merge mte_check1, mte_checkN
>>    target/arm: Rename mte_probe1 to mte_probe
>>    target/arm: Simplify sve mte checking
>>    target/arm: Remove log2_esize parameter to gen_mte_checkN
>>    exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
> 
> So, what should we do with this series for 6.0 ? We'll be at rc3
> next week, and this big a change seems risky at this point
> in the cycle. Is there anything in here that's worth extracting
> as a for-6.0 change? (maybe patches 1, 2, 12?)

Definitely 12, since that broke BTI.

Patches 1 and 2 are certainly simple enough.

Otherwise... the rest would be nice to have.  It's quite isolated to mte=on. 
If you defer, I guess that's fine too -- the bug report did come in quite late.


r~

