Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD973018AA
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 23:20:20 +0100 (CET)
Received: from localhost ([::1]:37658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3RGV-0005he-MZ
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 17:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3RFA-0005Ew-Kp
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 17:18:56 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3RF9-0003Uo-0j
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 17:18:56 -0500
Received: by mail-pl1-x631.google.com with SMTP id b8so5357474plx.0
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6TRgrOTVn2PYXKP35q3xmWaDIXhrDHQXuoiRkjxHGMo=;
 b=UtA1/ojsueVkc4lDMJbNj6ibD8+E1DEzfGBbGpT+iKAAzeFN0GnMR0SbedzM4YG6Eh
 zhzDsvug1eeSzvBfCs05rYDpr4OsLn4Y8wryQ6h4VroBE9g0izdQjD3onlu2Tws7XIsH
 FVZv0GzrUnGI3lmxTp0nCD0Y19ChQ4EHp0aGShg34TLIcCe6oLtJ9BPSShorDuXHQ+bG
 c4ZEKB7F9c4EG7HUBUGloiITelETkdWGPZBRMqbs6GmY0jmyr0eFk7OKZd3J+SLBTj28
 qGEt2r/wWx0tH2XRe0wzbDvw8rmFOWtmo6JK6ptqhpDDvb8mE4OKWPtIEBz7onfRjZaT
 V/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6TRgrOTVn2PYXKP35q3xmWaDIXhrDHQXuoiRkjxHGMo=;
 b=jH6xDtPMm94CdGYfAsajwYS+pkonURfniGMMCZWUXYQEcXWPw7bqXEUPMwWBuaJBU9
 AC4PQEKTuTrgO4UDpOMF7FDEQZTAZ9LHpHg8/hn/7M83tlb9KQSLNc9Bbi/buKDOrPyR
 h1QaojF0UW26l+0Gru8qibg2qTNsFg+o/MlE98eT6HBfsHT/6WHWrzWMto6ED+mLhgvM
 vMM/cRuc1vbD7L9bGd6kvlECytZGAqNKpGClslOVrUYwH5IL4lqGcolHVKpYIOhm8vm0
 OyAu6IaTRl1oPiTf5rqjh173Q4AiI35jqutt2rjLN6BhtavDWrVfkvov7WyxR5AT6XIj
 MZXA==
X-Gm-Message-State: AOAM533slJUSYc3GxtiXn8PKxEQ3KTq2KeVt5SYFx4qTjqIRpGCzP45V
 FuRGz1B9X1dCHtT5w0pcQDDlEA==
X-Google-Smtp-Source: ABdhPJzbGeMaKfvxRsqKN/168YNiZMddqceH687TvbkxM9j/b9m3e3FYajUBoEBA8d5EtgWfNEyOFA==
X-Received: by 2002:a17:90a:e656:: with SMTP id
 ep22mr13546056pjb.127.1611440333321; 
 Sat, 23 Jan 2021 14:18:53 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id k15sm8125303pfi.94.2021.01.23.14.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 14:18:52 -0800 (PST)
Subject: Re: [PATCH] tcg: Increase the static number of temporaries
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210121025439.1120405-1-richard.henderson@linaro.org>
 <521603eb-205f-9659-25f9-d72bb2eec01f@vivier.eu>
 <92ffa9ea-1013-db7c-554e-2bab1564a9f4@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0e88324-d7bd-2b95-5e79-335039cd5619@linaro.org>
Date: Sat, 23 Jan 2021 12:18:49 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <92ffa9ea-1013-db7c-554e-2bab1564a9f4@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 9:36 AM, Laurent Vivier wrote:
>>> -#define TCG_MAX_TEMPS 512
>>> +#define TCG_MAX_TEMPS 1024
>>
>> This seems not enough, I have:
>>
>> ERROR:.../tcg/tcg.c:1210:tcg_temp_alloc: assertion failed: (n < TCG_MAX_TEMPS)
>> Bail out! ERROR:.../tcg/tcg.c:1210:tcg_temp_alloc: assertion failed: (n < TCG_MAX_TEMPS)
>>
>> With my branch m68k-virt (68040 processor with virtio-mmio devices) booting debian sid.
> 
> The cause of the overflow is this sequence:

Thanks for the test case.  I was able to reproduce this with m68k-linux-user.
This TB uses 1063 separate constants.  :-/


r~

