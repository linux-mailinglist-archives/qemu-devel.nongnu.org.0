Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDAC3A1D2
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jun 2019 22:01:22 +0200 (CEST)
Received: from localhost ([::1]:60276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZhWj-0007ZF-3g
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 16:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38964)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3r-00015X-4o
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3Y-0000lq-ME
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:25 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34118)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh3Y-0000kE-C1
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:12 -0400
Received: by mail-ot1-x342.google.com with SMTP id z24so4934087oto.1
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pfln7wd5mhIs+icRTimn2TRlsXeg5mNcQAH6+4eQP/Q=;
 b=q7y+PY4H8e/1SJK7cCYXg4Y/+Y5AYV22DupmkiCmpcywaXx1gsIQ7sTtsE9AHmznWJ
 uE1cjIH8abDDY1YcOVgrPUC4mzcHEX0VSALuiY9j7pDjn4l+wus7Vdmdze9MzlvBQ4DN
 BHotCW33FdkFJTEvUCjASLt+chRm/NtpXfFiag73zhfNFj8aBRd7+PFNFY1HaOSt2sij
 X/Mpl4zHxxnqKs2irKUo+cplDIDsoRAlaWGYkUQ7h+TdQ4VdVCWk4Popq39nPPXGpTdJ
 Ft+CYz+qT6Xu42OxvbfSZfisUkjqekQel7wxiK3k0w6BmJjqqhxV//J9Pqj7YN6Md5ny
 dVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pfln7wd5mhIs+icRTimn2TRlsXeg5mNcQAH6+4eQP/Q=;
 b=ZTamwN5x4dBP0Ts5iLqQUVT9infN+6Pv6Nh/kpNJIQowDp/V0H8+mgxt3mU63ez8ep
 YUwRVzQjV2A/x+9Ij7ZXBQU0b9NVsdXx6bX4zJpXGt5k4P12VpHFYu0G0cwoPhgqImk9
 2goK2a00YBsp15EIsjraDr/HzCFdJonG7r1cf3KTFPjhGme97b/CGszuWPE7/pNVzElB
 wIwe/KTvBdoxGNE4YUe7fQn6Sr+ay7acVA6WJVRjsUd7/VJvHTPZa57U35Gql85YBA3P
 rHCwRgPx5xa+gdR68Hws40Y0/L42KRtrzxXnVKp0KupGm7mzjJzC8Asm5/zG9JGDVSld
 Sksg==
X-Gm-Message-State: APjAAAXwYZdwjpGg6fuHXjzg+TqDiWCX6AJblqPquJ4g3ym8jFd0tDNR
 jl1RpPD7ltgGfwrFq48JRD1G3BJ6efnOoA==
X-Google-Smtp-Source: APXvYqy2WSY7rAk8R4UX7/ZnL+EFccOjbl6Tvh7wDKHO13wZ2wyT1bAe+E/r6j2VjWP7Wg9d2jQz7Q==
X-Received: by 2002:a9d:62cd:: with SMTP id z13mr13554027otk.251.1560022271172; 
 Sat, 08 Jun 2019 12:31:11 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id r200sm2062656oie.54.2019.06.08.12.31.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:31:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3ef5efd3-e4f9-44f0-704a-b6ef7bfea9ee@linaro.org>
Date: Sat, 8 Jun 2019 14:24:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 41/42] target/arm: Convert float-to-integer
 VCVT insns to decodetree
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

On 6/6/19 12:46 PM, Peter Maydell wrote:
> Convert the float-to-integer VCVT instructions to decodetree.
> Since these are the last unconverted instructions, we can
> delete the old decoder structure entirely now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c |  72 ++++++++++
>  target/arm/translate.c         | 241 +--------------------------------
>  target/arm/vfp.decode          |   6 +
>  3 files changed, 80 insertions(+), 239 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

