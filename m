Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F153652D777
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:26:36 +0200 (CEST)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nri2u-0001xb-38
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nri1D-0000X7-07
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:24:51 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:39773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nri1B-0006R8-9r
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:24:50 -0400
Received: by mail-pf1-x42f.google.com with SMTP id v11so5442301pff.6
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pl5QlTYIWdrj9qejnM6rEHDjcytPqpX7/AcECzZpLjo=;
 b=XzhDQimz3vRd4H9Gd6T7FhHfUv/O40Gqgrz/epX8w2TsbelXBVRc2oRT0aGpVAyPg3
 ma/PrcaFUI9UQeFZh9EAv3b8PRlg2sV+b5z8i7p8oUZufKXpDZxxqv88oZWXT9gyfrKq
 +XlDvFG2QXZE3jXuEkzGh8+HuKlSW0hM7xuOSiAWaJOGyAqdE/SvImiZnqC2cQDfgYId
 1RIxHi0ouroMgFUmV6QvBsyATWSM1ToN9b61+LEZelueJOgCIOsgtnckzpAQdaI6QiWt
 EholvmcATqBWYIeU3v8NHhH5gnOCharLKgSMjxyYd/m3UJX1LNXLE1P3h4PKwDWN5spT
 3IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pl5QlTYIWdrj9qejnM6rEHDjcytPqpX7/AcECzZpLjo=;
 b=PB/kcA+nCGgoKSYgzniXxhvNvM/xMiXju3uN8b5MI9K7+XAqW2Ub0QyXgqk3/gKJ7n
 CFBigGNOBbUBExLuVUrtT8UuSWqGHC6Va+5hOqoHggAUYAEfJId8KSejDl5AMSVlIdkY
 GWG1XmfK+K1f30LdNtZPTW4hqBOisNhnx4gvf1sSgedYoWb3CtB51DWMBKrcnpeA7emP
 cBqhTQb5TZzywsc0DhKYa6soCkdPgjjzAaOILDcdCEj1nUTJj4+QL0fK5TLOuCUJJEHa
 YU95l6Y30tqkth+zhML9uPP+/+aq3XXHglAuRKClWb+fpmJTXUxNmN+r7vDUIl1FZ7sg
 g/MQ==
X-Gm-Message-State: AOAM533fO15leqmib60DJXgTZ7FZ4zPpSKJqOgTbaGACixmB7OhEgmu6
 KxuXkJL4NQtZtY8lgDZf/3HSMw==
X-Google-Smtp-Source: ABdhPJyLpafcVCf/WuJcRBw10m4F4xaUhST+9WmPug5qFJt+vl5mlAEAZNNCTs4D/sIbFhbSBBs9nw==
X-Received: by 2002:a05:6a00:724:b0:4fa:a35f:8e0f with SMTP id
 4-20020a056a00072400b004faa35f8e0fmr5423022pfm.25.1652973887747; 
 Thu, 19 May 2022 08:24:47 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a170903245100b001617e18e253sm3946312pls.143.2022.05.19.08.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 08:24:47 -0700 (PDT)
Message-ID: <f1f8457a-a79d-552d-0e15-af7ae688ec90@linaro.org>
Date: Thu, 19 May 2022 08:24:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 38/43] hw/loongarch: Add LoongArch ls7a rtc device
 support
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
 <20220517113023.3051143-39-yangxiaojuan@loongson.cn>
 <5cb736a8-e502-e9b0-2e9f-a59546de4807@linaro.org>
 <e1ba94fa-d940-da4d-8d48-b6ca5af20f1c@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e1ba94fa-d940-da4d-8d48-b6ca5af20f1c@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 5/19/22 06:04, yangxiaojuan wrote:
> 
> On 2022/5/19 上午3:59, Richard Henderson wrote:
>> On 5/17/22 04:30, Xiaojuan Yang wrote:
>>
>>> +static void ls7a_stop_toymatch(LS7ARtcState *s)
>>> +{
>>> +    int i;
>>> +    uint64_t now;
>>> +
>>> +    now = qemu_clock_get_ms(rtc_clock);
>>> +    for (i = 0; i < TIMER_NUMS; i++) {
>>> +        if (s->toy_timer[i].flag) {
>>> +            s->toy_timer[i].enable_offset = s->toy_timer[i].timer->expire_time
>>> +                                            - now;
>>> +            timer_del(s->toy_timer[i].timer);
>>
>> I don't think you need to check flag here, or update enable_offset.
>> Just an unconditional timer_del to stop the timer callback from firing.
>>
> Thanks very much, and i fixed it like this: Is this modification appropriate?
> static void ls7a_rtc_stop(LS7ARtcState *s)
> {
>      int i;
>      int64_t rtc_val, rtc_diff, now;
>      now = ls7a_rtc_ticks();
> 
>      for (i = 0; i < TIMER_NUMS; i++) {
>          if (s->rtc_timer[i].flag) {
>              rtc_val = s->rtcmatch[i];
>              rtc_diff = rtc_val - now - s->offset_rtc;
>              s->rtc_timer[i].save_offset = rtc_diff;
>          }
>          timer_del(s->rtc_timer[i].timer);
> }

I think you should drop "flag" entirely.  I don't see what it accomplishes.  It does not 
correspond to a bit in the state of the La7a rtc device.

Do you know if the documentation is incomplete, and rtcmatch[n] == 0 is a magic number 
that indicates that the match value is disabled?  Because if there is no magic number for 
disabling the match, I would expect *any* number, including 0, to match every 2**32 / 
2**15 seconds ~= 36 hours.

It also occurs to me that EO is probably the thing that controls whether RTC "ticks", and 
RTCEN is probably the thing that controls whether RTC match interrupts are delivered, and 
the same for TOY.  Can you confirm this?


r~

