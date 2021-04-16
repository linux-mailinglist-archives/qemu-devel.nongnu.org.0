Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CC3362779
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:08:43 +0200 (CEST)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXStW-0004J6-Hx
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS5y-0002Zy-EG
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:17:31 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS5s-0005BV-2g
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:17:30 -0400
Received: by mail-pl1-x631.google.com with SMTP id o16so727552plg.5
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WmxOUHnglLZNg/aZkn6gfGHiRCcWDC6NJbDc3b9B2xg=;
 b=YMcOyozGPCCYa+v/xulkxRK3lcgxt7L+W032RtDhpS5a5NbJQoO0rIn7dOUGc90OPI
 oEodFtVjlZ23wLRwHRjZmdMDSY++dMSD1PucmoOjrnLcKjcftKkSWVBmmSzWXCPar687
 X5CIlM/ZL0c8/vy6itXnmYEsN/MHwghi2eAWjaDthG4NQwQ0W7rNSblAS7ODDNfUGZN5
 FF+xTACJvSo+/k8ZMjgp2A39LEHyyRXK6TUzKolankn6Eq0U/UOwz11wgdDHfXB1ArCV
 BNeeagiwhL8vmpbaNpUvLlqUYUoaAC3bTQh9McgfAJnNn2vLgHJvYGFxhtvyCIaMbUAX
 o6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WmxOUHnglLZNg/aZkn6gfGHiRCcWDC6NJbDc3b9B2xg=;
 b=lNbapEpmHve2+ftisPpFwOrUAdwK6xsQiyO8Sx4A8t/ewPzcmnGMk/jLaljUug5kAc
 lhwlAhgVKw8tAw827cuiouxK6pJFa+4f59MblSqE341mAZZwL2KbpKadftKsiIPL1xQR
 5R+LaA20w3nR13QAzZdZL9RzK2yywJj7bR9M85yiskUGZcJtoG/SZy+GOzzlNdlonJP7
 CIrQ+qCUf10dVkr6B3TBYezt55EK1VCw9CDH55YlucYxnvjXbVzKrltNx/s+Hpz4oBgq
 qVETY5L2nvMRy6zd10jjoUjVuH3skKgK4Qhohpsx1aEMWODHNdkROYkRqTjQHLqJwDcl
 6Uqg==
X-Gm-Message-State: AOAM533HzgVn8ycFhoRMCvX1bIIF9jZJaT1cqoUVq47ughDOtt/XGOGd
 WQ6zGXYY/53upwXb7gY6w4gNQQ==
X-Google-Smtp-Source: ABdhPJy+DvEidZS2fmJfRhcFSPOmzPdZUo2Ui6N/vLdONLvwOAQrxMxzRZ+hri90pWVCG8R6yS04dA==
X-Received: by 2002:a17:902:c40c:b029:ea:af9e:b123 with SMTP id
 k12-20020a170902c40cb02900eaaf9eb123mr10585833plk.30.1618593442726; 
 Fri, 16 Apr 2021 10:17:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 71sm128734pfu.19.2021.04.16.10.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 10:17:22 -0700 (PDT)
Subject: Re: [PATCH for-6.0? 3/6] include/qemu/osdep.h: Move system includes
 to top
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210416135543.20382-1-peter.maydell@linaro.org>
 <20210416135543.20382-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <878db201-65b0-5b9d-9e95-73cfac214f5e@linaro.org>
Date: Fri, 16 Apr 2021 10:17:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416135543.20382-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 6:55 AM, Peter Maydell wrote:
> Mostly osdep.h puts the system includes at the top of the file; but
> there are a couple of exceptions where we include a system header
> halfway through the file.  Move these up to the top with the rest
> so that all the system headers we include are included before
> we include os-win32.h or os-posix.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> Message-id:20210414184343.26235-1-peter.maydell@linaro.org
> ---
>   include/qemu/osdep.h | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

