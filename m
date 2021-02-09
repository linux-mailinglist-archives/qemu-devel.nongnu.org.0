Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480EA315278
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:16:12 +0100 (CET)
Received: from localhost ([::1]:47178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UkN-000719-BT
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9Uj0-0006A5-GP
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9Uiy-0006aM-Ho
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612883683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j1BoK/ySePD6G1NewSXUUdLdx1cd3ycGR35Bgd/jwlQ=;
 b=Qy7VYMMwKhe6eYxScLj+2pyiEIcfmjxpkj4BS6q657FTyOyc/rZMX4Aj4NMXQlm4Qghd2E
 nw1iSBQlM8gLqx0Y+zQM1ibjalgvhYxhw2VNqA475TlIb3lvCXI6VDht+PVumlVJ0v9NU1
 PWd18hUQjfjtMPZY1ieoQI63eAbLoqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-3mNGtDFcMsmQ-WqYuj1Gtw-1; Tue, 09 Feb 2021 10:14:40 -0500
X-MC-Unique: 3mNGtDFcMsmQ-WqYuj1Gtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90241804688;
 Tue,  9 Feb 2021 15:14:38 +0000 (UTC)
Received: from localhost (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15B4160C4D;
 Tue,  9 Feb 2021 15:14:33 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:14:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH v2 4/9] acpi: set fadt.smi_cmd to zero when SMM is not
 supported
Message-ID: <20210209161431.1c4752f7@redhat.com>
In-Reply-To: <8156558747a6db89a4e8e015ab0b1e9bea07b27f.1612821109.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <8156558747a6db89a4e8e015ab0b1e9bea07b27f.1612821109.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Feb 2021 13:57:23 -0800
isaku.yamahata@gmail.com wrote:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> From table 5.9 SMI_CMD of ACPI spec
> > This field is reserved and must be zero on system
> > that does not support System Management mode.  
> 
> When smm is not enabled, set it to zero to comform to the spec.
> When -machine smm=off is passed, the change to FACP is as follows.
> 
> @@ -1,46 +1,46 @@
>  /*
>   * Intel ACPI Component Architecture
>   * AML/ASL+ Disassembler version 20180105 (64-bit version)
>   * Copyright (c) 2000 - 2018 Intel Corporation
>   *
> - * Disassembly of tests/data/acpi/q35/FACP, Fri Feb  5 16:57:04 2021
> + * Disassembly of /tmp/aml-1OQYX0, Fri Feb  5 16:57:04 2021
>   *
>   * ACPI Data Table [FACP]
>   *
>   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
>   */
> 
>  [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
>  [004h 0004   4]                 Table Length : 000000F4
>  [008h 0008   1]                     Revision : 03
> -[009h 0009   1]                     Checksum : 1F
> +[009h 0009   1]                     Checksum : D6
>  [00Ah 0010   6]                       Oem ID : "BOCHS "
>  [010h 0016   8]                 Oem Table ID : "BXPCFACP"
>  [018h 0024   4]                 Oem Revision : 00000001
>  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>  [020h 0032   4]        Asl Compiler Revision : 00000001
> 
>  [024h 0036   4]                 FACS Address : 00000000
>  [028h 0040   4]                 DSDT Address : 00000000
>  [02Ch 0044   1]                        Model : 01
>  [02Dh 0045   1]                   PM Profile : 00 [Unspecified]
>  [02Eh 0046   2]                SCI Interrupt : 0009
> -[030h 0048   4]             SMI Command Port : 000000B2
> -[034h 0052   1]            ACPI Enable Value : 02
> -[035h 0053   1]           ACPI Disable Value : 03
> +[030h 0048   4]             SMI Command Port : 00000000
> +[034h 0052   1]            ACPI Enable Value : 00
> +[035h 0053   1]           ACPI Disable Value : 00
>  [036h 0054   1]               S4BIOS Command : 00
>  [037h 0055   1]              P-State Control : 00
>  [038h 0056   4]     PM1A Event Block Address : 00000600
>  [03Ch 0060   4]     PM1B Event Block Address : 00000000
>  [040h 0064   4]   PM1A Control Block Address : 00000604
>  [044h 0068   4]   PM1B Control Block Address : 00000000
>  [048h 0072   4]    PM2 Control Block Address : 00000000
>  [04Ch 0076   4]       PM Timer Block Address : 00000608
>  [050h 0080   4]           GPE0 Block Address : 00000620
>  [054h 0084   4]           GPE1 Block Address : 00000000
>  [058h 0088   1]       PM1 Event Block Length : 04
>  [059h 0089   1]     PM1 Control Block Length : 02
>  [05Ah 0090   1]     PM2 Control Block Length : 00
>  [05Bh 0091   1]        PM Timer Block Length : 04
>  [05Ch 0092   1]            GPE0 Block Length : 10
>  [05Dh 0093   1]            GPE1 Block Length : 00
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

when migrated to old QEMU, and VM after that is reset it
regenerate ACPI tables for old QEMU, so guest should be
able to turn on ACPI.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f56d699c7f..c2f11d95d8 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -139,6 +139,8 @@ const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio = {
>  static void init_common_fadt_data(MachineState *ms, Object *o,
>                                    AcpiFadtData *data)
>  {
> +    X86MachineState *x86ms = X86_MACHINE(ms);
> +    bool smm_enabled = x86_machine_is_smm_enabled(x86ms);
>      uint32_t io = object_property_get_uint(o, ACPI_PM_PROP_PM_IO_BASE, NULL);
>      AmlAddressSpace as = AML_AS_SYSTEM_IO;
>      AcpiFadtData fadt = {
> @@ -159,12 +161,16 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
>          .rtc_century = RTC_CENTURY,
>          .plvl2_lat = 0xfff /* C2 state not supported */,
>          .plvl3_lat = 0xfff /* C3 state not supported */,
> -        .smi_cmd = ACPI_PORT_SMI_CMD,
> +        .smi_cmd = smm_enabled ? ACPI_PORT_SMI_CMD : 0,
>          .sci_int = object_property_get_uint(o, ACPI_PM_PROP_SCI_INT, NULL),
>          .acpi_enable_cmd =
> -            object_property_get_uint(o, ACPI_PM_PROP_ACPI_ENABLE_CMD, NULL),
> +            smm_enabled ?
> +            object_property_get_uint(o, ACPI_PM_PROP_ACPI_ENABLE_CMD, NULL) :
> +            0,
>          .acpi_disable_cmd =
> -            object_property_get_uint(o, ACPI_PM_PROP_ACPI_DISABLE_CMD, NULL),
> +            smm_enabled ?
> +            object_property_get_uint(o, ACPI_PM_PROP_ACPI_DISABLE_CMD, NULL) :
> +            0,
>          .pm1a_evt = { .space_id = as, .bit_width = 4 * 8, .address = io },
>          .pm1a_cnt = { .space_id = as, .bit_width = 2 * 8,
>                        .address = io + 0x04 },


