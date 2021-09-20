Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C714111D9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 11:22:47 +0200 (CEST)
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSFVe-0008A6-7x
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 05:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSFTr-00076Y-E1
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:20:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSFTo-00052t-C7
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:20:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d21so27588168wra.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pIdRHTf/pSGwMu9aLUIdrE/3oBw2NfRPP2QAhyceEjA=;
 b=kAQsJ3EM18KWrs8d50yee4TJc/aFRA+BALda2/wkTcf0+08iL8zI1kln8T11CXEDJa
 /+xl/RsSQzuFN5mR4Ds5y7CVm1btngFkRM7oTmntsCcHMd+Qqew1DJw9xnPM8rHPcFmH
 Hgm/ZdurmMUxUqjGUythpoNo12W/rcAxEtAQvI0Cew4gqwT9LSSSOoT+nXdcpOAAFI31
 nFIqpgu21Nn5OWfErtnk0HUZ3o2JiaEIzZp7QwpOpHBLpUgJNRaHPSsLDZrmKBDZk7/H
 NE0X6Pkd12CtD+tkHp+TT59gTl5InESly9XRopRtYB6pBKE/ITI7nJdh3jO7Z78rNYe2
 RoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pIdRHTf/pSGwMu9aLUIdrE/3oBw2NfRPP2QAhyceEjA=;
 b=aNWogDpV5WZtQBlJLCrvkDTyRGvioVGKiI2pNNHiMIgLB9nXqrV8shELC19RYWqhPF
 rxcZ35/PXVTfmJlfCYJyvbljqUH8zehePddMOtLnYqMxU6d7CQZFbrUON7HyAVoaAsrO
 MJ4DnXy47Lm9VUi/FmaGFcwPtoyn3sEPiBayjCF4jkMl/rkKdSo71lFrGCWNxO0gaIgI
 9lYF/ernn8CsgOzpLGoxFyDmZl4eO6m6CiTPNht+An3TclPHutpDEWmGzT1Z9uIbMhXw
 IYZ+sw+v+emqnevEUuJI2glg94AoUagtg/cQmMWZ498JU0HFsMaYjArJVyS4c8qn9k29
 l/Tw==
X-Gm-Message-State: AOAM5308j2UeiYxiOsm+4N0C4n0cXq041SY6ZW+oLyPE6tIQwYMN3QXa
 yRM9iILaAqYQ6yJgdbPmXgaHx6byP0gDCJj3vD/qZg==
X-Google-Smtp-Source: ABdhPJwNUTWzaop5csYyK+TrfNqViQ3JO16jsScVL5Xg/09St1qZ6NJm5sgEpA06XNZzlN9HOrB/gZWhIYUxtVoVbyY=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr26747724wrq.263.1632129649764; 
 Mon, 20 Sep 2021 02:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-7-agraf@csgraf.de>
 <7e962ac1-57d3-7329-108e-99b06b46d4a1@amsat.org>
In-Reply-To: <7e962ac1-57d3-7329-108e-99b06b46d4a1@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 10:19:57 +0100
Message-ID: <CAFEAcA_vC0+BSGXYkzc69hx9f5A4xO133vv=ts+kNKyr0+KOQQ@mail.gmail.com>
Subject: Re: [PATCH v12 06/10] hvf: arm: Implement -cpu host
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 17:08, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 9/16/21 5:54 PM, Alexander Graf wrote:
> > Now that we have working system register sync, we push more target CPU
> > properties into the virtual machine. That might be useful in some
> > situations, but is not the typical case that users want.
> >
> > So let's add a -cpu host option that allows them to explicitly pass all
> > CPU capabilities of their host CPU into the guest.
> >
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > Reviewed-by: Sergio Lopez <slp@redhat.com>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > ---
>
> > diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
> > new file mode 100644
> > index 0000000000..603074a331
> > --- /dev/null
> > +++ b/target/arm/hvf_arm.h
> > @@ -0,0 +1,19 @@
> > +/*
> > + * QEMU Hypervisor.framework (HVF) support -- ARM specifics
> > + *
> > + * Copyright (c) 2021 Alexander Graf
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#ifndef QEMU_HVF_ARM_H
> > +#define QEMU_HVF_ARM_H
> > +
> > +#include "qemu/accel.h"
>
> This include shouldn't be necessary.

Yep, and we don't need to add it to any .c files, they all seem to
compile OK (on osx and Linux) without explicitly including this
anywhere. Since this is the only change needed to an otherwise
fully-reviewed patchset I'll just fold this change in locally.

-- PMM

