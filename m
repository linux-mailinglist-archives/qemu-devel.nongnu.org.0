Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9F4B3651
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 17:18:46 +0100 (CET)
Received: from localhost ([::1]:35114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIv6j-0005JP-G1
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 11:18:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIv5J-0004CA-24
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 11:17:17 -0500
Received: from [2a00:1450:4864:20::32a] (port=35531
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIv5D-0006P9-97
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 11:17:13 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so9082187wml.0
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 08:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KHHFJ/uCa2258VKMSgv9gCe0YKoJ+pqL34OJXCg+0hc=;
 b=e/AFzahEsRac3JfxrphYwesmXcGU5jgqXR1S3/oajaXUGy2uSqKLWXn8xGlkFYfI2j
 o6YuLpiiZdiwnaRJ0vThynpopiAXQ/EhqRkZ2RJtYty3Cbce/ahM5YeagWOAI9x7G4jt
 Jb9+HkaXPZg0ju3YkjtX3IQot0uIQ5WLWkyzrs8oBC9IU9+UiN6mDMKn9Y+3RGAirOU1
 1cr/Cm1xNT2hmJAXGoX7mNrnu7UlX4qD1qw1MsSQ7dJz5bmw4vrMryV+4vLHRHwPA+hR
 DJcY4I7xgBUnt6SO/h4IdfEFZ7OGDMIL7KuYDo6Owctq+4J5vfRj+wFIYhk46S9VVox/
 A35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KHHFJ/uCa2258VKMSgv9gCe0YKoJ+pqL34OJXCg+0hc=;
 b=om1Qf33xbGNGoKi6dU1D83OPYldLqEyrGuW+4Lpm5tr2pehBJVeMSsSWrRj3iqbGY9
 lB/Ugg4eWLUknnoLASUosm8B63XQOv1AgaTkHWboy7ipaPUkojzilpiq6M9xvHQ2mbkb
 M5YCT/O2uSDXf/fjWCtA3xK+Znv3U2lzHxMnZ/DzOhp+0ve6+MRmxoRXGmG7ed1q9zlm
 wycoGHCzCu0bEff7CYg0qGIjw8xeMupkfdwMpkFid6O2MiTmqSzq1eF8MczaG753T0D7
 ClYUzczYNXKX9aXU+l0BudNBGLfN6TrQGv12IBRRMVF0luaxia7D7LnPmGIj6/xHhIKA
 JTyA==
X-Gm-Message-State: AOAM532tjWYXbCu9zhEi7jeDdqDx4uXzpkO1THiYDEfjI8b70FHsa/7e
 9gf3EsPGVUIHODz6aRnxFV8QYBTlkkTEglrvquzPaQ==
X-Google-Smtp-Source: ABdhPJwZA5yQG3Oiy2xxExmgl17T66dACOgRDnZq2GIYHQQc3/NNv4whwuNDS45NPciXW1NQf6s8UMIe3SlFoOwggyI=
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr4794546wmq.126.1644682627125; 
 Sat, 12 Feb 2022 08:17:07 -0800 (PST)
MIME-Version: 1.0
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-3-shentey@gmail.com>
 <d6e47199-343e-46c0-d44f-64bc8d6e8385@eik.bme.hu>
In-Reply-To: <d6e47199-343e-46c0-d44f-64bc8d6e8385@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Feb 2022 16:16:55 +0000
Message-ID: <CAFEAcA_Qj4TT0K5hayf5j3m7Ctp=rBVs=FeMKSBELjny7zsZgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pci: Always pass own DeviceState to
 pci_map_irq_fn's
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 "open list:ppc4xx" <qemu-ppc@nongnu.org>, Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Feb 2022 at 13:27, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Sat, 12 Feb 2022, Bernhard Beschow wrote:
> > Passing own DeviceState rather than just the IRQs allows for resolving
> > global variables.
>
> Do you mean pci_set_irq_fn instead of pci_map_irq_fn in the patch title?
>
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > hw/isa/piix4.c          | 6 +++---
> > hw/pci-host/sh_pci.c    | 6 +++---
> > hw/pci-host/versatile.c | 6 +++---
> > hw/ppc/ppc440_pcix.c    | 6 +++---
> > hw/ppc/ppc4xx_pci.c     | 6 +++---
> > 5 files changed, 15 insertions(+), 15 deletions(-)
>
> You don't seem to change any global function definition that reqires this
> change in all these devices so why can't these decide on their own what
> their preferred opaque data is for their set irq function and only change
> piix4? Am I missing something?

Yeah, we don't necessarily need to change all these devices,
but I think this is an area where over time we're shifting from
an older school of API design that was "we have some basically
standalone functions that take an arbitrary opaque pointer"
towards a more object-oriented design, where the opaque pointer
should probably be the pointer-to-this-object unless there's a good
reason why it needs to be something else[*], because having a function
that's part of a device being passed something other than the
device-instance pointer is a bit unexpected.

In some cases there is a good reason for opaque pointers for
function callbacks to be something else, because passing in the
device pointer would make the code noticeably more complicated.
But in the specific cases here, the only change is that the
callback functions use "s->somearray[i]" instead of
"an_argument[i]", which doesn't seem to me like a significant
complexity change.

thanks
-- PMM

