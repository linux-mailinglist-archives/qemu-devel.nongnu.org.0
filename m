Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D709D490024
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 03:21:09 +0100 (CET)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Hds-0000Ux-GD
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 21:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9HcK-0008Ch-1Z
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 21:19:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9HcF-00008D-J8
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 21:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642385966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5OaWw/sLdwWvB5Fj14dtPyG7/9OSLR+8SIwm07VdAk=;
 b=H/FLkY7CqfD6ar/YbvZl+RB3OTFnhgnQtUmF+/rHNpZDmnAp59xdp98vejd6TE/VCcG8Tg
 2pptQ+bZS9f3wa03C7lLMiHDKg9uZje64qsi8RRFBpwyHgPvPHjxD/zJSCX2PedJtuVsHZ
 WLy7nsrnbz2JL5MwX6eJZEL4QaFrKZc=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-r9s7_JCxM_GWh47FhHGryw-1; Sun, 16 Jan 2022 21:19:25 -0500
X-MC-Unique: r9s7_JCxM_GWh47FhHGryw-1
Received: by mail-pf1-f200.google.com with SMTP id
 v6-20020aa799c6000000b004bd635ff848so5294265pfi.6
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 18:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=I5OaWw/sLdwWvB5Fj14dtPyG7/9OSLR+8SIwm07VdAk=;
 b=0mgtICUi4MoPdBhFqv/CreVBbssgk3HTStLl9EB+4H2e98RNrB7tp55kzgzAtNtJyK
 9i4dnx/MrsaM5R1Cl3gvjxuDUAb2XEL8nmGtlJwrE66L9MHZ8f5Ndx+MUwwN0PamTMg2
 l25G1NBSouXGSPpNuMz73zGJnVt6abSYq3dhpV9xKGxUuHwRlzWQrAQSC3GkMxXv7U73
 HzkO2+tVEJ3rElP6YihN0mtTureORgQzzPAhknthI7nByH+g5bcGm2u+vOGlHTo1xowp
 pUylrFhd9aVqnwo7+zZH6WhcLMRw3QgdhyPmSHKZZ5wOm+qown8Jz8W9el8DCranwWyG
 Tb/g==
X-Gm-Message-State: AOAM531ksGcLmiSKgoESARrlcX8uI0aWeR6KsxjVM/06NCsLSXvY0bxD
 LF+vgofS1w5wD2DWUuSWFgir+wSfi07PgOUGi2mrdMSCP0lKb47c0SvLk/wMcr3oqcEsyqetfqq
 gXSrcIxortR29jgA=
X-Received: by 2002:a17:902:9049:b0:149:e660:5b93 with SMTP id
 w9-20020a170902904900b00149e6605b93mr20457151plz.115.1642385962580; 
 Sun, 16 Jan 2022 18:19:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0PYuL7WwGJ+fln0JejsT8nKlqUGR/hU/SI2k3TjPG1+ihqN84ugClqvcQ4RzUklZ3CmjI/A==
X-Received: by 2002:a17:902:9049:b0:149:e660:5b93 with SMTP id
 w9-20020a170902904900b00149e6605b93mr20457132plz.115.1642385962223; 
 Sun, 16 Jan 2022 18:19:22 -0800 (PST)
Received: from xz-m1.local ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id e10sm2738070pgk.5.2022.01.16.18.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 18:19:21 -0800 (PST)
Date: Mon, 17 Jan 2022 10:19:14 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v11 1/4] migration/dirtyrate: refactor dirty page rate
 calculation
Message-ID: <YeTSIh2Osx7Yrjle@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <7cc032ae98e29471de57c00d3c0bd0fc5129ae23.1641316375.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <7cc032ae98e29471de57c00d3c0bd0fc5129ae23.1641316375.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 01:14:06AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> abstract out dirty log change logic into function
> global_dirty_log_change.
> 
> abstract out dirty page rate calculation logic via
> dirty-ring into function vcpu_calculate_dirtyrate.
> 
> abstract out mathematical dirty page rate calculation
> into do_calculate_dirtyrate, decouple it from DirtyStat.
> 
> rename set_sample_page_period to dirty_stat_wait, which
> is well-understood and will be reused in dirtylimit.
> 
> add cpu_list_lock to protect cpu list before walking
> through it in case of race against cpu hotplug/unplug.
> 
> export util functions outside migration.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  include/sysemu/dirtyrate.h |  29 ++++++
>  migration/dirtyrate.c      | 220 ++++++++++++++++++++++++++++-----------------
>  migration/dirtyrate.h      |   7 +-
>  3 files changed, 171 insertions(+), 85 deletions(-)
>  create mode 100644 include/sysemu/dirtyrate.h
> 
> diff --git a/include/sysemu/dirtyrate.h b/include/sysemu/dirtyrate.h
> new file mode 100644
> index 0000000..cb6f02b
> --- /dev/null
> +++ b/include/sysemu/dirtyrate.h
> @@ -0,0 +1,29 @@
> +/*
> + * dirty page rate helper functions
> + *
> + * Copyright (c) 2022 CHINA TELECOM CO.,LTD.
> + *
> + * Authors:
> + *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef QEMU_DIRTYRATE_H
> +#define QEMU_DIRTYRATE_H
> +
> +typedef struct VcpuStat {
> +    int nvcpu; /* number of vcpu */
> +    DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
> +} VcpuStat;
> +
> +int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
> +                                 int64_t init_time_ms,
> +                                 VcpuStat *stat,
> +                                 unsigned int flag,
> +                                 bool one_shot);
> +
> +void global_dirty_log_change(unsigned int flag,
> +                             bool start);
> +#endif
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index d65e744..1407455 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -46,7 +46,7 @@ static struct DirtyRateStat DirtyStat;
>  static DirtyRateMeasureMode dirtyrate_mode =
>                  DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
>  
> -static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
> +static int64_t dirty_stat_wait(int64_t msec, int64_t initial_time)
>  {
>      int64_t current_time;
>  
> @@ -60,6 +60,128 @@ static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
>      return msec;
>  }
>  
> +static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
> +                                     CPUState *cpu, bool start)
> +{
> +    if (start) {
> +        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
> +    } else {
> +        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
> +    }
> +}
> +
> +static int64_t do_calculate_dirtyrate(DirtyPageRecord dirty_pages,
> +                                      int64_t calc_time_ms)
> +{
> +    uint64_t memory_size_MB;
> +    uint64_t increased_dirty_pages =
> +        dirty_pages.end_pages - dirty_pages.start_pages;
> +
> +    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
> +
> +    return memory_size_MB * 1000 / calc_time_ms;
> +}
> +
> +void global_dirty_log_change(unsigned int flag, bool start)
> +{
> +    qemu_mutex_lock_iothread();
> +    if (start) {
> +        memory_global_dirty_log_start(flag);
> +    } else {
> +        memory_global_dirty_log_stop(flag);
> +    }
> +    qemu_mutex_unlock_iothread();
> +}
> +
> +/*
> + * global_dirty_log_sync
> + * 1. sync dirty log from kvm
> + * 2. stop dirty tracking if needed.
> + */
> +static void global_dirty_log_sync(unsigned int flag, bool one_shot)
> +{
> +    qemu_mutex_lock_iothread();
> +    memory_global_dirty_log_sync();
> +    if (one_shot) {
> +        memory_global_dirty_log_stop(flag);
> +    }
> +    qemu_mutex_unlock_iothread();
> +}
> +
> +static DirtyPageRecord *vcpu_dirty_stat_alloc(VcpuStat *stat)
> +{
> +    CPUState *cpu;
> +    DirtyPageRecord *records;
> +    int nvcpu = 0;
> +
> +    CPU_FOREACH(cpu) {
> +        nvcpu++;
> +    }
> +
> +    stat->nvcpu = nvcpu;
> +    stat->rates = g_malloc0(sizeof(DirtyRateVcpu) * nvcpu);
> +
> +    records = g_malloc0(sizeof(DirtyPageRecord) * nvcpu);
> +
> +    return records;
> +}
> +
> +static void vcpu_dirty_stat_collect(VcpuStat *stat,
> +                                    DirtyPageRecord *records,
> +                                    bool start)
> +{
> +    CPUState *cpu;
> +
> +    CPU_FOREACH(cpu) {
> +        if (!start && cpu->cpu_index >= stat->nvcpu) {
> +            /*
> +             * Never go there unless cpu is hot-plugged,
> +             * just ignore in this case.
> +             */
> +            continue;
> +        }

As commented before, I think the only way to do it right is does not allow cpu
plug/unplug during measurement..

Say, even if index didn't get out of range, an unplug even should generate very
stange output of the unplugged cpu.  Please see more below.

> +        record_dirtypages(records, cpu, start);
> +    }
> +}
> +
> +int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
> +                                 int64_t init_time_ms,
> +                                 VcpuStat *stat,
> +                                 unsigned int flag,
> +                                 bool one_shot)
> +{
> +    DirtyPageRecord *records;
> +    int64_t duration;
> +    int64_t dirtyrate;
> +    int i = 0;
> +
> +    cpu_list_lock();
> +    records = vcpu_dirty_stat_alloc(stat);
> +    vcpu_dirty_stat_collect(stat, records, true);
> +    cpu_list_unlock();

Continue with above - then I'm wondering whether we should just keep taking the
lock until vcpu_dirty_stat_collect().

Yes we could be taking the lock for a long time because of the sleep, but the
main thread plug thread will just wait for it to complete and it is at least
not a e.g. deadlock.

The other solution is we do cpu_list_unlock() like this, but introduce another
cpu_list_generation_id and boost it after any plug/unplug of cpu, aka, when cpu
list changes.

Then we record cpu generation ID at the entry of this function and retry the
whole measurement if at some point we found generation ID changed (we need to
fetch the gen ID after having the lock, of course).  That could avoid us taking
the cpu list lock during dirty_stat_wait(), but it'll start to complicate cpu
list locking rules.

The simpler way is still just to take the lock, imho.

The rest looks good, thanks.

> +
> +    duration = dirty_stat_wait(calc_time_ms, init_time_ms);
> +
> +    global_dirty_log_sync(flag, one_shot);
> +
> +    cpu_list_lock();
> +    vcpu_dirty_stat_collect(stat, records, false);
> +    cpu_list_unlock();
> +
> +    for (i = 0; i < stat->nvcpu; i++) {
> +        dirtyrate = do_calculate_dirtyrate(records[i], duration);
> +
> +        stat->rates[i].id = i;
> +        stat->rates[i].dirty_rate = dirtyrate;
> +
> +        trace_dirtyrate_do_calculate_vcpu(i, dirtyrate);
> +    }
> +
> +    g_free(records);
> +
> +    return duration;
> +}
> +
>  static bool is_sample_period_valid(int64_t sec)
>  {
>      if (sec < MIN_FETCH_DIRTYRATE_TIME_SEC ||
> @@ -396,44 +518,6 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
>      return true;
>  }
>  
> -static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
> -                                     CPUState *cpu, bool start)
> -{
> -    if (start) {
> -        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
> -    } else {
> -        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
> -    }
> -}
> -
> -static void dirtyrate_global_dirty_log_start(void)
> -{
> -    qemu_mutex_lock_iothread();
> -    memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
> -    qemu_mutex_unlock_iothread();
> -}
> -
> -static void dirtyrate_global_dirty_log_stop(void)
> -{
> -    qemu_mutex_lock_iothread();
> -    memory_global_dirty_log_sync();
> -    memory_global_dirty_log_stop(GLOBAL_DIRTY_DIRTY_RATE);
> -    qemu_mutex_unlock_iothread();
> -}
> -
> -static int64_t do_calculate_dirtyrate_vcpu(DirtyPageRecord dirty_pages)
> -{
> -    uint64_t memory_size_MB;
> -    int64_t time_s;
> -    uint64_t increased_dirty_pages =
> -        dirty_pages.end_pages - dirty_pages.start_pages;
> -
> -    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
> -    time_s = DirtyStat.calc_time;
> -
> -    return memory_size_MB / time_s;
> -}
> -
>  static inline void record_dirtypages_bitmap(DirtyPageRecord *dirty_pages,
>                                              bool start)
>  {
> @@ -444,11 +528,6 @@ static inline void record_dirtypages_bitmap(DirtyPageRecord *dirty_pages,
>      }
>  }
>  
> -static void do_calculate_dirtyrate_bitmap(DirtyPageRecord dirty_pages)
> -{
> -    DirtyStat.dirty_rate = do_calculate_dirtyrate_vcpu(dirty_pages);
> -}
> -
>  static inline void dirtyrate_manual_reset_protect(void)
>  {
>      RAMBlock *block = NULL;
> @@ -492,71 +571,52 @@ static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
>      DirtyStat.start_time = start_time / 1000;
>  
>      msec = config.sample_period_seconds * 1000;
> -    msec = set_sample_page_period(msec, start_time);
> +    msec = dirty_stat_wait(msec, start_time);
>      DirtyStat.calc_time = msec / 1000;
>  
>      /*
> -     * dirtyrate_global_dirty_log_stop do two things.
> +     * do two things.
>       * 1. fetch dirty bitmap from kvm
>       * 2. stop dirty tracking
>       */
> -    dirtyrate_global_dirty_log_stop();
> +    global_dirty_log_sync(GLOBAL_DIRTY_DIRTY_RATE, true);
>  
>      record_dirtypages_bitmap(&dirty_pages, false);
>  
> -    do_calculate_dirtyrate_bitmap(dirty_pages);
> +    DirtyStat.dirty_rate = do_calculate_dirtyrate(dirty_pages, msec);
>  }
>  
>  static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
>  {
> -    CPUState *cpu;
> -    int64_t msec = 0;
>      int64_t start_time;
> +    int64_t duration;
>      uint64_t dirtyrate = 0;
>      uint64_t dirtyrate_sum = 0;
> -    DirtyPageRecord *dirty_pages;
> -    int nvcpu = 0;
>      int i = 0;
>  
> -    CPU_FOREACH(cpu) {
> -        nvcpu++;
> -    }
> -
> -    dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);
> -
> -    DirtyStat.dirty_ring.nvcpu = nvcpu;
> -    DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
> -
> -    dirtyrate_global_dirty_log_start();
> -
> -    CPU_FOREACH(cpu) {
> -        record_dirtypages(dirty_pages, cpu, true);
> -    }
> +    /* start log sync */
> +    global_dirty_log_change(GLOBAL_DIRTY_DIRTY_RATE, true);
>  
>      start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>      DirtyStat.start_time = start_time / 1000;
>  
> -    msec = config.sample_period_seconds * 1000;
> -    msec = set_sample_page_period(msec, start_time);
> -    DirtyStat.calc_time = msec / 1000;
> +    /* calculate vcpu dirtyrate */
> +    duration = vcpu_calculate_dirtyrate(config.sample_period_seconds * 1000,
> +                                        start_time,
> +                                        &DirtyStat.dirty_ring,
> +                                        GLOBAL_DIRTY_DIRTY_RATE,
> +                                        true);
>  
> -    dirtyrate_global_dirty_log_stop();
> -
> -    CPU_FOREACH(cpu) {
> -        record_dirtypages(dirty_pages, cpu, false);
> -    }
> +    DirtyStat.calc_time = duration / 1000;
>  
> +    /* calculate vm dirtyrate */
>      for (i = 0; i < DirtyStat.dirty_ring.nvcpu; i++) {
> -        dirtyrate = do_calculate_dirtyrate_vcpu(dirty_pages[i]);
> -        trace_dirtyrate_do_calculate_vcpu(i, dirtyrate);
> -
> -        DirtyStat.dirty_ring.rates[i].id = i;
> +        dirtyrate = DirtyStat.dirty_ring.rates[i].dirty_rate;
>          DirtyStat.dirty_ring.rates[i].dirty_rate = dirtyrate;
>          dirtyrate_sum += dirtyrate;
>      }
>  
>      DirtyStat.dirty_rate = dirtyrate_sum;
> -    free(dirty_pages);
>  }
>  
>  static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
> @@ -574,7 +634,7 @@ static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
>      rcu_read_unlock();
>  
>      msec = config.sample_period_seconds * 1000;
> -    msec = set_sample_page_period(msec, initial_time);
> +    msec = dirty_stat_wait(msec, initial_time);
>      DirtyStat.start_time = initial_time / 1000;
>      DirtyStat.calc_time = msec / 1000;
>  
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> index 69d4c5b..594a5c0 100644
> --- a/migration/dirtyrate.h
> +++ b/migration/dirtyrate.h
> @@ -13,6 +13,8 @@
>  #ifndef QEMU_MIGRATION_DIRTYRATE_H
>  #define QEMU_MIGRATION_DIRTYRATE_H
>  
> +#include "sysemu/dirtyrate.h"
> +
>  /*
>   * Sample 512 pages per GB as default.
>   */
> @@ -65,11 +67,6 @@ typedef struct SampleVMStat {
>      uint64_t total_block_mem_MB; /* size of total sampled pages in MB */
>  } SampleVMStat;
>  
> -typedef struct VcpuStat {
> -    int nvcpu; /* number of vcpu */
> -    DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
> -} VcpuStat;
> -
>  /*
>   * Store calculation statistics for each measure.
>   */
> -- 
> 1.8.3.1
> 

-- 
Peter Xu


