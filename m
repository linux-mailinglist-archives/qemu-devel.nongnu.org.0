Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E97FC0864
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 17:14:33 +0200 (CEST)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDrx1-0007BX-NU
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 11:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDqT4-0002kr-0C
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDqT2-0003pf-PM
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:39:29 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38546)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDqT2-0003pP-Jr
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:39:28 -0400
Received: by mail-oi1-x241.google.com with SMTP id m16so5224516oic.5
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1Q6bo6oGtzEZfTgCVarh8gJ3X7+oQ9djEhBLWXME+I=;
 b=VncKr+TLApkeE/Acoun7pM3F4Z/2uy+Iwh+NEKVbBuQgnSbpfPTN3oxWz6CAel/aVS
 9zeBxPkiW7/Id0f3b/iXTL7Ln2AbaIb6XetkfFzZr5LuHOmFSpU/Jf6ZuycE+D6vkBtm
 nNVV2vaST1mONoOyT8Rrhbn2TenyHPVbc4u4mkI9Bu/nKrolmthYCVlMVVmPBltfnIwl
 YyxcIEBwaprdKHBaGBQskhGhP57lgwJNmd2CSm3nHPub174A+gOW4wRf+Z/xvEZ5ceNj
 IyBjsHhu9Q1xZxoHnUalckKou18/ha7qYu6PzIPrtCYkTXhJD9jc6tz1aH5dfgvrIaqv
 3BgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1Q6bo6oGtzEZfTgCVarh8gJ3X7+oQ9djEhBLWXME+I=;
 b=KJ4aKVQJlrA2BVgPVuvDP2y1BC58gW8t2V9aoxIU9VuvSgm+mEIcn9/GB7A0UKPzxi
 GKJqNmyI84jlBHbBFK6I/nzoTFbdLjDVcSoWTCg+Sfbof2wmb5mN3OCGoyqCNUK3/II9
 cNI/La5xy2llreqjKPQbcEkgQSr34Q9HyTm6oaNYdtHa7HkPGC4PXcVntAwGOoRGINoA
 QHx1CiP1cJ/rnYdNKqC7y6gD2htj88oLQ1d/+M8+uHM6iFIn6khs7Ubw4e9zV5guWD1K
 D36GnMs6kA3OIsb7if5qyrMYY+7IwC5v1ewU7lrlopae5+zmfDxBaBK/DhsGsYKoePtd
 2VFQ==
X-Gm-Message-State: APjAAAVg++ns2kR5jD1kze3TRf4e3sKs1yJ0dIZZzi0Z2QY5Dov9+Xvj
 mNYMvZfnC0tNzh+eodnNh5L2B66HZAxTBbA0amwhheDuub0=
X-Google-Smtp-Source: APXvYqzl/r0A6XiasIObFSV9pVEPg672uJPNVlmJp4Xr7Yks8/WoPBa0Nl+0arNRufL8nrM1C9YEnUrS5xrO2QhYtM0=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr6688250oih.170.1569580670906; 
 Fri, 27 Sep 2019 03:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
 <20190925112804-mutt-send-email-mst@kernel.org>
 <20190925173753.7382593d@Igors-MacBook-Pro>
 <20190925122006-mutt-send-email-mst@kernel.org>
In-Reply-To: <20190925122006-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Sep 2019 11:37:39 +0100
Message-ID: <CAFEAcA8yrj-NnBqjwchVYXRyfpznsbmwdKBqkubSSj++h09zwA@mail.gmail.com>
Subject: Re: [PATCH-for-4.2 v11 00/11] ARM virt: ACPI memory hotplug support
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Samuel Ortiz <sameo@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, sebastien.boeuf@intel.com,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Sep 2019 at 17:20, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Sep 25, 2019 at 05:37:53PM +0200, Igor Mammedov wrote:
> > On Wed, 25 Sep 2019 11:28:42 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > > On Wed, Sep 18, 2019 at 02:06:22PM +0100, Shameer Kolothum wrote:
> > > > This series is an attempt to provide device memory hotplug support
> > > > on ARM virt platform. This is based on Eric's recent works here[1]
> > > > and carries some of the pc-dimm related patches dropped from his
> > > > series.
> > > >
> > > > The kernel support for arm64 memory hot add was added recently by
> > > > Robin and hence the guest kernel should be => 5.0-rc1.
> > > >
> > > > NVDIM support is not included currently as we still have an unresolved
> > > > issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
> > > > can be included, but not done for now, for keeping it simple.
> > > >
> > > > This makes use of GED device to sent hotplug ACPI events to the
> > > > Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
> > > > Sebastien to add the hardware-reduced support to Nemu using GED
> > > > device[3]. (Please shout if I got the author/signed-off wrong for
> > > > those patches or missed any names).
> > > >
> > > > This is sanity tested on a HiSilicon ARM64 platform and appreciate
> > > > any further testing.
> > > >
> > > > Note:
> > > > Attempted adding dimm_pxm test case to bios-tables-test for arm/virt.
> > > > But noticed the issue decribed here[5]. This is under investigation
> > > > now.
> > > >
> > > > Thanks,
> > > > Shameer
> > >
> > >
> > > Which tree is this going through? Mine or ARM?
> >
> > I'd assume your tree???
> > (You are the wizard who knows how to handle bios-tables-test-allowed-diff.h on merge)
>
> Sure. Peter if you agree, could you send your ack for that please?

Yeah, that's as good a way to do it as any.
Acked-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

