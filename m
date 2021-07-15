Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3713CAE25
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 22:50:37 +0200 (CEST)
Received: from localhost ([::1]:51528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m48JX-0006Xa-6P
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 16:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m48IT-00056p-5C
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m48IP-0003PI-Ig
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626382164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NDwfoXAczjO+tYLP6Vd6qNAktaUuIUI36s8hZySB04E=;
 b=g2r0gmE4q/9+WriPsRl3kWo387ogSoZn9eUJSPzPm1UsgxHaWX2MVmUdtKKASjTa4K1BzC
 qg5yeYgWvcFC6bDGIzls+fEo4rD4qd7e/5vC00S6S0yMFrpevAefox4qlPk71XOROZxjdJ
 DrZLjk86hOmv5KkpGfXb7jhmrbSyXYk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-FZz_jdXAO1moG9mZW09bMg-1; Thu, 15 Jul 2021 16:49:23 -0400
X-MC-Unique: FZz_jdXAO1moG9mZW09bMg-1
Received: by mail-qk1-f200.google.com with SMTP id
 b6-20020a05620a1186b02903b429a7ee4bso4764453qkk.4
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 13:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NDwfoXAczjO+tYLP6Vd6qNAktaUuIUI36s8hZySB04E=;
 b=aks5YjLOw3u54p8CzYjnyOiLHyHY310CKVxJ6xrKHkWZtqVESv8BVs8AVCEqhF8ZpQ
 pdXj2TYZHIPNBskmPeo5iuhc8pikaEnxBrcxVpUqQl4X4VcZsdbaIQ1QfKOXbq5kb41C
 q143drqHWLcTox4tM5Rjx5I6LR+Mp2ivvoDkOVLqhm3ESpl1I4lzOVE/qDfOGueRWN89
 fRZ1FHs8TeVL9xOUcn3yPvRxQndQdp5XyzUlbNt5xNIBDiGFsxnnZtS+4oqO1vQSeud2
 hwyu9/8gqnpWChr8B5PWd16XKlSHQssXx2cAmoU38fuCxsWuQJI0Gii/FiIRRQH8NlfY
 XuQg==
X-Gm-Message-State: AOAM5305AmEkZCyYeFIb4PZbjrAwHyy0vUY2j0qfSqFznE7HaCYLRO4E
 vz0aTLsWaVHLR/uPh0Lf+SjsdVAnwuVZaUZcD7ZS9cIUI0BdKLRoM8ZylxW9Y45w41z4h4D7cbb
 wKPna5aioXOnc21g=
X-Received: by 2002:a37:c448:: with SMTP id h8mr5913075qkm.191.1626382162801; 
 Thu, 15 Jul 2021 13:49:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+Kzsf/fs1wKQOC/ffA2F9OvMv8WS5P/WVS4fW32S6FuI/5iExpQ7yOmbeG9nQqfBem/+IaQ==
X-Received: by 2002:a37:c448:: with SMTP id h8mr5913049qkm.191.1626382162486; 
 Thu, 15 Jul 2021 13:49:22 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j28sm2917377qki.52.2021.07.15.13.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 13:49:21 -0700 (PDT)
Date: Thu, 15 Jul 2021 16:49:20 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v3 2/3] memory: introduce DirtyRateDirtyPages and util
 function
Message-ID: <YPCfUGk4MdWKi9So@t490s>
References: <cover.1626364220.git.huangy81@chinatelecom.cn>
 <316de737c2fee577cbf75a47dc7537ce38844a63.1626364220.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <316de737c2fee577cbf75a47dc7537ce38844a63.1626364220.git.huangy81@chinatelecom.cn>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 15, 2021 at 11:51:32PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> introduce DirtyRateDirtyPages and use it to the dirty pages
> along with memory_global_dirty_log_sync.
> introduce cpu_physical_memory_dirtyrate_reset_protect to
> clear dirty bitmap within slot in kvm
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  include/exec/ram_addr.h | 19 +++++++++++++++++++
>  migration/dirtyrate.c   |  2 ++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 45c9132..dce0f46 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -26,6 +26,8 @@
>  #include "exec/ramlist.h"
>  #include "exec/ramblock.h"
>  
> +extern uint64_t DirtyRateDirtyPages;
> +
>  /**
>   * clear_bmap_size: calculate clear bitmap size
>   *
> @@ -415,6 +417,17 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
>              }
>          }
>      }
> +
> +    if (global_dirty_tracking &&

This check can be dropped.

> +        global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE) {
> +        long nr = BITS_TO_LONGS(pages);
> +        for (i = 0; i < nr; i++) {
> +            if (bitmap[i]) {
> +                unsigned long temp = leul_to_cpu(bitmap[i]);
> +                DirtyRateDirtyPages += ctpopl(temp);

IMHO we don't need to loop the bitmap twice; we can still do it in above if
blocks when looping.

Note that this variable (DirtyRateDirtyPages) should either be protected by a
lock or updated using qatomic_add().  I think it's easier we just read/write it
with BQL as it should be required for cpu_physical_memory_set_dirty_lebitmap()
callers.  So looks okay.

> +            }
> +        }
> +    }
>  }
>  #endif /* not _WIN32 */
>  
> @@ -510,5 +523,11 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>  
>      return num_dirty;
>  }
> +
> +static inline
> +void cpu_physical_memory_dirtyrate_reset_protect(RAMBlock *rb)
> +{
> +    memory_region_clear_dirty_bitmap(rb->mr, 0, rb->used_length);
> +}

The name cpu_physical_memory_dirtyrate_reset_protect() didn't really help
anything.. I'd suggest we drop this helper and call it directly in the next
patch.

>  #endif
>  #endif
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 3c8c5e2..c465e62 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -28,6 +28,8 @@
>  #include "sysemu/runstate.h"
>  #include "exec/memory.h"
>  
> +uint64_t DirtyRateDirtyPages;

CamelCase is normally used for type definitions in QEMU.  Maybe define it as
"total_dirty_pages"?  Then we never reset it to zero, but only increase it.

Also let's comment above it: it's protected by BQL.  So far it should be enough.

Thanks,

> +
>  typedef struct DirtyPageRecord {
>      uint64_t start_pages;
>      uint64_t end_pages;
> -- 
> 1.8.3.1
> 

-- 
Peter Xu


