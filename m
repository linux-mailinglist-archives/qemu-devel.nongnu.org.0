Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B555542CDE7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 00:25:52 +0200 (CEST)
Received: from localhost ([::1]:41428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mamh5-0006Ab-Al
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 18:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mamfU-0005Tw-R5
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 18:24:12 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mamfT-0007dU-94
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 18:24:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id 187so3712414pfc.10
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 15:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h0FlhQIUK5xbyjogmhc/WXAxrSFDFaI5TPSWmOwHblQ=;
 b=riov2IcAhKucQyl6ydojsq5kEpA0bsv7CY0kLIkT26t0TT5WV7lUREVqRz7S2K6cOj
 CJ25XVr6vRN3N4d4jSczNarRn7bO0AQ6ptic42Wyexr6vtpCw2gXjfV+fnQGFcGD9J2l
 WYV8lk1Ed8wLTT04PhV3KUwr7fCvmM3jmYWhBzlcd7OWRfOkXEVHIakW5NqICKIcgGWD
 7HXu2XKW0ZnTMMn4IOopDQz7jEuYxdh2fOw8V3eJ9iOhsKGMrjPWZwSyHh53rLMwNS3K
 1j86LleaHzAIQ5FyJKIJ3uB5v0bhzZOWXqkOj3Ta6xibPfon638uSCcL7zsu3Pfuivbd
 jHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h0FlhQIUK5xbyjogmhc/WXAxrSFDFaI5TPSWmOwHblQ=;
 b=FNxVcFo5AHDPunZwNk4CuZpgebR4EV3XtaN0TlcXa7u72Rliv0f6z4zO7SjS59KbQa
 4AVj+TDjrBtFsT6uTTwZhFj6f4E9SHomM9vOh9HusSGb7rQK2ClBuJ16Ijy2bK+BURvB
 7gbVxaCZeqI86qi2LHkL6HblqLr0oXr0ys5MH3UwclbElxsu20dgLwLaGjQvCvlG3Z+E
 T8j60BNY7U++0rCv/8IO6PzQl6anjLIeBF5bVAy80izXc8aOAjNHnjTY2Kg/uIdPJC3Y
 piWbd+K+Fr7jdu1uvUj53u3dM8mys7GQDbJhpGWdMlMcZq/nxAoJZ/d8Iq/y7DMQWTZo
 I2rQ==
X-Gm-Message-State: AOAM533aE61yQg6mFVKNYGzRAxej6LZucF2bxrba2hcTDGCDU8XwQd34
 Lp7YCm0NUecU28rJbvLmFR+4mA==
X-Google-Smtp-Source: ABdhPJw/hz5r9xDHta0ViDBDwjLJtSujkCEJ2DChnJeBhDaVPDeGudf7MvbKLJHAyB+w3j4JBv2yTg==
X-Received: by 2002:a63:8a43:: with SMTP id y64mr1465685pgd.390.1634163849019; 
 Wed, 13 Oct 2021 15:24:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m22sm448833pfo.71.2021.10.13.15.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 15:24:08 -0700 (PDT)
Subject: Re: [PATCH 7/8] target/mips: Support TCG_TARGET_SIGNED_ADDR32
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-8-richard.henderson@linaro.org>
 <768cf292-1393-2076-e10f-d0147ad325a6@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b35c12cc-3c11-d34e-52ae-13b9fe18ae53@linaro.org>
Date: Wed, 13 Oct 2021 15:24:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <768cf292-1393-2076-e10f-d0147ad325a6@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/21 9:20 PM, WANG Xuerui wrote:
>> +++ b/tcg/mips/tcg-target-sa32.h
>> @@ -1 +1,9 @@
>> +/*
>> + * Do not set TCG_TARGET_SIGNED_ADDR32 for mips32;
>> + * TCG expects this to only be set for 64-bit hosts.
>> + */
>> +#ifdef __mips64
>> +#define TCG_TARGET_SIGNED_ADDR32 1
>> +#else
>>   #define TCG_TARGET_SIGNED_ADDR32 0
>> +#endif
> It looks like we never want to set TCG_TARGET_SIGNED_ADDR32 on 32-bit
> hosts; maybe a compile-time assert could be added somewhere for
> statically guaranteeing this?

I've placed a build-time assert in tcg/tcg.c.

>> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
>> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
> Is there precedent of extracting predicates like this into some header
> for reuse? However I agree that the current expression conveys enough
> meaning without being overly complicated.

Depends on the expected scope of the predicate, I guess.

If it's private to tcg-target.c.inc, I'd put it in tcg.c.
If it's private to tcg in general, I'd put it in tcg-internal.h.
Beyond that, I guess it depends.

For this, I don't know what I'd call it that isn't more verbose than the expression itself.

r~

