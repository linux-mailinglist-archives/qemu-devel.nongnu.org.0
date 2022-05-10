Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947D5521249
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:34:47 +0200 (CEST)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNCY-0002Kt-Ml
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noN67-0007is-Vn
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:28:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noN64-00030b-1Z
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652178483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGV2F9jQlziFTeFiucU9AK/uZ8SqYiERSEYj+WqKXTU=;
 b=YIebScIL4jMtg5aNfaUIGDJMrqac+sYH9yr2AspajCQ2IKn0JUjQXZBqKovwVB4hQ3k+Y6
 tyDqiU26/AS+Tg+bfhb1kMT5SIIKcjtn8DFwr6/vnMfxjpTz3rVIDPuLIHompnTuZKjdw+
 lsIXFNUgQvGcLci4GprgYMFDeIIE4ro=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-XzxygY7bMXCslUouZKxklQ-1; Tue, 10 May 2022 06:28:02 -0400
X-MC-Unique: XzxygY7bMXCslUouZKxklQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p24-20020a1c5458000000b003945d2ffc6eso5096724wmi.5
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 03:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OGV2F9jQlziFTeFiucU9AK/uZ8SqYiERSEYj+WqKXTU=;
 b=H6cdHJbTDaQd5T4XKSkTstRaFmxl6oMg+U52oUbyUOh6oo324WDNv07cMooxsk/FPd
 WGlN+ucGdhp2JL/gii9lUhWKKRzQr+R8cYdHtEDOe7+7QgVpe5vb2fssxlZMtdhVSmJu
 kKg+TAgr+qW6o+DPCH0pWHq3Pnu5nNhBvpLOkvvkzUlHE1o8MQF2pSDXJcVuksSnJAJO
 9CzOGwCJL6wZywG8TUJ/OBX8qJgMMdkXXtaEQ+YXxmaZfzPVfygSuLcwGGpCAWDiDAwe
 f2JaWVTnfIvU7xxTzdwn6ypxm3eDAnIUa847jJEcDmIardWuRCwDG5Oh8tVTa5NdrhGk
 GhQA==
X-Gm-Message-State: AOAM532dtuEujoPR9jfgAu09Vfte7iazZ6JFgeTwOhwiMSwRj6FrkouZ
 7/xnS+D0EuWzV43REyFhXYfg9kF9hHb2r403Vv9Vv2dDwdUkTCjpbJBgf2/xrLbEiHvB6YJ/9oT
 dYNQFfOZvqLbBMVc=
X-Received: by 2002:a05:600c:190d:b0:394:8241:6454 with SMTP id
 j13-20020a05600c190d00b0039482416454mr15909636wmq.198.1652178479953; 
 Tue, 10 May 2022 03:27:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzraNAtlgzmZj3FRG5lLDkCw6heWfgh2c+Xw2EMmwpFlHe+RH1r6YVmdufk8DTf8tKjC8Js5A==
X-Received: by 2002:a05:600c:190d:b0:394:8241:6454 with SMTP id
 j13-20020a05600c190d00b0039482416454mr15909596wmq.198.1652178479401; 
 Tue, 10 May 2022 03:27:59 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x14-20020a7bc20e000000b003942a244f2esm2114660wmi.7.2022.05.10.03.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 03:27:58 -0700 (PDT)
Date: Tue, 10 May 2022 11:27:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 david@redhat.com
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Message-ID: <Yno+LIiTB2zSOUO8@work-vm>
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <YnoshVqLNjGFpfEl@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnoshVqLNjGFpfEl@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Tue, May 10, 2022 at 08:55:33AM +0200, Michal Privoznik wrote:
> > When allocating large amounts of memory the task is offloaded
> > onto threads. These threads then use various techniques to
> > allocate the memory fully (madvise(), writing into the memory).
> > However, these threads are free to run on any CPU, which becomes
> > problematic on NUMA machines because it may happen that a thread
> > is running on a distant node.
> > 
> > Ideally, this is something that a management application would
> > resolve, but we are not anywhere close to that, Firstly, memory
> > allocation happens before monitor socket is even available. But
> > okay, that's what -preconfig is for. But then the problem is that
> > 'object-add' would not return until all memory is preallocated.
> > 
> > Long story short, management application has no way of learning
> > TIDs of allocator threads so it can't make them run NUMA aware.
> 
> So I'm wondering what the impact of this problem is for various
> scenarios.
> 
> The default config for a KVM guest with libvirt is no CPU pinning
> at all. The kernel auto-places CPUs and decides on where RAM is to
> be allocated. So in this case, whether or not libvirt can talk to
> QMP in time to query threads is largely irrelevant, as we don't
> want todo placement in any case.
> 
> In theory the kernel should allocate RAM on the node local to
> where the process is currently executing. So as long as the
> guest RAM fits in available free RAM on the local node, RAM
> should be allocated from the node that matches the CPU running
> the QEMU main thread.
> 
> The challenge is if we spawn N more threads to do pre-alloc,
> these can be spread onto other nodes. I wonder if the kernel
> huas any preference for keeping threads within a process on
> the same NUMA node ?
> 
> Overall, if libvirt is not applying pinning to the QEMU guest,
> then we're 100% reliant on the kernel todo something sensible,
> both for normal QEMU execution and for prealloc. Since we're
> not doing placement of QEMU RAM or CPUs, the logic in this
> patch won't do anything either.
> 
> 
> If the guest has more RAM than can fit on the local NUMA node,
> then we're doomed no matter what, even ignoring prealloc, there
> will be cross-node traffic. This scenario requires the admin to
> setup proper CPU /memory pinning for QEMU in libvirt.
> 
> If libvirt is doing CPU pinning (as instructed by the mgmt app
> above us), then when we first start QEMU, the process thread
> leader will get given affinity by libvirt prior to exec. This
> affinity will be the union of affinity for all CPUs that will
> be later configured.
> 
> The typical case for CPU pinning, is that everything fits in
> one NUMA node, and so in this case, we don't need todo anything
> more. The prealloc threads will already be constrained to the
> right place by the affinity of the QEMU thread leader, so the
> logic in this patch will run, but it won't do anything that
> was not already done.
> 
> So we're left with the hardest case, where the guest is explicitly
> spread across multiple NUMA nodes. In this case the thread leader
> affinity will span many NUMA nodes, and so the prealloc threads
> will freely be placed across any CPU that is in the union of CPUs
> the guest is placed on. Just as with thue non-pinned case, the
> prealloc will be at the mercy of the kernel making sensible
> placement decisions.
> 
> The very last cases is the only one where this patch can potentially
> be beneficial. The problem is that because libvirt is in charge of
> enforcing CPU affinity, IIRC, we explicitly block QEMU from doing
> anything with CPU affinity. So AFAICT, this patch should result in
> an error from sched_setaffinity when run under libvirt.

This problem crops up in a few places though; potentially the same trick
could be done with multifd threads in migration, if we can make some
multifd threads handle some specific NUMA nodes rather than shotgunning
them across the threads.
[Bonus: Make multifd route different NUMA nodes down NICs that are
node local]

Dave

> > But what we can do is to propagate the 'host-nodes' attribute of
> > MemoryBackend object down to where preallocation threads are
> > created and set their affinity according to the attribute.
> > 
> > Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2074000
> > Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> > ---
> >  backends/hostmem.c     |  6 ++--
> >  hw/virtio/virtio-mem.c |  2 +-
> >  include/qemu/osdep.h   |  2 ++
> >  util/meson.build       |  2 +-
> >  util/oslib-posix.c     | 74 ++++++++++++++++++++++++++++++++++++++++--
> >  util/oslib-win32.c     |  2 ++
> >  6 files changed, 82 insertions(+), 6 deletions(-)
> > 
> > diff --git a/backends/hostmem.c b/backends/hostmem.c
> > index a7bae3d713..7373472c7e 100644
> > --- a/backends/hostmem.c
> > +++ b/backends/hostmem.c
> > @@ -232,7 +232,8 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
> >          void *ptr = memory_region_get_ram_ptr(&backend->mr);
> >          uint64_t sz = memory_region_size(&backend->mr);
> >  
> > -        os_mem_prealloc(fd, ptr, sz, backend->prealloc_threads, &local_err);
> > +        os_mem_prealloc(fd, ptr, sz, backend->prealloc_threads,
> > +                        backend->host_nodes, MAX_NODES, &local_err);
> >          if (local_err) {
> >              error_propagate(errp, local_err);
> >              return;
> > @@ -394,7 +395,8 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
> >           */
> >          if (backend->prealloc) {
> >              os_mem_prealloc(memory_region_get_fd(&backend->mr), ptr, sz,
> > -                            backend->prealloc_threads, &local_err);
> > +                            backend->prealloc_threads, backend->host_nodes,
> > +                            MAX_NODES, &local_err);
> >              if (local_err) {
> >                  goto out;
> >              }
> > diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> > index 5aca408726..48b104cdf6 100644
> > --- a/hw/virtio/virtio-mem.c
> > +++ b/hw/virtio/virtio-mem.c
> > @@ -467,7 +467,7 @@ static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
> >              int fd = memory_region_get_fd(&vmem->memdev->mr);
> >              Error *local_err = NULL;
> >  
> > -            os_mem_prealloc(fd, area, size, 1, &local_err);
> > +            os_mem_prealloc(fd, area, size, 1, NULL, 0, &local_err);
> >              if (local_err) {
> >                  static bool warned;
> >  
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index 1c1e7eca98..474cbf3b86 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -577,6 +577,8 @@ unsigned long qemu_getauxval(unsigned long type);
> >  void qemu_set_tty_echo(int fd, bool echo);
> >  
> >  void os_mem_prealloc(int fd, char *area, size_t sz, int smp_cpus,
> > +                     const unsigned long *host_nodes,
> > +                     unsigned long max_node,
> >                       Error **errp);
> >  
> >  /**
> > diff --git a/util/meson.build b/util/meson.build
> > index 8f16018cd4..393ff74570 100644
> > --- a/util/meson.build
> > +++ b/util/meson.build
> > @@ -15,7 +15,7 @@ freebsd_dep = []
> >  if targetos == 'freebsd'
> >    freebsd_dep = util
> >  endif
> > -util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'), freebsd_dep])
> > +util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'), freebsd_dep, numa])
> >  util_ss.add(when: 'CONFIG_POSIX', if_true: files('qemu-thread-posix.c'))
> >  util_ss.add(when: 'CONFIG_POSIX', if_true: files('memfd.c'))
> >  util_ss.add(when: 'CONFIG_WIN32', if_true: files('aio-win32.c'))
> > diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> > index 477990f39b..1572b9b178 100644
> > --- a/util/oslib-posix.c
> > +++ b/util/oslib-posix.c
> > @@ -73,6 +73,10 @@
> >  #include "qemu/error-report.h"
> >  #endif
> >  
> > +#ifdef CONFIG_NUMA
> > +#include <numa.h>
> > +#endif
> > +
> >  #define MAX_MEM_PREALLOC_THREAD_COUNT 16
> >  
> >  struct MemsetThread;
> > @@ -82,6 +86,9 @@ typedef struct MemsetContext {
> >      bool any_thread_failed;
> >      struct MemsetThread *threads;
> >      int num_threads;
> > +#ifdef CONFIG_NUMA
> > +    struct bitmask *nodemask;
> > +#endif
> >  } MemsetContext;
> >  
> >  struct MemsetThread {
> > @@ -420,6 +427,12 @@ static void *do_touch_pages(void *arg)
> >      }
> >      qemu_mutex_unlock(&page_mutex);
> >  
> > +#ifdef CONFIG_NUMA
> > +    if (memset_args->context->nodemask) {
> > +        numa_run_on_node_mask(memset_args->context->nodemask);
> > +    }
> > +#endif
> > +
> >      /* unblock SIGBUS */
> >      sigemptyset(&set);
> >      sigaddset(&set, SIGBUS);
> > @@ -463,6 +476,12 @@ static void *do_madv_populate_write_pages(void *arg)
> >      }
> >      qemu_mutex_unlock(&page_mutex);
> >  
> > +#ifdef CONFIG_NUMA
> > +    if (memset_args->context->nodemask) {
> > +        numa_run_on_node_mask(memset_args->context->nodemask);
> > +    }
> > +#endif
> 
> Ok, so this is where affinity is set, and I believe this ought to be
> failing when run under libvirt with an EPERM from sched_setaffinity.
> This code is ignoring errors so I guess this won't be noticed unless
> libnuma is printing an error message ?
> 
> > +
> >      if (size && qemu_madvise(addr, size, QEMU_MADV_POPULATE_WRITE)) {
> >          ret = -errno;
> >      }
> > @@ -489,7 +508,9 @@ static inline int get_memset_num_threads(size_t hpagesize, size_t numpages,
> >  }
> >  
> >  static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
> > -                           int smp_cpus, bool use_madv_populate_write)
> > +                           int smp_cpus, const unsigned long *host_nodes,
> > +                           unsigned long max_node,
> > +                           bool use_madv_populate_write)
> >  {
> >      static gsize initialized = 0;
> >      MemsetContext context = {
> > @@ -499,6 +520,7 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
> >      void *(*touch_fn)(void *);
> >      int ret = 0, i = 0;
> >      char *addr = area;
> > +    unsigned long value = max_node;
> >  
> >      if (g_once_init_enter(&initialized)) {
> >          qemu_mutex_init(&page_mutex);
> > @@ -520,6 +542,48 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
> >          touch_fn = do_touch_pages;
> >      }
> >  
> > +    if (host_nodes) {
> > +        value = find_first_bit(host_nodes, max_node);
> > +    }
> > +    if (value != max_node) {
> > +#ifdef CONFIG_NUMA
> > +        struct bitmask *cpus = numa_allocate_cpumask();
> > +        g_autofree unsigned long *zerocpumask;
> > +        size_t zerocpumasklen;
> > +        g_autofree unsigned long *zeronodemask;
> > +        size_t zeronodemasklen;
> > +
> > +        context.nodemask = numa_bitmask_alloc(max_node);
> > +
> > +        zerocpumasklen = cpus->size / sizeof(unsigned long);
> > +        zerocpumask = g_new0(unsigned long, zerocpumasklen);
> > +
> > +        for (; value != max_node;
> > +             value = find_next_bit(host_nodes, max_node, value + 1)) {
> > +            if (numa_node_to_cpus(value, cpus) ||
> > +                memcmp(cpus->maskp, zerocpumask, zerocpumasklen) == 0)
> > +                continue;
> > +
> > +            /* If given NUMA node has CPUs run threads on them. */
> > +            numa_bitmask_setbit(context.nodemask, value);
> > +        }
> > +
> > +        numa_bitmask_free(cpus);
> > +
> > +        zeronodemasklen = max_node / sizeof(unsigned long);
> > +        zeronodemask = g_new0(unsigned long, zeronodemasklen);
> > +
> > +        if (memcmp(context.nodemask->maskp,
> > +                   zeronodemask, zeronodemasklen) == 0) {
> > +            /* If no NUMA has a CPU available, then don't pin threads. */
> > +            g_clear_pointer(&context.nodemask, numa_bitmask_free);
> > +        }
> > +#else
> > +        errno = -EINVAL;
> > +        return -1;
> > +#endif
> > +    }
> > +
> >      context.threads = g_new0(MemsetThread, context.num_threads);
> >      numpages_per_thread = numpages / context.num_threads;
> >      leftover = numpages % context.num_threads;
> > @@ -554,6 +618,10 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
> >      if (!use_madv_populate_write) {
> >          sigbus_memset_context = NULL;
> >      }
> > +
> > +#ifdef CONFIG_NUMA
> > +    g_clear_pointer(&context.nodemask, numa_bitmask_free);
> > +#endif
> >      g_free(context.threads);
> >  
> >      return ret;
> > @@ -566,6 +634,8 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
> >  }
> >  
> >  void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
> > +                     const unsigned long *host_nodes,
> > +                     unsigned long max_node,
> >                       Error **errp)
> >  {
> >      static gsize initialized;
> > @@ -608,7 +678,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
> >  
> >      /* touch pages simultaneously */
> >      ret = touch_all_pages(area, hpagesize, numpages, smp_cpus,
> > -                          use_madv_populate_write);
> > +                          host_nodes, max_node, use_madv_populate_write);
> >      if (ret) {
> >          error_setg_errno(errp, -ret,
> >                           "os_mem_prealloc: preallocating memory failed");
> > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > index dafef4f157..6efd912355 100644
> > --- a/util/oslib-win32.c
> > +++ b/util/oslib-win32.c
> > @@ -314,6 +314,8 @@ int getpagesize(void)
> >  }
> >  
> >  void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
> > +                     const unsigned long *host_nodes,
> > +                     unsigned long max_node,
> >                       Error **errp)
> >  {
> >      int i;
> > -- 
> > 2.35.1
> > 
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


