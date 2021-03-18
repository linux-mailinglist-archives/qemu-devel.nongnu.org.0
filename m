Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83C340A53
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:39:25 +0100 (CET)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvgC-0001Sw-Ew
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMvKu-0006BX-Tt
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:17:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMvKr-0001d7-9z
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616084233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vyox48F9RnWLU/putyihb72tTWT6o5HHGl0Qa4uFJ1k=;
 b=QnsXGYyzTTStg+kWCAbhWfUdJHDyBr5Q7EG9Ku63RMiHD0Yn2QclC9fMD2AcDPObVmgoHo
 TJg4hl0IXEyPfujs03mzDKfzxLLMpGWbmh+JzcqjSnkVjpFjSzLZntV/ZQtgpIk1KYqxFW
 yz8WxgSc0StOfxwhxzxtl+o+cHbiUsw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-TGy_qPvdM0O_BaITE6HNLA-1; Thu, 18 Mar 2021 12:17:10 -0400
X-MC-Unique: TGy_qPvdM0O_BaITE6HNLA-1
Received: by mail-wr1-f72.google.com with SMTP id x9so20176493wro.9
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vyox48F9RnWLU/putyihb72tTWT6o5HHGl0Qa4uFJ1k=;
 b=hF7mw+41+B7OnhRHKxOdiBvTOJIJ7hau2StsiZZ13hQ/U/9eJWekkbqI/9KdqyNKWo
 wgl+8I0GlA6OUmlViESk4BClD8yyDRjPrlwKWwmq4SmwlcP0HKsG7pdSoiANl//Lstkw
 XM2Xf39C87pmadcYPmJvGFGy93irNTTk7XSh0MO6Y9qtgZ/BJ1VJgk0TQIUGS4/1Z4Zp
 cEXEFGUJls2by8ZnxxB0ZT+oXrdJ4pHL1wmyGo8Ei5v9kyyGZnmm4GjxuDBcYvNjdW78
 PsrCJa8Hk5HYRbZ9O7ZIPSpwCE6ZhMzpsQinbcgEi/FB8fNkU73ORV2xO/fW3C0YWl8j
 1xGg==
X-Gm-Message-State: AOAM532i/5QJdu8w6Qq5uyiyTXwwYnXY9wEITieJdzEEclvtPxECkyPh
 WhZbjvRbkmUIB53bl11Tfz/aSQkKq9EiatzOBD5HveSp5tAl+rsaUESmlep6F1K4LLNeE4++wXs
 mYYE9x3ts43WnUNc=
X-Received: by 2002:adf:fbce:: with SMTP id d14mr102161wrs.44.1616084228984;
 Thu, 18 Mar 2021 09:17:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz552TiAfx/J6ET59KQpueGbWzvjiYU6Bz+s1Zm806KPNHRUhTyJgNIK4S9O/uEEu9/P3Mj/Q==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr102140wrs.44.1616084228771;
 Thu, 18 Mar 2021 09:17:08 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y18sm3688875wrq.61.2021.03.18.09.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 09:17:08 -0700 (PDT)
Subject: Re: [PATCH] intc/i8259: avoid (false positive) gcc warning
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20210318154738.27094-1-borntraeger@de.ibm.com>
 <69bb59c7-1f97-ba07-5150-d94d03210920@redhat.com>
 <bb7ec2df-db8e-2d3e-e392-1d2e16ce81e6@de.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c9515297-2472-c5d8-e85b-9b2741862c83@redhat.com>
Date: Thu, 18 Mar 2021 17:17:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <bb7ec2df-db8e-2d3e-e392-1d2e16ce81e6@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 5:11 PM, Christian Borntraeger wrote:
> On 18.03.21 17:03, Paolo Bonzini wrote:
>> On 18/03/21 16:47, Christian Borntraeger wrote:
>>> some copiler versions are smart enough to detect a potentially
>>> uninitialized variable, but are not smart enough to detect that this
>>> cannot happen due to the code flow:
>>>
>>> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
>>> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in
>>> this function [-Werror=maybe-uninitialized]
>>>     203 |         irq = irq2 + 8;
>>>         |         ~~~~^~~~~~~~~~
>>>
>>> Let us initialize irq2 to -1 to avoid this warning as the most simple
>>> solution.
>>
>> What about:
> 
> This also works, but if you want to go down that path then it would be
> good if you
> could do this patch as I do not have the testing infrastructure to do
> proper x86
> changes.
>>
>> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
>> index 344fd04db1..bf28c179de 100644
>> --- a/hw/intc/i8259.c
>> +++ b/hw/intc/i8259.c
>> @@ -189,20 +189,18 @@ int pic_read_irq(DeviceState *d)
>>                   irq2 = 7;
>>               }
>>               intno = slave_pic->irq_base + irq2;
>> +            irq = irq2 + 8;
>> +            pic_intack(s, 2);
>>           } else {
>>               intno = s->irq_base + irq;
>> +            pic_intack(s, irq);
>>           }
>> -        pic_intack(s, irq);
>>       } else {
>>           /* spurious IRQ on host controller */
>>           irq = 7;
>>           intno = s->irq_base + irq;
>>       }
>>
>> -    if (irq == 2) {
>> -        irq = irq2 + 8;
>> -    }
>> -

This looks like the patch I just sent :)


