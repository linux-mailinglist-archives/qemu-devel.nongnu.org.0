Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CA12073CA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 14:54:57 +0200 (CEST)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo4vY-0006K5-1U
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 08:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1jo4uZ-0004it-Oz; Wed, 24 Jun 2020 08:53:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:60036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1jo4uX-0006gE-Me; Wed, 24 Jun 2020 08:53:55 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D6EE20663;
 Wed, 24 Jun 2020 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593003231;
 bh=koLxx148mbpqdiW2kEPWmz5wBKOteWXDRyclRZ9Cn7A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n2RHXJ5RH8EpmJl4uNmdvecGrK7uTgbqWu8OTD9jtzP7MEr58ufQP4HdpkCzi6w/A
 g78XcWi3R/tBRWbKOqYY8XXCSxc0Y/zlTTxc8JtGnhlaHnDhrvPWQKd5cxbDw7KTXs
 vz9dehsBsYENYTElsdJ8cLGsTYHisVF3jdd+55S8=
Received: by mail-oi1-f175.google.com with SMTP id s10so1479180oih.10;
 Wed, 24 Jun 2020 05:53:51 -0700 (PDT)
X-Gm-Message-State: AOAM532QaMzon3jioRtwbECWgioyDPifiMaJk2EWk+OtvKO3VfaEzdzc
 t19c9bLPJS6FgzGGOWp5LT3aBYlVOR0yNwTEoyY=
X-Google-Smtp-Source: ABdhPJyPvK/7b5NELHV6Po4OwghBmwCf8ilfuEYXTgQXhNMfhbFKXsaC7ocppN1eO/65RzB4oGxx0mXzk1WZjVgXj/0=
X-Received: by 2002:aca:b241:: with SMTP id b62mr19014806oif.47.1593003230431; 
 Wed, 24 Jun 2020 05:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200622140620.17229-1-eric.auger@redhat.com>
In-Reply-To: <20200622140620.17229-1-eric.auger@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 24 Jun 2020 14:53:39 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFkms+fRm9=HM0zTtsG+77ajzHv95rVqMgXLsdougG0Kw@mail.gmail.com>
Message-ID: <CAMj1kXFkms+fRm9=HM0zTtsG+77ajzHv95rVqMgXLsdougG0Kw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] vTPM/aarch64 ACPI support
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=ardb@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 08:53:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 Andrew Jones <drjones@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, imammedo@redhat.com, eric.auger.pro@gmail.com,
 philmd@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Jun 2020 at 16:06, Eric Auger <eric.auger@redhat.com> wrote:
>
> Those patches bring MMIO TPM TIS ACPI support in machvirt.
>
> On ARM, the TPM2 table is added when the TPM TIS sysbus
> device is dynamically instantiated in machvirt.
>
> Also the TPM2 device object is described in the DSDT.
>
> Many thanks to Ard for his support.
>
> Tested with LUKS partition automatic decryption. Also
> tested with new bios-tables-test dedicated tests,
> sent separately.
>
> Best Regards
>
> Eric
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v5.0-tpm-acpi-v7
>
> History:
>
> v6 -> v7:
> - Collected Stefan and Igor's R-bs
> - Eventually removed Acpi20TPM2 struct
> - Updated the reference to the spec v1.2 rev8
>
> v5 -> v6:
> - added reference to the spec
> - add some comments about LAML and LASA fields which are
>   strangely undocumented in the spec for TPM2.0. So I kept
>   the decision to keep the Acpi20TPM2 struct for documentation
>   purpose.
>
> v4 -> v5:
> - Move of build_tpm2() in the generic acpi code was upstreamed
>   but this does not correspond to latest proposed version.
> - Rebase on top of edfcb1f21a
>
> v3 -> v4:
> - some rework in build_tpm2() as suggested by Igor
> - Restored tpm presence check in acpi_dsdt_add_tpm()
> - add the doc related patch
>
> v2 -> v3:
> - Rebase on top of Stefan's
>   "acpi: tpm: Do not build TCPA table for TPM 2"
> - brings conversion to build_append
>
> v1 -> v2:
> - move build_tpm2() in the generic code (Michael)
> - collect Stefan's R-b on 3/3
>
> Eric Auger (3):
>   acpi: Some build_tpm2() code reshape
>   arm/acpi: Add the TPM2.0 device under the DSDT
>   docs/specs/tpm: ACPI boot now supported for TPM/ARM
>

For the series

Tested-by: Ard Biesheuvel <ardb@kernel.org>

Thanks!

>  docs/specs/tpm.rst          |  2 --
>  include/hw/acpi/acpi-defs.h | 18 -------------
>  hw/acpi/aml-build.c         | 51 +++++++++++++++++++++++--------------
>  hw/arm/virt-acpi-build.c    | 34 +++++++++++++++++++++++++
>  4 files changed, 66 insertions(+), 39 deletions(-)
>
> --
> 2.20.1
>

