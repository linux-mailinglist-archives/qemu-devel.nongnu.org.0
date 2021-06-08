Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA439FDEF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:42:33 +0200 (CEST)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfkG-0004YR-9P
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqfgx-00026f-H3
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:39:08 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqfgs-0007oC-D0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:39:07 -0400
Received: by mail-pg1-x52c.google.com with SMTP id l184so1562507pgd.8
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kTsLskMHvzRsJMcVD4lhsWFkG7uoZzrwivIU/3dwtiY=;
 b=xVS8Z+esGF+r+d9LLnnPefyebU4gJjDpGVanwAJetM+/pB9IylGvKL1gRfVFMhwbx1
 apgCUuKPl1bxlov17K4iu1jH9a6GezAqKNh1b8xnb3ocqB0JeDXKOtMAvSxKXImVCAeR
 K71BjImfml5F5YDWnLpRcjEBUkl67nXj7QfQjIBuc9ODVzoWai30JTi0X/qIK9uUM08o
 rA7YzzQt2+lRN2JqX1UxHYxYwTMwFTzhWoKYSAo6Aha64Aeve16IdIPhgSz2CJ546qGg
 KJUZyGabhj13UU/y8NtOxMLi504W+VuZcobmhfClaiXPCNIktAfk1MaPCzOlxm9ojbET
 3w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kTsLskMHvzRsJMcVD4lhsWFkG7uoZzrwivIU/3dwtiY=;
 b=t9hnGwbb0KRiAWiJ4P8Lt2iLTVqhF//Hue0cE6jS/AySGP+O5AD+/IrFfzdT2+fnSl
 QELH0uYVpQCpXlTtMTmQXeEiHD6DeNJ1FD69WtKcoaNCU3yKuYTHeVcIzq+Yp+x037Pq
 dXGCJYWM12gV2Y86lcAvXUAGrrlL4uqDmovamsVFvTUV2MQI71ew4b9/92DSXhJhf/wh
 OwUeOCtQJRmMmFSys8PvtvHjy1Nsd0L/M+pq1gGAl7LBUWRpmrDo+F9/Ub8d9KbNtfVd
 qJBuLJro7E86Sgs8HmkFE9YEWj+Z3Sed32jC9cQmpwmjvUR8RMscMZbn82/+8rrORaUx
 su7A==
X-Gm-Message-State: AOAM531jeZYjOiatyteVFflvlu/wkozpPFI9S5++pU/T/A7F09ndRwzA
 hCx0tTOLhog5UZrh3LbiHNg6feBdi4Tpdw==
X-Google-Smtp-Source: ABdhPJy7J88kK31nL5zS9L6ipn3Vj3A+sjC4AMMDqiV7n52o0Jp7t2ykN7Z/PZPaJfLMZPOKGBA6tA==
X-Received: by 2002:a63:b30f:: with SMTP id i15mr23811160pgf.62.1623173941138; 
 Tue, 08 Jun 2021 10:39:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y34sm9296183pfa.181.2021.06.08.10.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 10:39:00 -0700 (PDT)
Subject: Re: [PATCH 02/26] configure: drop unused variables for xts
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fef24c61-b614-9b38-4386-f16850a81863@linaro.org>
Date: Tue, 8 Jun 2021 10:38:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 4:22 AM, Paolo Bonzini wrote:
> All XTS configuration uses qemu_private_xts.  Drop other variables as
> they have only ever been used to generate the summary (which has since
> been moved to meson.build).
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

