Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35856556E97
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 00:39:42 +0200 (CEST)
Received: from localhost ([::1]:55490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o490e-0005l9-Nv
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 18:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o48z0-000554-KZ
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 18:37:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o48yx-000444-Gv
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 18:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655937473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubfq5kpvJ0IjwfQM50bbsHe68Hz8W3SA1oQJJEVz1kM=;
 b=FTk7h3Okp5kxWP3eOM+8uG+z/DKemQz89S6V1rhwcvm2xB7GnhvIyOzlE3sugReK9PO9Lz
 4QEUFxuyVM93W4+qgxxbkzKhehCyhhpjQLU9LuiAAlJ1BhmKNculQLrcKXmDPQwrici/Lw
 zU8xGshYSPEQZP4weh70oCcK4vyRVJY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-1Vt4QqHgOKGKw1kuOIuTsA-1; Wed, 22 Jun 2022 18:37:52 -0400
X-MC-Unique: 1Vt4QqHgOKGKw1kuOIuTsA-1
Received: by mail-il1-f200.google.com with SMTP id
 i8-20020a056e020d8800b002d931252904so3363355ilj.23
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 15:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ubfq5kpvJ0IjwfQM50bbsHe68Hz8W3SA1oQJJEVz1kM=;
 b=YCgRDJp00aj7gOpH3ecZ0h+w8KzHZiONyU/dD6hhdad3BoTb4PjnoD1CSMbv4Pey6Q
 7blZX08DYUWbk+AMhmjWf4o3uTGWWnyCpr5mfszTyz76Mrj1tROQbFPyo6a3ycYCMA2X
 TZX8OzwDMVnaKgnmH+eTJH8YZCDftOOuQKcWmfcbV3u4o+DJt6M4L8wQPea8QkBRCfed
 NBxV7IKFUyXncR308X5qp2aTm/4+ZobKCwmCDxfcM/kvM6ZOuFyZPNByMShNYRj2ysti
 KhJfwkdXWwsoA5x/KjUh45oHnGPZdmRF/rEHvjt9DuJuTIuvJsJ7PfsHHEZF4VkQZPBb
 AjAQ==
X-Gm-Message-State: AJIora/r2R5EqOsmlMU/FuXK9z1V0lzUHOD12ISOoG/aOvcXqz3dKq+Z
 5v9oYiwdZHZR/InMLRqjTK8dtXaKfVBoRrM0H0U90MmayRsj12sPDPVCH/dSSWnSkcI5QYBh13V
 mJEx2I2lfskh4f/4=
X-Received: by 2002:a05:6602:3c8:b0:672:4e60:7294 with SMTP id
 g8-20020a05660203c800b006724e607294mr3001623iov.17.1655937472058; 
 Wed, 22 Jun 2022 15:37:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3WzXeTKmyPp7Q8nCiLhorG0VjqvDQTRg/0VP8iI69PV+nnrdbxtZrZuUqcPTFpmnljq0Acg==
X-Received: by 2002:a05:6602:3c8:b0:672:4e60:7294 with SMTP id
 g8-20020a05660203c800b006724e607294mr3001606iov.17.1655937471767; 
 Wed, 22 Jun 2022 15:37:51 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y3-20020a929503000000b002d169fe10acsm9216435ilh.24.2022.06.22.15.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 15:37:51 -0700 (PDT)
Date: Wed, 22 Jun 2022 16:37:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Igor Mammedov <imammedo@redhat.com>, Suravee
 Suthikulpanit <suravee.suthikulpanit@amd.com>, wei.huang2@amd.com, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v5 0/5] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Message-ID: <20220622163750.12424dc3.alex.williamson@redhat.com>
In-Reply-To: <20220520104532.9816-1-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 May 2022 11:45:27 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> v4[5] -> v5:
> * Fixed the 32-bit build(s) (patch 1, Michael Tsirkin)
> * Fix wrong reference (patch 4) to TCG_PHYS_BITS in code comment and
> commit message;
> 
> ---
> 
> This series lets Qemu spawn i386 guests with >= 1010G with VFIO,
> particularly when running on AMD systems with an IOMMU.
> 
> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
> affected by this extra validation. But AMD systems with IOMMU have a hole in
> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
> here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
> section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.
> 
> VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
>  -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
> of the failure:
> 
> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
> 	failed to setup container for group 258: memory listener initialization failed:
> 		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)
> 
> Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
> as documented on the links down below.
> 
> This small series tries to address that by dealing with this AMD-specific 1Tb hole,
> but rather than dealing like the 4G hole, it instead relocates RAM above 4G
> to be above the 1T if the maximum RAM range crosses the HT reserved range.
> It is organized as following:
> 
> patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
>          address of the 4G boundary
> 
> patches 2-3: Move pci-host qdev creation to be before pc_memory_init(),
> 	     to get accessing to pci_hole64_size. The actual pci-host
> 	     initialization is kept as is, only the qdev_new.
> 
> patch 4: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
> possible address acrosses the HT region. Errors out if the phys-bits is too
> low, which is only the case for >=1010G configurations or something that
> crosses the HT region.
> 
> patch 5: Ensure valid IOVAs only on new machine types, but not older
> ones (<= v7.0.0)
> 
> The 'consequence' of this approach is that we may need more than the default
> phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
> address, consequently needing 41 phys-bits as opposed to the default of 40
> (TCG_PHYS_ADDR_BITS). Today there's already a precedent to depend on the user to
> pick the right value of phys-bits (regardless of this series), so we warn in
> case phys-bits aren't enough. Finally, CMOS loosing its meaning of the above 4G
> ram blocks, but it was mentioned over RFC that CMOS is only useful for very
> old seabios. 
> 
> Additionally, the reserved region is added to E820 if the relocation is done.

I was helping a user on irc yesterday who was assigning a bunch of GPUs
on an AMD system and was not specifying an increased PCI hole and
therefore was not triggering the relocation.  The result was that the
VM doesn't know about this special range and given their guest RAM
size, firmware was mapping GPU BARs overlapping this reserved range
anyway.  I didn't see any evidence that this user was doing anything
like booting with pci=nocrs to blatantly ignore the firmware provided
bus resources.

To avoid this sort of thing, shouldn't this hypertransport range always
be marked reserved regardless of whether the relocation is done?

vfio-pci won't generate a fatal error when MMIO mappings fail, so this
scenario can be rather subtle.  NB, it also did not resolve this user's
problem to specify the PCI hole size and activate the relocation, so
this was not necessarily the issue they were fighting, but I noted it
as an apparent gap in this series.  Thanks,

Alex


