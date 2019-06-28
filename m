Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68459BDF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 14:43:46 +0200 (CEST)
Received: from localhost ([::1]:59402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgqEE-0004xY-3K
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 08:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37480)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mrolnik@gmail.com>) id 1hgq7g-00068Q-Ru
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 08:37:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1hgq7f-0005Yg-2R
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 08:37:00 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:37814)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1hgq7e-0005Xl-Oy
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 08:36:58 -0400
Received: by mail-qt1-x844.google.com with SMTP id y57so6039765qtk.4
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 05:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oS3zRCRh24TudfHx4YCml/poKW51Z2mHnEQscHLxYTo=;
 b=j0z0L3cWEnds+AACgH98jEavEop7gWu27QsP5cOJU4BcwT4dF4dOzSrS/YrPRjpsYj
 yQMY/cy8GxlaRjHxXXrvKWm2O3dVLZTGrPKK0SdzdRTaOsX2pOxRJJf7Pbb4SMBdQcf1
 N7jJQ36FVHoqelGzEgV+BF4ZzVKp77O6mrFN6vASpXr+1jTjYj/aJ+R7Smu606pMUuuQ
 YeFYODjmwQYBD/mOd/2yv0UPcEKmZ0K8355EHCysY2HFWIdNhFQezIGagvcMbriBMi7t
 5N5HhV945QN2PNSNpTpe7P2ite2YUnQw79npVczs02MT9aZVTGb4imZfLhsUR+oeuTy0
 9Upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oS3zRCRh24TudfHx4YCml/poKW51Z2mHnEQscHLxYTo=;
 b=cqN/2tjGkEImZmpsPI2/V45uMM4whg4/G5UlaOuHvtV635RwH5z4COBkCysl/WePMZ
 gyTbE4f+uwayuAImMNZ3mTteKuAPfHaEW+Mu7YzJTF2mNv494AARhSgKVOFr0OzoJCFN
 94YPCAxg94sIYP9p8Hr/5hoK4XcEbVY8MUqpmjX0kUlSxLdUY1R42Hws3spYqYBjyD+j
 iTQqTWrDuhoAlb2CkMEzE26YW0T03m58Oxlvvu1POO+X9z15vcv/Grgo3uH3syCiUXI1
 6gif33U2MpS5ouBMewqaEcVds6uwrCDFDHbaEE+erFPQIWCj1s3h5B1Px5QABN5ciKJv
 U0QQ==
X-Gm-Message-State: APjAAAV54jvihZVVF94SQgFNgSARgE0KZlaeEKTBpK9upK6IJGgaya9b
 bq+07C/MSpjiAMoCb8kPH23fLCEm5d9/byU/OXvH6CxcT4s=
X-Google-Smtp-Source: APXvYqy+z6DyJq62oMVwtMY7sbQL7nj+SEy2sThmd2EqxqRvJN/hRC/7DSyRjwyuB+SAWyntMP5ZKGMRO0pQzfH7sts=
X-Received: by 2002:a0c:e6a2:: with SMTP id j2mr7452245qvn.190.1561723426259; 
 Fri, 28 Jun 2019 05:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190627052750.31856-1-mrolnik@gmail.com>
 <20190627052750.31856-2-mrolnik@gmail.com>
 <20190627132800.462655c5@redhat.com>
 <CAK4993j0BP62dEM_X7dP_9zT5JjJ1F4_OwEuHTnVY+59RHgm0g@mail.gmail.com>
 <CAK4993gq=Nz+r0H5jOfY7NqS2+rjM=vMRJSCtbXbxPwtwZYRSw@mail.gmail.com>
 <20190628103626.2d10bcfa@redhat.com>
 <CAK4993gOmQK71qNDyYe-f00Xqny+OXDH1O89gXmQVh8jdqmABQ@mail.gmail.com>
 <20190628112253.275bdf7d@redhat.com>
 <32aa0f8c-f779-4629-c3a6-9cad5357642a@linaro.org>
In-Reply-To: <32aa0f8c-f779-4629-c3a6-9cad5357642a@linaro.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Fri, 28 Jun 2019 15:03:09 +0300
Message-ID: <CAK4993iv8HPj=QSH3B_1Dzkqh0GfRc0Lio+UWVfHOK0=MmeSDQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v23 1/7] target/avr: Add outward facing
 interfaces and core CPU logic
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
Cc: Igor Mammedov <imammedo@redhat.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

thanks.
new version is out.

Michael

On Fri, Jun 28, 2019 at 1:01 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/28/19 11:22 AM, Igor Mammedov wrote:
> > On Fri, 28 Jun 2019 11:43:22 +0300
> > Michael Rolnik <mrolnik@gmail.com> wrote:
> >
> >> Nobody else does it.
> > it doesn't mean that we should blindly copy pre-existing patterns
> > which might/will exist for compatibility reasons.
> >
> > pls see the same argument on RX CPU for reasons not to support
> > anything else beside typename there.
> >   [Qemu-devel] [PATCH v16 13/23] target/rx: Fix cpu types and  names
> >   [Qemu-devel] [PATCH v19 03/21] target/rx: CPU definition
> >
> >
> >> Richard.
> >> What do you think?
>
> We are going with Igor's advice for target/rx, yes.
> You should do the same here in target/avr.
>
>
> r~
>


-- 
Best Regards,
Michael Rolnik
