Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6858B456DF2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 12:05:55 +0100 (CET)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo1iM-0003UT-Fa
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 06:05:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo1gO-0002fD-AT
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:03:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.151.124]:47179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo1gM-0003hZ-Hv
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637319829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bp4wN2AZ3JpBiQ02Qg4P2ZC1FxhTxgHFv3gNsqqtcVw=;
 b=hiQs/plfIpFfLJZnFnIDfgw5AYhDFuDyuNqwTFPv2sUyXmr1frP0tJMChBfX1aJ68d+GLf
 gdUT/YT7pb1TBvsAlqItclfvqJwJ80k2K0IJh6q0X0UaARZ+YlWvezf4wS1WLOwgBXJgGJ
 g3O1f5Ws43bwIVOxqpHwF2KwT++yC08=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2--Qtr5uKOMUOcMkRbDn0a9g-1; Fri, 19 Nov 2021 06:03:48 -0500
X-MC-Unique: -Qtr5uKOMUOcMkRbDn0a9g-1
Received: by mail-wr1-f72.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so1715285wrh.14
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 03:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bp4wN2AZ3JpBiQ02Qg4P2ZC1FxhTxgHFv3gNsqqtcVw=;
 b=jWbhZr2qBLilkQg14gdPUsQnqSFlf6+o3C4mqWPUnjR1WQ7gia6vkjoPCXGVfp0zf5
 rir9IQU+I0QNTsh/4nLiL+Uh3OqCVRUwVJGn6qKoXv2Zjmm8XcPAWy2qiUuKAjPl0mM9
 Ie5caue0/90xgXoXeVD7yMBwdkOAihdONPQEXpVfu8QSyjPJUl3R1p5s3yreMVqUfv1w
 7RWh7jORQwELciWwd9hfyb8PSVDAe7Sn3TCQ/PVnRM8XXhlvSV0Fy0OCEJyHc+yD064a
 2O7yXcu6qX8M9ppUT/ehMrnelVft6HlBlSZTMx1sdJN4TxAW0rgCSb6sE6YuYugMmmQ5
 XFOw==
X-Gm-Message-State: AOAM532UG4TFXbLzrMONg8wOBGFlTWb1LNrIQH0a0MbRhUJDqNqXaLmy
 rKsOvEBDl0EcfHXCGbvWA9NbvSpdI/tJsUOw1uOhbg+We2KefYR21woYkoyJEPgrgUymdcsTXQc
 ntCGq/aAG4yrGc+8=
X-Received: by 2002:adf:e686:: with SMTP id r6mr6241345wrm.379.1637319827264; 
 Fri, 19 Nov 2021 03:03:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDShv9PGU9vGhuIftBNMtD81l2D3Qu927ngRsQsadiSnJYfDc3/YIbBZP9vY8h/qLQNm6l8g==
X-Received: by 2002:adf:e686:: with SMTP id r6mr6241308wrm.379.1637319827005; 
 Fri, 19 Nov 2021 03:03:47 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o8sm2638804wrm.67.2021.11.19.03.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 03:03:46 -0800 (PST)
Message-ID: <45ffa010-7c93-1020-46b2-84c0f2060c20@redhat.com>
Date: Fri, 19 Nov 2021 12:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP
 device instead of IF_NONE
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>
References: <20211119102549.217755-1-thuth@redhat.com>
 <f2de8ec7-3157-0f87-cfc8-70633e0f8658@redhat.com>
 <4a4c5223-905f-9974-3e54-e4ccd133c359@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <4a4c5223-905f-9974-3e54-e4ccd133c359@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.151.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 12:02, Thomas Huth wrote:
> On 19/11/2021 11.40, Philippe Mathieu-Daudé wrote:
>> On 11/19/21 11:25, Thomas Huth wrote:
>>> Configuring a drive with "if=none" is meant for creation of a backend
>>> only, it should not get automatically assigned to a device frontend.
>>> Use "if=pflash" for the One-Time-Programmable device instead (like
>>> it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).
>>>
>>> Since the old way of configuring the device has already been published
>>> with the previous QEMU versions, we cannot remove this immediately, but
>>> have to deprecate it and support it for at least two more releases.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   docs/about/deprecated.rst | 6 ++++++
>>>   hw/misc/sifive_u_otp.c    | 9 ++++++++-
>>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>>> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
>>> index 18aa0bd55d..cf6098ff2c 100644
>>> --- a/hw/misc/sifive_u_otp.c
>>> +++ b/hw/misc/sifive_u_otp.c
>>> @@ -209,7 +209,14 @@ static void sifive_u_otp_realize(DeviceState
>>> *dev, Error **errp)
>>>                             TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
>>>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>>>   -    dinfo = drive_get_next(IF_NONE);
>>> +    dinfo = drive_get_next(IF_PFLASH);
>>> +    if (!dinfo) {
>>> +        dinfo = drive_get_next(IF_NONE);
>>
>> Isn't it a bug to call drive_get_next() from DeviceRealize()?
>>
>> Shouldn't drive_get_next() be restricted to the MachineClass?
> 
> Yes, that would certainly be better - but considering that we are
> already past RC1 of the 6.2 release, I'd rather prefer to keep this
> patch rather as small as possible and do such refactorings during the
> next development cycle instead.

OK. For pflash:
Acked-by: Philippe Mathieu-Daudé <philmd@redhat.com>


