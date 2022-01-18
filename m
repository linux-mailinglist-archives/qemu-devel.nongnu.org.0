Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A130F492ECF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:59:20 +0100 (CET)
Received: from localhost ([::1]:40698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9udT-0000w3-9g
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:59:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9uaD-0006bF-LH
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:55:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9ua8-000547-Nt
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642535741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NW7gDXp5TqoZaLoAfDLM9a87zh/K0/X+mBRzzsTUYHI=;
 b=XEiG82fzAqhYrfUjCxdzxdzAgchvdxJQkUAtPVbpafrTe2VNX3unfsmhq/iWxuZCaeFv0W
 jHZMhC8d73H3T4lZJEHz2mOKJr1bn+3OPG+UIACNoIGbsaiig3Pv9tDNHZyhSHGExtZeka
 KBLC2w5rkVdjdOUBZvOth9qsqsEK8Mw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-nc4a02dXPc62FkXFLm9H7w-1; Tue, 18 Jan 2022 14:55:40 -0500
X-MC-Unique: nc4a02dXPc62FkXFLm9H7w-1
Received: by mail-wm1-f69.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so219183wml.1
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 11:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NW7gDXp5TqoZaLoAfDLM9a87zh/K0/X+mBRzzsTUYHI=;
 b=gX+V1vrWBhthIBUZ459ZQu8HPJazdbxNTnFvbG6gnDIzvaQKwmoc18laY5YChm9zc5
 +Pii00YMfhwXhzq2CrxYfDE2Lfk2LIzwQeySWuO84XZctb8NykdFn5O1uaGLKwCeL3AO
 e4/seeTXihjkPj0kDi8l8EwckmMTPzcone3S56Mn6thJNDwEzdAKQ6bLLW02ytT5+LPp
 gGxzVBeXc348gdE0q3vVE3BjbQE9GDx/ot4DBXJ92vgbxJwXX/f7UWXeTC/A60Rz+l4G
 P+i/koUeCzSSN0XqoXsmv1fwRBU5zUj7KeUyXNbLtDdQjmBagcP/UtL19w62ZovhwaaW
 lcMA==
X-Gm-Message-State: AOAM531lCe0thfNkAeAcXOrJeORMNHcxg5jWCYQDxLnh/+OMW6mwCSTP
 lYXghHHPn9xF1j1LVzMDnWrj4aij0kSbvtYq7JtfuTEfrcof5HuuvAQs7+RixndozgDcsK9h+xm
 epb+RZ9m3smsd0tA=
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr140688wmq.122.1642535738101; 
 Tue, 18 Jan 2022 11:55:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGkQ751wvW+ME4mBsR5tK5kg0w7v1wIGVNVSEgbcgwd1wq2AJgQhv/XkcKoXpl8zvQgCPqEQ==
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr140667wmq.122.1642535737848; 
 Tue, 18 Jan 2022 11:55:37 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id i8sm9878381wry.33.2022.01.18.11.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 11:55:37 -0800 (PST)
Date: Tue, 18 Jan 2022 19:55:35 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 21/23] multifd: Zero pages transmission
Message-ID: <YecbN5MbUvL3oVKm@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-22-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-22-quintela@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> This implements the zero page dection and handling.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> 
> Add comment for offset (dave)
> ---
>  migration/multifd.h |  4 ++++
>  migration/multifd.c | 36 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 4c6d29c954..d014747122 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -54,6 +54,10 @@ typedef struct {
>      uint32_t unused32[1];    /* Reserved for future use */
>      uint64_t unused64[3];    /* Reserved for future use */
>      char ramblock[256];
> +    /* This array contains the pointers to:
> +       - normal pages (initial normal_pages entries)
> +       - zero pages (following zero_pages entries)
> +    */
>      uint64_t offset[];
>  } __attribute__((packed)) MultiFDPacket_t;
>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index cfa9f75d13..ded13289e7 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/rcu.h"
>  #include "exec/target_page.h"
>  #include "sysemu/sysemu.h"
> @@ -277,6 +278,12 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  
>          packet->offset[i] = cpu_to_be64(temp);
>      }
> +    for (i = 0; i < p->zero_num; i++) {
> +        /* there are architectures where ram_addr_t is 32 bit */
> +        uint64_t temp = p->zero[i];
> +
> +        packet->offset[p->normal_num + i] = cpu_to_be64(temp);
> +    }
>  }
>  
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
> @@ -362,6 +369,18 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>          p->normal[i] = offset;
>      }
>  
> +    for (i = 0; i < p->zero_num; i++) {
> +        uint64_t offset = be64_to_cpu(packet->offset[p->normal_num + i]);
> +
> +        if (offset > (block->used_length - page_size)) {
> +            error_setg(errp, "multifd: offset too long %" PRIu64
> +                       " (max " RAM_ADDR_FMT ")",
> +                       offset, block->used_length);
> +            return -1;
> +        }
> +        p->zero[i] = offset;
> +    }
> +
>      return 0;
>  }
>  
> @@ -627,6 +646,8 @@ static void *multifd_send_thread(void *opaque)
>  {
>      MultiFDSendParams *p = opaque;
>      Error *local_err = NULL;
> +    /* qemu older than 7.0 don't understand zero page on multifd channel */
> +    bool use_zero_page = migrate_use_multifd_zero_page();
>      int ret = 0;
>  
>      trace_multifd_send_thread_start(p->id);
> @@ -655,8 +676,15 @@ static void *multifd_send_thread(void *opaque)
>              p->zero_num = 0;
>  
>              for (int i = 0; i < p->pages->num; i++) {
> -                p->normal[p->normal_num] = p->pages->offset[i];
> -                p->normal_num++;
> +                if (use_zero_page &&
> +                    buffer_is_zero(p->pages->block->host + p->pages->offset[i],
> +                                   qemu_target_page_size())) {
> +                    p->zero[p->zero_num] = p->pages->offset[i];
> +                    p->zero_num++;
> +                } else {
> +                    p->normal[p->normal_num] = p->pages->offset[i];
> +                    p->normal_num++;
> +                }
>              }
>  
>              if (p->normal_num) {
> @@ -1115,6 +1143,10 @@ static void *multifd_recv_thread(void *opaque)
>              }
>          }
>  
> +        for (int i = 0; i < p->zero_num; i++) {
> +            memset(p->host + p->zero[i], 0, qemu_target_page_size());
> +        }
> +

On the existing code, it tries to avoid doing the memset if the target
page size matches; that avoids allocating the zero pages on the
destination host; should we try and do the same here?

Dave

>          if (flags & MULTIFD_FLAG_SYNC) {
>              qemu_sem_post(&multifd_recv_state->sem_sync);
>              qemu_sem_wait(&p->sem_sync);
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


