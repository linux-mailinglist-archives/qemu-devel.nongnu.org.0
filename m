Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107E763C6AA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 18:44:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p04ei-0000kr-TX; Tue, 29 Nov 2022 12:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p04eY-0000bs-7p
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 12:44:23 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p04eV-0000Qc-PQ
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 12:44:17 -0500
Received: by mail-wr1-x432.google.com with SMTP id g12so23287711wrs.10
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QIonGHkpqniAXs5sz8rA0sfZDsDNTFStmpF5TNSZBfw=;
 b=Dqr+enSx9oDCGiIShKjumzhfDwdQdV1pnpBafIn9DmyoAv5BbLP9bEpw6MOl8cxARK
 8HJnZBe4elqUIFcGO03bPeui+yvaOhCKe+9p/8uaWcGg6WqiBVYwuAALuqJNzz7lJk+q
 wrPbtVBbYJOwkApscB3eTch6XNnnRFQAuWuo47A1CQLEhKjqr1fXBvQZDuWEU0hzQXU2
 Lt+22ZfHJq1D4oHHkWqNRHg3QizrnMfrUil0P7ER8+ATNt7jlc6b+8Oi4I+riTqg+tyd
 AkGwYMgd1U8cfafaBXVKewcYsz6Vy0aepSkcZeUPSZwbrCMt3nblIhbCLdQVUwHYDYxS
 mP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QIonGHkpqniAXs5sz8rA0sfZDsDNTFStmpF5TNSZBfw=;
 b=msL45ayNJKmwokulN8iFwUhNHM/95BlC7CG/kAl7yPEmIU3aIMk/js7KAyBxgUgzot
 VdQIYdPI1CmtvQtYyG5fA4ZW3qPxV3AH4uTgdm2qTz8MNtsgDzM7ZUpmh1mg7wxdu73e
 B3gE6j2NkpyzvnnE+dC/yf09l1pSgJAYeaUlUIbX2l+nvGrGLOBw/I+2AzBPrONXSGRd
 Xy4mpaELgssxRUVm1yMzD7kR+58PWcarmnLqh+Xr3DuMtzAlBbWwrP/ejXZMfgMDIkqZ
 9gvGYXMvMtctH6Ca5BGgr9kWWyvii1w9Bt/Lt5J5/QFFORfWCf9LUIEmIjgwCyfmxLJv
 BEYA==
X-Gm-Message-State: ANoB5plNby8ImjUVpC9ZYUQowv9+DLMQ7VFSy4SCodoHvYq48645p3wy
 L/xeEX3ADLT+OtS+Fia+etc5rg==
X-Google-Smtp-Source: AA0mqf65i7DoYAB/+vVrmjkMEdGMAO1g8skeMhggn+tFE7NqfB5w/jOnUkYmm/fou5dK2+WSz6C4dA==
X-Received: by 2002:a05:6000:1103:b0:236:6fb9:9cf5 with SMTP id
 z3-20020a056000110300b002366fb99cf5mr33991935wrw.709.1669743853979; 
 Tue, 29 Nov 2022 09:44:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t67-20020a1c4646000000b003cfa622a18asm2886281wma.3.2022.11.29.09.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 09:44:13 -0800 (PST)
Message-ID: <4e3753f4-efa1-a803-e602-28610685c3cd@linaro.org>
Date: Tue, 29 Nov 2022 18:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-7.2] replay: Fix declaration of replay_read_next_clock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru
References: <20221129010547.284051-1-richard.henderson@linaro.org>
 <d7d533b1-14b1-3fa9-432e-18f7d8fd8053@linaro.org>
 <CAJSP0QX6c+9O3Vv1jM=X=8W17KPkQio4j17vYQRFdWxC3WGfjA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJSP0QX6c+9O3Vv1jM=X=8W17KPkQio4j17vYQRFdWxC3WGfjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 29/11/22 17:13, Stefan Hajnoczi wrote:
> On Tue, 29 Nov 2022 at 02:39, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 29/11/22 02:05, Richard Henderson wrote:
>>> Fixes the build with gcc 13:
>>>
>>> replay/replay-time.c:34:6: error: conflicting types for  \
>>>     'replay_read_next_clock' due to enum/integer mismatch; \
>>>     have 'void(ReplayClockKind)' [-Werror=enum-int-mismatch]
>>>      34 | void replay_read_next_clock(ReplayClockKind kind)
>>>         |      ^~~~~~~~~~~~~~~~~~~~~~
>>> In file included from ../qemu/replay/replay-time.c:14:
>>> replay/replay-internal.h:139:6: note: previous declaration of \
>>>     'replay_read_next_clock' with type 'void(unsigned int)'
>>>     139 | void replay_read_next_clock(unsigned int kind);
>>>         |      ^~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Fixes: 8eda206e090 ("replay: recording and replaying clock ticks")
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>    replay/replay-internal.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/replay/replay-internal.h b/replay/replay-internal.h
>>> index 89e377be90..b6836354ac 100644
>>> --- a/replay/replay-internal.h
>>> +++ b/replay/replay-internal.h
>>> @@ -136,7 +136,7 @@ bool replay_next_event_is(int event);
>>>    /*! Reads next clock value from the file.
>>>        If clock kind read from the file is different from the parameter,
>>>        the value is not used. */
>>> -void replay_read_next_clock(unsigned int kind);
>>> +void replay_read_next_clock(ReplayClockKind kind);
>>
>> Preferably having this file including "sysemu/replay.h" in the same
>> patch:
> 
> ReplayClockKind isn't declared by anything in replay-internal.h but I
> see another instance of this in the file (e.g. InputEvent).
> 
> Maybe send a follow-up patch for 8.0 that cleans up the #includes?

Sure!


