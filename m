Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AC9631F0D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:05:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4cB-0004f2-5X; Mon, 21 Nov 2022 06:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4c9-0004cf-53
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:05:25 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4c4-0007m4-Jg
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:05:23 -0500
Received: by mail-wr1-x431.google.com with SMTP id g12so19252916wrs.10
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 03:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2AR8eK0Euej5hvJFJpTPMtz/B2Ks2e0GgVSblXEZX7k=;
 b=UqTSfMQMtyd3V9c+IW1cW5ThWAv1Cj3/I4d0GrpdczeHwFoOVXOt2RqqRaFcW4VL5g
 MKzT/hiaGBMn7sY4aIikwch1uxqPyo0K//xSbtsLlKGsW/pubEyMMxq5Nkf5a20s6yxT
 wtsDtfy0lPwUhuQOBzghqaXs+KztEZ7wJsO08iU6oO+QHx+lCqYYH0iGl4OrqIrkST99
 UUCaiZQwpPJxG6LJoWti3ZAnmiqJ40DrtbDTSctTbH8UmBtzjll+Bk/wuAZ9dV2Y3WOi
 1jrlpw29ILTkmBKZB6PTry44af/vJD7BENrJXf9oBFt3BbROc2MceF1z4adparo8QEi6
 loEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2AR8eK0Euej5hvJFJpTPMtz/B2Ks2e0GgVSblXEZX7k=;
 b=hoSGCbh62iCzp+a7sGOmQBUnsN9cPd/vP+h9yg4aTpbgNmYtwyNFmrGV9iy3F/m0B5
 XJ2Aida9hL5/iFpexWrICjjpVOdUforptNAASbpf+p187fIGwkCD3MgW8Vp3mnQpJFru
 eMLfUSgiGXA96+Bdv/SQlOq373Bu+HIZgRaEs6Y9/znAvTjCzYO8nBbAneMEiD9GM3hk
 tvqdZU/K4wYcTB0nagXV09qtLY8t/2TNe+LXMBMxHanZlb/riHcMfhztR7xOwMVganT/
 KX02tRQdUsFo1s/XPbcHv/fPtGA17naxw3z1GyVsTV3+OVZ/Zg71bkDrINAbhWQb9McJ
 d+mw==
X-Gm-Message-State: ANoB5pk+zI60gdnU/qDr8sB15FWzVundrXdLxaALmZhh11OjyPTZgy4V
 Z+ym0b6CHZtatVN0IOuDp36UyQ==
X-Google-Smtp-Source: AA0mqf4fHOuilEjC+37ShmoB+FyGUwFGE4J/31StmYlKyhnJ6CZOeeJsnz3D+JR1fpc8+FgSMgw0GQ==
X-Received: by 2002:a05:6000:1805:b0:236:7180:6ccc with SMTP id
 m5-20020a056000180500b0023671806cccmr3846886wrh.573.1669028704111; 
 Mon, 21 Nov 2022 03:05:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003c6bbe910fdsm23927927wms.9.2022.11.21.03.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 03:05:03 -0800 (PST)
Message-ID: <9f2b72a3-bf2c-9672-ab54-c7cf68b5691d@linaro.org>
Date: Mon, 21 Nov 2022 12:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 1/7] qemu/main-loop: Introduce
 QEMU_IOTHREAD_LOCK_GUARD
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-2-richard.henderson@linaro.org>
 <87k03s75c5.fsf@linaro.org> <702c1474-2dd1-1e09-935a-427b97a24652@linaro.org>
 <87edtwd3zr.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87edtwd3zr.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 21/11/22 10:55, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 11/18/22 05:30, Alex Bennée wrote:
>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>
>>>> Create a wrapper for locking/unlocking the iothread lock.
>>>>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>> Cc: Paolo Bonzini <pbonzini@redhat.com> (maintainer:Main loop)
>>> You might want to review Paolo's comments from:
>>>     Subject: [RFC PATCH] main-loop: introduce WITH_QEMU_IOTHREAD_LOCK
>>>     Date: Mon, 24 Oct 2022 18:19:09 +0100
>>>     Message-Id: <20221024171909.434818-1-alex.bennee@linaro.org>
>>> So it would be worth having the WITH_QEMU_IOTHREAD_LOCK() and
>>> MAYBE_WITH_QEMU_IOTHREAD_LOCK() helpers for completeness.
>>
>> I don't see that (MAYBE_)WITH_QEMU_IOTHREAD_LOCK is particularly
>> useful in any of the cases that I converted.
> 
> Fair enough - as long as they are easy enough to add later. The WITH_
> forms do work nicely to wrap a particular area under lock and make
> things visually clear vs the LOCK_GUARD which basically holds the lock
> to the end of function or exit.

I concur for WITH_QEMU_IOTHREAD_LOCK(), it is a no-brainer.

