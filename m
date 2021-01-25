Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD93027F2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:34:14 +0100 (CET)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44of-0001I9-TM
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l44kJ-00076T-6h
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:29:44 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l44kH-0000EO-OJ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:29:43 -0500
Received: by mail-ed1-x52f.google.com with SMTP id c2so15847033edr.11
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=piabbMNInoiMaTDXJgQiFzCsEKVcPciPgDV74gb64/I=;
 b=cJUEBbB/BoOIaQzoo8Wyr/7Xf0R4UK8/S+x/znObEsI1cHBAhnaSLeb+gQHQUMFi/S
 HxsfvrA4OnC1rYdrSpRHB1oD8aglqB6gSXpdhMzmyrCHwlC6LDUMtOQ3rLnX3dqyQviM
 FzFuGquxLwe4J3MgxWC3BVokpunx/ay3yhiSnsWPflZoj1XNtw702VJJYuPWuGoiTsar
 lFR4nbW7L37NXT9HfhsCC7kQWzFpnOQU1LDoN6SXry4JA3qMoe1RAuwSRLLhLqDJv2eK
 VbIKAYHL6QkEQPkcJUNRSWWmCSbi4ZevOI4PRYjdz+ofhJIK4YLeTwHTzgkHN/hWQYhj
 0luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=piabbMNInoiMaTDXJgQiFzCsEKVcPciPgDV74gb64/I=;
 b=NKtnZ+zGd9Q4Z1vCibAjpWS8OHg9H7MhKt4OS3kK5W7X6yahxfpz/smbDXskZICXqP
 6Q7i6qGJS4m09R7E3OrzwpMkWsfGrQhNGbdq+E99/FWFn7RPSzJPoSrlSkKrE55dDStB
 se0FA6KopPPPgOqxgL9DPm8tjbl/RMTyR/T6668vzLolekJOM/fvbYh3BOirrGf1kpkF
 vobHTDsuSkAQKFgaogDBU6YP/QRUXEtyJ6WmxfJ0fBg0tQzhzbETcgeNQ7RpCoLcTzwc
 5v6D5kZzMCOh7ZibYBs5ciALh7g47uuuQIZYUysNc7svWdEf4eMLN/wcQMrKmJ27NcWV
 4R0Q==
X-Gm-Message-State: AOAM530Xcd7i9USn4irx6YAd1V+QvyZmW8VUhXkCxexlJyuJROlilA32
 lMog0ujPLS3MIpgb6w4OvSI=
X-Google-Smtp-Source: ABdhPJyqvsTglG4mKOd/4gaGNiOHIa6p/OUaqhkevAsnCw7Yd7BMPGTQAYD3FTWdhgbFiVdc16oVnQ==
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr1140489edd.92.1611592180370; 
 Mon, 25 Jan 2021 08:29:40 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p26sm10920353edq.94.2021.01.25.08.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:29:39 -0800 (PST)
Subject: Re: [PATCH v7 15/35] Hexagon (target/hexagon/arch.[ch]) utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-16-git-send-email-tsimpson@quicinc.com>
 <8e41b920-e7de-a7da-bba1-f8a649006955@amsat.org>
 <BYAPR02MB4886B63FA0C74ACAE6275F6ADEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a41dce6-7b6e-8764-3c8f-1439079f1982@amsat.org>
Date: Mon, 25 Jan 2021 17:29:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886B63FA0C74ACAE6275F6ADEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
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

On 1/22/21 10:59 PM, Taylor Simpson wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> On
>> Behalf Of Philippe Mathieu-Daudé
>> Sent: Friday, January 22, 2021 12:09 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: richard.henderson@linaro.org; alex.bennee@linaro.org;
>> laurent@vivier.eu; ale@rev.ng; Brian Cain <bcain@quicinc.com>
>> Subject: Re: [PATCH v7 15/35] Hexagon (target/hexagon/arch.[ch]) utility
>> functions
>>
>> Hi Taylor,
>>
>> On 1/20/21 4:28 AM, Taylor Simpson wrote:
>>> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>>> ---
>>>  target/hexagon/arch.h |  35 ++++++
>>>  target/hexagon/arch.c | 294
>> ++++++++++++++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 329 insertions(+)
>>>  create mode 100644 target/hexagon/arch.h
>>>  create mode 100644 target/hexagon/arch.c
>>>
>>> diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
>>> new file mode 100644
>>> index 0000000..a8374a3
>>> --- /dev/null
>>> +++ b/target/hexagon/arch.h
>>
>> Maybe rename "arch_utils.[ch]"?
> 
> Any particular reason?

I was thinking about not being confused by an architecture specific
file when doing refactors involving multiple architectures. But this
isn't a great improvement neither... No problem.

> 
>>
>>> +extern int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
>>> +                                  float_status *fp_status);
>>
>> (Again, no need for 'extern').
> 
> OK, I will change these.
> 
>>> diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
>>> new file mode 100644
>>> index 0000000..c59cad5
>>> --- /dev/null
>>> +++ b/target/hexagon/arch.c
>> ...
>>
>>> +#define RAISE_FP_EXCEPTION \
>>> +    do {} while (0)            /* Not modelled in qemu user mode */
>>
>> I don't understand why... Can you explain please?
> 
> Our Linux kernel only sets the relevant bits in USR (user status register).  The exception isn't raised to user mode.

Hmm while you introduce the linux-user implementation of your port,
this file is not restricted to user mode. Thinking about avoiding
head aches to someone wanting to add system mode emulation (or a
BSD port??), maybe your helpers should consider that.
Maybe some cheap #ifdef'ry CONFIG_USER_ONLY with a comment explaining
why there is nothing to do in user mode, and g_assert_not_reached()
else. Not sure, just wondering...

Regards,

Phil.

