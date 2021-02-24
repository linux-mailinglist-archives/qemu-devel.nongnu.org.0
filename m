Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9360C3241A7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:11:01 +0100 (CET)
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwke-0003d1-Kk
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lEwiq-0002f7-Ep
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:09:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lEwin-000052-R4
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614182944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c836CApH/CDz1nUV4uRtU+zWUSX0ER9W4DAF2tk3Cpg=;
 b=BHUjBXzRczQEyxe4wDAaekrfDvoGnKITkWIyhXaaADnplipENfIwrRS/HvyaB3hrOh/cR9
 1na3JR0fySHebYLc40PBffkkj1Bfmshwf87betLNgXvPuJeWJmLSJA98cxEyu0KDU8PKtD
 KqwigUkWy6tdXI9ozuy0OXtY0cz925s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-IYLbMGHoPMyvdVjI4knYTw-1; Wed, 24 Feb 2021 11:09:00 -0500
X-MC-Unique: IYLbMGHoPMyvdVjI4knYTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EECEB8D918A;
 Wed, 24 Feb 2021 16:08:41 +0000 (UTC)
Received: from localhost (unknown [10.40.208.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60EBB5D6AD;
 Wed, 24 Feb 2021 16:08:37 +0000 (UTC)
Date: Wed, 24 Feb 2021 17:08:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH v5 00/10] ACPI related fixes to comform the spec better
Message-ID: <20210224170835.738c92ec@redhat.com>
In-Reply-To: <cover.1613615732.git.isaku.yamahata@intel.com>
References: <cover.1613615732.git.isaku.yamahata@intel.com>
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
Cc: isaku.yamahata@intel.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Feb 2021 21:51:08 -0800
isaku.yamahata@gmail.com wrote:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Miscellaneous bug fixes related to ACPI to play nice with guest BIOSes/OSes
> by conforming to ACPI spec better.

Michael,
  I finished with review,
  to me series looks ready to be merged

> Changes from v4:
> - rebased to 1af5629673
> - move compat property from 3/10 to 4/10
> - use the end of the address for rage maximum of memory region
> - code simplification to generate _CRS
> 
> Changes from v3:
> - rename compat property name to smm-compat and add it to ICH9-LPC and PIIX4_PM
> - MMCFG memory region to use dword memory region when possible
> - fix max base address of MMCFG memory region
> - add more test cases with smm-compat=on and/or piix4
> 
> Changes from v2:
> - improved commit message
> - introduced compat property x-smm-compat-5
> - _CRS for MMCONFIG resource, read MMCONFIG info from qemu, generate resource
>   instead of dynamically reading chipset configuration.
> 
> Changes from v1:
> - fixed style issue with fixes to checkpatch.pl
> - fixed make check breakage
> - added ACPI table tests
> - update comment message to include acpi table diff
> 
> Isaku Yamahata (9):
>   checkpatch: don't emit warning on newly created acpi data files
>   qtest: update tests/qtest/bios-tables-test-allowed-diff.h
>   ich9, piix4: add properoty, smm-compat, to keep compatibility of SMM
>   acpi/core: always set SCI_EN when SMM isn't supported
>   acpi: set fadt.smi_cmd to zero when SMM is not supported
>   acpi: add test case for smm unsupported -machine smm=off
>   hw/i386: declare ACPI mother board resource for MMCONFIG region
>   acpi: add test case for -no-hpet
>   qtest/acpi/bios-tables-test: update acpi tables
> 
> Sean Christopherson (1):
>   i386: acpi: Don't build HPET ACPI entry if HPET is disabled
> 
>  hw/acpi/core.c                    |  11 +++-
>  hw/acpi/ich9.c                    |   2 +-
>  hw/acpi/piix4.c                   |   5 +-
>  hw/core/machine.c                 |   5 +-
>  hw/i386/acpi-build.c              |  72 +++++++++++++++++++--
>  hw/isa/lpc_ich9.c                 |   1 +
>  hw/isa/vt82c686.c                 |   2 +-
>  include/hw/acpi/acpi.h            |   4 +-
>  include/hw/acpi/ich9.h            |   1 +
>  scripts/checkpatch.pl             |   4 +-
>  tests/data/acpi/pc/DSDT.nohpet    | Bin 0 -> 4923 bytes
>  tests/data/acpi/pc/FACP.nosmm     | Bin 0 -> 116 bytes
>  tests/data/acpi/q35/DSDT          | Bin 7801 -> 7859 bytes
>  tests/data/acpi/q35/DSDT.acpihmat | Bin 9126 -> 9184 bytes
>  tests/data/acpi/q35/DSDT.bridge   | Bin 7819 -> 7877 bytes
>  tests/data/acpi/q35/DSDT.cphp     | Bin 8265 -> 8323 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9455 -> 9513 bytes
>  tests/data/acpi/q35/DSDT.ipmibt   | Bin 7876 -> 7934 bytes
>  tests/data/acpi/q35/DSDT.memhp    | Bin 9160 -> 9218 bytes
>  tests/data/acpi/q35/DSDT.mmio64   | Bin 8932 -> 8990 bytes
>  tests/data/acpi/q35/DSDT.nohpet   | Bin 0 -> 7717 bytes
>  tests/data/acpi/q35/DSDT.numamem  | Bin 7807 -> 7865 bytes
>  tests/data/acpi/q35/DSDT.tis      | Bin 8407 -> 8465 bytes
>  tests/data/acpi/q35/FACP.nosmm    | Bin 0 -> 244 bytes
>  tests/qtest/bios-tables-test.c    | 100 ++++++++++++++++++++++++++++++
>  25 files changed, 194 insertions(+), 13 deletions(-)
>  create mode 100644 tests/data/acpi/pc/DSDT.nohpet
>  create mode 100644 tests/data/acpi/pc/FACP.nosmm
>  create mode 100644 tests/data/acpi/q35/DSDT.nohpet
>  create mode 100644 tests/data/acpi/q35/FACP.nosmm
> 


