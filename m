Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796BF302799
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:18:03 +0100 (CET)
Received: from localhost ([::1]:42102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44Z0-00045e-JF
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l44XP-0003aQ-Mb
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:16:23 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l44XO-0006dX-B5
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:16:23 -0500
Received: by mail-ed1-x52c.google.com with SMTP id f1so16021596edr.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TbHQX+UFwcyzNi71PDdQ77nlDe+HEZpobYtT3W14WJI=;
 b=It9BzOsFQ9wcT/W+kgRvTVGqOGtNGWWSOTTz8LBKLc4cf+P6Kh/lp3PgfR+xzrWVNc
 KGtG56C+psaqjT2rtSgTWzv38LmSg3Mz4W5M0FCZs4lQPhKfQqpYjEbkVM32DZIPdjde
 3XeYM1YuwT/shV0vHT63T1AFEAqp1qA978ZQGobKYqaK3lOdamxkNb11kb+YiOFYQFFD
 vzMxrkcXANaI9LcYYH4Qu20hXquAKYQeuCj7Rh/SVdLS6xtf7eznTPTtMduuGPNopSM5
 jpP09Hddjj6p+YXZTE3TGsTC3fBCVDiz0xN8oKJtANcnnSaeNwQS6kF4u2pUTWk+22H5
 H4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TbHQX+UFwcyzNi71PDdQ77nlDe+HEZpobYtT3W14WJI=;
 b=s/lCqXyeorSChu87Jvxbm2LSxkEo8w1tYi82S0TjVNABJF6doogZ19iaSSQi2dQGz4
 rbibeWsIIwpqAxYbTxawH0NKpE8iYPeoGy+3Q1sNGgjElLiugCyGu0HH181Gnlyzcumo
 YqKWSNWSRdmZni87d/GKA2Wy/ddt7IzRyVQszFhAqzGEDeYCqOXjp7gm409ylOs/TH48
 NkYUdd+U3oMH2zm9W+p6SIDZCR9die+JnyH0IBuBzkTId8htvO7qqY+HHXCyx6RA0/ee
 YHpYqk+J9oZj0r0CP2aKAOA22FjEMt2rC3fffO7DV7D1aLyVxtdQA3srD+xdSG3T5O9H
 hnXg==
X-Gm-Message-State: AOAM531HZ+vYwPyFwe7BF47QiaIU0ZgzQBD11sqSa9btYke/TL8XosYv
 DzKYK51BoJ07CJhlNZ5fMo2JINobq4E=
X-Google-Smtp-Source: ABdhPJyCTaPdaJbpG3CZQevfa54NgaJOEB4XnMjcKgo30JG86eqF6DIOUKoRPtY9uI9XUY0tdxJGdg==
X-Received: by 2002:a05:6402:1ad0:: with SMTP id
 ba16mr1079731edb.287.1611591380994; 
 Mon, 25 Jan 2021 08:16:20 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q22sm8527966ejx.3.2021.01.25.08.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:16:20 -0800 (PST)
Subject: Re: [PATCH v7 07/35] Hexagon (target/hexagon) scalar core helpers
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-8-git-send-email-tsimpson@quicinc.com>
 <ae9949ca-aa0c-8917-8498-2b0dc5161465@amsat.org>
 <BYAPR02MB4886E0356F7845E71C92D87FDEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6038ec96-e524-0ea7-60f2-6c9a0267e00d@amsat.org>
Date: Mon, 25 Jan 2021 17:16:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886E0356F7845E71C92D87FDEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 10:50 PM, Taylor Simpson wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> On
>> Behalf Of Philippe Mathieu-Daudé
>> Sent: Friday, January 22, 2021 2:30 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: richard.henderson@linaro.org; alex.bennee@linaro.org;
>> laurent@vivier.eu; ale@rev.ng; Brian Cain <bcain@quicinc.com>
>> Subject: Re: [PATCH v7 07/35] Hexagon (target/hexagon) scalar core helpers
>>
>> Hi Taylor,
>>
>> On 1/20/21 4:28 AM, Taylor Simpson wrote:
>>> The majority of helpers are generated.  Define the helper functions
>> needed
>>> then include the generated file
>>>
>>> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>>> ---
>>>  target/hexagon/helper.h    |   85 ++++
>>>  target/hexagon/op_helper.c | 1066
>> ++++++++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 1151 insertions(+)
>>>  create mode 100644 target/hexagon/helper.h
>>>  create mode 100644 target/hexagon/op_helper.c
...

>> ../target/hexagon/op_helper.c:201:27: error: format ‘%lx’ expects
>> argument of type ‘long unsigned int’, but argument 4 has type ‘uint64_t’
>> {aka ‘long long unsigned int’} [-Werror=format=]
>>   201 |             HEX_DEBUG_LOG("\tmemd[0x" TARGET_FMT_lx "] = %lu
>> (0x%016lx)\n",
>>       |                           ^~~~~~~~~~~
>> ......
>>   204 |                           env->mem_log_stores[slot].data64);
>>       |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>       |                                                    |
>>       |                                                    uint64_t {aka
>> long long unsigned int}
>> ../target/hexagon/internal.h:28:22: note: in definition of macro
>> ‘HEX_DEBUG_LOG’
>>    28 |             qemu_log(__VA_ARGS__); \
>>       |                      ^~~~~~~~~~~
> 
> Strange, I don't see those errors.  I tested it on Ubuntu 16 with gcc 4.8 and 5.5 and Ubuntu 20 with gcc 9.3.  Could you tell me more about the system you are building on?

Raspberry Pi 2, but it is probably reproducible on all 32-bit hosts
(QEMU provides Docker images for cross-building win32, armel, armhf).

> 
> All of those HEX_DEBUG_LOG calls should be #ifdef'ed out.  Did you change the definition of HEX_DEBUG in internal.h?  Even when I set HEX_DEBUG to 1, I don't see these errors.

I haven't changed anything.

Regards,

Phil.

