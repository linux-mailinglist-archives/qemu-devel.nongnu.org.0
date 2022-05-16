Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B07528173
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:07:20 +0200 (CEST)
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqXdH-0003yO-Mm
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqXaS-0002HB-3w
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqXaQ-00089w-1P
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652695461;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kMhIwRRwdbg/YyCc6w6eMiaZ4MIBkbV+8Gx15fqbuBM=;
 b=QQklECoYATTmxok+piX2AH5dhSIECl1bHBfkHiAV+bFSXqqlz+i5+IXCQWdfrnkTbRT/m+
 p1gacYsJv7U737E28QZey4CcjycjJld46AUSPOx2tPv3GgmXql/Im8apWdGDvteGw008qO
 VuGM9CPjfgNmzjXHyo0mGNGytWNT668=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-roKZLJVaMrOYQBuyFVxpNQ-1; Mon, 16 May 2022 06:04:20 -0400
X-MC-Unique: roKZLJVaMrOYQBuyFVxpNQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 e6-20020adfef06000000b0020d08e465e2so325237wro.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=kMhIwRRwdbg/YyCc6w6eMiaZ4MIBkbV+8Gx15fqbuBM=;
 b=LD9duOgutNOWwxJ6bjLNj+2u3mW7LxTrpW938q6aSMoUITEfyT4yDxuF+ETVwmXADJ
 PZ11xdcHdadyciVatxdhkuLjgU2KB3EjYpGVVklrfZ5YFnkMr25RTcilCrXUyOJw6O2i
 9Tci5Ha2itl9blzSFzwpbJqp4msl/F7fFAHq6zNOkCnQRTjugwgQ22UpWbTpjP8I5PHn
 0acCKTUayoU3sH2nEfNKRcruNkELOJPLI+0pepFOispNJY1pT/2iIqKaUbvxMGDilQFl
 TZD0t2luo1wD1q+Up1XmOWBx4kejY2uKjnhxDhVcTf55v3fT7gnKnql/w6Pe/mQuC+iU
 Nt0Q==
X-Gm-Message-State: AOAM533EjucWCvat/GY/FLDeDs4eh/VKYAqFBPRHU4ULdNAGQr21EI0e
 YV7YqzwRxo5TU9D8TkWdkwnjfPif1g4W6JlkH0DPCqjofwK4P/lWuC5Uva3JXHa+CrK60NGOXAZ
 vba3YAPdg19LMI7E=
X-Received: by 2002:a05:600c:3584:b0:394:5870:2c44 with SMTP id
 p4-20020a05600c358400b0039458702c44mr16147962wmq.4.1652695458755; 
 Mon, 16 May 2022 03:04:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOZewgohhEoywoHGlOptCihOeIDlrMiG4fNMl2XPZ4IHP3SE9RL0BoJOubHqlznDyGCLg0HQ==
X-Received: by 2002:a05:600c:3584:b0:394:5870:2c44 with SMTP id
 p4-20020a05600c358400b0039458702c44mr16147940wmq.4.1652695458490; 
 Mon, 16 May 2022 03:04:18 -0700 (PDT)
Received: from localhost (static-211-115-85-188.ipcom.comunitel.net.
 [188.85.115.211]) by smtp.gmail.com with ESMTPSA id
 c13-20020adfa70d000000b0020c5253d8f7sm9352980wrd.67.2022.05.16.03.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:04:18 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] migration: Calculate ram size once
In-Reply-To: <94da21f4-60df-9cf9-3317-b762760ecf80@redhat.com> (David
 Hildenbrand's message of "Wed, 11 May 2022 11:22:30 +0200")
References: <20220510231708.7197-1-quintela@redhat.com>
 <20220510231708.7197-3-quintela@redhat.com>
 <94da21f4-60df-9cf9-3317-b762760ecf80@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 16 May 2022 12:04:17 +0200
Message-ID: <874k1pu732.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> wrote:
> On 11.05.22 01:17, Juan Quintela wrote:
>> We are recalculating ram size continously, when we know that it don't
>> change during migration.  Create a field in RAMState to track it.

Hi

> We do have resizable RAM, which triggers ram_mig_ram_block_resized() on
> resizes when changing block->used_length.

Yeap.

The problem is this bit of the patch:

@@ -2259,7 +2261,7 @@ static int ram_find_and_save_block(RAMState *rs)
     bool again, found;
 
     /* No dirty page as there is zero RAM */
-    if (!ram_bytes_total()) {
+    if (!rs->ram_bytes_total) {
         return pages;
     }
 
On 1TB guest, we moved form

75.8 seconds to 70.0 seconds total time just with this change.  This is
a idle guest full of zero pages.  If thue guest is busier, the effect is
less noticiable because we spend more time sending pages.

This effect is even more noticeable if you put this series on top of my
zero page detection series that I sent before.  With that, we end having
ram_bytes_total_common() as the second function that uses more CPU.

As you can see for the perf profile that I sent, with upstream we get:


  10.42%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
   3.71%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common

(I have deleted the functions that are not reletade to this code path.
ram_find_and_save_block() is the function that calls
ram_bytes_total_common()).

After the patch, we move to:

  11.32%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0

And ram_bytes_total_common() don't even exist.  Notice that my series
only remove one call to it.  The CPU utilization here is higher for
ram_find_and_save_block() because:

- Meassuring things is difficult (TM)
- With this patch, migration goes faster, and then we call
  ram_find_and_save_block() more times in the same period of time.

> ram_mig_ram_block_resized() aborts migration when we detect a resize on
> the source. I assume that is what you care about here, right?

Ouch.  Hadn't noticed that we could change the ramsize during
migration.  Anyways, as you said, if ram size change, we cancel
migration, so we can still cache the size value. Actually, I have just
put it on ram_state_init(), because there is where we setup the bitmaps,
so if we change the bitmap, we change also the ram_size cached value.

Thanks, Juan.








