Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E24CE0390
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 14:05:07 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMsuL-0008MP-6f
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 08:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMssS-0007W7-EM
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:03:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMssN-0000q3-In
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:03:04 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMssN-0000pc-EK
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:02:59 -0400
Received: by mail-oi1-x241.google.com with SMTP id i16so13920787oie.4
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 05:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U0ugvtBir6WKkHh9uxvMx8EhSeMsNiFKco+bPuOYWho=;
 b=HFzVGEe1roblEIQREUnAKbfZl6m2jYWptNxPUbGybjyWMU3sBG8bzZyk6dSb1jxJ2I
 8tUNvtBeo8WlqdUeWGgnXeiaFR0p94U2A2V9E2mRov6Czd/CZlwchh12SYF98CQkNgRR
 M7ufuWO9z+rXCwG/F1kDtefQl1zkfO6yvta+96t5/kiQ1g4GCFvv/J7dW6kyijnD4yfi
 v53IHRgs+oJG1nqG2eyQ48e6n73qULfIrxhRAxJTETC1J9rfulxXHV6bOnR9nfEMdfKJ
 7RpzT/vXxrmeLN70cjDRRJcQ1XN9W2P5DMsmcYIJNP2qf+ZWIotSZusynL2hzQj2kImw
 I/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U0ugvtBir6WKkHh9uxvMx8EhSeMsNiFKco+bPuOYWho=;
 b=ONgO1a44cvLfih1nfFbBw64OMuPTs1ZT+w0rF24EjYOnwRsadmjvkxO37HGhzo+++p
 YomhaWJLcHsqiMb3Wiuu7RsuNB/xsP+eibg+CdmDtUUl8rvc6rX8KC1Jn28DX6SwvcLt
 Vj9xz9UxyW40iXXk4rLFMSXZDFcySG0CvRj33KBrIdD4xC7+1ToNif7jFTK4lXdm6y4S
 V2R/72a+mb4ExeakTuHKUVD22S5ZqP6fjmWvSLWfErStBKMdfCMxxUkcWu091IKyh2bq
 jWa5ovne9Kc71RvVq11ovavIT0IhABAsOG5s5mmRgxeJ85w1EYSWbxN013YXIlxNb2pI
 Z3dQ==
X-Gm-Message-State: APjAAAXyZ7k0iG03D3OgMMDYgPL1VIA8PqeylxOowRkCB+4lNHS85o1h
 KkuZF2fIX6h5jy/3ABfr7YiC9cXifAUaV2oYdRirRg==
X-Google-Smtp-Source: APXvYqxnKVAtT3rGBKvn3p0cagPEX93DKg/Gm+ELBUMi1Ndbzf+y9mPq7wqIJcxX63tO/Zy6rx+Q2vDLCGCcncybBRg=
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr2670511oic.98.1571745778541; 
 Tue, 22 Oct 2019 05:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191019173801.939-1-svens@stackframe.org>
 <f6cf2c88-ae77-2998-2b38-4716fe86f081@redhat.com>
In-Reply-To: <f6cf2c88-ae77-2998-2b38-4716fe86f081@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 13:02:47 +0100
Message-ID: <CAFEAcA8W=ePk6vqErnXGwCXqOJ9ATz-00caAHDcCA-pgJ8Womw@mail.gmail.com>
Subject: Re: [PATCH] net: add tulip (dec21143) driver
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Sven Schnelle <svens@stackframe.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Oct 2019 at 04:30, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2019/10/20 =E4=B8=8A=E5=8D=881:38, Sven Schnelle wrote:
> > This adds the basic functionality to emulate a Tulip NIC.
> >
> > Implemented are:
> >
> > - RX and TX functionality
> > - Perfect Frame Filtering
> > - Big/Little Endian descriptor support
> > - 93C46 EEPROM support
> > - LXT970 PHY
> >
> > Not implemented, mostly because i had no OS using these functions:
> >
> > - Imperfect frame filtering
> > - General Purpose Timer
> > - Transmit automatic polling
> > - Boot ROM support
> > - SIA interface
> > - Big/Little Endian data buffer conversion
> >
> > Successfully tested with the following Operating Systems:
> >
> > - MSDOS with Microsoft Network Client 3.0 and DEC ODI drivers
> > - HPPA Linux
> > - Windows XP
> > - HP-UX
> >
> > Signed-off-by: Sven Schnelle<svens@stackframe.org>
> > ---
>
>
> Applied.

Hi Jason; I just sent some code review comments on this patch
so you might want to hold off on applying it for now.

thanks
-- PMM

