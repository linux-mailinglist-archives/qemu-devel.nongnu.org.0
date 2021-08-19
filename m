Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465603F1A90
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:38:27 +0200 (CEST)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiFV-0001TQ-VU
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGiED-0000RC-Au
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:37:05 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGiEB-0001bc-6a
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:37:04 -0400
Received: by mail-pl1-x629.google.com with SMTP id u1so3957184plr.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zFkPTLhOTVMiBxExd2gI4Tu83dQ81rLzOJz37KGA9Jc=;
 b=dLcM/Ij4GtAlphtiZ4MjdkXcAj/FYvfqbNM9hghLFD/7g7OT3lMXwIqKz0Jeg7IvtQ
 QhcSxcd24S7vMZSbwnbC9+1hCuKmRu1fVjj3idCeg+ZRo12f0A6ugfDpe87xS+3yE5i0
 tSKfyD3CGI9RtuQQtTLZYYAg7uzCIIaYxxDNj3p8pzEDjNzyCnlIwkKzJnZNOoLu9sfB
 o7Kvv+nMFWHu7sUWbM1Y7Y0+wGDWUV3WSpct/TegPq/J2r9a3q5ouCxMTL4iYRpoiv1B
 3rpCe8PaQGRRc+KSGSnThCGHcLNzl2jz8DlZtEZqnG80qFGlWp/onjH7sXdBQnO2O95X
 BR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zFkPTLhOTVMiBxExd2gI4Tu83dQ81rLzOJz37KGA9Jc=;
 b=hgWMKkbg0XA3SLc6i25UfXlpozdSLnxNiBEl0T02mDtQCWj3QpRYtSvZ2DWMKJzm8O
 1S6oRfTl28HByIHHtvFSLu3HM7x90hSSQzHRo6dmH+3ajwINQY5YTG9aWZTfnIGlOeiC
 zmj8zUSVgwJEFf1kFRypWfhOhy/Mw3XXFO1Y1TAn/aE/ZfJeBfbEX5I9UXR/a0wEbLSM
 rIxAb7bmdfkjj0fQDvI85L/1rBvxQYbXHt2zeEOumzHeevaRWAdxKz6DMhbEmPqAtxft
 xqWuWYgPl/LI3aWugtIlfHdeAJz3hDgGouapTHi4tXqAgPAyYK9aQ0hkPzJ3qRNPtArl
 HKUQ==
X-Gm-Message-State: AOAM5312xVVRDjvWHlRbqz/nn1q4I9b+DssC1uumgicCEnu0lXdgcdSg
 wpI7a4skTapo/cqZxi8UurgHHA==
X-Google-Smtp-Source: ABdhPJw/ZvsMi6cgi7ChcWsdDfEgh82HD8lWxWFLTb8Rx1Itl1xJh1C2KKF8ZTgolsBXSeAHw19goQ==
X-Received: by 2002:a17:902:e804:b0:12d:b49f:bf1e with SMTP id
 u4-20020a170902e80400b0012db49fbf1emr11977601plg.75.1629380221272; 
 Thu, 19 Aug 2021 06:37:01 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.234.32])
 by smtp.googlemail.com with ESMTPSA id l185sm3530550pfd.62.2021.08.19.06.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 06:37:00 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 19 Aug 2021 19:06:44 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
In-Reply-To: <alpine.DEB.2.22.394.2108191849260.417749@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2108191905100.418214@anisinha-lenovo>
References: <20210812033405.362985-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
 <CAFEAcA8Fu+mkzFi9JdTtbqMcnnV74Swk04xx2a1G4L_oATY2eQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2108191849260.417749@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x629.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 19 Aug 2021, Ani Sinha wrote:

>
>
> On Thu, 19 Aug 2021, Peter Maydell wrote:
>
> > On Tue, 17 Aug 2021 at 05:45, Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > ping ...
> >
> > You didn't cc any of the ACPI maintainers; I have done so.
> >
>
> oops! my bad. I used checkpatch and did not verify if Igor/Michael was
> cc'd.
>
> > Is it intended that ACPI_HW_REDUCED must always imply
> > ACPI_MEMORY_HOTPLUG, or is it just a coincidence that the
> > virt board happens to want both, and so we select both ?
> >
>
> From a purely code inspection point of view, I noticed that
> generic_event_device.c depends on CONFIG_ACPI_HW_REDUCED. The GED does use
> memory hotplug apis - for example acpi_ged_device_plug_cb() uses
> acpi_memory_plug_cb() etc.
>
> Hence, as it stands today, CONFIG_ACPI_HW_REDUCED will need to select ACPI
> memory hotplug. Unless we remove the GED device's dependence on
> ACPI_HW_REDUCED that is. I cannot comment whether that would be wise or if
> we should reorg the code in some other way.

The other question we should ask is whether arm platform requires
ACPI_MEMORY_HOTPLUG independent of ACPI_HW_REDUCED/GED device? If that is
the case, then maybe we should keep that config option as is.
Maybe @qemu-arm can answer that?

>
> > > On Thu, 12 Aug 2021, Ani Sinha wrote:
> > >
> > > > ACPI_MEMORY_HOTPLUG is implicitly turned on when ACPI_HW_REDUCED is selected.
> > > > ACPI_HW_REDUCED is already enabled. No need to turn on ACPI_MEMORY_HOTPLUG
> > > > explicitly. This is a minor cleanup.
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > ---
> > > >  hw/arm/Kconfig | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > > index 4ba0aca067..38cf9f44e2 100644
> > > > --- a/hw/arm/Kconfig
> > > > +++ b/hw/arm/Kconfig
> > > > @@ -25,7 +25,6 @@ config ARM_VIRT
> > > >      select ACPI_PCI
> > > >      select MEM_DEVICE
> > > >      select DIMM
> > > > -    select ACPI_MEMORY_HOTPLUG
> > > >      select ACPI_HW_REDUCED
> > > >      select ACPI_NVDIMM
> > > >      select ACPI_APEI
> > > > --
> > > > 2.25.1
> > > >
> > > >
> >
> >
> > -- PMM
> >
>

