Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11960566E75
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 14:39:21 +0200 (CEST)
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8hpo-0006uO-4o
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 08:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8hmb-0004PB-Gk
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:36:01 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8hmZ-00021L-LZ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:36:01 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso6304955pjc.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=F8ZxVzFDMZepXPjGnF3T3niNQXpIrz5Z6KQf0sIiATA=;
 b=lJejZAMSpa4bauTwVwWSVn781er2a1DngQayfL/wBOhTmIry5IJmYhxAS9CU67MKW2
 2BryXEGxZ4to6gyge5xJ/hpNFFMyuzXiignmDPBvTouJ1BIk5zuQ35SktJHcNH/9T/b7
 aUHuVE3ydNv0+6i8L5PSst7GpcjcqSp14rIGFwGHxL/w09POCJAA1RsHL+sWwkBq6nyL
 zSLCbkC3mnli/W4w4SzCqX65tVSxfYdLn3Cn8JBItlreV21nv84USVUrSrreFPCIF6zq
 SKMIcneRrguQsPTh/fWJb/m+1qFcwMWftUT9634J8PIMcaka8CB0n0c8RfpBXqK1s+w+
 wOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=F8ZxVzFDMZepXPjGnF3T3niNQXpIrz5Z6KQf0sIiATA=;
 b=CxZZO+l92O+pSKPbE+MJff/5RJmDVp3t7ICzLiAA8WH9i4BIbMbZitk6wh1A23IWw0
 CYFlGn7NKGKOGP3bEkELkvhsf5qeeNE20I8SRXrhHZItOo5vsx1gR84tpILHA/eLRNtu
 kxjaj092xHHvioJrqLDRuY3yv059uE0XCCLMp1w/lZnLUtUFd2N2PK2HFIV2RB2jh8oQ
 h3UlDSDa8pxFuMWMlkvmEvbN1oTETcwM2IjNzKqY/ZKP8ed7kncZtsq0kv2ukBWP86mY
 GH77HJbUEYaVMx5QZEIY7aUDGOJ8/akTrSFyrwzpEM00S1+PyEKO1PG7g0kNlxXHnIzA
 TmoA==
X-Gm-Message-State: AJIora/aiNIIpbV7B4MXjMIngpsXnL1nspe6KBfSZqtm1ZLNUjZ7madN
 y2VwQ9fZsZ07FDXdJxhh19bRF8vYjhelxKy5
X-Google-Smtp-Source: AGRyM1uIq2MndZaQDOPhGNIh157bP4+agtTqTQR2Ff729BzVxuH1peouM6eaXX1EXXDWHv+QvtkQ8g==
X-Received: by 2002:a17:90a:fa05:b0:1ef:89d1:1255 with SMTP id
 cm5-20020a17090afa0500b001ef89d11255mr11557115pjb.73.1657024558070; 
 Tue, 05 Jul 2022 05:35:58 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a1709028ec600b001638a171558sm23255619plo.202.2022.07.05.05.35.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 05:35:57 -0700 (PDT)
Message-ID: <51543b67-bbbf-6bea-6e68-0f0baa1d2bd3@linaro.org>
Date: Tue, 5 Jul 2022 18:05:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/6] loongarch64 patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220705105957.1144514-1-richard.henderson@linaro.org>
In-Reply-To: <20220705105957.1144514-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/5/22 16:29, Richard Henderson wrote:
> The following changes since commit 1437479e5ee1a49ccd84cad9e7b010fb2ee9d805:
> 
>    Merge tag 'pull-la-20220704' of https://gitlab.com/rth7680/qemu into staging (2022-07-04 16:37:13 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-la-20220705
> 
> for you to fetch changes up to bf7ce37f8f40149dfa354bdb74810c8e586a11e4:
> 
>    hw/intc/loongarch_ipi: Fix mail send and any send function (2022-07-05 16:25:17 +0530)
> 
> ----------------------------------------------------------------
> Loongarch patch queue:
> 
> Build fix for --enable-debug --enable-tcg-interpreter.
> Build fix for ls7a_rtc.
> Clear tlb on reset.
> Fixes for ipi mailboxes.
> Minor tweak to scripts/qemu-binfmt-conf.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Richard Henderson (2):
>        hw/rtc/ls7a_rtc: Drop unused inline functions
>        tcg/tci: Remove CONFIG_DEBUG_TCG_INTERPRETER
> 
> Song Gao (2):
>        target/loongarch: Clean up tlb when cpu reset
>        scripts/qemu-binfmt-conf: Add LoongArch to qemu_get_family()
> 
> Xiaojuan Yang (2):
>        hw/intc/loongarch_ipi: Fix ipi device access of 64bits
>        hw/intc/loongarch_ipi: Fix mail send and any send function
> 
>   include/hw/intc/loongarch_ipi.h |  7 ++--
>   tcg/tci/tcg-target.h            |  5 ---
>   hw/intc/loongarch_ipi.c         | 92 +++++++++++++++++++++++++++--------------
>   hw/loongarch/loongson3.c        |  5 ++-
>   hw/rtc/ls7a_rtc.c               | 27 +++---------
>   target/loongarch/cpu.c          |  1 +
>   tcg/tci/tcg-target.c.inc        |  7 ----
>   scripts/qemu-binfmt-conf.sh     |  3 ++
>   8 files changed, 80 insertions(+), 67 deletions(-)


