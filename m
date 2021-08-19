Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C193F19FC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:07:26 +0200 (CEST)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhlV-0007lJ-QB
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhkl-00076S-5a
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:06:39 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhkj-0004Fy-0e
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:06:38 -0400
Received: by mail-ed1-x52b.google.com with SMTP id i22so8728581edq.11
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uBnGDBh4azrac8CAYImJW72cMASuziAYlzdQdF1PwiU=;
 b=gdWrfdAtF3D0lrem2jpVrV+SpqhiH2zgK3glKQsaznvxPzO9VR8MmFvAu3vDDgJHw6
 mIvVkIm1WPlyeSucEUhANz/SNjE2aPBwlzriOBHsSC8EQaSu/c2wFt7Y2eK8TlaaXYcN
 VBmEQT4XXXSl2snWEyse1RmuTtX6cccu9lQSrC2pPrQabWmbWfJ5yZd1pMxRlQpZ7U2+
 UDMWkffWOSB+UMahL8L0kmCCxj9Te+7eD7UlyG9ePp+7HdSDoj++8edDQFb55J9mey8y
 I3tnvxAZ34zCHcGgluH4+qRso45N73rAr6qJdUgm/GzpGyeNj1TLot0Z6BSs5FN/dU7S
 Z2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uBnGDBh4azrac8CAYImJW72cMASuziAYlzdQdF1PwiU=;
 b=B2Rme0cQMtA2x9/f+XCFrXY5mRSSh8eFpl4CUKH6ql3njj0v2NGkMb6CP4zYKuMypU
 7PXRWZB75xlFmZwP2wsf92bFnP6pxTHn8wfrP6wXAMiYxJVw8ay1Zdei7AFKcCQFRfy5
 2qiz8wGW7DBEgD7mP2n73yzJhVsAAIZ7lnavd0M6XESH69IIsGnLyrpfUcMX3i1qN5a+
 t3/s1rgbHW1xfnAh/ZrH+UJZm5Jw7gy8ye/G0lJ2NYMNkraJeZxXEIA2CTsHv091fkPy
 wAQvWo+pv/xGw/TJLgXG8LStW8q+vPmdvpR/gd2hIKp6QXRO4JqOMxUT+f/ElEdpp/FZ
 iQxA==
X-Gm-Message-State: AOAM532DoVpHh1gwH/WvyAcDs4CGr0biAewGFEGRvRBcowQYeLv+ZrN/
 e3I/zpQCSnxL89gA5V3ndhbWlvu0YanqhCJFJ5UVNA==
X-Google-Smtp-Source: ABdhPJxmpPeadDnN0oaY0DZb2/vArV67Leadf5F/5+Rnyn7RsezPkXmTBP0dHNet9dIalX2tHsTcAGcJmc4T2b2tjhM=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr12938264edw.44.1629378395596; 
 Thu, 19 Aug 2021 06:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210812033405.362985-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:05:49 +0100
Message-ID: <CAFEAcA8Fu+mkzFi9JdTtbqMcnnV74Swk04xx2a1G4L_oATY2eQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
To: Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 05:45, Ani Sinha <ani@anisinha.ca> wrote:
>
> ping ...

You didn't cc any of the ACPI maintainers; I have done so.

Is it intended that ACPI_HW_REDUCED must always imply
ACPI_MEMORY_HOTPLUG, or is it just a coincidence that the
virt board happens to want both, and so we select both ?

> On Thu, 12 Aug 2021, Ani Sinha wrote:
>
> > ACPI_MEMORY_HOTPLUG is implicitly turned on when ACPI_HW_REDUCED is selected.
> > ACPI_HW_REDUCED is already enabled. No need to turn on ACPI_MEMORY_HOTPLUG
> > explicitly. This is a minor cleanup.
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  hw/arm/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 4ba0aca067..38cf9f44e2 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -25,7 +25,6 @@ config ARM_VIRT
> >      select ACPI_PCI
> >      select MEM_DEVICE
> >      select DIMM
> > -    select ACPI_MEMORY_HOTPLUG
> >      select ACPI_HW_REDUCED
> >      select ACPI_NVDIMM
> >      select ACPI_APEI
> > --
> > 2.25.1
> >
> >


-- PMM

