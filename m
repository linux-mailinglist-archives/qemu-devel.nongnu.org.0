Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772EC2C6D03
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 22:51:24 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kileE-0000LI-Nb
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 16:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kilcx-0008BS-OL
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 16:50:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kilcr-0006j0-JZ
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 16:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606513795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WcxJmAsc7ei74jgTDjQ8BmQAxymFekvCBmQSru/fj5I=;
 b=EOCqexF2niF6n+J3r16MkIT5f7pnRuT8hP+WuL7+a1hc62KdXF5Oa6NBLfJr4MOys5Jlis
 mBEaULsJURsRXBv2PIKH1CcyqWGWqJBkYCfVz2migq05uX9+juB+6H4u8H99CF2j/BcKdA
 DXMugE5VxwxIa0n6UInBs5tNzynTV9M=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-BHWkxFdMMiOZ6RnXKMJC5Q-1; Fri, 27 Nov 2020 16:49:53 -0500
X-MC-Unique: BHWkxFdMMiOZ6RnXKMJC5Q-1
Received: by mail-qt1-f199.google.com with SMTP id i14so3899740qtq.18
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 13:49:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WcxJmAsc7ei74jgTDjQ8BmQAxymFekvCBmQSru/fj5I=;
 b=kabVe9PkfbuQ8LcTmE46j+VGAAMfbsn9yuaJebPVE79H8YAh18I2X8A1fYdopS0Ift
 HZS4jJz+YN+I0/rymOI9pI4RgJO0xnmccHejWg3XcNPmv/XCOpm97fNuSTsUt1E/twkh
 b6HgulZYkdU6lCNYb4s2bTlj97o+fMXL/CTzC/eOTrtPcwUCeeOhwdwyWXLtamXO4wtH
 JbprgTS6/bYnulZc6n7IPNtideO9Djf69ysbRve4O5fLMaIsKz5aYoyb6HmvvL2iVryg
 9FXezkbVPkYlVApmzSJclg9ie8tNpPoACiFzRfslBHcD9BoAvSHidpYX66lZEC5A34wv
 NsNg==
X-Gm-Message-State: AOAM533fYNtCpcNMG/4oMCsgkUAC+SHQEB+cx4qo5QinYsvacHAGEE8Y
 Ilxm5repSp1HaN0xzypiLF2URoF7+MAW1Z31jCB3tT+lVfKn0QfCbbX/YR1B/toNRGpmrt8CKgo
 OsY20ss+uwePMgcA=
X-Received: by 2002:ac8:44cf:: with SMTP id b15mr9940847qto.325.1606513793104; 
 Fri, 27 Nov 2020 13:49:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxovErHNqdCx/sN5HJpPdYfFGne09AxYfhFKQUYTBLAzNKsRxMfA5VKtdMkTgo2vd9PvNNw7g==
X-Received: by 2002:ac8:44cf:: with SMTP id b15mr9940832qto.325.1606513792809; 
 Fri, 27 Nov 2020 13:49:52 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id 9sm7650649qkm.81.2020.11.27.13.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 13:49:51 -0800 (PST)
Date: Fri, 27 Nov 2020 16:49:49 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 3/6] support UFFD write fault processing in
 ram_save_iterate()
Message-ID: <20201127214949.GG6573@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-4-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201126151734.743849-4-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 06:17:31PM +0300, Andrey Gruzdev wrote:
> In this particular implementation the same single migration
> thread is responsible for both normal linear dirty page
> migration and procesing UFFD page fault events.
> 
> Processing write faults includes reading UFFD file descriptor,
> finding respective RAM block and saving faulting page to
> the migration stream. After page has been saved, write protection
> can be removed. Since asynchronous version of qemu_put_buffer()
> is expected to be used to save pages, we also have to flush
> migraion stream prior to un-protecting saved memory range.
> 
> Write protection is being removed for any previously protected
> memory chunk that has hit the migration stream. That's valid
> for pages from linear page scan along with write fault pages.

Thanks for working on this version, it looks much cleaner.

> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> ---
>  migration/ram.c | 155 +++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 147 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 3adfd1948d..bcdccdaef7 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1441,6 +1441,76 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>      return block;
>  }
>  
> +#ifdef CONFIG_LINUX
> +/**
> + * ram_find_block_by_host_address: find RAM block containing host page
> + *
> + * Returns pointer to RAMBlock if found, NULL otherwise
> + *
> + * @rs: current RAM state
> + * @page_address: host page address
> + */
> +static RAMBlock *ram_find_block_by_host_address(RAMState *rs, hwaddr page_address)

Reuse qemu_ram_block_from_host() somehow?

> +{
> +    RAMBlock *bs = rs->last_seen_block;
> +
> +    do {
> +        if (page_address >= (hwaddr) bs->host && (page_address + TARGET_PAGE_SIZE) <=
> +                ((hwaddr) bs->host + bs->max_length)) {
> +            return bs;
> +        }
> +
> +        bs = QLIST_NEXT_RCU(bs, next);
> +        if (!bs) {
> +            /* Hit the end of the list */
> +            bs = QLIST_FIRST_RCU(&ram_list.blocks);
> +        }
> +    } while (bs != rs->last_seen_block);
> +
> +    return NULL;
> +}
> +
> +/**
> + * poll_fault_page: try to get next UFFD write fault page and, if pending fault
> + *   is found, return RAM block pointer and page offset
> + *
> + * Returns pointer to the RAMBlock containing faulting page,
> + *   NULL if no write faults are pending
> + *
> + * @rs: current RAM state
> + * @offset: page offset from the beginning of the block
> + */
> +static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
> +{
> +    struct uffd_msg uffd_msg;
> +    hwaddr page_address;
> +    RAMBlock *bs;
> +    int res;
> +
> +    if (!migrate_background_snapshot()) {
> +        return NULL;
> +    }
> +
> +    res = uffd_read_events(rs->uffdio_fd, &uffd_msg, 1);
> +    if (res <= 0) {
> +        return NULL;
> +    }
> +
> +    page_address = uffd_msg.arg.pagefault.address;
> +    bs = ram_find_block_by_host_address(rs, page_address);
> +    if (!bs) {
> +        /* In case we couldn't find respective block, just unprotect faulting page. */
> +        uffd_protect_memory(rs->uffdio_fd, page_address, TARGET_PAGE_SIZE, false);
> +        error_report("ram_find_block_by_host_address() failed: address=0x%0lx",
> +                page_address);

Looks ok to error_report() instead of assert(), but I'll suggest drop the call
to uffd_protect_memory() at least.  The only reason to not use assert() is
because we try our best to avoid crashing the vm, however I really doubt
whether uffd_protect_memory() is the right thing to do even if it happens - we
may at last try to unprotect some strange pages that we don't even know where
it is...

> +        return NULL;
> +    }
> +
> +    *offset = (ram_addr_t) (page_address - (hwaddr) bs->host);
> +    return bs;
> +}
> +#endif /* CONFIG_LINUX */
> +
>  /**
>   * get_queued_page: unqueue a page from the postcopy requests
>   *
> @@ -1480,6 +1550,16 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>  
>      } while (block && !dirty);
>  
> +#ifdef CONFIG_LINUX
> +    if (!block) {
> +        /*
> +         * Poll write faults too if background snapshot is enabled; that's
> +         * when we have vcpus got blocked by the write protected pages.
> +         */
> +        block = poll_fault_page(rs, &offset);
> +    }
> +#endif /* CONFIG_LINUX */
> +
>      if (block) {
>          /*
>           * As soon as we start servicing pages out of order, then we have
> @@ -1753,6 +1833,55 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>      return pages;
>  }
>  
> +/**
> + * ram_save_host_page_pre: ram_save_host_page() pre-notifier
> + *
> + * @rs: current RAM state
> + * @pss: page-search-status structure
> + * @opaque: pointer to receive opaque context value
> + */
> +static inline
> +void ram_save_host_page_pre(RAMState *rs, PageSearchStatus *pss, void **opaque)
> +{
> +    *(ram_addr_t *) opaque = pss->page;
> +}
> +
> +/**
> + * ram_save_host_page_post: ram_save_host_page() post-notifier
> + *
> + * @rs: current RAM state
> + * @pss: page-search-status structure
> + * @opaque: opaque context value
> + * @res_override: pointer to the return value of ram_save_host_page(),
> + *   overwritten in case of an error
> + */
> +static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
> +        void *opaque, int *res_override)
> +{
> +    /* Check if page is from UFFD-managed region. */
> +    if (pss->block->flags & RAM_UF_WRITEPROTECT) {
> +#ifdef CONFIG_LINUX
> +        ram_addr_t page_from = (ram_addr_t) opaque;
> +        hwaddr page_address = (hwaddr) pss->block->host +
> +                              ((hwaddr) page_from << TARGET_PAGE_BITS);

I feel like most new uses of hwaddr is not correct...  As I also commented in
the other patch.  We should save a lot of castings if switched.

> +        hwaddr run_length = (hwaddr) (pss->page - page_from + 1) << TARGET_PAGE_BITS;
> +        int res;
> +
> +        /* Flush async buffers before un-protect. */
> +        qemu_fflush(rs->f);
> +        /* Un-protect memory range. */
> +        res = uffd_protect_memory(rs->uffdio_fd, page_address, run_length, false);
> +        /* We don't want to override existing error from ram_save_host_page(). */
> +        if (res < 0 && *res_override >= 0) {
> +            *res_override = res;

What is this used for?  If res<0, I thought we should just fail the snapshot.

Meanwhile, res_override points to "pages", and then it'll be rewrite to the
errno returned by uffd_protect_memory().  Smells strange.

Can this ever be triggered anyway?

> +        }
> +#else
> +        /* Should never happen */
> +        qemu_file_set_error(rs->f, -ENOSYS);
> +#endif /* CONFIG_LINUX */
> +    }
> +}
> +
>  /**
>   * ram_find_and_save_block: finds a dirty page and sends it to f
>   *
> @@ -1779,14 +1908,14 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
>          return pages;
>      }
>  
> +    if (!rs->last_seen_block) {
> +        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);

Why setup the last seen block to be the first if null?

> +    }
> +
>      pss.block = rs->last_seen_block;
>      pss.page = rs->last_page;
>      pss.complete_round = false;
>  
> -    if (!pss.block) {
> -        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
> -    }
> -
>      do {
>          again = true;
>          found = get_queued_page(rs, &pss);
> @@ -1797,7 +1926,11 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
>          }
>  
>          if (found) {
> +            void *opaque;
> +
> +            ram_save_host_page_pre(rs, &pss, &opaque);
>              pages = ram_save_host_page(rs, &pss, last_stage);
> +            ram_save_host_page_post(rs, &pss, opaque, &pages);

So the pre/post idea is kind of an overkill to me...

How about we do the unprotect in ram_save_host_page() in the simple way, like:

  ram_save_host_page()
    start_addr = pss->page;
    do {
      ...
      (migrate pages)
      ...
    } while (...);
    if (background_snapshot_enabled()) {
      unprotect pages within start_addr to pss->page;
    }
    ...

>          }
>      } while (!pages && again);
>  
> @@ -3864,9 +3997,12 @@ fail:
>      rs->uffdio_fd = -1;
>      return -1;
>  #else
> +    /*
> +     * Should never happen since we prohibit 'background-snapshot'
> +     * capability on non-Linux hosts.

Yeah, yeah. So let's drop these irrelevant changes? :)

> +     */
>      rs->uffdio_fd = -1;
> -    error_setg(&migrate_get_current()->error,
> -            "Background-snapshot not supported on non-Linux hosts");
> +    error_setg(&migrate_get_current()->error, QERR_UNDEFINED_ERROR);
>      return -1;
>  #endif /* CONFIG_LINUX */
>  }
> @@ -3903,8 +4039,11 @@ void ram_write_tracking_stop(void)
>      uffd_close_fd(rs->uffdio_fd);
>      rs->uffdio_fd = -1;
>  #else
> -    error_setg(&migrate_get_current()->error,
> -            "Background-snapshot not supported on non-Linux hosts");
> +    /*
> +     * Should never happen since we prohibit 'background-snapshot'
> +     * capability on non-Linux hosts.
> +     */
> +    error_setg(&migrate_get_current()->error, QERR_UNDEFINED_ERROR);

Same here.

Thanks,

>  #endif /* CONFIG_LINUX */
>  }
>  
> -- 
> 2.25.1
> 

-- 
Peter Xu


