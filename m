Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA72CF548
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:09:15 +0100 (CET)
Received: from localhost ([::1]:60080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHOD-0004N5-Ss
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klEe7-0007g8-Av
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:13:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klEcE-0007Dy-2f
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nol/PJZ8RZ1dFkx9yKoV117toj6eOK19IWkyFFf+Alo=;
 b=cCG20AjYtrrNJq734aii5Euyp6HEEoph0kZ4RhipXtM0LSJ8Ftpq4yEbIyJTnZRN6MZCZ2
 Qu/TexN71Dt34R67MCCJYMCk+zvtIAh4hMN4q8kMsssrC6gzvfDhNN+IfcRBTAvdhVvW0m
 +EZD5qOZZj6WPHMxbb8rzUEv2Ni9Dps=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-YPViRP5AMGG_sUgxlKDSzw-1; Fri, 04 Dec 2020 12:10:54 -0500
X-MC-Unique: YPViRP5AMGG_sUgxlKDSzw-1
Received: by mail-ej1-f69.google.com with SMTP id z10so2305754eje.5
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 09:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nol/PJZ8RZ1dFkx9yKoV117toj6eOK19IWkyFFf+Alo=;
 b=juW5KDK8rw3tZtTZHgHkw1Fy9zLBznVupfklwme5AUSb0fDhaD+L30XzM/Q9xddGMR
 5z2JxCElYq29CdStESOjxAiHaAAId93Uc2LzeZQqSbEwJ4XQ+fVPfcqnFPWHH9J4ETAP
 QsTrwfXq6edvIVPe5gRs1TYWtEvIHo5DsLd3Vx73KKrrcZl+nvCIc9VPc0Q3ezd/eyVx
 XSkVWJtTmeb6RGQvAT01TKcSyc/T8EnFP6j1W9JDEqSKIg2NpoemjvfpqG41//dwrdkX
 RI7JMgf+gCeYhkOMve+y0PJVBv+1fGdS2eiiJ8b1SMqQgA+gjJ7V8tYf1AHzWbQDU3Sh
 bTvg==
X-Gm-Message-State: AOAM531i3cS64Z/r1tJNj7Omn+nrDnzHWdaJUJ7UvdELSIzo5KKMDEah
 4qD0WF9BwJITG9ZpKXR+D5pJvuOLIiySTT/k7SNEyXLEBPgxk1H3HKq0/93b1di6WsmtB4qSE53
 sI1A647zpqW1SueI=
X-Received: by 2002:a05:6402:202e:: with SMTP id
 ay14mr8833462edb.102.1607101852970; 
 Fri, 04 Dec 2020 09:10:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws536cqlBbuuQ6E2UqmCzujewbu0GuSsOq8vIR5PaNSke+Km2fnG3mtybSDcLk/HIGjIQ4rw==
X-Received: by 2002:a05:6402:202e:: with SMTP id
 ay14mr8833415edb.102.1607101852714; 
 Fri, 04 Dec 2020 09:10:52 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id mb15sm3468416ejb.9.2020.12.04.09.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 09:10:51 -0800 (PST)
Subject: Re: [RFC v7 12/22] cpu: Introduce TCGCpuOperations struct
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201130023535.16689-1-cfontana@suse.de>
 <20201130023535.16689-13-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fb02985a-010f-5a68-7444-b214e97f9050@redhat.com>
Date: Fri, 4 Dec 2020 18:10:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130023535.16689-13-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 3:35 AM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> The TCG-specific CPU methods will be moved to a separate struct,
> to make it easier to move accel-specific code outside generic CPU
> code in the future.  Start by moving tcg_initialize().

Good idea! One minor comment below.

> 
> The new CPUClass.tcg_opts field may eventually become a pointer,
> but keep it an embedded struct for now, to make code conversion
> easier.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  MAINTAINERS                     |  1 +
>  cpu.c                           |  2 +-
>  include/hw/core/cpu.h           |  9 ++++++++-
>  include/hw/core/tcg-cpu-ops.h   | 25 +++++++++++++++++++++++++
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  2 +-
>  target/avr/cpu.c                |  2 +-
>  target/cris/cpu.c               | 12 ++++++------
>  target/hppa/cpu.c               |  2 +-
>  target/i386/tcg-cpu.c           |  2 +-
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  2 +-
>  target/moxie/cpu.c              |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/ppc/translate_init.c.inc |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/tricore/cpu.c            |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  27 files changed, 63 insertions(+), 30 deletions(-)
>  create mode 100644 include/hw/core/tcg-cpu-ops.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53f2678d8..d876f504a6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1535,6 +1535,7 @@ F: qapi/machine.json
>  F: qapi/machine-target.json
>  F: include/hw/boards.h
>  F: include/hw/core/cpu.h
> +F: include/hw/core/tcg-cpu-ops.h
>  F: include/hw/cpu/cluster.h
>  F: include/sysemu/numa.h
>  T: git https://github.com/ehabkost/qemu.git machine-next
> diff --git a/cpu.c b/cpu.c
> index 0be5dcb6f3..d02c2a17f1 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -180,7 +180,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>  
>      if (tcg_enabled() && !tcg_target_initialized) {
>          tcg_target_initialized = true;
> -        cc->tcg_initialize();
> +        cc->tcg_ops.initialize();
>      }
>      tlb_init(cpu);
>  
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 3d92c967ff..c93b08a0fb 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -76,6 +76,10 @@ typedef struct CPUWatchpoint CPUWatchpoint;
>  
>  struct TranslationBlock;
>  
> +#ifdef CONFIG_TCG
> +#include "tcg-cpu-ops.h"
> +#endif /* CONFIG_TCG */
> +
>  /**
>   * CPUClass:
>   * @class_by_name: Callback to map -cpu command line model name to an
> @@ -221,12 +225,15 @@ struct CPUClass {
>  
>      void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
>      vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
> -    void (*tcg_initialize)(void);
>  
>      const char *deprecation_note;
>      /* Keep non-pointer data at the end to minimize holes.  */
>      int gdb_num_core_regs;
>      bool gdb_stop_before_watchpoint;
> +
> +#ifdef CONFIG_TCG
> +    TcgCpuOperations tcg_ops;
> +#endif /* CONFIG_TCG */
>  };
>  
>  /*
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> new file mode 100644
> index 0000000000..4475ef0996
> --- /dev/null
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -0,0 +1,25 @@
> +/*
> + * TCG-Specific operations that are not meaningful for hardware accelerators
> + *
> + * Copyright 2020 SUSE LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef TCG_CPU_OPS_H
> +#define TCG_CPU_OPS_H
> +
> +/**
> + * struct TcgCpuOperations: TCG operations specific to a CPU class
> + */
> +typedef struct TcgCpuOperations {
> +    /**
> +     * @initialize: Initalize TCG state
> +     *
> +     * Called when the first CPU is realized.
> +     */
> +    void (*initialize)(void);
> +} TcgCpuOperations;
> +
> +#endif /* TCG_CPU_OPS_H */
...

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 07492e9f9a..1fa9382a7c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2261,7 +2261,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_stop_before_watchpoint = true;
>      cc->disas_set_info = arm_disas_set_info;
>  #ifdef CONFIG_TCG
> -    cc->tcg_initialize = arm_translate_init;
> +    cc->tcg_ops.initialize = arm_translate_init;

This one is correctly guarded by '#ifdef CONFIG_TCG'.

For the other targets, can you either place it within
the '#ifdef CONFIG_TCG' block or if there is none, add
one please?

With that change:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks,

Phil.


