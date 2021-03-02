Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9187E32A89F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:56:44 +0100 (CET)
Received: from localhost ([::1]:47512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9GF-00086S-LI
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lH9Dm-0007Ph-2u
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:54:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lH9Dg-0006xg-OY
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614707642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sk5p3jIt2toxoS8rS3wRaN8BD79ie5xn3+2eCzX2Dow=;
 b=QC0Cjo+NynlhBlSessGLzqZlDI/r0vZbJDJYa3+KTLH4n0tgYmsnvptnJ+j+f0++sumJ1T
 iSkGbTRD0TojBbVknhBpV5CcdfYMtBc1UvtAh8viX1KeA+1xruPFg5qeg29YqM2nGvWXC/
 uW0jAJf9c/Z2einAvUxbyy/M9/52Nlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-vfAuHr6QOUyWLw2yAJYlOw-1; Tue, 02 Mar 2021 12:53:55 -0500
X-MC-Unique: vfAuHr6QOUyWLw2yAJYlOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0327B107ACC7;
 Tue,  2 Mar 2021 17:53:54 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-168.ams2.redhat.com
 [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 032915D9DD;
 Tue,  2 Mar 2021 17:53:44 +0000 (UTC)
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
To: Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302172323.6cac394a@MiWiFi-RA69-srv>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <09fbdaa9-2882-2056-a5a2-2ca0da8c12cf@redhat.com>
Date: Tue, 2 Mar 2021 18:53:43 +0100
MIME-Version: 1.0
In-Reply-To: <20210302172323.6cac394a@MiWiFi-RA69-srv>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/21 17:23, Igor Mammedov wrote:
> On Mon,  1 Mar 2021 11:48:33 +0100
> David Hildenbrand <david@redhat.com> wrote:
>
> CCing Laszlo,
>
> to make sure there is no complications from firmware side (especially
> when migration is progress, we've ironed it out for main tables blob
> but my memory is a bit fussy about issues we had to deal with if there
> were any)

You might have the following thread in mind:

  Invalid blob size on NVDIMM hot-add
  http://mid.mail-archive.com/5FC3163CFD30C246ABAA99954A238FA83F3FB328@lhreml524-mbs.china.huawei.com

That was a problem with the re-generation of the ACPI payload, which
wouldn't fit in the originally allocated space.

I don't know if that problem is related to the current patch -- it seems
to be?

More comments below:


>> The resizeable memory region that is created for the cmd blob has a maximum
>> size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,

The expression "ACPI_BUILD_ALIGN_SIZE - 4k" makes no sense to me.
ACPI_BUILD_ALIGN_SIZE is #defined in "hw/i386/acpi-build.c" as 0x1000,
so the difference (ACPI_BUILD_ALIGN_SIZE - 4k) is zero.

(1) Did you mean "ACPI_BUILD_ALIGN_SIZE -- 4k"? IOW, did you mean to
quote the value of the macro?

If you mean an em dash, then please use an em dash, not a hyphen (or
please use parens).


>> as we try fitting in additional data (e.g., vmgenid, nvdimm, intel-iommu),
>> we require more than 4k and can crash QEMU when trying to resize the
>> resizeable memory region beyond its maximum size:
>>   $ build/qemu-system-x86_64 --enable-kvm \
>>       -machine q35,nvdimm=on \
>>       -smp 1 \
>>       -cpu host \
>>       -m size=2G,slots=8,maxmem=4G \
>>       -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
>>       -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
>>       -nodefaults \
>>       -device vmgenid \
>>       -device intel-iommu
>>
>> Results in:
>>   Unexpected error in qemu_ram_resize() at ../softmmu/physmem.c:1850:
>>   qemu-system-x86_64: Size too large: /rom@etc/table-loader:
>>     0x2000 > 0x1000: Invalid argument
>>
>> We try growing the resizeable memory region (resizeable RAMBlock) beyond
>> its maximum size. Let's increase the maximum size from 4k to 64k, which
>> should be good enough for the near future.

The existent code calls acpi_align_size(), for resizing the ACPI blobs
(the GArray objects).

(Unfortunately, the acpi_align_size() function is duplicated between
"hw/i386/acpi-build.c" and "hw/arm/virt-acpi-build.c", which seems
unjustified -- but anyway, I digress.)

This seems to come from commit 868270f23d8d ("acpi-build: tweak acpi
migration limits", 2014-07-29) and commit 451b157041d2 ("acpi: Align the
size to 128k", 2020-12-08).

(2) Why is the logic added in those commits insufficient?

What is the exact call tree that triggers the above error?


>> Migration is not concerned with the maximum size of a RAMBlock, only
>> with the used size - so existing setups are not affected. Of course, we
>> cannot migrate a VM that would have crash when started on older QEMU from
>> new QEMU to older QEMU without failing early on the destination when
>> synchronizing the RAM state:
>>     qemu-system-x86_64: Size too large: /rom@etc/table-loader: 0x2000 > 0x1000: Invalid argument
>>     qemu-system-x86_64: error while loading state for instance 0x0 of device 'ram'
>>     qemu-system-x86_64: load of migration failed: Invalid argument
>>
>> While at it, replace "etc/table-loader" by ACPI_BUILD_LOADER_FILE in
>> the microvm.
>>
>> Note: we could warn for problematic setups that migration might not
>> always be possible - similar to how we handle the table blob; or we
>> could disallow setups that would have crashed until now for compat
>> machines. But I am not sure if the effort (messing compat machine
>> properties) is worth it as we fail migration in a safe way early.
>>
>> Cc: Alistair Francis <alistair.francis@xilinx.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  hw/arm/virt-acpi-build.c    | 3 ++-
>>  hw/i386/acpi-build.c        | 3 ++-
>>  hw/i386/acpi-microvm.c      | 3 ++-
>>  include/hw/acpi/aml-build.h | 1 +
>>  4 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index f9c9df916c..a91550de6f 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -865,7 +865,8 @@ void virt_acpi_setup(VirtMachineState *vms)
>>
>>      build_state->linker_mr =
>>          acpi_add_rom_blob(virt_acpi_build_update, build_state,
>> -                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
>> +                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
>> +                          ACPI_BUILD_LOADER_MAX_SIZE);
>>
>>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>>                      acpi_data_len(tables.tcpalog));
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 31a5f6f4a5..a75138ea5a 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -2524,7 +2524,8 @@ void acpi_setup(void)
>>
>>      build_state->linker_mr =
>>          acpi_add_rom_blob(acpi_build_update, build_state,
>> -                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
>> +                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
>> +                          ACPI_BUILD_LOADER_MAX_SIZE);
>>
>>      fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
>>                      tables.tcpalog->data, acpi_data_len(tables.tcpalog));
>> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
>> index 54b3af478a..fe8a965fe6 100644
>> --- a/hw/i386/acpi-microvm.c
>> +++ b/hw/i386/acpi-microvm.c
>> @@ -255,7 +255,8 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
>>                        ACPI_BUILD_TABLE_MAX_SIZE);
>>      acpi_add_rom_blob(acpi_build_no_update, NULL,
>>                        tables.linker->cmd_blob,
>> -                      "etc/table-loader", 0);
>> +                      ACPI_BUILD_LOADER_FILE,
>> +                      ACPI_BUILD_LOADER_MAX_SIZE);
>>      acpi_add_rom_blob(acpi_build_no_update, NULL,
>>                        tables.rsdp,
>>                        ACPI_BUILD_RSDP_FILE, 0);

(3) Why are we using a different "tool" here, from the previous
approach? We're no longer setting the GArray sizes; instead, we make the
"rom->romsize" fields diverge from -- put differently, grow beyond --
"rom->datasize". Why is that useful? What are the consequences?

Where is it ensured that data between "rom->datasize" and "rom->romsize"
reads as zeroes?

Is this change guest-visible at all?


>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index 380d3e3924..93cdfd4006 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -6,6 +6,7 @@
>>
>>  /* Reserve RAM space for tables: add another order of magnitude. */
>>  #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
>> +#define ACPI_BUILD_LOADER_MAX_SIZE        0x40000
>>
>>  #define ACPI_BUILD_APPNAME6 "BOCHS "
>>  #define ACPI_BUILD_APPNAME8 "BXPC    "
>

The commit message says "Let's increase the maximum size from 4k to
64k", and I have two problems with that:

(4a) I have no idea where the current "4k" size comes from. (In case the
4k refers to ACPI_BUILD_ALIGN_SIZE, then why are we not changing that
macro?)

(4b) The new macro ACPI_BUILD_LOADER_MAX_SIZE does not express 64KB,
contrary to the commit message: it expresses 256KB.

I could test this patch with OVMF and ArmVirtQemu of course, technically
speaking, but right now I'm not convinced the patch is *worth* testing,
as-is. Minimally, point (4b) appears to need a fix.


... The code is really difficult to understand; consider the following
macros:

- ACPI_BUILD_TABLE_MAX_SIZE  [include/hw/acpi/aml-build.h]
- ACPI_BUILD_ALIGN_SIZE      [hw/i386/acpi-build.c]
- ACPI_BUILD_TABLE_SIZE      [hw/i386/acpi-build.c, hw/arm/virt-acpi-build.c]
- ACPI_BUILD_LOADER_MAX_SIZE [include/hw/acpi/aml-build.h] -- being added now

I don't have the slightest idea why we need all of these macros.

Thanks
Laszlo


