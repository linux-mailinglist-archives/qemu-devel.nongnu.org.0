Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FAA575807
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 01:25:01 +0200 (CEST)
Received: from localhost ([::1]:58418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC8Ca-0003Cp-Jf
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 19:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC8BF-0001Wx-Rf
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:23:37 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:42534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC8BE-0007rK-7u
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:23:37 -0400
Received: by mail-io1-xd2a.google.com with SMTP id h145so2688304iof.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 16:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LzvX9q6R52TkTLuhnBqHqW2KLCPqvPUV7UKwMbTEkfE=;
 b=BSSqgGpo1Slu5Bf36CI1cVaV9qh2Zk0bkbhhlBOdfLQPoae0UhM1T4ygwirzbZJASB
 04vgtWKx/p9vlT3SCZzLAm1LrT5f1rGfEF7hWtxpk8BiCW466VgjQnDHhUtvevQG0jJe
 YUlmT2n/6qJ+iqgM6I0PooPA8h3Rd269vHrUMQ8NqJlCQUBCkhw+17raeU0o0AuHia/3
 XT4g5M97Co2F5DdxrgyVUhJDK6zhQRUhGJTEYfyMZ0cF0ZIUsnDAI5F8ndi2Yx/WVv2u
 Uff1MvCRdJsnJD3jvVbW8ZJFLZPA50zmFtedT6UoMGBOAEDgPM1g3kkNZ+gZIYD1Cqc8
 qXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LzvX9q6R52TkTLuhnBqHqW2KLCPqvPUV7UKwMbTEkfE=;
 b=V4+5TGgUeS4PXlTVNTj8W5EUWjKEcpembCbPzrIvsGb8PerxcSf0mvePTMTiWaiCGa
 fL+KVbvcW2EFngDsfz4SFhiQHmk8srQBduiAHh9akOIgmR62I6urhOWLYV7M1YbZlg41
 T2tKluxPwUNkDGDpHxfllTN0ztuUNojTL7AchcIkKMxQrrqHZRwVSMAUEVu2HBs8K/6z
 /7d4HX5LDR8VzoEdLi8kMCY59xvXFL25LlXpD1pmDUx8c59v5yVSSPDnETRowBFeHD7/
 DkLfpMJIyDuoNwJCBC0L2z3rXc9vL9/ZEdY5U2fQtBMtug0S/SmZ1RGoCmKESAs+JPsR
 bZIQ==
X-Gm-Message-State: AJIora/lAmsd8A73SGixv5bNmfJcwIqrFeaa79ZrZL6jlUW82rRj2k0f
 /tYJI8YzP0Ov2T7Qxl5neVrfGQ==
X-Google-Smtp-Source: AGRyM1sieeYr/0hCgaXKLD7ub5JBbOI1bUyJoAcbsGB9H6SbCm1g4kqOi6V1Fc4BM1KC2/S9u+h5ug==
X-Received: by 2002:a6b:3fd6:0:b0:67b:d97f:47d3 with SMTP id
 m205-20020a6b3fd6000000b0067bd97f47d3mr1410339ioa.46.1657841014998; 
 Thu, 14 Jul 2022 16:23:34 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 bw7-20020a056638460700b00331c58086d8sm1277649jab.147.2022.07.14.16.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:23:34 -0700 (PDT)
Message-ID: <93eb992a-4619-dbfe-5df1-ad54cfa7d40e@linaro.org>
Date: Fri, 15 Jul 2022 04:53:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 6/7] target/arm: Store TCR_EL* registers as uint64_t
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2a.google.com
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

On 7/14/22 18:53, Peter Maydell wrote:
> Change the representation of the TCR_EL* registers in the CPU state
> struct from struct TCR to uint64_t.  This allows us to drop the
> custom vmsa_ttbcr_raw_write() function, moving the "enforce RES0"
> checks to their more usual location in the writefn
> vmsa_ttbcr_write().  We also don't need the resetfn any more.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h          |  8 +----
>   target/arm/internals.h    |  6 ++--
>   target/arm/cpu.c          |  2 +-
>   target/arm/debug_helper.c |  2 +-
>   target/arm/helper.c       | 75 +++++++++++----------------------------
>   target/arm/ptw.c          |  2 +-
>   6 files changed, 27 insertions(+), 68 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

