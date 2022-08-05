Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E24958AA0A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:20:38 +0200 (CEST)
Received: from localhost ([::1]:54080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvNb-0007Ai-3O
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oJv5J-0008NP-7j
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oJv5F-0006ar-Dw
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659697296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1pWBL6gwR9tBp0wAVJRnJ6+PdeS2pJWp6uiSMPcw7hQ=;
 b=Tc2dGbLDHAR2AwZtQqmoWs4B4/o8EvEihOn/ffNj6WZ/IWA8zYGlqzhSMhCFzaRMCEZ0bq
 k2HHw55N0KwdAopwC/xoslM2oTMUN5piYaLZr861raYXnSV9e3TiFQ8G+NPw4eK2OHE9M1
 P4EgcyICrcyN7J1yIShakrZEzjFTmyk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-M3Y0DtDPMI6HWp--HeqdKQ-1; Fri, 05 Aug 2022 07:01:35 -0400
X-MC-Unique: M3Y0DtDPMI6HWp--HeqdKQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sb17-20020a1709076d9100b00730fe97f897so564986ejc.16
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 04:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=1pWBL6gwR9tBp0wAVJRnJ6+PdeS2pJWp6uiSMPcw7hQ=;
 b=htZAgw06z7FCa/x6XnYKQ5QfDPLS1cKBXNAQHFamXsJVQgf/HOl6HUK6yB9G3FZ6CF
 bVT8N0wYsVaf39Xu+x7qTlnXspDuLucn9LLr7xVwr7S6rcJcyjDs3WgSsqYd4NcEXJQW
 KI6AZcLanYo9j0TheJQaigNVSf4jQAS21lWKJ5+fnTw2+upQuyh8BEsT+AD/waQxMl0b
 dKZKlFyRvOogMzEiB8GHOIKXsPmsgVrUB9R9sTIV/55m8ylKdNS/yCesaj+y0g7ggk0E
 E6FXsy5N7VNWtCunUkbf4O4avTVX0kiYDOV88qW39t3y2h16aWU3WclVpNKUYuarhaNK
 LEMw==
X-Gm-Message-State: ACgBeo3roM2se6jIoVZYczduCNWCLyQna6//iFpKH4Qj8dxMa2uMXpN/
 JlHT4l5jUZcMmZnWwo+Ax6i9xOIrMffUwkmRJH/DiIKC75JKeykQiHDBrCOP7iy4pYzlSb0TSwc
 58ViVKq3icgaQFkY=
X-Received: by 2002:a17:906:fe46:b0:730:ca2b:cb7b with SMTP id
 wz6-20020a170906fe4600b00730ca2bcb7bmr5077723ejb.703.1659697294405; 
 Fri, 05 Aug 2022 04:01:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5OljuxOnvaAr443t5n++G0EqFCWVhrnupFwIyJeExQB0QHlflm8kXOabPpm2ymzAUia3S4mw==
X-Received: by 2002:a17:906:fe46:b0:730:ca2b:cb7b with SMTP id
 wz6-20020a170906fe4600b00730ca2bcb7bmr5077703ejb.703.1659697294153; 
 Fri, 05 Aug 2022 04:01:34 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906210900b0072aa009aa68sm1490251ejt.36.2022.08.05.04.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 04:01:29 -0700 (PDT)
Message-ID: <527ba77a-78e8-29aa-9ba6-9ce28e3dd2bb@redhat.com>
Date: Fri, 5 Aug 2022 13:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RFC 3/7] util: Introduce ThreadContext user-creatable
 object
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220721120732.118133-1-david@redhat.com>
 <20220721120732.118133-4-david@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220721120732.118133-4-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/22 14:07, David Hildenbrand wrote:
> Setting the CPU affinity of QEMU threads is a bit problematic, because
> QEMU doesn't always have permissions to set the CPU affinity itself,
> for example, with seccomp after initialized by QEMU:
>     -sandbox enable=on,resourcecontrol=deny
> 
> While upper layers are already aware how to handl;e CPU affinities for
> long-lived threads like iothreads or vcpu threads, especially short-lived
> threads, as used for memory-backend preallocation, are more involved to
> handle. These threads are created on demand and upper layers are not even
> able to identify and configure them.
> 
> Introduce the concept of a ThreadContext, that is essentially a thread
> used for creating new threads. All threads created via that context
> thread inherit the configured CPU affinity. Consequently, it's
> sufficient to create a ThreadContext and configure it once, and have all
> threads created via that ThreadContext inherit the same CPU affinity.
> 
> The CPU affinity of a ThreadContext can be configured two ways:
> 
> (1) Obtaining the thread id via the "thread-id" property and setting the
>     CPU affinity manually.
> 
> (2) Setting the "cpu-affinity" property and letting QEMU try set the
>     CPU affinity itself. This will fail if QEMU doesn't have permissions
>     to do so anymore after seccomp was initialized.
> 
> A ThreadContext can be reused, simply be reconfiguring the CPU affinity.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/qemu/thread-context.h |  58 +++++++
>  qapi/qom.json                 |  16 ++
>  util/meson.build              |   1 +
>  util/oslib-posix.c            |   1 +
>  util/thread-context.c         | 279 ++++++++++++++++++++++++++++++++++
>  5 files changed, 355 insertions(+)
>  create mode 100644 include/qemu/thread-context.h
>  create mode 100644 util/thread-context.c
> 
> diff --git a/include/qemu/thread-context.h b/include/qemu/thread-context.h
> new file mode 100644
> index 0000000000..c799cbe7a1
> --- /dev/null
> +++ b/include/qemu/thread-context.h
> @@ -0,0 +1,58 @@
> +/*
> + * QEMU Thread Context
> + *
> + * Copyright Red Hat Inc., 2022
> + *
> + * Authors:
> + *  David Hildenbrand <david@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef SYSEMU_THREAD_CONTEXT_H
> +#define SYSEMU_THREAD_CONTEXT_H
> +
> +#include "qapi/qapi-types-machine.h"
> +#include "qemu/thread.h"
> +#include "qom/object.h"
> +
> +#define TYPE_THREAD_CONTEXT "thread-context"
> +OBJECT_DECLARE_TYPE(ThreadContext, ThreadContextClass,
> +                    THREAD_CONTEXT)
> +
> +struct ThreadContextClass {
> +    ObjectClass parent_class;
> +};
> +
> +struct ThreadContext {
> +    /* private */
> +    Object parent;
> +
> +    /* private */
> +    unsigned int thread_id;
> +    QemuThread thread;
> +
> +    /* Semaphore to wait for context thread action. */
> +    QemuSemaphore sem;
> +    /* Semaphore to wait for action in context thread. */
> +    QemuSemaphore sem_thread;
> +    /* Mutex to synchronize requests. */
> +    QemuMutex mutex;
> +
> +    /* Commands for the thread to execute. */
> +    int thread_cmd;
> +    void *thread_cmd_data;
> +
> +    /* CPU affinity bitmap used for initialization. */
> +    unsigned long *init_cpu_bitmap;
> +    int init_cpu_nbits;
> +};
> +
> +void thread_context_create_thread(ThreadContext *tc, QemuThread *thread,
> +                                  const char *name,
> +                                  void *(*start_routine)(void *), void *arg,
> +                                  int mode);
> +
> +#endif /* SYSEMU_THREAD_CONTEXT_H */
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 80dd419b39..4775a333ed 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -830,6 +830,20 @@
>              'reduced-phys-bits': 'uint32',
>              '*kernel-hashes': 'bool' } }
>  
> +##
> +# @ThreadContextProperties:
> +#
> +# Properties for thread context objects.
> +#
> +# @cpu-affinity: the CPU affinity for all threads created in the thread
> +#                context (default: QEMU main thread affinity)
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'ThreadContextProperties',
> +  'data': { '*cpu-affinity': ['uint16'] } }
> +
> +
>  ##
>  # @ObjectType:
>  #
> @@ -882,6 +896,7 @@
>      { 'name': 'secret_keyring',
>        'if': 'CONFIG_SECRET_KEYRING' },
>      'sev-guest',
> +    'thread-context',
>      's390-pv-guest',
>      'throttle-group',
>      'tls-creds-anon',
> @@ -948,6 +963,7 @@
>        'secret_keyring':             { 'type': 'SecretKeyringProperties',
>                                        'if': 'CONFIG_SECRET_KEYRING' },
>        'sev-guest':                  'SevGuestProperties',
> +      'thread-context':             'ThreadContextProperties',
>        'throttle-group':             'ThrottleGroupProperties',
>        'tls-creds-anon':             'TlsCredsAnonProperties',
>        'tls-creds-psk':              'TlsCredsPskProperties',
> diff --git a/util/meson.build b/util/meson.build
> index 5e282130df..e97cd2d779 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -1,4 +1,5 @@
>  util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
> +util_ss.add(files('thread-context.c'))
>  if not config_host_data.get('CONFIG_ATOMIC64')
>    util_ss.add(files('atomic64.c'))
>  endif
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 75e8cdcf3e..fa66f73bf8 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -42,6 +42,7 @@
>  #include "qemu/cutils.h"
>  #include "qemu/compiler.h"
>  #include "qemu/units.h"
> +#include "qemu/thread-context.h"
>  
>  #ifdef CONFIG_LINUX
>  #include <sys/syscall.h>
> diff --git a/util/thread-context.c b/util/thread-context.c
> new file mode 100644
> index 0000000000..dcd607c532
> --- /dev/null
> +++ b/util/thread-context.c
> @@ -0,0 +1,279 @@
> +/*
> + * QEMU Thread Context
> + *
> + * Copyright Red Hat Inc., 2022
> + *
> + * Authors:
> + *  David Hildenbrand <david@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/thread-context.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-builtin-visit.h"
> +#include "qapi/visitor.h"
> +#include "qemu/config-file.h"
> +#include "qapi/qapi-builtin-visit.h"
> +#include "qom/object_interfaces.h"
> +#include "qemu/module.h"
> +#include "qemu/bitmap.h"
> +
> +enum {
> +    TC_CMD_NONE = 0,
> +    TC_CMD_STOP,
> +    TC_CMD_NEW,
> +};
> +
> +typedef struct ThreadContextCmdNew {
> +    QemuThread *thread;
> +    const char *name;
> +    void *(*start_routine)(void *);
> +    void *arg;
> +    int mode;
> +} ThreadContextCmdNew;
> +
> +static void *thread_context_run(void *opaque)
> +{
> +    ThreadContext *tc = opaque;
> +
> +    tc->thread_id = qemu_get_thread_id();
> +    qemu_sem_post(&tc->sem);
> +
> +    while (true) {
> +        /*
> +         * Threads inherit the CPU affinity of the creating thread. For this
> +         * reason, we create new (especially short-lived) threads from our
> +         * persistent context thread.
> +         *
> +         * Especially when QEMU is not allowed to set the affinity itself,
> +         * management tools can simply set the affinity of the context thread
> +         * after creating the context, to have new threads created via
> +         * the context inherit the CPU affinity automatically.
> +         */
> +        switch (tc->thread_cmd) {
> +        case TC_CMD_NONE:
> +            break;
> +        case TC_CMD_STOP:
> +            tc->thread_cmd = TC_CMD_NONE;
> +            qemu_sem_post(&tc->sem);
> +            return NULL;
> +        case TC_CMD_NEW: {
> +            ThreadContextCmdNew *cmd_new = tc->thread_cmd_data;
> +
> +            qemu_thread_create(cmd_new->thread, cmd_new->name,
> +                               cmd_new->start_routine, cmd_new->arg,
> +                               cmd_new->mode);
> +            tc->thread_cmd = TC_CMD_NONE;
> +            tc->thread_cmd_data = NULL;
> +            qemu_sem_post(&tc->sem);
> +            break;
> +        }
> +        default:
> +            g_assert_not_reached();
> +        }
> +        qemu_sem_wait(&tc->sem_thread);
> +    }
> +}
> +
> +static void thread_context_set_cpu_affinity(Object *obj, Visitor *v,
> +                                            const char *name, void *opaque,
> +                                            Error **errp)
> +{
> +    ThreadContext *tc = THREAD_CONTEXT(obj);
> +    uint16List *l, *host_cpus = NULL;
> +    unsigned long *bitmap = NULL;
> +    int nbits = 0, ret;
> +    Error *err = NULL;
> +
> +    visit_type_uint16List(v, name, &host_cpus, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    if (!host_cpus) {
> +        error_setg(errp, "CPU list is empty");
> +        goto out;
> +    }
> +
> +    for (l = host_cpus; l; l = l->next) {
> +        nbits = MAX(nbits, l->value + 1);
> +    }
> +    bitmap = bitmap_new(nbits);
> +    for (l = host_cpus; l; l = l->next) {
> +        set_bit(l->value, bitmap);
> +    }
> +
> +    if (tc->thread_id != -1) {
> +        /*
> +         * Note: we won't be adjusting the affinity of any thread that is still
> +         * around, but only the affinity of the context thread.
> +         */
> +        ret = qemu_thread_set_affinity(&tc->thread, bitmap, nbits);
> +        if (ret) {
> +            error_setg(errp, "Setting CPU affinity failed: %s", strerror(ret));
> +        }
> +    } else {
> +        tc->init_cpu_bitmap = bitmap;
> +        bitmap = NULL;
> +        tc->init_cpu_nbits = nbits;
> +    }
> +out:
> +    g_free(bitmap);
> +    qapi_free_uint16List(host_cpus);
> +}
> +
> +static void thread_context_get_cpu_affinity(Object *obj, Visitor *v,
> +                                            const char *name, void *opaque,
> +                                            Error **errp)
> +{
> +    unsigned long *bitmap, nbits, value;
> +    ThreadContext *tc = THREAD_CONTEXT(obj);
> +    uint16List *host_cpus = NULL;
> +    uint16List **tail = &host_cpus;
> +    int ret;
> +
> +    if (tc->thread_id == -1) {
> +        error_setg(errp, "Object not initialized yet");
> +        return;
> +    }
> +
> +    ret = qemu_thread_get_affinity(&tc->thread, &bitmap, &nbits);
> +    if (ret) {
> +        error_setg(errp, "Getting CPU affinity failed: %s", strerror(ret));
> +        return;
> +    }
> +
> +    value = find_first_bit(bitmap, nbits);
> +    while (value < nbits) {
> +        QAPI_LIST_APPEND(tail, value);
> +
> +        value = find_next_bit(bitmap, nbits, value + 1);
> +    }
> +    g_free(bitmap);
> +
> +    visit_type_uint16List(v, name, &host_cpus, errp);
> +    qapi_free_uint16List(host_cpus);
> +}
> +
> +static void thread_context_get_thread_id(Object *obj, Visitor *v,
> +                                         const char *name, void *opaque,
> +                                         Error **errp)
> +{
> +    ThreadContext *tc = THREAD_CONTEXT(obj);
> +    uint64_t value = tc->thread_id;
> +
> +    visit_type_uint64(v, name, &value, errp);
> +}
> +
> +static void thread_context_instance_complete(UserCreatable *uc, Error **errp)
> +{
> +    ThreadContext *tc = THREAD_CONTEXT(uc);
> +    char *thread_name;
> +    int ret;
> +
> +    thread_name = g_strdup_printf("TC %s",
> +                               object_get_canonical_path_component(OBJECT(uc)));
> +    qemu_thread_create(&tc->thread, thread_name, thread_context_run, tc,
> +                       QEMU_THREAD_JOINABLE);


This ^^^^ (see my comment to 7/7)

> +    g_free(thread_name);
> +
> +    /* Wait until initialization of the thread is done. */
> +    while (tc->thread_id == -1) {
> +        qemu_sem_wait(&tc->sem);
> +    }
> +
> +    if (tc->init_cpu_bitmap) {
> +        ret = qemu_thread_set_affinity(&tc->thread, tc->init_cpu_bitmap,
> +                                       tc->init_cpu_nbits);
> +        if (ret) {
> +            error_setg(errp, "Setting CPU affinity failed: %s", strerror(ret));
> +        }
> +        g_free(tc->init_cpu_bitmap);
> +        tc->init_cpu_bitmap = NULL;
> +    }
> +}

Michal


