Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA345F5332
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 13:14:39 +0200 (CEST)
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og2MI-0003JG-9D
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 07:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og2K7-0001qG-0G
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 07:12:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og2K2-00087I-Qw
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 07:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664968337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AyQ//9OcQ7YvivDC6YnzqqLzSyYvXZp+hbip0an0S78=;
 b=f/4jh0Vz3QT50TK1P6p96chuwhJCd1EP2Etrcb6ehHIeJ4D7qDJPZEBQKSfv93yAQGKpCg
 adyxqCawVjQzl5wKzTt9iBjfT9vimbv+8Zxcgh1cIDaW0ZWE6GWT1gby3mTlXUNyEHemt5
 ORHIppvhO/Ixl4M2RHXdxei9dnHULaE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-TVE5e_OaO-qm2BvIIGADeQ-1; Wed, 05 Oct 2022 07:12:16 -0400
X-MC-Unique: TVE5e_OaO-qm2BvIIGADeQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k38-20020a05600c1ca600b003b49a809168so792548wms.5
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 04:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AyQ//9OcQ7YvivDC6YnzqqLzSyYvXZp+hbip0an0S78=;
 b=JtczWIfHd8pxw4wRw2V0yy2FmDgjQK541kO33o+A+vTW11zzcKwkZfrSIYzr4Fz917
 aRks/+77IECKBetw3LsM5K+UorkPelWF8oC8VDmreL01j1G59NWaM/FoemUYB4T+XJJL
 IeOyIQhPz4oop8Z/Z7OdlBCxYxmVnmyI0pENJLwPI62SAnfkXKUoY5BQz1rI6mFJ5lVE
 gEBF7SHMezT3CZhmkGEP9QwpqhlV8Ko2o5evcWTDAztDdpnCAQwMQ6Scf/bVYTaNFVo3
 V85hut+/2seWZr6FkW0SnPbOvZKfOlqxokyIbWki1L46N/pTntBbXOosG3h2ip7/ICWl
 r8OA==
X-Gm-Message-State: ACrzQf072oyuzyU83WXFiND+c9/VRCQvlzfGY0k9vFi36L86ur8lJ6Hj
 tmgkHrlGwAN6hPz0pCSE+dOUxMb9stIC1/Ne6fyj5o7qmuA/SbBudxYxDVQcfsAZgahX9nLWOOR
 fijAWaG50KTooK2o=
X-Received: by 2002:a05:600c:17d0:b0:3bc:eda4:751d with SMTP id
 y16-20020a05600c17d000b003bceda4751dmr2982828wmo.92.1664968335227; 
 Wed, 05 Oct 2022 04:12:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4h2KZmKiG/PxGm7zNvnlAgHupA2+Cvxj6Zccz5y9wuAOsW3g3KRDPCJ3HWYvN60tuXqn8CWQ==
X-Received: by 2002:a05:600c:17d0:b0:3bc:eda4:751d with SMTP id
 y16-20020a05600c17d000b003bceda4751dmr2982804wmo.92.1664968334899; 
 Wed, 05 Oct 2022 04:12:14 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n25-20020a05600c3b9900b003a5ffec0b91sm1779935wms.30.2022.10.05.04.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 04:12:14 -0700 (PDT)
Date: Wed, 5 Oct 2022 12:12:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 07/14] migration: Teach PSS about host page
Message-ID: <Yz1mjOijY/nuKM7w@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225215.48840-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225215.48840-1-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

* Peter Xu (peterx@redhat.com) wrote:
> Migration code has a lot to do with host pages.  Teaching PSS core about
> the idea of host page helps a lot and makes the code clean.  Meanwhile,
> this prepares for the future changes that can leverage the new PSS helpers
> that this patch introduces to send host page in another thread.
> 
> Three more fields are introduced for this:
> 
>   (1) host_page_sending: this is set to true when QEMU is sending a host
>       page, false otherwise.
> 
>   (2) host_page_{start|end}: these point to the start/end of host page
>       we're sending, and it's only valid when host_page_sending==true.
> 
> For example, when we look up the next dirty page on the ramblock, with
> host_page_sending==true, we'll not try to look for anything beyond the
> current host page boundary.  This can be slightly efficient than current
> code because currently we'll set pss->page to next dirty bit (which can be
> over current host page boundary) and reset it to host page boundary if we
> found it goes beyond that.
> 
> With above, we can easily make migration_bitmap_find_dirty() self contained
> by updating pss->page properly.  rs* parameter is removed because it's not
> even used in old code.
> 
> When sending a host page, we should use the pss helpers like this:
> 
>   - pss_host_page_prepare(pss): called before sending host page
>   - pss_within_range(pss): whether we're still working on the cur host page?
>   - pss_host_page_finish(pss): called after sending a host page
> 
> Then we can use ram_save_target_page() to save one small page.
> 
> Currently ram_save_host_page() is still the only user. If there'll be
> another function to send host page (e.g. in return path thread) in the
> future, it should follow the same style.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 95 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 76 insertions(+), 19 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 5bd3d76bf0..3f720b6de2 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -474,6 +474,11 @@ struct PageSearchStatus {
>       * postcopy pages via postcopy preempt channel.
>       */
>      bool         postcopy_target_channel;
> +    /* Whether we're sending a host page */
> +    bool          host_page_sending;
> +    /* The start/end of current host page.  Only valid if host_page_sending==true */
> +    unsigned long host_page_start;
> +    unsigned long host_page_end;
>  };
>  typedef struct PageSearchStatus PageSearchStatus;
>  
> @@ -851,26 +856,38 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
>  }
>  
>  /**
> - * migration_bitmap_find_dirty: find the next dirty page from start
> + * pss_find_next_dirty: find the next dirty page of current ramblock
>   *
> - * Returns the page offset within memory region of the start of a dirty page
> + * This function updates pss->page to point to the next dirty page index
> + * within the ramblock to migrate, or the end of ramblock when nothing
> + * found.  Note that when pss->host_page_sending==true it means we're
> + * during sending a host page, so we won't look for dirty page that is
> + * outside the host page boundary.
>   *
> - * @rs: current RAM state
> - * @rb: RAMBlock where to search for dirty pages
> - * @start: page where we start the search
> + * @pss: the current page search status
>   */
> -static inline
> -unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
> -                                          unsigned long start)
> +static void pss_find_next_dirty(PageSearchStatus *pss)
>  {
> +    RAMBlock *rb = pss->block;
>      unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
>      unsigned long *bitmap = rb->bmap;
>  
>      if (ramblock_is_ignored(rb)) {
> -        return size;
> +        /* Points directly to the end, so we know no dirty page */
> +        pss->page = size;
> +        return;
> +    }
> +
> +    /*
> +     * If during sending a host page, only look for dirty pages within the
> +     * current host page being send.
> +     */
> +    if (pss->host_page_sending) {
> +        assert(pss->host_page_end);
> +        size = MIN(size, pss->host_page_end);
>      }
>  
> -    return find_next_bit(bitmap, size, start);
> +    pss->page = find_next_bit(bitmap, size, pss->page);
>  }
>  
>  static void migration_clear_memory_region_dirty_bitmap(RAMBlock *rb,
> @@ -1556,7 +1573,9 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>      pss->postcopy_requested = false;
>      pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
>  
> -    pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
> +    /* Update pss->page for the next dirty bit in ramblock */
> +    pss_find_next_dirty(pss);
> +
>      if (pss->complete_round && pss->block == rs->last_seen_block &&
>          pss->page >= rs->last_page) {
>          /*
> @@ -2446,6 +2465,44 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
>      }
>  }
>  
> +/* Should be called before sending a host page */
> +static void pss_host_page_prepare(PageSearchStatus *pss)
> +{
> +    /* How many guest pages are there in one host page? */
> +    size_t guest_pfns = qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> +
> +    pss->host_page_sending = true;
> +    pss->host_page_start = ROUND_DOWN(pss->page, guest_pfns);
> +    pss->host_page_end = ROUND_UP(pss->page + 1, guest_pfns);
> +}
> +
> +/*
> + * Whether the page pointed by PSS is within the host page being sent.
> + * Must be called after a previous pss_host_page_prepare().
> + */
> +static bool pss_within_range(PageSearchStatus *pss)
> +{
> +    ram_addr_t ram_addr;
> +
> +    assert(pss->host_page_sending);
> +
> +    /* Over host-page boundary? */
> +    if (pss->page >= pss->host_page_end) {
> +        return false;
> +    }
> +
> +    ram_addr = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
> +
> +    return offset_in_ramblock(pss->block, ram_addr);
> +}
> +
> +static void pss_host_page_finish(PageSearchStatus *pss)
> +{
> +    pss->host_page_sending = false;
> +    /* This is not needed, but just to reset it */
> +    pss->host_page_start = pss->host_page_end = 0;
> +}
> +
>  /**
>   * ram_save_host_page: save a whole host page
>   *
> @@ -2468,8 +2525,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>      int tmppages, pages = 0;
>      size_t pagesize_bits =
>          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> -    unsigned long hostpage_boundary =
> -        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
>      unsigned long start_page = pss->page;
>      int res;
>  
> @@ -2482,6 +2537,9 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>          postcopy_preempt_choose_channel(rs, pss);
>      }
>  
> +    /* Update host page boundary information */
> +    pss_host_page_prepare(pss);
> +
>      do {
>          if (postcopy_needs_preempt(rs, pss)) {
>              postcopy_do_preempt(rs, pss);
> @@ -2520,15 +2578,14 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>          }
>  
>          if (tmppages < 0) {
> +            pss_host_page_finish(pss);
>              return tmppages;
>          }
>  
> -        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
> -    } while ((pss->page < hostpage_boundary) &&
> -             offset_in_ramblock(pss->block,
> -                                ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
> -    /* The offset we leave with is the min boundary of host page and block */
> -    pss->page = MIN(pss->page, hostpage_boundary);
> +        pss_find_next_dirty(pss);
> +    } while (pss_within_range(pss));
> +
> +    pss_host_page_finish(pss);
>  
>      /*
>       * When with postcopy preempt mode, flush the data as soon as possible for
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


