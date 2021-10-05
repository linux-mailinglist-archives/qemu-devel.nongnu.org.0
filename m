Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462C7422329
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 12:12:50 +0200 (CEST)
Received: from localhost ([::1]:55274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXhRJ-0002NF-Al
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 06:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXhMi-0007AI-Gq
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:08:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXhMb-0007Y5-V0
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:08:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so2017761pjb.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=84MMT72U7UFfoI3cbdTrBe23CUdJfC3FZTyJvAuZ+Hs=;
 b=htqxPTsiuDG+329bK8krDRMddAFCnFOe6oCOvnECOR3Pc4Rg1OHkagCOPpWenEJGS9
 R3Y4Gxu3V/LCUVeK6YA1wIDR9za5KEKZQbp2El92p34qYY3smmIVnQbPizakMLvRJYDa
 rKsJIy+sFXBCTG1aH67qC7Wv/43OCUwRXKXmoItSnxfotSiHoNHSlJimaOiL98zp5yC4
 qZ90G+0xhK5L0/5o2QDOmhxT150qYFqjX/D2shsf0E6vhL84e+sPDAfZUAMkOs+O7U7L
 O3bZMCp5xO2gT5SC3gHDQDNm3NEYpMm/VqGxaUJT6bW8r83rwd2o9YzuCxM9MNvZaHvB
 4OCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=84MMT72U7UFfoI3cbdTrBe23CUdJfC3FZTyJvAuZ+Hs=;
 b=y7oIdiF/SbTOl3WET4jVu2ZjmsAyxMwChPbRZSpT7mD2aSoed6Hsi8PD8wpP4b03Yt
 84U5x7h5uBO4RzIXt3bydcvbQUuWPEmajNoC1Onq9o05BE9Lbcn7wA7FOCUY5Pcvjts/
 P0R5I5nrkIyVrSSZue6hwGGdW37VxYJ+eatOlTD45qh+i8jBZqdnUr0UPUHnsdzc+CcW
 7GkAzKsZlxdPB9J9OY822r8Y7cNd/FSvH0bkknA/kFxwZfLWkBAcWZR6gDAg+b0KWGCH
 6zZ0Yo/6U3PgYV+dREqwmwyMR23QsPFbuNAnXc+PNGo32sF55S6V5Z8p/bquFo6DGUGI
 2LOg==
X-Gm-Message-State: AOAM532PuYuFIyjqkZ6+NbDOBnxG5scvJFgqpmDrQzXZ4PKTknFEJ63u
 pI7pI0i1kH/rfcYw04UNvbSh1w==
X-Google-Smtp-Source: ABdhPJyrzoWUEA+KXZpUqZH71mUrr99EM31raaHCxS7lwudrhrmjpVsiyNa3/YJt/D6XA+s1Tzfjbw==
X-Received: by 2002:a17:90b:4a07:: with SMTP id
 kk7mr2746801pjb.37.1633428476192; 
 Tue, 05 Oct 2021 03:07:56 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.152.16])
 by smtp.googlemail.com with ESMTPSA id p23sm1692187pju.1.2021.10.05.03.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 03:07:55 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 5 Oct 2021 15:37:48 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 11/11] tests/acpi: add expected blobs for VIOT test
 on q35 machine
In-Reply-To: <20211001173358.863017-12-jean-philippe@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2110051536540.820442@anisinha-lenovo>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-12-jean-philippe@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 1 Oct 2021, Jean-Philippe Brucker wrote:

> Add expected blobs of the VIOT and DSDT table for the VIOT test on the
> q35 machine.
>
> Since the test instantiates a virtio device and two PCIe expander
> bridges, DSDT.viot has more blocks than the base DSDT (long diff not
> shown here).

For documentation and bisection of issues in future, I think its better to
provide the DSDT table ASL diff here as well.

>The VIOT table generated for the q35 test is:
>
> [000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
> [004h 0004   4]                 Table Length : 00000070
> [008h 0008   1]                     Revision : 00
> [009h 0009   1]                     Checksum : 3D
> [00Ah 0010   6]                       Oem ID : "BOCHS "
> [010h 0016   8]                 Oem Table ID : "BXPC    "
> [018h 0024   4]                 Oem Revision : 00000001
> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> [020h 0032   4]        Asl Compiler Revision : 00000001
>
> [024h 0036   2]                   Node count : 0003
> [026h 0038   2]                  Node offset : 0030
> [028h 0040   8]                     Reserved : 0000000000000000
>
> [030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
> [031h 0049   1]                     Reserved : 00
> [032h 0050   2]                       Length : 0010
>
> [034h 0052   2]                  PCI Segment : 0000
> [036h 0054   2]               PCI BDF number : 0010
> [038h 0056   8]                     Reserved : 0000000000000000
>
> [040h 0064   1]                         Type : 01 [PCI Range]
> [041h 0065   1]                     Reserved : 00
> [042h 0066   2]                       Length : 0018
>
> [044h 0068   4]               Endpoint start : 00003000
> [048h 0072   2]            PCI Segment start : 0000
> [04Ah 0074   2]              PCI Segment end : 0000
> [04Ch 0076   2]                PCI BDF start : 3000
> [04Eh 0078   2]                  PCI BDF end : 30FF
> [050h 0080   2]                  Output node : 0030
> [052h 0082   6]                     Reserved : 000000000000
>
> [058h 0088   1]                         Type : 01 [PCI Range]
> [059h 0089   1]                     Reserved : 00
> [05Ah 0090   2]                       Length : 0018
>
> [05Ch 0092   4]               Endpoint start : 00001000
> [060h 0096   2]            PCI Segment start : 0000
> [062h 0098   2]              PCI Segment end : 0000
> [064h 0100   2]                PCI BDF start : 1000
> [066h 0102   2]                  PCI BDF end : 10FF
> [068h 0104   2]                  Output node : 0030
> [06Ah 0106   6]                     Reserved : 000000000000
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   2 --
>  tests/data/acpi/q35/DSDT.viot               | Bin 0 -> 9398 bytes
>  tests/data/acpi/q35/VIOT.viot               | Bin 0 -> 112 bytes
>  3 files changed, 2 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index fa213e4738..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,3 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/DSDT.viot",
> -"tests/data/acpi/q35/VIOT.viot",
> diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..b41270ff6d63493c2ae379ddd1d3e28f190a6c01 100644
> GIT binary patch
> literal 9398
> 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
> F{{VUX)Oi2^
>
> literal 0
> HcmV?d00001
>
> diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..9b179266ccbf84f1c250ee646812d17e27987764 100644
> GIT binary patch
> literal 112
> zcmWIZ^baXu00LVle`k+i1*eDrX9XZ&1PX!JAex!M0Hgv8m>C3sGzdcgBZCA3T-xBj
> Q0Zb)W9Hva*zW_`e0M!8s0RR91
>
> literal 0
> HcmV?d00001
>
> --
> 2.33.0
>
>

