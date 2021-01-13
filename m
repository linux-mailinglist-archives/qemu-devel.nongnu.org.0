Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5B2F4B03
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 13:11:37 +0100 (CET)
Received: from localhost ([::1]:47814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzezv-0005FS-VK
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 07:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzeyY-0004jz-Se
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:10:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzeyU-0002Nv-GY
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610539805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0G0B9TcfrNeDuBJxPVXxihwoHyGiodw5MhMyyKTF5j0=;
 b=gRrQv1MZM3vE+n3QxPS+1WGWCpXuF91rLc7U2dVwaaSLZGD4ncJRdsjUl9IpdEFQnKtBoU
 bMJa5iCKDDOlrvbUobdOj6ltEwHRL75pO7vrcQy7eATp8GZPadnxIqnIn1Jpq9iB4K5RPL
 NY4f54FjESWlCDek5AvBoD2c6Y42158=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-of4_qiaIM-CvxWzfznCXfg-1; Wed, 13 Jan 2021 07:10:01 -0500
X-MC-Unique: of4_qiaIM-CvxWzfznCXfg-1
Received: by mail-wr1-f71.google.com with SMTP id v7so870701wra.3
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0G0B9TcfrNeDuBJxPVXxihwoHyGiodw5MhMyyKTF5j0=;
 b=k81ulta0wHwkRbZu/igbyaxyl2kZtpY3jbMV66iwhioGQx+KLIq8mGLHBR3OQ5pylJ
 DWVBOPpGobgmaBMFZe4vxYDdro4cZKJiDJtL823dOQk9/TSfhrDb3AT6utlqFetQJFnl
 ILKTsUlE4+1V1ZV+HcJ8q2BQ8IWqCds+YAiG0EQI29tsOxFJXA0lfw7den2LA9hAfTQP
 6tRvrG9FhCySz2+5o4u54Z/WijBWA+vlyOg1Ras5MkGjScvBT3CK02fs5MBarGbH004V
 cFn86ka8UxTW+pZ0KZs2TWGaZSaCvbDbw9iJ+kloj1CD6RhuqBZ/g5qdeXsWcAgBenYR
 gbQA==
X-Gm-Message-State: AOAM532ISyrFHc9hOkyPQY48kgBmg2fOnOeOt6W5rGoTO8JgVzoUUmvT
 ikrYmz0Ss7ACr2iCzRz3HqnWUANfBlXPiSMBWrh0wrw7mKtm0mpXPGg6xutdB6cWeKW4OanfFdN
 4FmDzhCIWiVKp7Oc=
X-Received: by 2002:adf:8290:: with SMTP id 16mr2228006wrc.27.1610539799927;
 Wed, 13 Jan 2021 04:09:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyObSViG04kWoVI35Nl2+evEfkSzLiSXgAkI4g3Vg4NBK+05vvgDVG9RkIzbv+Ngxh8J1MuSg==
X-Received: by 2002:adf:8290:: with SMTP id 16mr2227984wrc.27.1610539799729;
 Wed, 13 Jan 2021 04:09:59 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id a13sm3024407wrt.96.2021.01.13.04.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 04:09:58 -0800 (PST)
Date: Wed, 13 Jan 2021 07:09:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [RFC 0/5] pc: support user provided NIC naming/indexing
Message-ID: <20210113064312-mutt-send-email-mst@kernel.org>
References: <20201222233934.451578-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201222233934.451578-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: laine@redhat.com, jusual@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 22, 2020 at 06:39:29PM -0500, Igor Mammedov wrote:
> 
> Series implements support for 'onboard' naming scheme for network
> interfaces (1), which is based on PCI firmware spec and lets user
> to explicitly specify index that will be used by guest to name
> network interface, ex:
>     -device e1000,acpi-index=33
> should make guest rename NIC name to 'eno33' where 'eno' is default
> prefix for this scheme.
> 
> Hope is that it will allow to simplify launching VMs from
> template disk images with different set VM configurations
> without need to reconfigure guest network intrfaces or
> risk of loosing network connectivity.

Questions:
the spec says:
Assignment of specific device names to multi-function devices installed in expansion
slots, and/or PCI or PCI Express devices that are hot-added to expansion slots in operating system-
environment would be handled in operating system-specific manner, and is not specified via this
specification.

Accordingly, link below says:
" Names incorporating Firmware/BIOS provided index numbers for on-board devices (example: eno1)"

to what extend does guest assume the index is for on-board devices?
it seems things work for fedora but how confident are we that this
will keep working.

Further, code seems to only look at the slot level.
According to this, and according to the spec, this does not work with
multifunction devices, does it?


The link you supplied lists another option:
"Names incorporating Firmware/BIOS provided PCI Express hotplug slot index numbers (example: ens1)"
these are under management control already ... 

Also if we ask users to supply the property on the slot then it seems
that the property can be baked into ACPI when it's created instead of
being loaded from host - we can avoid adding new registers, this seems
preferable.  Could someone from management side chime in on whether that
is sufficient?

More questions:

does all this affect windows guests at all?

where does the "acpi index" terminology come from?
the pci firmware spec talks about "instance number", right?



> For more detailed description/examples see patches [3-4/5]
> 
> 1)
>  https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/ 
> 
> Git repo for testing:
>    https://github.com/imammedo/qemu/branches acpi-index-rfc
> 
> Igor Mammedov (5):
>   acpi: add aml_to_decimalstring() and aml_call6() helpers
>   tests: acpi: temporary whitelist DSDT changes
>   pci: introduce apci-index property for PCI device
>   pci: acpi: add _DSM method to PCI devices
>   tests: acpi: update expected data files
> 
>  include/hw/acpi/aml-build.h                 |   3 +
>  include/hw/acpi/pci.h                       |   1 +
>  include/hw/acpi/pcihp.h                     |   7 +-
>  include/hw/pci/pci.h                        |   1 +
>  tests/qtest/bios-tables-test-allowed-diff.h |  21 +++++
>  hw/acpi/aml-build.c                         |  28 +++++++
>  hw/acpi/pci.c                               |  84 ++++++++++++++++++++
>  hw/acpi/pcihp.c                             |  25 +++++-
>  hw/i386/acpi-build.c                        |  31 +++++++-
>  hw/pci/pci.c                                |   1 +
>  tests/data/acpi/pc/DSDT                     | Bin 5065 -> 6023 bytes
>  tests/data/acpi/pc/DSDT.acpihmat            | Bin 6390 -> 7348 bytes
>  tests/data/acpi/pc/DSDT.bridge              | Bin 6924 -> 8689 bytes
>  tests/data/acpi/pc/DSDT.cphp                | Bin 5529 -> 6487 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm             | Bin 6719 -> 7677 bytes
>  tests/data/acpi/pc/DSDT.hpbridge            | Bin 5026 -> 5990 bytes
>  tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3084 -> 3177 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs             | Bin 5137 -> 6095 bytes
>  tests/data/acpi/pc/DSDT.memhp               | Bin 6424 -> 7382 bytes
>  tests/data/acpi/pc/DSDT.numamem             | Bin 5071 -> 6029 bytes
>  tests/data/acpi/pc/DSDT.roothp              | Bin 5261 -> 6324 bytes
>  tests/data/acpi/q35/DSDT                    | Bin 7801 -> 7863 bytes
>  tests/data/acpi/q35/DSDT.acpihmat           | Bin 9126 -> 9188 bytes
>  tests/data/acpi/q35/DSDT.bridge             | Bin 7819 -> 7911 bytes
>  tests/data/acpi/q35/DSDT.cphp               | Bin 8265 -> 8327 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9455 -> 9517 bytes
>  tests/data/acpi/q35/DSDT.ipmibt             | Bin 7876 -> 7938 bytes
>  tests/data/acpi/q35/DSDT.memhp              | Bin 9160 -> 9222 bytes
>  tests/data/acpi/q35/DSDT.mmio64             | Bin 8932 -> 9024 bytes
>  tests/data/acpi/q35/DSDT.numamem            | Bin 7807 -> 7869 bytes
>  tests/data/acpi/q35/DSDT.tis                | Bin 8407 -> 8468 bytes
>  31 files changed, 197 insertions(+), 5 deletions(-)
> 
> -- 
> 2.27.0


