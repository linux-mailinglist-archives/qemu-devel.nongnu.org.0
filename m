Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7FE3F1A5D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:28:15 +0200 (CEST)
Received: from localhost ([::1]:35812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGi5f-0002yF-1W
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGi3M-00012t-F1
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:25:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGi3K-0000Is-Oz
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:25:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so4743216pjl.4
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ZCeCNT6c52N3U/15IMWRqEXyIbZHw6KHnbku1vyRCZI=;
 b=lXg3yqJrnGPYGw0nbQwvQVXE6gnKry7VZU8QVwgLNfvWPS4A56AMHMAR8jiVH9HDxA
 Y46dOlSTIh249fOmL6k93k4V9Ysnfuf2qC+T7Nf+rrg+Q1q7RNHQK6mWzMr3C6Squ4oq
 h5b+weX7dBATI4maNG70qUyiLpidTpoi4r1TyWDPT3AbK6XUSMv5CidFnn5tqhax5zGy
 Kb4QPYMOl6J5rWefibPlxQpo4n9LKn7d+lIYDM25aiIwk7zq5KW9UR3ZwYMPS9pqjsfc
 jpbtXR6PwQYX0T+JjZ5U64W84cd/TLc/PSxW88FuV89l0RLhi+89XXZcoUQLNrUyDM1t
 SGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ZCeCNT6c52N3U/15IMWRqEXyIbZHw6KHnbku1vyRCZI=;
 b=RZoj+OvTrJMUz78pilP50NI/QuHTt17lVMExXHvApsxFsQn1fXYyq4Mb6f/QkHXKZM
 O3g3XfIbt6/fCVxe4hxi9ov6rD8cYFVWiPavt5zQ9n/VWefOC3w3OzX7U2o0mKI3+jhb
 jJZN/Pk2tHM/QVih97Ps6dpCI1O7ShLhcJp4QrbR81yIip4Vj8p9DSRNvVD6l1EVT5Ds
 GSCeHSVeC+9zzyNsk4GAxAaAoEew0i2GTXAdypoN676r/x0gSme17i5GxEFCMi5hvhDk
 WEZ0Fvxa/gUddryE6viSdI4tm0rWlIG1mdE/5fFgjZOEwOOi6tyTyBwf3YqUYpWAgSGp
 h4Cg==
X-Gm-Message-State: AOAM531z/L0RYGiMtx4SEw9fDzHfmpbFCW7xjmSX/VwCb/M0cGA8KJ4M
 4G7xI/haVf6bBzZkW4ezBsaXvw==
X-Google-Smtp-Source: ABdhPJyRecot/xx6aXw3KIW31u+xAeXg1qVzlJ86t+WTGrGn6J2IbiqE1EWGZzNdya4d+y6pv1p82Q==
X-Received: by 2002:a17:90a:b702:: with SMTP id
 l2mr6705019pjr.71.1629379549103; 
 Thu, 19 Aug 2021 06:25:49 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.234.32])
 by smtp.googlemail.com with ESMTPSA id v20sm4327632pgi.39.2021.08.19.06.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 06:25:48 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 19 Aug 2021 18:55:32 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
In-Reply-To: <CAFEAcA8Fu+mkzFi9JdTtbqMcnnV74Swk04xx2a1G4L_oATY2eQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2108191849260.417749@anisinha-lenovo>
References: <20210812033405.362985-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
 <CAFEAcA8Fu+mkzFi9JdTtbqMcnnV74Swk04xx2a1G4L_oATY2eQ@mail.gmail.com>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 19 Aug 2021, Peter Maydell wrote:

> On Tue, 17 Aug 2021 at 05:45, Ani Sinha <ani@anisinha.ca> wrote:
> >
> > ping ...
>
> You didn't cc any of the ACPI maintainers; I have done so.
>

oops! my bad. I used checkpatch and did not verify if Igor/Michael was
cc'd.

> Is it intended that ACPI_HW_REDUCED must always imply
> ACPI_MEMORY_HOTPLUG, or is it just a coincidence that the
> virt board happens to want both, and so we select both ?
>

From a purely code inspection point of view, I noticed that
generic_event_device.c depends on CONFIG_ACPI_HW_REDUCED. The GED does use
memory hotplug apis - for example acpi_ged_device_plug_cb() uses
acpi_memory_plug_cb() etc.

Hence, as it stands today, CONFIG_ACPI_HW_REDUCED will need to select ACPI
memory hotplug. Unless we remove the GED device's dependence on
ACPI_HW_REDUCED that is. I cannot comment whether that would be wise or if
we should reorg the code in some other way.


> > On Thu, 12 Aug 2021, Ani Sinha wrote:
> >
> > > ACPI_MEMORY_HOTPLUG is implicitly turned on when ACPI_HW_REDUCED is selected.
> > > ACPI_HW_REDUCED is already enabled. No need to turn on ACPI_MEMORY_HOTPLUG
> > > explicitly. This is a minor cleanup.
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  hw/arm/Kconfig | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > index 4ba0aca067..38cf9f44e2 100644
> > > --- a/hw/arm/Kconfig
> > > +++ b/hw/arm/Kconfig
> > > @@ -25,7 +25,6 @@ config ARM_VIRT
> > >      select ACPI_PCI
> > >      select MEM_DEVICE
> > >      select DIMM
> > > -    select ACPI_MEMORY_HOTPLUG
> > >      select ACPI_HW_REDUCED
> > >      select ACPI_NVDIMM
> > >      select ACPI_APEI
> > > --
> > > 2.25.1
> > >
> > >
>
>
> -- PMM
>

