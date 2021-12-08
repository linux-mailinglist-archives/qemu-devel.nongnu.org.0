Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD346DACB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 19:13:22 +0100 (CET)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv1RQ-00039E-Oz
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 13:13:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mv1QK-0002U5-0L
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 13:12:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mv1QG-0007ds-L7
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 13:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638987127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HacGarhUqgonAJ3KBLvpuht7fvZG1o2wSDqT59MSb1c=;
 b=afN7Q0xVzn96GubkwWXpqAoyxTGSi6AR0fmUfj+x5osNcraJqlyS6Dku5akLnJHJBU8yqn
 4k5Xc6aTDP9ipGRF03JwRGC0/4K/ab/f9ES+D+F9q+mSlblVNY2Wk3I45CV0qIJl05gLb3
 Fv+Jt7I3niU/XU6UJXnzQ0tBENKCC1E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108--nZjwF0qO76EfKCqAK3dvg-1; Wed, 08 Dec 2021 13:12:06 -0500
X-MC-Unique: -nZjwF0qO76EfKCqAK3dvg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1636969wms.7
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 10:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HacGarhUqgonAJ3KBLvpuht7fvZG1o2wSDqT59MSb1c=;
 b=k2d9rMAISss8v1Z/JGt7ij6vj3q0/spugTAmXRoffA8xt3MQTSX5Y5KNr+fZgIfXhS
 unQNZGsaPvNkVSPBf/QH3VpsNT6yWo3DIm3NpDZyM7bXjKBa/5H4Q7kpOz4AWGLCIaNb
 uiCBuRWiWKws+Zbfk1wJ6SjsO4YAVLE6imrnTtgyvqLfT9fUiZXR9tM2lA1//4u0xMXN
 fPJh1kH/ovDTvxwpPuG84bpi2Dh7KlZ5f/gl415AEUTpLc3T/251Nuf5/upV83oApS1M
 ie04DlyepFkqq/D+YJmlk55Z1dcGuvAP4CvX0Ei0ecc/RMwukyJLy4qCtRuPKTNubhqj
 f5Xw==
X-Gm-Message-State: AOAM530DedcvSEz6bp03AtyOn/SMbwxE4pk8MCOvuE+NXX3djI8rdKJ0
 FlKS41VIg+XJwSlLrlqgPHhYQ45iY64M7MxCoGgih6B6au33arFIKkGy1JbjTBWjIAEdcoOnRsw
 +EpehJtGFgKydqQs=
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr392385wmb.114.1638987125084; 
 Wed, 08 Dec 2021 10:12:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6jFT8oVQ+wR7fqF4XPbm8HkwdDt0UIRddzfT9+NKWrMmbtxpxTysu3XfF3dWa0LY7/aFf6g==
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr392346wmb.114.1638987124831; 
 Wed, 08 Dec 2021 10:12:04 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id ay21sm6308639wmb.7.2021.12.08.10.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 10:12:04 -0800 (PST)
Date: Wed, 8 Dec 2021 18:12:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 5/7] migration: Drop return code for disgard ram process
Message-ID: <YbD1cqa+F70QZY2M@work-vm>
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-6-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207115016.73195-6-peterx@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> It will just never fail.  Drop those return values where they're constantly
> zeros.
> 
> A tiny touch-up on the tracepoint so trace_ram_postcopy_send_discard_bitmap()
> is called after the logic itself (which sounds more reasonable).
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c |  5 +----
>  migration/ram.c       | 20 +++++---------------
>  migration/ram.h       |  2 +-
>  3 files changed, 7 insertions(+), 20 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index abaf6f9e3d..c2e5539721 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2983,10 +2983,7 @@ static int postcopy_start(MigrationState *ms)
>       * that are dirty
>       */
>      if (migrate_postcopy_ram()) {
> -        if (ram_postcopy_send_discard_bitmap(ms)) {
> -            error_report("postcopy send discard bitmap failed");
> -            goto fail;
> -        }
> +        ram_postcopy_send_discard_bitmap(ms);
>      }
>  
>      /*
> diff --git a/migration/ram.c b/migration/ram.c
> index ecc744d54d..28f1ace0f7 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2478,8 +2478,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
>  /**
>   * postcopy_each_ram_send_discard: discard all RAMBlocks
>   *
> - * Returns 0 for success or negative for error
> - *
>   * Utility for the outgoing postcopy code.
>   *   Calls postcopy_send_discard_bm_ram for each RAMBlock
>   *   passing it bitmap indexes and name.
> @@ -2488,10 +2486,9 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
>   *
>   * @ms: current migration state
>   */
> -static int postcopy_each_ram_send_discard(MigrationState *ms)
> +static void postcopy_each_ram_send_discard(MigrationState *ms)
>  {
>      struct RAMBlock *block;
> -    int ret;
>  
>      RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>          postcopy_discard_send_init(ms, block->idstr);
> @@ -2509,14 +2506,9 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
>           * just needs indexes at this point, avoids it having
>           * target page specific code.
>           */
> -        ret = postcopy_send_discard_bm_ram(ms, block);
> +        postcopy_send_discard_bm_ram(ms, block);
>          postcopy_discard_send_finish(ms);
> -        if (ret) {
> -            return ret;
> -        }
>      }
> -
> -    return 0;
>  }
>  
>  /**
> @@ -2589,8 +2581,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
>  /**
>   * ram_postcopy_send_discard_bitmap: transmit the discard bitmap
>   *
> - * Returns zero on success
> - *
>   * Transmit the set of pages to be discarded after precopy to the target
>   * these are pages that:
>   *     a) Have been previously transmitted but are now dirty again
> @@ -2601,7 +2591,7 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
>   *
>   * @ms: current migration state
>   */
> -int ram_postcopy_send_discard_bitmap(MigrationState *ms)
> +void ram_postcopy_send_discard_bitmap(MigrationState *ms)
>  {
>      RAMState *rs = ram_state;
>  
> @@ -2615,9 +2605,9 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
>      rs->last_sent_block = NULL;
>      rs->last_page = 0;
>  
> -    trace_ram_postcopy_send_discard_bitmap();
> +    postcopy_each_ram_send_discard(ms);
>  
> -    return postcopy_each_ram_send_discard(ms);
> +    trace_ram_postcopy_send_discard_bitmap();
>  }
>  
>  /**
> diff --git a/migration/ram.h b/migration/ram.h
> index f543e25765..2c6dc3675d 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -57,7 +57,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
>  void acct_update_position(QEMUFile *f, size_t size, bool zero);
>  void ram_postcopy_migrated_memory_release(MigrationState *ms);
>  /* For outgoing discard bitmap */
> -int ram_postcopy_send_discard_bitmap(MigrationState *ms);
> +void ram_postcopy_send_discard_bitmap(MigrationState *ms);
>  /* For incoming postcopy discard */
>  int ram_discard_range(const char *block_name, uint64_t start, size_t length);
>  int ram_postcopy_incoming_init(MigrationIncomingState *mis);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


