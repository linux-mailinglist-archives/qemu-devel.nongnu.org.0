Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84DB6A7FEF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:28:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXg9j-00049I-Vu; Thu, 02 Mar 2023 05:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXg9h-000492-HQ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:27:21 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXg9f-0000TJ-Ne
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:27:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id l1so12952153wry.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677752838;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P4JoLQ8OysqMGcap3mxRKxq0JN2KApJikzYRFd/ZkLo=;
 b=I573ZfnPOd8Gblpp63CcgbCT3HUMSzytGQ4/Y93VNHhvLEu/wXhce8QzIV75emuHNO
 h/wMmkXSoGu2kQ7aONa5ix99HEl8oIeTbuXzRH5GVERbe8D5GyugkQQk3TJSVzNOq+Dw
 Zpr0yLewkwlVSPeo1ZJZp60nfdyhrKvonbC1PZmp/DYUIcriCxKUFkrWY89dclp6z9Zq
 KWy8wJt+ik04Fsi1RX7OHymcZY/U1c/L6Uac5cuLj7m2+cLBkOsbKepvnoliH6zVxX+L
 +938KIGfawDsz7wb4gksL7W0DTHP+MPFvrqCxrsFJKMKHJaR8R6aUzgauDcs3OQhpr0j
 BvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677752838;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P4JoLQ8OysqMGcap3mxRKxq0JN2KApJikzYRFd/ZkLo=;
 b=LCCTYYAgaJZvsKWH4zMZphINgGw6wD+3R9835mGrJYnVqACLuA99WclK4lpcVwOq0U
 3oiPicAMq+pwWubOOOVD3DoygBWzNhqkOV2F+YpyntHGW4iwZ4QTLh2JWCnSmHwd29yQ
 b0jFDw7pJu6vFCvMOA5v2kXpxygLX6cekR6hY779U804n6SLFAi9M1mWcwLgYLidJ6Sp
 pSbzFdAJ3ugiyrPZ9VdhsfkhSujgaFyp/h56D+HsC+w88+VlXdGSVycAG2eEp/DkWNaI
 m38OLmPN8kAQ/rQ0vsKD/SbdO4InQ6q5x5iwCUHIWOiIKDrpoDZ1++1ULjbCPRcmV8dz
 Vmgw==
X-Gm-Message-State: AO0yUKVPG7fCffdvCxuqy09yT6XK9/msCLvGa0K1j1fTN/+GPly1OQP+
 k2+iowhBwQK7Yc0sHaAioM91vQ==
X-Google-Smtp-Source: AK7set8lLu8zUIEtqXo9hRndHenbFzEEOGj6KdC4AiJGyD/b0zM6LQP2Xy/YZQaVFqZxnGur+x+uog==
X-Received: by 2002:adf:e68f:0:b0:2cb:a82c:2523 with SMTP id
 r15-20020adfe68f000000b002cba82c2523mr7756490wrm.35.1677752838043; 
 Thu, 02 Mar 2023 02:27:18 -0800 (PST)
Received: from [192.168.74.175] (89.red-88-28-21.dynamicip.rima-tde.net.
 [88.28.21.89]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003e1fee8baacsm2574392wmo.25.2023.03.02.02.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 02:27:17 -0800 (PST)
Message-ID: <71ed4fd4-0d47-5802-cb2d-35a49002a92d@linaro.org>
Date: Thu, 2 Mar 2023 11:27:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: Bug in master branch:
 IbmPrep40pMachine.test_factory_firmware_and_netbsd broken
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <928a8552-ab62-9e6c-a492-d6453e338b9d@redhat.com>
 <ef101296-fc49-aa65-bc88-ce12fee8aeea@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ef101296-fc49-aa65-bc88-ce12fee8aeea@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/3/23 10:48, Cédric Le Goater wrote:
> On 3/2/23 08:47, Thomas Huth wrote:
>>
>>   Hi all,
>>
>> seems like we've got another bug that sneaked in during the CI minutes 
>> blackout: The avocado test 
>> IbmPrep40pMachine.test_factory_firmware_and_netbsd is now broken 
>> reliably, see:
>>
>>   https://gitlab.com/qemu-project/qemu/-/jobs/3858833617#L300
>>   https://gitlab.com/thuth/qemu/-/jobs/3858727901#L300
>>   https://gitlab.com/thuth/qemu/-/jobs/3857804517#L300
>>
>> Is anybody already looking into this?
>>
>>   Thomas
> 
> I tried manually and QEMU reached :
>        >> (builds@wb29, Tue Oct  7 23:59:44 PDT 2008)
>      Boot:
>      Loading in()
>      3558080+232036 [197696+188133]=0x3fbbf0
>      start=0x100000
>      Copyright (c) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 
> 2005,
>          2006, 2007
>          The NetBSD Foundation, Inc.  All rights reserved.
>      Copyright (c) 1982, 1986, 1989, 1991, 1993
>          The Regents of the University of California.  All rights reserved.
>      NetBSD 4.0.1 (GENERIC) #0: Wed Oct  8 00:46:56 PDT 2008
>          
> builds@wb29:/home/builds/ab/netbsd-4-0-1-RELEASE/prep/200810080053Z-obj/home/builds/ab/netbsd-4-0-1-RELEASE/src/sys/arch/prep/compile/GENERIC
>      Model: IBM PPS Model 6015
>      total memory = 128 MB
>      avail memory = 119 MB
>      trap: kernel read DSI trap @ 0x7c3042a6 by 0x3e4cf8 (DSISR 
> 0x40000000, err=14), lr 0x377eac
>      panic: trap
>      Stopped in pid 0.1 () at        netbsd:cpu_Debugger+0x10:       
> lwz     r0, r1, 0
>      x14

Bisecting using:

      make print-V \
   && ninja qemu-system-ppc \
   && AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
      avocado --show=app,console \
        run --test-runner=nrunner -t slowness:high \
          tests/avocado/ppc_prep_40p.py

commit cef2e7148e32d61338de0220619d308bf42af770
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Fri Feb 10 16:05:34 2023 +0100

     hw/isa/i82378: Remove intermediate IRQ forwarder

     When the i82378 model was added in commit a04ff940974 ("prep:
     Add i82378 PCI-to-ISA bridge emulation") the i8259 model was
     not yet QOM'ified. This happened later in commit 747c70af78f
     ("i8259: Convert to qdev").

     Directly dispatch ISA IRQs to 'cpu_intr' output IRQ
     by removing the intermediate i82378_request_out0_irq()
     handler. Rename ISA IRQs array as 'isa_irqs_in' to
     emphasize these are input IRQs.

Sorry :/ I'll look at this.

