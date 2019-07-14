Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D298168164
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 00:09:06 +0200 (CEST)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmmg6-0001za-2R
	for lists+qemu-devel@lfdr.de; Sun, 14 Jul 2019 18:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hmmfs-0001VV-At
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 18:08:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hmmfr-0001Gp-3g
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 18:08:52 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:44155)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <radoslaw.biernacki@linaro.org>)
 id 1hmmfq-0001GD-RG
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 18:08:51 -0400
Received: by mail-yw1-xc41.google.com with SMTP id l79so6750588ywe.11
 for <qemu-devel@nongnu.org>; Sun, 14 Jul 2019 15:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v1vLA6NnRH2WUz9EzwXQmezKfms1ODS+chrkpicTKPI=;
 b=oYincNxfLuJVVdvqFEIcU+/w1WUd2fhgnNCCs2e0ebj009s96LvUzFADxLcX6xI/HW
 LN4/gtLDyox5hxy+I+LSEG8NMNmvErkelP8rp8LcABCBR/DQ905BJ6B/+xCpW0FssiQm
 pVcD+g2IGM5dLOb+La5hw6CGR++hp0EA+XTy4mOZjOlHDalr8/qC/VU5mGP9zkc42mlX
 fBeR92qGLc364x6596kNWRcA6KY4TWEoOI4bWJeOjQ9rlbKeKuoaKKhAIFKLAyUd0v1L
 9zJCLrgBMQ1Mq0Zr0x3RgJGJsTtgBkKCVHWnJwkkETTa1BmYRpX4Cm3hYeQtgSRT+PKx
 aeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v1vLA6NnRH2WUz9EzwXQmezKfms1ODS+chrkpicTKPI=;
 b=UNlAnfH57DX+4UM0i8uuglkZuw5MqrqV0B+d0GyRCsQJb07hC01p31eAqy8raYihnt
 DNUXmBYLvdP6eCO1m6Eo7EljOO1BXjkjWcjyaL9xvnCz+BRuDA176uxLfC5jsDDeRQmQ
 FMRLVPpTvwf0KEEqKhzzKvH7ox9qkWb742e++1/fNuwlKGOqGJgaKnt/d+geF1LLwbhc
 96LPCixqQju1kIF4YtAQxdhbby6zstZIQx92dCX4p8gBPHD3KDr3kHUtmxYJ/LCUxrk8
 NYNVvn0VIcG9zF89VgyLOOTH+65KSFyPanRAztI23HTO0o8wX+Y3GGkx1B8P49GzfaUO
 RYbA==
X-Gm-Message-State: APjAAAWZwD8sTLUPaQA/mpk10zMLn0uv3ly2DwlATVKVBZ45wIE+Hl42
 MNjwS01G5TX9wC+v3sASKtyQR3gbJaZHEq69DbvBXg==
X-Google-Smtp-Source: APXvYqw+IR1DYD/1u4mp793chRYLxlVPnuceuvajoD2dzzxBJ4nc2sONqwn9QYB42Z0bQ47NaUFX6OfbFYLKoo03SWo=
X-Received: by 2002:a81:1f42:: with SMTP id f63mr12338043ywf.184.1563142129917; 
 Sun, 14 Jul 2019 15:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
 <20190714152010.GA28247@roeck-us.net>
 <CAEK-wKk+1RQRmFOy8Rp+6fsOaZvzJvXSPNnyTKFY-7c-_VYSXw@mail.gmail.com>
 <bfc94fff-e84f-c07f-322d-d9430048512c@roeck-us.net>
In-Reply-To: <bfc94fff-e84f-c07f-322d-d9430048512c@roeck-us.net>
From: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Date: Mon, 15 Jul 2019 00:08:38 +0200
Message-ID: <CAEK-wK=6hrj-OCFcn+uJpAuPM9chZL2w4tXGdu9=FENuXsA6Rw@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v9 0/2] Add Arm SBSA Reference Machine
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, ard.biesheuvel@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 leif.lindholm@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If running full machine stack is an option, than I think that you will be
able to use SBSA machine in your tests once we have all the FW images
ready. But unfortunately we are not there yet.


niedz., 14 lip 2019, 23:57 u=C5=BCytkownik Guenter Roeck <linux@roeck-us.ne=
t>
napisa=C5=82:

> On 7/14/19 8:40 AM, Radoslaw Biernacki wrote:
> > This machine is not ment for direct kernel boot. Is main purpose is
> development of FW, kernel and other HW/SW parts for SBSA. We are currentl=
y
> working on UEFI and ATF for this machine.
> >
> > It might be somehow possible to run kernel with DT but we do not suppor=
t
> it at this moment. If all you want is to boot kernel directly, it is far
> more convenient to use existing virt machine.
> >
>
> Too bad. As you may know, I am testing the Linux kernel by running it wit=
h
> as many qemu
> machines as possible. I already run several boot tests with the 'virt'
> machine, and
> I was trying to extend test coverage with the sbsa machine.
>
> Guenter
>
> > niedz., 14 lip 2019, 17:20 u=C5=BCytkownik Guenter Roeck <linux@roeck-u=
s.net
> <mailto:linux@roeck-us.net>> napisa=C5=82:
> >
> >     Hi,
> >
> >     On Sun, Jun 30, 2019 at 06:20:32PM +0800, Hongbo Zhang wrote:
> >      > For the Aarch64, there is one machine 'virt', it is primarily
> meant to
> >      > run on KVM and execute virtualization workloads, but we need an
> >      > environment as faithful as possible to physical hardware,  to
> support
> >      > firmware and OS development for pysical Aarch64 machines.
> >      >
> >
> >     I tried to boot linux on this machine with -kernel command line
> argument,
> >     but have not been successful. Can someone point me to a working
> command
> >     line, one that lets me load the kernel directly ?
> >
> >     Thanks,
> >     Guenter
> >
>
>
