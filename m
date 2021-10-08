Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EB7426D8C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:35:42 +0200 (CEST)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYruP-0007vE-9w
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrsu-0006zY-Va
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:34:08 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrsr-0004eR-P4
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:34:08 -0400
Received: by mail-wr1-x436.google.com with SMTP id m22so31133795wrb.0
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TgxX5dR3hV1a5Hu1oGqFbjg6jROCYDGxMzPV+J2OHcw=;
 b=om+jGEqlYMK88Lwz2SkzhdbH3M6uHQ0aEvxgshdpenUcGibXFCcEwp+s3C0NABqg/B
 iAHe0ylLNZ18tED53HsXo8vTccDgCvsvG/eFqfv7dZo+iOsPZMknNpAm2TdxfO1ocpBU
 5ZhBo4zbHhYQ03Q1PQfQ7eT944DLYxOnCd3neMZzwCpOToZ5smf+UlTlU5VElAjhZ6V8
 jYncmaJMBQ/rkiTeqbFxm0CpLisfe5Y2qyXYB9fQd2FheoPzoJn/WWmW8mSV5liypkyE
 hEnuZoGsH4lbnnFeGRbohyNAjN7iSE/Hzd7Z7rCsOtbVCdnfQOGBrYm/FLJoEYCLbKyw
 aC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TgxX5dR3hV1a5Hu1oGqFbjg6jROCYDGxMzPV+J2OHcw=;
 b=OuNvr04Q9BIx3jjBIb706k22c5EGzhRKPdTY88fN3BrE82UWf6XhuX13LuQdYCEuVM
 6TNvWEA6f3yBI7Aq/WSdDWUCMG2+nQ+1n4ow5GuWpZWnoSwes180k1TAH3q4QuRIyDk+
 PjR5+IdYgJGYrpIHLveozvtbRiUu14u1Q2dyUtnrj6OW00uqy1au0Run4vEgmfVzEakG
 C/c/WV53jf/EezGZdhMYYluy0aFkw+NhZXMXmh71ILAf8GE+ni1uzqDZU9lbpG1yUFt6
 VhRH7Bgq9d9+9An6dUQOBtTJS0bBo/wvgfvQ326PxX3V8m7e2nYnfAIHZE9SrzsxigKR
 km3w==
X-Gm-Message-State: AOAM530+wHZ6m/noSTZwG4+TvyJ7+cqfqi/rWzznJVTbM03L6Ch/FQl5
 eT2AF2zDQ1K/q8FdM4CRtyaALA==
X-Google-Smtp-Source: ABdhPJzshQV/6NgCpEbmIw3oc1pvGUjA+0Kmijh7p8vz5r0juka5DzehCLD7cq3kUzr+ML1ZQP9kIA==
X-Received: by 2002:a7b:c386:: with SMTP id s6mr4228801wmj.183.1633707242346; 
 Fri, 08 Oct 2021 08:34:02 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id o19sm2849275wrg.60.2021.10.08.08.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:34:01 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:33:39 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v4 10/11] tests/acpi: add expected blob for VIOT test on
 virt machine
Message-ID: <YWBk0887TuK1fIR2@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-11-jean-philippe@linaro.org>
 <alpine.DEB.2.22.394.2110051532450.820442@anisinha-lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2110051532450.820442@anisinha-lenovo>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 03:34:57PM +0530, Ani Sinha wrote:
> 
> 
> On Fri, 1 Oct 2021, Jean-Philippe Brucker wrote:
> 
> > The VIOT blob contains the following:
> >
> > [000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
> > [004h 0004   4]                 Table Length : 00000058
> > [008h 0008   1]                     Revision : 00
> > [009h 0009   1]                     Checksum : 66
> > [00Ah 0010   6]                       Oem ID : "BOCHS "
> > [010h 0016   8]                 Oem Table ID : "BXPC    "
> > [018h 0024   4]                 Oem Revision : 00000001
> > [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> > [020h 0032   4]        Asl Compiler Revision : 00000001
> >
> > [024h 0036   2]                   Node count : 0002
> > [026h 0038   2]                  Node offset : 0030
> > [028h 0040   8]                     Reserved : 0000000000000000
> >
> > [030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
> > [031h 0049   1]                     Reserved : 00
> > [032h 0050   2]                       Length : 0010
> >
> > [034h 0052   2]                  PCI Segment : 0000
> > [036h 0054   2]               PCI BDF number : 0008
> > [038h 0056   8]                     Reserved : 0000000000000000
> >
> > [040h 0064   1]                         Type : 01 [PCI Range]
> > [041h 0065   1]                     Reserved : 00
> > [042h 0066   2]                       Length : 0018
> >
> > [044h 0068   4]               Endpoint start : 00000000
> > [048h 0072   2]            PCI Segment start : 0000
> > [04Ah 0074   2]              PCI Segment end : 0000
> > [04Ch 0076   2]                PCI BDF start : 0000
> > [04Eh 0078   2]                  PCI BDF end : 00FF
> > [050h 0080   2]                  Output node : 0030
> > [052h 0082   6]                     Reserved : 000000000000
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Acked-by: Ani Sinha <ani@anisinha.ca>
> 
> Without looking at the other patches, the disassembly looks good (with
> latest iasl from upstream git).
> One suggestion : maybe also add the raw table data as well of length 88.

Hmm, the raw VIOT table is included at the end of the patch (encoded by
git in base85). Or did you mean any other data?

Thanks,
Jean

> 
> 
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
> >  tests/data/acpi/virt/VIOT                   | Bin 0 -> 88 bytes
> >  2 files changed, 1 deletion(-)
> >
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index 29b5b1eabc..fa213e4738 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1,4 +1,3 @@
> >  /* List of comma-separated changed AML files to ignore */
> > -"tests/data/acpi/virt/VIOT",
> >  "tests/data/acpi/q35/DSDT.viot",
> >  "tests/data/acpi/q35/VIOT.viot",
> > diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
> > index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..921f40d88c28ba2171a4d664e119914335309e7d 100644
> > GIT binary patch
> > literal 88
> > zcmWIZ^bd((0D?3pe`k+i1*eDrX9XZ&1PX!JAexE60Hgv8m>C3sGzXN&z`)2L0cSHX
> > I{D-Rq0Q5fy0RR91
> >
> > literal 0
> > HcmV?d00001
> >
> > --
> > 2.33.0
> >
> >

