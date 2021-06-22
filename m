Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B693B099D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:55:52 +0200 (CEST)
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvikh-0002Ro-F6
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lvigX-0002hL-0b
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lvigQ-0006wK-PB
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624377085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ioL5OB0VvIabiDQoS6SGKigln4gPe7Q/l7hIaPSUOPM=;
 b=Ba08Jzs+/wFdJPDBcfRgXr37rXH2igW66T5bPs1RsirKKgGfab6XMnqfygaSOZL5CgXEb8
 ydZigH/bO97hv174W9qRO1Z6/Y8FvYMUOPwFudteYC572asEhGq+X9mZf23ujAKNqlLCgq
 4IHCPfZgedfPTXtL77QSa/CHayEIQIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-hCQaBsDxOv6LPP3JbyVLmw-1; Tue, 22 Jun 2021 11:51:24 -0400
X-MC-Unique: hCQaBsDxOv6LPP3JbyVLmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2931E19251CD;
 Tue, 22 Jun 2021 15:51:23 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E6E25D6AD;
 Tue, 22 Jun 2021 15:51:21 +0000 (UTC)
Date: Tue, 22 Jun 2021 17:51:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v4 0/6] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Message-ID: <20210622175120.3080e88a@redhat.com>
In-Reply-To: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
References: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Jun 2021 14:31:17 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This patchset introduces support for the ACPI Error Record
> Serialization Table, ERST.
> 
> Linux uses the persistent storage filesystem, pstore, to record
> information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
> independent of, and runs before, kdump.  In certain scenarios (ie.
> hosts/guests with root filesystems on NFS/iSCSI where networking
> software and/or hardware fails), pstore may contain the only
> information available for post-mortem debugging.
> 
> Two common storage backends for the pstore filesystem are ACPI ERST
> and UEFI. Most BIOS implement ACPI ERST; however, ACPI ERST is not
> currently supported in QEMU, and UEFI is not utilized in all guests.
> By implementing ACPI ERST within QEMU, then the ACPI ERST becomes a
> viable pstore storage backend for virtual machines (as it is now for
> bare metal machines).
> 
> Enabling support for ACPI ERST facilitates a consistent method to
> capture kernel panic information in a wide range of guests: from
> resource-constrained microvms to very large guests, and in
> particular, in direct-boot environments (which would lack UEFI
> run-time services).
> 
> Note that Microsoft Windows also utilizes the ACPI ERST for certain
> crash information, if available.
> 
> The ACPI ERST persistent storage is contained within a single backing
> file. The size and location of the backing file is specified upon
> QEMU startup of the ACPI ERST device.
> 
> The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
> (APEI)", and specifically subsection "Error Serialization", outlines
> a method for storing error records into persistent storage.
> 
> [1] "Advanced Configuration and Power Interface Specification",
>     version 6.2, May 2017.
>     https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
> 
> [2] "Unified Extensible Firmware Interface Specification",
>     version 2.8, March 2019.
>     https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf
> 
> Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> ---
> v4: 11jun2021
>  - Converted to a PCI device, per Igor.

Series looks much better now that impl. were split into
backend/frontend parts and dynamic MMIO placement.

I left some mandatory nit-picking about
comments, styles, overall documentation, leftovers
from previous revisions.
And also some how we can simplify impl. a bit more.


>  - Updated qtest.
> 
> v3: 28may2021
>  - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
>    internal array with explicit file operations, per Igor.
>  - Changed the way the qdev and base address are handled, allowing
>    ERST to be disabled at run-time. Also aligns better with other
>    existing code.
> 
> v2: 8feb2021
>  - Added qtest/smoke test per Paolo Bonzini
>  - Split patch into smaller chunks, per Igo Mammedov
>  - Did away with use of ACPI packed structures, per Igo Mammedov
> 
> v1: 26oct2020
>  - initial post
> 
> ---
> Eric DeVolder (6):
>   ACPI ERST: bios-tables-test.c steps 1 and 2
>   ACPI ERST: header file for ERST
>   ACPI ERST: support for ACPI ERST feature
>   ACPI ERST: create ACPI ERST table for pc/x86 machines.
>   ACPI ERST: qtest for ERST
>   ACPI ERST: step 6 of bios-tables-test.c
> 
>  hw/acpi/erst.c               | 880 +++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build          |   1 +
>  hw/i386/acpi-build.c         |   5 +
>  include/hw/acpi/erst.h       |  79 ++++
>  tests/data/acpi/microvm/ERST |   0
>  tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
>  tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
>  tests/qtest/erst-test.c      | 109 ++++++
>  tests/qtest/meson.build      |   2 +
>  9 files changed, 1076 insertions(+)
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
>  create mode 100644 tests/data/acpi/microvm/ERST
>  create mode 100644 tests/data/acpi/pc/ERST
>  create mode 100644 tests/data/acpi/q35/ERST
>  create mode 100644 tests/qtest/erst-test.c
> 


