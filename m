Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76365794
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 15:04:54 +0200 (CEST)
Received: from localhost ([::1]:41596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlYko-00064J-6M
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 09:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34241)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hlYii-0003I0-El
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:02:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hlYih-0000Rk-2L
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:02:44 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38007)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hlYig-0000RW-Rd
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:02:42 -0400
Received: by mail-ot1-x341.google.com with SMTP id d17so5749102oth.5
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 06:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TELAib9fm3I39Fgu/vUwqt23pIiBDwdo7bpmfDjeHYo=;
 b=n/RBiikCONDX//wZrkpTdxjZOTxiEbEfhWJdbbr6rRwbUp2qcRcTAPuKL7/mh8yAE1
 6UK9HrwyhBKJTIYNU8RUAj4BTf2mjBa0xEXJaHUfeRysiYrxG/sZg1qvj5rv8r69Gp+U
 2BEVT+KYu3bxkbZLK4J4VXziO+vsrkl2Cn4li01xyTSQXQ9e2nVFiZHYPU3taRN6rWqa
 ZCtV1QY0vgt4VAHu66Q/O4/Fq6gX/TZ4Khai5ecqI8SWgjGvzbePuG5UvuaRzYrpwUcA
 jKwZHcIlVmPL8pgTJ+CBHbQ2Q6loYAarErbR8nTqZMnwRfOVMRMF4Ik7ube/aO/kJYET
 2Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TELAib9fm3I39Fgu/vUwqt23pIiBDwdo7bpmfDjeHYo=;
 b=gXKuaIfvWJeQuvZoaC37D2tiQkYLp5tobTxfGw4JFzDgaqebzbMhFq3Q5znd0ciLXA
 6k/ZcpK2KOIB4psHBYxbLd/xnNNGQSDglX1S5+I2yY5eT2QxOOn1MkX/KmxS53eATfle
 ABbE71erS0uMfUvFrQLE++kznOTLsMVdmiKVFpSAWrIA9kyOUJNMZrBBB/3gZUzI9fLg
 qISZVBMsUxemA6QWNUpewSDGPMHeO7r5LCzH98vgMegEF4zjpjfxISwfhsYjiA0SIA20
 WJqKfbgG49mr4wveKQHZ3aLxUeRbBw45K3wkC2nwD6nyd5+dPcFrj4VLDkL6Uo/mhtol
 ap5A==
X-Gm-Message-State: APjAAAVe3N5NP0eUgXJGA6393WROKiF1wYeAcIAGy0Vmv/bIe6k294B3
 c5G4CSgMWaZuBh/UWEKxY9xvz7wU43bB6+UENWIaRA==
X-Google-Smtp-Source: APXvYqweQJIrxUF4zMH0Lgdy9vyg9JITX68zRrHxTpt+kGR++9YdltJjl03//x/W7F/VzZvpIAc90q8oB7PCUXOgJnY=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr3371190oti.91.1562850162217; 
 Thu, 11 Jul 2019 06:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190711121231.3601-1-peter.maydell@linaro.org>
 <87d0igendr.fsf@zen.linaroharston>
In-Reply-To: <87d0igendr.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 14:02:31 +0100
Message-ID: <CAFEAcA8KsVmsP6oAXC9n=jbO+NDvHusWPnGhMCo+25Q7_nCcpw@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH for-4.1] target/arm: Set VFP-related MVFR0
 fields for arm926 and arm1026
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Jul 2019 at 14:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The ARMv5 architecture didn't specify detailed per-feature ID
> > registers. Now that we're using the MVFR0 register fields to
> > gate the existence of VFP instructions, we need to set up
> > the correct values in the cpu->isar structure so that we still
> > provide an FPU to the guest.
> >
> > This fixes a regression in the arm926 and arm1026 CPUs, which
> > are the only ones that both have VFP and are ARMv5 or earlier.
> > This regression was introduced by the VFP refactoring, and more
> > specifically by commits 1120827fa182f0e76 and 266bd25c485597c,
> > which accidentally disabled VFP short-vector support and
> > double-precision support on these CPUs.
> >
> > Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Fixes: 1120827fa182f0e
> > Fixes: 266bd25c485597c
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1836192
> > ---
> > I've followed the existing approach we used for ISAR1 here
> > of just filling in the fields we care about, rather than trying
> > to set the entire register value.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Do you think we have caught them all now? If we end up removing the
> other ARM_FEATURE_foo flags in favour of isar tests we shall have to be
> careful not to re-introduce these sort of bugs.

I checked that these were the only two extra ID-reg checks we
added as part of the VFP conversion, at any rate (ignoring
the checks for features the ARMv5 cores don't have).

thanks
-- PMM

