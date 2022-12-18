Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C4650521
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:36:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p72Ep-0005Vk-K8; Sun, 18 Dec 2022 17:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p72Eo-0005Uv-7z; Sun, 18 Dec 2022 17:34:30 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p72El-00081K-TI; Sun, 18 Dec 2022 17:34:29 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b69so10617162edf.6;
 Sun, 18 Dec 2022 14:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N1OyHl9iOgErcjqtGG7/GzdFNtJtKnhb3MWGf1ArNr8=;
 b=cwFEQqzKDDU+okmc/vnoOmxj78Xs8Lq7p8K2z/lZLZ89W5dqtGEhQ+1tXFyeHSTHMP
 0JWOHErBuWot5P+7uk2mFRy/boqr6AxEjxUzZoTooDcut/PYKHk/I+PHDfGDAHgTVwdh
 Egny3uUEEHGs/oPqdK9JKKAnEa2g6vRUdIXu13Y4tuNamZ4kiLc/1TGh5yCdEGYyNbbA
 L8Xx5ubyPdQoTqFlaOL6d+aKJVfJJy5t4wKnE82VRMMTus9imAJWCr1/LNzQSvIY7w3N
 dKO/89/8WZ6oh3dXlHanAJa5jb/jfuhrpPNKODwtaIOnle2FftsP2U6mOrs4ETKSuLmD
 lgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N1OyHl9iOgErcjqtGG7/GzdFNtJtKnhb3MWGf1ArNr8=;
 b=ULwuMWdfJ1T5pk0/t/SZZUxABVVqR5EaMGAPrbEZdIE83Uc+BkNcImEzmgzgvoD+/3
 tjZzzCPYasua6h52VfwgrB3lfQ53Mik4KgjLl+QEhJjK43P0VxPBT59uw+0e4YylA5pa
 sro3mp9SDmvu+hw/OwFdK7YYgnXo9Oj6oVXumXk0pFZr3c418trVm1GfVcZk4OuRhIVx
 ZSOSMBXqnmj/8cPs/CmNe8N5ztGqaFGR7YpLdMvN0RBB3PpSzwTjdEYdw4Ad2UUYhRiA
 +bDoKFlQwTONCU23kBBM6K6LbOuev61cITSJ2j+fhwS4DHZzIEbSWjw/6hEqDZ6kxTKF
 r7hg==
X-Gm-Message-State: ANoB5pklpVIMzfWgfRdUEWOrDs9CQLofO5rx59nmxjxZ4msJNBIwG8bt
 kMf8Ux3DjAcHoxzL2A2fhs6Ucbxck+spuZiRiIM=
X-Google-Smtp-Source: AA0mqf7KBXwt/SBgS7jUKl2pfqBpe694RsF2KyM8ILE5AuwQve2ZZcYyxu8WNXzXiEcFFLQWahw9qGovESpe6/hSTgo=
X-Received: by 2002:a05:6402:f13:b0:46c:e627:13bb with SMTP id
 i19-20020a0564020f1300b0046ce62713bbmr7081267eda.204.1671402865739; Sun, 18
 Dec 2022 14:34:25 -0800 (PST)
MIME-Version: 1.0
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <e05afcc8-8d86-b942-6702-8ba4887c44db@linaro.org>
In-Reply-To: <e05afcc8-8d86-b942-6702-8ba4887c44db@linaro.org>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sun, 18 Dec 2022 23:34:14 +0100
Message-ID: <CABtshVRUevNjOucUwtKW-sccUAADRe-9JBbYHd8UMGf0YPJXSw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Enable Cubieboard A10 boot SPL from SD card
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,


On Sun, Dec 18, 2022 at 11:17 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 18/12/22 22:19, Strahinja Jankovic wrote:
> > This patch series adds missing Allwinner A10 modules needed for
> > successful SPL boot:
> > - Clock controller module
> > - DRAM controller
> > - I2C0 controller (added also for Allwinner H3 since it is the same)
> > - AXP-209 connected to I2C0 bus
> >
> > It also updates Allwinner A10 emulation so SPL is copied from attached
> > SD card if `-kernel` parameter is not passed when starting QEMU
> > (approach adapted from Allwinner H3 implementation).
> >
> > Boot from SD card has been tested with Cubieboard Armbian SD card image=
 and custom
> > Yocto image built for Cubieboard.
> > Example usage for Armbian image:
> > qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cu=
bieboard_kinetic_edge_6.0.7.img
>
> As a follow-up, could you add a test similar to
> test_arm_orangepi_bionic_20_08() in tests/avocado/boot_linux_console.py?
>
> This test could be refactored as do_test_arm_allwinner_armbian(), called
> for orangepi and cubieboard with the corresponding url / hash.

I was planning to do it (I already have a patch for cubieboard), but
there is a problem with finding a stable-enough image for cubieboard
for automated testing.
Unfortunately, Cubieboard does not have supported Armbian images as
OrangePi-PC has (it only has weekly builds). From the images that can
be found on archive.armbian.com, there is only one bionic image
(21.02) and it won't boot because it hangs due to the musb issue (I
tried both with my patches and without, by extracting
kernel/dtb/initrd). Other images are focal, but for some reason, in
those images it is impossible to interrupt U-Boot (tested with 21.08),
so I could not append to bootcmd to make boot process more verbose and
easier to monitor for automated testing.

That is why, for now, I would suggest not updating the SPL/SD boot
test for Cubieboard.

Best regards,
Strahinja

