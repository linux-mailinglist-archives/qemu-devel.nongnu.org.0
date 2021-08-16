Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D4C3ED116
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:33:52 +0200 (CEST)
Received: from localhost ([::1]:60460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFZ0A-0000b0-WB
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFYyi-00086H-2b; Mon, 16 Aug 2021 05:32:20 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFYyg-00084V-F6; Mon, 16 Aug 2021 05:32:19 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h13so22660840wrp.1;
 Mon, 16 Aug 2021 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C72ax1ZASpe5hmE3eor77ksE8ToC+S3gZI4tjLB3s3Q=;
 b=sCe8Rx8DkYVd+w6HB/TCxzTtSZ7vlZGA3LMiWWQ4X8LsgFuZDxVQ3SwZ0k+DfdwRnH
 WGw8DCoEQwGnUEK3I7AQKhWlBjC+C1MnpO8FQoAZWwiU7vJoBBacZlp0LexLOFucoQyh
 SyJyMuqEsxI0P0Y1dqdBL5BiteAKo/X+yrpnfFa8ve5NPu3/nnJaFlVUDJZ7X6js6HoP
 UzUiyRNfCq9cA1J3eAbUGFLyrUiMrYAjhMxGDKLnVd1VPATzVR3cqxdR//jEPKb8ngFh
 wW6RQj08muAm2wWubpJIYAiuLO01UUzD41y7Ko5TMBILRD9WTbpfzD3q8b7bRVogsTxO
 Vx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C72ax1ZASpe5hmE3eor77ksE8ToC+S3gZI4tjLB3s3Q=;
 b=RxoRQaHcShcgYixdANKgtWBTmQhOA4NhFgJnjYJMQ3/etjHsud2kFfC8rJY/VF0nh4
 2O8Nw4l1r3SKotJi6V+eYE+xFOD3dmbDuwyyubD1TWkOLcAC1FzMEL58J3PPie5SsfYc
 kxglTP16G0w6/lU20K19M5lnkeoT7eVOgkBB6b6u13sZ/RcSbC7PiZNlOd/XVrnWo0JV
 xvEdvgqeBMC5f6IuO2jEk+ud19fBg6ZhTAtUoSI+hjh4rRWW+dbl6Yg+Zc+byja6s/iR
 YDdpGMSvEvzKWi92w4sTS/vDtnG9xOIlSTXInA2BSAkPTzsc/UYKjS+VlHkKPHiy0bOj
 P8lQ==
X-Gm-Message-State: AOAM533OQOA47tRYEsczdzRd5IttXjXYnA8rILe/d8ZMx29/HQ6kk04t
 rdiV/3KZeRy6ac2jdTpjHNE=
X-Google-Smtp-Source: ABdhPJwZdyUAdT1hR0JSG6eQnxp7b3BnRcZexyM9KLemedQxOD4fTKduo5vskrq9ceA6N7nvkPQgCg==
X-Received: by 2002:a05:6000:1086:: with SMTP id
 y6mr17431838wrw.406.1629106335808; 
 Mon, 16 Aug 2021 02:32:15 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p14sm10984395wro.3.2021.08.16.02.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 02:32:15 -0700 (PDT)
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <86d7a767-f53e-dfa2-3641-9e39512c0512@amsat.org>
 <CAFEAcA8DNSS-0oXCDWeFNkin=mbNePS3CamnCgvvC+89KOWXTw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bad5ee5a-0f13-6d12-5055-4c649f78aa4e@amsat.org>
Date: Mon, 16 Aug 2021 11:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8DNSS-0oXCDWeFNkin=mbNePS3CamnCgvvC+89KOWXTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 11:05 AM, Peter Maydell wrote:
> On Sun, 15 Aug 2021 at 17:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 8/12/21 11:33 AM, Peter Maydell wrote:
>>> It is quite common for a clock tree to involve possibly programmable
>>> clock multipliers or dividers, where the frequency of a clock is for
>>> instance divided by 8 to produce a slower clock to feed to a
>>> particular device.
>>>
>>> Currently we provide no convenient mechanism for modelling this.  You
>>> can implement it by having an input Clock and an output Clock, and
>>> manually setting the period of the output clock in the period-changed
>>> callback of the input clock, but that's quite clunky.
>>>
>>> This patch adds support in the Clock objects themselves for setting a
>>> multiplier or divider.  The effect of setting this on a clock is that
>>> when the clock's period is changed, all the children of the clock are
>>> set to period * multiplier / divider, rather than being set to the
>>> same period as the parent clock.
>>
>> This is super nice!
>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  docs/devel/clocks.rst   | 23 +++++++++++++++++++++++
>>>  include/hw/clock.h      | 29 +++++++++++++++++++++++++++++
>>>  hw/core/clock-vmstate.c | 24 +++++++++++++++++++++++-
>>>  hw/core/clock.c         | 29 +++++++++++++++++++++++++----
>>>  4 files changed, 100 insertions(+), 5 deletions(-)
>>
>>> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
>>> +{
>>> +    assert(divider != 0);
>>
>> I only wonder if we shouldn't check clock_is_enabled() here.
>> Maybe not assert, but at least report a GUEST_ERROR?
> 
> Setting the multiplier on a disabled clock doesn't seem like
> an error to me. I would expect a common way for the guest to
> program a clock-controller would be "first set the divider
> and any other parameters; finally, enable the clock".

Eh sorry I meant the other way around :/ It is usually either
illegal or undefined behavior on real hw to change a clock scale
while it is active. Personally I'd be interested to catch guests
doing so. I was thinking of:

    if (clock_is_enabled(clk)) {
        qemu_log_mask(LOG_GUEST_ERROR,
                      "Changing scale of ENABLED clock '%s'\n'",
                      CLOCK_PATH(clk));
    }

