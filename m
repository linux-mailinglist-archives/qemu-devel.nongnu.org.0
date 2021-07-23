Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E33D3D4D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:14:13 +0200 (CEST)
Received: from localhost ([::1]:39178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6xoS-0004Qr-JN
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6xnG-0003iv-G4
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6xnB-00045h-8K
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627056772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uaWxj+I31rr4fRawkHwTLUpfpoebQv4v6RH+XLXssY=;
 b=HTt4BPqAPrAf4UXVlivbnxzkfQ0Swzt7Lj6irJKSZraNyy8kI1PWDrKXEhpnos8sbedzkw
 mud5XHCC6gRuZG6DooUcTN+lF+P+fGS+p9/8Oewmu7/Ay02u5Ol0yHRpg6rA4r0VtrbvWm
 a8cADg/cd4XRMDR2f3NWoUSd8l1apls=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-sf9EdCv9PemMMxN0Co22bw-1; Fri, 23 Jul 2021 12:12:49 -0400
X-MC-Unique: sf9EdCv9PemMMxN0Co22bw-1
Received: by mail-qt1-f200.google.com with SMTP id
 e16-20020ac867100000b0290257b7db4a28so1401170qtp.9
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4uaWxj+I31rr4fRawkHwTLUpfpoebQv4v6RH+XLXssY=;
 b=Y3TEJohBlMC2GL86R2KvZKB1wPNfmJb31Ow1Qn3vpzdlIXVWFsk9HHkY5scESQrQxJ
 bv/KMnI/w4xSfRQTd2Q5vre0QAcORyHXAZilEvw9pOqJf0FnHlJLyv5gMr9EIW7rLiYy
 FtIVY7QGbHeMGcYUFMzCHgZpHGxkGdnrSzC3FTG5Da9cXOdrQ1yHa3cEZjgDTFbGBY8L
 yCNxF5VSxBzgW4GhkbWqX97s5aVxuMVArY8lSlN/lLmh72exzD7WDJzIGZXyo56Vmnhd
 uoVrq/aB+xkpwg3xcB2ovbQy67WiCoNoR4M/RlnX0sjOvwHApGElNAUkm/V38x05mjKG
 h/2Q==
X-Gm-Message-State: AOAM530LJ0kaPD8ATBoq0GKopn+iBeOqIks5IYYjA6z6zGBC/58BV43W
 P1CQUN+X8TEaPV+PL2+euzy9bni7fU9laLu0mCWaU4QXEl9l9vzsVTq8HruGFAvTTkVa93suOhG
 VMfPu5yw17gADMBI=
X-Received: by 2002:a05:622a:16:: with SMTP id
 x22mr4588476qtw.140.1627056768736; 
 Fri, 23 Jul 2021 09:12:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyOHBNzGTfsecadWIfFrBy49duxZJT9yYwmcOAJ8xDKjLXZrcE2pcnPLsvez/BuscjmdNNlA==
X-Received: by 2002:a05:622a:16:: with SMTP id
 x22mr4588441qtw.140.1627056768349; 
 Fri, 23 Jul 2021 09:12:48 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id u19sm6051438qtx.48.2021.07.23.09.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:12:47 -0700 (PDT)
Date: Fri, 23 Jul 2021 12:12:46 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YPrqfkCk7EM7QLpa@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <YPlWqs8N+NiFH/yj@work-vm>
 <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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

On Thu, Jul 22, 2021 at 01:43:41PM +0200, David Hildenbrand wrote:
> > > a) In precopy code, always clearing all dirty bits from the bitmap that
> > >     correspond to discarded range, whenever we update the dirty bitmap. This
> > >     results in logically unplugged memory to never get migrated.
> > 
> > Have you seen cases where discarded areas are being marked as dirty?
> > That suggests something somewhere is writing to them and shouldn't be.
> 
> I have due to sub-optimal clear_bmap handling to be sorted out by
> 
> https://lkml.kernel.org/r/20210722083055.23352-1-wei.w.wang@intel.com
> 
> Whereby the issue is rather that initially dirty bits don't get cleared in
> lower layers and keep popping up as dirty.
> 
> The issue with postcopy recovery code setting discarded ranges dirty in
> the dirty bitmap, I did not try reproducing. But from looking at the
> code, it's pretty clear that it would happen.
> 
> Apart from that, nothing should dirty that memory. Of course,
> malicious guests could trigger it for now, in which case we wouldn't catch it
> and migrate such pages with postcopy, because the final bitmap sync in
> ram_postcopy_send_discard_bitmap() is performed without calling notifiers
> right now.

I have the same concern with Dave: does it mean that we don't need to touch at
least ramblock_sync_dirty_bitmap in patch 3?

Doing that for bitmap init and postcopy recovery looks right.

One other trivial comment is instead of touching up ram_dirty_bitmap_reload(),
IMHO it's simpler to set all 1's to disgarded memories on dst receivedmap;
imagine multiple postcopy recovery happened, then with that we walk the disgard
memory list only once for each migration.  Not a big deal, though.

-- 
Peter Xu


