Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F735EE336
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:34:17 +0200 (CEST)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odawq-0003Uo-Dc
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaNr-0007mn-Si
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:58:07 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaNq-0003D9-3i
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:58:07 -0400
Received: by mail-pj1-x1031.google.com with SMTP id cv6so2817640pjb.5
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=bX7IGLe/Ms9KNpy6vNdz5xZwIzbPR1K1Pum85llrbyo=;
 b=u2PylXBz1cNaJx9EcAtvzSbqxxZCr2uHW1i+/BgSrx0+P0e0fKhR4nfGLqpZ0h7LnY
 6OFneJ83VA+WvUKdQSSsm0k5SGw+ao5I250jomDDIOB/mKjMSBfq0w50apFat7LSXz+N
 4YfLREVIAn4ciFLVZOPk2EnxMcIT90kXqlEendxNOCK/cIjDShFE6lKuzf1CJhezZV5D
 EUSNs9kE2rTwlv23hyDsouc+N+brtouh5Tv+tHsCTbBv+buIbK90IaGXO+40LYK8Y0/C
 uHQw+pnKFz+7xBFX/ZfFlDg9CaLhp0qgpW864AYJ02b6QPBwzdtumoxfschAzSANTfYQ
 aBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bX7IGLe/Ms9KNpy6vNdz5xZwIzbPR1K1Pum85llrbyo=;
 b=N22Wuafil3zHQFK5aBXWpg3uqwQNihRl3sH1MKVVzOAbRcvIdRNeSsJx+XHayal2Xo
 FWGZZimU5o0TXUq0Q8UAt1iA+Qzch50PVUfMkKWfeKxnykDzcytaU4fPE5vTMbk4yYps
 ZyHM6dPnu+HOm6CQVQICx14wCWeOJKqYocdEH/L6LUN7IL2t72nTbTm6U8PRrXhIFZs/
 FSqjlWCRnkryp+FmqALxxzGNBsZfFgtcjSlcJ649Lg5o6Oxf4kOp3aT45t8EKdIG80B8
 yFpNo5ph8nApqmA/X4T/5p7+X+d13+42dyo40nye16ACuEEE9CaKo5QAm3//BwiStRy3
 QVKg==
X-Gm-Message-State: ACrzQf07mNPo0XOHB2zIMYRBS+LcTXQYA/olEIZW43lCrZbrIjq1htUM
 fogyxYzrs9x7De0F+kDqOMx//A==
X-Google-Smtp-Source: AMsMyM7taKnMkU8+uaRgVFhqz8MpRlE0Xdg9NIGws2dcu1yQpQZXu1jt9vMSv2qVdCQYCzxSTD4qmg==
X-Received: by 2002:a17:902:da8f:b0:178:399b:89bb with SMTP id
 j15-20020a170902da8f00b00178399b89bbmr733746plx.57.1664384284644; 
 Wed, 28 Sep 2022 09:58:04 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 22-20020a621416000000b00541c68a0689sm4220465pfu.7.2022.09.28.09.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:58:04 -0700 (PDT)
Message-ID: <7986cfdc-3ffc-48d5-abf9-56fbc0337fcd@linaro.org>
Date: Wed, 28 Sep 2022 09:58:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 07/15] qtest: make read/write operation appear to be
 from CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/27/22 07:14, Alex Bennée wrote:
> The point of qtest is to simulate how running code might interact with
> the system. However because it's not a real system we have places in
> the code which especially handle check qtest_enabled() before
> referencing current_cpu. Now we can encode these details in the
> MemTxAttrs lets do that so we can start removing them.
> 
> Acked-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - use a common macro instead of specific MEMTXATTRS_QTEST
> v3
>    - macro moved to earlier patch
> ---
>   softmmu/qtest.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

