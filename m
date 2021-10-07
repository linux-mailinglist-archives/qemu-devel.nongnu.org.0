Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAA94259A3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:38:47 +0200 (CEST)
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXLy-0005n8-Gu
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYX27-00083A-0J
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:18:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYX21-0006Fq-Km
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633627088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbsrIrP94uMZOldrtrZ79yVQv4OvBHJ9iPBTzJB4K/c=;
 b=fLFJOYBObF2/VG5yJkxZCiV+b9MBx0+UcsL/WWUWgjo3lft54RMhfew1jcFRWUBAnhqB2p
 cQwKgll3XMkhWfeBZYwT2wSZ5QqvAoFdEDgRWZo8QndqqPPxbzoM55vBu4qq/Gbo3DF1SA
 +ECWOZZNIjs48ysNoADoMubdtT8vncA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-1i-kT0oJPJetylvfXuApLA-1; Thu, 07 Oct 2021 13:18:07 -0400
X-MC-Unique: 1i-kT0oJPJetylvfXuApLA-1
Received: by mail-wr1-f72.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so5240097wrg.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MbsrIrP94uMZOldrtrZ79yVQv4OvBHJ9iPBTzJB4K/c=;
 b=Qjy48cW+f1PcQEQBxQXmbbgYNQ1eD6j6dQUlPFoTkJZSUiNLMplwq7CB5SsCYjU0fK
 eWvqCJPqU7NmpM7v1jvxwgVH5LHQED6EcJeRPERicVIALZD9HM7puhyma5izXRaZF3a2
 +WfAhFDPPGlNv8ODnH0xTr6VNjZogkOP9LJ79rVKBc88vGs6V/mSEFIdDQ2uWJF5I6yP
 WzEz5PabHfdJ+RtiWdslCR8S/ZJh6ELhQVm8qnIMqHIqMd8+8EiQXjpPJD1edhpIW9df
 D+hzpErWjR7L9P48yedXOl2tWbSX7X73VdvqFvHwViXHQ7geRIBqTqsTQ4IUwGzLmgA9
 XaSw==
X-Gm-Message-State: AOAM533fvUFguLlZaynoHVNZyb6Qh38suVx97yC2AQvHtuw7abdBXlgk
 GlyqOJOndK1xl1o6yPN8GeV4vbdO06D0C3oVk6pw+O4iRor7Y+bc/zmDwIygoILiZ1q0CC8r161
 h6tTLxTfs61afU3Q=
X-Received: by 2002:adf:a190:: with SMTP id u16mr6929341wru.114.1633627086580; 
 Thu, 07 Oct 2021 10:18:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7xEE3cTlJ3IDq18XapggwQJqgO4jE2PHvJpwaf/AuDBn/WAl0wR2VfNC+ol+BqIv9/PLpXQ==
X-Received: by 2002:adf:a190:: with SMTP id u16mr6929307wru.114.1633627086331; 
 Thu, 07 Oct 2021 10:18:06 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l2sm9310004wmi.1.2021.10.07.10.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 10:18:05 -0700 (PDT)
Message-ID: <6080fa16-66aa-570e-93c8-09be2ced9431@redhat.com>
Date: Thu, 7 Oct 2021 19:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 16/23] target/i386/sev: Remove stubs by using code
 elision
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
 <20211007161716.453984-17-philmd@redhat.com> <YV8pS2D8e14qmFBq@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YV8pS2D8e14qmFBq@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 19:07, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
>> Only declare sev_enabled() and sev_es_enabled() when CONFIG_SEV is
>> set, to allow the compiler to elide unused code. Remove unnecessary
>> stubs.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> What makes it allowed to *rely* on the compiler eliding calls?

I am not aware of a particular requirement on the compiler for code
elision, however we already use this syntax:

$ git grep -A4 'ifdef CONFIG_' include/sysemu/
...
include/sysemu/tcg.h:11:#ifdef CONFIG_TCG
include/sysemu/tcg.h-12-extern bool tcg_allowed;
include/sysemu/tcg.h-13-#define tcg_enabled() (tcg_allowed)
include/sysemu/tcg.h-14-#else
include/sysemu/tcg.h-15-#define tcg_enabled() 0
...

Cc'ing Richard/Eric/Daniel who have more experience with compiler
features in case they can enlighten me here.

>> ---
>>  target/i386/sev.h       | 14 ++++++++++++--
>>  target/i386/cpu.c       | 13 +++++++------
>>  target/i386/sev-stub.c  | 41 -----------------------------------------
>>  target/i386/meson.build |  2 +-
>>  4 files changed, 20 insertions(+), 50 deletions(-)
>>  delete mode 100644 target/i386/sev-stub.c
>>
>> diff --git a/target/i386/sev.h b/target/i386/sev.h
>> index c96072bf78d..d9548e3e642 100644
>> --- a/target/i386/sev.h
>> +++ b/target/i386/sev.h
>> @@ -14,6 +14,10 @@
>>  #ifndef QEMU_SEV_I386_H
>>  #define QEMU_SEV_I386_H
>>  
>> +#ifndef CONFIG_USER_ONLY
>> +#include CONFIG_DEVICES /* CONFIG_SEV */
>> +#endif
>> +
>>  #include "exec/confidential-guest-support.h"
>>  #include "qapi/qapi-types-misc-target.h"
>>  
>> @@ -35,8 +39,14 @@ typedef struct SevKernelLoaderContext {
>>      size_t cmdline_size;
>>  } SevKernelLoaderContext;
>>  
>> -bool sev_enabled(void);
>> -extern bool sev_es_enabled(void);
>> +#ifdef CONFIG_SEV
>> + bool sev_enabled(void);
>> +bool sev_es_enabled(void);
>> +#else
>> +#define sev_enabled() 0
>> +#define sev_es_enabled() 0
>> +#endif
>> +
>>  extern SevInfo *sev_get_info(void);
>>  extern uint32_t sev_get_cbit_position(void);
>>  extern uint32_t sev_get_reduced_phys_bits(void);
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 8289dc87bd5..fc3ed80ef1e 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -5764,12 +5764,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>          *edx = 0;
>>          break;
>>      case 0x8000001F:
>> -        *eax = sev_enabled() ? 0x2 : 0;
>> -        *eax |= sev_es_enabled() ? 0x8 : 0;
>> -        *ebx = sev_get_cbit_position();
>> -        *ebx |= sev_get_reduced_phys_bits() << 6;
>> -        *ecx = 0;
>> -        *edx = 0;
>> +        *eax = *ebx = *ecx = *edx = 0;
>> +        if (sev_enabled()) {
>> +            *eax = 0x2;
>> +            *eax |= sev_es_enabled() ? 0x8 : 0;
>> +            *ebx = sev_get_cbit_position();
>> +            *ebx |= sev_get_reduced_phys_bits() << 6;
>> +        }
>>          break;
>>      default:
>>          /* reserved values: zero */
>> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
>> deleted file mode 100644
>> index 7e8b6f9a259..00000000000
>> --- a/target/i386/sev-stub.c
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -/*
>> - * QEMU SEV stub
>> - *
>> - * Copyright Advanced Micro Devices 2018
>> - *
>> - * Authors:
>> - *      Brijesh Singh <brijesh.singh@amd.com>
>> - *
>> - * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> - * See the COPYING file in the top-level directory.
>> - *
>> - */
>> -
>> -#include "qemu/osdep.h"
>> -#include "qapi/error.h"
>> -#include "sev.h"
>> -
>> -bool sev_enabled(void)
>> -{
>> -    return false;
>> -}
>> -
>> -uint32_t sev_get_cbit_position(void)
>> -{
>> -    return 0;
>> -}
>> -
>> -uint32_t sev_get_reduced_phys_bits(void)
>> -{
>> -    return 0;
>> -}
>> -
>> -bool sev_es_enabled(void)
>> -{
>> -    return false;
>> -}
>> -
>> -bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>> -{
>> -    g_assert_not_reached();
>> -}
>> diff --git a/target/i386/meson.build b/target/i386/meson.build
>> index a4f45c3ec1d..ae38dc95635 100644
>> --- a/target/i386/meson.build
>> +++ b/target/i386/meson.build
>> @@ -6,7 +6,7 @@
>>    'xsave_helper.c',
>>    'cpu-dump.c',
>>  ))
>> -i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'), if_false: files('sev-stub.c'))
>> +i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'))
>>  
>>  # x86 cpu type
>>  i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
>> -- 
>> 2.31.1
>>


