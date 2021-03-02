Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9392532A3F3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:23:08 +0100 (CET)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6rb-0000i4-Kl
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lH6ZB-0004dH-NG
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lH6Z6-0005zK-LB
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614697439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQmqapcwvPwvCdx1b6xjP9C4MprOStPf4ObAGH8qn7k=;
 b=edGnfqdM5LEr2tkYUMVG+TQWOYo2mcnFYFw5AfKmXMRWsJoEV8yuVXRm0uZuzsO//BTlKX
 aX64iQ2HFA/AAw+OVhV4O9oE/GaK4x+NIMIdvmuMmrXVjarulA1kN1LwHJcsSy32M6prff
 qLNbJkUS0rX25L/OMqDr2U4YLW4U7oI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-5iEzUnwZPsalU1RTghLFnA-1; Tue, 02 Mar 2021 10:03:56 -0500
X-MC-Unique: 5iEzUnwZPsalU1RTghLFnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DFE5CC620;
 Tue,  2 Mar 2021 15:03:55 +0000 (UTC)
Received: from MiWiFi-RA69-srv (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E61AA5D722;
 Tue,  2 Mar 2021 15:03:46 +0000 (UTC)
Date: Tue, 2 Mar 2021 16:03:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <20210302160344.10d5afe2@MiWiFi-RA69-srv>
In-Reply-To: <86c59853-b605-2037-5f27-5ad85fdff08c@redhat.com>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302100614.42acfe68@MiWiFi-RA69-srv>
 <cedb0323-ac0a-2eb5-497d-eb66a0dfefb6@redhat.com>
 <20210302045453-mutt-send-email-mst@kernel.org>
 <86c59853-b605-2037-5f27-5ad85fdff08c@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Mar 2021 11:32:09 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 02.03.21 11:07, Michael S. Tsirkin wrote:
> > On Tue, Mar 02, 2021 at 10:43:55AM +0100, David Hildenbrand wrote:  
> >> On 02.03.21 10:06, Igor Mammedov wrote:  
> >>> On Mon,  1 Mar 2021 11:48:33 +0100
> >>> David Hildenbrand <david@redhat.com> wrote:
> >>>  
> >>>> The resizeable memory region that is created for the cmd blob has a maximum
> >>>> size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,
> >>>> as we try fitting in additional data (e.g., vmgenid, nvdimm, intel-iommu),
> >>>> we require more than 4k and can crash QEMU when trying to resize the
> >>>> resizeable memory region beyond its maximum size:
> >>>>     $ build/qemu-system-x86_64 --enable-kvm \
> >>>>         -machine q35,nvdimm=on \
> >>>>         -smp 1 \
> >>>>         -cpu host \
> >>>>         -m size=2G,slots=8,maxmem=4G \
> >>>>         -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
> >>>>         -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
> >>>>         -nodefaults \
> >>>>         -device vmgenid \
> >>>>         -device intel-iommu  
> >>>
> >>> I don't see what's here that would make cmd_blob go above 4k.
> >>> can you try identify what actually fills it up (perhaps we have a hidden bug elsewhere)?  
> >>
> >> VM initialization:
> >>
> >> bios_linker_loader_alloc: allocating memory for 'etc/acpi/tables'  
> >>   -> new table size: 128  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 64 - 9659  
> >>   -> new table size: 256  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 384  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 512  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 640  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9659 - 9903  
> >>   -> new table size: 768  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9903 - 10023  
> >>   -> new table size: 896  
> >> bios_linker_loader_alloc: allocating memory for 'etc/vmgenid_guid'  
> >>   -> new table size: 1024  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/vmgenid_guid'  
> >>   -> new table size: 1280  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10023 - 10225  
> >>   -> new table size: 1408  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10225 - 10281  
> >>   -> new table size: 1536  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10281 - 10505  
> >>   -> new table size: 1664  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10505 - 10577  
> >>   -> new table size: 1792  
> >> bios_linker_loader_alloc: allocating memory for 'etc/acpi/nvdimm-mem'  
> >>   -> new table size: 1920  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/nvdimm-mem'  
> >>   -> new table size: 2048  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10577 - 11471  
> >>   -> new table size: 2176  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11471 - 11695  
> >>   -> new table size: 2304  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11695 - 11735  
> >>   -> new table size: 2432  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 2560  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 2688  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 2816  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 2944  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3072  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3200  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3328  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3456  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3584  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11735 - 11807  
> >>   -> new table size: 3712  
> >> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'  
> >>   -> new table size: 3840  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'  
> >>   -> new table size: 3968  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20  
> >>   -> new table size: 4096  
> >>
> >>
> >> When the bios/guest boots up:
> >>
> >> bios_linker_loader_alloc: allocating memory for 'etc/acpi/tables'  
> >>   -> new table size: 128  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 64 - 9769  
> >>   -> new table size: 256  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 384  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 512  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 640  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9769 - 10013  
> >>   -> new table size: 768  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10013 - 10133  
> >>   -> new table size: 896  
> >> bios_linker_loader_alloc: allocating memory for 'etc/vmgenid_guid'  
> >>   -> new table size: 1024  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/vmgenid_guid'  
> >>   -> new table size: 1280  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10133 - 10335  
> >>   -> new table size: 1408  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10335 - 10391  
> >>   -> new table size: 1536  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10391 - 10615  
> >>   -> new table size: 1664  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10615 - 10675  
> >>   -> new table size: 1792  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10675 - 10747  
> >>   -> new table size: 1920  
> >> bios_linker_loader_alloc: allocating memory for 'etc/acpi/nvdimm-mem'  
> >>   -> new table size: 2048  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/nvdimm-mem'  
> >>   -> new table size: 2176  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10747 - 11641  
> >>   -> new table size: 2304  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11641 - 11865  
> >>   -> new table size: 2432  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11865 - 11905  
> >>   -> new table size: 2560  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 2688  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 2816  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 2944  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3072  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3200  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3328  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3456  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3584  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3712  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >>   -> new table size: 3840  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11905 - 11981  
> >>   -> new table size: 3968  
> >> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'  
> >>   -> new table size: 4096  
> >> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'  
> >>   -> new table size: 4224  
> >> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20  
> >>   -> new table size: 4352  
> > 
> > yea it's because each command has space for 2 file names, so it's size
> > is 128 bytes. So just 32 commands is 4k.
> > 
> > Question is what is the extra table and why isn't it there before boot?
> >   
> > -> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
> > +> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'  
> >   >  -> new table size: 3840  
> > -> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
> > +> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11905 - 11981  
> >   >  -> new table size: 3968  
> > -> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
> > +> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'  
> >   >  -> new table size: 4096  
> > +> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'  
> > +>  -> new table size: 4224  
> > +> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20  
> > +>  -> new table size: 4352  
> > 
> > simply put I would expect the command blob size to be the same before
> > and after migration.  
> 
> Seems to be the "MCFG" table. I only see that pop up when the guest boots.
> 
> It depends on acpi_get_mcfg(). When the VM is created, it is not mapped 
> (mcfg->base == PCIE_BASE_ADDR_UNMAPPED), thus we don't create the table. 
> Once the bios configured/mapped it (wild guess), we create the table.
> 
> Anyhow, we seem to end up > 4k in the end.

Patch looks good to me,
maybe add to commit message current number of entries limit and how we reach over it
in reproducer above, plus nasty effect of tables that appears at runtime (like MCFG).

With that
Reviewed-by: Igor Mammedov <imammedo@redhat.com>


