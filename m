Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9938A3DA89D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:13:14 +0200 (CEST)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98en-0002Fz-5v
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m98dl-0001Zg-GI
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:12:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m98dh-0004cN-Ge
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627575124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L6C2uO3bJKobMESsssksimSScxfuR/3tAW2gNjV0Efw=;
 b=jUuocKk1BU8JN9vxlwZ2wguVJjl5yygmWVq8P2nXacRU0I287KkPsu4WEqGCp/rmLLUBVu
 VjG0yTNgEWRpB+0wHWI1fvktZEojAVxEHFQ/2+cwfJvkwld8PTg2njeZuTYyH67luyyq/b
 Y1NNo8knd9Sob34TG8cCEHDyTngkjvg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-8smSKf6-OtWtVAOeMEw2Bg-1; Thu, 29 Jul 2021 12:12:03 -0400
X-MC-Unique: 8smSKf6-OtWtVAOeMEw2Bg-1
Received: by mail-qk1-f198.google.com with SMTP id
 x2-20020a05620a0ec2b02903b8bd8b612eso4044948qkm.19
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 09:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L6C2uO3bJKobMESsssksimSScxfuR/3tAW2gNjV0Efw=;
 b=Saig64XYc2VsfhW14CCFWY7eQnX3fKtM/4FqMwVqZ5Cs0endm4Vu4LAXjtrkyabh7u
 Y94mXYzBO9COqOpU8qPAVZh2VL+yOq9s9pg+jMdwHA01kfaZD/Rr5+AFOz5OBsqdcgVw
 HXf9m/jbHFyLQJPDNuJiUFS6Qx0hkNvfJ1+XHfkbS4QIIqCBZZF2TzcNfmA4YA/02gPM
 sKN1WcZJKBCrrLRyC7aer4ckQ4UtwDAr6nnmwQURfPNV30HzHjEXf6RqFaxUVadiDa5V
 DtdPX6ezljce5NK6r2fA3IZGkH9a9yaXi2ZaBIercn/wokCf7q+wCK/4Qmw/vuUF288F
 wZNA==
X-Gm-Message-State: AOAM53222y66QDsu6yspmGaciM8RfRcEtZaEg6+JsxlyRgHLiq/FQRN0
 npl9EPkbj43cre/NBYB2A30ICv1wIP1+EYWhP/S4t5nbJfu8k5DelNNIlB64krubmPBycLK4FUJ
 4IzIUd7LvmWJ9Mpc=
X-Received: by 2002:ac8:6b4c:: with SMTP id x12mr1513079qts.121.1627575122879; 
 Thu, 29 Jul 2021 09:12:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPpd4oyQ1W6VzqJoQDu9Xc5WNBLNt1ZptJV1O+6kojEjF/T7tuJaKTbEpK2Y6jd81AThj31A==
X-Received: by 2002:ac8:6b4c:: with SMTP id x12mr1513053qts.121.1627575122607; 
 Thu, 29 Jul 2021 09:12:02 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i62sm1994738qke.110.2021.07.29.09.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 09:12:01 -0700 (PDT)
Date: Thu, 29 Jul 2021 12:12:00 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YQLTUIvrVe+TM/lw@t490s>
References: <YPrqfkCk7EM7QLpa@t490s>
 <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com>
 <YPtAd+JqfNeQqGib@t490s>
 <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com>
 <YQA+CUCWV4YDdu9C@t490s>
 <74271964-c481-7168-2a70-ea9eb5067450@redhat.com>
 <YQGzLl9IHod5rJRb@t490s>
 <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com>
 <YQG74AsEBE0uaN4U@t490s>
 <a1c80a40-2828-3373-c906-870f0dbb6db8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a1c80a40-2828-3373-c906-870f0dbb6db8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 29, 2021 at 10:14:47AM +0200, David Hildenbrand wrote:
> > > > > > The thing is I still think this extra operation during sync() can be ignored by
> > > > > > simply clear dirty log during bitmap init, then.. why not? :)
> > > > > 
> > > > > I guess clearing the dirty log (especially in KVM) might be more expensive.
> > > > 
> > > > If we send one ioctl per cb that'll be expensive for sure.  I think it'll be
> > > > fine if we send one clear ioctl to kvm, summarizing the whole bitmap to clear.
> > > > 
> > > > The other thing is imho having overhead during bitmap init is always better
> > > > than having that during sync(). :)
> > > 
> > > Oh, right, so you're saying, after we set the dirty bmap to all ones and
> > > excluded the discarded parts, setting the respective bits to 0, we simply
> > > issue clearing of the whole area?
> > > 
> > > For now I assumed we would have to clear per cb.
> > 
> > Hmm when I replied I thought we can pass in a bitmap to ->log_clear() but I
> > just remembered memory API actually hides the bitmap interface..
> > 
> > Reset the whole region works, but it'll slow down migration starts, more
> > importantly that'll be with mmu write lock so we will lose most clear-log
> > benefit for the initial round of migration and stuck the guest #pf at the
> > meantime...
> > 
> > Let's try do that in cb()s as you mentioned; I think that'll still be okay,
> > because so far the clear log block size is much larger (1gb), 1tb is worst case
> > 1000 ioctls during bitmap init, slightly better than 250k calls during sync(),
> > maybe? :)
> 
> Just to get it right, what you propose is calling
> migration_clear_memory_region_dirty_bitmap_range() from each cb().

Right.  We can provide a more complicated memory api for passing in bitmap but
I think that can be an overkill and tricky.

> Due to the clear_bmap, we will end up clearing each chunk (e.g., 1GB) at most
> once.
>
> But if our layout is fragmented, we can actually end up clearing all chunks
> (1024 ioctls for 1TB), resulting in a slower migration start.
> 
> Any gut feeling how much slower migration start could be with largish (e.g.,
> 1 TiB) regions?

I had a vague memory of KVM_GET_DIRTY_LOG that I used to measure which took
~10ms for 1g guest mem, supposing that's mostly used to protect the pages or
clearing dirties in the EPT pgtables.  Then the worst case is ~1 second for
1tb.

But note that it's still during setup phase, so we should expect to see a
somehow large setup time and longer period that migration stays in SETUP state,
but I think it's fine.  Reasons:

  - We don't care too much about guest dirtying pages during the setup process
    because we haven't migrated anything yet, meanwhile we should not block any
    other thread either (e.g., we don't hold BQL).

  - We don't block guest execution too.  Unlike KVM_GET_DIRTY_LOG without CLEAR
    we won't hold the mmu lock for a huge long time but do it only in 1g chunk,
    so guest page faults can still be serviced.  It'll be affected somehow
    since we'll still run with the mmu write lock critical sections for each
    single ioctl(), but we do that for 1gb each time so we frequently yield it.

Comparing to the other solution, it'll be different if we spend time during
sync() because during migration guest vcpu threads are dirtying pages that we
migrated so page dirtying is aggregating, it should make the migration to
converge harder just like when sync() is slower.

Thanks,

-- 
Peter Xu


