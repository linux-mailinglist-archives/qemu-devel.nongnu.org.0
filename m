Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1D05BAF93
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 16:45:46 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZCbB-0002pf-UR
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 10:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCWD-0004VD-Vc; Fri, 16 Sep 2022 10:40:38 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCWC-0005QF-9V; Fri, 16 Sep 2022 10:40:37 -0400
Received: by mail-pg1-x52b.google.com with SMTP id t65so20572659pgt.2;
 Fri, 16 Sep 2022 07:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=5IihWDj5b67Y9nHNA77Y/yguccHMnQZ4dH5/aT0IYkk=;
 b=o208qKfKiMFoWJcd1MhXVvZRCWL3ZM9VlaiSDq9kVQSsbi3fITK8cTZpRBXfpgR2lR
 vcBY0H6qPTu+ya2DXZWqmH/JPniW5fLBz6uqXn0D49qtHRQdwT4i4M09ujPtQqKddgOz
 XXdITmQOuuw/mZnlmBbwSch+r3jGnt8Ael/sscGLYFN5yS4V2ypHId18M1Etto9ak1/E
 JV5/XZ+AtzuOnpa6WZt2BxESy1nx7HNEOUfHBPZlrwY/hBH12UT7NMSp5HxWjQwkN5e9
 RIvht2nhJnmzmmXbXsj4g4oQdQkx8lW96Gkge+DnL2tYuPVvZRCuHkMWn4X7MoTJqHX9
 N7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=5IihWDj5b67Y9nHNA77Y/yguccHMnQZ4dH5/aT0IYkk=;
 b=tEyESBu9xqVx5zkZjADxMdQww9womz6wiPCOYIElHwzFoVyijwWBKNWaOVxIm3wbiA
 MaiCXHe62L4NyW49WvsJx6721LBRhRX45F9q6gVukKp4f7lZLk1LOYl/l53hRt1ogEP0
 7OrJXshdL3C9LVa12V8IAvm7dqNsYIPnaTsjE0XJl+SHRxkmurF3Lm69g+o4ODorPNpX
 PLIIZpKp6xso6WxgmECBAGmQnvNfLUGuLmoki7bp3jrtgg7H5tvJbVI4WeUq9h4bPtad
 ++G/ybSZO6BeEh7w7jjpMF0h3Tw/dMZjj+VSd/ZNt1l8DG8qwgCem3K4ByLk421dovRh
 jCdg==
X-Gm-Message-State: ACrzQf302f9QeIkQRNoRIWoMp640e4/wFiXEb8sfCDP+lkS1U4KsY+ul
 f2yiOIQKbRClDHhttT5QZqA=
X-Google-Smtp-Source: AMsMyM4g+CP1mMbyazDO8kVEOdPQdoo6RhQhqT1HT9hkv1d0i4UZOwjVBU9FaSmkK0sxlvV8UYF6lA==
X-Received: by 2002:a63:6685:0:b0:439:869c:e16d with SMTP id
 a127-20020a636685000000b00439869ce16dmr4861478pgc.19.1663339233850; 
 Fri, 16 Sep 2022 07:40:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z23-20020aa79597000000b00540963470d1sm14728700pfj.84.2022.09.16.07.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 07:40:33 -0700 (PDT)
Message-ID: <b80500f1-0ee5-d600-7834-22196baf5bfb@amsat.org>
Date: Fri, 16 Sep 2022 16:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 2/4] qtest: make read/write operation appear to be
 from CPU
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-3-alex.bennee@linaro.org>
 <c6d2e06f-75b8-0ba2-5e0d-51603873e40c@linaro.org>
In-Reply-To: <c6d2e06f-75b8-0ba2-5e0d-51603873e40c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.816,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/9/22 10:08, Richard Henderson wrote:
> On 9/14/22 17:09, Alex Bennée wrote:
>> The point of qtest is to simulate how running code might interact with
>> the system. However because it's not a real system we have places in
>> the code which especially handle check qtest_enabled() before
>> referencing current_cpu. Now we can encode these details in the
>> MemTxAttrs lets do that so we can start removing them.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   softmmu/qtest.c | 31 +++++++++++++++++++------------
>>   1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
>> index f8acef2628..c086bd34b7 100644
>> --- a/softmmu/qtest.c
>> +++ b/softmmu/qtest.c
>> @@ -362,6 +362,13 @@ static void qtest_clock_warp(int64_t dest)
>>       qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>>   }
>> +/*
>> + * QTest memory accesses are treated as though they come from the
>> + * first (non-existent) CPU. We need to expose this via MemTxAttrs for
>> + * those bits of HW which care which core is accessing them.
>> + */
>> +#define MEMTXATTRS_QTEST ((MemTxAttrs) { .requester_cpu = 1 })
> 
> Maybe clearer as { .requester_cpu = true, .requester_id = 0 }?
> Otherwise it kinda looks like we're setting the second cpu (index 1).

We could rename the field as 'requester_is_cpu'.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 


