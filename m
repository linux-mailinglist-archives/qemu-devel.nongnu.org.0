Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3445636E020
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 22:14:48 +0200 (CEST)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqa6-0004x9-Py
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 16:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbqYs-0004WP-9x
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 16:13:30 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbqYm-0000ru-I1
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 16:13:30 -0400
Received: by mail-pl1-x62a.google.com with SMTP id h20so33496046plr.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 13:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6g1cJr9L6WvnBp927JHNRU7nxCrIvKWElcsAVJuSmMc=;
 b=am3AUSonAMMUps2B3zqjpsQDLKRfcUsUaqZ3WC/UsMOyOabktlqooEzVsA540qfL0b
 wmiVsUS4EpgVcE4dVd4Wwr3wGvSLqpriMcjbCEQTxqcKJ/4ZjHXbdcMUq8uholE9T5yQ
 cV2oGo+B7AckqnouqB/msQxIVG6FU6pw30J3E+Yh4ZTXgBH9j5hFHlH0I7jlFiVuHcaI
 uBYBQeYdnKC3jxU760FpQkqVof16wWMGiexXxprsCMmN6JiehSklf2cmsNYFhwfOTBJv
 Lyvhy9318qkIhL/ZGHJ7wRc7g9iMzR1mBWlaXqSK5w0yTkwNlzKsvTaZBErzlY9e6p6W
 Ua2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6g1cJr9L6WvnBp927JHNRU7nxCrIvKWElcsAVJuSmMc=;
 b=QSnSK2KynSJXelH5AzREdiJRFgVIT5Jd1T1HhvDQdXlhUegJgV1bb+mIwf4iBPE/64
 fus2e6vrb9VYuy/1qC164sjFTFx5OtV7yU7DgyxEzA83c9X+3NiJ+8jDjSH7nJVQDgg/
 2KfQ/Pn+Y50sodQPTY7AKI8MbdYaA8GgAalmUe/g4NafJAaT5p0x61Jt4mbcWAhmrmEv
 VFebBPkp9AQI6RPvR8eBDIGcgzjy/Dq8nguAgdVmtUuXBPfkaz1XTMnXt66RGTu6U8L7
 WMh7b19gh7/K2JAiv1Df3+1szYH/Ikeo4zdZYrXXhRWcakxZHNFamC+39HRJiS6fTJlR
 nhJg==
X-Gm-Message-State: AOAM532AuunUCHvkY3OXpk0ButzJBq/LYikpP1VmOtNo+9cuHg1nJnSp
 i6DLCb9rinHSo9wHDGjovsGs2Q==
X-Google-Smtp-Source: ABdhPJyMV6Ua0N3gXPyPplNbKwT//L0KgSU2Ci/yQn7uTpezauyk8W2vz5WoAIolsbrPZjLZdLRTSw==
X-Received: by 2002:a17:90a:d201:: with SMTP id
 o1mr5699483pju.230.1619640802862; 
 Wed, 28 Apr 2021 13:13:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id g84sm441039pfb.198.2021.04.28.13.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 13:13:22 -0700 (PDT)
Subject: Re: [PATCH v4 08/30] target/mips: Declare mips_env_set_pc() inlined
 in "internal.h"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210428170410.479308-1-f4bug@amsat.org>
 <20210428170410.479308-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8da1f67-6643-47f3-364d-de6ba8d2f0b2@linaro.org>
Date: Wed, 28 Apr 2021 13:13:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428170410.479308-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 10:03 AM, Philippe Mathieu-Daudé wrote:
> Rename set_pc() as mips_env_set_pc(), declare it inlined
> and use it in cpu.c and op_helper.c.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v4: mips_cpu_set_error_pc -> mips_env_set_pc (rth)
> ---
>   target/mips/internal.h  | 10 ++++++++++
>   target/mips/cpu.c       |  8 +-------
>   target/mips/op_helper.c | 16 +++-------------
>   3 files changed, 14 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

