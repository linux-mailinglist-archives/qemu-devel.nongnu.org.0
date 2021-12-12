Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5043471847
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 05:51:33 +0100 (CET)
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwGpg-00077z-AU
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 23:51:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mwGoF-00069x-IJ
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 23:50:03 -0500
Received: from [2a00:1450:4864:20::52d] (port=39635
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mwGoC-0008ML-TN
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 23:50:03 -0500
Received: by mail-ed1-x52d.google.com with SMTP id w1so41790825edc.6
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 20:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4q/JZX4adOweN2yqxHfBs8GHQX8eN4in6QlNJojcZoA=;
 b=s6rLx+Wdcv3dHGuf/0mFcMuaEmN50nHsdvkCzD/zsPCmsJDm3Sz2nqeAb6Y8dil2g/
 8OwACW2lWuac7PgOFW8tCC2jjQ5xZmS8Dy3EOb7NRwUBZszM2RAQsC+9GH9mm3AwWZiD
 o/4M9jO+hjqLZPjnMg4HhA9dG2c4sMSbraisl0BGTOr8dVdSPkrdoqQNleNfnjNIzkpN
 gz8kpdtf+bA4Cu/YjBpiqDuGwTfJX2ZmyECMmDiouWBzl8adeaPzQsn8QMaQRR77FQkh
 MaKBkaDNR0K138/lDYzGnOWT7K70nvovbHWDinNWRRaBRTFqafVMfaEpYgqGhLjMund+
 j6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4q/JZX4adOweN2yqxHfBs8GHQX8eN4in6QlNJojcZoA=;
 b=R2BERRcY0+8MPETjwOhmtIM+rwEXcLBkYZFuKa8SbX6dXI5b4qy/cCqWiUUwh2EaEC
 qfBM38LORJvdUCyzX+ZnZmvI6wy0JiRhI5n2/9VxOIgG8gbIxwqSxH1FTyEXtouIPGgx
 z9M0J/4W1OiD7vQTFfr2s+t6ZxL8F3QV0qclYHO1eAX2EsgJ+UM9JHqioEDb6qZ6qWYn
 k0lt04nHhwJSiPGpkN/5uBx0+8XndptYSNkn0ufz5PkvecJfbuf42y7POGLLmvWm2YSY
 v15URzdqc398hVwukcwFCcgQoQVgL29TcYPeIMzZI4J4Q7eQqG3ta/1EZw8B4NIHt0GU
 8zpw==
X-Gm-Message-State: AOAM532DpydxkqHxAApKlXgUY/twKmPktrrx9Jt7QK8XRCX0Somk6eJu
 TbY5ezdpvdfGQtOw2UGgaFIXl59cEHnai4zQJcY46g==
X-Google-Smtp-Source: ABdhPJxciF7fN933qE34gqqo5KKee8eD5YVFym66PAyFkoqI0AXq7oDP7+Tdlz9Ry7LIxNEar+Lp65AWxEGynnM1xHs=
X-Received: by 2002:aa7:de86:: with SMTP id j6mr52622601edv.1.1639284598266;
 Sat, 11 Dec 2021 20:49:58 -0800 (PST)
MIME-Version: 1.0
References: <20211210170415.583179-1-jean-philippe@linaro.org>
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Sun, 12 Dec 2021 10:19:47 +0530
Message-ID: <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Add ACPI support for virtio-iommu on the virt machine, by instantiating
> a VIOT table. Also add the tests for the ACPI table.
>
> Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> series [2] only contained the table and x86 support, which have been
> merged. Everything has now been reviewed and should be good to go.
>
> * Patches 1-2 add the VIOT table for the virt machine
> * Patches 3-4 are minor fixes
> * Patches 5-8 add tests for the VIOT table. They contain the tests for
>   q35 as well, which didn't make it last time because they depended on
>   another fix that has now been merged.

I believe the entire patchset has been reviewed and you are re-sending
it so that it gets pulled in after the release?

>
> [1] https://lore.kernel.org/qemu-devel/20211020172745.620101-1-jean-philippe@linaro.org/
> [2] https://lore.kernel.org/qemu-devel/20211026182024.2642038-1-jean-philippe@linaro.org/
>
> Jean-Philippe Brucker (8):
>   hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
>   hw/arm/virt: Remove device tree restriction for virtio-iommu
>   hw/arm/virt: Reject instantiation of multiple IOMMUs
>   hw/arm/virt: Use object_property_set instead of qdev_prop_set
>   tests/acpi: allow updates of VIOT expected data files
>   tests/acpi: add test case for VIOT
>   tests/acpi: add expected blobs for VIOT test on q35 machine
>   tests/acpi: add expected blob for VIOT test on virt machine
>
>  hw/arm/virt-acpi-build.c       |   7 ++++++
>  hw/arm/virt.c                  |  20 ++++++++---------
>  hw/virtio/virtio-iommu-pci.c   |  12 ++---------
>  tests/qtest/bios-tables-test.c |  38 +++++++++++++++++++++++++++++++++
>  hw/arm/Kconfig                 |   1 +
>  tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9398 bytes
>  tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
>  tests/data/acpi/virt/VIOT      | Bin 0 -> 88 bytes
>  8 files changed, 58 insertions(+), 20 deletions(-)
>  create mode 100644 tests/data/acpi/q35/DSDT.viot
>  create mode 100644 tests/data/acpi/q35/VIOT.viot
>  create mode 100644 tests/data/acpi/virt/VIOT
>
> --
> 2.34.1
>

