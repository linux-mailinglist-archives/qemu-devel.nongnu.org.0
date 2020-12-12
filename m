Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073C52D8A00
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 21:44:01 +0100 (CET)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koBkF-0005ST-Ll
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 15:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koAz9-0003La-EY
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 14:55:20 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:40188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koAz3-0003T8-Lg
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 14:55:18 -0500
Received: by mail-ed1-x542.google.com with SMTP id h16so13010215edt.7
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 11:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=voJUuKI8fbo4hD8f3ARSw6PMKlBVh69Mk7Hywd4S7Ho=;
 b=ZGIl3aQha+5yGpzP2yLNe3Fdu9RU+OxED6FQrkXO8LGg+sozrXFZ45Hua673NNwHL4
 OKbF6ESpXo1flN8iwT/LaZNGfVV893wqRwtdojNqY1T/a4tQvFjL/esIErRMSDgIr5i5
 TAC1WVtWa5kMbJa48hbmGJiFRX76MdQWZBuynIa+MHRqEaBzbbZq0pj2aFWtRuY6OzPR
 Og+eCLaRHgqUj8jm4VziU2EbgdPyhS5Zl5iemHCoeUAhLVOjlzIHjgZe1a+SOu1oVvbc
 xQYlpGimKMXhtXE40SwEnvPd/rFuQ5HQKWt8gF3x94dOtzjWX6XKdxIsAxEFkxaIXDHf
 04dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=voJUuKI8fbo4hD8f3ARSw6PMKlBVh69Mk7Hywd4S7Ho=;
 b=hwGQFykRpAmKMAT4SZTx4Y1WXjRP+tcKdEkTqkgF+KBX57h5cPLUOiu8j+EfqYRYP5
 1fru96vhB/dfAyaGp26XQoNoYROtt/M9vQSPUngLfxkr/TZooeRy2r3YAlY8OnvE2FPY
 UQJeSRkKBems8uCul5PAfUufvnNhKGzRVMxhXDvy7oiEMPybGsktf9BPn6w+jIeyVzBh
 6sBvQNiKSKqaoI9mIgbN5eSxOZO3YCzyCiXyFje+5+lnzGUULGO97d0YNLUbz03OKD1o
 LTIyR5+r3lSFsq1OgCJFdXu2nLi08NV+jht1fMxF+HMgDtQvNCVHi/b1Vdh2Yl7qJ70e
 yt/A==
X-Gm-Message-State: AOAM533oNg+fNwrTSv5O70cFUF+2Gf86JSG12ik/cy76cA/Fyo8xMMrs
 IlcrfSEgQ+GqGeeQR1q4mzDB/clj7/KLxHASb9zK4cimNeU=
X-Google-Smtp-Source: ABdhPJxNkaaDTJYLDGQfUSpohRl7zvnQH/RdutsE248fsxYtHTOSGkmAhQMcznbQfep+/M50QMu4p1O+grZY/l3FEjY=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr17790373edr.204.1607802912008; 
 Sat, 12 Dec 2020 11:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-6-peter.maydell@linaro.org>
 <c092a552-abbc-1eb9-685-d389fcd0176c@eik.bme.hu>
In-Reply-To: <c092a552-abbc-1eb9-685-d389fcd0176c@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Dec 2020 19:55:01 +0000
Message-ID: <CAFEAcA9QJUFhU4E9J9Peb1r6OxmNzO=A5oP3ApwfsW9xsq1-Aw@mail.gmail.com>
Subject: Re: [PATCH 5/8] hw/ppc/sam460ex: Drop use of ppcuic_init()
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Dec 2020 at 19:53, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Sat, 12 Dec 2020, Peter Maydell wrote:
> > Switch the sam460ex board to directly creating and configuring the
> > UIC, rather than doing it via the old ppcuic_init() helper function.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > hw/ppc/sam460ex.c | 70 ++++++++++++++++++++++++++++++++++++-----------
> > 1 file changed, 54 insertions(+), 16 deletions(-)

> > +        if (i == 0) {
> > +            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
> > +                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> > +            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
> > +                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
> > +        } else {
> > +            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
> > +                               qdev_get_gpio_in(uic[0], input_ints[i]));
> > +            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
>
> OK got it, there's a typo here, this one should be CINT, with that it
> seems to work better.

Oops, yes. Thanks for taking the time to find my bug, I appreciate it.

-- PMM

