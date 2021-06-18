Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE983ACE3A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:04:27 +0200 (CEST)
Received: from localhost ([::1]:55284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luG2k-0007Fw-5p
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luG0l-0005Wn-4g
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:02:23 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luG0b-0008JM-EZ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:02:22 -0400
Received: by mail-ed1-x52d.google.com with SMTP id n20so9064421edv.8
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bxMjk+2+cPzGxh72Db4vUGtuWMXV+M2dXsGgEwXfBAM=;
 b=rrYsh2XhGDdwMY2TXuPSIA/a05AQAmeWDDYoU5rQhf45reRw4+ukMboFn837xkvyHQ
 uS8zgFbfHvCifHOnlxHpHz9gU9SO2fbe5rVHhzLjkOTIaQJweXzQeUCdKEN278JHil7L
 haO7UoOmROzO46vD0sQ3QepgXxUWYjmwJuz4NbLHsOyy0lKzzCFNpd3CYbQR5/cA3KD1
 3Sv1wO/fE+Ig/jCnVJk11pXYHSBAaqrY3GdAgwHs2SWa1V5LT2teL/eJDEVMISqU7iUb
 kEi2yXyt6FOHcAB4kINke4Q9DPl24FYmmj2A9uI6g0hi4S82DL0xmLzo3T65belP14jw
 qX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxMjk+2+cPzGxh72Db4vUGtuWMXV+M2dXsGgEwXfBAM=;
 b=oSIl0ZAADQkU7txjeSBVEp4QnR9NbfFJnYVWt+3lLpukFxmec/IBeOIrU81bDV7wTX
 F7hup2tQOjM14sESRk8pWYCzGRSnk1yUPeg6tCHJAGvA1M7ng7jlcecsZUbaEfAGXp5X
 /O94t189VclBNMv0O1MNnf6RGNZnYAoeiP3N/u6CDIrYETLHb9/Cbx4FikdaKAzUTzUV
 Ebk8+LLkjyJrvHxOUzGxGLjH2qks3UKYR+LO0sjSbONPCpswkBRQhHnDfICzxdBi+rAU
 hkGUEfUVgCMCh/u+Ep52OZ/HdfxNAivJjhLCBgfwm9gw25ESCYCm/qNwrbueSFIzOH62
 Eu/A==
X-Gm-Message-State: AOAM5322lMeDvYnnDGk8nZB7WizDJRyGDg914VwF+sDmrd1962XEauZi
 EjPGA+8itwxOcV4t7OrywbyidYWVXGd2x6WyhD5NaQ==
X-Google-Smtp-Source: ABdhPJxB3dX9S//I2PkxMJPIOPzHDkLvRZEUPzeEkYfrkBb+y81RzxRvBsiR4BLYooK4U79SlHQqmxe0FX1/Vm4I9Lc=
X-Received: by 2002:a05:6402:220d:: with SMTP id
 cq13mr5510073edb.52.1624028531492; 
 Fri, 18 Jun 2021 08:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210615165800.23265-1-alex.bennee@linaro.org>
 <20210615165800.23265-2-alex.bennee@linaro.org>
 <CAFEAcA8t8q8pJNOOYK-zkDtME7hOWfXVUj3+HLVMRkFzY6Ei1g@mail.gmail.com>
 <CAFEAcA-OtgCRHPayXBsVZ64mqP7-aJj8+TV4rrLTE6Jh8JcgXA@mail.gmail.com>
In-Reply-To: <CAFEAcA-OtgCRHPayXBsVZ64mqP7-aJj8+TV4rrLTE6Jh8JcgXA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jun 2021 16:01:35 +0100
Message-ID: <CAFEAcA_AShKbP4dD2S+15way4JVB_+oiV+nCOHPqLNu0mot3Ew@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Andrew Strauss <astrauss11@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 11:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 17 Jun 2021 at 20:22, Peter Maydell <peter.maydell@linaro.org> wrote:
> > This will pick the first MR it finds that happens to be RAM (which
> > could be some tiny thing). You don't want that, you want specifically
> > whatever the board decided was the system RAM, which is the MemoryRegion
> > MachineState::ram.
>
> As a concrete example, on the mps3-an547 machine this code finds
> the 512KB ITCM at 0x0 rather than the much more useful 2GB DRAM
> at 0x6000_0000...

Turns out that "look for MachineState::ram" won't find you the
2GB DRAM, though, because it's lurking behind a Memory Protection
Controller so it doesn't appear directly in the flatview.
Not sure what to do about that -- maybe we should forget about
MachineState::ram and just go for "largest RAM we can see" ?
Trying to get this code to be able to 'look through' IOMMUs sounds
like it would be massively painful.

-- PMM

