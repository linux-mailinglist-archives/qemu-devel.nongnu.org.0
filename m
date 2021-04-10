Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7C035AEC9
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 17:18:06 +0200 (CEST)
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVFN7-0005uc-9u
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 11:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVFLO-0005Qv-H1
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 11:16:18 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVFLM-0000V5-Le
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 11:16:18 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w23so9886099edx.7
 for <qemu-devel@nongnu.org>; Sat, 10 Apr 2021 08:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HJd3Eo4uWc/wrXwLXLN2+q5ZPyNGInFCPTrmmQy9K6Q=;
 b=uRYeF0k3XDIZy3+0Ss9r7fSgGm8fMCF60xDi9TFVVwAtrE+tPpA9TMnnoCA8qWz886
 G5hYQU3S982Lcc7pwakyPfIiND9kGLPescKGttmmiHmfwMYTlQHoDC5Qg2nkeSuXBLNv
 V2Qm8rv9SHcBuHpaxu/yj26JXdxnITCLDNwlRKTBMPtviuhvgaWOi2CapZoM2hlRI0Dk
 p8fjnaAl9zzadzkI1HwHiBxHtXiUz6Z9kcwfpZCqwJlC8lFG4kiGPw4QNyufOUaasI3W
 lfqBsrphRzB+GUjtDC5MgT9Y106E7ZmMM5As+6skm99/S9eXrQNXE5Ht9tb21a695at7
 djrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HJd3Eo4uWc/wrXwLXLN2+q5ZPyNGInFCPTrmmQy9K6Q=;
 b=CdBVqvlrT7gKqHuE7JyyaaMlEcq8Dqnk2to/YihAsODsjvHB0Lkd8MhBs5hBVYP7wB
 outuZGW2XcFBEIYKF6Ta7NfPbnVxWAZezG7jwoPwW5YCyQgN3NN0XXjZ3UGilsnbYM/y
 +rLOmRqgIghBOaJs3RFcZJr5mIS62I34KCX7IZsiBtUsado02sH8U3B/HCrPEgqGbK+J
 qZWXGVz8ZYIuJSNzTjPgnzfE0HO6oio5GRPHsR3t00+S8se5JrUCpkJpsD8OKMUNX4KV
 bbUEnOX164e3Crt5hOZgRh8sCpc/NasqNcig+mt5zvnwG548/R8iMtcHe2RhvH7vMhgu
 dI7Q==
X-Gm-Message-State: AOAM532OkTPIFKvKQrbN7W1YItGaPPZWPk61nCRbmxOf3mR1T6NA/PN0
 PIC41Fmq7Nrp+7ZrN5nByWdh2gPL2M7mNL+pitwCTQ==
X-Google-Smtp-Source: ABdhPJwBWkeSj2i8JV5BPkK2bF+4GhPG/AQk+7E0gaGc7ZpPpu/09wnQtIFtDHtRfDW3grFxIHe4moMsWJLw1VGo0XU=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr21971655edt.36.1618067774406; 
 Sat, 10 Apr 2021 08:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
In-Reply-To: <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Apr 2021 16:15:31 +0100
Message-ID: <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Apr 2021 at 14:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Luc,
>
> On 4/10/21 3:19 PM, Luc Michel wrote:
> > Note that clock propagation during reset has always been a complicated
> > problem. Calling clock_propagate is forbidden during the reset's enter
> > phase because of the side effects it can introduce.
>
> Ah... Maybe this is related to the generic reset problem in QEMU :(

I do wonder if we got the clock-propagation-during-reset part of this
wrong -- it seemed right to me at the time but trying to use the
clock API recently I did run into some unhelpful-seeming results
(I forget the details now, though).

> > I find your API modification a bit restrictive. I think creating a
> > standalone clock can be useful, e.g. in complicated devices that may
> > want to use internal "intermediate" clocks. I would not remove this
> > possibility to the API users.
>
> Well, this is the point. I can't see a justification to have a clock
> on a non-qdev object. We should be able to model complicated devices
> with qdev.

The obvious reason is that machine objects are not qdev devices (ie
TYPE_MACHINE inherits directly from TYPE_OBJECT, not from TYPE_DEVICE),
but it's a reasonable thing to say "this machine has a fixed frequency
clock which it connects to the SoC".

I do wonder if the right fix to that would be to make TYPE_MACHINE
be a subtype of TYPE_DEVICE, though -- machines not being subtypes
of device has other annoying effects, like their not having reset
methods or being able to register vmstate structs. There might be
some unanticipated side effects of making that change, though.

thanks
-- PMM

