Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E895D426D89
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:32:27 +0200 (CEST)
Received: from localhost ([::1]:41542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYrrH-00061c-0E
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrpN-0004bk-PZ
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:30:29 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrpL-0001Md-5d
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:30:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id u18so31044458wrg.5
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bwwiKFsHy4N2r8I++KMRDAwlT3fDo4NGnqHTIh6JNsM=;
 b=bW6B4WGPKOKstqk2PpsP5lY+4oKzx4EoPyF5UuRIFhsjibgZaFv/P6lTQT1W6kbdyR
 +d0Ll4fI7iJOKQGbhRKlX0x0ZndvAMNZ5MG3SmuiqrwmM/ysJZjMIdVEqF3lCthoHNtS
 DvqxcJhoaRCvGJos3A1O+yGfPTndpmcJATEzQEdjOUoN5thzeJhOk2/uat5c1Te/UP2q
 mPGPbnaIZrRCFqwb3BR4QWginIdaP//sljwKI3fJTXejKlLv3t257ZdexO8+cLkZ7bTB
 l7lNvATo8u6gh8dMTOc2QZVBlquaIgBu7jeqp5iRXsVmvCLdRX55VPTCfZUY3fsfwL8G
 TAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bwwiKFsHy4N2r8I++KMRDAwlT3fDo4NGnqHTIh6JNsM=;
 b=ZcKvELhj3aq4Mo3nA0OL2klJf7i25uWYXtbiwa1N2FqDi+d9zLIQMLqpo3f6oJZwYZ
 eX4xxjY+XhwjeT6b2GJhpM4dRA7tfzqFW17OlHrG2Fb1owXWYvpkGh2o5WJmCsD/WpI7
 CIH8Fkr4g447d49Km3wFIbGWVLlBVXT034muVcz3+fw5hkHF0E6bZboV0Amwo2GjorlX
 JsLnxHbE4KiLag4tbBemj4R4ouZKGwjiAbM367v2LsVClr5+4/6gqOvYKR5LRQZFeXx8
 OrBBolinQeR1ZODN3Q819UZE9N/sVTLPi8YlR5JmXVbsHKjzmsDiMcrCnBZ0w+4az8yA
 9Crg==
X-Gm-Message-State: AOAM530Ebj9pRMbKiFh7zrAeXZi87cCIEvurWDc+LPPOzpX6+AnwHQOK
 2LYsEG6Oik9hiHL4fLnHaMI7ow==
X-Google-Smtp-Source: ABdhPJzQp783k1W9h6ZVEc5l7kUHuCfBbyqvfbyCl3T7yfnbdkRTEkrO5nHaRzhjJDklar0sxE3PDA==
X-Received: by 2002:a05:6000:154f:: with SMTP id
 15mr5022339wry.254.1633707025430; 
 Fri, 08 Oct 2021 08:30:25 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id c17sm2697324wrq.4.2021.10.08.08.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:30:24 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:30:02 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 10/11] tests/acpi: add expected blob for VIOT test on
 virt machine
Message-ID: <YWBj+ngyUL3QSCwn@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-11-jean-philippe@linaro.org>
 <f5293d9e-10b1-6a85-a35f-66b12680cdd2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5293d9e-10b1-6a85-a35f-66b12680cdd2@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 09:38:13PM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
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
> I noticed the spec does not clearly say the virtio-iommu-pci BDF does
> not need to be excluded from the PCI range.
> Shouldn't it be clarified?

Possibly, but I didn't want to complicate things. As the spec doesn't
specify any exception the driver should handle it

> 
> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!
Jean

