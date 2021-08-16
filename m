Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F3C3ED957
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:58:55 +0200 (CEST)
Received: from localhost ([::1]:51202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFe4k-0006R0-7Q
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mFe3Q-0005Zs-1O; Mon, 16 Aug 2021 10:57:32 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:44845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mFe3N-0003TC-51; Mon, 16 Aug 2021 10:57:31 -0400
Received: by mail-oi1-x234.google.com with SMTP id w6so26974543oiv.11;
 Mon, 16 Aug 2021 07:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yeJvrt/URYsH5DeuIhCDWvfsNDkqzl5pA0PAdxzZ5a0=;
 b=UlnCh7HNAPqHdoS4uLSz+CDSCWHWGm7Z34Qxor5gFt7p9KqG64XfKuoCWyCBFAxBiI
 DUq5WNmv8hbTkS0YMEZ+cKkTqtqSFreCpU3dIUDwHj7i6f/+ZgerA4pik1F/7cHVOb8o
 PWvwB6Wwj6lVMRMwzGFFqoB1d/pa//PruJ3+uLqaAHbVY+syZUpdf7MdNOizHwLSrnag
 K/RSLAssCSEGx80wGDYqkjxfDGNO31Jxob8R+UjwsAUB8dFGO4ryqlTZuZjppN2bqPb/
 1hc76b8gx7L7+WJJ/F8xDB/c7qwGOa6Hd8D1YMJQEKZAT1pWF9S1iwvmEvniNEWCENWt
 kvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yeJvrt/URYsH5DeuIhCDWvfsNDkqzl5pA0PAdxzZ5a0=;
 b=To05bpmmrPLkgjkXF4I0vmDCz2/oetHPYCGSdlJu/txKB0lfHriTUckFJV0vxSJ8mK
 BwIqm8NBCrH9BooOYtUr5tk+PH7qUznfEY4ixbLonz8CGquwV4VNkGZwhxdznxuZchJe
 59srA5/pYj9FqNCsTDaefoia9t5DrROXF0Lwxe/d7S60rGFAlHXhu4SPPnGQ4678COD+
 yOIYWwgVxTWwQrBgGX+EM8/EH63fcP7Tkw+VXwMDIfrF76Pyx9j5DBr/s/0xw8/AiAVk
 haHKAp/xoaJMh19NWX4suY8SiqDHJG9TwOPMh2WEc9Wy1kYv3mMvB5iB4FakfyOe4tmi
 AmoQ==
X-Gm-Message-State: AOAM532PRHnOXM/CsGxNCoHWJ7t1z6RJjV0VWPyoblfPV8fj8Gs58ZLE
 YczufGEDMor2TVarctRSccg=
X-Google-Smtp-Source: ABdhPJwdfGMEGZwAQQ4x1Jy3VXL7Kq+nxNGYzVm7BChmR+Rup+ryRsYuFc66cn16TUaVkITMsZOTlA==
X-Received: by 2002:a05:6808:3c2:: with SMTP id
 o2mr12256603oie.50.1629125846361; 
 Mon, 16 Aug 2021 07:57:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 y12sm2108251oiv.55.2021.08.16.07.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 07:57:25 -0700 (PDT)
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
 <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
 <6b0a3a08-a57b-fbb6-71d8-3760d76fd265@roeck-us.net>
 <CAFEAcA_CJXseGT6A36h86Tt7rrgy0T14kXAMGLmR=AgO5W78ww@mail.gmail.com>
 <1ac55b8f-db96-0747-5beb-2016ef4bb6b1@roeck-us.net>
 <CAFEAcA9KDTurQx=FgyuWPmRrHQy+q+MrHkTZ0Soe_p8pJW-+fg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e107c042-7477-6b0c-aeec-85efd47116e7@roeck-us.net>
Date: Mon, 16 Aug 2021 07:57:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9KDTurQx=FgyuWPmRrHQy+q+MrHkTZ0Soe_p8pJW-+fg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 7:19 AM, Peter Maydell wrote:
> On Mon, 16 Aug 2021 at 15:11, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 8/16/21 7:03 AM, Peter Maydell wrote:
>>> On Mon, 16 Aug 2021 at 15:00, Guenter Roeck <linux@roeck-us.net> wrote:
>>>> The controllers are instantiated (it looks like the Linux driver doesn't
>>>> really check during probe if the hardware is present but relies on DT),
>>>> but when trying to access them there is a PHY error. If a different Ethernet
>>>> device is explicitly specified and instantiated, it either ends up as eth2
>>>> or as eth0, depending on the driver load order. That makes it difficult
>>>> to test those other Ethernet devices (and with it the PCI controller).
>>>
>>> I thought that code wasn't supposed to rely on the naming/ordering of
>>> ethX anyway these days?
>>>
>>
>> Depends on what you call "that code".
> 
> Sentence should be parsed 'I thought that (code wasn't supposed...)'.
> That is, my understanding was that the kernel simply doesn't provide
> the ordering/naming guarantee that your test code seems to want.
> 

Correct. However, as I said, I can live with carrying the patch locally.

Thanks,
Guenter

