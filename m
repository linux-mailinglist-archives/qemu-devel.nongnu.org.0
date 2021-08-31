Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BF43FCC1E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:14:29 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7L2-0003mk-BU
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL70b-0002hI-VM
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 12:53:13 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL70Y-0007Vn-RE
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 12:53:13 -0400
Received: by mail-pl1-x629.google.com with SMTP id m17so11001956plc.6
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+OfqhvwjCgB6hEE/GND78OAQI4vErCGstjkbhsx7b1w=;
 b=Mvqwo9WdcXH3wiYSwvx4XhWVS77WkwlZ1W/0e2UQX40vepl2QCgTsbfCwLYGdQx0nA
 +6+QGKdt5aqz9xecWqU43TMRUgxFZbtx45i7Y2SQAsa/2dKjZKNAkWDvcku8MklfzGwv
 fgAzx/5JDq4BB/eNKlGP+JBf8okN6zEH8pNL7dik4YW0YA9io3H9JwVZZTjXMIkaJrqJ
 3xwVwFt9bvKcdWsu9gFAQOZ8/bKTT40v2iEx/Xenhb1R0xcj5ozqHN3zQlzTu3BpwK1w
 NPQoGZHaATqo6PtQbCKcyp/MMoMp/tXSO9ZyPzFt6rUKioSDZfLRHcATwYR1GhsSzoJz
 vt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+OfqhvwjCgB6hEE/GND78OAQI4vErCGstjkbhsx7b1w=;
 b=ZOT8XzDTHI3b/6ssbBC7SMKNOc4OPSLD4zidNOqgL/WwSGk5Fg051hEEObcO3t7YY9
 0JxVXrwfQmuzwMKNhza2RZVUO4eopXquTkx8N2bnAOty6nCYyM5nR/JZabDabAd3iaqV
 MMKNxSxBMlVIoC0knx5nxcJoIgKsr32ZC876rRpG9Hw5zYUeq94MszXD9E+MIyZM3glG
 OpQXSGmV9ssDKUpOtVrmAMVdTiQOeJJohDZ4gRaUpdzOOJa6sjvH61C4AHYTALePyoOa
 YQkbNXJjLgjpSNv/eVqsb9kheeRo9Bwvjd49LE0tgobX3FzTwh+d3eOIzWuAr4Z0zj3q
 kZgA==
X-Gm-Message-State: AOAM531OXDAXd47Cd7BZLhgDPZIKQr4gx2KErHwiUIw0N9gsRkBZkXFC
 L4cytGXLfXX77DECRtIBC0Sq9w==
X-Google-Smtp-Source: ABdhPJze4XUnDIDZKbLL+32gHj+Qb189OIoi3ym2vICo/Nls1qKfmL5pcaIiZtIABMobgdPY9wR2Eg==
X-Received: by 2002:a17:90a:da02:: with SMTP id
 e2mr6667587pjv.89.1630428788983; 
 Tue, 31 Aug 2021 09:53:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id j17sm19033563pfn.148.2021.08.31.09.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 09:53:08 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/intc/arm_gicv3_dist: Rename 64-bit accessors with
 'q' suffix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210826180704.2131949-1-philmd@redhat.com>
 <20210826180704.2131949-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b93bf05-84e2-13d0-83f6-e8ab610dfb81@linaro.org>
Date: Tue, 31 Aug 2021 09:53:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826180704.2131949-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> QEMU load/store API (docs/devel/loads-stores.rst) uses the 'q'
> suffix for 64-bit accesses. Rename the current 'll' suffix to
> have the GIC dist accessors better match the rest of the codebase.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/intc/arm_gicv3_dist.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

