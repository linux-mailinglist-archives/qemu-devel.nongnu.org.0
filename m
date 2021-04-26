Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E31836B530
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 16:45:08 +0200 (CEST)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb2Tz-0002bG-9I
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 10:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb2RC-0001LV-OQ
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:42:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb2R6-00020R-Cn
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619448127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjCLFaoPj68Dll3pSEV3O69FkXwHVmsC9yR7/9OIEko=;
 b=SY7VMH9msHnDswZEY0eWsNCRMcDKsNqC6ZPaq3wW7QDYZYcc+bidMtRgYo7Q77GfhIMmZK
 fiFuYvUq/AoD+TwTs45aJRkMefLmXusCOFxwt6WVALo8lvRQtsuE/+7jiquIFV9dl2w6Cy
 DS4ZNprfN0i1GX9dw8l92lAq2tm70hU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-RyYTm2_9OlOjnsW8Cr4grA-1; Mon, 26 Apr 2021 10:42:05 -0400
X-MC-Unique: RyYTm2_9OlOjnsW8Cr4grA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j6-20020a05600c1906b029014119fce11cso399025wmq.6
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 07:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GjCLFaoPj68Dll3pSEV3O69FkXwHVmsC9yR7/9OIEko=;
 b=uT1IBF/ZTeutKCU2alYejKZJGJDwfWTKzfyUq07IFfwPT3Fu0doZejLAz5J53LTTQv
 qgM4uk2XKHgDQWLfKr84UpwAh3Qh7Ngt8wTC4Z+vIYSsq8hKOklf57fwE/xWSUtMDBbZ
 9DiOGDzAQlvgL3BQLYJ8bY9cLh4z3mn47xvWHcUGngKEwUCXrJGxX5OsYcdyjVt5w4rP
 xs6UkB0Hclr14UtWEii1sm4pZFmSXmBAaCbTtCMvWehByyYBKg3nR6F86+lf0aHZpRZm
 i4w+qGg/8t+c/UxNMzuWUyN9bRAC2WbVXbdkpq/n3GnjQrct5IVKfHsUIBalD3xI2G4x
 xQ4Q==
X-Gm-Message-State: AOAM533PemAoWdLyge4JERdiZrb32Afl8eG4xpiXnThfyjsv3GlrbtPe
 6F4gIAwJrLvBLSROR7Ue2g4zw5fH5PE0JDKBkbaXfQUT+BAycJqaDaAk3sLwZFJH45NyGOmvleA
 GVkvfg0i1Ac+cTGk=
X-Received: by 2002:a7b:c316:: with SMTP id k22mr21183260wmj.176.1619448124008; 
 Mon, 26 Apr 2021 07:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGGlhavvAGxWjJ0GVxasVwgU25EUIowzB0Bj8hBT6Sw7ufJZFDbG2kTt7jSNKxbxx31dWxYw==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr21183240wmj.176.1619448123752; 
 Mon, 26 Apr 2021 07:42:03 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d22sm300279wrc.50.2021.04.26.07.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 07:42:02 -0700 (PDT)
Subject: Re: [PULL 46/46] accel: introduce AccelCPUClass extending CPUClass
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
 <20210205225650.1330794-47-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bea9d44c-7fed-57ee-a5dc-0bb5b243cef6@redhat.com>
Date: Mon, 26 Apr 2021 16:42:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210205225650.1330794-47-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Claudio,

+Eduardo/Paolo

On 2/5/21 11:56 PM, Richard Henderson wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> add a new optional interface to CPUClass, which allows accelerators
> to extend the CPUClass with additional accelerator-specific
> initializations.
> 
> This will allow to separate the target cpu code that is specific
> to each accelerator, and register it automatically with object
> hierarchy lookup depending on accelerator code availability,
> as part of the accel_init_interfaces() initialization step.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Message-Id: <20210204163931.7358-19-cfontana@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/accel-cpu.h | 38 ++++++++++++++++++++++++++++++++
>  include/hw/core/cpu.h       |  4 ++++
>  accel/accel-common.c        | 44 +++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                 |  1 +
>  4 files changed, 87 insertions(+)
>  create mode 100644 include/hw/core/accel-cpu.h
> 
> diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
> new file mode 100644
> index 0000000000..24a6697412
> --- /dev/null
> +++ b/include/hw/core/accel-cpu.h
> @@ -0,0 +1,38 @@
> +/*
> + * Accelerator interface, specializes CPUClass
> + * This header is used only by target-specific code.
> + *
> + * Copyright 2021 SUSE LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef ACCEL_CPU_H
> +#define ACCEL_CPU_H
> +
> +/*
> + * This header is used to define new accelerator-specific target-specific
> + * accelerator cpu subclasses.
> + * It uses CPU_RESOLVING_TYPE, so this is clearly target-specific.
> + *
> + * Do not try to use for any other purpose than the implementation of new
> + * subclasses in target/, or the accel implementation itself in accel/
> + */
> +
> +#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
> +#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
> +typedef struct AccelCPUClass AccelCPUClass;
> +DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
> +
> +typedef struct AccelCPUClass {
> +    /*< private >*/
> +    ObjectClass parent_class;
> +    /*< public >*/
> +
> +    void (*cpu_class_init)(CPUClass *cc);
> +    void (*cpu_instance_init)(CPUState *cpu);
> +    void (*cpu_realizefn)(CPUState *cpu, Error **errp);

We could use a const pointer to const AccelCPUOps.

> +} AccelCPUClass;
> +
> +#endif /* ACCEL_CPU_H */
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 4f6c6b18c9..38d813c389 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -79,6 +79,9 @@ struct TranslationBlock;
>  /* see tcg-cpu-ops.h */
>  struct TCGCPUOps;
>  
> +/* see accel-cpu.h */
> +struct AccelCPUClass;
> +
>  /**
>   * CPUClass:
>   * @class_by_name: Callback to map -cpu command line model name to an
> @@ -187,6 +190,7 @@ struct CPUClass {
>      /* Keep non-pointer data at the end to minimize holes.  */
>      int gdb_num_core_regs;
>      bool gdb_stop_before_watchpoint;
> +    struct AccelCPUClass *accel_cpu;

(so here AccelCPUOps)

>  
>      /* when TCG is not available, this pointer is NULL */
>      struct TCGCPUOps *tcg_ops;
> diff --git a/accel/accel-common.c b/accel/accel-common.c
> index 6b59873419..9901b0531c 100644
> --- a/accel/accel-common.c
> +++ b/accel/accel-common.c
> @@ -26,6 +26,9 @@
>  #include "qemu/osdep.h"
>  #include "qemu/accel.h"
>  
> +#include "cpu.h"
> +#include "hw/core/accel-cpu.h"
> +
>  #ifndef CONFIG_USER_ONLY
>  #include "accel-softmmu.h"
>  #endif /* !CONFIG_USER_ONLY */
> @@ -46,16 +49,57 @@ AccelClass *accel_find(const char *opt_name)
>      return ac;
>  }
>  
> +static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
> +{
> +    CPUClass *cc = CPU_CLASS(klass);
> +    AccelCPUClass *accel_cpu = opaque;
> +
> +    cc->accel_cpu = accel_cpu;
> +    if (accel_cpu->cpu_class_init) {
> +        accel_cpu->cpu_class_init(cc);
> +    }
> +}
> +
> +/* initialize the arch-specific accel CpuClass interfaces */
> +static void accel_init_cpu_interfaces(AccelClass *ac)
> +{
> +    const char *ac_name; /* AccelClass name */
> +    char *acc_name;      /* AccelCPUClass name */
> +    ObjectClass *acc;    /* AccelCPUClass */
> +
> +    ac_name = object_class_get_name(OBJECT_CLASS(ac));
> +    g_assert(ac_name != NULL);
> +
> +    acc_name = g_strdup_printf("%s-%s", ac_name, CPU_RESOLVING_TYPE);
> +    acc = object_class_by_name(acc_name);
> +    g_free(acc_name);
> +
> +    if (acc) {
> +        object_class_foreach(accel_init_cpu_int_aux,
> +                             CPU_RESOLVING_TYPE, false, acc);
> +    }
> +}
> +
>  void accel_init_interfaces(AccelClass *ac)
>  {
>  #ifndef CONFIG_USER_ONLY
>      accel_init_ops_interfaces(ac);
>  #endif /* !CONFIG_USER_ONLY */
> +
> +    accel_init_cpu_interfaces(ac);
>  }
>  
> +static const TypeInfo accel_cpu_type = {
> +    .name = TYPE_ACCEL_CPU,
> +    .parent = TYPE_OBJECT,
> +    .abstract = true,

I'm not convince the abstract QOM parent has to be
per target. All methods in AccelCPUClass use pointers,
so we should be fine with opaque CPU* pointer declarations,
and have one common type for all targets.

> +    .class_size = sizeof(AccelCPUClass),
> +};
> +
>  static void register_accel_types(void)
>  {
>      type_register_static(&accel_type);
> +    type_register_static(&accel_cpu_type);
>  }


