Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00585193DCA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 12:22:58 +0100 (CET)
Received: from localhost ([::1]:49568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHQbB-0002Me-38
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 07:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHQaG-0001Sx-Uk
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 07:22:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHQaF-00019i-MY
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 07:22:00 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38790)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHQaF-000191-8v
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 07:21:59 -0400
Received: by mail-ot1-x342.google.com with SMTP id t28so5389327ott.5
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjS8arwWPCKKwl/gjk2wWVNJsFe3Aduf9xlaVv3CwYc=;
 b=x4r5ZbpQY116c0fKPRaFnt3pM37dTaRkICDbPtsN7GJxRByhvWmTqLrhQenQ0P7lcL
 SaFIu63bjXPXvxdTppld2/NzuiNj+SiuUZsM+vUS9oredRIA5norxxYRNF87xp52RrEu
 oC99GbDY1xGFatTQ1eW96a8VFw6jFoKkDYd0nIe4nMfmNWlsAmmkKzFB28LXaNPUSO0W
 FDdQMZo0ACJ5aXAzuJSO8MRf2k8VADHVbGD377Set7ozHj0Cug1PE6sT2Cc2UHg1ZCcf
 vWQYxIEeBd5FL4x07SweEXT6hU0hnXMa+dGgjPwIBU7kaM1+y9XOxlq3nHbP5dNHe6C3
 f82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjS8arwWPCKKwl/gjk2wWVNJsFe3Aduf9xlaVv3CwYc=;
 b=EgujhIbt1RoSlxh/VGYKaDEPCpGcNW6W8qDMDS/r9XTPv5s28IuUXdw/61j/ZN3Ic3
 aAQtyym/8ulLH9rk5UQ94wdyqUBnQWcCTs6tUKsQRK7ifdBvnCQZP5Ln52/+K4lyEED1
 hOtEJEFzdzapInP3ldTIB9F89+XyM8zZ8I8rb6hqy9KgIZX5BQdCo6Jc4sLIQ/wmj6v7
 2QQez1a9Y5P/2Dfp2rgC50T3Tf+95QYmIIax5mhg5iP4PIo3Wk0cSRZhqkh5rc7/odsI
 ns0v1CmaQqY86u4gKRCzFt7KHgmGGn/dVaBmhAs1QRi/hW2PAB7Av4Qq5Sa/OD273GpY
 bKUg==
X-Gm-Message-State: ANhLgQ2ECNu8BVzdZXkesd9FvSBtFOqduYK5C3GlXdE3ARmnOAmmnACm
 4Kso6tKNZFV8QWRvxgAEDgPgIzow5FI2LsvR95LG1g==
X-Google-Smtp-Source: ADFU+vt0NOiUM9hgrvMt2JRUR+UM049libhwwVmGD2knzn5GW3GI8mGAq5xSbDRQ9g4lCVq3BnxQUwZlBdJg9wXsffo=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr5875729oth.135.1585221718302; 
 Thu, 26 Mar 2020 04:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200324063912.25063-1-aik@ozlabs.ru>
 <20200326001106.GJ36889@umbus.fritz.box>
In-Reply-To: <20200326001106.GJ36889@umbus.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 11:21:47 +0000
Message-ID: <CAFEAcA9M1zjbA9Ztsrd+gcgWb8+5ouVw1Nu75MUk2ZZpBNdNEw@mail.gmail.com>
Subject: Re: [PATCH qemu] vfio/spapr: Fix page size calculation
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Mar 2020 at 00:39, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Tue, Mar 24, 2020 at 05:39:12PM +1100, Alexey Kardashevskiy wrote:
> > Coverity detected an issue (CID 1421903) with potential call of clz64(0)
> > which returns 64 which make it do "<<" with a negative number.
> >
> > This checks the mask and avoids undefined behaviour.
> >
> > In practice pgsizes and memory_region_iommu_get_min_page_size() always
> > have some common page sizes and even if they did not, the resulting page
> > size would be 0x8000.0000.0000.0000 (gcc 9.2) and
> > ioctl(VFIO_IOMMU_SPAPR_TCE_CREATE) would fail anyway.
> >
> > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>
> Applied to ppc-for-5.1.

As a coverity-issue-fix it would be nice to have this in
5.0 unless you think it's particularly risky.

thanks
-- PMM

