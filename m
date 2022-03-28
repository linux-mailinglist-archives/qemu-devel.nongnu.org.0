Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554BD4E9E90
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 20:06:37 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYtlE-0007DX-5i
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 14:06:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYtjB-0006QV-JR
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:04:30 -0400
Received: from [2607:f8b0:4864:20::230] (port=41939
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYtjA-0000jZ-4Q
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:04:29 -0400
Received: by mail-oi1-x230.google.com with SMTP id e189so16437577oia.8
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pWUNsI8Z3TeB8IcsaE2VQdmQzvvNPh/EQ8Jrvzu+otQ=;
 b=XCM8L7f0FCMpFKw/GOUi7MFzpAKBY37XUUEKvEkHvdmI7sz5IV8/fxu8m4NAMBgO3f
 NjeSoabAFPLQ3hCp5o+QLxi662YTCgtShBgo4iJNmpnoyO5ItRrV0mp6gCuqQdrYzXpf
 axLxtXvp3BYSUHAoCIlPphOp/kl6qM7r26b0Jy5DIWJFm0nAQvWG4B9HYJChfFnNQsHt
 dAP1PJYoR0xSjl113hNt2Q0GCeVij8oPdL7BY9ed8rQuyRrsrkMH/HBllpkfa65II2p6
 gjJ7MqF9SNN9NnhkvkEIfHIS6YwB2WxsgsFkI/YDKTfQGqKJ0AdApMhvULrM7rizwNvA
 m12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pWUNsI8Z3TeB8IcsaE2VQdmQzvvNPh/EQ8Jrvzu+otQ=;
 b=psjfpv7yLzCPyTlXT++4ia9X0cuwidv1h8dd/g4nmgpCEkhb24TytP1CTjQr/zBP++
 k6Z1WRIPMX2hva+eyFHO0fi2PjdbcJlVk4/5npgQEwb+tHTldOso69J8X+38G90cv0YH
 ag7GeURZq29Or5YYOGALeKj9y1azB1p4H840cDfRtGQzEdk4yhFxTEI51X7xYSrzZued
 ext0iw8Btz1ixCBYWIiPqhRwQwFnrOM7K21E+bekF+/qkz8YASNFzULRiWgZ2+AJQD4I
 uQJgTJPi3ofka4sqKj8XuL3IVB65RtVXlI6HFSZIGnhTMbKEkyUDXX2pDR+3iqKHJUjw
 jkHQ==
X-Gm-Message-State: AOAM532z3SYXoM6yrBigzEoQw879msUCvAucKY3DQLi3Q6PZAr1iy48t
 c7M56vxuNS75/o2L2VSFIa+EOg==
X-Google-Smtp-Source: ABdhPJy76lqqPn+lMQ/J78HOEOuAW/kff8otdHw4g8JVenHStDIcbBR7wQdQomgWnElhQfxZh7AsHw==
X-Received: by 2002:aca:3c82:0:b0:2f4:8c9a:b81e with SMTP id
 j124-20020aca3c82000000b002f48c9ab81emr202900oia.152.1648490667048; 
 Mon, 28 Mar 2022 11:04:27 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 bn13-20020a056808230d00b002f75bfbcf5asm886214oib.56.2022.03.28.11.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 11:04:26 -0700 (PDT)
Message-ID: <a2e29af5-705a-19b0-b7ad-0126f8d441b0@linaro.org>
Date: Mon, 28 Mar 2022 12:04:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/arm: Fix MTE access checks for disabled SEL2
Content-Language: en-US
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
References: <20220328173107.311267-1-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328173107.311267-1-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 11:31, Idan Horowitz wrote:
> While not mentioned anywhere in the actual specification text, the
> HCR_EL2.ATA bit is treated as '1' when EL2 is disabled at the current
> security state. This can be observed in the psuedo-code implementation
> of AArch64.AllocationTagAccessIsEnabled().
> 
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
> ---
>   target/arm/helper.c    | 2 +-
>   target/arm/internals.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

I was immediately thinking, didn't I just fix this?
But I was patching pauth.  Anyway, good catch.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

