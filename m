Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D82D49F09B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:38:02 +0100 (CET)
Received: from localhost ([::1]:35392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDGDA-00079R-OJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:38:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDG99-0005qk-NC
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 20:33:51 -0500
Received: from [2607:f8b0:4864:20::102c] (port=56143
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDG97-0001ur-Mv
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 20:33:51 -0500
Received: by mail-pj1-x102c.google.com with SMTP id d5so5034703pjk.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 17:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZPp7HT9s7G06w/uVTiUtnde1QKDlRCBFIMx/3qTEdRo=;
 b=CQrhcUz0pVmIfBCIxRMueFBtJpIWEhpjl3uaDhpIWkXgzgaUGRt5j7pKURg3pV811A
 NUTPQfNLh30eEoSJHxmMRdXGzMiXG94nsPQe6Q6T89v6oE2shNzsYkk+6RoGYTqAayZz
 eu55xy0Y0y4fRNuorDa19cZd+NKteJED3QW5S8wB9doYxEhz0GfDg2NYQUykYW7fZ/Qy
 CHd9rhUjVeNedNcsiWNeYpbS0f6Gd1YdRNovlEjlwxv2BHc2k0A1l1WtEVnaOc7X1U94
 lyxljrCR+65hLTull2lZX/ELLX2bsbvUz1BFvJTG7RVUsKuu0GoYoglKBRG2TOV5LzNP
 Dtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZPp7HT9s7G06w/uVTiUtnde1QKDlRCBFIMx/3qTEdRo=;
 b=hFwZwoLsIhruGnCyTWDixaQVU8gBqChK55bhlZOTZJaFzFg1wOerInCBS+5mHviDXy
 ebu34TKGaxI76EGGbt4ugHpjsMkGvCidif/vQ1ZHyIX7+2IvIzWbPqs0tTKzvKOENwpx
 og01NKyA/1+h25XhmqhpPgwdkzZ8rkwRns68QS0DD7nzSZCDRsZzxAbcE9bW78PZA0Cp
 plaY3jHdmeOfcy7mxqTZNuhPnJIHssyrQnHGi6PfXG6NzhZKoScp8OAzXoe9iXRLxqlm
 AwfGMzC7sTFo213dk+FHdLl703sRVPDjQ2J363Fyw1/o0XqrmRXznYJIlDR6tAtKAfOJ
 bCpQ==
X-Gm-Message-State: AOAM532/lqgC49DM9pBS6BW8IfLM/ASNk5nwwQQtDUXfPYJvZEslldPy
 YDO3JPNKQWSevLjf180AjdV2Zg==
X-Google-Smtp-Source: ABdhPJxyS4v7gECK2rIc9xtFYL3ouYmgfDDR5amCkOAYfESSdpHRmqwRv170pxFQWNvPx6NRX93q/A==
X-Received: by 2002:a17:902:c602:: with SMTP id
 r2mr3979484plr.68.1643333627281; 
 Thu, 27 Jan 2022 17:33:47 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id z2sm7247599pff.66.2022.01.27.17.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 17:33:46 -0800 (PST)
Message-ID: <e81fe48e-af20-5e4e-959c-be8e2265a513@linaro.org>
Date: Fri, 28 Jan 2022 12:33:41 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/13] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111171048.3545974-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 04:10, Peter Maydell wrote:
> In process_its_cmd() and process_mapti() we must check the
> event ID against a limit defined by the size field in the DTE,
> which specifies the number of ID bits minus one. Convert
> this code to our num_foo convention:
>   * change the variable names
>   * use uint64_t and 1ULL when calculating the number
>     of valid event IDs, because DTE.SIZE is 5 bits and
>     so num_eventids may be up to 2^32
>   * fix the off-by-one error in the comparison
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);

Could be written 2 << N, instead of 1 << (N + 1).

r~

