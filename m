Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD32F668ED8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGE7v-0007IQ-6F; Fri, 13 Jan 2023 02:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGE7f-0007Hv-Jp
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:05:07 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGE7d-0006TY-Ve
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:05:07 -0500
Received: by mail-wr1-x436.google.com with SMTP id t5so15763001wrq.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 23:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sTtQG0D8011+lAhkubAZpH8IOeLiOYg5hO89Ki/dH6g=;
 b=XOiS/dHvUH7l+4QS5QXb+XdC/wflJTCjDOe8rzXiZfN6R1FvF+TQHYKm/YJ5PAPceV
 kx9OsHl5ooQRoRoAoujmsRj2KLNJBaQ7vpzXkX8iS+00vx1nEbE2j6ErNmRDlyYv60tY
 DJblzypl2H2N/6UKKGHnpG6XycupBsbAd40ss4RFj0NUKwX6l+VWt9/0I7s8lIzrvWcn
 A8D61YohX1LK2HOfXn7BeA+I9DBdIWcN4zTKU/ZBnLCx+g4uh+oKGWXX7K54P2FKJnZm
 Orh5mfKBwNMmLUY2c8Jve9J2l1sBbg5V5bDwA4TkFPbFhg9dTKEWBej+cYts86E32M9B
 Ecng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sTtQG0D8011+lAhkubAZpH8IOeLiOYg5hO89Ki/dH6g=;
 b=p4NTJ0NZoL92L7MWGyybtSg84cRV8jxAL4dXXem1DfNt7hIqlsTsliIiJTNS4StsWW
 7d6oOmdS344jst1IyfbSbc9mMU6ZWZrGMQKeH/YUQ2x+Prxuq+vurzHNHerX1ByuK3D4
 Z3bFR2s+vueCm4JmFOaIdDgz4oIilq2aQ62KMg5oWg51pvN6NTdajiy0Z1+WIZQBYwxC
 i1EzEN81Vb8U/Anb/2W0CtXG8Zfkq9nXr9/hYGvPZWwOiVcthYeeIHfpKS877bX+bDDm
 /f5URqX6KCJ2DgGOj7lvQz3WEpXmPbcdfIareOIPQbT60eTDpBm79iDBB0Z928lo2qjp
 03lw==
X-Gm-Message-State: AFqh2kqgAH88ad91+wlBeESkdFzH2ipO7mNplT5xg/FeI9/xtuT5pxTI
 WupTKUWUGGpDvPo7ibZuBV5rfw==
X-Google-Smtp-Source: AMrXdXtAXpW7qj0bICQLHjJamEXCCRHdXJfxQk8pBm8I0nsgF0/35JopRs3lNli9+xqAhHQYNJkiKQ==
X-Received: by 2002:adf:cd82:0:b0:2bd:bf44:2427 with SMTP id
 q2-20020adfcd82000000b002bdbf442427mr7648119wrj.42.1673593503772; 
 Thu, 12 Jan 2023 23:05:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b00241bd7a7165sm18144612wrp.82.2023.01.12.23.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 23:05:03 -0800 (PST)
Message-ID: <26c3c3c8-61f5-8f56-9094-1699fcd516ed@linaro.org>
Date: Fri, 13 Jan 2023 08:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/6] qemu/bswap: Use compiler __builtin_bswap()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ira Weiny <ira.weiny@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230111163147.71761-1-philmd@linaro.org>
 <988c2552-f378-f028-d11f-1261c0be1281@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <988c2552-f378-f028-d11f-1261c0be1281@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/1/23 02:05, Richard Henderson wrote:
> On 1/11/23 08:31, Philippe Mathieu-Daudé wrote:
>> Implement Richard's suggestion to use __builtin_bswap().
>>
>> Convert to __builtin_bswap() one patch per OS to simplify
>> maintainers review.
>>
>> Since v2:
>> - Rebased adapting ./configure changes to meson
>>
>> Since v1:
>> - Remove the Haiku/BSD ifdef'ry (Peter)
>> - Include the Haiku VM image from Alexander
>>
>> Philippe Mathieu-Daudé (6):
>>    qemu/bswap: Replace bswapXX() by compiler __builtin_bswap()
>>    qemu/bswap: Replace bswapXXs() by compiler __builtin_bswap()
>>    qemu/bswap: Remove <byteswap.h> dependency
>>    qemu/bswap: Use compiler __builtin_bswap() on Haiku
>>    qemu/bswap: Use compiler __builtin_bswap() on FreeBSD
>>    qemu/bswap: Use compiler __builtin_bswap() on NetBSD
> 
> If this passes on all the odd OS's, great.
> Failure on some oddball is what blocked my patch set years ago.

OK I'll double-check.


