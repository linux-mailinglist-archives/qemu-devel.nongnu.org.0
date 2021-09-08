Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F8B403530
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 09:22:52 +0200 (CEST)
Received: from localhost ([::1]:44626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrv1-0002x7-VA
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 03:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNrtW-0001PD-3I
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:21:18 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNrtQ-00011R-KN
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:21:17 -0400
Received: by mail-pf1-x430.google.com with SMTP id f65so1259724pfb.10
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 00:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=jMK3FrhrIQFGPSxoEod34OTcujV21tgiBjQDGVhfqqo=;
 b=EBZwSVnwrlLFHA+SdpjEBCzXswoZCc5xBVYlkjX6PkL4pAB7lQwK7HDqOrqJIJokrB
 duRfhFfeUJxXQwQkh2lcRARiZQumT7faQWVqKBKs5/uFcKB5DUrA+2FH8tL4XRHZVglM
 /akUZzhX+1j3viljCnXMysgRtCD43z9nLJxM98PGbfCy9qiQt68GS8mwwo115DRFfskv
 Ijsj3YN4XXLsiKb3tzWUpCnjFiYItXeB1IVt2WHUzoEs7kTjrMT3/cHBb0w2HwiNnztj
 RSWgPKFPKZUBCRSnXtKqawJKaoM03jaZN5MQjHknHrzoLCv3GqRfIhYdxxl4+8jpqgRr
 os3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=jMK3FrhrIQFGPSxoEod34OTcujV21tgiBjQDGVhfqqo=;
 b=baVaeHWgQvYdX5ITJTtt2/THOiE9AW1B5l69lxff41ukhjsKAgl3yqw9G5DqG04y1b
 5XgTi9Za9HYZS7VA/UxMB6kcsFBIy2rCxVRrobrugf0EecrL66DSIFFqbKNX3+eUOLXb
 S3oWZ1sxQ5vymCU9q5yJ9uaY5GZIcRSSDUVCAt9S6vweaSGbwlz0O6LWzd/GfkLHBKz4
 LSuo0946T55i4wrGazYvNr1Vs+wSaJUzjQIUsF52d4WmU8glCI7+kkqjWdFQbyKeWpET
 j4hFzNFhYv23E9iM8v4/HhNVrPofyI68zBIdI6bnjF04K6s47ZymVL4JzRLn5cZMfiJ/
 A8vw==
X-Gm-Message-State: AOAM530mpkivCT/kofe6Nk75kb8rN7rgZfTVLp6zCq8d0/FSIWTYkePi
 Z90C3YVfnG22r3cbalo3sb3diA==
X-Google-Smtp-Source: ABdhPJyOuaeZXgtGDWG4QCvpN7hXjmrkStBrSamMzQahMvJSx4QVGS1Ym6ewEiDCdDuy9Z93o8AKyg==
X-Received: by 2002:a63:9d0d:: with SMTP id i13mr2354226pgd.117.1631085670241; 
 Wed, 08 Sep 2021 00:21:10 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.242.70])
 by smtp.googlemail.com with ESMTPSA id q20sm1712657pgu.31.2021.09.08.00.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 00:21:09 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 8 Sep 2021 12:51:04 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
In-Reply-To: <20210908084256.6077f7a3@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
References: <20210908041139.2219253-1-ani@anisinha.ca>
 <20210908084256.6077f7a3@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x430.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 8 Sep 2021, Igor Mammedov wrote:

> On Wed,  8 Sep 2021 09:41:39 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> > starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
> > range was free and available. However, upon more testing, it seems this address
> > range to be not available for some latest versions of windows.
>
> The range is something assigned by QEMU, and guest has no say where it should be.
> but perhaps we failed to describe it properly or something similar, so one gets
> 'no resource' error.

OK dug deeper. The existing range of IO address conflicts with the CPU
hotplug range.

CPU hotplug range (ICH9_CPU_HOTPLUG_IO_BASE) is 0x0cd8 to 0x0ce3

This intersects with range 0x0cc4 to 0x0cdb for ACPI_PCIHP_ADDR_ICH9 .

We need to change one or the other.

From the windows device manager, I see that the other IO address range is
0x0620 to 0x062F which is reserved for GPE0.

.
> We need a find out a reason why Windows doesn't like it. You might get more
> detailed error running Windows debug build with ACPI debugger attached.

bummer. This is beyond my expertize and I do not have a windows debug
build.

>
> > Hence, this
> > change modifies the IO address range so that windows can allocate the address
> > range without any conflict. The new address range would start at 0x0dd4 and end
> > at address 0x0deb.
> >
> > This change has been tested using a Windows Server 2019 guest VM.
> >
> > Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  include/hw/acpi/ich9.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> > index a329ce43ab..b68c5a2174 100644
> > --- a/include/hw/acpi/ich9.h
> > +++ b/include/hw/acpi/ich9.h
> > @@ -29,7 +29,7 @@
> >  #include "hw/acpi/acpi_dev_interface.h"
> >  #include "hw/acpi/tco.h"
> >
> > -#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
> > +#define ACPI_PCIHP_ADDR_ICH9 0x0dd4
>
> that's ABI change, it must be versioned
>
> >
> >  typedef struct ICH9LPCPMRegs {
> >      /*
>
>

