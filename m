Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CFD36F853
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:11:47 +0200 (CEST)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQ7f-00083C-0q
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQ6I-0007Sy-JJ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:10:22 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQ6F-0003fG-GC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:10:22 -0400
Received: by mail-ej1-x62b.google.com with SMTP id w3so104448120ejc.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+RCmHzIM+Ky487r6vtrtuO5U07tnTRET80SM5/e2X4=;
 b=Dr6ePxGLHN//G+MuBRjGjY46OcFtq+cujBA3t24W25skYUPCgFsaHCqIz71lJUw5X9
 wS2JUUHcSZ2Cr+hRrqXdJla5ob5pA+9tVyYeefmPQUZLiTOs/nnewgZQ4wCrUfnZQtuE
 8K8scX46iSIfun7vwb4cdd0Ky5jmrnk/vlfeAdK6BgGpKcEvxzt6Nrswf/33If0P9SQ2
 x7mdINNS4ShiV3X4i4m3iB5HFlqp2HNSTxLIykCfp5uCgK+5rZoK+g27aKIVsK6GAHpl
 9MLB6ySS9/7bidyp4vhruciPflJPv7auelwzzGhuetfTWEj1dQMJhwGnBk2+UlKfN80l
 3iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+RCmHzIM+Ky487r6vtrtuO5U07tnTRET80SM5/e2X4=;
 b=mWbticSzjsWd97IzBW2oXyrRgB5Td66sVErs0lgKW4qFVpkHcPYgbIauZyD2dE0X65
 ZGJAtx5opx02RmgoOHtfmF/TwSEsx05KsBpjfvzr+6vTDLEt7Og5LHyi55rVnTeoHfb8
 lKMivB/jsaMMXODK/N8NPCwsjNvAXW3qll+MotVTE7MwV8+GKOlL82hjQWuktJSp9jOr
 6SJ4P10D4/oyDzO1y2W/WZAfjvFhWSqEze8MDgrPK/odjTNe+mcvD/EYfzsGQSJ207QO
 3B3ZgtnpjATZU3TIHj8xUbtu1AlztWbTYDr9rPzleW79uQ+iIJvXPRGOG066Bg3NkxVn
 MnCg==
X-Gm-Message-State: AOAM532ZiwU2qoPCyWpXKJiiEMlqTUqyrt+GLnGSwgiyRYjpFj0zse2I
 snej7dq6nraizNgITi29bVjoSbg6C0KkilR2ihEb7Q==
X-Google-Smtp-Source: ABdhPJzTKMPw9kN9KJ+knpzPAx6tzocIn06CfoZy6CoQk6WwL2o463NWin1IUsH1NOYwvDksM6aIJgmhb4rQFsLuSNo=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr3438649ejb.382.1619777416803; 
 Fri, 30 Apr 2021 03:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-2-shashi.mallela@linaro.org>
 <CAFEAcA8OCs-sL1Zu-PwkadTvto3pJWO8VLcxfqmH7JGHXdeQuw@mail.gmail.com>
 <6e91d0458e38b4e782dc8e61de3ee0f875f8a56a.camel@linaro.org>
In-Reply-To: <6e91d0458e38b4e782dc8e61de3ee0f875f8a56a.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 11:09:15 +0100
Message-ID: <CAFEAcA8EXUu8nfqz2Xn_Rke4Nk+cvdOuZOoFSfGkN6FFeTJ=yQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 00:36, <shashi.mallela@linaro.org> wrote:
>
> On Fri, 2021-04-16 at 18:21 +0100, Peter Maydell wrote:
> > On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <
> > shashi.mallela@linaro.org> wrote:
> > > +#define GITS_PIDR2       0xFFE8
> >
> > You probably don't want an offset for GITS_PIDR2 specifically.
> > Compare handling of GICD_IDREGS in the distributor emulation.
> > Tried re-using the GICD_IDREGS offset for GITS_PIDR2,but from testing
> > observed that the linux kernel driver and kvm-unit-tests both relied
> > on using the 0xFFE8 offset instead of 0xFFD0 (used by GICD & GICR) to
> > complete ITS initialization and setup

I didn't mean "just put PIDR2 at the GICD_IDREGS offset", which
obviously won't work, I meant "implement the whole set of ID registers
(of which PIDR2 is one in the middle) in the same way we implement that
set on the other GIC components".

-- PMM

