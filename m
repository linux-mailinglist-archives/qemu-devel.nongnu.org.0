Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D04F32B8F0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 16:28:58 +0100 (CET)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHTQn-00055L-4X
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 10:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lHTOw-0003xe-NO
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:27:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lHTOs-00079Y-KZ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614785216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYXatWuFx904wGrHa4Sf1ANAIPhHbnEfNW+eUrxjoIU=;
 b=EIMFRDJTr3bqGkGbWeLhPVlf/x0IM1nq2qGTw6f1vx1D9n4QZ8u0afB8vRqBi4uHsWg3Fb
 BSXmyX1cUHf2pqAnMQ3f/fjh0g0wvJRtzpnWKL+KeK+tArd2M+RfYPYdXxMwGrCOSj2nYI
 Q4q+GOszeYTBFrc5YQ3fLgrBYZRb+E4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-2mfnnkRLPn-XTCdob7XUGQ-1; Wed, 03 Mar 2021 10:26:51 -0500
X-MC-Unique: 2mfnnkRLPn-XTCdob7XUGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59BA01868404;
 Wed,  3 Mar 2021 15:26:50 +0000 (UTC)
Received: from MiWiFi-RA69-srv (unknown [10.40.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBF7D19C46;
 Wed,  3 Mar 2021 15:26:41 +0000 (UTC)
Date: Wed, 3 Mar 2021 16:26:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <20210303162639.369b6035@MiWiFi-RA69-srv>
In-Reply-To: <9c74847e-9cea-3eb5-d9fc-5d969b6bb35d@redhat.com>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302172323.6cac394a@MiWiFi-RA69-srv>
 <09fbdaa9-2882-2056-a5a2-2ca0da8c12cf@redhat.com>
 <7d8281a8-0479-ac81-c602-ed87c71ce3e2@redhat.com>
 <9c74847e-9cea-3eb5-d9fc-5d969b6bb35d@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Mar 2021 10:49:08 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 02.03.21 19:43, David Hildenbrand wrote:
> >>>> The resizeable memory region that is created for the cmd blob has a maximum
> >>>> size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,  
> >>
> >> The expression "ACPI_BUILD_ALIGN_SIZE - 4k" makes no sense to me.
> >> ACPI_BUILD_ALIGN_SIZE is #defined in "hw/i386/acpi-build.c" as 0x1000,
> >> so the difference (ACPI_BUILD_ALIGN_SIZE - 4k) is zero.
> >>
> >> (1) Did you mean "ACPI_BUILD_ALIGN_SIZE -- 4k"? IOW, did you mean to
> >> quote the value of the macro?
> >>
> >> If you mean an em dash, then please use an em dash, not a hyphen (or
> >> please use parens).  
> > 
> > Yes, or rather use ACPI_BUILD_ALIGN_SIZE (4k).
> >   
> >>
> >>  
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
> >>>>
> >>>> Results in:
> >>>>     Unexpected error in qemu_ram_resize() at ../softmmu/physmem.c:1850:
> >>>>     qemu-system-x86_64: Size too large: /rom@etc/table-loader:
> >>>>       0x2000 > 0x1000: Invalid argument
> >>>>
> >>>> We try growing the resizeable memory region (resizeable RAMBlock) beyond
> >>>> its maximum size. Let's increase the maximum size from 4k to 64k, which
> >>>> should be good enough for the near future.  
> >>
> >> The existent code calls acpi_align_size(), for resizing the ACPI blobs
> >> (the GArray objects).
> >>
> >> (Unfortunately, the acpi_align_size() function is duplicated between
> >> "hw/i386/acpi-build.c" and "hw/arm/virt-acpi-build.c", which seems
> >> unjustified -- but anyway, I digress.)
> >>
> >> This seems to come from commit 868270f23d8d ("acpi-build: tweak acpi
> >> migration limits", 2014-07-29) and commit 451b157041d2 ("acpi: Align the
> >> size to 128k", 2020-12-08).
> >>
> >> (2) Why is the logic added in those commits insufficient?  
> > 
> > We are dealing with different blobs here (tables_blob vs. cmd_blob).
> >   
> >>
> >> What is the exact call tree that triggers the above error?  
> > 
> > [...]
> > 
> > acpi_build_update()->acpi_build_update()->memory_region_ram_resize()->qemu_ram_resize()
> > 
> > A longer calltrace can be found in https://bugzilla.redhat.com/show_bug.cgi?id=1927159.
> >   
> >>>> +++ b/hw/i386/acpi-microvm.c
> >>>> @@ -255,7 +255,8 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
> >>>>                          ACPI_BUILD_TABLE_MAX_SIZE);
> >>>>        acpi_add_rom_blob(acpi_build_no_update, NULL,
> >>>>                          tables.linker->cmd_blob,
> >>>> -                      "etc/table-loader", 0);
> >>>> +                      ACPI_BUILD_LOADER_FILE,
> >>>> +                      ACPI_BUILD_LOADER_MAX_SIZE);
> >>>>        acpi_add_rom_blob(acpi_build_no_update, NULL,
> >>>>                          tables.rsdp,
> >>>>                          ACPI_BUILD_RSDP_FILE, 0);  
> >>
> >> (3) Why are we using a different "tool" here, from the previous
> >> approach? We're no longer setting the GArray sizes; instead, we make the
> >> "rom->romsize" fields diverge from -- put differently, grow beyond --
> >> "rom->datasize". Why is that useful? What are the consequences?  
> > 
> > See ACPI_BUILD_TABLE_MAX_SIZE handling just in the acpi_add_rom_blob() above.
> >   
> >>
> >> Where is it ensured that data between "rom->datasize" and "rom->romsize"
> >> reads as zeroes?  
> > We only expose the current memory_region_size() to our guest, which is
> > always multiples of 4k pages.
> > 
> > rom->datasize and rom->romsize will be multiple of 4k AFAIKs.
> > 
> > acpi_align_size()-> g_array_set_size() will take care of zeroing out
> > any unused parts within a single 4k page.
> > 
> > So all unused, guest-visible part should always be 0 I think.
> >   
> >>
> >>  
> >>>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> >>>> index 380d3e3924..93cdfd4006 100644
> >>>> --- a/include/hw/acpi/aml-build.h
> >>>> +++ b/include/hw/acpi/aml-build.h
> >>>> @@ -6,6 +6,7 @@
> >>>>
> >>>>    /* Reserve RAM space for tables: add another order of magnitude. */
> >>>>    #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
> >>>> +#define ACPI_BUILD_LOADER_MAX_SIZE        0x40000
> >>>>
> >>>>    #define ACPI_BUILD_APPNAME6 "BOCHS "
> >>>>    #define ACPI_BUILD_APPNAME8 "BXPC    "  
> >>>  
> >>
> >> The commit message says "Let's increase the maximum size from 4k to
> >> 64k", and I have two problems with that:
> >>
> >> (4a) I have no idea where the current "4k" size comes from. (In case the
> >> 4k refers to ACPI_BUILD_ALIGN_SIZE, then why are we not changing that
> >> macro?)  
> > 
> > Changing ACPI_BUILD_ALIGN_SIZE would affect the legacy_table_size in
> > acpi_build() - so that can't be right.
> > 
> > What would also work is something like (to be improved)
> > 
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 45ad2f9533..49cfedddc8 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -81,6 +81,8 @@
> >    #define ACPI_BUILD_LEGACY_CPU_AML_SIZE    97
> >    #define ACPI_BUILD_ALIGN_SIZE             0x1000
> >    
> > +#define ACPI_BUILD_LOADER_ALIGN_SIZE      0x2000
> > +
> >    #define ACPI_BUILD_TABLE_SIZE             0x20000
> >    
> >    /* #define DEBUG_ACPI_BUILD */
> > @@ -2613,10 +2615,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> >                error_printf("Try removing CPUs, NUMA nodes, memory slots"
> >                             " or PCI bridges.");
> >            }
> > -        acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
> > +        acpi_align_size(tables_blob, ACPI_BUILD_ALIGN_SIZE);
> >        }
> >    
> > -    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
> > +    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_LOADER_ALIGN_SIZE);
> > 
> > 
> > At least for hw/i386/acpi-build.c.
> > 
> > We will end up creating the resizeable memory region/RAMBlock always with
> > a size=maximum_size=8k. (could also go for 64k here)
> > 
> > The only downside is that we might expose a bigger area to the
> > guest than necessary (e.g., 8k instead of 4k) and will e.g., migrate
> > 8k instead of 4k (not that we care).
> > 
> > 
> > On incoming migration from older QEMU versions, we should be able to just
> > shrink back from 8k to 4k - so migration from older QEMY versions should
> > continue working just fine.  
> 
> Correction: Older QEMU versions (e.g., before 
> 62be4e3a5041e84304aa23637da623a205c53ecc) did not support resizeable RAM 
> MemoryRegions / RAMBlocks. This affects ~ < QEMU v2.3.0.
> 
> So unconditionally changing the size of the cmd_blob memory region 
> (e.g., 4k -> 8k) would most probably break migration from never QEMU to 
> older QEMU (v2.2.0.). Not sure if we really care.
> 
> @MST, Igor what's your take?
We shouldn't change aligned size (an alignment value), since it's what goes
on migration stream wire.
Changing max should not affect migrations stream directly.
In most cases ping-pong migration should work as both sides will have
the same configuration, in unlikely case newer QEMU goes over current 4k,
it will jump to the next aligned size (8k) and migration will fail cleanly
due size mismatch and it can't be made any more prettier.
(similar to border cases when we switched to resizable regions for main tables
blob)


