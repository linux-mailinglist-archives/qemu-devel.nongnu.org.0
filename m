Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CAD488B1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 18:16:54 +0200 (CEST)
Received: from localhost ([::1]:49010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcuJR-00009b-7v
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 12:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35426)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hctdv-0005A4-L9
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:34:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hctds-0002GM-KT
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:33:58 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53589)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hctds-0002FT-BU
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:33:56 -0400
Received: by mail-wm1-f65.google.com with SMTP id x15so9779020wmj.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 08:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9lrRlMIMHEQC4vy/D8lyTESWp6sJBMthgCamSxf4p14=;
 b=SQs4pQ7un8BbuqyH/Jj4hIl2hbA+g8Tai0J95kbx2GzEiVJYgs3vsZSyj+nf4wmqDm
 tZX9N7FqNfnu8W8vZoa5tfolf+LtZvGfB6cUJMYOQLHIcs8QoOf1A648PzhSBJsQ1J4v
 93sNg01AUzxycSJPhqUgFx6itt15Sz/4s/mwF0ORoWeSJuPb3ELWJPL85HESQMgec1da
 DH2eFPUWnMbEqcd/wkqf+HE2QRFYX+/PwYwZbmRFfCY32DbEAUSEuwqNCouYIQUh3BwI
 I48+4pFRL5mCPRiHQOONwNcibMLb+kiXHEi2hwhxZ+bIxc/PVt1RE3VbfqdX7hdfMJpz
 Qmmg==
X-Gm-Message-State: APjAAAVazgFW1sWbYun37PHKnhGulrwOfzV1edjWp8E/RRkhA3H8R69M
 ICl2vYzEMRGO3bINQMoEqyY9aQ==
X-Google-Smtp-Source: APXvYqxVh+LaPVNZqFbh/L5PbBbUp7MBbTXMew0Efhdsub/O2ii/gQ34TzO9KcFCSSknIunqMeucrw==
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr16489571wme.31.1560785634770; 
 Mon, 17 Jun 2019 08:33:54 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id t198sm18650719wmt.2.2019.06.17.08.33.53
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 08:33:54 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190531154735.20809-1-philmd@redhat.com>
 <20190531154735.20809-2-philmd@redhat.com> <878su09r38.fsf@zen.linaroharston>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ff40b72b-3dc3-2d34-e5e4-5d110247c620@redhat.com>
Date: Mon, 17 Jun 2019 17:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <878su09r38.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [RFC PATCH 1/2] target/arm: Add stubs to build
 with CONFIG_SEMIHOSTING disabled
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/19 5:19 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> If a distribution wants to build QEMU without semihosting support,
>> it currently gets this build failure:
>>
>>   $ ./configure --target-list=aarch64-softmmu --without-default-devices
>>   $ sed -i s/CONFIG_SEMIHOSTING=y/CONFIG_SEMIHOSTING=n/default-configs/arm-softmmu.mak
> 
> I'm still not convinced we should be adding support for stuff being done
> outside the normal build process...

If the "KVM/TCG split" series is accepted, then we can add a
--disable-tcg job in the list of "normal builds" and we don't need this
particular patch.

> that said...
> 
>>   $ make subdir-aarch64-softmmu
>>   [...]
>>     LINK    aarch64-softmmu/qemu-system-aarch64
>>   /usr/bin/ld: target/arm/arm-semi.o: in function `do_arm_semihosting':
>>   ./target/arm/arm-semi.c:321: undefined reference to `qemu_semihosting_console_out'
>>   /usr/bin/ld: ./target/arm/arm-semi.c:318: undefined reference to `qemu_semihosting_console_out'
>>   collect2: error: ld returned 1 exit status
>>   make[1]: *** [Makefile:204: qemu-system-aarch64] Error 1
>>   make: *** [Makefile:472: subdir-aarch64-softmmu] Error 2
>>
>> Fix it by providing a stub when semihosting is disabled.
>>
>> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  target/arm/Makefile.objs    |  3 ++-
>>  target/arm/arm-semi-stubs.c | 21 +++++++++++++++++++++
>>  2 files changed, 23 insertions(+), 1 deletion(-)
>>  create mode 100644 target/arm/arm-semi-stubs.c
>>
>> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
>> index 6bdcc65c2c..39b02b1fa4 100644
>> --- a/target/arm/Makefile.objs
>> +++ b/target/arm/Makefile.objs
>> @@ -1,4 +1,5 @@
>> -obj-y += arm-semi.o
>> +obj-$(CONFIG_SEMIHOSTING) += arm-semi.o
>> +obj-$(call lnot,$(CONFIG_SEMIHOSTING)) += arm-semi-stubs.o
>>  obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o monitor.o
>>  obj-$(CONFIG_KVM) += kvm.o
>>  obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
>> diff --git a/target/arm/arm-semi-stubs.c b/target/arm/arm-semi-stubs.c
>> new file mode 100644
>> index 0000000000..a91ecbd9d5
>> --- /dev/null
>> +++ b/target/arm/arm-semi-stubs.c
>> @@ -0,0 +1,21 @@
>> +/*
>> + *  Arm "Angel" semihosting stubs
>> + *
>> + * Copyright (c) 2019 Red Hat, Inc.
>> + *
>> + * Author:
>> + *   Philippe Mathieu-Daudé <philmd@redhat.com>
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +
>> +target_ulong do_arm_semihosting(CPUARMState *env)
>> +{
>> +    g_assert_not_reached();
>> +}
> 
> Could this not just be added to arm-semi.c in an
> 
>   #ifndef CONFIG_SEMIHOSTING
>   target_ulong do_arm_semihosting(CPUARMState *env)
>   {
>       g_assert_not_reached();
>   }
>   #else
>   ... rest of arm-semi.c....
>   #endif

OK, thanks for your reviews!

Phil.

