Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79B3363764
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:45:50 +0200 (CEST)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDMb-0004TE-SF
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDI4-0001zs-Fs
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:41:10 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDI0-00024Z-Ci
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:41:08 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso1459569pjs.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3jrfBn0WKNrJcrMnNWhPms1l8dwfjeEUEIwooSCvu7Q=;
 b=lsfiagWqZUlS4RMTtZS9fOQx+ImaBao2y0DjArNj/VXjDW+XXkb1UdYk5+okvKVtNd
 pBKsA4Lnzih6tXXugcwOVEJlPHEQdsls+I7eIX4E0FGb08dx/V/QydndzTIBBjk7dv5Y
 02AwY+98dLv2cw3LzMS6vy78pCJv0D98PmhtDFJ98mIzPtdXwR99IBCLAq24F2j4zvUk
 ul946uXKBuEqdUnuj+prOxeP0vBZLN+HpQ5y34C7eFBW18xyZEVoO4tfbhEEM9aRyJ/G
 nxTGUHO/prb+tCX9uJZEyRNwgNt7SlOo5VB7z9Ml+VSiqJUtsW01XgDeTAiIf9khXz/a
 Tizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3jrfBn0WKNrJcrMnNWhPms1l8dwfjeEUEIwooSCvu7Q=;
 b=Z5yIyv9yp2Rint59NO32IAi6s/zCn+Ih4JtdyRvoppvkmdM1cgOV/B8WYTzpIsSBFz
 hl9HmKVE8nbfs6PyNTnLFktrELoLNHwzk9YVTXE2lKly4H6GlBQ5m7ueRqtX7yyLUeiK
 AFjjufcUD6S+cX4eqLrUz4Hr3PrfE04wInORieOCxczEPR15AguBhKtBL8e1az+VimbQ
 Co/4BVO8Vb73sAczH5ePzrNDhcnVFrqoxmyX/Rh9xhu5bLuYH9xXWRgHIf4RNwxcEOOT
 fHrj0P5rtR8+USZtWykO3JyunOCw4TCjQr82z3M2dQ1s4UL2N6HZoOZthLUaH0XKxKkD
 gCVg==
X-Gm-Message-State: AOAM533YW3J1dKl6mGawFpV4xLOpPsBgMoyV0fLJ4p9Ny0ZPEc47MFDl
 0csG9xrnqNdtO6aFjsvmUEUkhw==
X-Google-Smtp-Source: ABdhPJyIWlpvd7x7CjneyL0nljzf8i73OvlX2IF9iHjqiCP6yFDGg41KuCoVwfw+X0C5HiySyH+CWA==
X-Received: by 2002:a17:902:8b86:b029:e5:bef6:56b0 with SMTP id
 ay6-20020a1709028b86b02900e5bef656b0mr19380160plb.76.1618774861583; 
 Sun, 18 Apr 2021 12:41:01 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id jx20sm12410165pjb.41.2021.04.18.12.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:41:01 -0700 (PDT)
Subject: Re: [PATCH 17/26] target/mips: Restrict
 CPUMIPSTLBContext::map_address() handlers scope
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d46dce0-75b9-fa80-c6f1-34757035313d@linaro.org>
Date: Sun, 18 Apr 2021 12:40:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> The 3 map_address() handlers are local to tlb_helper.c,
> no need to have their prototype declared publically.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h              |  6 ------
>   target/mips/tcg/sysemu/tlb_helper.c | 13 +++++++------
>   2 files changed, 7 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

