Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3354A4C4A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:38:36 +0100 (CET)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZhL-0001EJ-VJ
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:38:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEZO2-0003At-I0
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:18:38 -0500
Received: from [2a00:1450:4864:20::32a] (port=36752
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEZO0-0007gj-NP
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:18:38 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso14035762wma.1
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 08:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dw54WNcRmpsJkaETPuJi8xKiteM+n7oxdS4peL/4oE4=;
 b=g5fpEw+4961t6KDFGAh7rHlZx3z0Ia1JsRCHAUScLw+6YK4nGDgUfbqX/YUTqkk7DC
 gP+UHkmDgdeKWO9J4shkosRzOL9qDrWEy/EEsgxe8snMUXyUzjnre1RDTrE84nLvb2VJ
 9k0FCUZmfrhZQzcHZUY4Lr+s8FAVsfravWvC2gIrVT5QE53aCzIuYfSaA/iDo+F9gqpe
 w2t+StLGnY+WFpdMU+njgQ6CmjcxkrPhfVxmdYJpUX4I9o/CBYK26B4azwG0C6gWi1P9
 YSyU6QkuXxH/r7khEDPQ+8dX3xAgeo2fq92ICnbdvsqQKiB1EiPbmlnHAbpV/mgJEpSL
 z58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dw54WNcRmpsJkaETPuJi8xKiteM+n7oxdS4peL/4oE4=;
 b=ivqjBhAO6ix+bEbvb1/kGZzf/DLJqIVQw9pS9G1iRea+hiHC7DHvQzR0CKv6Q2qthG
 VURguqkL8uobku+gBbsi1UBLnbBuLzuFg4h0ukqbZCpcWRWLo5Hpkd2niHIEeGG/uGla
 WvBhkLn0MUe2XScsv6hu49UdSUvLXZjKBSy+HrDSwo462jqlARByI3tl1IxKwPZRr3WE
 2IxPCU8rCSn5voi5+GuOi3iQ322fu5X9oZ8m39oYyIvNl4aoQIYXZ6xanzAlASjf/GBR
 QZL866FvJeeWGtHtKVejarnVr2IC/j/LCJuXkcv4seryWcm4+H6CItxtsIHFF5Lmfo5o
 J15A==
X-Gm-Message-State: AOAM5335BTVFtT/efCrUlHtjMUPRPJNYIzMhJ9Jmp8Zq9vIpcCEQIlyI
 sJSberktjDXy1uCtXo/gKlBNtZcu7M+WoODeHPqX1w==
X-Google-Smtp-Source: ABdhPJwmneHhuu0n7Hzsg3/SozwGx4NAJJObhFxYImqmfFachY6Zii8b0zNpAa5Kcrkm3/WEitpL/OShrzBmxLGEdZ8=
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr5861065wmq.126.1643645914847; 
 Mon, 31 Jan 2022 08:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20220131154531.429533-1-eric.auger@redhat.com>
 <20220131154531.429533-3-eric.auger@redhat.com>
 <20220131155936.lm7jn32ihb2ndsf7@gator>
 <CAFEAcA-K3cAPMiAfHNCOaceRN2csH26W4w9RDOUUVhpKPMNh2Q@mail.gmail.com>
 <20220131161408.py2ncvkkxxhbkpjj@gator>
In-Reply-To: <20220131161408.py2ncvkkxxhbkpjj@gator>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jan 2022 16:18:23 +0000
Message-ID: <CAFEAcA9+cAYPbMfrFQ0_bGoxuc=nGvp9Ku7Ps7s7DV-OOBnPfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/qtest: Special case sbsa-ref and
 xlnx-versal-virt if !CONFIG_ARM_GIC_TCG
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 at 16:14, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Jan 31, 2022 at 04:05:06PM +0000, Peter Maydell wrote:
> > On Mon, 31 Jan 2022 at 15:59, Andrew Jones <drjones@redhat.com> wrote:
> > > Hmm, if these machine types completely depend on userspace gicv3
> > > emulation, i.e. no way to use in-kernel gic or another tcg gic
> > > model, then I guess they shouldn't be built at all when ARM_GIC_TCG
> > > isn't configured. I.e.
> > >
> > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > index 2e0049196d6c..d7cc028b049d 100644
> > > --- a/hw/arm/Kconfig
> > > +++ b/hw/arm/Kconfig
> > > @@ -209,6 +209,7 @@ config REALVIEW
> > >
> > >  config SBSA_REF
> > >      bool
> > > +    depends on ARM_GIC_TCG
> > >      imply PCI_DEVICES
> > >      select AHCI
> > >      select ARM_SMMUV3
> > > @@ -378,6 +379,7 @@ config XLNX_ZYNQMP_ARM
> > >
> > >  config XLNX_VERSAL
> > >      bool
> > > +    depends on ARM_GIC_TCG
> > >      select ARM_GIC
> > >      select PL011
> > >      select CADENCE
> >
> > I kind of agree, but isn't this kind of mixing two things?
>
> How about two dependencies?
>
> >
> > (1) Both these machines require a GICv3 and a GICv2 won't do,
> > so they should do something that says "if you want this
> > machine type, you need a GICv3 device"
>
> depends on ARM_GIC_TCG   (IMO, could use a rename to be gicv3 specific)

ARM_GIC_TCG has a "depends on ARM_GIC && TCG", though.
"I need a GICv3" ought in principle to be satisfiable by
the KVM GICv3.

Part of the problem here is that we've let ARM_GIC mean both
GICv2 and GICv3.

> > (2) Both these machines don't work with KVM or hvf, so if we're
> > not building TCG then there's no point configuring in these
> > machine models (a property they share with every other arm
> > machine type except "virt", currently)
>
> depends on TCG

I would prefer a way of phrasing this that only required
us to say it in the one machine that can handle not-TCG
(virt) rather than in the large number of machines that cannot...

-- PMM

