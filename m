Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9327F49D01F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:57:52 +0100 (CET)
Received: from localhost ([::1]:47316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClcF-0003Rl-Ku
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:57:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nClKV-0001az-I6; Wed, 26 Jan 2022 11:39:31 -0500
Received: from [2607:f8b0:4864:20::1034] (port=37589
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nClKT-0004an-Pk; Wed, 26 Jan 2022 11:39:31 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so4907224pju.2; 
 Wed, 26 Jan 2022 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d4eeiq0M6HrzX3st5ojq3PO+YLP+Hh2eN/dMxyJpIbI=;
 b=oP5kOw07WW96QSmM//op9K1tWnw+3oitPi0WRGiDkysQT+vLH6medsUscWzOmZ2MO+
 k/emgCbVIAEyaWfcVM6xf/03Aypj4Yw7PXE7FeFK96cbXFotLoN7iXVSxSfFeYx7A9Pa
 BHUAYyOM+ppLlwREOaqTcB5XKT+THbwcl9lZg0070g+V9b6+RVtS5tQhzhFnAUk6FoP/
 UdZqPj8TZusHx2QmUYXurc7jq2bsCCMl+moMJh/O2tNHhRThRB/ZSalje1tnXpDxR3Eq
 hshpESxO/leRgGONBn+zvCnJ/kykd0JR8F4fTHCjke+KUWdkNgRGM+5SPvQk3OmqQfTJ
 jABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d4eeiq0M6HrzX3st5ojq3PO+YLP+Hh2eN/dMxyJpIbI=;
 b=0CvY968F3mmEGig5AmZo2koAEH+yu0LaQUTi4ljy754+bYe18Ubcnj6+5it39uob/6
 2wkwLulITmK6Rs62+uck3B0LppTcJymg6TXuEQ/k2fS26EtJvyCbhnkyHgH9Xt3CTRqY
 CqrCH43gCq7oGXJTUIcHb0dtT/tgeADoTtBsOXtMSjNWSmcMHwuqc1+5jwMOKs9+CGnL
 paUfG3M0oVgWAaYpDjDu5v1gortthaO6dI3FrJjxMw1ZBuioE9sgUSBxZ7a6p4Hr7sGa
 2RS94A9Qk9fJTTKYuyVlxwkLR6REGWW6fSFM7qheHHV16Jjq5aIwVbUHFr8tAvvzL606
 d/LA==
X-Gm-Message-State: AOAM530Q18jITfksXEm2hX3C3bGAIXls/4UaAGzdeqUKXjfIRZiROB5u
 krCkRcJ6YN8SHyHj9xwzH20=
X-Google-Smtp-Source: ABdhPJwuO3qtIxgwLN/dys87H42F36vJPaCd1qVZsqx+beMifGGQeY52ymnZ2+pIgUgFMt1E4guDuw==
X-Received: by 2002:a17:902:7d81:b0:149:c926:7c2e with SMTP id
 a1-20020a1709027d8100b00149c9267c2emr24399528plm.27.1643215167966; 
 Wed, 26 Jan 2022 08:39:27 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 8sm497838pji.4.2022.01.26.08.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 08:39:27 -0800 (PST)
Message-ID: <e70de5a0-9b6a-1a5b-b529-99946dd9d37d@amsat.org>
Date: Wed, 26 Jan 2022 17:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] fdc: check for illegal dma length calculation
Content-Language: en-US
To: Jon Maloy <jmaloy@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: pjp@redhat.com, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
References: <20220114013319.348012-1-jmaloy@redhat.com>
 <bac2d939-380c-ec6e-d8e4-bfa6e97b0e18@redhat.com>
In-Reply-To: <bac2d939-380c-ec6e-d8e4-bfa6e97b0e18@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Jon,

On 26/1/22 16:44, Jon Maloy wrote:
> On 1/13/22 20:33, Jon Maloy wrote:
>> The function fdctrl_start_transfer() calculates the dma data length
>> wrongly when certain boundary conditions are fulfilled. We have
>> noticed that the if ((fdctrl->fifo[5] - fdctrl->fifo[6]) > 1) we get
>> a dma length that will be interpreted as negative by the next function
>> in the chain, fdctrl_transfer_handler(). This leads to a crash.

If a security issue is reproducible (like the ones found by fuzzers),
please include the reproducer along.

>> Rather than trying to fix this obscure calculation, we just check if
>> the harmful condition is fulfilled, and return without action if that
>> is the case. Since this is a condition that can only be created by a
>> malicious user we deem this solution safe.
>>
>> This fix is intended to address CVE-2021-3507.

Ah, this is similar to:
https://lore.kernel.org/qemu-devel/20211118115733.4038610-1-philmd@redhat.com/
which already contains the reproducer...
You might want to review it ;)

>> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
>> ---
>>   hw/block/fdc.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>> index 21d18ac2e3..80a1f1750a 100644
>> --- a/hw/block/fdc.c
>> +++ b/hw/block/fdc.c
>> @@ -1532,6 +1532,11 @@ static void fdctrl_start_transfer(FDCtrl 
>> *fdctrl, int direction)
>>           if (fdctrl->fifo[0] & 0x80)
>>               tmp += fdctrl->fifo[6];
>>           fdctrl->data_len *= tmp;
>> +        if (tmp < 0) {
>> +            FLOPPY_DPRINTF("calculated illegal data_len=%u, tmp=%i\n",
>> +                           fdctrl->data_len, tmp);
>> +            return;
>> +        }
>>       }
>>       fdctrl->eot = fdctrl->fifo[6];
>>       if (fdctrl->dor & FD_DOR_DMAEN) {
> I never received any feedback on this one.
> Is there any?

Probably none so far because you forgot to Cc the maintainers:

$ ./scripts/get_maintainer.pl -f hw/block/fdc.c
John Snow <jsnow@redhat.com> (supporter:Floppy)
Kevin Wolf <kwolf@redhat.com> (supporter:Block layer core)
Hanna Reitz <hreitz@redhat.com> (supporter:Block layer core)
qemu-block@nongnu.org (open list:Floppy)
qemu-devel@nongnu.org (open list:All patches CC here)

(now Cc'ed).

