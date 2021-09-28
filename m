Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2E641B692
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 20:48:06 +0200 (CEST)
Received: from localhost ([::1]:46810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVI97-0005Kf-71
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 14:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVI6E-0003HJ-UW
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 14:45:07 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVI6D-0004dc-2t
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 14:45:06 -0400
Received: by mail-qt1-x82b.google.com with SMTP id b16so1796827qtt.7
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tQlsx89M2LoV/3oAnM8wKHoqEIkl555tsqS/wLitWhc=;
 b=oON2GFzSCDJHJwmu1f45i7DMvKLBIQi/ErZSrUsdbT4gzdxWk1KOCSu5k+J/XCSppa
 Y+eTpEbqaXPIwNFcoTYfSaHZTP0B8BuUczvFqN4dPLzbYtkfMOVcSGadArEzxKfVR563
 rmM6Hn17JaUA/hclDGIaVHR9Y9jxkIrrvt+UHnFQ/+si4c1bfuU0HFgnbdxk3Y3+lv0h
 //F9v6I6+cIeYZutLtrtzHCoWT2Bt+4N+LdWn2ufHoQhMl8QnuISzxvjn4WYoClBJl8e
 y5e0nMOfGrf9xVPTA629Q6VM1Y4qfG5XywTBX7f9VgkgUF3e6gAnAxVmsmRnnh4/DaRu
 nlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tQlsx89M2LoV/3oAnM8wKHoqEIkl555tsqS/wLitWhc=;
 b=U2hK3lw4f3+bHa05/pk+3ZDg1hV+F4561xgjuyQXze8uFsn3BVBQS9AsaqQbQr5AOs
 C337JJsuqZGbk19lFCzia5P/rAIP+D9UxLCHK8iCLwqWL8AQHgjkflb8d8Nou7b4iQ1n
 +eOnJpwFLTKvporyWr3JhbbwfxYLOgl2i0NHFQc+bNaLNDUpqelFxgtdJVvxyD6th4nG
 3Ob95HWR1dJvP+rRaEYnKmIIuwnQ9/FE5BZLpN50FRp2Ahnxj5aDgn8+zqnNIqaEVCvy
 tRz2rHhzzmsL2GUAWMwvgqnoHwuREKaRLA3H1/W5CvcnuRDvgb7ZOyDCHvM36V+E4zn6
 BSIg==
X-Gm-Message-State: AOAM532hiG9JPgHXcH5EY83n797XmcZgIHG1i9cbdlx7ehexDlg3J/GZ
 a7AmypLv60p0lCOrj1rHg9YFOg==
X-Google-Smtp-Source: ABdhPJy9z6wCfWMaBIOd9NN6Xt79WAGTm2cRy00LVYBHIUHn4uHmBLua40/lsOA6tHoIsFBMrppTKw==
X-Received: by 2002:a05:622a:181d:: with SMTP id
 t29mr7342859qtc.337.1632854703953; 
 Tue, 28 Sep 2021 11:45:03 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id v11sm14624729qkg.92.2021.09.28.11.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 11:45:03 -0700 (PDT)
Subject: Re: [PATCH v11 11/16] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair23@gmail.com>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <20210911140016.834071-12-philipp.tomsich@vrull.eu>
 <CAKmqyKM7b9Xz0C7YN7QyARUJSAuDqxWk4VnwHfMB+5tTHGvy4w@mail.gmail.com>
 <CAAeLtUBk3ffamhKaqYsQkCW79Z6Jd+gMH_jAv_NXAVyDPdHOmw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1dcc5800-a3e6-d1b8-c2e5-0ccf2d724c30@linaro.org>
Date: Tue, 28 Sep 2021 14:45:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAAeLtUBk3ffamhKaqYsQkCW79Z6Jd+gMH_jAv_NXAVyDPdHOmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 11:45 AM, Philipp Tomsich wrote:
> The dup_const macro is returning an unsigned long long, which probably
> should be fixed on the tcg.h-level instead of forcing a cast to target_long
> at the call site.

No, dup_const is first and primarily for vector support, and therefore must return a 
64-bit constant.

> Or should we introduce a dup_const_tl?

Maybe.  I guess that could be a bit better than the cast.


r~

