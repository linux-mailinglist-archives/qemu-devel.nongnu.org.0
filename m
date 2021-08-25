Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BBA3F7CE2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 21:56:15 +0200 (CEST)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIz0Q-0007nj-49
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 15:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIyz0-0005GL-Jo
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:54:46 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIyyx-0008Gm-Nh
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:54:46 -0400
Received: by mail-ed1-x529.google.com with SMTP id i6so884539edu.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 12:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6yvfS5yar2rK96RohgMFOO24sjLGzS4ajH56xHXtDXs=;
 b=tJPsqqeBhiO4njbw352Aot/GdqqqIjuQ1jRJOeWhRqUomXrIKSEer7KgDrSfXbgIiU
 oh9la0WV5HcC5+tJvK5LD261eyNNW3Ci9wODYwWV4jp4h33UiYHkjJKN2ZnFpglujl1t
 jr1wf0AFoehiRDYTW4qzY9LjoEy0MIcQRe3TYSngbZH4U7jrkprtxlkLJoBA9HaRDAXA
 54wFE+WHhdsbLxCZ3G7MefucmcXWJqE95pM0nyRnTlgzKEd4tDnk3V9R9f659muDmpDZ
 cLyIPxCx7T9qib032qh03AezWEF8F5/FU1n7G3mpu+ovqAXFRWT0zBYQauFqqumZPjd7
 4Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6yvfS5yar2rK96RohgMFOO24sjLGzS4ajH56xHXtDXs=;
 b=Gf40oCVOAOwCgqSVh64t3cDBHg40wSX3nX5TQFnRyrrm+k6hL4aoC6MDEenBNLeRtQ
 4/rOMJs1zIsvBVe2A9mEeXJubuyqHt+V9RuGhGWraEfsHPZIPkpfhHoAhGu2qKBAZ/VI
 goefqJ9a2m2iC8d5Cd1X/pSTwuFBCbDIAw/Le90qJCpsJnYmJ1OsxEii4K5iBCLX4bVi
 j4D9dSm3V/W1x+NveiV+f2+KuO/lDYg4ET7psfsXAbTLVuzDIIx3CLavw3oj8Xqj0/Ln
 C0FD+iy1YduZUcSCdxp5g6zuLGKxTl16AmsgBzXFcNer7nwOSkVClOnuAXBXH0KHY6ae
 Y9Mw==
X-Gm-Message-State: AOAM5317ILuu+x0g+G6O+nj38sMeXsVWy8OS2szYPQZlfgYBX41FmzLB
 bv729MgTTUYxGWSxHCb/MscNZBg1Obb4UMKFNCtyzg==
X-Google-Smtp-Source: ABdhPJwtbCiVWStMxBsFOCQvWyUhIhHYv1juCLuJjy1G2vUVCYVTLkQcdmS2m3zvNV+x1VOuCZZaibifIB2mdsogrIY=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr270466edu.100.1629921281740;
 Wed, 25 Aug 2021 12:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
 <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
 <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
 <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
 <CAM2a4uxp29QKMaLFOseS5dHRNuooVY6sghzD22NEtGE=3g5wVA@mail.gmail.com>
In-Reply-To: <CAM2a4uxp29QKMaLFOseS5dHRNuooVY6sghzD22NEtGE=3g5wVA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Aug 2021 20:53:54 +0100
Message-ID: <CAFEAcA_eQrd+Hiky+tUZSoNDkcmz5MwpM2=2RQp-gnCDTV4wvw@mail.gmail.com>
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: Gautam Bhat <mindentropy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 at 20:03, Gautam Bhat <mindentropy@gmail.com> wrote:
> I am trying to emulate the TI MSP430 microcontroller.

The MSP430 is a custom 16-bit architecture. We don't have an
emulation of that kind of CPU. If you're mostly doing this to look
at how QEMU's device emulation is implemented, you should probably
pick something based on an architecture that we already have an
emulation for (ie where there is a target/$whatever). If you're
doing this specifically because you want to look at how a
target frontend for a new architecture works, have fun, I guess.

thanks
-- PMM

