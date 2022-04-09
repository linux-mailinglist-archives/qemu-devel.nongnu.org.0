Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D04FAA29
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:31:40 +0200 (CEST)
Received: from localhost ([::1]:58738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFs3-0002sD-7R
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFpO-0000wm-FL
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:28:54 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFpN-0001fl-2A
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:28:54 -0400
Received: by mail-pl1-x634.google.com with SMTP id m16so10669189plx.3
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h3u4Pvb7i9roHuzkkXb0Xe66qcJQ8mItjpyXy7hzF0k=;
 b=AeT9kwU0GHF/rU3Ggl/VA1AOsET82F0JBHkjZ1aOwvR0e3NMdrNMzdbnUSKbjeFVqu
 iiJ1Rkg/H9gnmZVCSMs1CO3xrLlIo7m+uJz9M6ebcYSier32yOMhRKNKwde5s6yzMQE2
 j8YBWnwOZ3vdK2btZfhDtjB+q05Cv/nqYHaf0rHF4Xb0Zv4nRyNSHpcwhZQT+9hNUBIh
 0scGnJR5cUwCjcF1MvJfZZ6Ql2KWddYlxolpq6C/rTJsW1WmR5Xqa0l/BXvlQKwJPp7w
 jYxgIASGjk6f90acO8y0SaQVMIsocv87gvhIhT2Q+buk7coiQCHvGstgX0nn7+3Jp4u/
 tYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h3u4Pvb7i9roHuzkkXb0Xe66qcJQ8mItjpyXy7hzF0k=;
 b=hdXBqCBmfgU/FqzkKDegRZ/T9oGMI3zSeVZA6M6oW1bKLfNSpbNvuT3s/HVqPtDgL3
 mT95t97DHza3oXcmN/w93g8LDVeSxo8l8z5JvVRk0+xmfFkJnowQ1z6AIQhFdFDIPff9
 ASAH4i/x7mWeugRtxwzIJz2KLho9FLDOUDjB+ZJoyQ74mtiXRCAJsUmk7/gd9y2FcRVk
 o7CE7zl1gKNyi1pfigWYFmM0lZGXVeD6qcy3AZaXnZZOH7PdPiofPRTftEIPnmzdaBYW
 18oQbFfpMRoPy/oy0QD5ekAMUkL6g9RoxrWUIhv4q6aH1RauaFLpTHSLHlQ9qHa9AtN0
 CV0g==
X-Gm-Message-State: AOAM533c4mUiTmJW0cSe/IjT9603WbqtG+fC+rMnyNqdekW6YbxKcTPx
 c4b0dhqVtxproICi14yA630xEA==
X-Google-Smtp-Source: ABdhPJyIlvy4meL8nqyKwcPdq0URK5xA3gAcBQGmOn084pzud56fQPkesEy/+FKSNJRpl9uzYN0vzQ==
X-Received: by 2002:a17:902:e5ce:b0:156:bb45:92a2 with SMTP id
 u14-20020a170902e5ce00b00156bb4592a2mr25106708plf.34.1649528931784; 
 Sat, 09 Apr 2022 11:28:51 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f64-20020a17090a704600b001c77c6a391csm2366557pjk.26.2022.04.09.11.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:28:51 -0700 (PDT)
Message-ID: <5ff32498-3aa1-5bf1-a1ed-d855fed35a55@linaro.org>
Date: Sat, 9 Apr 2022 11:28:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 21/41] hw/intc/arm_gicv3_its: Implement VINVALL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> The VINVALL command should cause any cached information in the
> ITS or redistributor for the specified vCPU to be dropped or
> otherwise made consistent with the in-memory LPI configuration
> tables.
> 
> Here we implement the command and table parsing, leaving the
> redistributor part as a stub for the moment, as usual.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 13 +++++++++++++
>   hw/intc/arm_gicv3_its.c    | 26 ++++++++++++++++++++++++++
>   hw/intc/arm_gicv3_redist.c |  5 +++++
>   hw/intc/trace-events       |  1 +
>   4 files changed, 45 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

