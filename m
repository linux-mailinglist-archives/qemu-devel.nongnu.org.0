Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54D422315
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 12:07:29 +0200 (CEST)
Received: from localhost ([::1]:48474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXhM7-00061W-I0
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 06:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXhJu-0004FR-Mk
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:05:10 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXhJr-0002pq-FE
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:05:10 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso1109956pjb.4
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=a1vHYLY5twFAmZBKNedaciRmK7RKmJ5u6FUYDR8ubDA=;
 b=N9nYM9THzKb/cCqV/r4aQrhdZj8r4uiz29A1z4nrMN6Klo+tN/6MO02l+F20+38Qlx
 4OdBOwGMOjUQ5uW7BMJY2pAWzaBlevcE3VKt3Y8a+ckS9TNx7wHrP2Dh9YRQfZjfXzfD
 GJtoLAolN7ppvZ2L2QkHBPgx9SfQ7xSFWa/7ut/ruvHyoVo/bMycbejeQGpZqUmAFBUm
 FHjQ7zbI1XDW5mLTtlG2OhCT9BSjf3d5VL8/Oz4lW8pxjmeAMmHgZzIjWXq6PgnHq2j6
 dDJ0XLJolDOnjjmOwXS7XaXSsF55X5pGi4q6APDNRk/W6lTep8FwpZfMcoiWcgfJwDSN
 ij9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=a1vHYLY5twFAmZBKNedaciRmK7RKmJ5u6FUYDR8ubDA=;
 b=1ow/7IY22qeFrJoKkOaGoppb2lxUY/+4Rw5A4AgVDQOK4gvBRurk9DEe43HtPK6Ks4
 TwtLlCEgyITMbLOEtDhgp4mH0/asUlmRko/UHOuYt5sFPA8PXjnlXTzfDetAbouWMOOo
 w61PySsC3QLDdi5XzVsrs+Ho9RgT04y/+ayPBLsEuJRgcGZybvRmkEDmZfjjLC1OREb/
 OU7s17rEoNhfWBqUNqYL5nFVYUQiaxm0BB4Fp9i8yhrxZDB6V0QQNehk4b+cENVOB/IC
 6e1uHzIMW9KXbZ2pPi3NMYSoX62bij5tKGAxiIQu8LMUZjfvUWmY7WHzNlFz9kjHj1Fq
 FupQ==
X-Gm-Message-State: AOAM531jchryTQlesIHfKCaDT4xYyXhQwA7Z53PEqE1qITJTQGKIbq36
 0iLpufXVWVww7lu+0sw2AQhzlQ==
X-Google-Smtp-Source: ABdhPJyZB/towdFNidYBPnP3zT4WgeUawYtzG2379mEHnKS124tdYQhDdu+Mt1nvRy9chI/m5+DFUg==
X-Received: by 2002:a17:90b:4a82:: with SMTP id
 lp2mr2736515pjb.57.1633428305674; 
 Tue, 05 Oct 2021 03:05:05 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.152.16])
 by smtp.googlemail.com with ESMTPSA id 21sm1530083pjg.57.2021.10.05.03.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 03:05:04 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 5 Oct 2021 15:34:57 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 10/11] tests/acpi: add expected blob for VIOT test on
 virt machine
In-Reply-To: <20211001173358.863017-11-jean-philippe@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2110051532450.820442@anisinha-lenovo>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-11-jean-philippe@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102d.google.com
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

> The VIOT blob contains the following:
>
> [000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
> [004h 0004   4]                 Table Length : 00000058
> [008h 0008   1]                     Revision : 00
> [009h 0009   1]                     Checksum : 66
> [00Ah 0010   6]                       Oem ID : "BOCHS "
> [010h 0016   8]                 Oem Table ID : "BXPC    "
> [018h 0024   4]                 Oem Revision : 00000001
> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> [020h 0032   4]        Asl Compiler Revision : 00000001
>
> [024h 0036   2]                   Node count : 0002
> [026h 0038   2]                  Node offset : 0030
> [028h 0040   8]                     Reserved : 0000000000000000
>
> [030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
> [031h 0049   1]                     Reserved : 00
> [032h 0050   2]                       Length : 0010
>
> [034h 0052   2]                  PCI Segment : 0000
> [036h 0054   2]               PCI BDF number : 0008
> [038h 0056   8]                     Reserved : 0000000000000000
>
> [040h 0064   1]                         Type : 01 [PCI Range]
> [041h 0065   1]                     Reserved : 00
> [042h 0066   2]                       Length : 0018
>
> [044h 0068   4]               Endpoint start : 00000000
> [048h 0072   2]            PCI Segment start : 0000
> [04Ah 0074   2]              PCI Segment end : 0000
> [04Ch 0076   2]                PCI BDF start : 0000
> [04Eh 0078   2]                  PCI BDF end : 00FF
> [050h 0080   2]                  Output node : 0030
> [052h 0082   6]                     Reserved : 000000000000
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Acked-by: Ani Sinha <ani@anisinha.ca>

Without looking at the other patches, the disassembly looks good (with
latest iasl from upstream git).
One suggestion : maybe also add the raw table data as well of length 88.


> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  tests/data/acpi/virt/VIOT                   | Bin 0 -> 88 bytes
>  2 files changed, 1 deletion(-)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 29b5b1eabc..fa213e4738 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,4 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/VIOT",
>  "tests/data/acpi/q35/DSDT.viot",
>  "tests/data/acpi/q35/VIOT.viot",
> diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..921f40d88c28ba2171a4d664e119914335309e7d 100644
> GIT binary patch
> literal 88
> zcmWIZ^bd((0D?3pe`k+i1*eDrX9XZ&1PX!JAexE60Hgv8m>C3sGzXN&z`)2L0cSHX
> I{D-Rq0Q5fy0RR91
>
> literal 0
> HcmV?d00001
>
> --
> 2.33.0
>
>

