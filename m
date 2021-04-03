Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC0E353579
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Apr 2021 21:47:43 +0200 (CEST)
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSmFC-00080h-2Z
	for lists+qemu-devel@lfdr.de; Sat, 03 Apr 2021 15:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSmDy-0007S1-Ee
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 15:46:26 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSmDw-0003AO-Cr
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 15:46:26 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so6067163pjb.0
 for <qemu-devel@nongnu.org>; Sat, 03 Apr 2021 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aWuMgXK2MjXEvdnVSP4NmEJDJEsKhp+6uFfDHtB0Yvs=;
 b=LgGG3gN99KmLtbYX81UMem31/ijnlDH1Zs2Oy4AWjrc8sOPsPvSpXP8rvrklw+bJXh
 w+7rDGX95lOeaQ7zLkT8HITvXndI9lDeZ/C2vovqW2V1Wt6odsEEewAoOc1FY2h3GQ7L
 WZ7AIN6O0rPrak8kJCU8qv6txXlQS01krNAIRIRw2Ny9EZoEJaLzkJQfGaFdeidLj8l4
 acJA8VyhDlHqGH3SCFaFHpAINFtAc/WRnor1q6etIOtxBOu4ktVIjm2s1C8zFEL+sRk7
 oOxbyZQkk1HpkksNx7LP0pUy10r1htfYDG/9eVD3ybYArrgOWHfk+riW2TKn/fcQzonn
 8XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aWuMgXK2MjXEvdnVSP4NmEJDJEsKhp+6uFfDHtB0Yvs=;
 b=CwtJMqIZTgi3rjLCVBIA8iumLJIF0p1sAyClIHgtVIZ/Ct6lU4vRc6O5gZTvEZJ3RT
 cXOnpH9D7icSA+4FXNSWGIqmqq/kY+p3tJxyPSqddUOdlv6H5M7NJZcexpxbv2yKVWqA
 zHZGJzFetK0JNZJDZfB0SPO93GHoG6eSfVht77LFUrUW6TRPVkogTiJmhlLf//ICv/nC
 T7SZbkgLkqtmtLyAUPUP/yhs7hsCdNDc9ll533tOBLekEy6HRra9yt8LFh5LbDCm6DgW
 galndx7ewcqFAtz/eaT82edTNUIz1z6MWDRDr2VAz7aghb3hTiJR1SKR9bmaYDcHV9ir
 IvXg==
X-Gm-Message-State: AOAM530PvP51xu8GelFm99wvElaJ5TWxZD8B0h5JTclI3xK+TCk099uE
 gAaxcJyXZYqOgT1DT+y3rODxrUM2FlCB6g==
X-Google-Smtp-Source: ABdhPJzNPIyspeUVW1Va6Xds5kiobFZQ0++ZPHg3/+uAQKIW4C/vcQwQR0nrGXdVErY6iEQGWGG0ZQ==
X-Received: by 2002:a17:90b:4c0a:: with SMTP id
 na10mr20169860pjb.227.1617479182621; 
 Sat, 03 Apr 2021 12:46:22 -0700 (PDT)
Received: from [192.168.81.184]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id g3sm11424189pfi.31.2021.04.03.12.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Apr 2021 12:46:22 -0700 (PDT)
Subject: Re: [PATCH v3 00/11] target/arm mte fixes
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210402214217.422585-1-richard.henderson@linaro.org>
Message-ID: <223bfe3b-8959-efca-ddd7-2e1103226a05@linaro.org>
Date: Sat, 3 Apr 2021 12:46:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 2:42 PM, Richard Henderson wrote:
> Changes for v3:
>    * linux-user mprotect fix moved to start, just to get it out
>      of the way while I reworked the others.
> 
>    * Patch 2, the fix for unaligned accesses, has been split into 9.
>      Hopefully these are much easier to review than previously.
> 
>      Technically only patches 1-6,11 are required for bug fixing.
>      Patches 7-10 are only cleanups, but I think they're important
>      for clarity post bug fixing.

... and it fails all of the kasan unit tests.
I'll have to investigate more next week.


r~

