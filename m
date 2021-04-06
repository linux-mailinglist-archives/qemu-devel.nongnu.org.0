Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5735541A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:42:13 +0200 (CEST)
Received: from localhost ([::1]:37450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTl24-0003H8-CX
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTkru-0001PM-61
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTkrq-0008Qb-GX
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617712296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ObujcMHLNN7xCptFhTiQPW+rXAvTk6GPSAdXU6OkNQ=;
 b=iN+iAXgbxX5xjM4ud1OL1RjMJxA4JVkjxQBiiOOdvLgX5KxIbYxm+5h2IUBs9RUesn8305
 RHJX/X9ucXwFOb7sh6LSINBN2N1WaKhUopLy3oLjc/TdVUy9gOkBKIXauipHomQxwd87vh
 0qUmIMaVuSh9yuzCK4kVesLgPbUrxFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-Ililw4cpM6-x_bf8FXqT9g-1; Tue, 06 Apr 2021 08:31:34 -0400
X-MC-Unique: Ililw4cpM6-x_bf8FXqT9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 429F4920C81;
 Tue,  6 Apr 2021 12:31:23 +0000 (UTC)
Received: from work-vm (ovpn-114-244.ams2.redhat.com [10.36.114.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9F8F67891;
 Tue,  6 Apr 2021 12:30:59 +0000 (UTC)
Date: Tue, 6 Apr 2021 13:30:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH for-6.0 v1 4/4] migration: Rename 'bs' to 'block' in
 background snapshot code
Message-ID: <YGxUgTTrLyH+VojI@work-vm>
References: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
 <20210401092226.102804-5-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210401092226.102804-5-andrey.gruzdev@virtuozzo.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> Rename 'bs' to commonly used 'block' in migration/ram.c background
> snapshot code.
> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> Reported-by: David Hildenbrand <david@redhat.com>

Thanks,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 86 +++++++++++++++++++++++++------------------------
>  1 file changed, 44 insertions(+), 42 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 7e2bc0fdd3..4682f3625c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1455,7 +1455,7 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
>  {
>      struct uffd_msg uffd_msg;
>      void *page_address;
> -    RAMBlock *bs;
> +    RAMBlock *block;
>      int res;
>  
>      if (!migrate_background_snapshot()) {
> @@ -1468,9 +1468,9 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
>      }
>  
>      page_address = (void *)(uintptr_t) uffd_msg.arg.pagefault.address;
> -    bs = qemu_ram_block_from_host(page_address, false, offset);
> -    assert(bs && (bs->flags & RAM_UF_WRITEPROTECT) != 0);
> -    return bs;
> +    block = qemu_ram_block_from_host(page_address, false, offset);
> +    assert(block && (block->flags & RAM_UF_WRITEPROTECT) != 0);
> +    return block;
>  }
>  
>  /**
> @@ -1526,7 +1526,7 @@ bool ram_write_tracking_compatible(void)
>  {
>      const uint64_t uffd_ioctls_mask = BIT(_UFFDIO_WRITEPROTECT);
>      int uffd_fd;
> -    RAMBlock *bs;
> +    RAMBlock *block;
>      bool ret = false;
>  
>      /* Open UFFD file descriptor */
> @@ -1537,15 +1537,15 @@ bool ram_write_tracking_compatible(void)
>  
>      RCU_READ_LOCK_GUARD();
>  
> -    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> +    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>          uint64_t uffd_ioctls;
>  
>          /* Nothing to do with read-only and MMIO-writable regions */
> -        if (bs->mr->readonly || bs->mr->rom_device) {
> +        if (block->mr->readonly || block->mr->rom_device) {
>              continue;
>          }
>          /* Try to register block memory via UFFD-IO to track writes */
> -        if (uffd_register_memory(uffd_fd, bs->host, bs->max_length,
> +        if (uffd_register_memory(uffd_fd, block->host, block->max_length,
>                  UFFDIO_REGISTER_MODE_WP, &uffd_ioctls)) {
>              goto out;
>          }
> @@ -1567,13 +1567,13 @@ out:
>   * Since it's solely used for userfault_fd WP feature, here we just
>   *   hardcode page size to qemu_real_host_page_size.
>   *
> - * @bs: RAM block to populate
> + * @block: RAM block to populate
>   */
> -static void ram_block_populate_pages(RAMBlock *bs)
> +static void ram_block_populate_pages(RAMBlock *block)
>  {
> -    char *ptr = (char *) bs->host;
> +    char *ptr = (char *) block->host;
>  
> -    for (ram_addr_t offset = 0; offset < bs->used_length;
> +    for (ram_addr_t offset = 0; offset < block->used_length;
>              offset += qemu_real_host_page_size) {
>          char tmp = *(ptr + offset);
>  
> @@ -1587,13 +1587,13 @@ static void ram_block_populate_pages(RAMBlock *bs)
>   */
>  void ram_write_tracking_prepare(void)
>  {
> -    RAMBlock *bs;
> +    RAMBlock *block;
>  
>      RCU_READ_LOCK_GUARD();
>  
> -    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> +    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>          /* Nothing to do with read-only and MMIO-writable regions */
> -        if (bs->mr->readonly || bs->mr->rom_device) {
> +        if (block->mr->readonly || block->mr->rom_device) {
>              continue;
>          }
>  
> @@ -1605,7 +1605,7 @@ void ram_write_tracking_prepare(void)
>           * UFFDIO_WRITEPROTECT_MODE_WP mode setting would silently skip
>           * pages with pte_none() entries in page table.
>           */
> -        ram_block_populate_pages(bs);
> +        ram_block_populate_pages(block);
>      }
>  }
>  
> @@ -1618,7 +1618,7 @@ int ram_write_tracking_start(void)
>  {
>      int uffd_fd;
>      RAMState *rs = ram_state;
> -    RAMBlock *bs;
> +    RAMBlock *block;
>  
>      /* Open UFFD file descriptor */
>      uffd_fd = uffd_create_fd(UFFD_FEATURE_PAGEFAULT_FLAG_WP, true);
> @@ -1629,27 +1629,27 @@ int ram_write_tracking_start(void)
>  
>      RCU_READ_LOCK_GUARD();
>  
> -    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> +    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>          /* Nothing to do with read-only and MMIO-writable regions */
> -        if (bs->mr->readonly || bs->mr->rom_device) {
> +        if (block->mr->readonly || block->mr->rom_device) {
>              continue;
>          }
>  
>          /* Register block memory with UFFD to track writes */
> -        if (uffd_register_memory(rs->uffdio_fd, bs->host,
> -                bs->max_length, UFFDIO_REGISTER_MODE_WP, NULL)) {
> +        if (uffd_register_memory(rs->uffdio_fd, block->host,
> +                block->max_length, UFFDIO_REGISTER_MODE_WP, NULL)) {
>              goto fail;
>          }
>          /* Apply UFFD write protection to the block memory range */
> -        if (uffd_change_protection(rs->uffdio_fd, bs->host,
> -                bs->max_length, true, false)) {
> +        if (uffd_change_protection(rs->uffdio_fd, block->host,
> +                block->max_length, true, false)) {
>              goto fail;
>          }
> -        bs->flags |= RAM_UF_WRITEPROTECT;
> -        memory_region_ref(bs->mr);
> +        block->flags |= RAM_UF_WRITEPROTECT;
> +        memory_region_ref(block->mr);
>  
> -        trace_ram_write_tracking_ramblock_start(bs->idstr, bs->page_size,
> -                bs->host, bs->max_length);
> +        trace_ram_write_tracking_ramblock_start(block->idstr, block->page_size,
> +                block->host, block->max_length);
>      }
>  
>      return 0;
> @@ -1657,19 +1657,20 @@ int ram_write_tracking_start(void)
>  fail:
>      error_report("ram_write_tracking_start() failed: restoring initial memory state");
>  
> -    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> -        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
> +    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
> +        if ((block->flags & RAM_UF_WRITEPROTECT) == 0) {
>              continue;
>          }
>          /*
>           * In case some memory block failed to be write-protected
>           * remove protection and unregister all succeeded RAM blocks
>           */
> -        uffd_change_protection(rs->uffdio_fd, bs->host, bs->max_length, false, false);
> -        uffd_unregister_memory(rs->uffdio_fd, bs->host, bs->max_length);
> +        uffd_change_protection(rs->uffdio_fd, block->host, block->max_length,
> +                false, false);
> +        uffd_unregister_memory(rs->uffdio_fd, block->host, block->max_length);
>          /* Cleanup flags and remove reference */
> -        bs->flags &= ~RAM_UF_WRITEPROTECT;
> -        memory_region_unref(bs->mr);
> +        block->flags &= ~RAM_UF_WRITEPROTECT;
> +        memory_region_unref(block->mr);
>      }
>  
>      uffd_close_fd(uffd_fd);
> @@ -1683,24 +1684,25 @@ fail:
>  void ram_write_tracking_stop(void)
>  {
>      RAMState *rs = ram_state;
> -    RAMBlock *bs;
> +    RAMBlock *block;
>  
>      RCU_READ_LOCK_GUARD();
>  
> -    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> -        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
> +    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
> +        if ((block->flags & RAM_UF_WRITEPROTECT) == 0) {
>              continue;
>          }
>          /* Remove protection and unregister all affected RAM blocks */
> -        uffd_change_protection(rs->uffdio_fd, bs->host, bs->max_length, false, false);
> -        uffd_unregister_memory(rs->uffdio_fd, bs->host, bs->max_length);
> +        uffd_change_protection(rs->uffdio_fd, block->host, block->max_length,
> +                false, false);
> +        uffd_unregister_memory(rs->uffdio_fd, block->host, block->max_length);
>  
> -        trace_ram_write_tracking_ramblock_stop(bs->idstr, bs->page_size,
> -                bs->host, bs->max_length);
> +        trace_ram_write_tracking_ramblock_stop(block->idstr, block->page_size,
> +                block->host, block->max_length);
>  
>          /* Cleanup flags and remove reference */
> -        bs->flags &= ~RAM_UF_WRITEPROTECT;
> -        memory_region_unref(bs->mr);
> +        block->flags &= ~RAM_UF_WRITEPROTECT;
> +        memory_region_unref(block->mr);
>      }
>  
>      /* Finally close UFFD file descriptor */
> -- 
> 2.27.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


