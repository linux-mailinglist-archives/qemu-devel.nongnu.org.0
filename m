Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A039F01E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 18:27:04 +0200 (CEST)
Received: from localhost ([::1]:53900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2eJD-00023U-7t
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 12:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2eI4-0001VP-Jf
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2eI3-00038N-Dq
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:25:52 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37985)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2eI3-00037r-7t
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:25:51 -0400
Received: by mail-oi1-x242.google.com with SMTP id q8so15143284oij.5
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRF+hAhA5e8NbtJEE/PY94rIOMBkfkunaVAvvB9zB1c=;
 b=iCl+IQdnlktuumEmS1ho/bYHAegxh26LMJqqut9a2u4E8KF2KjF3ps/ZW6qusCIRZe
 KaUzDONEKZD+R/lBc3WtxugO7XG4xXH8gqlPR7fwuUtwu6k2QChYjuC7dfsJrC86aYca
 lm49qVSohePbXECxNEg0CWcbjxvFOZbStaefES3W3zO2X+dIBlW+Ayw0Tlnqc/HeR+Sr
 KMord5RKOqKzpraZXQARgC87SEE/+xEiIeWYP+/5WMls1dl2CW9dXivDm0BPdv3Zx80c
 hqMHA/MtLJ62/zgLNxJ0cnyriPuRalYfKeUFjCsG6CLJXBTug+3zYTs1aBWy1Vd97Bp2
 xTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRF+hAhA5e8NbtJEE/PY94rIOMBkfkunaVAvvB9zB1c=;
 b=YXpeXKh/B9p2iK/dz01MpqavCrs++xwlxaOFrMbFM57AZ/3D7ROcu8jF+1Ztd3yEzJ
 w5Cad/D5uKJogut30X6f7EIeQ45Z93bNGf9//vLqOdOWDUP9U5keVGPKr3pFrpkwi2Ys
 qpeRkWnO6D9el0c6Sg3JHScCB1j3KH3ohcmd/CJ2lL3nRkL9dHtdA1/uZVhMYVfv4gX5
 YhlXvECoSFA+6IEpSZOmCQgux26kfF2LMmIQlJTDmmBi3VfKHcVisBRIbDKU0FMyoJ5T
 6HSk6D8L1PXowfi5/JFwSyqVVn0JWexBdaBJFrS4PO+qdE/yigOcn5civ3+5MQPPdtsJ
 iT9g==
X-Gm-Message-State: APjAAAUQ3w/NM0l+ApSGlnM9XbzRmWS7RPxqoUv1ma+cKVFu/63wORy6
 2p9EZm6KaWfLiFp7385RtUhD/angEfT0GpdWwg9dQg==
X-Google-Smtp-Source: APXvYqwX6tB3VjbMzJhGn5KzishO0WeftVQbUF1q8tzMfDOO8thTsTtqvROvmft+b7uuzB7kPU7VWSyWPzhUlAO/a3M=
X-Received: by 2002:aca:50cb:: with SMTP id e194mr15606956oib.48.1566923150027; 
 Tue, 27 Aug 2019 09:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190822172350.12008-1-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 17:25:39 +0100
Message-ID: <CAFEAcA-TDGTXrj5M=DXWm5woFOiLKdibueqczS7Yz3kZPRMWpQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v4 0/5] ARM SMMUv3: Fix spurious
 notification errors and fail with VFIO
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
> As of today when a guest is assigned with a host PCI device and
> an SMMUv3, VFIO calls memory_region_iommu_replay() default
> implementation. This translates the whole address range and
> completely stalls the execution. As VFIO/SMMUv3 integration
> is not supported yet (it requires SMMUv3 HW nested paging), let's
> recognize this situation and fail.
>
> Also the series silences some spurious translation configuration
> decoding errors (STE out of span or invalid STE) that may happen
> on guest IOVA invalidation notifications.
>
> Best Regards
>
> Eric
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v4.1.0_smmu_vfio_fail_v4

> Eric Auger (5):
>   memory: Remove unused memory_region_iommu_replay_all()
>   memory: Add IOMMU_ATTR_HW_NESTED_PAGING IOMMU memory region attribute
>   hw/vfio/common: Fail on VFIO/HW nested paging detection
>   hw/arm/smmuv3: Log a guest error when decoding an invalid STE
>   hw/arm/smmuv3: Remove spurious error messages on IOVA invalidations

I've added patches 1, 4 and 5 to target-arm.next.

thanks
-- PMM

