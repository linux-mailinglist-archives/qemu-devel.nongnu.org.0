Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6802D118A5A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 15:04:01 +0100 (CET)
Received: from localhost ([::1]:57238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieg7M-0003mE-Dv
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 09:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47933)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ieg5D-0002ap-RA
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 09:01:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ieg5C-0004dv-EB
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 09:01:47 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44607)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ieg5C-0004ce-7Z
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 09:01:46 -0500
Received: by mail-ot1-x344.google.com with SMTP id x3so15515621oto.11
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 06:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=30l090qRempxAQzWf4nBrff/DdGwPwgmUiqdyPb2KYc=;
 b=ONRmAizkqbJm3R6WGB70ZV/jttGViISia5PR8I9bebhYGd1Q/p8FaqOLWWYKoGrmWG
 2v9RtUw2I1EufJwlC6S/T4Gv8ezsrTC79Som+z3I4SWmlSSAIfmcOAujeAWcU1kbS6IP
 kbYxDyQWKFQ5750gUU5VNRXNaoeYiRrj47e7FaSaFvstCQJ2I4S1JBP/wGmfL+FLCwDs
 0AV8bo5TA7556zo9Etcx8tE97CtCxllWdy/At8vUxXdyXH8kiEQFNz8URdWfIs9AJtp/
 sDCYYKh2rtEqvC3EOOcq1QS6+621kcDKhaDb+F08XW7fdmMrzA2cJ/Jh5wbfCdp13/b+
 xB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=30l090qRempxAQzWf4nBrff/DdGwPwgmUiqdyPb2KYc=;
 b=L0finDEAAY2APNHL2yj0R12CF4SJPvMOhyeGp1ZbHQsBcp7TxYmvFO67/qjofi6Oe7
 jKXxGCXcuc+i/8/x0BsYRByUtjWDh5MNxTr9X586Fquv80vUC2cNfy9PdZz0Zr5w0Nv3
 4NvoQpdpZjfphV5qGmKIaJvpiWefF1CQ5Q/+kHRm3HPWmdjwNJ8/HLLzvQu3ndHp26lY
 A+sPs/Q9QLszuuJ1GDq/0tLzwyKPXtyH8ma/RrsFnGY9ljSwKKN7ZxCw8wkLrj1QK6V5
 ZQD2iyPoNPbE9K8l0XOtC1oCVnkel79L9h38tanNIsp9clGc0owAk7PR7lK7o+uHoU2Z
 v90g==
X-Gm-Message-State: APjAAAU/dZ431u3weKvv7ExA1+UAaH1BR29iM1ZwRJ2de4+K9R3MtiYR
 gTytAz3W/3ZoEsr4/+48vOJ0lCopFPEwXfkJ/u280w==
X-Google-Smtp-Source: APXvYqwbhAyU9JAibpwvBzzSxpsIiVjf+RAiPd4IG7VzhaqKPa5tnPjSVRFojYVHfLVpu04JbMCBEfqHTXVWtfZnpBM=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr20181236otd.91.1575986503065; 
 Tue, 10 Dec 2019 06:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20191209063719.23086-1-guoheyi@huawei.com>
 <CAFEAcA_cP1pW=WC=0M7S37TRi_4uwaA_kQRTJ_xRkqbq48eLTg@mail.gmail.com>
 <20191210144906.14e41c7a@redhat.com>
In-Reply-To: <20191210144906.14e41c7a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Dec 2019 14:01:31 +0000
Message-ID: <CAFEAcA8BvqAD_QGJk_y1NxiHYcdZ3qR41jNnddsTYs=1tkCuJQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] arm/acpi: simplify aml code and enable SHPC
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Dec 2019 at 13:49, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Mon, 9 Dec 2019 17:51:10 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Mon, 9 Dec 2019 at 06:38, Heyi Guo <guoheyi@huawei.com> wrote:
> > >
> > > After the introduction of generic PCIe root port and PCIe-PCI bridge, we will
> > > also have SHPC controller on ARM, and we don't support ACPI hot plug, so just
> > > enable SHPC native hot plug.
> > >
> > > Igor also spotted the store operation outside of bit and/or is not necessary, so
> > > simply the code at first.
> > >
> > > v6:
> > > - Fix "make check" errors by updating tests/data/acpi/virt/DSDT*.
> > >
> > > v5:
> > > - Refine commit message of patch 1/2
> > >
> > > v4:
> > > - Improve the code indention.
> > >
> > > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > Cc: Igor Mammedov <imammedo@redhat.com>
> >
> > Thanks, applied to target-arm.next. (it's a bit awkward that acpi
> > table updates require also updating a bunch of binary test files,
> > but I suppose trying to make the golden-reference be some textual
> > format would be not very feasible.)
>
> Michael tried document it (commit 30c63d4fbd69)
> so that binary blobs would not be required (trusted).
>
> Problem is usually in blobs being un-review-able and
> unresolvable merge conflicts, that's why Michael
> updates tables manually for all changes in pull req.

A workflow that requires me to do a blob update when I
apply patches to target-arm.next isn't going to work for me.
If Michael wants the blobs to be handled like that, then all
patches which need to touch them will have to go via his tree.

thanks
-- PMM

