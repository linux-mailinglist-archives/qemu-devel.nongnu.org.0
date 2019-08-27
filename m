Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F97B9F00B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 18:21:25 +0200 (CEST)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2eDk-00079H-8J
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 12:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2eBs-00062b-DZ
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:19:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2eBr-0008Ol-5e
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:19:28 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41194)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2eBq-0008O7-Vt
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:19:27 -0400
Received: by mail-oi1-x241.google.com with SMTP id p127so6804435oic.8
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 09:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LRcqPI5IGI7GYFNOvPFcLY7Z0FntDdjfHLxS7h1JfRo=;
 b=uXU+atD8EbakzzWGNHnrkYHdrakfk0gD6lZzH+ymoXHLlcHj/BEprWocl7x1bgErWt
 VsYGjtpq5U9sOHpg1guN8sL56yjmufx1bAPcfONzSwqFfhYIb0KybHgLEf6oDYj7PcXO
 zpafjTWZu2SWPvhEOzkXCLAmMZ2i4lpsE3N8LwC4Q563ySycfnA25CijaFx7AF8PCejD
 BEkA3ia6YsnWqMOobh6zNwgkyb1v1rdOUXyHiHzJL/963KQF48dpaA5QmbJu5pH90Pi5
 nUp9cIlwdHPBvtREEcpkWkaDozfzupsZ0YuCWUjxcbGBw5F+YA9P4FnYD27YvsCgF1Es
 B0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LRcqPI5IGI7GYFNOvPFcLY7Z0FntDdjfHLxS7h1JfRo=;
 b=sq7YurFIDuFawM7YlxH5InItKmJl+5VpHZC+2nR0eZTwbehhESaprA1ryEfYCKjLfD
 D/hiLCvdp4cS7xDGwGmcQ8hMKtLFd1YF1HCfVHPY1Zpi5jpMyljDJc3GsJYPj1aCcKWq
 ccc0+hQB9AA1fXaObQli+GJ1qLXHl3nEdNbwvvX6etnqlQEVvI8+bB+PmLgVTJiyx+tt
 aZ4etslHb3girylHZ9sPyXwm0o6XGU/TY+Whca8/etLHdOse+FR4xgo+LntHdcs4Zivy
 az9IDOmhQNcewlCvvVdOtf0B43sCDGTHoJ+A2FPySJoywNmzXXBAg2u4lomEdXe6eudo
 57Lg==
X-Gm-Message-State: APjAAAXtg+bhex8rc8Z8dEH6BnoFvHj2nQsavAw2Ub0Vr8RWkvcZaZd/
 kAJPkOLqeK/4/9lUtBWxZbW7lJg3SMsiGbKzBxeBQA==
X-Google-Smtp-Source: APXvYqyYcNNBXYSkempzW10EyasDybg11Ft5F/AcZxXtGYII8tbp1yYUli5n6jaTCITDMPbcwH01IgfIm46euqrTBY0=
X-Received: by 2002:aca:4b86:: with SMTP id
 y128mr16825420oia.163.1566922765952; 
 Tue, 27 Aug 2019 09:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190822172350.12008-1-eric.auger@redhat.com>
 <20190822172350.12008-3-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 17:19:14 +0100
Message-ID: <CAFEAcA94O=o+Kr25on40kv4UvyjdwVt29rVa9ObzgweJaYZuQg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v4 2/5] memory: Add
 IOMMU_ATTR_HW_NESTED_PAGING IOMMU memory region attribute
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Aug 2019 at 18:24, Eric Auger <eric.auger@redhat.com> wrote:
>
> We introduce a new IOMMU Memory Region attribute,
> IOMMU_ATTR_HW_NESTED_PAGING that tells whether the virtual
> IOMMU relies on physical IOMMU HW nested paging capability
> when protecting host assigned devices.

I'm still not really happy with the name of this attribute.
"IOMMU_ATTR_HW_NESTED_PAGING" sounds like it ought to mean
"true if this IOMMU supports/is using hardware nested paging". What
your commit message suggests it means is "true if this IOMMU
*needs* hardware nested paging", but there's no NEEDS in the
attribute name.

> Current Intel virtual IOMMU device supports "Caching
> Mode" and does not require 2 stages at physical level to be
> integrated with VFIO. However SMMUv3 does not implement such
> "caching mode" and requires to use HW nested paging.
>
> As such SMMUv3 is the first IOMMU device to advertise this
> attribute.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

The code changes look good to me though.

thanks
-- PMM

