Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F24AE53F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 00:10:02 +0100 (CET)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZcW-0004u1-Nu
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 18:10:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZWY-00024d-6m
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:03:50 -0500
Received: from [2607:f8b0:4864:20::1034] (port=53044
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZWW-0001Y3-AF
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:03:49 -0500
Received: by mail-pj1-x1034.google.com with SMTP id v4so548109pjh.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 15:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=QOhK60+wbEQW61FCjHBfUBHaL2oZjBX/ZAbDSwkdwWE=;
 b=tQztKea1izEppyfGyyyGvs/cyZybwC59NfMw5QEsrV3b9XEb3EUQB0zTvbrz7/vPCn
 Y8jN/2an/WZhEDLAsjLmvmK/d7Ryd0MgNwfFl3qZPCSZbyRINsRjIqtsE6YsyFybAAZ6
 OO69ggHCTN3qogcK/n9TyPTCzVhyRBuYO55rgjTo9OCXr/QKCsHdMXopDiGTUST4RQeu
 pZ9drB+e5SO035jS+tqmHccXjW8jM1GiWcOdRtBOdUw9YcEsqpyPmQrMWzRHpATgPVlT
 xNJQga4WpRDXM2ppOKcmYSXexsF4B3Su0JJcl/5gI8NRk0tsSoOwUimq/2G4K3IZ+uyd
 UVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QOhK60+wbEQW61FCjHBfUBHaL2oZjBX/ZAbDSwkdwWE=;
 b=DgCu1/732OnhHSftLnAdCEatOjcv5FedfDjOpUJLAEXXBdYVqGu2i4Tjue3XmSGel7
 M1iIM+9pEL5yayWT3s7H+v6q0fm0z4yAsiWnIF1BE/vSV16wUc8mLe7oL+JDgBTyWvkJ
 l9zedCYrdLO5YZ22uOrrjR0LgfEuZ9lqUsdCyHEhYVPDRFCGOhA/HUN8RLmj3glqGUU2
 ljX1mVinu5ZT/py6setFPNyXRv5brOP7qXoEQ+zhkQud6IxIyvKsBO3/aAZ7eJXe1o6W
 Qd4EOl/AVNRYGLoJVHdyGi5gmnRFOBxpUzV209+BiCMM8Hu4hVokn9DpYv/nIee07RWH
 uFlQ==
X-Gm-Message-State: AOAM5312apXquPuDiH6TGnyo/VfJqCi0iUrxyGRw6sqMM5+n7ySsWPA+
 atxrwKxnBQk4u9CuDHzoLwPOWQ==
X-Google-Smtp-Source: ABdhPJwAkXCJ6SwMc+UQUiBRj47uEqTEy0G5amblHBw+Su/SgIL1VP7KDqu6msy5ADT6b/2wGfWp5w==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr243240pjb.183.1644361426964; 
 Tue, 08 Feb 2022 15:03:46 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id u9sm9002091pfi.19.2022.02.08.15.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 15:03:46 -0800 (PST)
Message-ID: <228a38c8-e8ba-aaef-21e9-335d0f7f7051@linaro.org>
Date: Wed, 9 Feb 2022 10:03:42 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] include: Move QEMU_MAP_* constants to mmap-alloc.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
 <20220208200856.3558249-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208200856.3558249-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 07:08, Peter Maydell wrote:
> The QEMU_MAP_* constants are used only as arguments to the
> qemu_ram_mmap() function.  Move them to mmap-alloc.h, where that
> function's prototype is defined.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/mmap-alloc.h | 23 +++++++++++++++++++++++
>   include/qemu/osdep.h      | 25 -------------------------
>   2 files changed, 23 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

