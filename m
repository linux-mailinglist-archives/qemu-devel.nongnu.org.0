Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3132F17C9CA
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Mar 2020 01:35:46 +0100 (CET)
Received: from localhost ([::1]:43902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jANRR-0007Xj-3C
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 19:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pauldzim@gmail.com>) id 1jANQg-00076L-Qf
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 19:34:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pauldzim@gmail.com>) id 1jANQf-00042E-Pe
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 19:34:58 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:44602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pauldzim@gmail.com>) id 1jANQf-0003vD-IU
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 19:34:57 -0500
Received: by mail-io1-xd42.google.com with SMTP id u17so3817813iog.11
 for <qemu-devel@nongnu.org>; Fri, 06 Mar 2020 16:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WFOOK/1qXCp6Yb1BwKBfoqQpnFehpWZ6Q1I3jledYQU=;
 b=ROh6RJrJ4oNxsaIYoGDNLiFuGkVwVv3ZugZqu/mMVG0V95TLZqCAzqu6pZPKmquO7I
 Z2dJ7oskX3DwjSDI4Je9vF40RPqUyVyeJW/MG0ixilluTaA8o/r4NcE8lp7UsKF4hz9f
 Vw8dVlf1Qp71AlMXmkTPkfW5iMgY+Q19QqgZn/t5D/6b7veAmFA3p75r4uwZx+gB0pUJ
 gX1FXMo9fLh1BsHqVHX5u4Qexto9r2bA0MQD3WMfFoc1Yu9g235GEd32BmuC4/bnTnXK
 D47QmLUZB1TBt1ie0hhKdDK7XnFKpiIEX3TpE7U7ONDBJ1YUGQ34aX5tB7R+ddtLIsSE
 RGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WFOOK/1qXCp6Yb1BwKBfoqQpnFehpWZ6Q1I3jledYQU=;
 b=gSwwFeK7wwoNb1RHvxhF+YOuvwdXW4QlxbDlcjoQmrY9XENRDSsOoHj/v9fVQGmbWX
 5DzXkCphe45p8DB7tE6n4IMCLvYSLOC8swdz5csMHfjSCZ713Kz8eKjPil4r9LilUJ7O
 l0GDaI/QmqtP1xZvGDfhSkXNsj0aFji2wcUJFbjOICSrcrauJwOn66sNKAr5zMox3DmS
 tH93zigRau+faM31i83LJvPtMVa+2YQmARoMxln+bBTUJ6NIKM/l7qSwpMoo2R/1D4Mr
 gY9jZr0371nICpnuxaTznDaC/UeR6VbzBp9y9BlwScWG5Fn/WQAK57shfAXWJHrBLE2Q
 X6mw==
X-Gm-Message-State: ANhLgQ3hhUM4e/VW8AdZSRqqONFwsNZ5Lp1Rh1ZaOG5zhgBKK93XXtp1
 dAXSLrSMPrZjot38kkxEEO1/16wiOHZ/XA1+3Vw=
X-Google-Smtp-Source: ADFU+vsDU6nmOmhpves1kiFLsQ4tCpXP0iAaXLIs+wgp81bXxOcCHAVQcFRt+emksmp0dEDwEMzF/3X7aQs8yrf3FGk=
X-Received: by 2002:a6b:5a06:: with SMTP id o6mr5205285iob.54.1583541296366;
 Fri, 06 Mar 2020 16:34:56 -0800 (PST)
MIME-Version: 1.0
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Fri, 6 Mar 2020 17:34:30 -0700
Message-ID: <CADBGO79s5ZTWrvheAu=XHrVQO0O_RxLu9LD9=B=k982c8_mC6g@mail.gmail.com>
Subject: Any interest in dwc-otg (aka dwc2) device emulation? For Raspi 3 and
 below.
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Folks,

I have been working on an emulation of the dwc-otg USB controller
(host mode only for now), as implemented on the Raspberry Pi 3 and
below, and on numerous other embedded platforms. I have it to a point
where it works pretty well with the dwc2 driver in the mainline Linux
kernel, and with the dwc-otg driver in the Raspbian kernel. Mouse and
keyboard work fine, and I *think* the usb-net device is working too,
although I have been unsuccessful in connecting to the outside world
with it.

I haven't done anything with gadget-mode yet, but that could certainly
be added in the future.

Would there be any interest in me submitting this for inclusion in
Qemu? I ask because I see there was a previous effort at this at
github.com/0xabu/qemu/hw/usb/bcm2835_usb.c, but it seems it never went
anywhere.

Thanks,
Paul

