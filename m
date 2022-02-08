Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A404AE54E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 00:11:56 +0100 (CET)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZeN-0005vr-Hs
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 18:11:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZVG-0000OV-5c
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:02:31 -0500
Received: from [2607:f8b0:4864:20::430] (port=44953
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZVE-0001O4-Lg
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:02:29 -0500
Received: by mail-pf1-x430.google.com with SMTP id n32so999974pfv.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 15:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=xsTm8+a8hoDIjc4KAv6m8IDYSVLWwoY0STkDCoxY668=;
 b=HSao6x5JlGhAnFogNAPL5U30oMuNTTmtjZeqEZb2r/m+kSokd1YKly+tKe/gnY711f
 TYWD/HgfrviQkDsKWz/sppGGpVUSQ7C99l7CaJA1QEOS3TJN3qxzs/vt8bxy3ADStUuY
 eFgXD6TJ9UpEghOg73/qqWML0L2r6LSHUf7eUccriPX+zbncTiyJ9V48okjg24YKNlwJ
 byJZPu8mQUOJ+GHJ0LtFXVDxPL7/PhkIBLz+UX5o7pmIj6a83boHf7O4xlf3k5G9Kbwh
 uUFGSKvcoIQ5DqoDb6IAHGdD9iTtNIEB393f/xIVmGWLM+nJ+yACAPZ3W6sD2Hksi1Q9
 Bang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xsTm8+a8hoDIjc4KAv6m8IDYSVLWwoY0STkDCoxY668=;
 b=OnN9n2O1G060Z1WAbZPvAM6Qwm+XxVYmVd1v2qIgQrCfK6EppTiaT0AsOYQ2UDK8by
 1V0sBxUgQWf1aL0nNcM6sUpfc17QhUoTUhNMH9oF8jVVlDHgdUxmdcibbpR2ZczRAm64
 L6MiULwRdaCHe2XD7IknkUwuIdfKZDBxKFiC9AvlaYznjH8d1qYalLbIOPQlozi8c+nK
 1GB/09F3tkOQMaX+XzpBzPIxTu1hqAKqDf2z8ehoxGzjSqAWnUge70Rjoo13AxPmalTL
 yDt+Z0aQ/x6m3mAswJRloxQ4e7wjQVrB6cUAaHMBd2HZ641rsnzZXxDONx6HXYCtfF7G
 WhrA==
X-Gm-Message-State: AOAM530LAfyeKbRS7PPEWqvdEDhR2GMTFvVlyFn1W9/BFbJPC3zU5OnU
 08NGMyBI9cRAjnAdCQXtb9shLA==
X-Google-Smtp-Source: ABdhPJwyLDPislH2jmVp9SoT6z6KmIhpR8kn8Z835a5q7ZgSdEkQHjGfEao+s3Lg9V9KyGN5/Yzz0A==
X-Received: by 2002:a63:86c8:: with SMTP id x191mr3060198pgd.362.1644361347123; 
 Tue, 08 Feb 2022 15:02:27 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id c11sm11661901pgl.92.2022.02.08.15.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 15:02:26 -0800 (PST)
Message-ID: <9275b605-62f2-1c3f-5ec9-6b69b17c0b54@linaro.org>
Date: Wed, 9 Feb 2022 10:02:22 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] include: Move qemu_mprotect_*() to new qemu/mprotect.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
 <20220208200856.3558249-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208200856.3558249-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
> The qemu_mprotect_*() family of functions are used in very few files;
> move them from osdep.h to a new qemu/mprotect.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/mprotect.h | 14 ++++++++++++++
>   include/qemu/osdep.h    |  4 ----
>   tcg/region.c            |  1 +
>   util/osdep.c            |  1 +
>   4 files changed, 16 insertions(+), 4 deletions(-)
>   create mode 100644 include/qemu/mprotect.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

