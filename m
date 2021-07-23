Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6653D3DB9
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:39:49 +0200 (CEST)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yDE-0000qo-TB
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6yBR-0007Kv-4w
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:37:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6yBM-0000FH-10
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627058271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UtPF7Mbc0GFMIALgZprmx34idb2F7aRh8MXAxd8fatc=;
 b=NzjTggv9vnF4MJRyRoReS2SClwuW/Vt9CiI/IYJuGhVg5P9Zej00h4giOw4LvVr2SsD6Cd
 Ztedrgs85OrLRQO/sHtslIKOBpaPiU7XSRSe3NfQtNJ5492nMxEGiD5teOJhocdzV5e/Ga
 IAJEfPjb0kzu3cGMQmVmqAkZC7p8TCg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-OeUa-OhpNFSY2ISO5XvVZA-1; Fri, 23 Jul 2021 12:37:50 -0400
X-MC-Unique: OeUa-OhpNFSY2ISO5XvVZA-1
Received: by mail-qt1-f200.google.com with SMTP id
 s14-20020ac8528e0000b029025f76cabdfcso1408081qtn.15
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UtPF7Mbc0GFMIALgZprmx34idb2F7aRh8MXAxd8fatc=;
 b=rxhlsOYhHT1UYIykF3EU5T3qOtV8ZI7WFxD7fbzPU7db+W2q5bcNgkGaQQhl5Z94rE
 nDvhcx7kKaLn8Bsd6+NjGsKnEk8gp0VeooEnzhpccfusCrUSrDpvsjPl/zAO7Kyh6uFa
 b9dslMDL7grd4NbLqVkgRAJhJuTTw6zwWYeujStNdVX/xOKP/I4WeTHX1V+kGp67aIJ3
 F//6EbH8Tg3LzzNu2siQhutWJt3yfMM43EzGBpDNl9wGHtOKr2oHMgS+BORmv6NYzkWc
 mA5L5kwzFM8wjwzKm2qp5+QXtcysITc3hpfgh7q90SCxShVinO8iDcKFSC9y6mQqi6EQ
 hhnQ==
X-Gm-Message-State: AOAM532yN7JyjMRlV5ikMRjryrXrMjJlZOT+qnPzV3X6DVMlICYmYB6C
 Jx/0bndjnshaV1iyi8QRshl7Cg5rdgVhp2aB1X6VV2xs4NV5TpyaSiyWsHyhji2tI332aqRX4Uy
 ORCFkSHAzTKDzJ1U=
X-Received: by 2002:a05:622a:14d3:: with SMTP id
 u19mr4699784qtx.258.1627058269989; 
 Fri, 23 Jul 2021 09:37:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYe69BUwMJuxCsO3AUVGf7APUPRBJnBN2EDS+MVp2bX3PZRXxbv7mv1jtMaGBg0fR5HMezUg==
X-Received: by 2002:a05:622a:14d3:: with SMTP id
 u19mr4699772qtx.258.1627058269816; 
 Fri, 23 Jul 2021 09:37:49 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id c1sm43189qtj.36.2021.07.23.09.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:37:49 -0700 (PDT)
Date: Fri, 23 Jul 2021 12:37:47 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 6/6] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on background snapshots
Message-ID: <YPrwW+43fLe7JEVN@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-7-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721092759.21368-7-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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

On Wed, Jul 21, 2021 at 11:27:59AM +0200, David Hildenbrand wrote:
> We already don't ever migrate memory that corresponds to discarded ranges
> as managed by a RamDiscardManager responsible for the mapped memory region
> of the RAMBlock.
> 
> virtio-mem uses this mechanism to logically unplug parts of a RAMBlock.
> Right now, we still populate zeropages for the whole usable part of the
> RAMBlock, which is undesired because:
> 
> 1. Even populating the shared zeropage will result in memory getting
>    consumed for page tables.
> 2. Memory backends without a shared zeropage (like hugetlbfs and shmem)
>    will populate an actual, fresh page, resulting in an unintended
>    memory consumption.
> 
> Discarded ("logically unplugged") parts have to remain discarded. As
> these pages are never part of the migration stream, there is no need to
> track modifications via userfaultfd WP reliably for these parts.
> 
> Further, any writes to these ranges by the VM are invalid and the
> behavior is undefined.
> 
> Note that Linux only supports userfaultfd WP on private anonymous memory
> for now, which usually results in the shared zeropage getting populated.
> The issue will become more relevant once userfaultfd WP supports shmem
> and hugetlb.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


