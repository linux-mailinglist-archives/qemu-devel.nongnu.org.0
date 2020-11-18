Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990EA2B8460
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:09:06 +0100 (CET)
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSpF-0000Rj-M6
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfSlo-0007fy-V6
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:05:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfSll-0008IM-V2
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605726313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+mG8FiVh8lQoxlBrvv5pV4pL2szBtaoiCNBh9IV9mps=;
 b=GiPC96kydYzEK3P3eCG4wTbwCVwAwIK5yvBNck1g2kdxGwrNYrXP9T2KRfEKV8vRG3zqez
 npwLRDNzKd5ztIMYpGshu9SjXQHF+iY+uupIR015MGTUd2UyieGC9KfwjguwnFavuRjV4t
 ndPlejI78mFr4YEh3XvDW4ofQXv90dk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-YrsVEJtkPV6IwOlMAnnG8w-1; Wed, 18 Nov 2020 14:05:11 -0500
X-MC-Unique: YrsVEJtkPV6IwOlMAnnG8w-1
Received: by mail-qt1-f199.google.com with SMTP id 100so2153341qtf.14
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 11:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+mG8FiVh8lQoxlBrvv5pV4pL2szBtaoiCNBh9IV9mps=;
 b=YDGl3qWkgNsiX8A+i5YqiFmK1Kwjr5iSN6FrbHs668wqJUe1Slprxz/ZIF/V12ipAv
 VnDtWruK8SLPbbD4W4ks0GshPlYwct1KC+1z8X4f7QnSviynDm5uAznpTL07Qgx6SVNV
 htgb8N2cRnv9pjjzo0Z8cW4+wLbe3AlEW2BHLjo5tQ520Nc9H0c+E2NnFNqUHomw2YIp
 0nLPxBHReQafkMywnhdei/oP5SAM3so2qQxQB+UMMq/d/jkSrUR1dEQsFl2XatToaOQc
 ejeq9VnBUCcFRw/nc0AuNo0lNJOdELlhH64iQ7PsUPk6lMIVPiLoKzfbPzvDajcWIwVp
 c45g==
X-Gm-Message-State: AOAM531ZeMRZ/pQurz6BF8P4LeI5+HOFUduZwxvehXllNvpbtLhniNxu
 p1q8x76acCjv4AshX2wVlgQuF5UIyFSQgtO98bDNVsPktY/P81zjQ0yE7wLmlnpunyR6kNPC4c0
 Do0rWT+OI9YiEFlY=
X-Received: by 2002:ae9:ef10:: with SMTP id d16mr6099674qkg.422.1605726311019; 
 Wed, 18 Nov 2020 11:05:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ6iYZdlWN/BSDXBEQLqvlUw0CNzUQwWPisnBEKRNQ5EqPjUdetyUoFhj1GfjL/HlLXTr4tA==
X-Received: by 2002:ae9:ef10:: with SMTP id d16mr6099649qkg.422.1605726310710; 
 Wed, 18 Nov 2020 11:05:10 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id f128sm17488036qkj.48.2020.11.18.11.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 11:05:09 -0800 (PST)
Date: Wed, 18 Nov 2020 14:05:08 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH PROTOTYPE 3/6] vfio: Implement support for sparse RAM
 memory regions
Message-ID: <20201118190508.GD29639@xz-x1>
References: <20200924160423.106747-1-david@redhat.com>
 <20200924160423.106747-4-david@redhat.com>
 <20201020194434.GD200400@xz-x1>
 <14aaf9f1-9aa4-3a6b-ff25-8a4c7e29c2a6@redhat.com>
 <20201020204443.GE200400@xz-x1>
 <fcbea24d-c56a-12b4-4a7b-d8faa1e04047@redhat.com>
 <20201118152311.GB29639@xz-x1>
 <6141422c-1427-2a8d-b3ff-3c49ab1b59d2@redhat.com>
 <20201118170143.GC29639@xz-x1>
 <1f1602db-748a-4e9d-dfde-950b573592fb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1f1602db-748a-4e9d-dfde-950b573592fb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Le Tan <tamlokveer@gmail.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, wei.huang2@amd.com,
 qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 06:37:42PM +0100, David Hildenbrand wrote:
> > > a) Unplugging plugged virtio-mem blocks while they are mapped via an
> > >     IOMMU
> > > 
> > > 1. Guest: map memory location X located on a virtio-mem device inside a
> > >     plugged block into the IOMMU
> > >     -> QEMU IOMMU notifier: create vfio DMA mapping
> > >     -> VFIO pins memory of unplugged blocks (populating memory)
> > > 2. Guest: Request to unplug memory location X via virtio-mem device
> > >     -> QEMU virtio-mem: discards the memory.
> > >     -> VFIO still has the memory pinned

[...]

> > > b) Mapping unplugged virtio-mem blocks via an IOMMU
> > > 
> > > 1. Guest: map memory location X located on a virtio-mem device inside an
> > >     unplugged block
> > >     -> QEMU IOMMU notifier: create vfio DMA mapping
> > >     -> VFIO pins memory of unplugged blocks (populating memory)

[...]

> Again, sane guests will never do that, for the very reason you mentioned
> "the guest should know that this region of virtio-mem is not valid since
> unplugged,". But a malicious guest could try doing that to cause trouble :)

Oh I think I see your point now. :) And thanks for the write-up about how
virtio-mem works.

So it's about the malicious guests.

I agree with you that we can try to limit above from happening, e.g. by
teaching vfio_get_xlat_addr() to fail when it's going to map some unplugged
range of virtio-mem device.

Or... imho, we may not even need to worry too much on those misuses of
virtio-mem? As long as the issue is self-contained within the buggy VM/process.
E.g., the worst case of such a malicious guest is to fiddle around the maximum
allowed memory size granted to the virtio-mem device to either have pages
incorrectly pinned, or some strange IOVA mapped to unplugged pages within that
range.  As long as it won't affect other VMs and the host, and qemu won't crash
with that, then it seems ok.

-- 
Peter Xu


