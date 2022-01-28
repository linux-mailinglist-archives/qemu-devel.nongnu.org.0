Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D44249F09D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:39:12 +0100 (CET)
Received: from localhost ([::1]:37340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDGEJ-0008W1-5i
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:39:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDGB1-0006eV-RT
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 20:35:47 -0500
Received: from [2607:f8b0:4864:20::1031] (port=35787
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDGAz-0002IS-OM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 20:35:47 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 z14-20020a17090ab10e00b001b6175d4040so3815211pjq.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 17:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T0exQrDNBqAXPUuHt+45xensyDiDusqRYP/IEcSo0AY=;
 b=kMjc2s/4VTsT5fKeoaCdsj1qC9IzXuinBeENS3Jfv1SPLmGNSCD3WwFYri2tGe6c8A
 y+etl7F+X8OygxoEQ9hkiBmptLdAkxSNjAbADc6H+cKlGmTrbJZmfImaoPc6Hp5YJJ49
 aRFmYNwlw7WLvmYg9eTID7H6sfuE9DLsSYr3u06p6ii1X7PLVv/H69FomV28/cx/vxmE
 OLRr8QD0JYUKSCNf0Cat+M8wIfi35yu5bTAL+SJhf4X67t/gkKbZa0kSD3jtHKQR0MDE
 kVmcuewlINwg+cLlTYc9eP8JfGIRdt3Jt7yKiTrTDkrS6ZhKfKCQqoWpmMaGvl4jdvAq
 ER4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T0exQrDNBqAXPUuHt+45xensyDiDusqRYP/IEcSo0AY=;
 b=laLIZWBGa9hpWYT2lfGxqwjIMp5RpM7/+dUn0PjI6TElYnA7vbECTSfBDVLhd+Pbsp
 UvLskoK1enocypGlDuh0u3RHLDtJyIyTDqVw3WM7iCvkHXY0JrAyW7UuBNKiWUdiJk+m
 zC/9idOO0VFSL17DZErdHZ0eziitjBfS6+DRAq/k0mfJVfCXT/p94MMx1Fh/knECFmkx
 0BEKnrjhUe0TtT8OmDijm7NjqnFz+JiDcXLB/J2aTvN+lyWfaVW5isbBZz44s16I0rf2
 FETnrbXJq7NHBJ+H4MhEG8y+4IgKj/EWgEkKFRitkvlW10KjNvQJLfmxm5DwjJ/zYZXB
 ozkw==
X-Gm-Message-State: AOAM532SK3YDSkRxU0vcFhalpR4UbX/XTtB65CHdF9mtpMfpFxYc6TYg
 UI+Naijbaf+LnVI1RDIeTJ6Nqg==
X-Google-Smtp-Source: ABdhPJwXdT1kt+RmE4C0yTGp93dQid1fgf1b+3GLynIavAKFxUltACRQB9s24sqHEnVpdaO9gLb2hA==
X-Received: by 2002:a17:903:18b:: with SMTP id
 z11mr6121702plg.71.1643333744107; 
 Thu, 27 Jan 2022 17:35:44 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id c6sm7113260pfl.200.2022.01.27.17.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 17:35:43 -0800 (PST)
Message-ID: <908f211b-0882-cce4-2fa9-dd43ced4545d@linaro.org>
Date: Fri, 28 Jan 2022 12:35:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/13] hw/intc/arm_gicv3_its: Convert int ID check to
 num_intids convention
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111171048.3545974-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 04:10, Peter Maydell wrote:
> The bounds check on the number of interrupt IDs is correct, but
> doesn't match our convention; change the variable name, initialize it
> to the 2^n value rather than (2^n)-1, and use >= instead of > in the
> comparison.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 6d11fa02040..5919b1a3b7f 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -338,7 +338,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
>       uint32_t devid, eventid;
>       uint32_t pIntid = 0;
>       uint64_t num_eventids;
> -    uint32_t max_Intid;
> +    uint32_t num_intids;

Does this now need to be uint64_t, like num_eventids?

If not,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

