Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BF439034B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:03:00 +0200 (CEST)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXe7-0005xo-6w
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXbN-0003FG-5O
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:00:09 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXbJ-0006sJ-OD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:00:08 -0400
Received: by mail-pl1-x62b.google.com with SMTP id 69so16400093plc.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TWsNg69rUukRyfkqN39uEAP6MKbe1FMrRh8RsqXQgKk=;
 b=tXlKOF578TB+5SnptZhhg5ObgpvkndVY27loDDmOiZXjBdDqXsmGQPSyorHBYoJ9Dq
 q3am6Br7A5rZikqiI661HFadm/jKdby8enn+aqNTV4naMrKtiDlBh+OqE2k1Fs+zAJpj
 D5XNpZvOqeoVEPH9gm++050qWPqAuA29p/Ql5p2lVcTckO/aZyEZ/G62pfmdBX3YtPBb
 kh7VIwUaPWoTK/Pwl9w8jB3uCzywL//iJcR3x3nF66DI4Sjc1fcJBPot94jUZTOjS7lb
 ccWXMh+IaAEaE8F7NuwGe7nLVX4imeUp1QVHxIVMVa54pu4H6l8X7Lg6jstiDz0g3kIm
 PeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TWsNg69rUukRyfkqN39uEAP6MKbe1FMrRh8RsqXQgKk=;
 b=VO/zfjHu0uh2HeUwDUJpI4g8dfN2QOU0CCfAWv991lGsYBzoflvTuG6UVseh0ARFVc
 GFCkpoPMLQU92wzn0hoOlRIM4eL/+VF10jAzj0rXfJaaQjuuoXZD5gp5P2ZKeVJDbVWB
 imiP2R64BZvooWPuH665Gs5Qj1f8PZ5J8nexe3Wp59jki/q3L4YPVQtJidXNlNtbe4Hj
 xP3guaNuJXpIL8knyyqloV5vszmLf0Ldpe5K/n7boiS4yosLd6pczZfuvS+6pcFFyT0s
 bOyOci9UAzGcPzDw7G9m2vb5vcr0FKBaoLw00AA9uG1TkCrJOE1sml4v6Oacm3PGcX1Q
 ki8g==
X-Gm-Message-State: AOAM533kMLkz1PKbwrskWO3f0n/+Pis02FF7hbmOlW2DC7udepO7eel5
 2V5e6oRulLU80plE98rK4x2GyA==
X-Google-Smtp-Source: ABdhPJyB1Rdx9PqB7avuzPQ7I/Xbwt5RBpcpM/aMoeI8X9ZBa6I11gYoisf4HyJa4321URQwft7KoA==
X-Received: by 2002:a17:90a:a2b:: with SMTP id
 o40mr5000656pjo.214.1621951203071; 
 Tue, 25 May 2021 07:00:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a15sm13027500pff.128.2021.05.25.07.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:00:02 -0700 (PDT)
Subject: Re: [PATCH 9/9] accel/tcg: Remove
 tlb_flush_page_bits_by_mmuidx_async_1() ???
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <20210509151618.2331764-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e6b61b9e-335c-025b-4a86-a616a9833dd3@linaro.org>
Date: Tue, 25 May 2021 07:00:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210509151618.2331764-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/21 8:16 AM, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson<richard.henderson@linaro.org>
> 
> Now than ... /* we use range? FILL ME... */ ... we can remove the
> encode_pbm_to_runon() and flush_all_helper() calls.
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> Message-Id:<20210508201640.1045808-1-richard.henderson@linaro.org>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> XXX proper description, commit might be placed earlier in series.
> ---
>   accel/tcg/cputlb.c | 86 +++++++++++-----------------------------------
>   1 file changed, 20 insertions(+), 66 deletions(-)

I think this needs to be sorted before patch 4 (which introduces 
tlb_flush_range_by_mmuidx).  With commit message:

accel/tcg: Remove {encode,decode}_pbm_to_runon

We will not be able to fit address + length into a 64-bit packet.
Drop this optimization before re-organizing this code.


r~

