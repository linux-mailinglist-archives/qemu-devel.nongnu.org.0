Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87230BE1D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:26:17 +0100 (CET)
Received: from localhost ([::1]:53668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ul6-0007p9-Pb
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ugk-0005iK-W9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:21:47 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ugi-0005xv-Jr
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:21:46 -0500
Received: by mail-ed1-x52f.google.com with SMTP id y8so7514241ede.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 04:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=belE4FoTQ5IDz2AkXxRNs1TgkX/xK+2CldIU2o/On7Y=;
 b=UlxbO+amTvKVNHtmZGHPGxefFQeXcZ89PubzDQQTJ1QP7sM0H6gADz+0mVDwsjOtvk
 pfmTNnNpfRdfw4QIL4TsoXs+awFOf9fe9lDndVTsBU553apPMlGkEoxf+ksrdsMWTVkY
 JY1tchrlF+e+0EKeQjgVDAzdh29ck5f3Z+ZZ7P4n/pWPZy/pfHPhX8APSkbVkND9UP66
 +n8LtLEV3dcI3IWZNB73Hu4C16u6rnjMaZT6nFsNlU+UcAf7dJA93utQKCsxWN8LVSyp
 5iotuvKJePatRk4G2pXBDyYDw//bYxeTMSSC2ksNz9DLtuV7+/5kEn3A/eltOur4hD39
 VB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=belE4FoTQ5IDz2AkXxRNs1TgkX/xK+2CldIU2o/On7Y=;
 b=Jz7J11dw3LG7qklb3ar9IrfVAtWdnrJW5M7wzMwC0DMp39XE4HDnzOZ3nWjUaTOQx0
 YY+7tWNMgI7ysv74pSei0g99cBYhcUae2nZXEnVXAL7Vg0RnK561O6ljZ0NsZgqR9Gyl
 Bg6Wc4GTx7n+j05tlSLfPYkJZzVnUUYUguuRVxQEJiD/nJKcq8V8PntRZ8qduxceS05o
 j1f/XMnv1sSCkuwe5J2k/vBbWEe0rfp4v4AB8LeRK5lg+dakfUPg3PUYXoJTevr3qXjQ
 5VOs8F7GivzHSii5Uj7HrGdICEwkHVlw15gps9OWLCx57PmzwYa18n97FlcAk8ZH/5cA
 xODQ==
X-Gm-Message-State: AOAM532TPWS7z5mRv7wSSPCWkGOdksYy+H/a+2z7cfOLua7bsdTO9fi3
 u+l8hBOA5zkoYfBXUKdJ8lD+ZqLcvx5VUslfOnZ2LA==
X-Google-Smtp-Source: ABdhPJxK9DqMutGnwvxhpSFo+gkvg022ZVD24QmlfwPUrZmYjiJ661F2qF4IU4TRLGEmHSDT/3OhzdZwu1ObosyWGxw=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr22821315edd.100.1612268502667; 
 Tue, 02 Feb 2021 04:21:42 -0800 (PST)
MIME-Version: 1.0
References: <20210131103401.217160-1-f4bug@amsat.org>
 <3a94e327-0454-bf43-552a-1c84407e1d7d@amsat.org>
 <20p82p5p-ns25-n434-37os-n55013s6313@erqung.pbz>
 <6d29aa57-2e6e-e81d-831f-803d9aae798f@amsat.org>
 <787280826.1146023.1612246917145@mail.yahoo.com>
 <3bd70da2-39ec-6e6b-d46d-6052f1b8f0b0@amsat.org>
In-Reply-To: <3bd70da2-39ec-6e6b-d46d-6052f1b8f0b0@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 12:21:31 +0000
Message-ID: <CAFEAcA-Q8swS84GVd20wo4Pp41UUPdDknxbCMn=pchgi96UgRQ@mail.gmail.com>
Subject: Re: [QEMU-SECURITY] [PATCH] hw/intc/arm_gic: Fix interrupt ID in
 GICD_SGIR register
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Li Qiang <liq3ea@gmail.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 QEMU Security <qemu-security@nongnu.org>, P J P <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 P J P <pj.pandit@yahoo.co.in>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021 at 09:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 2/2/21 7:21 AM, P J P wrote:
> > On Sunday, 31 January, 2021, 08:48:26 pm IST, Philippe Mathieu-Daud=C3=
=A9 <f4bug@amsat.org> wrote:
> >> Forwarding to qemu-security@ to see if this issue is worth a CVE.
> >>
> >> | On 1/31/21 11:34 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
> >> | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
> >
> > * Does above patch address both these bugs? For BZ#1913917 'irq' is der=
ived from 'offset' it seems.
> >
> >         /* Interrupt Configuration.  */
> >         irq =3D (offset - 0xc00) * 4;
>
> I haven't done a thorough analysis, simply tried to fixed this
> bug ASAP as it is public so many users are exposed.
>
> I had the impression the first call (writel 0x8000f00 0x5affaf)
> break the heap, so the memory is inconsistent when the second
> call (write 0x8000eff 0x1 0x0) is done, but better have developers
> familiar with GIC and security auditing this again.

Philippe is correct here. In both cases the overrun is on the
first writel to 0x8000f00, but the fuzzer has for some reason not
reported that but instead blundered on until it happens to trigger
some other issue that resulted from the memory corruption it induced
with the first write.

> >> | > Correct the irq mask to fix an undefined behavior (which eventuall=
y
> >> | > lead to a heap-buffer-overflow, see [Buglink]):
> >> | >
> >> | >    $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M v=
irt,accel=3Dqtest -qtest stdio
> >> | >    [I 1612088147.116987] OPENED
> >> | >  [R +0.278293] writel 0x8000f00 0xff4affb0
> >> | >  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bou=
nds for type 'uint8_t [16][8]'
> >> | >  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/int=
c/arm_gic.c:1498:13
> >> | >
> >> | > Cc: qemu-stable@nongnu.org
> >> | > Fixes: 9ee6e8bb853 ("ARMv7 support.")
> >> |
> >> | > ---
> >> | > Isnt it worth a CVE to help distributions track backports?
> >> | > ---
> >
> > Thank you for reporting this issue. Will process further.

On the CVE:

Since this can affect systems using KVM, this is a security bug for
us. However, it only affects an uncommon configuration:
you are only vulnerable if you are using "kernel-irqchip=3Doff"
(the default is 'on', and turning it off is an odd thing to do).

I've applied this patch to target-arm.next.

thanks
-- PMM

