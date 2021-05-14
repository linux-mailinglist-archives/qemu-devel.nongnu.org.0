Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1B5380AE0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 15:59:12 +0200 (CEST)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYLO-0003wG-SJ
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 09:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhYKE-00035D-Kg
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:57:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhYKB-0001LD-83
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621000673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i7y3pxpSsNUX/76mFyjk+O15zEUKw2Ku8GqV3FoFFx8=;
 b=hCAs7pjC/7Z7Kc2SpDtTl8p/AM1JTlu+lkqp15dBpyNckZEXMxEXkxlHtUxkQl/YDYvxW2
 GNVgHsyj265KQ+dDqAAZCF9uzx89USIN7m6yACkXDkTkLVnYk8cM3BnY7KvryUl4CpicHf
 s58S7pE7j0QhtKAjQimyNUDuxVViX2A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-KLutBTpkM3WOyvs5kWXpEQ-1; Fri, 14 May 2021 09:57:46 -0400
X-MC-Unique: KLutBTpkM3WOyvs5kWXpEQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 129-20020a1c02870000b029016fa2bab83bso1107607wmc.7
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 06:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i7y3pxpSsNUX/76mFyjk+O15zEUKw2Ku8GqV3FoFFx8=;
 b=t6C3vh13oFB4Xxgfc90vhqi7v0AnUWbYokrIegL3kWZcmeowSwIH+JyLWorxxLoV+P
 aN2/GQabO3ITaRWG2LNQDXL9hq1iEQ18bOH3j1dmAPPzLbK9Y8o9n2lAg3AnBToGGMwK
 ECBHffTriYqCl8uNuYeFV9zhZJKrmsUwd/IB/jqE5PNY/2GXn3bk97n/k0uKpeM6Vq1l
 08AGMRTmXEHR4uMb7eijdvyU5XpZqLzTQVw8D31UOSNIQeGwDFcBlB3iLUe4BFcYogWz
 wAnk8/uw49PPZd5wR8OJo6rKO1ZZOW+jCcNUrIqsTiPaYjpxHm0t4pXVPAZEpNxMe0Kk
 oRfg==
X-Gm-Message-State: AOAM5334annjdDl8Aef02XZomrp5+7cz/oahVmQiq52SqQdybAvXykt6
 C8d4LveosMOEf8zGDMxt7E/lRvrnJRyGCZQKTy8gF/xir5KxGEpnnfGN+KwBYxR1R6Ja3Omqh3r
 4dHkPSmfDW0GkcDU=
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr9790927wmq.154.1621000664702; 
 Fri, 14 May 2021 06:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7Hdf5NbKY0qbYldB+rSY8XZFc9IRZSoFompG7bQxBNY0ZEM2B5eSD/j5lpKv5XR1lQVpqYQ==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr9790906wmq.154.1621000664492; 
 Fri, 14 May 2021 06:57:44 -0700 (PDT)
Received: from redhat.com (bzq-79-181-160-222.red.bezeqint.net.
 [79.181.160.222])
 by smtp.gmail.com with ESMTPSA id 136sm3978256wmb.7.2021.05.14.06.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 06:57:43 -0700 (PDT)
Date: Fri, 14 May 2021 09:57:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Message-ID: <20210514095729-mutt-send-email-mst@kernel.org>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: ehabkost@redhat.com, qemu-devel@nongnu.org, kwilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 08, 2021 at 03:57:52PM -0500, Eric DeVolder wrote:
> This patchset introduces support for the ACPI Error Record
> Serialization Table, ERST.

OK I'm expecting v3 I guess?


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
> resource- constrained microvms to very large guests, and in
> particular, in direct-boot environments (which would lack UEFI
> run-time services).
> 
> Note that Microsoft Windows also utilizes the ACPI ERST for certain
> crash information, if available.
> 
> The ACPI ERST persistent storage is contained within a single backing
> file, with a default size of 64KiB. The size and filename of the
> backing file can be obtained from QEMU parameters.
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
> v2: 8feb2021
>  - Added qtest/smoke test per Paolo Bonzini
>  - Split patch into smaller chunks, per Igo Mammedov
>  - Did away with use of ACPI packed structures, per Igo Mammedov
> 
> v1: 26oct2020
>  - initial post
> 
> ---
> Eric DeVolder (7):
>   ACPI ERST: bios-tables-test.c steps 1 and 2
>   ACPI ERST: header file for erst
>   ACPI ERST: support for ACPI ERST feature
>   ACPI ERST: build step for ACPI ERST
>   ACPI ERST: support ERST for x86 guest
>   ACPI ERST: qtest for ERST
>   ACPI ERST: bios-tables-test.c step 5
> 
>  hw/acpi/erst.c               | 952 +++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build          |   1 +
>  hw/i386/acpi-build.c         |   4 +
>  include/hw/acpi/erst.h       |  77 ++++
>  tests/data/acpi/microvm/ERST |   0
>  tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
>  tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
>  tests/qtest/erst-test.c      | 106 +++++
>  tests/qtest/meson.build      |   2 +
>  9 files changed, 1142 insertions(+)
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
>  create mode 100644 tests/data/acpi/microvm/ERST
>  create mode 100644 tests/data/acpi/pc/ERST
>  create mode 100644 tests/data/acpi/q35/ERST
>  create mode 100644 tests/qtest/erst-test.c
> 
> -- 
> 1.8.3.1


