Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E13BCABD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:48:27 +0200 (CEST)
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ics-0006Am-K4
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0hzt-0006fD-Kg
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:08:09 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0hzp-0005l2-G2
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:08:09 -0400
Received: by mail-ej1-x633.google.com with SMTP id v20so33261184eji.10
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOlb67vfGotO/7uzh0i1HEQgcMMLvcm6tP4ribZKyKw=;
 b=eqmL6FYL+m0C/+k8EmssmUXCYsn1nDq1z5akwnynmj5EE8JJNL0K0HCIi+ndRlAZ38
 dv2LU6tNXCNPHvszSc9A0LiOp89Rs0WrSzBsqoM27P5Ks4MJY9CM4qVw8g+ytm3a/F3f
 3BrizI0lxyYS7FzOqtiU0NwL5gZmUvv6nvdR7mIy3Os1iM5UiCThQj6s6ixpgzpfXM4i
 VfhfVeirp3vMQhgF2plFMhIiuPVutc9iZvfPFcJZhjTrbIku42MhZrf8gXmsSpbO31Tx
 IfzsWrW8ONuebKZjFUdKMK0mJW54Qulm2zSiil6XqU4HfyW4CVTCg1cjtD5E0Dnczmii
 ULgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOlb67vfGotO/7uzh0i1HEQgcMMLvcm6tP4ribZKyKw=;
 b=kYxv4UVKGoSRFAbvgWf386bjh265KPy5decPRd946ntNhG0ZQHSLuok/D/D4IkSlv8
 j9ZreRJHX8rgNBBlv7xMHLZMs1Kh0fC1xJjCpj7O6byKi1jvhWZIufZ/6Bq4EpIFzF0b
 0iZ2U0zZEjw2R82L6AXAhRncv4pTW+sLKRlBzDPPCIfF8p0NMXzDCgYrxpWFxy0DirFv
 XVHZCMS3+wn8YgtIp1ssdd5metVCEk2N+K94ELhngWJDnTp3GaBPn5+mk5sFVdca7NAs
 NHFYRzhT5EyDiHQ6JaSmxCVZk/aWq5WDbKufAD8r6z/Gj7+yyFaoZ/Yli8bS/8a2UvQt
 99Fg==
X-Gm-Message-State: AOAM533x2JmpnI4p0YRcoLvi927pe8kJwzjudorkUqnW5a9he/KyalEg
 TnIslhVm+FjokFo9O1OV8wwyaiO/uSq988zM6fXGsA==
X-Google-Smtp-Source: ABdhPJwg53RNpi16G4nfK7oCYyy9JY4rkkOobgdskDUwaN/Sv7iQSae7j5hbV1yWvk9SMfqXVAbkCN3H7uZHcAJA7/A=
X-Received: by 2002:a17:907:9701:: with SMTP id
 jg1mr6477968ejc.56.1625566083232; 
 Tue, 06 Jul 2021 03:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
 <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
 <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
 <7a9b8b4a-537d-c302-b7d1-40d26e95a8c5@redhat.com>
In-Reply-To: <7a9b8b4a-537d-c302-b7d1-40d26e95a8c5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jul 2021 11:07:24 +0100
Message-ID: <CAFEAcA_T2TBaNhUHf+68NEHK-v93b6BxqOgzCi-OQxB-nvMB1Q@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Eric Auger <eauger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Jul 2021 at 11:04, Eric Auger <eauger@redhat.com> wrote:
>
> Hi Shashi, Peter,
>
> On 7/6/21 5:25 AM, shashi.mallela@linaro.org wrote:
> > On Mon, 2021-07-05 at 20:47 -0400, shashi.mallela@linaro.org wrote:
> >> On Mon, 2021-07-05 at 15:54 +0100, Peter Maydell wrote:
> >>> I missed this the first time around, but I don't think this is
> >>> right.
> >>> Different CPUs could have different GICR_PROPBASER values, so
> >>> checking
> >>> against just one of them is wrong.
>
> "5.1.1 LPI configuration tables" says
>
> "
> It is IMPLEMENTATION DEFINED whether GICR_PROPBASER can be set to
> different values on different
> Redistributors. GICR_TYPER.CommonLPIAff indicates which Redistributors
> must have GICR_PROPBASER set
> to the same value whenever GICR_CTLR.EnableLPIs == 1.
> "
>
> So we can choose to set CommonLPIAff to 0 if we do not need to emulate
> everything. This is what KVM does

We could choose to do that, but as it happens we don't.
And as far as I can tell from the spec we should not be looking
at GICR_PROPBASER at all here anyway.

thanks
-- PMM

