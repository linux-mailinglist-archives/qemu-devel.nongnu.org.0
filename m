Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D1846D7B6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 17:07:26 +0100 (CET)
Received: from localhost ([::1]:55242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muzTZ-0002O5-6o
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 11:07:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1muzRc-0008G6-Ad
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:05:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1muzRX-0002ij-IE
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638979517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=13ykzqGdpHPm3YV2CxLMAdCC2hsKbQv3IctMo/vpM2M=;
 b=UZNhC693j+gHSwGFwgcl05rksBMDbX4EPgXViL1pZeB48LX38XRki+FwntQcYZfgtobRBa
 +ZNOhJTS7vuQlFWp59KLm9NkwuaJCm4DBhMxxlIkGRbasOrABa2v5QtZGnowwnOz7dedD4
 VMGiVpgFm3q2tpJ/W5wTImWRhb8p4aM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-3-etjCG3OBue4CWel3hCPA-1; Wed, 08 Dec 2021 11:05:16 -0500
X-MC-Unique: 3-etjCG3OBue4CWel3hCPA-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay17-20020a05600c1e1100b0033f27b76819so1513917wmb.4
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 08:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=13ykzqGdpHPm3YV2CxLMAdCC2hsKbQv3IctMo/vpM2M=;
 b=caRraY+erzZOGQkjSYOf65PDiEDwDHkWdBbffFK+JIgDHMgrO3ruQx0/wG3hgFV9g0
 CQMVpxt+J425h0zUpJ6STUUaekpep5nX5j+LjNc6PMOY8ZonBTM4smtVKlJJ2XtZ3ZxA
 5xIgdvZVXJ73MHXAFtRdpE3STJV1BPvE04RZJeAS/3tOn5etdM/Dq4IGSC5ALuZopeli
 2HixevbsIhkKsY4HyXVNBYSh7ijEnOBo8NcsLMHWSuL7oMwTen/wp9RB2qGFyuz7gc92
 Tcf3b+B70z0yhQnoVVeA80wKP7yp7afMoJRNixq1l76fliAUJJNVJMH1Lpn4BRbb8x11
 ydbQ==
X-Gm-Message-State: AOAM5336dhrxu/Cne05ZReP0uV8vI2EsX9MkvHol0GLzNwb/WwEqbpHe
 6w8++oS6YPm8SN92KndhUxZXHK0MWZ5+dQ2ctf/6m9uY47LwJ7yLBKcHlaca5hKiTnifHWZ531T
 2S2ZyEntBYyGOYFs=
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr17394928wmq.142.1638979514961; 
 Wed, 08 Dec 2021 08:05:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0rhoykwxwzl9XcB+1O9MmpWTa79iGiqxbukkqRsGGUOFPmVtHnwUe9Y92xFXb6ZOSnhq9Sw==
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr17394899wmq.142.1638979514743; 
 Wed, 08 Dec 2021 08:05:14 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id f18sm3134911wre.7.2021.12.08.08.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 08:05:14 -0800 (PST)
Date: Wed, 8 Dec 2021 16:05:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/7] migration: Drop dead code of ram_debug_dump_bitmap()
Message-ID: <YbDXt/7fUR4KhVbv@work-vm>
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-2-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207115016.73195-2-peterx@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> I planned to add "#ifdef DEBUG_POSTCOPY" around the function too because
> otherwise it'll be compiled into qemu binary even if it'll never be used.  Then
> I found that maybe it's easier to just drop it for good..
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yeh, it was useful debugging the bitmap in the early days.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Dave
> ---
>  migration/ram.c | 39 ---------------------------------------
>  migration/ram.h |  2 --
>  2 files changed, 41 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 863035d235..756ac800a7 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2413,40 +2413,6 @@ static void ram_state_reset(RAMState *rs)
>  
>  #define MAX_WAIT 50 /* ms, half buffered_file limit */
>  
> -/*
> - * 'expected' is the value you expect the bitmap mostly to be full
> - * of; it won't bother printing lines that are all this value.
> - * If 'todump' is null the migration bitmap is dumped.
> - */
> -void ram_debug_dump_bitmap(unsigned long *todump, bool expected,
> -                           unsigned long pages)
> -{
> -    int64_t cur;
> -    int64_t linelen = 128;
> -    char linebuf[129];
> -
> -    for (cur = 0; cur < pages; cur += linelen) {
> -        int64_t curb;
> -        bool found = false;
> -        /*
> -         * Last line; catch the case where the line length
> -         * is longer than remaining ram
> -         */
> -        if (cur + linelen > pages) {
> -            linelen = pages - cur;
> -        }
> -        for (curb = 0; curb < linelen; curb++) {
> -            bool thisbit = test_bit(cur + curb, todump);
> -            linebuf[curb] = thisbit ? '1' : '.';
> -            found = found || (thisbit != expected);
> -        }
> -        if (found) {
> -            linebuf[curb] = '\0';
> -            fprintf(stderr,  "0x%08" PRIx64 " : %s\n", cur, linebuf);
> -        }
> -    }
> -}
> -
>  /* **** functions for postcopy ***** */
>  
>  void ram_postcopy_migrated_memory_release(MigrationState *ms)
> @@ -2674,11 +2640,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
>          if (ret) {
>              return ret;
>          }
> -
> -#ifdef DEBUG_POSTCOPY
> -        ram_debug_dump_bitmap(block->bmap, true,
> -                              block->used_length >> TARGET_PAGE_BITS);
> -#endif
>      }
>      trace_ram_postcopy_send_discard_bitmap();
>  
> diff --git a/migration/ram.h b/migration/ram.h
> index c515396a9a..f543e25765 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -55,8 +55,6 @@ void mig_throttle_counter_reset(void);
>  uint64_t ram_pagesize_summary(void);
>  int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
>  void acct_update_position(QEMUFile *f, size_t size, bool zero);
> -void ram_debug_dump_bitmap(unsigned long *todump, bool expected,
> -                           unsigned long pages);
>  void ram_postcopy_migrated_memory_release(MigrationState *ms);
>  /* For outgoing discard bitmap */
>  int ram_postcopy_send_discard_bitmap(MigrationState *ms);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


