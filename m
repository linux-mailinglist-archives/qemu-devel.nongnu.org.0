Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF54FAAA7
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:12:38 +0200 (CEST)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndHRl-0002eJ-3M
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHPd-0007n2-H1
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:10:25 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHPa-0007hl-Ip
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:10:25 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so8378798pja.0
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5gwhRLe75XhGO0u1FeswjatRtMSm7CsBZnIlbEPN5Ws=;
 b=oNXrYDvN+1pm8k9zem/Whl8ieYXKVzLsu82NcskVtX4D1rZno0vSJSTJvo4H/ZlHnE
 d9zIsxOnVJqROQZwltBdO/cDItXBAaTAGlVLBrRdESQKwMFf37XFfQFQqAe7B/MliuwX
 p/ElIFK+0XK+ab00QoUesbamitpup31Ta33jF9W7KFwDwzYPtsLr8pEl5fLiH/Tb3Heh
 cSq0XRc/h+5Cj6FVkbBXKN4V9+h3OH1lvL59VDAjpz74EFmciIyqoYXqW+YH/BHjXaTe
 z60hZoq9iSK9F4Uc5q3klEANLnAOId0uVWG20XG+UPTid8692IUTtMsn+PcdpPbtV6Te
 caJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5gwhRLe75XhGO0u1FeswjatRtMSm7CsBZnIlbEPN5Ws=;
 b=im3NNDgxcxGb4ezU8KTVN2zYzz3eR/NkAd2kYhZVcKk/uyN2Ez1xgqkPg/0EfFrmVz
 LRDEGSHPaboVR5HPmNbC1V36h1ociQtktsYcqo7mZ1P5Gx7kkY1kItvyc8RmW43Z0dm6
 7y8POdNI0jT/IWpGJ5vT3QHVcCmqnfAR2n6fXFm6x8VYEu/rP6PwITJZlERsB2SqiYem
 JNyrr9HH36Lt+/BWF2kcOd5QoupkbPCi0JRI4rGk0+E/vw/PzdB182s1s44sx+V6jzku
 eQX3Yl2CCHpe0DujfT3ZamDJjB+EqYYxs/5OJKRWGmDoHenc9GyDEi+LWyvlItBQOF+1
 AC7Q==
X-Gm-Message-State: AOAM531QkV5OtogajQFInbE7ws0eHUDEL5sRoIGWkxZZ+sbpJf9KFSsa
 9DSiMo62f0lbbGvEl1aTLlfUfA==
X-Google-Smtp-Source: ABdhPJwB6iJoaXoJjTAHJZPVJglf64QUWZa10XusxwpVAwYq5zN/mDW/djmw/DXiufdLUFjBR7U5vw==
X-Received: by 2002:a17:90a:380d:b0:1c9:d9bb:7602 with SMTP id
 w13-20020a17090a380d00b001c9d9bb7602mr27902722pjb.216.1649535014333; 
 Sat, 09 Apr 2022 13:10:14 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a170e00b001cb7e69ee5csm402658pjd.54.2022.04.09.13.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:10:13 -0700 (PDT)
Message-ID: <5d7391a6-21d6-01b4-fee0-289c3891def7@linaro.org>
Date: Sat, 9 Apr 2022 13:10:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 29/41] hw/intc/arm_gicv3_redist: Recalculate hppvlpi on
 VPENDBASER writes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> +    if (oldvalid && newvalid) {
> +        /*
> +         * Changing other fields while VALID is 1 is UNPREDICTABLE;
> +         * we choose to log and ignore the write.
> +         */
> +        if (cs->gicr_vpendbaser ^ newval) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Changing GICR_VPENDBASER when VALID=1 "
> +                          "is UNPREDICTABLE\n", __func__);
> +        }
> +        return;
> +    }

...

> @@ -493,10 +574,10 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>           cs->gicr_vpropbaser = deposit64(cs->gicr_vpropbaser, 32, 32, value);
>           return MEMTX_OK;
>       case GICR_VPENDBASER:
> -        cs->gicr_vpendbaser = deposit64(cs->gicr_vpendbaser, 0, 32, value);
> +        gicr_write_vpendbaser(cs, deposit64(cs->gicr_vpendbaser, 0, 32, value));
>           return MEMTX_OK;
>       case GICR_VPENDBASER + 4:
> -        cs->gicr_vpendbaser = deposit64(cs->gicr_vpendbaser, 32, 32, value);
> +        gicr_write_vpendbaser(cs, deposit64(cs->gicr_vpendbaser, 32, 32, value));
>           return MEMTX_OK;
>       default:
>           return MEMTX_ERROR;
> @@ -557,7 +638,7 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
>           cs->gicr_vpropbaser = value;
>           return MEMTX_OK;
>       case GICR_VPENDBASER:
> -        cs->gicr_vpendbaser = value;
> +        gicr_write_vpendbaser(cs, value);
>           return MEMTX_OK;
>       default:
>           return MEMTX_ERROR;

It it really valid to write to vpendbaser with other than a 64-bit write?  I suppose it's 
possible to order the 32-bit writes to make sure the update to valid comes last...

Anyway, not really related to the real logic here,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

