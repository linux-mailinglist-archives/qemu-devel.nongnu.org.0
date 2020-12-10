Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D38B2D5C1F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:42:13 +0100 (CET)
Received: from localhost ([::1]:45110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMCy-0003M5-HB
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLu8-0001t1-F3
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:22:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLu5-0002Hc-Jz
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607606560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4A+pvcMt7vG3r1HHnQCVGwMEkkhlISWiersBkG/4C8=;
 b=MCD1jJZpWkL5tqtTGHzjMpA56ZBAXgPjYPRabURNEuoEGZxmiNs1tDM0uXOAEVUoEAw8MG
 8isHfk4318cKJLJinng94dYcjCjao0NgQfqxaULUdt5ui8LPSihVm+4+dUFr+C1Cm8NRs6
 9iJYL9K7OXFC3KnuISTvcb3IXCBsu/4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-Pq_gMGa2PXKnKKdLRMz8CA-1; Thu, 10 Dec 2020 08:22:36 -0500
X-MC-Unique: Pq_gMGa2PXKnKKdLRMz8CA-1
Received: by mail-wm1-f71.google.com with SMTP id b4so1970301wmj.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 05:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D4A+pvcMt7vG3r1HHnQCVGwMEkkhlISWiersBkG/4C8=;
 b=bWwt5O9Yi7nCOnPwqYdtiTV2CZ75c3P3YnuT1/sWIrHZvrj4bCD0hU50G6g9w+APSY
 /gd7sIMnWH1hDiBUQMIrFVtAxSFAv9hsKuOFZz162toMAfc+WSDgV6AxYRpE3rRPyP+l
 WokfYPCmJ7mMjpsax9v/pf4cPHzC4swlBAqQRE/SkQD9GvapStFDS5YZQq1ZLg/UedCE
 +ohFXvzgh5gK8W7P79+0zzuMVtHV4r6vcNb9I13BGCUxjPdybzaSMw8HbzTJlDavZSFg
 2SLIUIUfTl8tnCZOviHnCJn/CS9Mq3QZV/UbBt0bRQo46waNqZTctDk5y661HNB8S8MH
 N/dA==
X-Gm-Message-State: AOAM532Mf/Srjvv1ZhcmYhuKNyy69yDv3rRp2milFNCU5ODBn89o8JaD
 bZF0VsM1Zjmz/UuumO+flNvdDFm+j/C/6odPX1H6APvdVdJjZ5YsDBmQ6HEUZT9KLhkLfOdh5QR
 Jl84OG3zeEJf+SQo=
X-Received: by 2002:a1c:bc02:: with SMTP id m2mr8137745wmf.59.1607606555361;
 Thu, 10 Dec 2020 05:22:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYvVZ3pUvS5ajsyluaO9o6LY45ROTJKzgnUh1YgPBYeaniWriOPcXnxY30b2vqUn4aaoPYTg==
X-Received: by 2002:a1c:bc02:: with SMTP id m2mr8137703wmf.59.1607606555102;
 Thu, 10 Dec 2020 05:22:35 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id q143sm10081730wme.28.2020.12.10.05.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 05:22:34 -0800 (PST)
Subject: Re: [PATCH v10 24/32] cpu: move cc->transaction_failed to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201210121226.19822-1-cfontana@suse.de>
 <20201210121226.19822-25-cfontana@suse.de>
 <a6f8dc47-1065-e744-4119-3fa67238a687@redhat.com>
 <7e65bd12-4fba-e7c1-87a2-1fa5cdfc0f7b@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a641b4c4-bf8c-95d3-a9c7-3857d5c4fcb3@redhat.com>
Date: Thu, 10 Dec 2020 14:22:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <7e65bd12-4fba-e7c1-87a2-1fa5cdfc0f7b@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 2:10 PM, Claudio Fontana wrote:
> On 12/10/20 1:59 PM, Philippe Mathieu-Daudé wrote:
>> On 12/10/20 1:12 PM, Claudio Fontana wrote:
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  include/hw/core/cpu.h         | 18 +++++++-----------
>>>  include/hw/core/tcg-cpu-ops.h | 10 ++++++++++
>>>  hw/mips/jazz.c                |  9 +++++++--
>>>  target/alpha/cpu.c            |  2 +-
>>>  target/arm/cpu.c              |  4 ++--
>>>  target/m68k/cpu.c             |  2 +-
>>>  target/microblaze/cpu.c       |  2 +-
>>>  target/mips/cpu.c             |  2 +-
>>>  target/riscv/cpu.c            |  2 +-
>>>  target/sparc/cpu.c            |  2 +-
>>>  target/xtensa/cpu.c           |  2 +-
>>>  11 files changed, 33 insertions(+), 22 deletions(-)
>> ...
>>
>>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>>> index a7387b5c39..3cc2733410 100644
>>> --- a/include/hw/core/tcg-cpu-ops.h
>>> +++ b/include/hw/core/tcg-cpu-ops.h
>>> @@ -11,6 +11,7 @@
>>>  #define TCG_CPU_OPS_H
>>>  
>>>  #include "hw/core/cpu.h"
>>> +#include "exec/memattrs.h"
>>>  
>>>  /**
>>>   * struct TcgCpuOperations: TCG operations specific to a CPU class
>>> @@ -41,6 +42,15 @@ typedef struct TcgCpuOperations {
>>>      /** @do_interrupt: Callback for interrupt handling. */
>>>      void (*do_interrupt)(CPUState *cpu);
>>>  
>>
>> Do we want to restrict this handler to system-mode?
> 
> maybe we should check them all... do_interrupt is sometimes also user mode,
> but do_transaction_failed seems to be system only.

Ah, signal handlers maybe.

> 
>>
>> #ifdef CONFIG_SOFTMMU
> 
> This could be either
> 
> #ifndef CONFIG_USER_ONLY
> 
> or
> 
> #ifdef NEED_CPU_H
> #define CONFIG_SOFTMMU

Yes, whatever, this is the same for now ...

> 
> as discussed previously (Richard),
> 
> issue is, in the header files here we tend to see
> 
> #ifdef NEED_CPU_H
> #define CONFIG_SOFTMMU
> 
> while the target/ files we consistently see
> 
> #ifndef CONFIG_USER_ONLY

... until we sanitize it as suggested.

> 
> 
> so this is an inconsistency.
> 
> If you are ok with it I would wrap everywhere consistently with CONFIG_USER_ONLY for now?
> 
> 
>>> +    /**
>>> +     * @do_transaction_failed: Callback for handling failed memory transactions
>>> +     * (ie bus faults or external aborts; not MMU faults)
>>> +     */
>>> +    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
>>> +                                  unsigned size, MMUAccessType access_type,
>>> +                                  int mmu_idx, MemTxAttrs attrs,
>>> +                                  MemTxResult response, uintptr_t retaddr);
>>
>> #endif
>>
>>>      /**
>>>       * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
>>>       *
>> ...
>>
> 


