Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9FA6C1672
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peH4P-0006Gk-Vg; Mon, 20 Mar 2023 11:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peH4O-0006G2-0T
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:05:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peH4L-000798-9j
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:05:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id p16so7733015wmq.5
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679324703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jgvv1QZjJG37CU3afJeyCdVBNX5o0VRmrK2H6w2X2rI=;
 b=WAqF3wjbhW+U5kfbDIAs87ir6pFWYMOGTV4KwHHOtH9BVnjChWJ1mG5PHcfe/lcl6+
 qioVfz+INnBvRxJK6dUMMKJJ1jANRFtpbuQL3YF7jwtIeK33jfM+CGodmC94o7gijrzs
 vnbNj9wqrGuG/6CpphTtPvFk8cSsGu0/M55lZMp+V8Ik1Zr/UywdXn1SbK3kLgL7Gjda
 sHBx4XS0xXbN042KLxeSKXSeFRrHiJBD1sgBx3LEOqxSRluwQsbmHmmz6iBAkhhiO+q1
 Zcg37nmFrceKgY+fKT3FXURFEO4G5Re5aGolNBeDwv5WGrEIy6RG5X8rXSyHgeAWCr7M
 Af/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679324703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jgvv1QZjJG37CU3afJeyCdVBNX5o0VRmrK2H6w2X2rI=;
 b=GASkLbfiPUygLA3jsZ7pavVggNsD3JvyzZrYtQ07tCG/NOHZrTHYu3AHuOnCrIFzV5
 d8XFevPug0UMihPGWOXgXweKBhX2/uIZj/bWw0afyWeKXEP8DSRz0QQKLyvo6I9DhUVc
 WhUZtjjKNbHaWkffQkYKO8RtrqhlNRzBuPYWsy7RWZf48SM4WUw+8UVTxYfLP0paMxhP
 yXpZifAAGGKTYFVQ6sgUwD9PjQmRUqRrgcjy/izx8MlZtpSVnAyrZBF73guAnXtCJIrN
 g8dwryMFS2bUM3AFRZOURFKamsF2PABb/d08DDj9H7Izoa1WEWg7nX43xLqkpM759eh1
 wVng==
X-Gm-Message-State: AO0yUKVnyoG35XKIxBGRc53ONKRNt6cGhKWdSpVRYZ9y5c26/cnyhLIx
 fB1dY2KVXw3YeHy2fwxBqGh8Tw==
X-Google-Smtp-Source: AK7set936UDZ4QI2VigXQr5mmQMNqTED5QQYlD1a2/uSOrU+VjdnE2ZvK/al5m1G60iuu8aE3pVKlg==
X-Received: by 2002:a05:600c:2185:b0:3ed:8780:f27b with SMTP id
 e5-20020a05600c218500b003ed8780f27bmr10125601wme.16.1679324703006; 
 Mon, 20 Mar 2023 08:05:03 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k16-20020a7bc310000000b003ed2433aa4asm10685645wmj.41.2023.03.20.08.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:05:02 -0700 (PDT)
Message-ID: <002645e6-75a0-0409-a0ae-90265e4e4d1c@linaro.org>
Date: Mon, 20 Mar 2023 16:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/2] fix for #285
Content-Language: en-US
To: Emilio Cota <cota@braap.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230205163758.416992-1-cota@braap.org>
 <Y+92tpDQVytnfvnd@cota-l14> <ZBcY+WL+65D7Zi5F@cota-l14>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZBcY+WL+65D7Zi5F@cota-l14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Hi Emilio,

On 19/3/23 15:15, Emilio Cota wrote:
> Ping. Any feedback on these two patches?
> 
> https://patchew.org/QEMU/20230205163758.416992-1-cota@braap.org/
> https://lore.kernel.org/qemu-devel/20230205163758.416992-1-cota@braap.org/
> 
> Happy to resend if needed.

Since we are past hard-freeze, this series likely missed the v8.0
release IMO. Note that doesn't mean maintainers can't queue it and
send the pull request later when the next development window opens.

> On Fri, Feb 17, 2023 at 07:44:38 -0500, Emilio Cota wrote:
>> Ping.
>>
>> This fixes a bug (admittedly with a big hammer) that affects
>> users with heavily multi-threaded user-mode workloads.
>>
>> Thanks,
>> 		Emilio
>>
>> On Sun, Feb 05, 2023 at 11:37:56 -0500, Emilio Cota wrote:
>>> Changes since v1:
>>>
>>> - Add configure check to only use QTree if Glib still implements gslice.
>>>    If Glib doesn't, then we call Glib directly with inline functions.
>>> - Add TODO's so that in the future (i.e. when the minimum version of
>>>    Glib that we use doesn't implement gslice) we remove QTree.
>>> - Add comment to the top of qtree.h.
>>> - Make qtree-bench results more robust by running longer or more times.
>>> - Drop deprecated API calls (they're unused in QEMU).
>>> - Drop API calls that are too recent (they're unused in QEMU).
>>> - Drop macro benchmark results from the TCG patch since they're too noisy.
>>> - Add test program to the commit log so that we don't lose it in the future
>>>    even if the bug tracker goes away.
>>>
>>> Thanks,
>>> 		Emilio
>>>
>>>
> 


