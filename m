Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DAAE6CA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 17:43:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL8RD-0003Sd-Nj
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 11:43:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hL8Px-0002yD-IZ
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 11:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hL8Pw-0002bn-4A
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 11:42:09 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38772)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hL8Pt-0002Wt-Ry
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 11:42:06 -0400
Received: by mail-wm1-f65.google.com with SMTP id w15so16460332wmc.3
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 08:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PCcbSqu60B+VeGQCFMF10EyMDZqDXtIhESgxPiSvcPM=;
	b=ICsOj23rk85RR5hO4MVHRz5zBVHE9TbICEpazBbSsA7XUtkDNlutqvRSqpV0dqKvMN
	7vFnzXS0MzdnTBgXoBs2CVKX5h5qyZGd5uxPuf4qi6M4ZU1sCwFUNXnNHJqsV9sHC7ul
	uvfP065ch8FnGMJhYj262OTBElvMMlPphgEcY1PAajd3glWtN0SmUpI0NfbTaPOYD4ON
	MMRgQfig/jgpTNoeXKMWGe0po4QIk2NGg//bBADsQIanFhf90cpgOeikabHe9awvQssC
	Oly1NasPq+gQnQQDBBmCDo4ahrk6ES5Dw12wPX1xDUq/8ETns89pWYhhpViTWdQtHroC
	11SA==
X-Gm-Message-State: APjAAAXrq11+c0mpjksOdQWsSL3Omeq8ZwfUmxZXwSqtpAuJOxScavKq
	UUJ1dQlSKIHs9voFvOZCSpjJNA==
X-Google-Smtp-Source: APXvYqwDiPH+wkukAaSUjdgTq7hlAzf5tIkIPyo9EhQUoVjLlAd4Ru2fIwSbikuVmDl4Z7AA7givTw==
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr18728780wmc.117.1556552521661;
	Mon, 29 Apr 2019 08:42:01 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	s145sm1411868wme.38.2019.04.29.08.41.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 08:42:00 -0700 (PDT)
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <20190422195020.1494-1-philmd@redhat.com>
	<20190422195020.1494-4-philmd@redhat.com>
	<0f78535e-e137-67f1-17bd-7a4ca4b03cae@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <193e09a9-da42-1fe1-3ef1-313d6835b66b@redhat.com>
Date: Mon, 29 Apr 2019 17:41:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0f78535e-e137-67f1-17bd-7a4ca4b03cae@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH v3 3/7] hw/i386: Extract fw_cfg definitions
 to local "fw_cfg.h"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laszlo,

On 4/23/19 8:38 PM, Laszlo Ersek wrote:
> On 04/22/19 21:50, Philippe Mathieu-Daudé wrote:
>> Extract the architecture-specific fw_cfg definitions to "fw_cfg.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/i386/fw_cfg.h | 20 ++++++++++++++++++++
>>  hw/i386/pc.c     |  7 +------
>>  2 files changed, 21 insertions(+), 6 deletions(-)
>>  create mode 100644 hw/i386/fw_cfg.h
>>
>> diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
>> new file mode 100644
>> index 00000000000..17a4bc32f22
>> --- /dev/null
>> +++ b/hw/i386/fw_cfg.h
>> @@ -0,0 +1,20 @@
>> +/*
>> + * QEMU fw_cfg helpers (X86 specific)
>> + *
>> + * Copyright (c) 2003-2004 Fabrice Bellard
>> + *
>> + * SPDX-License-Identifier: MIT
>> + */
> 
> (1) This is a new file -- I understand it could be plain code movement,
> but shouldn't you add your (= RH's) copyright notice too (beyond Fabrice's)?

I asked few people on IRC, than googled and finally kept this link
(understable enough for me):
https://en.wikipedia.org/wiki/Derivative_work#When_does_derivative-work_copyright_apply?

  US Copyright Office Circular 14: Derivative Works notes that:

   [...] To be copyrightable, a derivative work must be different
   enough from the original to be regarded as a "new work" or
   must contain a substantial amount of new material. Making minor
   changes or additions of little substance to a preexisting work
   will not qualify the work as a new version for copyright
   purposes. [...]

Since I'm simply moving lines of code with no logical modification, I
understood it is not sufficient to add a new copyright entry...

> (2) I admit I'm confused by the difference between:
> - include/hw/i386/*.h
> - hw/i386/*.h
> 
> One could say that the latter is "internal" (compare e.g.
> "intel_iommu.h" from the former and "intel_iommu_internal.h" from the
> latter) -- but then, as a counter-example, we have *both* "ioapic.h" and
> "ioapic_internal.h" under the former!

There is a slow effort to keep API namespaces as simple/strict as
possible, but the cleaning is taking time :)

- hw/i386/*.h contains declarations used by
  hw/i386/{.,kvm,xen,../hyperv}*.c

- include/hw/i386/*.h contains declaration of X86-specific devices which
  are not located in hw/i386:

  - hw/acpi (this will be cleaned with merging NEMU patches)
  - hw/intc (apic, ioapic)
  - hw/timer (hpet)
  - hw/isa (southbridge, superio)
  - hw/pci-host (northbridge)

I am spending my personal time cleaning this, since it is not a project
priority, so it is taking me a lot.

>> +
>> +#ifndef HW_I386_FW_CFG_H
>> +#define HW_I386_FW_CFG_H
>> +
>> +#include "hw/nvram/fw_cfg.h"
>> +
>> +#define FW_CFG_ACPI_TABLES      (FW_CFG_ARCH_LOCAL + 0)
>> +#define FW_CFG_SMBIOS_ENTRIES   (FW_CFG_ARCH_LOCAL + 1)
>> +#define FW_CFG_IRQ0_OVERRIDE    (FW_CFG_ARCH_LOCAL + 2)
>> +#define FW_CFG_E820_TABLE       (FW_CFG_ARCH_LOCAL + 3)
>> +#define FW_CFG_HPET             (FW_CFG_ARCH_LOCAL + 4)
>> +
>> +#endif
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index f2c15bf1f2c..acb8fd9667d 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -30,6 +30,7 @@
>>  #include "hw/char/parallel.h"
>>  #include "hw/i386/apic.h"
>>  #include "hw/i386/topology.h"
>> +#include "hw/i386/fw_cfg.h"
>>  #include "sysemu/cpus.h"
>>  #include "hw/block/fdc.h"
>>  #include "hw/ide.h"
>> @@ -88,12 +89,6 @@
>>  #define DPRINTF(fmt, ...)
>>  #endif
>>  
>> -#define FW_CFG_ACPI_TABLES (FW_CFG_ARCH_LOCAL + 0)
>> -#define FW_CFG_SMBIOS_ENTRIES (FW_CFG_ARCH_LOCAL + 1)
>> -#define FW_CFG_IRQ0_OVERRIDE (FW_CFG_ARCH_LOCAL + 2)
>> -#define FW_CFG_E820_TABLE (FW_CFG_ARCH_LOCAL + 3)
>> -#define FW_CFG_HPET (FW_CFG_ARCH_LOCAL + 4)
>> -
>>  #define E820_NR_ENTRIES		16
>>  
>>  struct e820_entry {
>>
> 
> I'm not insisting on any particular code changes here, just please
> consider (1) and (2) above in some way. (Stating why the code is fine
> as-is is OK by me too.)
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks!

> 
> Thanks
> Laszlo
> 

