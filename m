Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABFD4B75F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 13:49:38 +0200 (CEST)
Received: from localhost ([::1]:37114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdZ5t-0002a8-Gl
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 07:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45532)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hdZ3O-0001pi-KG
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 07:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hdZ3K-0007dk-8G
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 07:47:02 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40065)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hdZ3J-0007cD-QC
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 07:46:58 -0400
Received: by mail-wr1-x442.google.com with SMTP id p11so3033247wre.7
 for <qemu-devel@nongnu.org>; Wed, 19 Jun 2019 04:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=vwDr2DqJbe94YtmQR/rER8sZDtRzEzsUjkCGwVg+tJA=;
 b=h/bpGC5Ow8BoWzMVogLMjT8l+RCBDufcV3OwLteznRyLS0kgRqoxp1O8TL5bE19glH
 jdzbjYPkMTIVi9j+Zev/AKSHa29AclWXpwJWh0q5rXRxuix88x2RSGXXS/2IlUAGXzLz
 jGCoUyTJob1MsxWXap5ZgGtZFfNa3A4n+9Hd3jIaZ/BOZf4DT/syzt58/KEs9GWfzg+u
 G0pFTitKrIHLGTg8hg4UoMVlbSstKiPl/yUZEkQuJJ9Pcs/ZRGui8d4YRJyQUbDg1kcy
 Rj71RqUb31eUkycK1B9aQ5Cxynf6P0SPSEEtqkM2L1nKHEJnSKVz6FGESEd+X1dmbBuQ
 OQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=vwDr2DqJbe94YtmQR/rER8sZDtRzEzsUjkCGwVg+tJA=;
 b=dcHWodIDuDk79jXVi+aqQZwj5kgdFkBfPJPdo0Mtwhlua1XDYF4jatfU0DG/eOw0sI
 W7Q8TYv2TpMyQjw1/kp6Y2+sjfWL6WdrBj28x7qo5m5H61DLpeNCvyUrZlVe4oboM21m
 8xtrX/fGR7OEcNReEI9HbEeFcR0ntUaM0yl5M4cL0AAUdwlnayd52MYMHSbvsPe0GoU+
 qxZgUor3q3BAW1wih/HaMTFmVQ0YZsrkmjT2xtCrJbYMMsml2ogMZV/X/15Pf6+lhkY4
 incJi/PZe3KhD44h+8t4kNYe2ZOFIls0mlRaf8eZXa6BwnRzVTF1pHMX+IXu4DcL4aaE
 tQ7w==
X-Gm-Message-State: APjAAAXQW0dpkgvmN72izMo1DRnAT/UT7oy+bZoZvyBUBdZNduxzlqEj
 9yupxVDdRZLCe60CvM+5EvjHQw==
X-Google-Smtp-Source: APXvYqwxry9Pv0gWfivODwUvddQ6owXpLqjxL9hmvcmvs6EtstahFqWYwryDDLbDGlDRC0txajfZbA==
X-Received: by 2002:adf:f946:: with SMTP id q6mr5939637wrr.109.1560944815922; 
 Wed, 19 Jun 2019 04:46:55 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id p3sm17895570wrd.47.2019.06.19.04.46.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 04:46:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D34F1FF87;
 Wed, 19 Jun 2019 12:46:54 +0100 (BST)
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-9-alex.bennee@linaro.org>
 <CADYwmhGiU_1GrBrR_tzBx+Lw+Hs3=Hi3AoPxRwkEj2pv9awqUg@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pranith Kumar <bobby.prani@gmail.com>
In-reply-to: <CADYwmhGiU_1GrBrR_tzBx+Lw+Hs3=Hi3AoPxRwkEj2pv9awqUg@mail.gmail.com>
Date: Wed, 19 Jun 2019 12:46:54 +0100
Message-ID: <871rzpajbl.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v3 08/50] plugin: add core code
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
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pranith Kumar <bobby.prani@gmail.com> writes:

> On Fri, Jun 14, 2019 at 10:30 AM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>>
>> From: "Emilio G. Cota" <cota@braap.org>
>>
>> Signed-off-by: Emilio G. Cota <cota@braap.org>
>> [AJB: moved directory and merged various fixes]
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> ---
>> v3
>>   - moved to plugins/
>>   - merged
>>     plugin: remove uninstall_cb_t and just use simple_cb_t
>>     plugin: handle uninstall when !current_cpu
>>     plugin: introduce qemu_plugin_reset
>>   - split into core/loader
>>   - use GArray/GByteArray/GPtrArray instead of homegrown funcs
>> ---
>>  Makefile              |  10 +-
>>  Makefile.target       |   2 +
>>  include/qemu/plugin.h | 261 +++++++++++++++++++++
>>  include/qom/cpu.h     |   6 +
>>  plugins/Makefile.objs |   6 +
>>  plugins/core.c        | 524 ++++++++++++++++++++++++++++++++++++++++++
>>  plugins/loader.c      | 353 ++++++++++++++++++++++++++++
>>  plugins/plugin.h      |  95 ++++++++
>>  8 files changed, 1256 insertions(+), 1 deletion(-)
>>  create mode 100644 include/qemu/plugin.h
>>  create mode 100644 plugins/Makefile.objs
>>  create mode 100644 plugins/core.c
>>  create mode 100644 plugins/loader.c
>>  create mode 100644 plugins/plugin.h
>>
>> diff --git a/Makefile b/Makefile
>> index 8e2fc6624c..37d396ab88 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -827,8 +827,13 @@ endif
>>
>>  ICON_SIZES=3D16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512
>>
>> -install: all $(if $(BUILD_DOCS),install-doc) install-datadir install-lo=
calstatedir \
>> +install-includedir:
>> +       $(INSTALL_DIR) "$(DESTDIR)$(includedir)"
>> +
>> +install: all $(if $(BUILD_DOCS),install-doc) \
>> +       install-datadir install-localstatedir install-includedir \
>>         $(if $(INSTALL_BLOBS),$(edk2-decompressed))
>> +
>>  ifneq ($(TOOLS),)
>>         $(call install-prog,$(subst qemu-ga,qemu-ga$(EXESUF),$(TOOLS)),$=
(DESTDIR)$(bindir))
>>  endif
>> @@ -888,6 +893,9 @@ endif
>>                 "$(DESTDIR)/$(qemu_desktopdir)/qemu.desktop"
>>  ifdef CONFIG_GTK
>>         $(MAKE) -C po $@
>> +endif
>> +ifeq ($(CONFIG_PLUGIN),y)
>> +       $(INSTALL_DATA) $(SRC_PATH)/include/qemu/qemu-plugin.h "$(DESTDI=
R)$(includedir)/qemu-plugin.h"
>>  endif
>>         $(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/keymaps"
>>         set -e; for x in $(KEYMAPS); do \
>> diff --git a/Makefile.target b/Makefile.target
>> index ecd856e3a3..d492e24da2 100644
>> --- a/Makefile.target
>> +++ b/Makefile.target
>> @@ -118,6 +118,8 @@ obj-y +=3D target/$(TARGET_BASE_ARCH)/
>>  obj-y +=3D disas.o
>>  obj-$(call notempty,$(TARGET_XML_FILES)) +=3D gdbstub-xml.o
>>
>> +obj-$(CONFIG_PLUGIN) +=3D plugins/
>> +
>>  #########################################################
>>  # Linux user emulator target
>>
>> diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
>> new file mode 100644
>> index 0000000000..93e39f44d2
>> --- /dev/null
>> +++ b/include/qemu/plugin.h
>> @@ -0,0 +1,261 @@
>> +/*
>> + * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
>> + *
>> + * License: GNU GPL, version 2 or later.
>> + *   See the COPYING file in the top-level directory.
>> + */
>> +#ifndef QEMU_PLUGIN_H
>> +#define QEMU_PLUGIN_H
>> +
>> +#include "qemu/config-file.h"
>> +#include "qemu/qemu-plugin.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/queue.h"
>> +#include "qemu/option.h"
>> +
>> +/*
>> + * Option parsing/processing.
>> + * Note that we can load an arbitrary number of plugins.
>> + */
>> +struct qemu_plugin_desc;
>> +typedef QTAILQ_HEAD(, qemu_plugin_desc) QemuPluginList;
>> +
>> +#ifdef CONFIG_PLUGIN
>> +extern QemuOptsList qemu_plugin_opts;
>> +
>> +static inline void qemu_plugin_add_opts(void)
>> +{
>> +    qemu_add_opts(&qemu_plugin_opts);
>> +}
>> +
>> +void qemu_plugin_opt_parse(const char *optarg, QemuPluginList *head);
>> +int qemu_plugin_load_list(QemuPluginList *head);
>> +#else /* !CONFIG_PLUGIN */
>> +static inline void qemu_plugin_add_opts(void)
>> +{ }
>> +
>> +static inline void qemu_plugin_opt_parse(const char *optarg,
>> +                                         QemuPluginList *head)
>> +{
>> +    error_report("plugin interface not enabled in this build");
>> +    exit(1);
>> +}
>> +
>> +static inline int qemu_plugin_load_list(QemuPluginList *head)
>> +{
>> +    return 0;
>> +}
>> +#endif /* !CONFIG_PLUGIN */
>> +
>> +/*
>> + * Events that plugins can subscribe to.
>> + */
>> +enum qemu_plugin_event {
>> +    QEMU_PLUGIN_EV_VCPU_INIT,
>> +    QEMU_PLUGIN_EV_VCPU_EXIT,
>> +    QEMU_PLUGIN_EV_VCPU_TB_TRANS,
>> +    QEMU_PLUGIN_EV_VCPU_IDLE,
>> +    QEMU_PLUGIN_EV_VCPU_RESUME,
>> +    QEMU_PLUGIN_EV_VCPU_SYSCALL,
>> +    QEMU_PLUGIN_EV_VCPU_SYSCALL_RET,
>> +    QEMU_PLUGIN_EV_FLUSH,
>> +    QEMU_PLUGIN_EV_ATEXIT,
>> +    QEMU_PLUGIN_EV_MAX,
>> +};
>
> All the events but for MAX are descriptive. Care to add a comment for
> the last one?

Ok.

>
>> +
>> +union qemu_plugin_cb_sig {
>> +    qemu_plugin_simple_cb_t          simple;
>> +    qemu_plugin_udata_cb_t           udata;
>> +    qemu_plugin_vcpu_simple_cb_t     vcpu_simple;
>> +    qemu_plugin_vcpu_udata_cb_t      vcpu_udata;
>> +    qemu_plugin_vcpu_tb_trans_cb_t   vcpu_tb_trans;
>> +    qemu_plugin_vcpu_mem_cb_t        vcpu_mem;
>> +    qemu_plugin_vcpu_mem_haddr_cb_t  vcpu_mem_haddr;
>> +    qemu_plugin_vcpu_syscall_cb_t    vcpu_syscall;
>> +    qemu_plugin_vcpu_syscall_ret_cb_t vcpu_syscall_ret;
>> +    void *generic;
>> +};
>> +
>> +enum plugin_dyn_cb_type {
>> +    PLUGIN_CB_INSN,
>> +    PLUGIN_CB_MEM,
>> +    PLUGIN_CB_HADDR,
>> +    PLUGIN_N_CB_TYPES,
>> +};
>
> This might be better to have the types as powers of 2. It will allow
> us to define a plugin by comibining multiple types using OR.

To what end? It's not like you can have multiple prototypes to the call bac=
k.

>
>
>> +
>> +enum plugin_dyn_cb_subtype {
>> +    PLUGIN_CB_REGULAR,
>> +    PLUGIN_CB_INLINE,
>> +    PLUGIN_N_CB_SUBTYPES,
>> +};
>> +
>> +/*
>> + * A dynamic callback has an insertion point that is determined at run-=
time.
>> + * Usually the insertion point is somewhere in the code cache; think for
>> + * instance of a callback to be called upon the execution of a particul=
ar TB.
>> + */
>> +struct qemu_plugin_dyn_cb {
>> +    union qemu_plugin_cb_sig f;
>> +    void *userp;
>> +    unsigned tcg_flags;
>> +    enum plugin_dyn_cb_type type;
>> +    /* @rw applies to mem callbacks only (both regular and inline) */
>> +    enum qemu_plugin_mem_rw rw;
>> +    /* fields specific to each dyn_cb type go here */
>> +    union {
>> +        struct {
>> +            bool haddr;
>> +        } mem;
>> +        struct {
>> +            enum qemu_plugin_op op;
>> +            uint64_t imm;
>> +        } inline_insn;
>> +    };
>> +};
>> +
>> +struct qemu_plugin_insn {
>> +    GByteArray *data;
>> +    uint64_t vaddr;
>> +    void *haddr;
>> +    GArray *cbs[PLUGIN_N_CB_TYPES][PLUGIN_N_CB_SUBTYPES];
>> +    bool calls_helpers;
>> +    bool mem_helper;
>> +};
>> +
>> +/*
>> + * qemu_plugin_insn allocate and cleanup functions. We don't expect to
>> + * cleanup many of these structures. They are reused for each fresh
>> + * translation.
>> + */
>> +
>> +static inline void qemu_plugin_insn_cleanup_fn(gpointer data)
>> +{
>> +    struct qemu_plugin_insn *insn =3D (struct qemu_plugin_insn *) data;
>> +    g_byte_array_free(insn->data, true);
>> +}
>> +
>> +static inline struct qemu_plugin_insn * qemu_plugin_insn_alloc(void)
>> +{
>> +    int i, j;
>> +    struct qemu_plugin_insn *insn =3D g_new0(struct qemu_plugin_insn, 1=
);
>> +    insn->data =3D g_byte_array_sized_new(4);
>> +
>> +    for (i =3D 0; i < PLUGIN_N_CB_TYPES; i++) {
>> +        for (j =3D 0; j < PLUGIN_N_CB_SUBTYPES; j++) {
>> +            insn->cbs[i][j] =3D g_array_new(false, false,
>> +                                          sizeof(struct qemu_plugin_dyn=
_cb));
>> +        }
>> +    }
>> +    return insn;
>> +}
>> +
>> +struct qemu_plugin_tb {
>> +    GPtrArray *insns;
>> +    size_t n;
>> +    uint64_t vaddr;
>> +    uint64_t vaddr2;
>> +    void *haddr1;
>> +    void *haddr2;
>> +    GArray *cbs[PLUGIN_N_CB_SUBTYPES];
>> +};
>> +
>> +/**
>> + * qemu_plugin_tb_insn_get(): get next plugin record for translation.
>> + *
>> + */
>> +static inline
>> +struct qemu_plugin_insn *qemu_plugin_tb_insn_get(struct qemu_plugin_tb =
*tb)
>> +{
>> +    struct qemu_plugin_insn *insn;
>> +    int i, j;
>> +
>> +    if (unlikely(tb->n =3D=3D tb->insns->len)) {
>> +        struct qemu_plugin_insn *new_insn =3D qemu_plugin_insn_alloc();
>> +        g_ptr_array_add(tb->insns, new_insn);
>> +    }
>> +    insn =3D g_ptr_array_index(tb->insns, tb->n++);
>> +    g_byte_array_set_size(insn->data, 0);
>> +    insn->calls_helpers =3D false;
>> +    insn->mem_helper =3D false;
>> +
>> +    for (i =3D 0; i < PLUGIN_N_CB_TYPES; i++) {
>> +        for (j =3D 0; j < PLUGIN_N_CB_SUBTYPES; j++) {
>> +            g_array_set_size(insn->cbs[i][j], 0);
>> +        }
>> +    }
>> +
>> +    return insn;
>> +}
>> +
>> +#ifdef CONFIG_PLUGIN
>> +
>> +void qemu_plugin_vcpu_init_hook(CPUState *cpu);
>> +void qemu_plugin_vcpu_exit_hook(CPUState *cpu);
>> +void qemu_plugin_tb_trans_cb(CPUState *cpu, struct qemu_plugin_tb *tb);
>> +void qemu_plugin_vcpu_idle_cb(CPUState *cpu);
>> +void qemu_plugin_vcpu_resume_cb(CPUState *cpu);
>> +void
>> +qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1,
>> +                         uint64_t a2, uint64_t a3, uint64_t a4, uint64_=
t a5,
>> +                         uint64_t a6, uint64_t a7, uint64_t a8);
>> +void qemu_plugin_vcpu_syscall_ret(CPUState *cpu, int64_t num, int64_t r=
et);
>> +
>> +void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr, void *haddr,
>> +                             uint32_t meminfo);
>> +
>> +void qemu_plugin_flush_cb(void);
>> +
>> +void qemu_plugin_atexit_cb(void);
>> +
>> +void qemu_plugin_add_dyn_cb_arr(GArray *arr);
>> +
>> +void qemu_plugin_disable_mem_helpers(CPUState *cpu);
>> +
>> +#else /* !CONFIG_PLUGIN */
>> +
>> +static inline void qemu_plugin_vcpu_init_hook(CPUState *cpu)
>> +{ }
>> +
>> +static inline void qemu_plugin_vcpu_exit_hook(CPUState *cpu)
>> +{ }
>> +
>> +static inline void qemu_plugin_tb_trans_cb(CPUState *cpu,
>> +                                           struct qemu_plugin_tb *tb)
>> +{ }
>> +
>> +static inline void qemu_plugin_vcpu_idle_cb(CPUState *cpu)
>> +{ }
>> +
>> +static inline void qemu_plugin_vcpu_resume_cb(CPUState *cpu)
>> +{ }
>> +
>> +static inline void
>> +qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1, uint6=
4_t a2,
>> +                         uint64_t a3, uint64_t a4, uint64_t a5, uint64_=
t a6,
>> +                         uint64_t a7, uint64_t a8)
>> +{ }
>> +
>> +static inline
>> +void qemu_plugin_vcpu_syscall_ret(CPUState *cpu, int64_t num, int64_t r=
et)
>> +{ }
>> +
>> +static inline void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vadd=
r,
>> +                                           void *haddr, uint32_t meminf=
o)
>> +{ }
>> +
>> +static inline void qemu_plugin_flush_cb(void)
>> +{ }
>> +
>> +static inline void qemu_plugin_atexit_cb(void)
>> +{ }
>> +
>> +static inline
>> +void qemu_plugin_add_dyn_cb_arr(GArray *arr)
>> +{ }
>> +
>> +static inline void qemu_plugin_disable_mem_helpers(CPUState *cpu)
>> +{ }
>> +
>> +#endif /* !CONFIG_PLUGIN */
>> +
>> +#endif /* QEMU_PLUGIN_H */
>> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
>> index 08481ad304..27b67a4e49 100644
>> --- a/include/qom/cpu.h
>> +++ b/include/qom/cpu.h
>> @@ -29,6 +29,7 @@
>>  #include "qemu/rcu_queue.h"
>>  #include "qemu/queue.h"
>>  #include "qemu/thread.h"
>> +#include "qemu/plugin.h"
>>
>>  typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
>>                                       void *opaque);
>> @@ -345,6 +346,7 @@ struct qemu_work_item;
>>   * @trace_dstate_delayed: Delayed changes to trace_dstate (includes all=
 changes
>>   *                        to @trace_dstate).
>>   * @trace_dstate: Dynamic tracing state of events for this vCPU (bitmas=
k).
>> + * @plugin_mask: Plugin event bitmap. Modified only via async work.
>>   * @ignore_memory_transaction_failures: Cached copy of the MachineState
>>   *    flag of the same name: allows the board to suppress calling of the
>>   *    CPU do_transaction_failed hook function.
>> @@ -430,6 +432,10 @@ struct CPUState {
>>      DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
>>      DECLARE_BITMAP(trace_dstate, CPU_TRACE_DSTATE_MAX_EVENTS);
>>
>> +    DECLARE_BITMAP(plugin_mask, QEMU_PLUGIN_EV_MAX);
>> +
>> +    GArray *plugin_mem_cbs;
>> +
>>      /* TODO Move common fields from CPUArchState here. */
>>      int cpu_index;
>>      int cluster_index;
>> diff --git a/plugins/Makefile.objs b/plugins/Makefile.objs
>> new file mode 100644
>> index 0000000000..58940335bc
>> --- /dev/null
>> +++ b/plugins/Makefile.objs
>> @@ -0,0 +1,6 @@
>> +#
>> +# Plugin Support
>> +#
>> +
>> +obj-y +=3D loader.o
>> +obj-y +=3D core.o
>> diff --git a/plugins/core.c b/plugins/core.c
>> new file mode 100644
>> index 0000000000..8c46373773
>> --- /dev/null
>> +++ b/plugins/core.c
>> @@ -0,0 +1,524 @@
>> +/* plugin.c - QEMU Plugin interface
>> + *
>> + * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
>> + *
>> + * License: GNU GPL, version 2 or later.
>> + *   See the COPYING file in the top-level directory.
>> + */
>> +#include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/config-file.h"
>> +#include "qapi/error.h"
>> +#include "qemu/option.h"
>> +#include "qemu/rcu_queue.h"
>> +#include "qemu/xxhash.h"
>> +#include "qemu/rcu.h"
>> +#include "qom/cpu.h"
>> +#include "exec/cpu-common.h"
>> +#include <dlfcn.h>
>> +
>> +#include "cpu.h"
>> +#include "exec/exec-all.h"
>> +#include "exec/helper-proto.h"
>> +/* #include "exec/plugin-gen.h" */
>> +#include "sysemu/sysemu.h"
>> +#include "tcg/tcg.h"
>> +#include "tcg/tcg-op.h"
>> +#include "trace/mem-internal.h" /* mem_info macros */
>> +#include "plugin.h"
>> +
>> +struct qemu_plugin_cb {
>> +    struct qemu_plugin_ctx *ctx;
>> +    union qemu_plugin_cb_sig f;
>> +    void *udata;
>> +    QLIST_ENTRY(qemu_plugin_cb) entry;
>> +};
>> +
>> +QLIST_HEAD(qemu_plugin_cb_head, qemu_plugin_cb);
>> +
>> +struct qemu_plugin_state plugin;
>> +
>> +struct qemu_plugin_ctx *plugin_id_to_ctx_locked(qemu_plugin_id_t id)
>> +{
>> +    struct qemu_plugin_ctx *ctx;
>> +    qemu_plugin_id_t *id_p;
>> +
>> +    id_p =3D g_hash_table_lookup(plugin.id_ht, &id);
>> +    ctx =3D container_of(id_p, struct qemu_plugin_ctx, id);
>> +    if (ctx =3D=3D NULL) {
>> +        error_report("plugin: invalid plugin id %" PRIu64, id);
>> +        abort();
>> +    }
>> +    return ctx;
>> +}
>> +
>> +static void plugin_cpu_update__async(CPUState *cpu, run_on_cpu_data dat=
a)
>> +{
>> +    bitmap_copy(cpu->plugin_mask, &data.host_ulong, QEMU_PLUGIN_EV_MAX);
>> +    cpu_tb_jmp_cache_clear(cpu);
>> +}
>> +
>> +static void plugin_cpu_update__locked(gpointer k, gpointer v, gpointer =
udata)
>> +{
>> +    CPUState *cpu =3D container_of(k, CPUState, cpu_index);
>> +    run_on_cpu_data mask =3D RUN_ON_CPU_HOST_ULONG(*plugin.mask);
>> +
>> +    if (cpu->created) {
>> +        async_run_on_cpu(cpu, plugin_cpu_update__async, mask);
>> +    } else {
>> +        plugin_cpu_update__async(cpu, mask);
>> +    }
>> +}
>> +
>> +void plugin_unregister_cb__locked(struct qemu_plugin_ctx *ctx,
>> +                                  enum qemu_plugin_event ev)
>> +{
>> +    struct qemu_plugin_cb *cb =3D ctx->callbacks[ev];
>> +
>> +    if (cb =3D=3D NULL) {
>> +        return;
>> +    }
>> +    QLIST_REMOVE_RCU(cb, entry);
>> +    g_free(cb);
>> +    ctx->callbacks[ev] =3D NULL;
>> +    if (QLIST_EMPTY_RCU(&plugin.cb_lists[ev])) {
>> +        clear_bit(ev, plugin.mask);
>> +        g_hash_table_foreach(plugin.cpu_ht, plugin_cpu_update__locked, =
NULL);
>> +    }
>> +}
>> +
>> +static void plugin_vcpu_cb__simple(CPUState *cpu, enum qemu_plugin_even=
t ev)
>> +{
>> +    struct qemu_plugin_cb *cb, *next;
>> +
>> +    switch (ev) {
>> +    case QEMU_PLUGIN_EV_VCPU_INIT:
>> +    case QEMU_PLUGIN_EV_VCPU_EXIT:
>> +    case QEMU_PLUGIN_EV_VCPU_IDLE:
>> +    case QEMU_PLUGIN_EV_VCPU_RESUME:
>> +        /* iterate safely; plugins might uninstall themselves at any ti=
me */
>> +        QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
>> +            qemu_plugin_vcpu_simple_cb_t func =3D cb->f.vcpu_simple;
>> +
>> +            func(cb->ctx->id, cpu->cpu_index);
>> +        }
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +}
>> +
>> +static void plugin_cb__simple(enum qemu_plugin_event ev)
>> +{
>> +    struct qemu_plugin_cb *cb, *next;
>> +
>> +    switch (ev) {
>> +    case QEMU_PLUGIN_EV_FLUSH:
>> +        QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
>> +            qemu_plugin_simple_cb_t func =3D cb->f.simple;
>> +
>> +            func(cb->ctx->id);
>> +        }
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +}
>> +
>> +static void plugin_cb__udata(enum qemu_plugin_event ev)
>> +{
>> +    struct qemu_plugin_cb *cb, *next;
>> +
>> +    switch (ev) {
>> +    case QEMU_PLUGIN_EV_ATEXIT:
>> +        QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
>> +            qemu_plugin_udata_cb_t func =3D cb->f.udata;
>> +
>> +            func(cb->ctx->id, cb->udata);
>> +        }
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +}
>> +
>> +static void
>> +do_plugin_register_cb(qemu_plugin_id_t id, enum qemu_plugin_event ev,
>> +                      void *func, void *udata)
>> +{
>> +    struct qemu_plugin_ctx *ctx;
>> +
>> +    qemu_rec_mutex_lock(&plugin.lock);
>> +    ctx =3D plugin_id_to_ctx_locked(id);
>> +    /* if the plugin is on its way out, ignore this request */
>> +    if (unlikely(ctx->uninstalling)) {
>> +        goto out_unlock;
>> +    }
>> +    if (func) {
>> +        struct qemu_plugin_cb *cb =3D ctx->callbacks[ev];
>> +
>> +        if (cb) {
>> +            cb->f.generic =3D func;
>> +            cb->udata =3D udata;
>> +        } else {
>> +            cb =3D g_new(struct qemu_plugin_cb, 1);
>> +            cb->ctx =3D ctx;
>> +            cb->f.generic =3D func;
>> +            cb->udata =3D udata;
>> +            ctx->callbacks[ev] =3D cb;
>> +            QLIST_INSERT_HEAD_RCU(&plugin.cb_lists[ev], cb, entry);
>> +            if (!test_bit(ev, plugin.mask)) {
>> +                set_bit(ev, plugin.mask);
>> +                g_hash_table_foreach(plugin.cpu_ht, plugin_cpu_update__=
locked,
>> +                                     NULL);
>> +            }
>> +        }
>> +    } else {
>> +        plugin_unregister_cb__locked(ctx, ev);
>> +    }
>> + out_unlock:
>> +    qemu_rec_mutex_unlock(&plugin.lock);
>> +}
>> +
>> +void plugin_register_cb(qemu_plugin_id_t id, enum qemu_plugin_event ev,
>> +                        void *func)
>> +{
>> +    do_plugin_register_cb(id, ev, func, NULL);
>> +}
>> +
>> +void
>> +plugin_register_cb_udata(qemu_plugin_id_t id, enum qemu_plugin_event ev,
>> +                         void *func, void *udata)
>> +{
>> +    do_plugin_register_cb(id, ev, func, udata);
>> +}
>> +
>> +void qemu_plugin_vcpu_init_hook(CPUState *cpu)
>> +{
>> +    bool success;
>> +
>> +    qemu_rec_mutex_lock(&plugin.lock);
>> +    plugin_cpu_update__locked(&cpu->cpu_index, NULL, NULL);
>> +    success =3D g_hash_table_insert(plugin.cpu_ht, &cpu->cpu_index,
>> +                                  &cpu->cpu_index);
>> +    g_assert(success);
>> +    qemu_rec_mutex_unlock(&plugin.lock);
>> +
>> +    plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_INIT);
>> +}
>> +
>> +void qemu_plugin_vcpu_exit_hook(CPUState *cpu)
>> +{
>> +    bool success;
>> +
>> +    plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_EXIT);
>> +
>> +    qemu_rec_mutex_lock(&plugin.lock);
>> +    success =3D g_hash_table_remove(plugin.cpu_ht, &cpu->cpu_index);
>> +    g_assert(success);
>> +    qemu_rec_mutex_unlock(&plugin.lock);
>> +}
>> +
>> +struct plugin_for_each_args {
>> +    struct qemu_plugin_ctx *ctx;
>> +    qemu_plugin_vcpu_simple_cb_t cb;
>> +};
>> +
>> +static void plugin_vcpu_for_each(gpointer k, gpointer v, gpointer udata)
>> +{
>> +    struct plugin_for_each_args *args =3D udata;
>> +    int cpu_index =3D *(int *)k;
>> +
>> +    args->cb(args->ctx->id, cpu_index);
>> +}
>> +
>> +void qemu_plugin_vcpu_for_each(qemu_plugin_id_t id,
>> +                               qemu_plugin_vcpu_simple_cb_t cb)
>> +{
>> +    struct plugin_for_each_args args;
>> +
>> +    if (cb =3D=3D NULL) {
>> +        return;
>> +    }
>> +    qemu_rec_mutex_lock(&plugin.lock);
>> +    args.ctx =3D plugin_id_to_ctx_locked(id);
>> +    args.cb =3D cb;
>> +    g_hash_table_foreach(plugin.cpu_ht, plugin_vcpu_for_each, &args);
>> +    qemu_rec_mutex_unlock(&plugin.lock);
>> +}
>> +
>> +/* Allocate and return a callback record */
>> +static struct qemu_plugin_dyn_cb *plugin_get_dyn_cb(GArray **arr)
>> +{
>> +    GArray *cbs =3D *arr;
>> +
>> +    if (!cbs) {
>> +        cbs =3D g_array_sized_new(false, false, sizeof(struct qemu_plug=
in_dyn_cb), 1);
>> +        *arr =3D cbs;
>> +    }
>> +
>> +    g_array_set_size(cbs, cbs->len + 1);
>> +    return &g_array_index(cbs, struct qemu_plugin_dyn_cb, cbs->len - 1);
>> +}
>> +
>> +void plugin_register_inline_op(GArray **arr,
>> +                               enum qemu_plugin_mem_rw rw,
>> +                               enum qemu_plugin_op op, void *ptr,
>> +                               uint64_t imm)
>> +{
>> +    struct qemu_plugin_dyn_cb *dyn_cb;
>> +
>> +    dyn_cb =3D plugin_get_dyn_cb(arr);
>> +    dyn_cb->userp =3D ptr;
>> +    dyn_cb->type =3D PLUGIN_CB_INLINE;
>> +    dyn_cb->rw =3D rw;
>> +    dyn_cb->inline_insn.op =3D op;
>> +    dyn_cb->inline_insn.imm =3D imm;
>> +}
>> +
>> +static inline uint32_t cb_to_tcg_flags(enum qemu_plugin_cb_flags flags)
>> +{
>> +    uint32_t ret;
>> +
>> +    switch (flags) {
>> +    case QEMU_PLUGIN_CB_RW_REGS:
>> +        ret =3D 0;
>> +    case QEMU_PLUGIN_CB_R_REGS:
>> +        ret =3D TCG_CALL_NO_WG;
>> +        break;
>> +    case QEMU_PLUGIN_CB_NO_REGS:
>> +    default:
>> +        ret =3D TCG_CALL_NO_RWG;
>> +    }
>> +    return ret;
>> +}
>> +
>> +inline void
>> +plugin_register_dyn_cb__udata(GArray **arr,
>> +                              qemu_plugin_vcpu_udata_cb_t cb,
>> +                              enum qemu_plugin_cb_flags flags, void *ud=
ata)
>> +{
>> +    struct qemu_plugin_dyn_cb *dyn_cb =3D plugin_get_dyn_cb(arr);
>> +
>> +    dyn_cb->userp =3D udata;
>> +    dyn_cb->tcg_flags =3D cb_to_tcg_flags(flags);
>> +    dyn_cb->f.vcpu_udata =3D cb;
>> +    dyn_cb->type =3D PLUGIN_CB_REGULAR;
>> +}
>> +
>> +void plugin_register_vcpu_mem_cb(GArray **arr,
>> +                                 void *cb,
>> +                                 enum qemu_plugin_cb_flags flags,
>> +                                 enum qemu_plugin_mem_rw rw,
>> +                                 void *udata, bool haddr)
>> +{
>> +    struct qemu_plugin_dyn_cb *dyn_cb;
>> +
>> +    dyn_cb =3D plugin_get_dyn_cb(arr);
>> +    dyn_cb->userp =3D udata;
>> +    dyn_cb->tcg_flags =3D cb_to_tcg_flags(flags);
>> +    dyn_cb->type =3D PLUGIN_CB_REGULAR;
>> +    dyn_cb->rw =3D rw;
>> +    dyn_cb->mem.haddr =3D haddr;
>> +    dyn_cb->f.generic =3D cb;
>> +}
>> +
>> +void qemu_plugin_tb_trans_cb(CPUState *cpu, struct qemu_plugin_tb *tb)
>> +{
>> +    struct qemu_plugin_cb *cb, *next;
>> +    enum qemu_plugin_event ev =3D QEMU_PLUGIN_EV_VCPU_TB_TRANS;
>> +
>> +    /* no plugin_mask check here; caller should have checked */
>> +
>> +    QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
>> +        qemu_plugin_vcpu_tb_trans_cb_t func =3D cb->f.vcpu_tb_trans;
>> +
>> +        func(cb->ctx->id, cpu->cpu_index, tb);
>> +    }
>> +}
>> +
>> +void
>> +qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1, uint6=
4_t a2,
>> +                         uint64_t a3, uint64_t a4, uint64_t a5,
>> +                         uint64_t a6, uint64_t a7, uint64_t a8)
>> +{
>> +    struct qemu_plugin_cb *cb, *next;
>> +    enum qemu_plugin_event ev =3D QEMU_PLUGIN_EV_VCPU_SYSCALL;
>> +
>> +    if (!test_bit(ev, cpu->plugin_mask)) {
>> +        return;
>> +    }
>> +
>> +    QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
>> +        qemu_plugin_vcpu_syscall_cb_t func =3D cb->f.vcpu_syscall;
>> +
>> +        func(cb->ctx->id, cpu->cpu_index, num, a1, a2, a3, a4, a5, a6, =
a7, a8);
>> +    }
>> +}
>> +
>> +void qemu_plugin_vcpu_syscall_ret(CPUState *cpu, int64_t num, int64_t r=
et)
>> +{
>> +    struct qemu_plugin_cb *cb, *next;
>> +    enum qemu_plugin_event ev =3D QEMU_PLUGIN_EV_VCPU_SYSCALL_RET;
>> +
>> +    if (!test_bit(ev, cpu->plugin_mask)) {
>> +        return;
>> +    }
>> +
>> +    QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
>> +        qemu_plugin_vcpu_syscall_ret_cb_t func =3D cb->f.vcpu_syscall_r=
et;
>> +
>> +        func(cb->ctx->id, cpu->cpu_index, num, ret);
>> +    }
>> +}
>> +
>> +void qemu_plugin_vcpu_idle_cb(CPUState *cpu)
>> +{
>> +    plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_IDLE);
>> +}
>> +
>> +void qemu_plugin_vcpu_resume_cb(CPUState *cpu)
>> +{
>> +    plugin_vcpu_cb__simple(cpu, QEMU_PLUGIN_EV_VCPU_RESUME);
>> +}
>> +
>> +void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
>> +                                       qemu_plugin_vcpu_simple_cb_t cb)
>> +{
>> +    plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_IDLE, cb);
>> +}
>> +
>> +void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
>> +                                         qemu_plugin_vcpu_simple_cb_t c=
b)
>> +{
>> +    plugin_register_cb(id, QEMU_PLUGIN_EV_VCPU_RESUME, cb);
>> +}
>> +
>> +void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
>> +                                   qemu_plugin_simple_cb_t cb)
>> +{
>> +    plugin_register_cb(id, QEMU_PLUGIN_EV_FLUSH, cb);
>> +}
>> +
>> +static bool free_dyn_cb_arr(void *p, uint32_t h, void *userp)
>> +{
>> +    g_array_free((GArray *) p, true);
>> +    return true;
>> +}
>> +
>> +void qemu_plugin_flush_cb(void)
>> +{
>> +    qht_iter_remove(&plugin.dyn_cb_arr_ht, free_dyn_cb_arr, NULL);
>> +    qht_reset(&plugin.dyn_cb_arr_ht);
>> +
>> +    plugin_cb__simple(QEMU_PLUGIN_EV_FLUSH);
>> +}
>> +
>> +void exec_inline_op(struct qemu_plugin_dyn_cb *cb)
>> +{
>> +    uint64_t *val =3D cb->userp;
>> +
>> +    switch (cb->inline_insn.op) {
>> +    case QEMU_PLUGIN_INLINE_ADD_U64:
>> +        *val +=3D cb->inline_insn.imm;
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +}
>> +
>> +void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr, void *haddr,
>> +                             uint32_t info)
>> +{
>> +    GArray *arr =3D cpu->plugin_mem_cbs;
>> +    size_t i;
>> +
>> +    if (arr =3D=3D NULL) {
>> +        return;
>> +    }
>> +    for (i =3D 0; i < arr->len; i++) {
>> +        struct qemu_plugin_dyn_cb *cb =3D
>> +            &g_array_index(arr, struct qemu_plugin_dyn_cb, i);
>> +        int w =3D !!(info & TRACE_MEM_ST) + 1;
>> +
>> +        if (!(w & cb->rw)) {
>> +                break;
>> +        }
>> +        switch (cb->type) {
>> +        case PLUGIN_CB_REGULAR:
>> +
>> +            if (cb->mem.haddr) {
>> +                cb->f.vcpu_mem_haddr(cpu->cpu_index, info, vaddr, haddr,
>> +                                     cb->userp);
>> +            } else {
>> +                cb->f.vcpu_mem(cpu->cpu_index, info, vaddr, cb->userp);
>> +            }
>> +            break;
>> +        case PLUGIN_CB_INLINE:
>> +            exec_inline_op(cb);
>> +            break;
>> +        default:
>> +            g_assert_not_reached();
>> +        }
>> +    }
>> +}
>> +
>> +void qemu_plugin_atexit_cb(void)
>> +{
>> +    plugin_cb__udata(QEMU_PLUGIN_EV_ATEXIT);
>> +}
>> +
>> +void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
>> +                                    qemu_plugin_udata_cb_t cb,
>> +                                    void *udata)
>> +{
>> +    plugin_register_cb_udata(id, QEMU_PLUGIN_EV_ATEXIT, cb, udata);
>> +}
>> +
>> +uint64_t qemu_plugin_ram_addr_from_host(void *haddr)
>> +{
>> +#ifdef CONFIG_SOFTMMU
>> +    ram_addr_t ram_addr;
>> +
>> +    g_assert(haddr);
>> +    ram_addr =3D qemu_ram_addr_from_host(haddr);
>> +    if (ram_addr =3D=3D RAM_ADDR_INVALID) {
>> +        error_report("Bad ram pointer %p", haddr);
>> +        abort();
>> +    }
>> +    return ram_addr;
>> +#else
>> +    return 0;
>> +#endif
>> +}
>> +
>> +/*
>> + * Call this function after longjmp'ing to the main loop. It's possible=
 that the
>> + * last instruction of a TB might have used helpers, and therefore the
>> + * "disable" instruction will never execute because it ended up as dead=
 code.
>> + */
>> +void qemu_plugin_disable_mem_helpers(CPUState *cpu)
>> +{
>> +    cpu->plugin_mem_cbs =3D NULL;
>> +}
>> +
>> +static bool plugin_dyn_cb_arr_cmp(const void *ap, const void *bp)
>> +{
>> +    return ap =3D=3D bp;
>> +}
>> +
>> +static void __attribute__((__constructor__)) plugin_init(void)
>> +{
>> +    int i;
>> +
>> +    for (i =3D 0; i < QEMU_PLUGIN_EV_MAX; i++) {
>> +        QLIST_INIT(&plugin.cb_lists[i]);
>> +    }
>> +    qemu_rec_mutex_init(&plugin.lock);
>> +    plugin.id_ht =3D g_hash_table_new(g_int64_hash, g_int64_equal);
>> +    plugin.cpu_ht =3D g_hash_table_new(g_int_hash, g_int_equal);
>> +    QTAILQ_INIT(&plugin.ctxs);
>> +    qht_init(&plugin.dyn_cb_arr_ht, plugin_dyn_cb_arr_cmp, 16,
>> +             QHT_MODE_AUTO_RESIZE);
>> +    atexit(qemu_plugin_atexit_cb);
>> +}
>> diff --git a/plugins/loader.c b/plugins/loader.c
>> new file mode 100644
>> index 0000000000..bdd875868f
>> --- /dev/null
>> +++ b/plugins/loader.c
>> @@ -0,0 +1,353 @@
>> +#include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/config-file.h"
>> +#include "qapi/error.h"
>> +#include "qemu/option.h"
>> +#include "qemu/rcu_queue.h"
>> +#include "qemu/qht.h"
>> +#include "qemu/bitmap.h"
>> +#include "qemu/xxhash.h"
>> +#include "qemu/plugin.h"
>> +#include "qom/cpu.h"
>> +#include <dlfcn.h>
>> +#include "cpu.h"
>> +#include "exec/exec-all.h"
>> +
>> +#include "plugin.h"
>> +
>> +/*
>> + * For convenience we use a bitmap for plugin.mask, but really all we n=
eed is a
>> + * u32, which is what we store in TranslationBlock.
>> + */
>> +QEMU_BUILD_BUG_ON(QEMU_PLUGIN_EV_MAX > 32);
>> +
>> +struct qemu_plugin_desc {
>> +    char *path;
>> +    char **argv;
>> +    QTAILQ_ENTRY(qemu_plugin_desc) entry;
>> +    int argc;
>> +};
>> +
>> +struct qemu_plugin_parse_arg {
>> +    QemuPluginList *head;
>> +    struct qemu_plugin_desc *curr;
>> +};
>> +
>> +QemuOptsList qemu_plugin_opts =3D {
>> +    .name =3D "plugin",
>> +    .implied_opt_name =3D "file",
>> +    .head =3D QTAILQ_HEAD_INITIALIZER(qemu_plugin_opts.head),
>> +    .desc =3D {
>> +        /* do our own parsing to support multiple plugins */
>> +        { /* end of list */ }
>> +    },
>> +};
>> +
>> +typedef int (*qemu_plugin_install_func_t)(qemu_plugin_id_t, int, char *=
*);
>> +
>> +extern struct qemu_plugin_state plugin;
>> +
>> +void qemu_plugin_add_dyn_cb_arr(GArray *arr)
>> +{
>> +    uint32_t hash =3D qemu_xxhash2((uint64_t)(uintptr_t)arr);
>> +    bool inserted;
>> +
>> +    inserted =3D qht_insert(&plugin.dyn_cb_arr_ht, arr, hash, NULL);
>> +    g_assert(inserted);
>> +}
>> +
>> +static struct qemu_plugin_desc *plugin_find_desc(QemuPluginList *head,
>> +                                                 const char *path)
>> +{
>> +    struct qemu_plugin_desc *desc;
>> +
>> +    QTAILQ_FOREACH(desc, head, entry) {
>> +        if (strcmp(desc->path, path) =3D=3D 0) {
>> +            return desc;
>> +        }
>> +    }
>> +    return NULL;
>> +}
>> +
>> +static int plugin_add(void *opaque, const char *name, const char *value,
>> +                      Error **errp)
>> +{
>> +    struct qemu_plugin_parse_arg *arg =3D opaque;
>> +    struct qemu_plugin_desc *p;
>> +
>> +    if (strcmp(name, "file") =3D=3D 0) {
>> +        if (strcmp(value, "") =3D=3D 0) {
>> +            error_setg(errp, "requires a non-empty argument");
>> +            return 1;
>> +        }
>> +        p =3D plugin_find_desc(arg->head, value);
>> +        if (p =3D=3D NULL) {
>> +            p =3D g_new0(struct qemu_plugin_desc, 1);
>> +            p->path =3D g_strdup(value);
>> +            QTAILQ_INSERT_TAIL(arg->head, p, entry);
>> +        }
>> +        arg->curr =3D p;
>> +    } else if (strcmp(name, "arg") =3D=3D 0) {
>> +        if (arg->curr =3D=3D NULL) {
>> +            error_setg(errp, "missing earlier '-plugin file=3D' option"=
);
>> +            return 1;
>> +        }
>> +        p =3D arg->curr;
>> +        p->argc++;
>> +        p->argv =3D g_realloc_n(p->argv, p->argc, sizeof(char *));
>> +        p->argv[p->argc - 1] =3D g_strdup(value);
>> +    } else {
>> +        error_setg(errp, "-plugin: unexpected parameter '%s'; ignored",=
 name);
>> +    }
>> +    return 0;
>> +}
>> +
>> +void qemu_plugin_opt_parse(const char *optarg, QemuPluginList *head)
>> +{
>> +    struct qemu_plugin_parse_arg arg;
>> +    QemuOpts *opts;
>> +
>> +    opts =3D qemu_opts_parse_noisily(qemu_find_opts("plugin"), optarg, =
true);
>> +    if (opts =3D=3D NULL) {
>> +        exit(1);
>> +    }
>> +    arg.head =3D head;
>> +    arg.curr =3D NULL;
>> +    qemu_opt_foreach(opts, plugin_add, &arg, &error_fatal);
>> +    qemu_opts_del(opts);
>> +}
>> +
>> +/*
>> + * From: https://en.wikipedia.org/wiki/Xorshift
>> + * This is faster than rand_r(), and gives us a wider range (RAND_MAX i=
s only
>> + * guaranteed to be >=3D INT_MAX).
>> + */
>> +static uint64_t xorshift64star(uint64_t x)
>> +{
>> +    x ^=3D x >> 12; /* a */
>> +    x ^=3D x << 25; /* b */
>> +    x ^=3D x >> 27; /* c */
>> +    return x * UINT64_C(2685821657736338717);
>> +}
>> +
>> +static int plugin_load(struct qemu_plugin_desc *desc)
>> +{
>> +    qemu_plugin_install_func_t install;
>> +    struct qemu_plugin_ctx *ctx;
>> +    char *err;
>> +    int rc;
>> +
>> +    ctx =3D qemu_memalign(qemu_dcache_linesize, sizeof(*ctx));
>> +    memset(ctx, 0, sizeof(*ctx));
>> +    ctx->desc =3D desc;
>> +
>> +    ctx->handle =3D dlopen(desc->path, RTLD_NOW);
>> +    if (ctx->handle =3D=3D NULL) {
>> +        error_report("%s: %s", __func__, dlerror());
>> +        goto err_dlopen;
>> +    }
>> +
>> +    /* clear any previous dlerror, call dlsym, then check dlerror */
>> +    dlerror();
>> +    install =3D dlsym(ctx->handle, "qemu_plugin_install");
>> +    err =3D dlerror();
>> +    if (err) {
>> +        error_report("%s: %s", __func__, err);
>> +        goto err_symbol;
>> +    }
>> +    /* symbol was found; it could be NULL though */
>> +    if (install =3D=3D NULL) {
>> +        error_report("%s: %s: qemu_plugin_install is NULL",
>> +                     __func__, desc->path);
>> +        goto err_symbol;
>> +    }
>> +
>> +    qemu_rec_mutex_lock(&plugin.lock);
>> +
>> +    /* find an unused random id with &ctx as the seed */
>> +    ctx->id =3D (uint64_t)(uintptr_t)ctx;
>> +    for (;;) {
>> +        void *existing;
>> +
>> +        ctx->id =3D xorshift64star(ctx->id);
>> +        existing =3D g_hash_table_lookup(plugin.id_ht, &ctx->id);
>> +        if (likely(existing =3D=3D NULL)) {
>> +            bool success;
>> +
>> +            success =3D g_hash_table_insert(plugin.id_ht, &ctx->id, &ct=
x->id);
>> +            g_assert(success);
>> +            break;
>> +        }
>> +    }
>> +    QTAILQ_INSERT_TAIL(&plugin.ctxs, ctx, entry);
>> +    ctx->installing =3D true;
>> +    rc =3D install(ctx->id, desc->argc, desc->argv);
>> +    ctx->installing =3D false;
>> +    if (rc) {
>> +        error_report("%s: qemu_plugin_install returned error code %d",
>> +                     __func__, rc);
>> +        /*
>> +         * we cannot rely on the plugin doing its own cleanup, so
>> +         * call a full uninstall if the plugin did not yet call it.
>> +         */
>> +        /* if (!ctx->uninstalling) { */
>> +        /*     qemu_plugin_uninstall(ctx->id, NULL); */
>> +        /* } */
>> +    }
>> +
>> +    qemu_rec_mutex_unlock(&plugin.lock);
>> +    return rc;
>> +
>> + err_symbol:
>> +    if (dlclose(ctx->handle)) {
>> +        warn_report("%s: %s", __func__, dlerror());
>> +    }
>> + err_dlopen:
>> +    qemu_vfree(ctx);
>> +    return 1;
>> +}
>> +
>> +/* call after having removed @desc from the list */
>> +static void plugin_desc_free(struct qemu_plugin_desc *desc)
>> +{
>> +    int i;
>> +
>> +    for (i =3D 0; i < desc->argc; i++) {
>> +        g_free(desc->argv[i]);
>> +    }
>> +    g_free(desc->argv);
>> +    g_free(desc->path);
>> +    g_free(desc);
>> +}
>> +
>> +/**
>> + * qemu_plugin_load_list - load a list of plugins
>> + * @head: head of the list of descriptors of the plugins to be loaded
>> + *
>> + * Returns 0 if all plugins in the list are installed, !0 otherwise.
>> + *
>> + * Note: the descriptor of each successfully installed plugin is removed
>> + * from the list given by @head.
>> + */
>> +int qemu_plugin_load_list(QemuPluginList *head)
>> +{
>> +    struct qemu_plugin_desc *desc, *next;
>> +
>> +    QTAILQ_FOREACH_SAFE(desc, head, entry, next) {
>> +        int err;
>> +
>> +        err =3D plugin_load(desc);
>> +        if (err) {
>> +            return err;
>> +        }
>> +        QTAILQ_REMOVE(head, desc, entry);
>> +    }
>> +    return 0;
>> +}
>> +
>> +struct qemu_plugin_reset_data {
>> +    struct qemu_plugin_ctx *ctx;
>> +    qemu_plugin_simple_cb_t cb;
>> +    bool reset;
>> +};
>> +
>> +static void plugin_reset_destroy__locked(struct qemu_plugin_reset_data =
*data)
>> +{
>> +    struct qemu_plugin_ctx *ctx =3D data->ctx;
>> +    enum qemu_plugin_event ev;
>> +    bool success;
>> +
>> +    /*
>> +     * After updating the subscription lists there is no need to wait f=
or an RCU
>> +     * grace period to elapse, because right now we either are in a "sa=
fe async"
>> +     * work environment (i.e. all vCPUs are asleep), or no vCPUs have y=
et been
>> +     * created.
>> +     */
>> +    for (ev =3D 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
>> +        plugin_unregister_cb__locked(ctx, ev);
>> +    }
>> +
>> +    if (data->reset) {
>> +        g_assert(ctx->resetting);
>> +        if (data->cb) {
>> +            data->cb(ctx->id);
>> +        }
>> +        ctx->resetting =3D false;
>> +        g_free(data);
>> +        return;
>> +    }
>> +
>> +    g_assert(ctx->uninstalling);
>> +    /* we cannot dlclose if we are going to return to plugin code */
>> +    if (ctx->installing) {
>> +        error_report("Calling qemu_plugin_uninstall from the install fu=
nction "
>> +                     "is a bug. Instead, return !0 from the install fun=
ction.");
>> +        abort();
>> +    }
>> +
>> +    success =3D g_hash_table_remove(plugin.id_ht, &ctx->id);
>> +    g_assert(success);
>> +    QTAILQ_REMOVE(&plugin.ctxs, ctx, entry);
>> +    if (data->cb) {
>> +        data->cb(ctx->id);
>> +    }
>> +    if (dlclose(ctx->handle)) {
>> +        warn_report("%s: %s", __func__, dlerror());
>> +    }
>> +    plugin_desc_free(ctx->desc);
>> +    qemu_vfree(ctx);
>> +    g_free(data);
>> +}
>> +
>> +static void plugin_reset_destroy(struct qemu_plugin_reset_data *data)
>> +{
>> +    qemu_rec_mutex_lock(&plugin.lock);
>> +    plugin_reset_destroy__locked(data);
>> +    qemu_rec_mutex_lock(&plugin.lock);
>> +}
>> +
>> +static void plugin_flush_destroy(CPUState *cpu, run_on_cpu_data arg)
>> +{
>> +    struct qemu_plugin_reset_data *data =3D arg.host_ptr;
>> +
>> +    g_assert(cpu_in_exclusive_work_context(cpu));
>> +    tb_flush(cpu);
>> +    plugin_reset_destroy(data);
>> +}
>> +
>> +void plugin_reset_uninstall(qemu_plugin_id_t id,
>> +                            qemu_plugin_simple_cb_t cb,
>> +                            bool reset)
>> +{
>> +    struct qemu_plugin_reset_data *data;
>> +    struct qemu_plugin_ctx *ctx;
>> +
>> +    qemu_rec_mutex_lock(&plugin.lock);
>> +    ctx =3D plugin_id_to_ctx_locked(id);
>> +    if (ctx->uninstalling || (reset && ctx->resetting)) {
>> +        qemu_rec_mutex_unlock(&plugin.lock);
>> +        return;
>> +    }
>> +    ctx->resetting =3D reset;
>> +    ctx->uninstalling =3D !reset;
>> +    qemu_rec_mutex_unlock(&plugin.lock);
>> +
>> +    data =3D g_new(struct qemu_plugin_reset_data, 1);
>> +    data->ctx =3D ctx;
>> +    data->cb =3D cb;
>> +    data->reset =3D reset;
>> +    /*
>> +     * Only flush the code cache if the vCPUs have been created. If so,
>> +     * current_cpu must be non-NULL.
>> +     */
>> +    if (current_cpu) {
>> +        async_safe_run_on_cpu(current_cpu, plugin_flush_destroy,
>> +                              RUN_ON_CPU_HOST_PTR(data));
>> +    } else {
>> +        /*
>> +         * If current_cpu isn't set, then we don't have yet any vCPU th=
reads
>> +         * and we therefore can remove the callbacks synchronously.
>> +         */
>> +        plugin_reset_destroy(data);
>> +    }
>> +}
>> diff --git a/plugins/plugin.h b/plugins/plugin.h
>> new file mode 100644
>> index 0000000000..e89f9ef0ea
>> --- /dev/null
>> +++ b/plugins/plugin.h
>> @@ -0,0 +1,95 @@
>> +/*
>> + * Plugin Shared Internal Functions
>> + *
>> + * Copyright (C) 2019, Linaro
>> + *
>> + * License: GNU GPL, version 2 or later.
>> + *   See the COPYING file in the top-level directory.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#ifndef _PLUGIN_INTERNAL_H_
>> +#define _PLUGIN_INTERNAL_H_
>> +
>> +/* global state */
>> +struct qemu_plugin_state {
>> +    QTAILQ_HEAD(, qemu_plugin_ctx) ctxs;
>> +    QLIST_HEAD(, qemu_plugin_cb) cb_lists[QEMU_PLUGIN_EV_MAX];
>> +    /*
>> +     * Use the HT as a hash map by inserting k =3D=3D v, which saves me=
mory as
>> +     * documented by GLib. The parent struct is obtained with container=
_of().
>> +     */
>> +    GHashTable *id_ht;
>> +    /*
>> +     * Use the HT as a hash map. Note that we could use a list here,
>> +     * but with the HT we avoid adding a field to CPUState.
>> +     */
>> +    GHashTable *cpu_ht;
>> +    DECLARE_BITMAP(mask, QEMU_PLUGIN_EV_MAX);
>> +    /*
>> +     * @lock protects the struct as well as ctx->uninstalling.
>> +     * The lock must be acquired by all API ops.
>> +     * The lock is recursive, which greatly simplifies things, e.g.
>> +     * callback registration from qemu_plugin_vcpu_for_each().
>> +     */
>> +    QemuRecMutex lock;
>> +    /*
>> +     * HT of callbacks invoked from helpers. All entries are freed when
>> +     * the code cache is flushed.
>> +     */
>> +    struct qht dyn_cb_arr_ht;
>> +};
>> +
>> +
>> +struct qemu_plugin_ctx {
>> +    void *handle; /* dlopen */
>> +    qemu_plugin_id_t id;
>> +    struct qemu_plugin_cb *callbacks[QEMU_PLUGIN_EV_MAX];
>> +    QTAILQ_ENTRY(qemu_plugin_ctx) entry;
>> +    /*
>> +     * keep a reference to @desc until uninstall, so that plugins do no=
t have
>> +     * to strdup plugin args.
>> +     */
>> +    struct qemu_plugin_desc *desc;
>> +    bool installing;
>> +    bool uninstalling;
>> +    bool resetting;
>> +};
>> +
>> +struct qemu_plugin_ctx *plugin_id_to_ctx_locked(qemu_plugin_id_t id);
>> +
>> +void plugin_register_inline_op(GArray **arr,
>> +                               enum qemu_plugin_mem_rw rw,
>> +                               enum qemu_plugin_op op, void *ptr,
>> +                               uint64_t imm);
>> +
>> +void plugin_reset_uninstall(qemu_plugin_id_t id,
>> +                            qemu_plugin_simple_cb_t cb,
>> +                            bool reset);
>> +
>> +void plugin_register_cb(qemu_plugin_id_t id, enum qemu_plugin_event ev,
>> +                        void *func);
>> +
>> +void plugin_unregister_cb__locked(struct qemu_plugin_ctx *ctx,
>> +                                  enum qemu_plugin_event ev);
>> +
>> +void
>> +plugin_register_cb_udata(qemu_plugin_id_t id, enum qemu_plugin_event ev,
>> +                         void *func, void *udata);
>> +
>> +void
>> +plugin_register_dyn_cb__udata(GArray **arr,
>> +                              qemu_plugin_vcpu_udata_cb_t cb,
>> +                              enum qemu_plugin_cb_flags flags, void *ud=
ata);
>> +
>> +
>> +void plugin_register_vcpu_mem_cb(GArray **arr,
>> +                                 void *cb,
>> +                                 enum qemu_plugin_cb_flags flags,
>> +                                 enum qemu_plugin_mem_rw rw,
>> +                                 void *udata, bool haddr);
>> +
>> +void exec_inline_op(struct qemu_plugin_dyn_cb *cb);
>> +
>> +#endif /* _PLUGIN_INTERNAL_H_ */
>> --
>> 2.20.1
>>
>>


--
Alex Benn=C3=A9e

