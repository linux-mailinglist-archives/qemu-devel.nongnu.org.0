Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEB23E0B19
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 02:07:32 +0200 (CEST)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBQv5-0004BH-TT
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 20:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBQtn-0002Ij-G9
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBQtl-0006eU-Sp
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628121969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p6xzGrBzp8SuOLkMAeQVlgcJo9gEf8Hz2y/fraZIEaA=;
 b=i3+a1+YPIy8JNJa6wqz2WVMK6IUwLeDejixXJ4AgXfq+aJlPKaRrlJQF7PgpW5BY4gkHHc
 RqruwUBviSOp3fLX0aWpDrkqGjXJ6Ft5a8n3OQ6fDzzYseV1Cj8pt3rAaPhfjV6Sn1XRI+
 qCz3p6z+10tmLKeOxnZEE3b1khXDpFc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-qdQRo0OkM4mmB56oIzoS9A-1; Wed, 04 Aug 2021 20:06:08 -0400
X-MC-Unique: qdQRo0OkM4mmB56oIzoS9A-1
Received: by mail-qv1-f70.google.com with SMTP id
 s12-20020ad4446c0000b029033a9344451cso2685488qvt.21
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 17:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p6xzGrBzp8SuOLkMAeQVlgcJo9gEf8Hz2y/fraZIEaA=;
 b=eMMxeBwm4XBsbfTO3Uox9ygHwSr5bBaauS8xS1T8dzWioEd2l1NpzW0isvyH+H1TcN
 RIgOI4nrlfDXj0XizLTj360tMMUDj6EDmkDDhQgUq18jkhNP3WiAndSMQ36XwYlt52SQ
 gKyDcyUQaYe4eMJ0OfF1AnS4BH9ugoYVkCpPlrpIt9+p1xN2GCihRvW/IiAnPPabS0iA
 ZRkzTQO/wfK537UQ7arU9VR/W2thd6ZlQge014fEnUpkXkQdxyuwTi6UQ8NJMejG5rqE
 Itth1d2cUdps74+uvHSIBnC6dfYfwYuzXW8TVk36O8sp31r/CScohhbZnwvKs5sxlVWq
 Ntdw==
X-Gm-Message-State: AOAM531E6FWlBg4v5gZE9RSItAKKnA05aVXUGnxXs2lGij5zSSDuxfOp
 28m4aH1bQt5IKl+GEGLxmvyy5pXwxlnkpPY5QJ7276CWBdWcE+Axlhx8Br+ethbE7GXaBuv1eCc
 hh0w6nDI9XXjSV6E=
X-Received: by 2002:a05:620a:1399:: with SMTP id
 k25mr2081047qki.255.1628121967668; 
 Wed, 04 Aug 2021 17:06:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD7ERsmI+DxP6xXi+tmgDwqMl13FGvg0T/XJHmyXFrQeFBvRDPmDUxJaJkpGiBq9jTwzOUKQ==
X-Received: by 2002:a05:620a:1399:: with SMTP id
 k25mr2081037qki.255.1628121967464; 
 Wed, 04 Aug 2021 17:06:07 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca.
 [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id i62sm2233146qke.110.2021.08.04.17.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 17:06:06 -0700 (PDT)
Date: Wed, 4 Aug 2021 20:06:05 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 4/7] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on the migration source
Message-ID: <YQsrba6ipWwxA8au@t490s>
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-5-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730085249.8246-5-david@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 10:52:46AM +0200, David Hildenbrand wrote:
> We don't want to migrate memory that corresponds to discarded ranges as
> managed by a RamDiscardManager responsible for the mapped memory region of
> the RAMBlock. The content of these pages is essentially stale and
> without any guarantees for the VM ("logically unplugged").
> 
> Depending on the underlying memory type, even reading memory might populate
> memory on the source, resulting in an undesired memory consumption. Of
> course, on the destination, even writing a zeropage consumes memory,
> which we also want to avoid (similar to free page hinting).
> 
> Currently, virtio-mem tries achieving that goal (not migrating "unplugged"
> memory that was discarded) by going via qemu_guest_free_page_hint() - but
> it's hackish and incomplete.
> 
> For example, background snapshots still end up reading all memory, as
> they don't do bitmap syncs. Postcopy recovery code will re-add
> previously cleared bits to the dirty bitmap and migrate them.
> 
> Let's consult the RamDiscardManager after setting up our dirty bitmap
> initially and when postcopy recovery code reinitializes it: clear
> corresponding bits in the dirty bitmaps (e.g., of the RAMBlock and inside
> KVM). It's important to fixup the dirty bitmap *after* our initial bitmap
> sync, such that the corresponding dirty bits in KVM are actually cleared.
> 
> As colo is incompatible with discarding of RAM and inhibits it, we don't
> have to bother.
> 
> Note: if a misbehaving guest would use discarded ranges after migration
> started we would still migrate that memory: however, then we already
> populated that memory on the migration source.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


