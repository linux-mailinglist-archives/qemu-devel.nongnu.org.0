Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDD13DBF0D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:33:41 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9YGK-00084T-Lk
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YFO-0007BX-Ay
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:32:42 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YFM-0003NB-ST
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:32:42 -0400
Received: by mail-pl1-x636.google.com with SMTP id t3so10173508plg.9
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HS98Z3MuPngXWSfJF/7Py4DnlR+5J+FyFR0VBuy4MwU=;
 b=MxbTmvUUIEC40jKpJPZkxc0CWRivp+W75oWBsEIqre76mOnvUmMirMUGIJxoPGXlx3
 emMJqeclLSMvIRuHzOthYOpea0WzuCLGoj7eECIBkcwaXPbmmACJsQ98NxDULpvuSshw
 qX2byLoK9jztNc6h1XSwwgciTWFLTgqbi/VlZGlS74UM1xC6f2AKr+plRcjp9/4AuBtq
 uZfefUvrHOpIICzVyPY0LZRPWcXr6k6ZU2Le3GpB04NiEE5Mj/YNnQBvG68ntgvhpOsi
 VbtisQR4NdYV7DjC+Iu9F7XZCcR7SzaiQ5NklGnCxYt6f65teq9pq4Li+qSptZh8Vghk
 xt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HS98Z3MuPngXWSfJF/7Py4DnlR+5J+FyFR0VBuy4MwU=;
 b=Rl3KZoNepPEzyKG81DjRjDTKtbuIjs7FfrlyGfO7p8tY5NEnxj9iOCoB707UTy18iF
 100uudikNJIzmPHLuzXA56PewqQJ4jy4TO/hnuBmKSL+vpCVr86tNWvqRebxzkYOJ2GW
 JXNl/slNFTYmGCKLHaaCX3DgG0S8jdCFlAPxIIdzU6ErU4iWRERIaNpXiFp1PETktFGR
 5K3BspQUYBk/obaEOm8lkP4kWCXpup+NEDuBJZNe/TRyN32US46YYoffKgKq2O/ypceD
 GdUboBd9mTEvuEbSXZ9Z6ve7IzKwFEE4fjdzQJl4Ob3oQNu4vWcxxN1/MHhvFdV2eMXb
 0BtQ==
X-Gm-Message-State: AOAM532NAyMc1Ikn2zT+nhWku3RXySWBEuL2NCJp35WSEIdOQVqO0JqZ
 vOtph9plfl5IYoYkcyThkC/8uCXvQoJOhQ==
X-Google-Smtp-Source: ABdhPJzEnxhV+eXsOs5LL+UL7XBbxy9kaEvX8AiixJlsv0X0E4MN1/Ikna5SBwnQtAYyXEknQJApyw==
X-Received: by 2002:a17:90a:9411:: with SMTP id
 r17mr4565239pjo.49.1627673559372; 
 Fri, 30 Jul 2021 12:32:39 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id 20sm3388630pfi.170.2021.07.30.12.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:32:39 -0700 (PDT)
Subject: Re: [PATCH for-6.2 38/53] target/arm: Implement MVE VCADD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-39-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <edd9edfe-c303-5072-e5e0-cfe95a88eba9@linaro.org>
Date: Fri, 30 Jul 2021 09:32:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-39-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 1:14 AM, Peter Maydell wrote:
> Implement the MVE VCADD insn.  Note that here the size bit is the
> opposite sense to the other 2-operand fp insns.
> 
> We don't check for the sz == 1 && Qd == Qm UNPREDICTABLE case,
> because that would mean we can't use the DO_2OP_FP macro in
> translate-mve.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 ++++++
>   target/arm/mve.decode      |  8 ++++++++
>   target/arm/mve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  4 +++-
>   4 files changed, 57 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

