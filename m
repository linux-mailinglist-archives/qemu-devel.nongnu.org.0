Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3043E3C8774
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:29:36 +0200 (CEST)
Received: from localhost ([::1]:58144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gpL-0005Xi-62
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m3gkn-0004Ur-FD
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m3gkj-0006Kg-PG
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626276288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=umqLb9384vYinFe5s1M1VFoPdWWxiTE1iZ59gEKbSqE=;
 b=QESyjbhnROPDthLG1GrSnluKodTkHbNIYGQioYqVs/wXHKNUqWuzh+et/te/mteyKi9GVg
 P9V4TFmP4BtvUGVTHt4v7VJ2uTZeXRtXLVEOxGp26RgGdMKiLTzfMoSoP9QSWRt14PjL1A
 IqrO/xnL5AWUNvNafVsWmJsMfBsfEtM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-5Hzj3LtAOtOVWLqmWAIYEw-1; Wed, 14 Jul 2021 11:24:47 -0400
X-MC-Unique: 5Hzj3LtAOtOVWLqmWAIYEw-1
Received: by mail-qv1-f69.google.com with SMTP id
 p6-20020a05621415c6b02902f61b4b012eso918283qvz.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=umqLb9384vYinFe5s1M1VFoPdWWxiTE1iZ59gEKbSqE=;
 b=PkhXY7oeQhTbhNAlNAe4rsyRCP6AkAAP2NWw1gUqsy199S4YT2Y0W2PKUib/WHEZxC
 7jHF0v1Edsx7TjIWuzJJd+mhIQ19oKQSw/0QXva3SkA64l0kEKTnc1sStj4XWO7BmMT8
 Cos7fpWAwjjukCTLVlWVCOTI/0DDIaedhkwYtdpnb5BH9vmFgbMCak1mYtFQ/rCiymlu
 fIFGew91qvFZcA81pepCjVsLqm5vu+FfFSgejHfZrbx/Q+hMQo5d2G5j/6MAaqVe+nZi
 6RhffjAoOyFEetZhXUaJahrqt2ggdEKxT5q+br7BqvpLU7C3A0gFUjLjr0kSbMwihFpG
 kzvA==
X-Gm-Message-State: AOAM532y0RuojvWPwebfYFS0+QedcfmlOjs/1wLRyumUR3MAWCG5/Bxm
 YbwXcrnDAwNnhDzhZjlObddFC85ca4sd66MMtzOLOeVKKShtpJeojTwHhzPY+Ek3g1lHFBMRdZ2
 Q4PuF3LbaoMRoKpc=
X-Received: by 2002:a05:6214:16ca:: with SMTP id
 d10mr11113212qvz.59.1626276286586; 
 Wed, 14 Jul 2021 08:24:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo75orFoNw/wR4Sl2ui6Zm2cpKYSXIDei9QUCiBIMVJgteiDNqnq3EWfD4EIppbIH9FiEqug==
X-Received: by 2002:a05:6214:16ca:: with SMTP id
 d10mr11113197qvz.59.1626276286388; 
 Wed, 14 Jul 2021 08:24:46 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id k124sm1107541qkc.132.2021.07.14.08.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:24:45 -0700 (PDT)
Date: Wed, 14 Jul 2021 11:24:44 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH v1] migration: clear the memory region dirty bitmap when
 skipping free pages
Message-ID: <YO8BvCfk7qSAHKHZ@t490s>
References: <20210714075104.397484-1-wei.w.wang@intel.com>
 <20210714062715-mutt-send-email-mst@kernel.org>
 <25a2203f-fe82-41a6-ab40-2e4b5522fa14@redhat.com>
 <64973ae51976490b864ded3ff628058c@intel.com>
MIME-Version: 1.0
In-Reply-To: <64973ae51976490b864ded3ff628058c@intel.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: "quintela@redhat.com" <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 02:58:31PM +0000, Wang, Wei W wrote:
> On Wednesday, July 14, 2021 6:30 PM, David Hildenbrand wrote:
> > 
> > On 14.07.21 12:27, Michael S. Tsirkin wrote:
> > > On Wed, Jul 14, 2021 at 03:51:04AM -0400, Wei Wang wrote:
> > >> When skipping free pages, their corresponding dirty bits in the
> > >> memory region dirty bitmap need to be cleared. Otherwise the skipped
> > >> pages will be sent in the next round after the migration thread syncs
> > >> dirty bits from the memory region dirty bitmap.
> > >>
> > >> migration_clear_memory_region_dirty_bitmap_range is put outside the
> > >> bitmap_mutex, becasue
> > >
> > > because?
> > >
> > >> memory_region_clear_dirty_bitmap is possible to block on the kvm slot
> > >> mutex (don't want holding bitmap_mutex while blocked on another
> > >> mutex), and clear_bmap_test_and_clear uses atomic operation.
> > 
> > How is that different from our existing caller?
> > 
> > Please either clean everything up, completely avoiding the lock (separate
> > patch), or move it under the lock.
> > 
> > Or am I missing something important?
> 
> That seems ok to me and Peter to have it outside the lock. Not sure if Dave or Juan knows the reason why clear_bmap needs to be under the mutex given that it is atomic operation.

Yes it looks ok to not have the lock to me, but I still think it's easier to
put all bitmap ops under the bitmap_mutex, so we handle clear_bmap/bmap the
same way.  It's also what we did in the existing code (although by accident).

Then we can replace clear_bmap atomic ops to normal mem accesses in a follow up
patch.  But it won't affect a huge lot - unlike normal bmap, clear_bmap is
normally per 1g chunk so modifying clear_bmap happens much less frequently.

Atomic ops will be needed of course if we want a spinlock version of
bitmap_mutex, however I still don't know whether that'll really help anything.

Thanks,

-- 
Peter Xu


