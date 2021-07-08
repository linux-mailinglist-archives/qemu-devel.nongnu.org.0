Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F43C16F1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:17:08 +0200 (CEST)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Wi3-00043a-9C
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1W6f-00021J-C5
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:38:29 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1W6d-0005sR-Q8
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:38:29 -0400
Received: by mail-pg1-x52a.google.com with SMTP id g22so6392942pgl.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n1eZLNbNsUVIyfM9tKqZRqRMkrKhQOtvqtUOMweCVyY=;
 b=TytRVbzxMAwqxD8WzpxqZDElT7r3h6FzjBnuSoQA44O6oJQ2PeydBVQw/ICnkVlTn6
 PgwZ1+Sdz0X9F2RX02jBSztwN+UYfrfeCjpp8iiR+zOD6qXTzbA0YSjcNlwhtXBYpB3a
 Zj4IeuL8nWwgXnu1+dv2MNtKB5WpvgOA9Kv8mPaEE3/mmPDgjrs+qaDwJJp1yEr6Yg5U
 vRzc0E6XXxJKs0fgpUXOiRwUlIAfYpX3IP6v4Z+fMNldmb9V8BCWvn5nQO7Lw++rPFwh
 9Sw/Xu+FVlOwuiRKRnW4mMczUvUJBIytYXY83Y7BJC17pr8TexMOi7YsLmfF50FNO2Wx
 dU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n1eZLNbNsUVIyfM9tKqZRqRMkrKhQOtvqtUOMweCVyY=;
 b=iHd5VUwGOdTxfAlTBKIIe/lNdUUGHdp7dnT7QFBXGGOdYmseb/sBRzjX2/CYqYb/dZ
 nyDwSQn9Dfr4MNrrzCpYdzypQw+Uam7415owYxl+FXfsvIibheX2FZ6ubFZtRl/L4DLA
 bOxatAOkvq7ivGdCT/OwlnAE1ZBwSdfA+rj7JRLNWy1fJLrq52m/1qGN8lBoVMF34Bbd
 C/yIqh0yYDRI3l3YjB32xIGrZJqF1oIZLOYrFYfp+ejmNuQmHfU8mIMs0fa1TXluDb6+
 8bGJHZMDYPQaXXlDJOm4MwHbl6kBcn22CdUIeQFc6cBUiMYQSc5u69wT6yKy1N6J4C0g
 XbLQ==
X-Gm-Message-State: AOAM532NaHhUBHxKOfrW1QiWQGTkd66zPiHaGBZ4FtPqLBypEMFIPSCg
 /8wDwSZkd/3GPMUKbMgii+VizSylrZtawA==
X-Google-Smtp-Source: ABdhPJyghj9R4GGXDfT+4eH1/NLX0RJussDlH5OI2JuDzSnaa1wQyTy/sxTglKxqhQqvfmt/nloVdA==
X-Received: by 2002:a63:170b:: with SMTP id x11mr5723791pgl.253.1625758706459; 
 Thu, 08 Jul 2021 08:38:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k189sm4002046pgk.14.2021.07.08.08.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:38:26 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] linux-user/mips: Move errno definitions to
 'target_errno_defs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ad4f135-bba2-c19b-e826-401d7b34a653@linaro.org>
Date: Thu, 8 Jul 2021 08:38:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 7:11 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/mips/target_errno_defs.h   | 211 ++++++++++++++++++++++++++
>   linux-user/mips/target_syscall.h      | 211 --------------------------
>   linux-user/mips64/target_errno_defs.h | 211 ++++++++++++++++++++++++++
>   linux-user/mips64/target_syscall.h    | 211 --------------------------
>   4 files changed, 422 insertions(+), 422 deletions(-)

With either a follow-up, or squashed change for mips64 to do

#include "../mips/target_errno_defs.h"

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

