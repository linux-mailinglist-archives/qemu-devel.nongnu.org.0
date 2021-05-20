Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1EB38B259
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:00:04 +0200 (CEST)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljk9Z-00073f-IB
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ljjnf-00049c-Cu
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ljjnb-0005YS-T0
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621521439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afdUUH7vJ1gUMNBTAP9lJJHYEvMjhVoCcWMa84kF51A=;
 b=Uust4B09+BFMl7X2/+sDhPjzTu9U8rLBPssxA2QVznKuMmvs1AsI7IR7CfHWLOXcTmYyNz
 bYQG7LTOoEwMNakDVoVqCZqBYv7NOoHyQVZh5ja7gbEezQne5P+kfkKniE1AIjSf49aPoI
 d/M5A6p2LHj0hUMMDKysqDkf7dAUY7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-njSKdZ9jMWWH8N57C9LQWw-1; Thu, 20 May 2021 10:37:17 -0400
X-MC-Unique: njSKdZ9jMWWH8N57C9LQWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B71F800D62
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 14:37:16 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65BD15D751;
 Thu, 20 May 2021 14:37:05 +0000 (UTC)
Date: Thu, 20 May 2021 16:37:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [RFC PATCH v4 0/7] Use ACPI PCI hot-plug for Q35
Message-ID: <20210520163704.783ce172@redhat.com>
In-Reply-To: <20210513062642.3027987-1-jusual@redhat.com>
References: <20210513062642.3027987-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 08:26:35 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> The patch set consists of two parts:
> patches 1-4: introduce new feature
>              'acpi-pci-hotplug-with-bridge-support' on Q35
> patches 5-7: make the feature default along with changes in ACPI tables
> 
> This way maintainers can decide which way to choose without breaking
> the patch set.
> 
> With the feature disabled Q35 falls back to the native hot-plug.
> 
> Pros
>     * no racy behavior during boot (see 110c477c2ed)
>     * eject is possible - according to PCIe spec, attention button
>       press should lead to power off, and then the adapter should be
>       removed manually. As there is no power down state exists in QEMU,
>       we cannot distinguish between an eject and a power down
>       request.
>     * no delay during deleting - after the actual power off software
>       must wait at least 1 second before indicating about it. This case
>       is quite important for users, it even has its own bug:
>           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
>     * no timer-based behavior - in addition to the previous example,
>       the attention button has a 5-second waiting period, during which
>       the operation can be canceled with a second press. While this
>       looks fine for manual button control, automation will result in
>       the need to queue or drop events, and the software receiving
>       events in all sort of unspecified combinations of attention/power
>       indicator states, which is racy and uppredictable.
>     * fixes or reduces the likelihood of the bugs:
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1833187
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1657077
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1669931
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1678290

in addition,
while it's not trivial to test ACPI hotplug at 'make check' time (as it needs AML execution on guest side),
it should be possible to test native PCI-E and SHPC hotplug by using existing qpci_foo()
to read/write respective PCI device registers, so we could test that we didn't regress
current native/SHPC with this series.

It's would be better if test would come as part of this series,
but I'm fine with test being a separate patch on top if
you will take care of it within the same release cycle.

> Cons:
>     * no access to possible features presented in slot capabilities
>       (this is only surprise removal AFAIK)
> 
> v4:
>     * regain per-port control over hot-plug
>     * rebased over acpi-index changes
>     * set property on machine type to
>       make pci code more generic [Igor, Michael]
> 
> v3:
>     * drop change of _OSC to allow SHPC on hotplugged bridges
>     * use 'acpi-root-pci-hotplug'
>     * add migration states [Igor]
>     * minor style changes
> 
> v2:
>     * new ioport range for acpiphp [Gerd]
>     * drop find_pci_host() [Igor]
>     * explain magic numbers in _OSC [Igor]
>     * drop build_q35_pci_hotplug() wrapper [Igor]
> 
> Julia Suvorova (7):
>   hw/acpi/pcihp: Enhance acpi_pcihp_disable_root_bus() to support Q35
>   hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35
>   hw/acpi/ich9: Enable ACPI PCI hot-plug
>   hw/pci/pcie: Do not set HPC flag if acpihp is used
>   bios-tables-test: Allow changes in DSDT ACPI tables
>   hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35
>   bios-tables-test: Update golden binaries
> 
>  hw/i386/acpi-build.h              |   5 +++
>  include/hw/acpi/ich9.h            |   5 +++
>  include/hw/acpi/pcihp.h           |   3 +-
>  include/hw/boards.h               |   1 +
>  hw/acpi/ich9.c                    |  68 ++++++++++++++++++++++++++++++
>  hw/acpi/pcihp.c                   |  22 +++++++---
>  hw/acpi/piix4.c                   |   4 +-
>  hw/core/machine.c                 |  19 +++++++++
>  hw/i386/acpi-build.c              |  32 ++++++++------
>  hw/i386/pc.c                      |   4 +-
>  hw/i386/pc_q35.c                  |   8 ++++
>  hw/pci/pcie.c                     |  11 ++++-
>  tests/data/acpi/q35/DSDT          | Bin 7859 -> 8289 bytes
>  tests/data/acpi/q35/DSDT.acpihmat | Bin 9184 -> 9614 bytes
>  tests/data/acpi/q35/DSDT.bridge   | Bin 7877 -> 11003 bytes
>  tests/data/acpi/q35/DSDT.cphp     | Bin 8323 -> 8753 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9513 -> 9943 bytes
>  tests/data/acpi/q35/DSDT.ipmibt   | Bin 7934 -> 8364 bytes
>  tests/data/acpi/q35/DSDT.memhp    | Bin 9218 -> 9648 bytes
>  tests/data/acpi/q35/DSDT.mmio64   | Bin 8990 -> 9419 bytes
>  tests/data/acpi/q35/DSDT.nohpet   | Bin 7717 -> 8147 bytes
>  tests/data/acpi/q35/DSDT.numamem  | Bin 7865 -> 8295 bytes
>  tests/data/acpi/q35/DSDT.tis      | Bin 8465 -> 8894 bytes
>  23 files changed, 161 insertions(+), 21 deletions(-)
> 


