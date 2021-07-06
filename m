Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6A3BDC70
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:41:39 +0200 (CEST)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0p4i-0004Ov-V7
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m0p36-00035v-NJ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:39:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m0p33-0003ts-Cz
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625593192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O14RlXRhUGJsNQ1O/DeVANUgab0XQZ2GXA932OuRQGk=;
 b=ATbOJhh5BiOsMRMwvoO/sAtZ/JnU92FYHaHRVcVtjoX/qaZtvNbu1CmF2lMJ8icEMKasBA
 gKeYLwVxGZvFmrNzWy/uheYwnBiK12urx9is5zZ5po8w25bCgobXdHNPJBgOujXmAjVhTc
 ksz6lLtnmILrPxTZpAKHHPG6DdObbE8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-pH5HYxWDOuCtBRuvrpnDhw-1; Tue, 06 Jul 2021 13:39:51 -0400
X-MC-Unique: pH5HYxWDOuCtBRuvrpnDhw-1
Received: by mail-qv1-f71.google.com with SMTP id
 b3-20020ad451830000b02902a94b1b914dso4529303qvp.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 10:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O14RlXRhUGJsNQ1O/DeVANUgab0XQZ2GXA932OuRQGk=;
 b=RwQw8dZCQWbkRdVRTHI+R8ArV7cD5IWISGfVOtP6LVKxey22s25U0F7XTuurabN247
 fbp0CgT+Sk89A3tGaABGRkudcpaWdG6fCjq3kuiiZIFlQ9vBj2RQEcyS48JoWOdzZY1V
 1viMAwxNvyZlNtCFz8EoG3JGr9AXkLDR8ObhkUQepJHn4XxH1QkuORC8gEcppD25xhgu
 U7lp3FvQ9xjhbZ5+8ldpgU6NYwhQStpxQcCHNCDk6vaOrBv10f1+UbXw2uvfyuh8gOPL
 7T3ozuj9S3CgG72ssudQzcw9yRneTjLPGXfUAKsUxaZwJ0xF/o655+Uh2TBj72mUf8Yo
 m7Jw==
X-Gm-Message-State: AOAM530tUO6ntaEVU4E2GPmzvtIxD/iP9VXGItOGl3+SyRGTppoevELa
 fBMR7iGPF2dYdcK4UXgHjxwR1rVmgErVVjEi2GKr6OEA4zcZN2fye0ArQZ/oj12Dssg/ATNjVp1
 ZB5txK0ZRvGBeFJ4=
X-Received: by 2002:a05:6214:19e1:: with SMTP id
 q1mr12690409qvc.44.1625593190657; 
 Tue, 06 Jul 2021 10:39:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLEYVHyQr8eQVjS32x9apOfm6S7BhGbErHLqa5GRThQFuwQn4y/VowGME4sLTc08h4AIWmpA==
X-Received: by 2002:a05:6214:19e1:: with SMTP id
 q1mr12690387qvc.44.1625593190368; 
 Tue, 06 Jul 2021 10:39:50 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j141sm2179460qke.33.2021.07.06.10.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 10:39:49 -0700 (PDT)
Date: Tue, 6 Jul 2021 13:39:48 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOSVZLwZzY/rZ0db@t490s>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
 <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
 <a5877d58-d501-0ff6-676b-c98df44d1b6f@redhat.com>
 <a01758f98b3f46f282f0d6974862680d@intel.com>
 <f554501a-19d9-a22d-f399-5db4dbb81764@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f554501a-19d9-a22d-f399-5db4dbb81764@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
 Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, "Wang,
 Wei W" <wei.w.wang@intel.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 12:05:49PM +0200, David Hildenbrand wrote:
> On 06.07.21 11:41, Wang, Wei W wrote:
> > On Monday, July 5, 2021 9:42 PM, David Hildenbrand wrote:
> > > On 03.07.21 04:53, Wang, Wei W wrote:
> > > > On Friday, July 2, 2021 3:07 PM, David Hildenbrand wrote:
> > > > > On 02.07.21 04:48, Wang, Wei W wrote:
> > > > > > On Thursday, July 1, 2021 10:22 PM, David Hildenbrand wrote:
> > > > > > > On 01.07.21 14:51, Peter Xu wrote:
> > > > > 
> > > > > I think that clearly shows the issue.
> > > > > 
> > > > > My theory I did not verify yet: Assume we have 1GB chunks in the clear bmap.
> > > > > Assume the VM reports all pages within a 1GB chunk as free (easy with
> > > > > a fresh VM). While processing hints, we will clear the bits from the
> > > > > dirty bmap in the RAMBlock. As we will never migrate any page of that
> > > > > 1GB chunk, we will not actually clear the dirty bitmap of the memory
> > > > > region. When re-syncing, we will set all bits bits in the dirty bmap
> > > > > again from the dirty bitmap in the memory region. Thus, many of our
> > > > > hints end up being mostly ignored. The smaller the clear bmap chunk, the
> > > more extreme the issue.
> > > > 
> > > > OK, that looks possible. We need to clear the related bits from the
> > > > memory region bitmap before skipping the free pages. Could you try with
> > > below patch:
> > > 
> > > I did a quick test (with the memhog example) and it seems like it mostly works.
> > > However, we're now doing the bitmap clearing from another, racing with the
> > > migration thread. Especially:
> > > 
> > > 1. Racing with clear_bmap_set() via cpu_physical_memory_sync_dirty_bitmap()
> > > 2. Racing with migration_bitmap_clear_dirty()
> > > 
> > > So that might need some thought, if I'm not wrong.
> > 
> > I think this is similar to the non-clear_bmap case, where the rb->bmap is set or cleared by
> > the migration thread and qemu_guest_free_page_hint. For example, the migration thread
> > could find a bit is set from rb->bmap before qemu_guest_free_page_hint gets that bit cleared in time.
> > The result is that the free page is transferred, which isn't necessary, but won't cause any issue.
> > This is very rare in practice.
> 
> Here are my concerns regarding races:
> 
> a) We now end up calling migration_clear_memory_region_dirty_bitmap()
> without holding the bitmap_mutex. We have to clarify if that is ok. At least
> migration_bitmap_clear_dirty() holds it *while* clearing the log and
> migration_bitmap_sync() while setting bits in the clear_bmap. I think we
> also have to hold the mutex on the new path.

Makes sense; I think we can let bitmap_mutex to protect both dirty/clear
bitmaps, and also the dirty pages counter.  I'll comment in Wei's patch too later.

> 
> b) We now can end up calling memory_region_clear_dirty_bitmap()
> concurrently, not sure if all notifiers can handle that. I'd assume it is
> okay, but I wouldn't bet on it.

Yes, kvm should be the only one that uses it for real, while there's the slots
lock in kvm_physical_log_clear(), looks okay so far.

We'd better not turn off clear dirty log for this; it's a feature that I know
brought lots of benefits to get dirty logging, and we're even considering to
enable it for dirty ring so dirty ring can also benefit from it.

Thanks,

-- 
Peter Xu


