Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E2E4250B6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:08:02 +0200 (CEST)
Received: from localhost ([::1]:42760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQJl-0003N1-8I
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mYQHR-0002fU-M0
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mYQHQ-0001Ap-2v
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633601133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uiZGH0Deyll/StKx+fHTeOYAtFzk7Iw9PxiN5/Wycj4=;
 b=BPHiNZBbgG5DacG8YEPxctnt7kP7sMY2jt/FVcfKj3LaERJaITzzm0zXw9BKdwHl+40JCj
 PPs2MJljpcm067h8T2C5RXxbE+v8AapvoOsbAhEqYavprht8f2rO38QhFSOQR08sEYVlHw
 LLnFlDNqOynVM7ymF1PBhLCr25Fdoes=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-gQlJ8aFFPZ2DWaXQ1Nv0Zw-1; Thu, 07 Oct 2021 06:05:28 -0400
X-MC-Unique: gQlJ8aFFPZ2DWaXQ1Nv0Zw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k16-20020a5d6290000000b00160753b430fso4289425wru.11
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 03:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=uiZGH0Deyll/StKx+fHTeOYAtFzk7Iw9PxiN5/Wycj4=;
 b=h8GbtwhYXc6xb1XC9A+R2x2ya917yEralRJFwvlrWX0Q2LsHRV6U8+UFzfn4BxqHRk
 mMFTtStHW4U+dDGxhoF6FzZyaSNkDibRk9sLm6Qzda65zqwgPE8L4uk1SmjkJfTkOd66
 0oBqvSDGr406fxWhZQTrg6v9ZQI+PV6iWZVhIAo9Fz+vytemganPRXUbivoeZFWhZ4ut
 HdakXCBAhfYHMd5AbrQoC5MEe5kNxquNh50v1C7xBtCyLFi56iB70mwRP1iSaMlF4Uv3
 Fb+jsJqZeL0U8S94Pag+bWGY+fzzXaby1qdOl1WlBm/ut5zAPRdfxpfJSZ5fZWsBf6v5
 YjVQ==
X-Gm-Message-State: AOAM5316B0d0PTlofl5XyCDIipnU3MRl3iKP2iZNy0tsvuhMU69wQ0WA
 2XrFmAOgwfUsT4pAhyd2NjnBZEOyuogFs776q5njW4uALdRNosTf2ik5nbyiDoAa1+8c8HfCFLW
 wf4rLb7SFdHLph5c=
X-Received: by 2002:adf:9bc4:: with SMTP id e4mr4133175wrc.257.1633601127611; 
 Thu, 07 Oct 2021 03:05:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQNE72TRg0mtKZkIlbu77NO0KipjxBwdfzd+Xtzq6dYDXrq5FO/k5lLuByCf6aZHSgU5+aHA==
X-Received: by 2002:adf:9bc4:: with SMTP id e4mr4133149wrc.257.1633601127329; 
 Thu, 07 Oct 2021 03:05:27 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id u2sm23081106wrr.35.2021.10.07.03.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 03:05:26 -0700 (PDT)
Date: Thu, 7 Oct 2021 11:05:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 3/7] util/oslib-posix: Introduce and use MemsetContext
 for touch_all_pages()
Message-ID: <YV7GZIYZBC5ZoiGU@work-vm>
References: <20211004120208.7409-1-david@redhat.com>
 <20211004120208.7409-4-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211004120208.7409-4-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> Let's minimize the number of global variables to prepare for
> os_mem_prealloc() getting called concurrently and make the code a bit
> easier to read.
> 
> The only consumer that really needs a global variable is the sigbus
> handler, which will require protection via a mutex in the future either way
> as we cannot concurrently mess with the SIGBUS handler.
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  util/oslib-posix.c | 73 +++++++++++++++++++++++++++++-----------------
>  1 file changed, 47 insertions(+), 26 deletions(-)
> 
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index cb89e07770..cf2ead54ad 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -73,21 +73,30 @@
>  
>  #define MAX_MEM_PREALLOC_THREAD_COUNT 16
>  
> +struct MemsetThread;
> +
> +typedef struct MemsetContext {
> +    bool all_threads_created;
> +    bool any_thread_failed;
> +    struct MemsetThread *threads;
> +    int num_threads;
> +} MemsetContext;
> +
>  struct MemsetThread {
>      char *addr;
>      size_t numpages;
>      size_t hpagesize;
>      QemuThread pgthread;
>      sigjmp_buf env;
> +    MemsetContext *context;
>  };
>  typedef struct MemsetThread MemsetThread;
>  
> -static MemsetThread *memset_thread;
> -static int memset_num_threads;
> +/* used by sigbus_handler() */
> +static MemsetContext *sigbus_memset_context;
>  
>  static QemuMutex page_mutex;
>  static QemuCond page_cond;
> -static bool threads_created_flag;

Is there a reason you didn't lift page_mutex and page_cond into the
MemsetContext ?

(You don't need to change it for this series, just a thought;
another thought is that I think we hav ea few threadpools like this
with hooks to check they've all been created and to do something if one
fails).

Dave

>  int qemu_get_thread_id(void)
>  {
> @@ -438,10 +447,13 @@ const char *qemu_get_exec_dir(void)
>  static void sigbus_handler(int signal)
>  {
>      int i;
> -    if (memset_thread) {
> -        for (i = 0; i < memset_num_threads; i++) {
> -            if (qemu_thread_is_self(&memset_thread[i].pgthread)) {
> -                siglongjmp(memset_thread[i].env, 1);
> +
> +    if (sigbus_memset_context) {
> +        for (i = 0; i < sigbus_memset_context->num_threads; i++) {
> +            MemsetThread *thread = &sigbus_memset_context->threads[i];
> +
> +            if (qemu_thread_is_self(&thread->pgthread)) {
> +                siglongjmp(thread->env, 1);
>              }
>          }
>      }
> @@ -459,7 +471,7 @@ static void *do_touch_pages(void *arg)
>       * clearing until all threads have been created.
>       */
>      qemu_mutex_lock(&page_mutex);
> -    while(!threads_created_flag){
> +    while (!memset_args->context->all_threads_created) {
>          qemu_cond_wait(&page_cond, &page_mutex);
>      }
>      qemu_mutex_unlock(&page_mutex);
> @@ -502,7 +514,7 @@ static void *do_madv_populate_write_pages(void *arg)
>  
>      /* See do_touch_pages(). */
>      qemu_mutex_lock(&page_mutex);
> -    while (!threads_created_flag) {
> +    while (!memset_args->context->all_threads_created) {
>          qemu_cond_wait(&page_cond, &page_mutex);
>      }
>      qemu_mutex_unlock(&page_mutex);
> @@ -529,6 +541,9 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>                             int smp_cpus, bool use_madv_populate_write)
>  {
>      static gsize initialized = 0;
> +    MemsetContext context = {
> +        .num_threads = get_memset_num_threads(smp_cpus),
> +    };
>      size_t numpages_per_thread, leftover;
>      void *(*touch_fn)(void *);
>      int ret = 0, i = 0;
> @@ -546,35 +561,41 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>          touch_fn = do_touch_pages;
>      }
>  
> -    threads_created_flag = false;
> -    memset_num_threads = get_memset_num_threads(smp_cpus);
> -    memset_thread = g_new0(MemsetThread, memset_num_threads);
> -    numpages_per_thread = numpages / memset_num_threads;
> -    leftover = numpages % memset_num_threads;
> -    for (i = 0; i < memset_num_threads; i++) {
> -        memset_thread[i].addr = addr;
> -        memset_thread[i].numpages = numpages_per_thread + (i < leftover);
> -        memset_thread[i].hpagesize = hpagesize;
> -        qemu_thread_create(&memset_thread[i].pgthread, "touch_pages",
> -                           touch_fn, &memset_thread[i],
> +    context.threads = g_new0(MemsetThread, context.num_threads);
> +    numpages_per_thread = numpages / context.num_threads;
> +    leftover = numpages % context.num_threads;
> +    for (i = 0; i < context.num_threads; i++) {
> +        context.threads[i].addr = addr;
> +        context.threads[i].numpages = numpages_per_thread + (i < leftover);
> +        context.threads[i].hpagesize = hpagesize;
> +        context.threads[i].context = &context;
> +        qemu_thread_create(&context.threads[i].pgthread, "touch_pages",
> +                           touch_fn, &context.threads[i],
>                             QEMU_THREAD_JOINABLE);
> -        addr += memset_thread[i].numpages * hpagesize;
> +        addr += context.threads[i].numpages * hpagesize;
> +    }
> +
> +    if (!use_madv_populate_write) {
> +        sigbus_memset_context = &context;
>      }
>  
>      qemu_mutex_lock(&page_mutex);
> -    threads_created_flag = true;
> +    context.all_threads_created = true;
>      qemu_cond_broadcast(&page_cond);
>      qemu_mutex_unlock(&page_mutex);
>  
> -    for (i = 0; i < memset_num_threads; i++) {
> -        int tmp = (uintptr_t)qemu_thread_join(&memset_thread[i].pgthread);
> +    for (i = 0; i < context.num_threads; i++) {
> +        int tmp = (uintptr_t)qemu_thread_join(&context.threads[i].pgthread);
>  
>          if (tmp) {
>              ret = tmp;
>          }
>      }
> -    g_free(memset_thread);
> -    memset_thread = NULL;
> +
> +    if (!use_madv_populate_write) {
> +        sigbus_memset_context = NULL;
> +    }
> +    g_free(context.threads);
>  
>      return ret;
>  }
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


