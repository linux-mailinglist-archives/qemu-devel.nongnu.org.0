Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9455733C7A6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:23:17 +0100 (CET)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtkC-0003nW-LL
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLtix-0002fd-TI
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLtiv-0002PQ-8g
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615839716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQENdRmv2frLMF00NjakYth7HIwSPqkGWM4bskIGQo8=;
 b=JrSb4BL1TdCyz/+P2eRZkOV/IP20DYX56GwDgBgjpzC9gIVU3IoF4njEMTNCQIFxo0mwlY
 hedTn7EK21sxKOpoMv8lgbPPUBKlQXbLBCOunuNVBVQyGoci03XrEH0JpzdqIq51KaMg9d
 E5J23B1JH5PeWwRvJ78WT+0MWu3O/zE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-KUWpn8KBOpuvECGADXPWuA-1; Mon, 15 Mar 2021 16:21:52 -0400
X-MC-Unique: KUWpn8KBOpuvECGADXPWuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2DBB100C661;
 Mon, 15 Mar 2021 20:21:51 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3631A614FB;
 Mon, 15 Mar 2021 20:21:35 +0000 (UTC)
Date: Mon, 15 Mar 2021 21:21:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: no-reply@patchew.org
Subject: Re: [PATCH 0/6] pc: support user provided NIC naming/indexing
Message-ID: <20210315212133.398c2dc9@redhat.com>
In-Reply-To: <161583340826.29026.17366591502722428122@c9d4d6fbb2f1>
References: <20210315180102.3008391-1-imammedo@redhat.com>
 <161583340826.29026.17366591502722428122@c9d4d6fbb2f1>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 11:36:49 -0700 (PDT)
no-reply@patchew.org wrote:

> Patchew URL: https://patchew.org/QEMU/20210315180102.3008391-1-imammedo@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20210315180102.3008391-1-imammedo@redhat.com
> Subject: [PATCH 0/6] pc: support user provided NIC naming/indexing
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/20210315180102.3008391-1-imammedo@redhat.com -> patchew/20210315180102.3008391-1-imammedo@redhat.com
> Switched to a new branch 'test'
> c0692b4 tests: acpi: update expected blobs
> 1a843d9 pci: acpi: add _DSM method to PCI devices
> 6b55586 acpi: add aml_to_decimalstring() and aml_call6() helpers
> 7b887f4 pci: acpi: ensure that acpi-index is unique
> 4056291 pci: introduce apci-index property for PCI device
> 9bd3a1b tests: acpi: temporary whitelist DSDT changes
> 
> === OUTPUT BEGIN ===
> 1/6 Checking commit 9bd3a1b94c0f (tests: acpi: temporary whitelist DSDT changes)
> 2/6 Checking commit 40562915acde (pci: introduce apci-index property for PCI device)
> ERROR: Macros with complex values should be enclosed in parenthesis
> #284: FILE: include/hw/acpi/pcihp.h:77:
> +#define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
>          VMSTATE_UINT32_TEST(pcihp.hotplug_select, state, \
>                              test_pcihp), \
>          VMSTATE_STRUCT_ARRAY_TEST(pcihp.acpi_pcihp_pci_status, state, \
>                                    ACPI_PCIHP_MAX_HOTPLUG_BUS, \
>                                    test_pcihp, 1, \
>                                    vmstate_acpi_pcihp_pci_status, \
> -                                  AcpiPciHpPciStatus)
> +                                  AcpiPciHpPciStatus), \
> +        VMSTATE_UINT32_TEST(pcihp.acpi_index, state, \
> +                            test_acpi_index)
probably false positive
(I don't know what's wrong here and how to fix it)

> total: 1 errors, 0 warnings, 197 lines checked
> 
> Patch 2/6 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.

below warnings are intentional to follow comments style we use within aml-build.c

> 3/6 Checking commit 7b887f42419a (pci: acpi: ensure that acpi-index is unique)
> 4/6 Checking commit 6b555869ad66 (acpi: add aml_to_decimalstring() and aml_call6() helpers)
> WARNING: Block comments use a leading /* on a separate line
> #27: FILE: hw/acpi/aml-build.c:640:
> +    Aml *var = aml_opcode(0x97 /* ToDecimalStringOp */);
> 
> WARNING: Block comments use a leading /* on a separate line
> #32: FILE: hw/acpi/aml-build.c:645:
> +        build_append_byte(var->buf, 0x00 /* NullNameOp */);
> 
> total: 0 errors, 2 warnings, 55 lines checked
> 
> Patch 4/6 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 5/6 Checking commit 1a843d9de55e (pci: acpi: add _DSM method to PCI devices)
> WARNING: Block comments use a leading /* on a separate line
> #127: FILE: hw/i386/acpi-build.c:568:
> +                        1 /* have supported functions */ |
> 
> total: 0 errors, 1 warnings, 140 lines checked
> 
> Patch 5/6 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 6/6 Checking commit c0692b4b7df0 (tests: acpi: update expected blobs)
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> The full log is available at
> http://patchew.org/logs/20210315180102.3008391-1-imammedo@redhat.com/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com


