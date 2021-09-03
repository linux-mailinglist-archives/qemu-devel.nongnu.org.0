Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6C3FFFA8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 14:17:24 +0200 (CEST)
Received: from localhost ([::1]:52566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM88J-0006kT-TX
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 08:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM81e-0007cd-PE
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 08:10:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM81d-0000Xi-EF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 08:10:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x6so7901868wrv.13
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqszt8jNx5SH2lt7QhlW3d0HG941S174E5V0+QJAyYk=;
 b=E9cHtOU/+lwDaR7+6KJZS45eOTRp5H7WWcVXsBKKKCrcm4Yj1xYTgqoDoyeV7r9jOF
 2W5HR2uuqH3OR8/gmTsCUkx9Zajeo8HzPiWitf4ryXrV6XNNXHu5UhyRt8I1H9LgAfED
 GTC8TRVnqF/Y/7lk07q0JYfQCWNSOKsJ/OakTPbPpmSZCT3yMEDoeH3WCI2eUzFlSzyW
 fOZ7hxiSNs9bU9ZaZDYhUmlZtS+zuM/zzhxt5YXO1F8ktKtp065jS3mwgf2vExV+7Iik
 S4RxlGcZs4ek/T8EQq5UicKC9d/Mx4r0oLEaFxBNr1BV0r9cSpEfwyWqFoF2GiArejyW
 Tvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqszt8jNx5SH2lt7QhlW3d0HG941S174E5V0+QJAyYk=;
 b=Z31sx6kwnabwXenknPVhfThEK7b3+WHSZRp3VtwYQGghEMs/8WT5qAeyZCdO8vqNNC
 bSSaWFC8WnEDk8LdXzujhdqSPDONAT/+2eV3W3nTh6Zx16qnv5JpuSg9vxkIutPgHA/e
 CImEfJ2NOGc50+X1dLTknL8zjBJNnXOeo7otn73k938OBdLXSHDDU45HubUziNv+SJhc
 pZoU2iSWYeE+1csrxj/OvEoiYVxK3cu4IirVFxEXiC5U0FPTkGMdZNH3qDLFX7qkRkJ6
 OdUVE1/OYWTeH9WReqDmrjpreZgXbdR9Z5JMRG5o8ieTksmQrKnCQf07hR4cQCbKmgDI
 CknQ==
X-Gm-Message-State: AOAM532yT/bzJ86MK0HbsxAMoQVtv9pQEhwrXFD34l1vjxWsMOFbLOps
 GHv052sSeTbq6SO2AQp8YP2iZKmS5JN1Nz0MFywh/Q==
X-Google-Smtp-Source: ABdhPJxdsMWj+Cj9UJTRUfn/KVF/bnmVeAZflQd8oLiTjyEbqzSwQ9qIoorBrTD827LRMicnx6Cze5sKknx/eHj4e10=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr3567787wrr.376.1630671028025; 
 Fri, 03 Sep 2021 05:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-HC1=arh_4ysPv2L1JyT6sA9n_1aqJv__1Z7+09kYxiA@mail.gmail.com>
 <20210903120125.meyyevqxphhumubp@leviathan>
In-Reply-To: <20210903120125.meyyevqxphhumubp@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 13:09:39 +0100
Message-ID: <CAFEAcA_hD2Gw6f6VpKdo+VJF2-uDD=8WK0KOz6Muj14XgyitQg@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sept 2021 at 13:01, Leif Lindholm <leif@nuviainc.com> wrote:
> On Thu, Sep 02, 2021 at 13:51:26 +0100, Peter Maydell wrote:
> > How does guest software on this board figure out the memory
> > layout ? Is there a mechanism for telling it "this is version 2
> > of this board" ?
>
> Not currently. Aiming to look like most SBSA platforms, it is
> hard-wired, and firmware passes that information to the os.
>
> This is the kind of thing I eventually want to do using a PV-model
> SCP. As a stop-gap, we could push it through the DT, like we do for
> cpus and memory?

That's up to you, I guess. You could alternatively have some
sort of "board ID" register that the firmware reads ?

-- PMM

