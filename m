Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2089D6C199F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:35:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHXP-0000hr-Tz; Mon, 20 Mar 2023 11:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHXK-0000h9-Nl
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:35:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHXJ-0008H1-1d
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:35:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id iw17so2474282wmb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679326499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fN5nRm4HOSynpRaHiX23iPefyQmzwWb2+/Jf5hvsZBs=;
 b=YhnvR3txxTT4+OXjnresD4RjIO+IL/NAizpYbxrcYbRfrS54zImel20d44DCSGAH4s
 4Gx2OQP9Xp7mZmQUQF4G8FykRyM8CQbAbEw7ZhGKNmlT3/M8bE6hSkvUUt6jsYM4CDEk
 47ptWl9O3u2u+Q98+fXwsEoN2ntASaN8mkJb3+zbMu538xiHq3+L11Tdog8y+f3tOt32
 1/CcZ4nsxqYSusHilHROFzLurIiS50YI+Bxn1+FZTZgZhVVIor4XN9icakyDjQxQbd3H
 S0/B6vVbaDsYklWPW2pCcM32330E4oOIoSwrQD38CGJo0FjwUEp+ZzU/koJ4QHtv6n1V
 m8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679326499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fN5nRm4HOSynpRaHiX23iPefyQmzwWb2+/Jf5hvsZBs=;
 b=t03a/gC9ZAlEEB46LZ2QWjP60eP9xxZdDpV7JvOu/86ONxeo/LSBDnbdgnS+xFLEc4
 ZT2zhQfpHioKQoZKCHDsqckKDGM9p2+b1b3t4QR/1H+W7L4o57u5O7aEv4++Pp4FGuND
 TQ8MQ6GXgir+0MxcqEiTcxa1wyRoPF77QXx+DScosfwY7YsdXgyT1eVYyKWbueOiTHch
 Hle6Olp5YlBu6nL6/VK2rTA4dKG8RbZQ1qwbhfw/me70fialRoD5ZZU49ef2tyH93y7H
 p96CvCSSO7GD/Rq0tvJDguZKIfrOml+PmbOGI7Yv8cYDD0WtrtkruwYld3Taz6nf57lt
 9b/A==
X-Gm-Message-State: AO0yUKUlU/cv91/ZT/Ee1wQEql9mcJssS9p/7G9iYcs/wCer2wqVK6Jy
 D87pzGZOC3+rs9WvxaW16uBmGQ==
X-Google-Smtp-Source: AK7set9VxZNO2Z/sl0rKbCBifOmERMocHwUNB6LJvZ5JPFztpPRVM+ADYm+4YBuKNi5m53MZ3kIHFA==
X-Received: by 2002:a05:600c:4753:b0:3eb:f5a2:2d67 with SMTP id
 w19-20020a05600c475300b003ebf5a22d67mr32066021wmo.33.1679326499367; 
 Mon, 20 Mar 2023 08:34:59 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m16-20020a7bcb90000000b003edf2dc7ca3sm3536517wmi.34.2023.03.20.08.34.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:34:59 -0700 (PDT)
Message-ID: <15e31292-9365-7eb4-6bcd-d74c1a50c5a0@linaro.org>
Date: Mon, 20 Mar 2023 16:34:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 03/10] accel/tcg: move i386 halt handling to sysemu_ops
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alessandro Di Federico <ale@rev.ng>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Fabiano Rosas <fabiano.rosas@suse.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-4-alex.bennee@linaro.org>
 <9abe3d28-9d35-85cc-118c-083cb267db59@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <9abe3d28-9d35-85cc-118c-083cb267db59@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/3/23 16:23, Claudio Fontana wrote:
> Hi Alex, all,
> 
> again, this moves TCG-only code to common code, no?

Oh, good point.

> Even if this happens to work, the idea is to avoid adding unneeded accel TCG code to a KVM-only binary.

Could yet another AccelSysemuCPUOps *accel struct in SysemuCPUOps
help being stricter? ...

> We need to keep in mind all dimensions when we do refactorings:
> 
> user-mode vs sysemu,
> the architecture,
> the accel, in particular tcg, non-tcg (which could be not compiled in, built-in, or loaded as separate module).
> 
> In many cases, testing with --disable-tcg --enable-kvm helps to avoid breakages,
> but it is possible also to move in unneeded code in a way that does not generate compile or link-time errors, so we need to be a bit alert to that.
> 
> Ciao,
> 
> C
> 
> 
> On 3/20/23 11:10, Alex Bennée wrote:
>> We don't want to be polluting the core run loop code with target
>> specific handling, punt it to sysemu_ops where it belongs.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   include/hw/core/sysemu-cpu-ops.h |  5 +++++
>>   target/i386/cpu-internal.h       |  1 +
>>   accel/tcg/cpu-exec.c             | 14 +++-----------
>>   target/i386/cpu-sysemu.c         | 12 ++++++++++++
>>   target/i386/cpu.c                |  1 +
>>   5 files changed, 22 insertions(+), 11 deletions(-)
>>
>> diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
>> index ee169b872c..c9d30172c4 100644
>> --- a/include/hw/core/sysemu-cpu-ops.h
>> +++ b/include/hw/core/sysemu-cpu-ops.h
>> @@ -48,6 +48,11 @@ typedef struct SysemuCPUOps {
>>        * GUEST_PANICKED events.
>>        */
>>       GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
>> +    /**
>> +     * @handle_cpu_halt: Callback for special handling during cpu_handle_halt()
>> +     * @cs: The CPUState
>> +     */

Perhaps insert within a 'tcg' structure for now.

     #ifdef CONFIG_TCG
     struct {

>> +    void (*handle_cpu_halt)(CPUState *cpu);

     } tcg;
     #endif

Then we could extract as accel.

>>       /**
>>        * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
>>        * 32-bit VM coredump.


