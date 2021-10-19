Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA53433561
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 14:05:31 +0200 (CEST)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcns2-00010A-MM
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 08:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mcnn5-0005hW-PB
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 08:00:29 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mcnn1-0000Ki-Vw
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 08:00:23 -0400
Received: by mail-pl1-x630.google.com with SMTP id t11so13493439plq.11
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 05:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Cv53y8BzSpAH75TPaK4tW6vzfQ+8SXIUH40MSKnzwLs=;
 b=jcSqep5+1o/TBK7q58nTcGu6MF2XNJ9GqA9mcBemZOV9RWOrRbTCUsVKRYHesQ2GWH
 wAMUH8u0uyVWJxRpaLsIbxuDy0+gphOzVWVVd7DYDt2OdMYZ/6UJTQRQUfJC83pwjEKz
 0zfCFEBLHvF80Ql7WT0ElDiVY+PoL2/hITRidCW5xJUMQvdBE8Ado+/Oa5zEc7aDHUn3
 omv3FphiVMado/AwYQ6Yz9wyOwFiIJ7f7N6o2qN78CsasXV2XzT327ggbmr33W0sJXfm
 I1g1zTNx5CqKkK0uEGsq0l/tOIOW3aAjmIkpJb1hp3gfS65qzR9uwmM3uOe0JxhVSbAX
 4KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Cv53y8BzSpAH75TPaK4tW6vzfQ+8SXIUH40MSKnzwLs=;
 b=hVvD3yIzXB1H5TpvZYQywPRS+pSz67tSZyB0dBHe6OuWRDsLhUrnV5oYpif7fcnoo+
 c3Qt0j4n9dZmuwZrqyyBO437r//cjOu5kMLrsSKkjGxPAnhSUqEDZRVGhWkyCiGQIl06
 SQFUJSCWc+eHe66grzX6XNT3TapQtkwF2EknwvUj4MUsnO/Dmng5LF4bpj8FOwyUbQdz
 f3FnnzcPQWrQJqMQ2MuSRuNcOHOYjwp3NuyMSUDPvmcNc2D7wCtERztF/Zzg+ME2ABfK
 vxU4nMifHJbhhXbpR98Rlqk1/TqeCvFCjnnxn4AtXf+idu9FDXK8O1ij2fD7KnMvinKu
 mE4g==
X-Gm-Message-State: AOAM533iQqKB+F/ztgQcTzegb2Ul4CCscQlkbH3K2RIrku+QPh3LubKE
 7aEgEeJ5jGCXI4kS+J7avL0USw==
X-Google-Smtp-Source: ABdhPJyR3YJo7J1BYKvRKDWjz9sXqdZJt8gRUVw/M2iNI/D+ZHcnFQCFlr46IKxlc7UVexPb/sZHCw==
X-Received: by 2002:a17:902:8ec5:b0:13a:2789:cbb0 with SMTP id
 x5-20020a1709028ec500b0013a2789cbb0mr33421251plo.60.1634644817729; 
 Tue, 19 Oct 2021 05:00:17 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.197.251])
 by smtp.googlemail.com with ESMTPSA id h4sm324314pjj.5.2021.10.19.05.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 05:00:17 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 19 Oct 2021 17:30:10 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v8 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
In-Reply-To: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2110191728580.168116@anisinha-lenovo>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 ani@anisinha.ca, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric:

So I do not see all the patches in the series for v8. Just so you know,
when you spin out a new version, please do send all the patches in the
series again, including the ones that might have been already reviewed.

Ani


On Fri, 15 Oct 2021, Eric DeVolder wrote:

> This patchset introduces support for the ACPI Error Record
> Serialization Table, ERST.
>
> For background and implementation information, please see
> docs/specs/acpi_erst.rst, which is patch 2/10.
>
> Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>
> ---
> v8: 15oct2021
>  - Added Kconfig option for ERST, per Ani Sinha
>  - Fixed patch ordering, per Ani
>
> v7: 7oct2021
>  - style improvements, per Igor
>  - use of endian accessors for storage header, per Igor
>  - a number of optimizations and improvements, per Igor
>  - updated spec for header, per Igor
>  - updated spec for rst format, per Michael Tsirkin
>  - updated spec for new record_size parameter
>    Due to changes in the spec, I am not carrying the
>    Acked-by from Ani Sinha.
>  - changes for and testing of migration to systems with
>    differing ERST_RECORD_SIZE
>
> v6: 5aug2021
>  - Fixed compile warning/error, per Michael Tsirkin
>  - Fixed mingw32 build error, per Michael
>  - Converted exchange buffer to MemoryBackend, per Igor
>  - Migrated test to PCI, per Igor
>  - Significantly reduced amount of copying, per Igor
>  - Corrections/enhancements to acpi_erst.txt, per Igor
>  - Many misc/other small items, per Igor
>
> v5: 30jun2021
>  - Create docs/specs/acpi_erst.txt, per Igor
>  - Separate PCI BARs for registers and memory, per Igor
>  - Convert debugging to use trace infrastructure, per Igor
>  - Various other fixups, per Igor
>
> v4: 11jun2021
>  - Converted to a PCI device, per Igor.
>  - Updated qtest.
>  - Rearranged patches, per Igor.
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
>  - Split patch into smaller chunks, per Igor Mammedov
>  - Did away with use of ACPI packed structures, per Igor Mammedov
>
> v1: 26oct2020
>  - initial post
>
> ---
> Eric DeVolder (10):
>   ACPI ERST: bios-tables-test.c steps 1 and 2
>   ACPI ERST: specification for ERST support
>   ACPI ERST: PCI device_id for ERST
>   ACPI ERST: header file for ERST
>   ACPI ERST: support for ACPI ERST feature
>   ACPI ERST: build the ACPI ERST table
>   ACPI ERST: create ACPI ERST table for pc/x86 machines
>   ACPI ERST: qtest for ERST
>   ACPI ERST: bios-tables-test testcase
>   ACPI ERST: step 6 of bios-tables-test.c
>
>  docs/specs/acpi_erst.rst          |  200 +++++++
>  hw/acpi/Kconfig                   |    6 +
>  hw/acpi/erst.c                    | 1077 +++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build               |    1 +
>  hw/acpi/trace-events              |   15 +
>  hw/i386/acpi-build.c              |    9 +
>  hw/i386/acpi-microvm.c            |    9 +
>  include/hw/acpi/erst.h            |   24 +
>  include/hw/pci/pci.h              |    1 +
>  tests/data/acpi/microvm/ERST.pcie |  Bin 0 -> 912 bytes
>  tests/data/acpi/pc/DSDT.acpierst  |  Bin 0 -> 5969 bytes
>  tests/data/acpi/pc/ERST           |    0
>  tests/data/acpi/q35/DSDT.acpierst |  Bin 0 -> 8306 bytes
>  tests/data/acpi/q35/ERST          |    0
>  tests/qtest/bios-tables-test.c    |   55 ++
>  tests/qtest/erst-test.c           |  167 ++++++
>  tests/qtest/meson.build           |    2 +
>  17 files changed, 1566 insertions(+)
>  create mode 100644 docs/specs/acpi_erst.rst
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
>  create mode 100644 tests/data/acpi/microvm/ERST.pcie
>  create mode 100644 tests/data/acpi/pc/DSDT.acpierst
>  create mode 100644 tests/data/acpi/pc/ERST
>  create mode 100644 tests/data/acpi/q35/DSDT.acpierst
>  create mode 100644 tests/data/acpi/q35/ERST
>  create mode 100644 tests/qtest/erst-test.c
>
> --
> 1.8.3.1
>
>

