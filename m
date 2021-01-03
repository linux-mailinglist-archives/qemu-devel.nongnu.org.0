Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07732E8C53
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 14:48:50 +0100 (CET)
Received: from localhost ([::1]:37614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw3kX-0006DA-H7
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 08:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw3jU-0005mH-8O
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 08:47:44 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw3jS-0008Lk-Mm
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 08:47:43 -0500
Received: by mail-wm1-x331.google.com with SMTP id a6so14774526wmc.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 05:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eKEl5Ukn+n1qjyK5OpUJlNESyMedkWE7ze2JpON6ft4=;
 b=t3ibLuWiJnLPI7coEoWA2V8Cckw6WGH1uE9IhZkSD5ul5akWlKovAGuVcUwX14+AUN
 9Tf7yFUPXenWY/p7vb3xeIBAwr2Y3dI6FIdClfwtPJi2b+GfPKGrHlLcr3UoefGB82Sl
 LViuQvJBeBdkNbFPy8bXxosYT6b6YFrg3JhKI5IWTgPmt6yuUY5zK0hJzho3MoC0wfbP
 bIkc7TL7AYYxCr34ykQbaktbyNBt564fGdNbYjZKD78GNRPQ8hEKx14a5NkiLWGQbzrF
 os4uyrxIz+ANxumvzPEGqY1UvEGTTUlj/9h0FP9dTOsKUtygaUV8fxVdn9F4t0uUvQFW
 OVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eKEl5Ukn+n1qjyK5OpUJlNESyMedkWE7ze2JpON6ft4=;
 b=NOYY1A/UCH+p5fNpGJsIye++HYupXs6bWyKvWmUD+J4TM5Yuf7AnJhMH1UWsZ0SDoE
 uFG0IB4IWx3f3UkQcgmYQfNiIoQWNI2grNZ32CpXv8UX3CbxPXf5PaoIF4tDUo7esLw9
 kiDntLYP5ATs3PSHt1II+tgY/ngBPbHeAhwipBvpIPlPvIGOOzUCHXlAJXjnu+TR24v0
 DjzJBL5d2ohDV3jfps/sw2jMtHBCZdxBsaRrBsTt6wmPwOPxn9XdvuaPQ81Pb807wz9j
 rI5xbyU7sErlb9Avix6QhU0s9VkGzGqC3MssgnxUcoxgIQnoiZicwJUyh7fOBnYrHgNK
 ziUw==
X-Gm-Message-State: AOAM5304g9xpExgmC+7JXFl/AtXLU9b8kJ4XPk5eJ/MT/AJE9ox/JU95
 Z4oQ0XqC4k0dyhFTBZRWRHM=
X-Google-Smtp-Source: ABdhPJzeoCi0Iqp3PjwysbtK2cziEfZiC3R8/xZfyg4b1H7TzZHMVi2SSYg0ZylMaA0HylyGrnmmjg==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr22667149wmc.10.1609681661112; 
 Sun, 03 Jan 2021 05:47:41 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id v189sm28794201wmg.14.2021.01.03.05.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 05:47:40 -0800 (PST)
Subject: Re: [PATCH v2 0/4] clock: Get rid of clock_get_ns()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201215150929.30311-1-peter.maydell@linaro.org>
 <2ab2c1f3-8c3c-5534-a45d-2250843dc262@amsat.org>
Message-ID: <d6bfe119-a18a-2da1-0818-639f435e15fa@amsat.org>
Date: Sun, 3 Jan 2021 14:47:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2ab2c1f3-8c3c-5534-a45d-2250843dc262@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/1/21 9:35 PM, Philippe Mathieu-Daudé wrote:
> On 12/15/20 4:09 PM, Peter Maydell wrote:
>> This patchseries makes some changes to the clock API:
>>  * Remove clock_get_ns()
>>  * Add clock_ticks_to_ns() to return number of nanoseconds
>>    it will take the clock to tick N times
>>  * clock_display_freq() to return prettily-formatted string
>>    for showing humans the approximate clock frequency
>>
>> This is based on discussions we had about these APIs a little while
>> back.  The core driver here is that the clock objects internally
>> store the period in units of 2^-32 ns, so both clock_get_ns() and
>> clock_get_hz() are inherently returning a rounded-off result, which
>> can be badly inaccurate for fast clocks or if you want to multiply it
>> by a large tick count.
> ...
>> Peter Maydell (4):
>>   clock: Introduce clock_ticks_to_ns()
>>   target/mips: Don't use clock_get_ns() in clock period calculation
>>   clock: Remove clock_get_ns()
>>   clock: Define and use new clock_display_freq()
>>
>>  docs/devel/clocks.rst  | 51 ++++++++++++++++++++++++++++++++++++----
>>  include/hw/clock.h     | 53 +++++++++++++++++++++++++++++++++++++++---
>>  hw/core/clock.c        |  6 +++++
>>  softmmu/qdev-monitor.c |  6 ++---
>>  target/mips/cpu.c      |  4 ++--
>>  5 files changed, 108 insertions(+), 12 deletions(-)
> 
> Until someone else prefers otherwise, I plan to queue this series
> via the MIPS tree, as I can add the patch which increases the
> Loongson3v frequency to 2GHz on top (the unique machine using
> a frequency over 1GHz).

Thanks, series applied to mips-next.

