Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3633BDC7E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:48:32 +0200 (CEST)
Received: from localhost ([::1]:42160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0pBP-0007Rc-Ik
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m0pAA-0006jC-0C
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m0pA7-0004jT-98
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625593629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K3Iw1IdMOfMPtY+mMTnRJENxPWpJvU33jHcw4Gv8mX0=;
 b=SQ7lcfDQ1oaTVm7q7cnGO/r5/TiCUx1zTxOVH2zQHQ1mNZbH3fMUp/1DgC6UzMZZoFBvBo
 TtTUYQEPE4ByXRtjUq7wgzi2x2G2zwMTnh1f3s595Ni1mE+yOlFkeMegIbxtbHYDsgg4qw
 lrM9kGE8+nYqfeuVfL/UUTSZ/yiRTHs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-R8aqFGtWO1i8WHdCC9z35Q-1; Tue, 06 Jul 2021 13:47:08 -0400
X-MC-Unique: R8aqFGtWO1i8WHdCC9z35Q-1
Received: by mail-qt1-f199.google.com with SMTP id
 u18-20020a05622a1992b029024f5f5d3a48so2446qtc.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 10:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K3Iw1IdMOfMPtY+mMTnRJENxPWpJvU33jHcw4Gv8mX0=;
 b=VECtYhUvTSlc/Ea3AjUT9Az5gi7iiYRkO0uIGSffAm+uhdvFGhMLaZqz2eEE38kxkf
 n0CsynEu3nNNVQlNVMqyXg5yLFAsaSG6RDCvyQIF6bQR2RSNJUgP97rCKaiUbfqAmXLS
 ENmYNH4n6DiSApdn/aaylwqRgXEBh98HGQmmTGhagYzUtR4+wizlODiOb1qIgO3LgFoD
 tSPD2BSENslepUE/8ovfH+8mAqKfHmAdC+zB4YrHrcaefgsFRhCoTcP9d5xqoTutLwib
 W5qdyv6hfJ66Im7L6w46AXvNLsRZgtUwIK6WrhOACUz9mlu0+DcMX3GQb9yoqfwVhRUm
 W2gw==
X-Gm-Message-State: AOAM533JShptTfxCGBhncHx49MqbNeumU2yo4L78tbcbKrN4571vuNBB
 VocfCKfTJrFmAJ7VYCukMvg7A0+GUIOKDwl1xyQ/Y0Ao+NiLp9VTJscNMZmzpLlgODjXi0W5P1k
 X4rPpyctosH8Rrjk=
X-Received: by 2002:a05:6214:309:: with SMTP id
 i9mr19715428qvu.18.1625593628134; 
 Tue, 06 Jul 2021 10:47:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg6BTlpFgn6yHo+5B0hgUY2XJd76rGo2Gkuwx4aJy7MHLmnqr6eQYSYYbN0yjTdRxU7moj7g==
X-Received: by 2002:a05:6214:309:: with SMTP id
 i9mr19715407qvu.18.1625593627934; 
 Tue, 06 Jul 2021 10:47:07 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j27sm7156544qkl.76.2021.07.06.10.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 10:47:07 -0700 (PDT)
Date: Tue, 6 Jul 2021 13:47:06 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOSXGpEB323VWepM@t490s>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
 <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
MIME-Version: 1.0
In-Reply-To: <562b42cbd5674853af21be3297fbaada@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 03, 2021 at 02:53:27AM +0000, Wang, Wei W wrote:
> On Friday, July 2, 2021 3:07 PM, David Hildenbrand wrote:
> > On 02.07.21 04:48, Wang, Wei W wrote:
> > > On Thursday, July 1, 2021 10:22 PM, David Hildenbrand wrote:
> > >> On 01.07.21 14:51, Peter Xu wrote:
> > 
> > I think that clearly shows the issue.
> > 
> > My theory I did not verify yet: Assume we have 1GB chunks in the clear bmap.
> > Assume the VM reports all pages within a 1GB chunk as free (easy with a fresh
> > VM). While processing hints, we will clear the bits from the dirty bmap in the
> > RAMBlock. As we will never migrate any page of that 1GB chunk, we will not
> > actually clear the dirty bitmap of the memory region. When re-syncing, we will
> > set all bits bits in the dirty bmap again from the dirty bitmap in the memory
> > region. Thus, many of our hints end up being mostly ignored. The smaller the
> > clear bmap chunk, the more extreme the issue.
> 
> OK, that looks possible. We need to clear the related bits from the memory region
> bitmap before skipping the free pages. Could you try with below patch:
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index ace8ad431c..a1f6df3e6c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -811,6 +811,26 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
>      return next;
>  }
> 
> +
> +static void migration_clear_memory_region_dirty_bitmap(RAMState *rs,
> +                                                       RAMBlock *rb,
> +                                                      unsigned long page)
> +{
> +    uint8_t shift;
> +    hwaddr size, start;
> +
> +    if (!rb->clear_bmap || !clear_bmap_test_and_clear(rb, page))
> +        return;
> +
> +    shift = rb->clear_bmap_shift;
> +    assert(shift >= 6);
> +
> +    size = 1ULL << (TARGET_PAGE_BITS + shift);
> +    start = (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size);
> +    trace_migration_bitmap_clear_dirty(rb->idstr, start, size, page);
> +    memory_region_clear_dirty_bitmap(rb->mr, start, size);
> +}
> +
>  static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>                                                  RAMBlock *rb,
>                                                  unsigned long page)
> @@ -827,26 +847,9 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>       * the page in the chunk we clear the remote dirty bitmap for all.
>       * Clearing it earlier won't be a problem, but too late will.
>       */
> -    if (rb->clear_bmap && clear_bmap_test_and_clear(rb, page)) {
> -        uint8_t shift = rb->clear_bmap_shift;
> -        hwaddr size = 1ULL << (TARGET_PAGE_BITS + shift);
> -        hwaddr start = (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size);
> -
> -        /*
> -         * CLEAR_BITMAP_SHIFT_MIN should always guarantee this... this
> -         * can make things easier sometimes since then start address
> -         * of the small chunk will always be 64 pages aligned so the
> -         * bitmap will always be aligned to unsigned long.  We should
> -         * even be able to remove this restriction but I'm simply
> -         * keeping it.
> -         */
> -        assert(shift >= 6);
> -        trace_migration_bitmap_clear_dirty(rb->idstr, start, size, page);
> -        memory_region_clear_dirty_bitmap(rb->mr, start, size);
> -    }
> +    migration_clear_memory_region_dirty_bitmap(rs, rb, page);
> 
>      ret = test_and_clear_bit(page, rb->bmap);
> -
>      if (ret) {
>          rs->migration_dirty_pages--;
>      }
> @@ -2746,7 +2749,7 @@ void qemu_guest_free_page_hint(void *addr, size_t len)
>  {
>      RAMBlock *block;
>      ram_addr_t offset;
> -    size_t used_len, start, npages;
> +    size_t used_len, start, npages, page_to_clear, i = 0;
>      MigrationState *s = migrate_get_current();
> 
>      /* This function is currently expected to be used during live migration */
> @@ -2775,6 +2778,19 @@ void qemu_guest_free_page_hint(void *addr, size_t len)
>          start = offset >> TARGET_PAGE_BITS;
>          npages = used_len >> TARGET_PAGE_BITS;
> 
> +        /*
> +         * The skipped free pages are equavelent to be sent from clear_bmap's
> +        * perspective, so clear the bits from the memory region bitmap which
> +        * are initially set. Otherwise those skipped pages will be sent in
> +        * the next round after syncing from the memory region bitmap.
> +        */
> +        /*
> +         * The skipped free pages are equavelent to be sent from clear_bmap's
> +        * perspective, so clear the bits from the memory region bitmap which
> +        * are initially set. Otherwise those skipped pages will be sent in
> +        * the next round after syncing from the memory region bitmap.
> +        */
> +       do {
> +            page_to_clear = start + (i++ << block->clear_bmap_shift);

Why "i" needs to be shifted?

> +            migration_clear_memory_region_dirty_bitmap(ram_state,
> +                                                       block,
> +                                                       page_to_clear);
> +       } while (i <= npages >> block->clear_bmap_shift);

I agree with David that this should be better put into the mutex section, if so
we'd also touch up comment for bitmap_mutex.  Or is it a reason to explicitly
not do so?

> +
>          qemu_mutex_lock(&ram_state->bitmap_mutex);
>          ram_state->migration_dirty_pages -=
>                        bitmap_count_one_with_offset(block->bmap, start, npages);

After my patch (move mutex out of migration_bitmap_clear_dirty()), maybe we can
call migration_bitmap_clear_dirty() directly here rather than introducing a new
helper?  It'll done all the dirty/clear bmap ops including dirty page accounting.

Thanks,

-- 
Peter Xu


