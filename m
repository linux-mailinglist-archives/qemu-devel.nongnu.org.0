Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCB946DA2D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 18:41:01 +0100 (CET)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0w7-0001mi-S8
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 12:40:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mv0v9-00011x-GF
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mv0uz-00023H-0D
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638985187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dErkYfveyK9o2z2cPrFA1xiflKXroZilMfcQJqAXsmg=;
 b=cAcMdUaFL5XxJSw/E3N+CbfVJO/k5Zq1mOz3SSib6TGjL4FuC3iZXeIKUqaUI16eFlurxg
 SvYcmoCjuLcQNzfC8NB0OQ2Gcw52tavjtRM6M1ZPfVgA1hQGH19EyXV5p+azYSXkjbFYOw
 2aqKdvYI76IA6nUi0QcLw695aFqKrqw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-40-5BzoXlf0OxOBbdRPdQ01CQ-1; Wed, 08 Dec 2021 12:39:46 -0500
X-MC-Unique: 5BzoXlf0OxOBbdRPdQ01CQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so1597620wms.6
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 09:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dErkYfveyK9o2z2cPrFA1xiflKXroZilMfcQJqAXsmg=;
 b=XazDdepsq0GbzoZ7Bjx5f/9Jw93BPOKeAcW07bQQ7htunRWhzhArhs29L/OaBEvOzz
 PicsasQ9vElbeQr0NDOJJlqLerW/KtqkrvBUj9UeN536GESfbExGYr6q8RKPcfFcXZNA
 gsq0aL/wtnZiaML5wmLDjEbrtMscFZ0TMCp8yBhe1UjADlZw56Dkz26S/NxOuvEfYuCo
 ZahqGYifRfMw7TeJlJlEhrCCJ0nfDyM8peMbzi14ClgVbh+GHJfSgE7hfPw0aNh9lbJy
 t2ugUCVbKAQ78pRwX8FY6pVBnA1HioVyJ05elhPyUOH+9D0ElpqCOD/NzZAg2VAkYacB
 mNKQ==
X-Gm-Message-State: AOAM5338A0t60YqQfYlMS+dwz5+K+QqfYmPIY3eibmyFvWEHh8ldnhng
 AsLAEurz0Df6F6YZF0rPh2C9VR5s/Pkl54AJfEUwZNOgym+QT7PczIYAg1IkX8Tpw/LHOSKUTGT
 VSSSxV1esoclSZBY=
X-Received: by 2002:a5d:456e:: with SMTP id a14mr146158wrc.256.1638985185337; 
 Wed, 08 Dec 2021 09:39:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBbTa+w+eWATwD/lMdoSARmSxQGNfbdoJ4XowTnDbrH3uIxJEf1QqgVUsCxl1nAk0n1qrdiA==
X-Received: by 2002:a5d:456e:: with SMTP id a14mr146128wrc.256.1638985185058; 
 Wed, 08 Dec 2021 09:39:45 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id a1sm4517494wri.89.2021.12.08.09.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 09:39:44 -0800 (PST)
Date: Wed, 8 Dec 2021 17:39:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/7] migration: Do chunk page in
 postcopy_each_ram_send_discard()
Message-ID: <YbDt3nF7bFdTtkJ5@work-vm>
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-5-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207115016.73195-5-peterx@redhat.com>
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
> Right now we loop ramblocks for twice, the 1st time chunk the dirty bits with
> huge page information; the 2nd time we send the discard ranges.  That's not
> necessary - we can do them in a single loop.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index e3876181ab..ecc744d54d 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2473,6 +2473,8 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
>      return 0;
>  }
>  
> +static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
> +
>  /**
>   * postcopy_each_ram_send_discard: discard all RAMBlocks
>   *
> @@ -2494,6 +2496,14 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
>      RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>          postcopy_discard_send_init(ms, block->idstr);
>  
> +        /*
> +         * Deal with TPS != HPS and huge pages.  It discard any partially sent
> +         * host-page size chunks, mark any partially dirty host-page size
> +         * chunks as all dirty.  In this case the host-page is the host-page
> +         * for the particular RAMBlock, i.e. it might be a huge page.
> +         */
> +        postcopy_chunk_hostpages_pass(ms, block);
> +
>          /*
>           * Postcopy sends chunks of bitmap over the wire, but it
>           * just needs indexes at this point, avoids it having
> @@ -2594,7 +2604,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
>  int ram_postcopy_send_discard_bitmap(MigrationState *ms)
>  {
>      RAMState *rs = ram_state;
> -    RAMBlock *block;
>  
>      RCU_READ_LOCK_GUARD();
>  
> @@ -2606,15 +2615,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
>      rs->last_sent_block = NULL;
>      rs->last_page = 0;
>  
> -    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
> -        /*
> -         * Deal with TPS != HPS and huge pages.  It discard any partially sent
> -         * host-page size chunks, mark any partially dirty host-page size
> -         * chunks as all dirty.  In this case the host-page is the host-page
> -         * for the particular RAMBlock, i.e. it might be a huge page.
> -         */
> -        postcopy_chunk_hostpages_pass(ms, block);
> -    }
>      trace_ram_postcopy_send_discard_bitmap();
>  
>      return postcopy_each_ram_send_discard(ms);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


