Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0B7463199
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:55:29 +0100 (CET)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0nI-0000rP-SF
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:55:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ms0iV-00047P-2E
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:50:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ms0iR-0002GJ-WF
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638269427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uJl7hs138ize4Z6b8XgeCYcvfmDwWdgTF6EqeN2Z9fg=;
 b=TbBy28yFIru9vDAJeQ2uuWgNHs3dMHXX5NyJHykVfZEZNLQkD8YTMhJAj9HnqzfXLx6WB0
 7OseyshUM1Y3QpBVQ9n3uvDsG+EajeYYi93ksFt/k254OR8gLOB9nOfuyT1O8YvblN+KM3
 Ctb0GnEEd1J4yMB31HfBc9Ik1+t1QSI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-s--RMDHBMe6znkHvLhGoVQ-1; Tue, 30 Nov 2021 05:50:26 -0500
X-MC-Unique: s--RMDHBMe6znkHvLhGoVQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o4-20020adfca04000000b0018f07ad171aso3472508wrh.20
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 02:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uJl7hs138ize4Z6b8XgeCYcvfmDwWdgTF6EqeN2Z9fg=;
 b=pQG61w/QMDL4YWu0WFEvi1Gm4BmuLKWA4qdSTydLBt7ee8yrO438H1BFZMezD09lSW
 09jZQNG1/VKRRmLPWmBdmm5bkbZbo94flLKm5kXPEqy/Zn731BKdbOTHKL/KYYv1RFLZ
 uhoPK4IokddaPjFYVd9WgtXzuLRzs0N0925VzV7IYaHZJwL1WrcidzK/dpOEyK49lakl
 2YzhLIh0ddbBU3Q0YbUPLgS30zbkK/RejIbijeQuv9gB57vrDuMAEqhvbVex1CK7zutu
 PLOnnYBvxUgnlaJM83ZSGy1IhqjVpCaTQkT395ePPf7s4AZsfxZCjji/EyRHfRqf3G81
 r8mQ==
X-Gm-Message-State: AOAM533/4QV3ZxMiYKiH2IZA2IoMQB2sUlSO6zJiZO5AfFNPkJ1/8B2s
 Pr2PEDJosB4WAq/ZOD1Qy2Yq+LyQJsQ5WY5ncDxxUodCCif4nMFeu4QNApaYFLmIRuxT5qnJNoN
 D6CBjr3tm17zSWbk=
X-Received: by 2002:a05:600c:3ba3:: with SMTP id
 n35mr4156346wms.88.1638269424853; 
 Tue, 30 Nov 2021 02:50:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+z0kHGMvcGOaoQF3+5HEfhMo+sAbzyka6VXlHM33//lR4mvf6wfZX19yxEJvVpdPMf9kVfQ==
X-Received: by 2002:a05:600c:3ba3:: with SMTP id
 n35mr4156306wms.88.1638269424589; 
 Tue, 30 Nov 2021 02:50:24 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m34sm2447896wms.25.2021.11.30.02.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:50:23 -0800 (PST)
Date: Tue, 30 Nov 2021 10:50:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 17/23] multifd: Use normal pages array on the send side
Message-ID: <YaYB7sSHKoVZgJ6q@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-18-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-18-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Can you explain a bit more what's going on here?

Dave

> ---
>  migration/multifd.h      |  8 ++++++--
>  migration/multifd-zlib.c |  6 +++---
>  migration/multifd-zstd.c |  6 +++---
>  migration/multifd.c      | 30 +++++++++++++++++++-----------
>  migration/trace-events   |  4 ++--
>  5 files changed, 33 insertions(+), 21 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 7496f951a7..78e73df3ec 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -104,14 +104,18 @@ typedef struct {
>      /* thread local variables */
>      /* packets sent through this channel */
>      uint64_t num_packets;
> -    /* pages sent through this channel */
> -    uint64_t num_pages;
> +    /* non zero pages sent through this channel */
> +    uint64_t num_normal_pages;
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
>      /* buffers to send */
>      struct iovec *iov;
>      /* number of iovs used */
>      uint32_t iovs_num;
> +    /* Pages that are not zero */
> +    ram_addr_t *normal;
> +    /* num of non zero pages */
> +    uint32_t normal_num;
>      /* used for compression methods */
>      void *data;
>  }  MultiFDSendParams;
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index f65159392a..25ef68a548 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -106,16 +106,16 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>      int ret;
>      uint32_t i;
>  
> -    for (i = 0; i < p->pages->num; i++) {
> +    for (i = 0; i < p->normal_num; i++) {
>          uint32_t available = z->zbuff_len - out_size;
>          int flush = Z_NO_FLUSH;
>  
> -        if (i == p->pages->num - 1) {
> +        if (i == p->normal_num - 1) {
>              flush = Z_SYNC_FLUSH;
>          }
>  
>          zs->avail_in = page_size;
> -        zs->next_in = p->pages->block->host + p->pages->offset[i];
> +        zs->next_in = p->pages->block->host + p->normal[i];
>  
>          zs->avail_out = available;
>          zs->next_out = z->zbuff + out_size;
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index 6933ba622a..61842d713e 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -121,13 +121,13 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>      z->out.size = z->zbuff_len;
>      z->out.pos = 0;
>  
> -    for (i = 0; i < p->pages->num; i++) {
> +    for (i = 0; i < p->normal_num; i++) {
>          ZSTD_EndDirective flush = ZSTD_e_continue;
>  
> -        if (i == p->pages->num - 1) {
> +        if (i == p->normal_num - 1) {
>              flush = ZSTD_e_flush;
>          }
> -        z->in.src = p->pages->block->host + p->pages->offset[i];
> +        z->in.src = p->pages->block->host + p->normal[i];
>          z->in.size = page_size;
>          z->in.pos = 0;
>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 6983ba3e7c..dbe919b764 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -89,13 +89,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
>      MultiFDPages_t *pages = p->pages;
>      size_t page_size = qemu_target_page_size();
>  
> -    for (int i = 0; i < p->pages->num; i++) {
> -        p->iov[p->iovs_num].iov_base = pages->block->host + pages->offset[i];
> +    for (int i = 0; i < p->normal_num; i++) {
> +        p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
>          p->iov[p->iovs_num].iov_len = page_size;
>          p->iovs_num++;
>      }
>  
> -    p->next_packet_size = p->pages->num * page_size;
> +    p->next_packet_size = p->normal_num * page_size;
>      p->flags |= MULTIFD_FLAG_NOCOMP;
>      return 0;
>  }
> @@ -262,7 +262,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  
>      packet->flags = cpu_to_be32(p->flags);
>      packet->pages_alloc = cpu_to_be32(p->pages->allocated);
> -    packet->pages_used = cpu_to_be32(p->pages->num);
> +    packet->pages_used = cpu_to_be32(p->normal_num);
>      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
>      packet->packet_num = cpu_to_be64(p->packet_num);
>  
> @@ -270,9 +270,9 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>          strncpy(packet->ramblock, p->pages->block->idstr, 256);
>      }
>  
> -    for (i = 0; i < p->pages->num; i++) {
> +    for (i = 0; i < p->normal_num; i++) {
>          /* there are architectures where ram_addr_t is 32 bit */
> -        uint64_t temp = p->pages->offset[i];
> +        uint64_t temp = p->normal[i];
>  
>          packet->offset[i] = cpu_to_be64(temp);
>      }
> @@ -556,6 +556,8 @@ void multifd_save_cleanup(void)
>          p->packet = NULL;
>          g_free(p->iov);
>          p->iov = NULL;
> +        g_free(p->normal);
> +        p->normal = NULL;
>          multifd_send_state->ops->send_cleanup(p, &local_err);
>          if (local_err) {
>              migrate_set_error(migrate_get_current(), local_err);
> @@ -640,12 +642,17 @@ static void *multifd_send_thread(void *opaque)
>          qemu_mutex_lock(&p->mutex);
>  
>          if (p->pending_job) {
> -            uint32_t used = p->pages->num;
>              uint64_t packet_num = p->packet_num;
>              uint32_t flags = p->flags;
>              p->iovs_num = 1;
> +            p->normal_num = 0;
>  
> -            if (used) {
> +            for (int i = 0; i < p->pages->num; i++) {
> +                p->normal[p->normal_num] = p->pages->offset[i];
> +                p->normal_num++;
> +            }
> +
> +            if (p->normal_num) {
>                  ret = multifd_send_state->ops->send_prepare(p, &local_err);
>                  if (ret != 0) {
>                      qemu_mutex_unlock(&p->mutex);
> @@ -655,12 +662,12 @@ static void *multifd_send_thread(void *opaque)
>              multifd_send_fill_packet(p);
>              p->flags = 0;
>              p->num_packets++;
> -            p->num_pages += used;
> +            p->num_normal_pages += p->normal_num;
>              p->pages->num = 0;
>              p->pages->block = NULL;
>              qemu_mutex_unlock(&p->mutex);
>  
> -            trace_multifd_send(p->id, packet_num, used, flags,
> +            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
>                                 p->next_packet_size);
>  
>              p->iov[0].iov_len = p->packet_len;
> @@ -710,7 +717,7 @@ out:
>      qemu_mutex_unlock(&p->mutex);
>  
>      rcu_unregister_thread();
> -    trace_multifd_send_thread_end(p->id, p->num_packets, p->num_pages);
> +    trace_multifd_send_thread_end(p->id, p->num_packets, p->num_normal_pages);
>  
>      return NULL;
>  }
> @@ -910,6 +917,7 @@ int multifd_save_setup(Error **errp)
>          p->tls_hostname = g_strdup(s->hostname);
>          /* We need one extra place for the packet header */
>          p->iov = g_new0(struct iovec, page_count + 1);
> +        p->normal = g_new0(ram_addr_t, page_count);
>          socket_send_channel_create(multifd_new_send_channel_async, p);
>      }
>  
> diff --git a/migration/trace-events b/migration/trace-events
> index b48d873b8a..af8dee9af0 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -124,13 +124,13 @@ multifd_recv_sync_main_wait(uint8_t id) "channel %d"
>  multifd_recv_terminate_threads(bool error) "error %d"
>  multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %d packets %" PRIu64 " pages %" PRIu64
>  multifd_recv_thread_start(uint8_t id) "%d"
> -multifd_send(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " pages %d flags 0x%x next packet size %d"
> +multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " normal pages %d flags 0x%x next packet size %d"
>  multifd_send_error(uint8_t id) "channel %d"
>  multifd_send_sync_main(long packet_num) "packet num %ld"
>  multifd_send_sync_main_signal(uint8_t id) "channel %d"
>  multifd_send_sync_main_wait(uint8_t id) "channel %d"
>  multifd_send_terminate_threads(bool error) "error %d"
> -multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %d packets %" PRIu64 " pages %"  PRIu64
> +multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pages) "channel %d packets %" PRIu64 " normal pages %"  PRIu64
>  multifd_send_thread_start(uint8_t id) "%d"
>  multifd_tls_outgoing_handshake_start(void *ioc, void *tioc, const char *hostname) "ioc=%p tioc=%p hostname=%s"
>  multifd_tls_outgoing_handshake_error(void *ioc, const char *err) "ioc=%p err=%s"
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


