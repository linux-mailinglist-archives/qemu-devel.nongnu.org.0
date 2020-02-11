Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C813D1594F5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 17:29:37 +0100 (CET)
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1YPo-00029O-Sn
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 11:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1YOy-0001Xa-Uc
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:28:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1YOx-0001YG-Ti
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:28:44 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46346)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1YOx-0001W5-NO
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:28:43 -0500
Received: by mail-ot1-x343.google.com with SMTP id g64so10643289otb.13
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 08:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sBL1pdvCcbU5vh2MRuYeHAqsYDWdsnFmPWD7z1MAFS8=;
 b=SoHdSL0v6iKBaL8zgd+lCUElYoaXsAfUEXa9LewiooAA5sfD7WLzJr/zUAq9inb3HN
 g9KiANDepXgVQcQML6UQoWdxX/zCH7k5u/cQJb++myJJll2u1soQx+bX3bgsEogEyYwT
 o98FqckKC1IhQGCE3z3WZHOMPuGB8UU2meAF8cGqSkqAshTrVWdNtyg65J2bHeD0z3AG
 LH8pUj+bixTPli6OWfF6iNF+dspoPIks04pG2OV9Re/uPltKscvyX9FfW6qXZfK/hE4Q
 DwsGFLAMTwyXlci8q0KGniQs9daCRGj+ie2k3v81msJ7xmG5YCS5YkqCUHbx8lobeQuZ
 r3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sBL1pdvCcbU5vh2MRuYeHAqsYDWdsnFmPWD7z1MAFS8=;
 b=rijTK4vXoKveLt2wdXLmTOMJoPdUThvxDw+F79EJvRIqkgfkR9fxB9+YENH1jsgvrj
 RxwjK86cXJhqXHZUiLmOCyLEW9hz3AK/4xxIo0j4T/flUCxdm1xefr16/f6G1tQHTvi9
 WCsYuZ2IrGfs7I3EVvSE0Dnyrw2WOuasYzcHMby723jqchwXiD12FP+Tcg7rESJJLbdH
 e8mg7Fba1Tmx1JpkQJ2nFP3bHMIeaIRAuXCQTLbuunY2y1xLc/k+mWXN+LooHfjJ1CYg
 LKpfXIaTbIFQf1yix1bXgJSwucuYWSJpFasEvQ9U2/watwan0ZdwIGbrLLWNUZdL8ZW1
 PNAw==
X-Gm-Message-State: APjAAAV49O+t8vqkTzsciWM3pitZiyPT99w3gNyVsZhuZamYi3vIso/b
 S4KSG7wdMaSxpcb3VOqC5gvVSMKQtX9dCK5jvkO/dg==
X-Google-Smtp-Source: APXvYqwMDFOjjhVbQZtRmwikjYOZ3DieS0MB81Yf/FbcjGebMqahe3qweuGumfab9jxqW2C9ue8obJUgmNf0Y4w4xC8=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr5921019otd.91.1581438522842; 
 Tue, 11 Feb 2020 08:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20200130112510.15154-1-eric.auger@redhat.com>
 <20200130112510.15154-5-eric.auger@redhat.com>
In-Reply-To: <20200130112510.15154-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 16:28:32 +0000
Message-ID: <CAFEAcA_V3rT+C1FCPPyjmQ8svxF1tMWWOLgZ1Vn_CNQ3N0x-KA@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 4/9] arm: pmu: Check Required Event
 Support
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Andrew Jones <drjones@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Andre Przywara <andre.przywara@arm.com>,
 Andrew Murray <andrew.murray@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Jan 2020 at 11:25, Eric Auger <eric.auger@redhat.com> wrote:
>
> If event counters are implemented check the common events
> required by the PMUv3 are implemented.
>
> Some are unconditionally required (SW_INCR, CPU_CYCLES,
> either INST_RETIRED or INST_SPEC). Some others only are
> required if the implementation implements some other features.
>
> Check those wich are unconditionally required.
>
> This test currently fails on TCG as neither INST_RETIRED
> or INST_SPEC are supported.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>

> +static bool is_event_supported(uint32_t n, bool warn)
> +{
> +       uint64_t pmceid0 = read_sysreg(pmceid0_el0);
> +       uint64_t pmceid1 = read_sysreg_s(PMCEID1_EL0);
> +       bool supported;
> +       uint64_t reg;
> +
> +       /*
> +        * The low 32-bits of PMCEID0/1 respectly describe
> +        * event support for events 0-31/32-63. Their High
> +        * 32-bits describe support for extended events
> +        * starting at 0x4000, using the same split.
> +        */
> +       if (n >= 0x0  && n <= 0x3F)
> +               reg = (pmceid0 & 0xFFFFFFFF) | ((pmceid1 & 0xFFFFFFFF) << 32);
> +       else if  (n >= 0x4000 && n <= 0x403F)
> +               reg = (pmceid0 >> 32) | ((pmceid1 >> 32) << 32);
> +       else
> +               abort();
> +
> +       supported =  reg & (1UL << (n & 0x3F));
> +
> +       if (!supported && warn)
> +               report_info("event %d is not supported", n);

As with satisfy_prerequisites(), printing this with "0x%x"
would probably be more helpful to most users.

thanks
-- PMM

