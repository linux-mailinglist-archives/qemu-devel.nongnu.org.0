Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7E43CEF87
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 01:00:03 +0200 (CEST)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5cF0-00055q-Fh
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 19:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5c2a-0000ZH-GQ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:47:12 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5c2Y-0005UL-U0
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:47:12 -0400
Received: by mail-pl1-x631.google.com with SMTP id u3so10494612plf.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=15F8DfsXRzAR5D/jWysLzmaVt3IYtUgawG4n7ONRJrM=;
 b=rh8RFX1FaeWtN2/uX5oEft7UhzknVwgKbTDxE6eQVUh1VVGVl9JeRAvb2bNoibaEIy
 c0rUnffUCWVo/1rEgeVSaa8ySj59xIovD0FI1XHyUqs/mGk2f27DLXhNInnwfTTPgn+f
 iYVO7lXJCbqvv7tlyQwcfrOw6lQvEy18ic8K6Lt2/P3HLWhKLkQRTTlMc86+HDMzDsOy
 4shCT4ysXUZoAgQYIOJbcFOzSJLoyIlzYfsianVDf9ytlGjee7IQWsojK0jnzgK2Jl6f
 b0xVRpZSXpWrFZScDZ5CMVP7Ehlfb26vmJOHRTaZMfwrvx5NyUiXEm56OtoRcHZ8ywMb
 bLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=15F8DfsXRzAR5D/jWysLzmaVt3IYtUgawG4n7ONRJrM=;
 b=S7doMirRmbzIilwkHXXX40FwXTtCu26CVnpfsHTPG2LFB3RSKuaDQF8WVEJsCpqulD
 ivfjilm38P+f71AqG5SFRz3ebrPXBWoc5RvRrKfukwZmi4/Crq1QK4XJK9kDmlXpe9bJ
 W1g9fDxlkU5b8Z/wpzh85MbqrexURJlyV6AWjAK82Exuq9t/NKwMNrOtRRPcSO2RXQNU
 akT2kLK8gWdc9ns/uRhUYYcnXswz3qIbH+6bcVveZ8JuzD38BvCl8kWAM1xSBKNnqJIx
 PvO2M6CoVJdwezr+qOlMbbAFf/JSnfx24MUArsMwuJxI7j3iDw/qfwVva1Xd5QhM595h
 dxog==
X-Gm-Message-State: AOAM533JHukF+1/wvlrexPYiALOAFQ42oNNH8RgRKZWUTAiG3eLQ2XVy
 /2bhuOoyfApygVsHU1BM1iOVxg==
X-Google-Smtp-Source: ABdhPJzshL55rtIb79YFbQifXk/KtsdYWvk5TodZRSxxWzu2eOUaoeCgQ7NAy2suvwSIdSC0hLYLFQ==
X-Received: by 2002:a17:902:7c8d:b029:12b:793e:9f26 with SMTP id
 y13-20020a1709027c8db029012b793e9f26mr11339473pll.84.1626734829307; 
 Mon, 19 Jul 2021 15:47:09 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id h8sm20021681pfi.47.2021.07.19.15.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 15:47:08 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] hw/tricore: fix inclusion of tricore_testboard
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210719214825.2264-1-alex.bennee@linaro.org>
 <20210719214825.2264-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1e4803b5-2ff3-0165-6ee0-e23ae14227f3@linaro.org>
Date: Mon, 19 Jul 2021 12:47:05 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719214825.2264-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 11:48 AM, Alex Bennée wrote:
> We inadvertently added a symbol clash causing the build not to include
> the testboard needed for check-tcg.
> 
> Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   configs/devices/tricore-softmmu/default.mak | 1 +
>   hw/tricore/Kconfig                          | 3 +--
>   hw/tricore/meson.build                      | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

