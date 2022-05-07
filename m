Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1781551EA67
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 23:56:55 +0200 (CEST)
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnSQ1-00047D-LW
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 17:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnSOx-0003S2-Jj
 for qemu-devel@nongnu.org; Sat, 07 May 2022 17:55:48 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnSOv-0007xx-RO
 for qemu-devel@nongnu.org; Sat, 07 May 2022 17:55:47 -0400
Received: by mail-pl1-x635.google.com with SMTP id p6so10073331plr.12
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 14:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2poI/DUGD8KJjGIpJ49GjuZ4lpoB7cepgefXyX1DI+A=;
 b=bWHBZzDy7w9RKzAEVC179tzwHYsg4U1ZgiiP0uchZlcMftFyQP7a27LVE96CmrRTlU
 S+M5Gt9KfzVPB1kIV9FV7By1X4PhQsE7rMXnT6rILmPQ2IvuQ9FOI2cu+gjeyqCHdPEj
 obSYqgijJXU2UnE9PObSamLqcXbOcy8+7XvSdPJrPANcoDPxE6e6z4p6nosUmtVqhFZd
 s7MXQ6b2+iMUrNHranr1v4rwWT45oQAAHIN+MUI+ydnNj81SQGJcH/lbkPT1BOv2De42
 ipz8x6DmJOrGcy3+/RKw3Xgk1GOGv+vbyU9LwaMWHvcCX3JAjoJK9ObUF5B4uJ/eF38c
 J+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2poI/DUGD8KJjGIpJ49GjuZ4lpoB7cepgefXyX1DI+A=;
 b=T7a6whASB+2pZJjeZBilpItJv8kADO8Aza+EkcsCPIXs7TAhG+Cju73JE0qQhPcEtq
 iLt1WwnjvBWxnPMRtIiFW69jyAD7UrXCQj+KrVW/LpX1uKdiJ8Xsbw47U88j9GwYZgpd
 atY0hsLxcH9rCkobLA9DTVeW4YNeno5/SITImiGnLo81ziajNqxe7FDTIGMwQZCJSGQj
 WtBGm6W49MrRrSiCVsWjBdoMg4vDSsnwG1paP0NHZcD3sdFCtiRGdQVl5CHm7UMsMDtu
 kUrz4MNdwn5R4Tl2kofG8p95mmarM7h8F2KhNYIHTJ+3SSKHnSlyyj0z0Owpdnbnkx5M
 VzYg==
X-Gm-Message-State: AOAM533QDbk51yPXqPkPQPUcdeH4Q9v91oUCMe8kMlULIsE490MjegEj
 jTc1ht07m00X54lYQUOksPNFzA==
X-Google-Smtp-Source: ABdhPJwihdHXdgN9YCtA6NdA9GuvXoSKpnVMOFZr0tAjPhpTCAUpK25nLByKBgWwHXgfOyxHqh0ODw==
X-Received: by 2002:a17:902:da90:b0:15e:adc2:191d with SMTP id
 j16-20020a170902da9000b0015eadc2191dmr9516576plx.134.1651960543676; 
 Sat, 07 May 2022 14:55:43 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 bb5-20020a170902bc8500b0015e8d4eb27dsm4073661plb.199.2022.05.07.14.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 14:55:42 -0700 (PDT)
Message-ID: <f446d2f5-5503-8a73-73fa-4dd7703e6200@linaro.org>
Date: Sat, 7 May 2022 16:55:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 38/43] hw/loongarch: Add LoongArch ls7a rtc device
 support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-39-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429100729.1572481-39-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/29/22 05:07, Xiaojuan Yang wrote:
> +/*
> + * Shift bits and filed mask
> + */
> +#define TOY_MON_MASK   0x3f
> +#define TOY_DAY_MASK   0x1f
> +#define TOY_HOUR_MASK  0x1f
> +#define TOY_MIN_MASK   0x3f
> +#define TOY_SEC_MASK   0x3f
> +#define TOY_MSEC_MASK  0xf
> +
> +#define TOY_MON_SHIFT  26
> +#define TOY_DAY_SHIFT  21
> +#define TOY_HOUR_SHIFT 16
> +#define TOY_MIN_SHIFT  10
> +#define TOY_SEC_SHIFT  4
> +#define TOY_MSEC_SHIFT 0
> +
> +#define TOY_MATCH_YEAR_MASK  0x3f
> +#define TOY_MATCH_MON_MASK   0xf
> +#define TOY_MATCH_DAY_MASK   0x1f
> +#define TOY_MATCH_HOUR_MASK  0x1f
> +#define TOY_MATCH_MIN_MASK   0x3f
> +#define TOY_MATCH_SEC_MASK   0x3f
> +
> +#define TOY_MATCH_YEAR_SHIFT 26
> +#define TOY_MATCH_MON_SHIFT  22
> +#define TOY_MATCH_DAY_SHIFT  17
> +#define TOY_MATCH_HOUR_SHIFT 12
> +#define TOY_MATCH_MIN_SHIFT  6
> +#define TOY_MATCH_SEC_SHIFT  0

While this is ok, it would be better to use <hw/registerfields.h>
This becomes

FIELD(TOY, MON, 26, 6)
FIELD(TOY, DAY, 21, 5)
FIELD(TOY, HOUR, 16, 5)

You then extract with FIELD_EX32(val, TOY, MON), etc.

I will also mention that "millisec" is misnamed in the documentation.  Since it represents 
units of 0.1 seconds, the prefix should be "deci".

> +#define TOY_ENABLE_BIT (1U << 11)
...
> +enum {
> +    TOYEN = 1UL << 11,
> +    RTCEN = 1UL << 13,
> +};

You have two copies of the same bit.  It would be best to fill in the rest of the bits in 
RTCCTRL, using FIELD().

> +    case SYS_RTCREAD0:
> +        val = s->rtccount;
> +        break;

Surely this needs to examine qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) and scale the offset 
back to 32kHz.

> +    case SYS_TOYMATCH0:
> +        s->toymatch[0] = val;
> +        qemu_get_timedate(&tm, s->offset);
> +        tm.tm_sec = (val >> TOY_MATCH_SEC_SHIFT) & TOY_MATCH_SEC_MASK;
> +        tm.tm_min = (val >> TOY_MATCH_MIN_SHIFT) & TOY_MATCH_MIN_MASK;
> +        tm.tm_hour = ((val >> TOY_MATCH_HOUR_SHIFT) & TOY_MATCH_HOUR_MASK);
> +        tm.tm_mday = ((val >> TOY_MATCH_DAY_SHIFT) & TOY_MATCH_DAY_MASK);
> +        tm.tm_mon = ((val >> TOY_MATCH_MON_SHIFT) & TOY_MATCH_MON_MASK) - 1;
> +        year_diff = ((val >> TOY_MATCH_YEAR_SHIFT) & TOY_MATCH_YEAR_MASK);
> +        year_diff = year_diff - (tm.tm_year & TOY_MATCH_YEAR_MASK);
> +        tm.tm_year = tm.tm_year + year_diff;
> +        alarm_offset = qemu_timedate_diff(&tm) - s->offset;
> +        if ((alarm_offset < 0) && (alarm_offset > -5)) {
> +            alarm_offset = 0;
> +        }
> +        expire_time = qemu_clock_get_ms(rtc_clock);
> +        expire_time += ((alarm_offset * 1000) + 100);
> +        timer_mod(s->timer, expire_time);
> +        break;
> +    case SYS_TOYMATCH1:
> +        s->toymatch[1] = val;
> +        break;
> +    case SYS_TOYMATCH2:
> +        s->toymatch[2] = val;
> +        break;

Why does only register 0 affect expire time, and not all 3 registers?

> +    case SYS_RTCCTRL:
> +        s->cntrctl = val;
> +        break;

Need to check REN, TEN, and EO fields.

> +    case SYS_RTCWRTIE0:
> +        s->rtccount = val;
> +        break;

Need to compute a new rtc_offset from QEMU_CLOCK_VIRTUAL, to match RTCREAD0 above.

> +    case SYS_RTCMATCH0:
> +        s->rtcmatch[0] = val;
> +        break;
> +    case SYS_RTCMATCH1:
> +        val = s->rtcmatch[1];
> +        break;
> +    case SYS_RTCMATCH2:
> +        val = s->rtcmatch[2];
> +        break;

Why do these not affect expire time?

> +    d->timer = timer_new_ms(rtc_clock, toy_timer, d);
> +    timer_mod(d->timer, qemu_clock_get_ms(rtc_clock) + 100);

Where does this number come from?  In any case, after reset I would expect (1) the rtc and 
toy to be disabled (documentation says must initialize rtcctrl bits) and (2) I would 
expect all of the comparison registers to be 0 and thus no timer enabled.

I guess this 100 milliseconds thing is trying to match 1 decisecond from TOYMATCH0?



r~

