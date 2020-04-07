Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758391A1027
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 17:26:18 +0200 (CEST)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLq7F-0004E7-I3
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 11:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jLq6R-0003kz-Cn
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:25:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jLq6Q-0001mN-6D
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:25:27 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:37830)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jLq6P-0001kQ-W5
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:25:26 -0400
Received: by mail-pj1-x1041.google.com with SMTP id k3so904291pjj.2
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kjsldSOR7/bneU8dWW7v++OHvgKrnHoq8Zuq/r88egI=;
 b=NhtuxjNdux6y4PoIlBwTX85sEl9yHZRijH3JV93Mj1iOtqQJbjxA14NnhxbJ7OKWrU
 pL/RB3ilE9BuAjWrud/ifkbUlS3nq/Ix+ivzvHLWTxtMNzgXxQ0iOkg4NyD0YHOVOdh3
 viU/uHapD58S/XJNgA5DAhQK9BYVZl/J4Z3KYPYanAoJf94yjE2gjBRgo8v9s42iJ7Nh
 ls2OPdGnI+HqdDg70vNKhvR6Gpvipxmmx/1S6t3YwGLjKBkRyiVa4LwhzayaznGG0HPq
 fnUKdnB3q8yU9aGxIxMyZPIXLJAqour3CPsxloQ/jbP9vy0QmgvyahBTjT9MW1Wcak6z
 2aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kjsldSOR7/bneU8dWW7v++OHvgKrnHoq8Zuq/r88egI=;
 b=YT7abvEDR/gcyLyLX3EZfUDzsv12E5Gp8Aiz9+QhAqJ663xMCdzNWS8wCay455huZ6
 uiDw+kS4tyqhUqaEd7Y15VfPm0wghYNq0HzAkCeEjWm3qy875wweBs0mo1184ZIKdAhV
 N7/qFMVGO+7PXKek4NXL5mmFUEVpnTQPzRP5Y2dL9E3L6ke6e17k3pOFngtZckgKByiB
 OPv6rUzVzC+8eeV2pNWdolgf7MZNqtqwOlbkumG746mKsqhLBRvUQWgOrNZG4N2iklrO
 Xo/L/1c5o7DIfSA6pHGlzkaSCOWXpiHHsEB73Mwx0oKlV0/KGfJjgEkI0pPUWgNZY2V2
 O9WA==
X-Gm-Message-State: AGi0PuYRFOfFaOEytHOkt/YNvorWT5rhhBEVd+TMOmv+0e76vvthO++X
 GBijiCkv8hdRxpKKHpx2btcMzw==
X-Google-Smtp-Source: APiQypLbcD40GJ/9Mvsd+wOnb4q60OPX/a9mKk18mIQ62RpCZwODHNKPptz+KihEfHRsBwkLIc4doQ==
X-Received: by 2002:a17:902:5acb:: with SMTP id
 g11mr3037351plm.18.1586273124816; 
 Tue, 07 Apr 2020 08:25:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id c1sm1886897pje.24.2020.04.07.08.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2020 08:25:24 -0700 (PDT)
Subject: Re: [PATCH 2/5] atomics: update documentation
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200407140746.8041-1-pbonzini@redhat.com>
 <20200407140746.8041-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25ba1237-510d-cf4a-2b4f-c5fa1d715976@linaro.org>
Date: Tue, 7 Apr 2020 08:25:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200407140746.8041-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
Cc: fangying1@huawei.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/20 7:07 AM, Paolo Bonzini wrote:
> +- release operations will appear to happen, with respect to the other
> +  components of the system, after all the LOAD or STORE operations
> +  specified afterwards.

"specified before", not after for release.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

