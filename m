Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFA3521DCD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:11:55 +0200 (CEST)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRWk-0008CF-Vd
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noRUa-0006dm-Pt
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:09:40 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noRUY-0002PR-St
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:09:40 -0400
Received: by mail-pg1-x529.google.com with SMTP id a191so14893470pge.2
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jgM2EtE1mJxP7Rx1Kn0CTIp4xyRLXF2z07BssVsAE2M=;
 b=y+5FBS2M3Eo4VWYJHuqj2X2Z3Swj1EieGHZAfzA5KdtmCTjcRJOHR1BKVvpAiE9EXt
 Fo3+gTLCjL9LrE1JVspk+83V/8TgeAU6Gg4X5Xq/ntDZqDmEkcRtQZAjW8Gd+6EQ5ccT
 yht28h6vBsyrsAYO+qWhT9TzEr61EnX1o3g1ZDWM5fIdLAb6jXSqQDRDSCXlqvna54k8
 y7gUh8XIdG57eXWPkCbLLHv7WLa5Qy4IbmapFc2RMlDLn4do7+eP95sqEukdE/jH4ZST
 oS+4G2l1HA4FaySG8uKX6cLEiLQWB+0cANOFU4cxvt/dQzp77EYyC8W9Sk6wMOaVKACu
 q8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jgM2EtE1mJxP7Rx1Kn0CTIp4xyRLXF2z07BssVsAE2M=;
 b=hFG6yZlq8OmdgUry86oMHBP78SRAzvpnhpEjVYztxOQxF2VahOYrJ9f7ksjGskq3fw
 NUgiE8fMtSVTPG6SUT0NWrwxCKR48zWQDDB183sHfwKKMFgpX/ouXrbJjt9oB2b2UQF3
 v2g+ulLL8JrOjaSERQ10hH/uEepzIb8bGvXXNMqogUwHN4SkeEingmACLKbutEFuKu+b
 Rgshl+bm+keGKZWcZnGS1Qom/O4Lr/DvMdMIizKgViwYsvKlZTPYjjBOMt9gv4hsSnp/
 nxdVb9cpO9VdPf3F3ORMn/JhqKqQC3lm37MBoECdO9+B+yxUg8W+2/IBO/GCgGTPUmkP
 RzsQ==
X-Gm-Message-State: AOAM5317cpSz262d0Mgi/Vo3XhDLuRFiyF/ymDo2frSFNoejvrUPakVN
 Gwg1kGxq9ZFU7GLTRDCS7pMFfw==
X-Google-Smtp-Source: ABdhPJyq7baI7k5PEyWbPUtRTWsK9D6Y4DkXJZABvduDS1c8AdfJRU/PbajW0Vggwc4XOrnOkZfVxg==
X-Received: by 2002:a05:6a00:14cc:b0:510:4b70:403e with SMTP id
 w12-20020a056a0014cc00b005104b70403emr20985942pfu.55.1652195376886; 
 Tue, 10 May 2022 08:09:36 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a056a00248300b0050dc762818fsm11067226pfv.105.2022.05.10.08.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 08:09:36 -0700 (PDT)
Message-ID: <78b721f2-b105-2f96-6387-a9de52d4d966@linaro.org>
Date: Tue, 10 May 2022 08:09:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 38/43] hw/loongarch: Add LoongArch ls7a rtc device
 support
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-39-yangxiaojuan@loongson.cn>
 <f446d2f5-5503-8a73-73fa-4dd7703e6200@linaro.org>
 <d44f18b6-4724-e855-0b11-183437c03ef3@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d44f18b6-4724-e855-0b11-183437c03ef3@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 5/10/22 02:11, yangxiaojuan wrote:
>> Why does only register 0 affect expire time, and not all 3 registers?
>>
> Thanks, the toymatch[1]/[2] should also affect expire time. I fixed it like this:
> 
> +static void rtc_toymatch_write(LS7ARtcState *s, struct tm *tm, uint64_t val)
> +{
> +    int64_t alarm_offset, year_diff, expire_time;
> +
> +    qemu_get_timedate(tm, s->offset);
> +    tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);
> +    tm->tm_min = FIELD_EX32(val, TOY_MATCH, MIN);
> +    tm->tm_hour = FIELD_EX32(val, TOY_MATCH, HOUR);
> +    tm->tm_mday = FIELD_EX32(val, TOY_MATCH, DAY);
> +    tm->tm_mon = FIELD_EX32(val, TOY_MATCH, MON) - 1;
> +    year_diff = FIELD_EX32(val, TOY_MATCH, MON);
> +    year_diff = year_diff - (tm->tm_year & TOY_MATCH_YEAR_MASK);
> +    tm->tm_year = tm->tm_year + year_diff;
> +    alarm_offset = qemu_timedate_diff(tm) - s->offset;
> +    if ((alarm_offset < 0) && (alarm_offset > -5)) {
> +        alarm_offset = 0;
> +    }
> +    expire_time = qemu_clock_get_ms(rtc_clock);
> +    expire_time += ((alarm_offset * 1000) + 100);
> +    timer_mod(s->timer, expire_time);
> +}
> 
> ...
> case SYS_TOYMATCH0:
>       s->toymatch[0] = val;
> +     rtc_toymatch_write(s, &tm, val);
>       break;
> case SYS_TOYMATCH1:
>      s->toymatch[1] = val;
> +    rtc_toymatch_write(s, &tm, val);
>      break;
> case SYS_TOYMATCH2:
>       s->toymatch[2] = val;
> +     rtc_toymatch_write(s, &tm, val);
>       break;

You either have to have 6 timer objects, or you have to pick the minimum expire time 
between the 3 toymatch and the 3 rtcmatch values.

> ...
>>> +    case SYS_RTCCTRL:
>>> +        s->cntrctl = val;
>>> +        break;
>>
>> Need to check REN, TEN, and EO fields.
>>
> Thanks, i fixed the rtc_ctrl writing function like this:
> ...
>       case SYS_RTCCTRL:
> -        s->cntrctl = val;
> +        if (FIELD_EX32(val, RTC_CTRL, RTCEN) &&
> +            FIELD_EX32(val, RTC_CTRL, TOYEN) &&
> +            FIELD_EX32(val, RTC_CTRL, EO)) {
> +            s->cntrctl = val;
> +        }

Uh, no, that's not what I meant by "check".

If TOYEN is off, then the toymatch timers must stop, at minimum; it might also mean that 
the time of day should not advance -- the documentation isn't clear.

If RTCEN is off, then similarly rtcmatch timers must stop and the rtcread value must not 
advance.

If EO is off, I would expect all of the above to stop, because the clock source is stopped.

You'd always record the store to s->cntrctl.


>>> +    case SYS_RTCMATCH0:
>>> +        s->rtcmatch[0] = val;
>>> +        break;
>>> +    case SYS_RTCMATCH1:
>>> +        val = s->rtcmatch[1];
>>> +        break;
>>> +    case SYS_RTCMATCH2:
>>> +        val = s->rtcmatch[2];
>>> +        break;
>>
>> Why do these not affect expire time?
>>
> Sorry, i could not understand this very clearly, could you please explain it in more 
> detail? Thanks very much.

You're not raising an interrupt for any rtcmatch, as you did from toymatch0.


r~

