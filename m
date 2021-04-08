Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23C9358D7F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:31:22 +0200 (CEST)
Received: from localhost ([::1]:35734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaN7-0007Nr-Em
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaKi-0006c0-Fa
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:28:52 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaKg-000881-LV
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:28:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i190so2571458pfc.12
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QunevCKBxnnuUNE8TFeNRFKNG0EoFl3Iq+81RJlHc3o=;
 b=uEGkHnmP4FpqXfOX7AxnwoXOVH5cFWfMBMm7yD4O7Aq7h6fTVqNVW5ufJY9ETfpBy1
 YVywhhtfbEpF29uLEhwBS1c8GDsFVTiMDoSN6JY8dcH4CRv1WQHsmJxUDA3OSoLyKvkm
 RUcfu6KEIv5df22Fqp1fXuUbaVIMjz5/4sO+FBYppWDnvsOSEUSAlLpJ9M+BC5LYkyYI
 lh52IO0qylWSAdorpV0I+iv7trQhzhE084eBy1qIH1bsPp4BtiVdZmVSO3l1r5WYWpnM
 vWjBErpUEPI+DhQZYSgSAhLHj2UsGzDoz4Wn4ybatiEonUaBx9reEoyNlII4dsLRqOtu
 g7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QunevCKBxnnuUNE8TFeNRFKNG0EoFl3Iq+81RJlHc3o=;
 b=YM/3oGlkuAN/VZx/QYrM6gApyW5VfakZq8i7abjMZMvNVTunG11fK99WfGmjJKh/sx
 WVqFyyxlOO/ep9Wp/WmEK3sOIaR5iqn9kWipw+0qgL5ByoR1G9oMPphRd24fRdDsTqqk
 Qbg2q68kao2+DLuSIUDEfG1eQcmOUNbkwRAM+bIxzmwLFgvqGWwd/KpLqqI9tkJI7Qdz
 aQETqLxXotMXbNKAYYTi1nuqj2giECPl1nUALtlwqowemThPfuKTwjvgt70i6OYo7ktd
 EcTah3VkaAH3h8GTI6LB/f2PaqZm4HqnyDh8+QME1MwCoFhFC3oeC/VboGkDQAw2uemb
 7Xzg==
X-Gm-Message-State: AOAM53066vXEexHtxi0qUxNrLqP5V5WK9AudKt7UiL7azKhkanB2fPct
 4z0Om5PGVRX3kWmEhksmLKEBDA==
X-Google-Smtp-Source: ABdhPJy/ZT/2hRhO9VP7VMWAOuTMav4gFDbqaFJwmErIiT3Yykv59mxYhSwEj5A+mYn2MOmXVvQwHg==
X-Received: by 2002:a63:c450:: with SMTP id m16mr9352592pgg.333.1617910128398; 
 Thu, 08 Apr 2021 12:28:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x125sm223122pfd.124.2021.04.08.12.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:28:48 -0700 (PDT)
Subject: Re: [PATCH v3 19/26] Hexagon (target/hexagon) add A5_ACS (vacsh)
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
 <1617847067-9867-20-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6efd80c-ae90-0c44-1797-813aed45aeef@linaro.org>
Date: Thu, 8 Apr 2021 12:28:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617847067-9867-20-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 6:57 PM, Taylor Simpson wrote:
> Rxx32,Pe4 = vacsh(Rss32, Rtt32)
>      Add compare and select elements of two vectors
> 
> Test cases in tests/tcg/hexagon/multi_result.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h              |  5 +++
>   target/hexagon/helper.h               |  2 +
>   target/hexagon/imported/alu.idef      | 19 ++++++++++
>   target/hexagon/imported/encode_pp.def |  1 +
>   target/hexagon/op_helper.c            | 33 +++++++++++++++++
>   tests/tcg/hexagon/multi_result.c      | 69 +++++++++++++++++++++++++++++++++++
>   6 files changed, 129 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

