Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D0167FE2
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jul 2019 17:40:35 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmgc5-0005Tw-H6
	for lists+qemu-devel@lfdr.de; Sun, 14 Jul 2019 11:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38047)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hmgbs-0004wO-C5
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 11:40:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hmgbr-0007dk-Bh
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 11:40:20 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:44385)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <radoslaw.biernacki@linaro.org>)
 id 1hmgbr-0007cl-4k
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 11:40:19 -0400
Received: by mail-yb1-xb44.google.com with SMTP id a14so5388077ybm.11
 for <qemu-devel@nongnu.org>; Sun, 14 Jul 2019 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ze3KVudLrBGvIef9Y9ql9VL/shPv2tJVaBI50kDaR+w=;
 b=MFMNiovOpcuz0jSsG/Vi5gD9mzPTzkHeK4fGdGhA+QrHPni6ZZEeW6jCVdpL7RPKGG
 BRCDHMZvDUSO8tmurfTtPNgy2pYD947xjSUpfOpQO8t0ajsa3YUhh4FwNfoKINN3y7/B
 eB/BF/Fn5c0OfsAdVaYIo/Ng9tRIp+UEd9lMv9c8R4as2eWQFvcAx+5gsFZctEG3pCdo
 Q1IuG/DQDGjMZ+khvyXGTdw7T748ZXW0h/LtiPLedSOjdKx71mwSrK8JDlmxi9xBpEMg
 UPKxPqnLj3d10yEpYvDTsg1/ZbwKhLiHLXHYgYLAQSlLqCpwHftCiaJRdhl/AhUhz6ma
 6TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ze3KVudLrBGvIef9Y9ql9VL/shPv2tJVaBI50kDaR+w=;
 b=AWpP0zKcvKcqq07GXmcW9JhVg2+RwTIgTaPNk+igf+vjUow8/JjLh70AK3+Fk3zQP3
 DSGDonT+RB8RSHkQUVu96c2Ykp2KWzpKYzIadQYCjHS7Tgu1OCHFs1SiAZI3zCADBCa9
 dmv2hSbV1omfqBo4pNeSS+dTIbGkXUe41bWT3H1hxE5LaX+gQEYLO8VAU3CAzr3aNLRd
 8TmyIG+42qNCeP4thKkUkTCaEOtghbKPwdZmqagWj1Hw0zzg1BSMMVKAss7eX0QzNgvO
 KLsI96A6V+ZNCdFtjcoFaxy9Cg7Do6oiTmRDm6JG8q5ICEi1hukzywSzavBoCeH7kqgV
 J8qg==
X-Gm-Message-State: APjAAAUu32AYG226sD/9X7gwYfYl+7IgLL+T7iCNKIwoEZtxSIIywcLG
 LjgVdqXjqeWyCpGRAQsF82gIZQQX0bbwrXYtZgO2Xw==
X-Google-Smtp-Source: APXvYqwniRfTs+6BP43Fssu8E+sl+M7TLDHq6J2xNAP2io49YTlI93Q1IoB52YtidQlA7h0dqAaRxvngClirV0/m4IQ=
X-Received: by 2002:a25:5e88:: with SMTP id
 s130mr13118946ybb.134.1563118817148; 
 Sun, 14 Jul 2019 08:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
 <20190714152010.GA28247@roeck-us.net>
In-Reply-To: <20190714152010.GA28247@roeck-us.net>
From: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Date: Sun, 14 Jul 2019 17:40:05 +0200
Message-ID: <CAEK-wKk+1RQRmFOy8Rp+6fsOaZvzJvXSPNnyTKFY-7c-_VYSXw@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
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

This machine is not ment for direct kernel boot. Is main purpose is
development of FW, kernel and other HW/SW parts for SBSA. We are currently
working on UEFI and ATF for this machine.

It might be somehow possible to run kernel with DT but we do not support it
at this moment. If all you want is to boot kernel directly, it is far
more convenient to use existing virt machine.

niedz., 14 lip 2019, 17:20 u=C5=BCytkownik Guenter Roeck <linux@roeck-us.ne=
t>
napisa=C5=82:

> Hi,
>
> On Sun, Jun 30, 2019 at 06:20:32PM +0800, Hongbo Zhang wrote:
> > For the Aarch64, there is one machine 'virt', it is primarily meant to
> > run on KVM and execute virtualization workloads, but we need an
> > environment as faithful as possible to physical hardware,  to support
> > firmware and OS development for pysical Aarch64 machines.
> >
>
> I tried to boot linux on this machine with -kernel command line argument,
> but have not been successful. Can someone point me to a working command
> line, one that lets me load the kernel directly ?
>
> Thanks,
> Guenter
>
