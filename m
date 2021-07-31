Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904593DC825
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 22:34:31 +0200 (CEST)
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9vgk-0003dd-94
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 16:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9vg2-0002y1-80
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 16:33:46 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9vg0-0001yL-Kz
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 16:33:45 -0400
Received: by mail-ej1-x62b.google.com with SMTP id e19so23686519ejs.9
 for <qemu-devel@nongnu.org>; Sat, 31 Jul 2021 13:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k1eUMH6eBtWoEJzBQ8AcBLa8vRlNRzFtozK0twJ5v7k=;
 b=UyLeneRNUjPJhQhe12BBcKDpbpunUBG+xqYrzgWf7MqthP2MurZ1TnCJ+ErgO762Jb
 nioJN3iwIHs2YGWzG+3qj32ZxpWEy4LXvbiTUHmjhD1sBQq4ngig+y1b6p05PRh4PMxG
 yIhAVeViMlYUG82naIK54muabmE9bCktqQ9IFuJ2+recuyIUSsnHowXFLgjakGdyIIea
 48IVJ3/qq/sl2nlGJ+qjVOBT4YcWmAQMemT1dAQGl6NxB+IaEmxnTWtuNjpkJGMUj2kb
 QuIsmZn40V8qgNMvZ9/M+8k0Up4QRMvLMkhXR/iQRAEG3DugXifHzYfRsfPVY6kVb/tL
 bqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k1eUMH6eBtWoEJzBQ8AcBLa8vRlNRzFtozK0twJ5v7k=;
 b=Cfqc82BzhpE9Ep+8JuhP/VND3nNZSh+aeu/MRIxprvm8HeqmAYddW+jII03gN2ZigG
 2kUwxjB+h3xUQc5aqiMBOgTeM4xpU2Vkqltd/tpm1Z9/pjz/FDnG29gfl4WTLM60RE3K
 qgcbmZTFlT1NuiEBIJPQe7aP42vIBuEeSBaqH8h52CBjKmxDA5gJsBJy/ZC6OY7mzluC
 2RdpB3gwW5SJGOl/PNagmwi0zhoVOgfGPlJjb0qeyV4nkE3Ir8y+Ewn+LeW5LxwIinpN
 +OALHZJ3zucTx6lqfVIUw9Q7r5nwVir+HVk/ZrENGNGpL0rwI92MJ74XvVbex3If3DqM
 8Y9A==
X-Gm-Message-State: AOAM531tmn8JZ1EA+uHRG35luOXC0g5djTa4Uh6rgvT9RDcuCoBJP9Or
 4DXfAyhXcmeIHAmKMotW9BD4WMANYXWxrbWweaiq0g==
X-Google-Smtp-Source: ABdhPJwSGDlkLLtGx+Y6sYg+ygE1OlSu3Q53HinfiYQirmTagH7eh9X4UGHBfoUFYkmOwXAV1FfggxMXxN9K/x/8fz8=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr8537848ejy.407.1627763622321; 
 Sat, 31 Jul 2021 13:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <87sfzuwchl.fsf@linaro.org>
In-Reply-To: <87sfzuwchl.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 31 Jul 2021 21:32:59 +0100
Message-ID: <CAFEAcA8JO-8Tp1hW6e86x_=rtpJdk+cW4XnKYsko9Ehnx4_rBw@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 31 Jul 2021 at 19:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > "make check-acceptance" takes way way too long. I just did a run
> > on an arm-and-aarch64-targets-only debug build and it took over
> > half an hour, and this despite it skipping or cancelling 26 out
> > of 58 tests!
> >
> > I think that ~10 minutes runtime is reasonable. 30 is not;
> > ideally no individual test would take more than a minute or so.
> >
> > Output saying where the time went. The first two tests take
> > more than 10 minutes *each*. I think a good start would be to find
> > a way of testing what they're testing that is less heavyweight.
> >
> >  (01/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_=
gicv2:
> > PASS (629.74 s)
> >  (02/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_=
gicv3:
> > PASS (628.75 s)
> >  (03/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm:
> > CANCEL: kvm accelerator does not seem to be available (1.18 s)
>
> For these tests which purport to exercise the various GIC configurations
> I think we would be much better served by running kvm-unit-tests which
> at least try and exercise all the features rather than rely on the side
> effect of booting an entire OS.

I think "can we boot Linux via UEFI?" is worth testing, as is
"can we boot Linux and do at least some stuff in userspace?"
(there's a lot of TCG that doesn't get exercised by pure kernel boot).
We just need to find a guest OS that isn't so overweight it takes 10
minutes...

-- PMM

