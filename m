Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA0530E80
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 13:04:57 +0200 (CEST)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt5rs-0003wU-Uo
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 07:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nt5jb-0007Xx-RS
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nt5jY-0004FC-Gy
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653303379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xCIQ07LJk4eNQTP9D28bb4xS5JvcaiG1kYItB/4WJXg=;
 b=SiusNb5qp4lMRpgK5zHJDnvUIbey8REzAtoGhxB9IrkxHGytJ03qbmgy1i8PyAPSPCf03X
 0bIULMTly3vkhvpwmk8VRYTVSop55Abwnil+YLlg0W1Tv5g1+Eq6vkuI+KRb+Po9UOtBVg
 ymyvx2g0HFWWcVts6IgRpHMLTLhboX8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-DJBSISEqNoW4FcJ1s53thg-1; Mon, 23 May 2022 06:56:18 -0400
X-MC-Unique: DJBSISEqNoW4FcJ1s53thg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l16-20020a05600c1d1000b003974df9b91cso1055622wms.8
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 03:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xCIQ07LJk4eNQTP9D28bb4xS5JvcaiG1kYItB/4WJXg=;
 b=Cbyi5aSmXUTCVl4kxli2v1OisFNoIZCMEKTPE7GtmCz7wgiluwMq+Qmb6bqFGd8RlK
 95wXUGYooaFdg7t8whnTVk6bv3hp31Ko7jhVVboivNZHgRMD1/WA6Jt4dwFXZtuv79BU
 hcAMPLGid6PhsfQTJftOMrfk5VJRQ4UpF88RosuGlZ1Wz5+ZB/ttLyid35oWVE1z+Blc
 lEimVSOOu8unTWwqTyxzCJgTqWCD0MKISX5LGG0sRpsyzGAg4yuMWKwkzyd1TKxzWf3Y
 KVUNmPUJnYyKMghizfINXxTWZjzsDLFuxOSqmnKKfJJm68kDPcX9Cf7sQkyuXh7toRv3
 ED5g==
X-Gm-Message-State: AOAM5329mBJor7GFZRePGt1fGrNKW1ed5uxYmbW/FbIv4/7E5IC8Neet
 WxD81sF2wShYJzmq49KMvJACTZiF3fDZglJWhMn0q0rtrf7mh0WKnEl5hG+0M80N9egtjHe/Bi5
 CrmDnrzD2PQ3vl48=
X-Received: by 2002:a7b:c401:0:b0:397:26fb:ebf7 with SMTP id
 k1-20020a7bc401000000b0039726fbebf7mr19722446wmi.90.1653303377006; 
 Mon, 23 May 2022 03:56:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAwuFgDpThzX5s2cnzpmZiyaLx4zprOvn7U+afrsX/XwLx1twZvv7GbH4LIMkkRcdEyx5MUw==
X-Received: by 2002:a7b:c401:0:b0:397:26fb:ebf7 with SMTP id
 k1-20020a7bc401000000b0039726fbebf7mr19722435wmi.90.1653303376741; 
 Mon, 23 May 2022 03:56:16 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l10-20020a7bcf0a000000b00397473ae25esm4097733wmg.34.2022.05.23.03.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:56:16 -0700 (PDT)
Date: Mon, 23 May 2022 11:56:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v6 10/13] migration: Respect postcopy request order in
 preemption mode
Message-ID: <YotoTrRaTIaQdVR4@work-vm>
References: <20220517195730.32312-1-peterx@redhat.com>
 <20220517195730.32312-11-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517195730.32312-11-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
> With preemption mode on, when we see a postcopy request that was requesting
> for exactly the page that we have preempted before (so we've partially sent
> the page already via PRECOPY channel and it got preempted by another
> postcopy request), currently we drop the request so that after all the
> other postcopy requests are serviced then we'll go back to precopy stream
> and start to handle that.
> 
> We dropped the request because we can't send it via postcopy channel since
> the precopy channel already contains partial of the data, and we can only
> send a huge page via one channel as a whole.  We can't split a huge page
> into two channels.
> 
> That's a very corner case and that works, but there's a change on the order
> of postcopy requests that we handle since we're postponing this (unlucky)
> postcopy request to be later than the other queued postcopy requests.  The
> problem is there's a possibility that when the guest was very busy, the
> postcopy queue can be always non-empty, it means this dropped request will
> never be handled until the end of postcopy migration. So, there's a chance
> that there's one dest QEMU vcpu thread waiting for a page fault for an
> extremely long time just because it's unluckily accessing the specific page
> that was preempted before.
> 
> The worst case time it needs can be as long as the whole postcopy migration
> procedure.  It's extremely unlikely to happen, but when it happens it's not
> good.
> 
> The root cause of this problem is because we treat pss->postcopy_requested
> variable as with two meanings bound together, as the variable shows:
> 
>   1. Whether this page request is urgent, and,
>   2. Which channel we should use for this page request.
> 
> With the old code, when we set postcopy_requested it means either both (1)
> and (2) are true, or both (1) and (2) are false.  We can never have (1)
> and (2) to have different values.
> 
> However it doesn't necessarily need to be like that.  It's very legal that
> there's one request that has (1) very high urgency, but (2) we'd like to
> use the precopy channel.  Just like the corner case we were discussing
> above.
> 
> To differenciate the two meanings better, introduce a new field called
> postcopy_target_channel, showing which channel we should use for this page
> request, so as to cover the old meaning (2) only.  Then we leave the
> postcopy_requested variable to stand only for meaning (1), which is the
> urgency of this page request.
> 
> With this change, we can easily boost priority of a preempted precopy page
> as long as we know that page is also requested as a postcopy page.  So with
> the new approach in get_queued_page() instead of dropping that request, we
> send it right away with the precopy channel so we get back the ordering of
> the page faults just like how they're requested on dest.
> 
> Alongside, I touched up find_dirty_block() to only set the postcopy fields
> in the pss section if we're going through a postcopy migration.  That's a
> very light optimization and shouldn't affect much.
> 
> Reported-by: manish.mishra@nutanix.com
> Signed-off-by: Peter Xu <peterx@redhat.com>

So I think this is OK; getting a bit complicated!

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


> ---
>  migration/ram.c | 69 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 55 insertions(+), 14 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 9d76db8491..fdcd9984fa 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -441,8 +441,28 @@ struct PageSearchStatus {
>      unsigned long page;
>      /* Set once we wrap around */
>      bool         complete_round;
> -    /* Whether current page is explicitly requested by postcopy */
> +    /*
> +     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
> +     * postcopy.  When set, the request is "urgent" because the dest QEMU
> +     * threads are waiting for us.
> +     */
>      bool         postcopy_requested;
> +    /*
> +     * [POSTCOPY-ONLY] The target channel to use to send current page.
> +     *
> +     * Note: This may _not_ match with the value in postcopy_requested
> +     * above. Let's imagine the case where the postcopy request is exactly
> +     * the page that we're sending in progress during precopy. In this case
> +     * we'll have postcopy_requested set to true but the target channel
> +     * will be the precopy channel (so that we don't split brain on that
> +     * specific page since the precopy channel already contains partial of
> +     * that page data).
> +     *
> +     * Besides that specific use case, postcopy_target_channel should
> +     * always be equal to postcopy_requested, because by default we send
> +     * postcopy pages via postcopy preempt channel.
> +     */
> +    bool         postcopy_target_channel;
>  };
>  typedef struct PageSearchStatus PageSearchStatus;
>  
> @@ -496,6 +516,9 @@ static QemuCond decomp_done_cond;
>  static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>                                   ram_addr_t offset, uint8_t *source_buf);
>  
> +static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
> +                                     bool postcopy_requested);
> +
>  static void *do_data_compress(void *opaque)
>  {
>      CompressParam *param = opaque;
> @@ -1516,8 +1539,14 @@ retry:
>   */
>  static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>  {
> -    /* This is not a postcopy requested page */
> -    pss->postcopy_requested = false;
> +    if (migration_in_postcopy()) {
> +        /*
> +         * This is not a postcopy requested page, mark it "not urgent", and
> +         * use precopy channel to send it.
> +         */
> +        pss->postcopy_requested = false;
> +        pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
> +    }

Do you need the 'if' here?

Dave

>      pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
>      if (pss->complete_round && pss->block == rs->last_seen_block &&
> @@ -2038,15 +2067,20 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>      RAMBlock  *block;
>      ram_addr_t offset;
>  
> -again:
>      block = unqueue_page(rs, &offset);
>  
>      if (block) {
>          /* See comment above postcopy_preempted_contains() */
>          if (postcopy_preempted_contains(rs, block, offset)) {
>              trace_postcopy_preempt_hit(block->idstr, offset);
> -            /* This request is dropped */
> -            goto again;
> +            /*
> +             * If what we preempted previously was exactly what we're
> +             * requesting right now, restore the preempted precopy
> +             * immediately, boosting its priority as it's requested by
> +             * postcopy.
> +             */
> +            postcopy_preempt_restore(rs, pss, true);
> +            return true;
>          }
>      } else {
>          /*
> @@ -2070,7 +2104,9 @@ again:
>           * really rare.
>           */
>          pss->complete_round = false;
> +        /* Mark it an urgent request, meanwhile using POSTCOPY channel */
>          pss->postcopy_requested = true;
> +        pss->postcopy_target_channel = RAM_CHANNEL_POSTCOPY;
>      }
>  
>      return !!block;
> @@ -2324,7 +2360,8 @@ static bool postcopy_preempt_triggered(RAMState *rs)
>      return rs->postcopy_preempt_state.preempted;
>  }
>  
> -static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
> +static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
> +                                     bool postcopy_requested)
>  {
>      PostcopyPreemptState *state = &rs->postcopy_preempt_state;
>  
> @@ -2332,8 +2369,15 @@ static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
>  
>      pss->block = state->ram_block;
>      pss->page = state->ram_page;
> -    /* This is not a postcopy request but restoring previous precopy */
> -    pss->postcopy_requested = false;
> +
> +    /* Whether this is a postcopy request? */
> +    pss->postcopy_requested = postcopy_requested;
> +    /*
> +     * When restoring a preempted page, the old data resides in PRECOPY
> +     * slow channel, even if postcopy_requested is set.  So always use
> +     * PRECOPY channel here.
> +     */
> +    pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
>  
>      trace_postcopy_preempt_restored(pss->block->idstr, pss->page);
>  
> @@ -2344,12 +2388,9 @@ static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
>  static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
>  {
>      MigrationState *s = migrate_get_current();
> -    unsigned int channel;
> +    unsigned int channel = pss->postcopy_target_channel;
>      QEMUFile *next;
>  
> -    channel = pss->postcopy_requested ?
> -        RAM_CHANNEL_POSTCOPY : RAM_CHANNEL_PRECOPY;
> -
>      if (channel != rs->postcopy_channel) {
>          if (channel == RAM_CHANNEL_PRECOPY) {
>              next = s->to_dst_file;
> @@ -2505,7 +2546,7 @@ static int ram_find_and_save_block(RAMState *rs)
>               * preempted precopy.  Otherwise find the next dirty bit.
>               */
>              if (postcopy_preempt_triggered(rs)) {
> -                postcopy_preempt_restore(rs, &pss);
> +                postcopy_preempt_restore(rs, &pss, false);
>                  found = true;
>              } else {
>                  /* priority queue empty, so just search for something dirty */
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


