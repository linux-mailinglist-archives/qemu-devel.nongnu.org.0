Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252615FB22
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 17:42:40 +0200 (CEST)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hj3sd-0004Hl-Cs
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 11:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40250)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hj3qT-0002q6-29
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 11:40:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hj3qQ-0007FS-Qe
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 11:40:24 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hj3qQ-0007Ed-HB
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 11:40:22 -0400
Received: by mail-wm1-x341.google.com with SMTP id c6so6617165wml.0
 for <qemu-devel@nongnu.org>; Thu, 04 Jul 2019 08:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Jp1lLK1yxViRUuVuk+/5oYC1bk63kQhjbFbQSONbWik=;
 b=JDaY3wbA/J6+PHwzpl6yBp8K01ayIm/ZBWczOz7jNdk0Yi9nPzCqq8ykQwT0WDYRMV
 p7SYyiaO6VpWmVqpIH1C5eQ6mdG54JcYGxQias3wvaOOTq7iIs4oeooF3oDEPye7cI4e
 qbLH8Tlmy1ub96EswsRVQhzhx7PwiyEbInODA58p1EMwnzp32GbczklYE/KK/M1DCA3l
 NXd1i7RwlRjOznKodMdOnEUv5UMckUhPajkivCYba0c12MSaJk3e8PTPdyLHnOzebCTg
 GufDnLlYgj/F7awh9SXlq169ZpgWSWqvap3tuYQdfg32lW5nW0KCWu7MozLS0sekC6sb
 +XVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Jp1lLK1yxViRUuVuk+/5oYC1bk63kQhjbFbQSONbWik=;
 b=tk6w2KAx9B6fk8PnQh1AlKTd0OCTsGQWP592nVqlwL5fZ8HYnVnRAYL9kWryqzGteS
 0s3pn/LC/WPNOMBQ6G3llN7Cnro8BcqcMPNG+3kDNHvUe/ZKA1D0Qe10PrQsxu0evHDC
 Yfwfe4EKbKTTXMAOEaq2sycWd8DRKMvJrhgvgIVvnQVxEQ0a9D5uJR636+jL0scXSUSr
 wqWXSAuqtSc9LsbDe0a+ZdTyTn30Nrm2bnIsVu9KuuMC0O3d2dVeYeEKvubsKCe+nA0d
 81KhEy4I9VURzisTI/Htr7dHLIbLACq9L0829ndiF6s8aX/MFbgrlhjCWL7FTdxkWVK9
 k4qg==
X-Gm-Message-State: APjAAAUwauK3P8K5ZTX6aRpKMtgK1zRzL5ymO3y1f8G0QkT/IHMCME3Q
 zdr5bFoeKpyy3ZcEdvCHBRsz0w==
X-Google-Smtp-Source: APXvYqxd0mn/yDw9kJ30S9xJJwLQd9QD3FL/LxlM4j/b1+Of2qwBKXgaMXtSdbWck5TfFyqKYp0Yjw==
X-Received: by 2002:a7b:c933:: with SMTP id h19mr158509wml.52.1562254821162;
 Thu, 04 Jul 2019 08:40:21 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id a81sm5122142wmh.3.2019.07.04.08.40.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 08:40:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39FD91FF87;
 Thu,  4 Jul 2019 16:40:20 +0100 (BST)
References: <20190702210017.4275-1-vandersonmr2@gmail.com>
 <20190702210017.4275-4-vandersonmr2@gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190702210017.4275-4-vandersonmr2@gmail.com>
Date: Thu, 04 Jul 2019 16:40:20 +0100
Message-ID: <875zohx0yj.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v3 4/6] util/log: introduce dump of tbstats
 and -d hot_tbs:limit
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 vandersonmr <vandersonmr2@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


vandersonmr <vandersonmr2@gmail.com> writes:

> add option to dump the N most hot TB blocks.
> -d hot_tbs:N
> and also add all tbstats dump functions.
>
> Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
> ---
>  accel/tcg/Makefile.objs      |   1 +
>  accel/tcg/tb-stats.c         | 293 +++++++++++++++++++++++++++++++++++
>  include/exec/cpu-all.h       |  43 +++++
>  include/qemu/log-for-trace.h |   2 +
>  include/qemu/log.h           |   1 +
>  linux-user/exit.c            |   3 +
>  util/log.c                   |  35 ++++-
>  7 files changed, 370 insertions(+), 8 deletions(-)
>  create mode 100644 accel/tcg/tb-stats.c
>
> diff --git a/accel/tcg/Makefile.objs b/accel/tcg/Makefile.objs
> index d381a02f34..59d50d2dc5 100644
> --- a/accel/tcg/Makefile.objs
> +++ b/accel/tcg/Makefile.objs
> @@ -3,6 +3,7 @@ obj-$(CONFIG_SOFTMMU) +=3D cputlb.o
>  obj-y +=3D tcg-runtime.o tcg-runtime-gvec.o
>  obj-y +=3D cpu-exec.o cpu-exec-common.o translate-all.o
>  obj-y +=3D translator.o
> +obj-y +=3D tb-stats.o
>
>  obj-$(CONFIG_USER_ONLY) +=3D user-exec.o
>  obj-$(call lnot,$(CONFIG_SOFTMMU)) +=3D user-exec-stub.o
> diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
> new file mode 100644
> index 0000000000..922023f29d
> --- /dev/null
> +++ b/accel/tcg/tb-stats.c
> @@ -0,0 +1,293 @@
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +/* XXX: I'm not sure what includes could be safely removed */

In general start with osdep and maybe qemu-common.h and only add what
you need.

> +#define NO_CPU_IO_DEFS
> +#include "cpu.h"
> +#include "trace.h"
> +#include "disas/disas.h"
> +#include "exec/exec-all.h"
> +#include "tcg.h"
> +#if defined(CONFIG_USER_ONLY)
> +#include "qemu.h"
> +#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> +#include <sys/param.h>
> +#if __FreeBSD_version >=3D 700104
> +#define HAVE_KINFO_GETVMMAP
> +#define sigqueue sigqueue_freebsd  /* avoid redefinition */
> +#include <sys/proc.h>
> +#include <machine/profile.h>
> +#define _KERNEL
> +#include <sys/user.h>
> +#undef _KERNEL
> +#undef sigqueue
> +#include <libutil.h>
> +#endif
> +#endif
> +#else
> +#include "exec/ram_addr.h"
> +#endif
> +
> +#include "qemu/qemu-print.h"
> +
> +
> +/* only accessed in safe work */
> +static GList *last_search;
> +
> +static void collect_tb_stats(void *p, uint32_t hash, void *userp)
> +{
> +    last_search =3D g_list_prepend(last_search, p);
> +}
> +
> +static void dump_tb_header(TBStatistics *tbs)
> +{
> +    qemu_log("TB%d: phys:0x"TB_PAGE_ADDR_FMT" virt:0x"TARGET_FMT_lx
> +             " flags:%#08x (trans:%lu uncached:%lu exec:%lu ints: g:%u o=
p:%u h:%u h/g: %f)\n",
> +             tbs->display_id,
> +             tbs->phys_pc, tbs->pc, tbs->flags,
> +             tbs->translations.total, tbs->translations.uncached,
> +             tbs->executions.total,
> +             tbs->code.num_guest_inst,
> +             tbs->code.num_tcg_inst,
> +             tbs->code.num_host_inst,
> +             tbs->code.num_guest_inst ?
> +                ((float) tbs->code.num_host_inst / tbs->code.num_guest_i=
nst) :
> +                0);
> +}
> +
> +static gint
> +inverse_sort_tbs(gconstpointer p1, gconstpointer p2, gpointer psort_by)
> +{
> +    const TBStatistics *tbs1 =3D (TBStatistics *) p1;
> +    const TBStatistics *tbs2 =3D (TBStatistics *) p2;
> +    int sort_by =3D *((int *) psort_by);
> +    unsigned long c1 =3D 0;
> +    unsigned long c2 =3D 0;
> +
> +    if (likely(sort_by =3D=3D SORT_BY_HOTNESS)) {
> +        c1 =3D tbs1->executions.total;
> +        c2 =3D tbs2->executions.total;
> +    } else if (likely(sort_by =3D=3D SORT_BY_HG)) {
> +        if (tbs1->code.num_guest_inst =3D=3D 0) {
> +            return -1;
> +        }
> +        if (tbs2->code.num_guest_inst =3D=3D 0) {
> +            return 1;
> +        }
> +
> +        float a =3D (float) tbs1->code.num_host_inst / tbs1->code.num_gu=
est_inst;
> +        float b =3D (float) tbs2->code.num_host_inst / tbs2->code.num_gu=
est_inst;
> +        c1 =3D a <=3D b ? 0 : 1;
> +        c2 =3D a <=3D b ? 1 : 0;
> +    }
> +
> +
> +    return c1 < c2 ? 1 : c1 =3D=3D c2 ? 0 : -1;
> +}
> +
> +
> +static void do_dump_coverset_info(int percentage)
> +{
> +    uint64_t total_exec_count =3D 0;
> +    uint64_t covered_exec_count =3D 0;
> +    unsigned coverset_size =3D 0;
> +    int id =3D 1;
> +    GList *i;
> +
> +    g_list_free(last_search);
> +    last_search =3D NULL;
> +
> +    /* XXX: we could pass user data to collect_tb_stats to filter */
> +    qht_iter(&tb_ctx.tb_stats, collect_tb_stats, NULL);
> +
> +    last_search =3D g_list_sort_with_data(last_search, inverse_sort_tbs,
> +                                        SORT_BY_HOTNESS);
> +
> +    /* Compute total execution count for all tbs */
> +    for (i =3D last_search; i; i =3D i->next) {
> +        TBStatistics *tbs =3D (TBStatistics *) i->data;
> +        total_exec_count +=3D tbs->executions.total;
> +    }
> +
> +    for (i =3D last_search; i; i =3D i->next) {
> +        TBStatistics *tbs =3D (TBStatistics *) i->data;
> +        covered_exec_count +=3D tbs->executions.total;
> +        tbs->display_id =3D id++;
> +        coverset_size++;
> +        dump_tb_header(tbs);
> +
> +        /* Iterate and display tbs until reach the percentage count cove=
r */
> +        if (((double) covered_exec_count / total_exec_count) >
> +                ((double) percentage / 100)) {
> +            break;
> +        }
> +    }
> +
> +    qemu_log("\n------------------------------\n");
> +    qemu_log("# of TBs to reach %d%% of the total exec count: %u\t",
> +                percentage, coverset_size);
> +    qemu_log("Total exec count: %lu\n", total_exec_count);
> +    qemu_log("\n------------------------------\n");
> +
> +    /* free the unused bits */
> +    i->next->prev =3D NULL;
> +    g_list_free(i->next);
> +    i->next =3D NULL;
> +}
> +
> +
> +static void do_dump_tbs_info(int count, int sort_by)
> +{
> +    int id =3D 1;
> +    GList *i;
> +
> +    g_list_free(last_search);
> +    last_search =3D NULL;
> +
> +    /* XXX: we could pass user data to collect_tb_stats to filter */
> +    qht_iter(&tb_ctx.tb_stats, collect_tb_stats, NULL);
> +
> +    last_search =3D g_list_sort_with_data(last_search, inverse_sort_tbs,
> +                                        &sort_by);
> +
> +    for (i =3D last_search; i && count--; i =3D i->next) {
> +        TBStatistics *tbs =3D (TBStatistics *) i->data;
> +        tbs->display_id =3D id++;
> +        dump_tb_header(tbs);
> +    }
> +
> +    /* free the unused bits */
> +    if (i && i->next) {
> +        i->next->prev =3D NULL;
> +    }
> +    g_list_free(i->next);
> +    i->next =3D NULL;
> +}
> +
> +static void
> +do_dump_coverset_info_safe(CPUState *cpu, run_on_cpu_data percentage)
> +{
> +    qemu_log_to_monitor(true);
> +    do_dump_coverset_info(percentage.host_int);
> +    qemu_log_to_monitor(false);
> +}
> +
> +struct tbs_dump_info {
> +    int count;
> +    int sort_by;
> +};
> +
> +static void do_dump_tbs_info_safe(CPUState *cpu, run_on_cpu_data tbdi)
> +{
> +    struct tbs_dump_info *info =3D tbdi.host_ptr;
> +    qemu_log_to_monitor(true);
> +    do_dump_tbs_info(info->count, info->sort_by);
> +    qemu_log_to_monitor(false);
> +    g_free(info);
> +}
> +
> +/*
> + * When we dump_tbs_info on a live system via the HMP we want to
> + * ensure the system is quiessent before we start outputting stuff.
> + * Otherwise we could pollute the output with other logging output.
> + */
> +void dump_coverset_info(int percentage, bool use_monitor)
> +{
> +    if (use_monitor) {
> +        async_safe_run_on_cpu(first_cpu, do_dump_coverset_info_safe,
> +                              RUN_ON_CPU_HOST_INT(percentage));
> +    } else {
> +        do_dump_coverset_info(percentage);
> +    }
> +}
> +
> +void dump_tbs_info(int count, int sort_by, bool use_monitor)
> +{
> +    if (use_monitor) {
> +        struct tbs_dump_info *tbdi =3D g_new(struct tbs_dump_info, 1);
> +        tbdi->count =3D count;
> +        tbdi->sort_by =3D sort_by;
> +        async_safe_run_on_cpu(first_cpu, do_dump_tbs_info_safe,
> +                              RUN_ON_CPU_HOST_PTR(tbdi));
> +    } else {
> +        do_dump_tbs_info(count, sort_by);
> +    }
> +}
> +
> +static void do_tb_dump_with_statistics(TBStatistics *tbs, int log_flags)
> +{
> +    CPUState *cpu =3D current_cpu;
> +    uint32_t cflags =3D curr_cflags() | CF_NOCACHE;
> +    int old_log_flags =3D qemu_loglevel;
> +    TranslationBlock *tb =3D NULL;
> +
> +    qemu_set_log(log_flags);
> +
> +    qemu_log("\n------------------------------\n");
> +    dump_tb_header(tbs);
> +
> +    if (sigsetjmp(cpu->jmp_env, 0) =3D=3D 0) {
> +        mmap_lock();
> +        tb =3D tb_gen_code(cpu, tbs->pc, tbs->cs_base, tbs->flags, cflag=
s);
> +        tb_phys_invalidate(tb, -1);
> +        mmap_unlock();
> +    } else {
> +        /*
> +         * The mmap_lock is dropped by tb_gen_code if it runs out of
> +         * memory.
> +         */
> +        fprintf(stderr, "%s: dbg failed!\n", __func__);
> +        assert_no_pages_locked();
> +    }
> +
> +    qemu_set_log(old_log_flags);
> +
> +    tcg_tb_remove(tb);
> +}
> +
> +struct tb_dump_info {
> +    int id;
> +    int log_flags;
> +    bool use_monitor;
> +};
> +
> +static void do_dump_tb_info_safe(CPUState *cpu, run_on_cpu_data info)
> +{
> +    struct tb_dump_info *tbdi =3D (struct tb_dump_info *) info.host_ptr;
> +    GList *iter;
> +
> +    if (!last_search) {
> +        qemu_printf("no search on record");
> +        return;
> +    }
> +    qemu_log_to_monitor(tbdi->use_monitor);
> +
> +    for (iter =3D last_search; iter; iter =3D g_list_next(iter)) {
> +        TBStatistics *tbs =3D iter->data;
> +        if (tbs->display_id =3D=3D tbdi->id) {
> +            do_tb_dump_with_statistics(tbs, tbdi->log_flags);
> +        }
> +    }
> +    qemu_log_to_monitor(false);
> +    g_free(tbdi);
> +}
> +
> +/* XXX: only from monitor? */
> +void dump_tb_info(int id, int log_mask, bool use_monitor)
> +{
> +    struct tb_dump_info *tbdi =3D g_new(struct tb_dump_info, 1);
> +
> +    tbdi->id =3D id;
> +    tbdi->log_flags =3D log_mask;
> +    tbdi->use_monitor =3D use_monitor;
> +
> +    async_safe_run_on_cpu(first_cpu, do_dump_tb_info_safe,
> +                          RUN_ON_CPU_HOST_PTR(tbdi));
> +
> +    /* tbdi free'd by do_dump_tb_info_safe */
> +}
> +
> +void clean_tbstats_info(void)
> +{
> +/* TODO: remove all tb_stats */
> +}
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 536ea58f81..c4bfad75d3 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -365,6 +365,49 @@ void dump_exec_info(void);
>  void dump_opcount_info(void);
>  #endif /* !CONFIG_USER_ONLY */
>
> +/**
> + * dump_coverset_info: report the hottest blocks to cover n% of execution
> + *
> + * @percentage: cover set percentage
> + * @use_monitor: redirect output to monitor
> + *
> + * Report the hottest blocks to either the log or monitor
> + */
> +void dump_coverset_info(int percentage, bool use_monitor);
> +
> +#define SORT_BY_HOTNESS 0
> +#define SORT_BY_HG 1
> +
> +/**
> + * dump_tbs_info: report the hottest blocks
> + *
> + * @count: the limit of hotblocks
> + * @sort_by: property in which the dump will be sorted
> + * @use_monitor: redirect output to monitor
> + *
> + * Report the hottest blocks to either the log or monitor
> + */
> +void dump_tbs_info(int count, int sort_by, bool use_monitor);
> +
> +/**
> + * dump_tb_info: dump information about one TB
> + *
> + * @id: the display id of the block (from previous search)
> + * @mask: the temporary logging mask
> + * @Use_monitor: redirect output to monitor
> + *
> + * Re-run a translation of a block at addr for the purposes of debug out=
put
> + */
> +void dump_tb_info(int id, int log_mask, bool use_monitor);
> +
> +/**
> + * clean_tbstats_info: remove all tb_stats information
> + *
> + */
> +void clean_tbstats_info(void);
> +
> +
> +
>  int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
>                          uint8_t *buf, target_ulong len, int is_write);
>
> diff --git a/include/qemu/log-for-trace.h b/include/qemu/log-for-trace.h
> index 2f0a5b080e..d65eb83037 100644
> --- a/include/qemu/log-for-trace.h
> +++ b/include/qemu/log-for-trace.h
> @@ -21,6 +21,8 @@
>  /* Private global variable, don't use */
>  extern int qemu_loglevel;
>
> +extern int32_t max_num_hot_tbs_to_dump;
> +
>  #define LOG_TRACE          (1 << 15)
>
>  /* Returns true if a bit is set in the current loglevel mask */
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index 2fca65dd01..240b71f66a 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -114,6 +114,7 @@ typedef struct QEMULogItem {
>  extern const QEMULogItem qemu_log_items[];
>
>  void qemu_set_log(int log_flags);
> +void qemu_log_to_monitor(bool enable);
>  void qemu_log_needs_buffers(void);
>  void qemu_set_log_filename(const char *filename, Error **errp);
>  void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
> diff --git a/linux-user/exit.c b/linux-user/exit.c
> index bdda720553..295d3f4cad 100644
> --- a/linux-user/exit.c
> +++ b/linux-user/exit.c
> @@ -28,6 +28,9 @@ extern void __gcov_dump(void);
>
>  void preexit_cleanup(CPUArchState *env, int code)
>  {
> +    if (qemu_loglevel_mask(CPU_LOG_HOT_TBS)) {
> +        dump_tbs_info(max_num_hot_tbs_to_dump, SORT_BY_HOTNESS, false);
> +    }
>  #ifdef TARGET_GPROF
>          _mcleanup();
>  #endif
> diff --git a/util/log.c b/util/log.c
> index 1d1b33f7d9..c0f1e9980f 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -19,6 +19,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "qemu/qemu-print.h"
>  #include "qemu/range.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> @@ -30,21 +31,26 @@ FILE *qemu_logfile;
>  int qemu_loglevel;
>  static int log_append =3D 0;
>  static GArray *debug_regions;
> +int32_t max_num_hot_tbs_to_dump;
> +static bool to_monitor;
>
>  /* Return the number of characters emitted.  */
>  int qemu_log(const char *fmt, ...)
>  {
>      int ret =3D 0;
> -    if (qemu_logfile) {
> -        va_list ap;
> -        va_start(ap, fmt);
> +    va_list ap;
> +    va_start(ap, fmt);
> +
> +    if (to_monitor) {
> +        ret =3D qemu_vprintf(fmt, ap);
> +    } else if (qemu_logfile) {
>          ret =3D vfprintf(qemu_logfile, fmt, ap);
> -        va_end(ap);
> +    }
> +    va_end(ap);
>
> -        /* Don't pass back error results.  */
> -        if (ret < 0) {
> -            ret =3D 0;
> -        }
> +    /* Don't pass back error results.  */
> +    if (ret < 0) {
> +        ret =3D 0;
>      }
>      return ret;
>  }
> @@ -99,6 +105,11 @@ void qemu_set_log(int log_flags)
>      }
>  }
>
> +void qemu_log_to_monitor(bool enable)
> +{
> +    to_monitor =3D enable;
> +}
> +
>  void qemu_log_needs_buffers(void)
>  {
>      log_uses_own_buffers =3D true;
> @@ -273,6 +284,9 @@ const QEMULogItem qemu_log_items[] =3D {
>      { CPU_LOG_TB_NOCHAIN, "nochain",
>        "do not chain compiled TBs so that \"exec\" and \"cpu\" show\n"
>        "complete traces" },
> +    { CPU_LOG_HOT_TBS, "hot_tbs(:limit)",
> +      "show TBs (until given a limit) ordered by their hotness.\n"
> +      "(if no limit is given, show all)" },
>      { 0, NULL, NULL },
>  };
>
> @@ -294,6 +308,11 @@ int qemu_str_to_log_mask(const char *str)
>              trace_enable_events((*tmp) + 6);
>              mask |=3D LOG_TRACE;
>  #endif
> +        } else if (g_str_has_prefix(*tmp, "hot_tbs")) {
> +            if (g_str_has_prefix(*tmp, "hot_tbs:") && (*tmp)[8] !=3D '\0=
') {
> +                max_num_hot_tbs_to_dump =3D atoi((*tmp) + 8);
> +            }
> +            mask |=3D CPU_LOG_HOT_TBS;
>          } else {
>              for (item =3D qemu_log_items; item->mask !=3D 0; item++) {
>                  if (g_str_equal(*tmp, item->name)) {


--
Alex Benn=C3=A9e

