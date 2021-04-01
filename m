Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE29351557
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:46:37 +0200 (CEST)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxee-0005Fq-NT
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lRxd4-0004h3-G9
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lRxcz-0005Tg-8N
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617284691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3QJDsEYu8Nucu3aYYsP9CEZPP67RKytJqml2aaYW0A=;
 b=XYqKkl1OYWjo8/R6UtBe4xy8Xh0GMD+LcURwYt2UXVHZWdSMO10ji8ff1Wgh4ZGAotQOzH
 2DbD3x46iCrzl3HWjx79F7sb2Yl36C3W6zmKmq+IzPiAxOwsg/9SsZyVVeI5F2ZiTL76TA
 sP0bMVzBmfTU+u3d/wLrzXMzDS2hOkw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-4UkstZDVOc2JF9J5IPpxsQ-1; Thu, 01 Apr 2021 09:44:45 -0400
X-MC-Unique: 4UkstZDVOc2JF9J5IPpxsQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o9-20020a05600c4fc9b029010cea48b602so3115787wmq.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 06:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=X3QJDsEYu8Nucu3aYYsP9CEZPP67RKytJqml2aaYW0A=;
 b=ejexShxY6piY1ok2D72N38GlBApyaV7msjKqXAYznBMoiE+K5MnlpEeiaM9NKadwH7
 aQ0d6hg7ZNigAYGbApq3Qi6nhXYYiNev/xAq/MCfE8s919tynM0W6UKQ9hjKJjZL6Ukq
 q8JAn9q4MMYYgPCnVCAPyDnx0OVIkoldfRhdvjgWE318DVuw5hHd+HCyuqnm6l0gxgLC
 de4cKQMLEzH/E1/TE9IL0s1ZjHOf4hTso+H9xEK6oipNCxbx9Hn+zqQdgIMDoGr4MPC7
 SIrZQZrc+hh9edchAxetTT8s7rs/bpXPCc0Naltlz5xqJOp7tZ0yQXMUlRidlsJiWyVV
 TybQ==
X-Gm-Message-State: AOAM533Z5nqW5OQ8zlobyfBQE6mY6d/UPLSFbtbLI9jngA8rvPS7bRvT
 usJZXpNN9PmnWucL6GC1t7nkjPP3gUDsR9XmilPh0cto4LeMEKbkeCsMQ8yrFXCAG+TBhpl34eD
 L3ek1zyiP8Fmc9mw=
X-Received: by 2002:a5d:658d:: with SMTP id q13mr9854413wru.388.1617284684558; 
 Thu, 01 Apr 2021 06:44:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdj898GprwloerKLNyTRm6YOiIReZKEWTdP0Wi6Mwvf9l9vGM2Two7t1aPjY3o2ojZYHeQzw==
X-Received: by 2002:a5d:658d:: with SMTP id q13mr9854398wru.388.1617284684428; 
 Thu, 01 Apr 2021 06:44:44 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id l15sm8258841wme.43.2021.04.01.06.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 06:44:43 -0700 (PDT)
Date: Thu, 1 Apr 2021 09:44:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Devolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Message-ID: <20210401094342-mutt-send-email-mst@kernel.org>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
 <CO1PR10MB45315FB0B8E0A2938DD655F4979A9@CO1PR10MB4531.namprd10.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CO1PR10MB45315FB0B8E0A2938DD655F4979A9@CO1PR10MB4531.namprd10.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwilk@oracle.com" <kwilk@oracle.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I tagged this for after the release. To help make sure I don't lose
this by mistake please ping after the QEMU release.

Thanks!

On Mon, Mar 01, 2021 at 07:04:50PM +0000, Eric Devolder wrote:
> Hi,
> A friendly request to review and/or provide feedback on this patchset.
> Thanks,
> eric
> ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
> From: Eric Devolder <eric.devolder@oracle.com>
> Sent: Monday, February 8, 2021 2:58 PM
> To: mst@redhat.com <mst@redhat.com>; imammedo@redhat.com <imammedo@redhat.com>;
> marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@redhat.com
> <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabkost@redhat.com
> <ehabkost@redhat.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>; kwilk@oracle.com
> <kwilk@oracle.com>
> Subject: [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST, support
> for QEMU
>  
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
> 


