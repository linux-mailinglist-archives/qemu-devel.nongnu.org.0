Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8993A9EEF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:25:12 +0200 (CEST)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXPj-0000vE-Lf
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltXNY-0006Jw-4B
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:22:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltXNU-0005r3-Bc
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623856969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PvZeaS13KCdaLy/oXrlCsZ7XbgFURbAIXDUt5bnINgk=;
 b=jNhxjFCPyAIQZsKydzfr46Coh0eQnLj5Cc+x3RvLpujezx3OamUZ49pdRH4JCFTz/AqgUY
 8sib6sjqDcegAtI8fZJX8fA6P2/MOQiTmF+PI1Ma0H16O3OK/QCGNEjZagplJOcLqQoAeW
 ZsVYGw4fq4lIwdpnLFLWqScFKynBVg4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-7eFrQVFNPrWQy84OYX8FTw-1; Wed, 16 Jun 2021 11:22:45 -0400
X-MC-Unique: 7eFrQVFNPrWQy84OYX8FTw-1
Received: by mail-qt1-f200.google.com with SMTP id
 z5-20020ac86c450000b029024e9a87714dso1831877qtu.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PvZeaS13KCdaLy/oXrlCsZ7XbgFURbAIXDUt5bnINgk=;
 b=BtkUuv0iQFKStcT7Com5OstFGhGUWg8IL/CweCqfSdSlmKqtyaiXjdsBNEIwUiBpla
 yV9xZkB3IsH3Kx74TAJPtJhHxuC2hp1UlSfBJFfPIW6fpvhjSx5gDPJFhU60NSWQOIVl
 nKrqUaq89YSRc1gVxcSOGmWmCRtckfhfBpqazDBxuiero3l4vJa/lwpN0lb5k6IB9n8N
 G79lzidEbqkV9O8gfk6QLG9430etQ3KM7VdygIDt2wZE8kpq3Nv6TBkqG/LAg1KgAqfQ
 NlBaEwx+vs/Ym075eQqwyE4swYIMHlLH/QkEsZyJqnXuXGy+UPm530H63DCmIEmK24PT
 nuoQ==
X-Gm-Message-State: AOAM531I2xebFnyMa+qadkDwhYLdTgROJf6lfXvQuaWPfTNJfQm7Vwgw
 Rc/0a7kkPzhYRQW4VYdBG1VFYlfvo8Qd8Gmj2n42cNn/27EUjWBJGrRVlnGYGWTgZC/FFeNdyYa
 yAevxvdcBG9Kebu4=
X-Received: by 2002:a0c:ef41:: with SMTP id t1mr512487qvs.2.1623856965435;
 Wed, 16 Jun 2021 08:22:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9WvmqZJy+ivFyakc1OInibwJOzNVw71yhK/D7TVzTUJgjpUhD+NzsSu6GVMsk7StN9tv6PA==
X-Received: by 2002:a0c:ef41:: with SMTP id t1mr512460qvs.2.1623856965212;
 Wed, 16 Jun 2021 08:22:45 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id l3sm1391271qth.87.2021.06.16.08.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 08:22:44 -0700 (PDT)
Date: Wed, 16 Jun 2021 11:22:43 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v4 2/6] memory: make global_dirty_log a bitmask
Message-ID: <YMoXQxNW0EHGXCS8@t490s>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
 <3848028c3029e2e870286c84c2b3e9a93967567e.1623804189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <3848028c3029e2e870286c84c2b3e9a93967567e.1623804189.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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

On Wed, Jun 16, 2021 at 09:12:28AM +0800, huangy81@chinatelecom.cn wrote:
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index b114f54..e31eef2 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -55,7 +55,11 @@ static inline void fuzz_dma_read_cb(size_t addr,
>  }
>  #endif
>  
> -extern bool global_dirty_log;
> +/* what is the purpose of current dirty log, migration or dirty rate ? */

Nitpick: I'll make it:

  /* Possible bits for global_dirty_log */

  /* Dirty tracking enabled because migration is running */
  #define GLOBAL_DIRTY_MIGRATION  (1U << 0)

  /* Dirty tracking enabled because measuring dirty rate */
  #define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)

> +#define GLOBAL_DIRTY_MIGRATION  (1U << 0)
> +#define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
> +
> +extern unsigned int global_dirty_log;
>  
>  typedef struct MemoryRegionOps MemoryRegionOps;
>  

[...]

> @@ -39,7 +39,7 @@
>  static unsigned memory_region_transaction_depth;
>  static bool memory_region_update_pending;
>  static bool ioeventfd_update_pending;
> -bool global_dirty_log;
> +unsigned int global_dirty_log;

I'm wondering whether it's a good chance to rename it to global_dirty_tracking,
because "logging" has a hint on the method while it's not the only one now.

>  
>  static QTAILQ_HEAD(, MemoryListener) memory_listeners
>      = QTAILQ_HEAD_INITIALIZER(memory_listeners);
> @@ -2659,14 +2659,19 @@ void memory_global_after_dirty_log_sync(void)
>  
>  static VMChangeStateEntry *vmstate_change;
>  
> -void memory_global_dirty_log_start(void)
> +void memory_global_dirty_log_start(unsigned int flags)
>  {
>      if (vmstate_change) {
>          qemu_del_vm_change_state_handler(vmstate_change);
>          vmstate_change = NULL;
>      }
>  
> -    global_dirty_log = true;
> +#define  GLOBAL_DIRTY_MASK  (0x3)
> +    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
> +    assert(global_dirty_log ^ flags);

Heh, this is probably my fault... I think what I wanted to suggest is actually:

       assert(!(global_dirty_log & flags));

Then for stop() below...

> +    global_dirty_log |= flags;
> +
> +    trace_global_dirty_changed(global_dirty_log);
>  
>      MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
>  
> @@ -2676,9 +2681,12 @@ void memory_global_dirty_log_start(void)
>      memory_region_transaction_commit();
>  }
>  
> -static void memory_global_dirty_log_do_stop(void)
> +static void memory_global_dirty_log_do_stop(unsigned int flags)
>  {
> -    global_dirty_log = false;
> +    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));

... it should probably be:

       assert((global_dirty_log & flags) == flags);

Sorry about the confusion.

-- 
Peter Xu


