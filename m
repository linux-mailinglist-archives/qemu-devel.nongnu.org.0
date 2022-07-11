Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9AD570362
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:53:04 +0200 (CEST)
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAsuN-00029Q-Go
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAss6-0008Tw-2T
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:50:42 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAss3-0002eH-Uh
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:50:41 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id n74so8525522yba.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B/816FsiBbpSTqn/6Y7bNunnTe55SmakjVVCnFELfSM=;
 b=BrhMXhrQjCv0p4wtxLieLZYhqBkuYIPIocMi8GEagwTgZwA8Uaz2cuyWKVRIEECYMC
 wZyNKHJranP6S5hNDUUN/Oz6oDlrvbY1NowNgaifeGqGJjTtoYG7N3EGppVJ6VVvvb3d
 ttl3H9+Lq8vD+rRgfSgp6lBOQw3eh44/BZcOn3MjzIz/3y/RT5yLGKYs74k5yRp0j8mJ
 RQnd9IIOUcsU15jdB83ZJRzZYB/66XnAaonQCrTp5jw9L8GV2+D+UQlA/r2araANvqTV
 I/0kpg2v2ORuiSnglWhbE9g60oRNkDQaJq8a5mNPOoRe4tqbsQ85bD+LmkjaEf7TojZC
 pVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B/816FsiBbpSTqn/6Y7bNunnTe55SmakjVVCnFELfSM=;
 b=BSmQPegKISZ+a037RVZYVJMwief9aWSns9pOTYSfcFXOoDBD1WtpdNMCJpv69tZcm6
 BeBuWzgQHN2/2uBbm9cZFsIVGO13KWKlv02ULcsNwSinWc0fyMS/2j/D2ARr+n1dAbbl
 Zjunf2l6FzbNJPWZfTMHMmBCcv15miqdY9Hh18rr/PsJm8jZSfHAif6d7ofhnk0moE3c
 Ztw6FJUCKPSeUz4VJ2iRcJHEyve5iSRJZNzSUIQ1MYaLQ6JtTIVYZRg6oFH8C0Dio6tK
 gm3QQPYEsie7hVszy7whPo2ZySofM49zNyPZyngGJbxVsCds798fjybYNyIJPSH+o1eF
 pOuQ==
X-Gm-Message-State: AJIora9706a65xSyjIxpQtisYP+TAkazHdUJKRo1weAinE3Si7sEWMHT
 j4b7xXj/xWs2NAhmAzF6LdPeZnwTCzHOpftx2L5vzA==
X-Google-Smtp-Source: AGRyM1s0lxEA30BQmnrqeOTppALOBt8tRMAyss86Y1UAkDrvc4gDq/LfsNVvzn5vnfEruOOv1qqh9AOZ6PHTjZZLX0Q=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr17162473ybg.140.1657543838843; Mon, 11
 Jul 2022 05:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220707151037.397324-1-alex.bennee@linaro.org>
In-Reply-To: <20220707151037.397324-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2022 13:50:00 +0100
Message-ID: <CAFEAcA9Jb7t9OpDd-DL77F=YXiP3-7A491RbN6SX8kFs31JtJw@mail.gmail.com>
Subject: Re: [PATCH v2] qemu-options: bring the kernel and image options
 together
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Jul 2022 at 16:11, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> How to control the booting of QEMU is often a source of confusion for
> users. Bring the options that control this together in the manual
> pages and add some verbiage to describe when each option is
> appropriate. This attempts to codify some of the knowledge expressed
> in:
>
>   https://stackoverflow.com/questions/58420670/qemu-bios-vs-kernel-vs-dev=
ice-loader-file/58434837#58434837
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> Message-Id: <20220622145052.4012981-1-alex.bennee@linaro.org>
>
> ---
> v2
>   - fix third and last reference for kernel and generic loader
>   - more verbiage following feedback from Peter
>   - mention Peter's write up in the commit message
> ---
>  qemu-options.hx | 90 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 72 insertions(+), 18 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 377d22fbd8..70e7f98882 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1585,13 +1585,6 @@ SRST
>      Use file as SecureDigital card image.
>  ERST
>
> -DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
> -    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH_=
ALL)
> -SRST
> -``-pflash file``
> -    Use file as a parallel flash image.
> -ERST
> -
>  DEF("snapshot", 0, QEMU_OPTION_snapshot,
>      "-snapshot       write to temporary files instead of disk image file=
s\n",
>      QEMU_ARCH_ALL)
> @@ -3680,12 +3673,61 @@ DEFHEADING()
>
>  #endif
>
> -DEFHEADING(Linux/Multiboot boot specific:)
> +DEFHEADING(Boot Image or Kernel specific:)
> +SRST
> +There are broadly 4 ways you can boot a system with QEMU.
> +
> + - specify a firmware and let it control finding a kernel
> + - specify a firmware and pass a hint to the kernel to boot
> + - direct kernel image boot
> + - manually load files into the guest's address space
> +
> +The third method is useful for quickly testing kernels but as there is
> +no firmware to pass configuration information to the kernel the
> +hardware must either be probable, the kernel built for the exact

"probeable"

> +configuration or passed some configuration data (e.g. a DTB blob)
> +which tells the kernel what drivers it needs. This exact details are
> +often hardware specific.
> +
> +The final method is the most generic way of loading images into the
> +guest address space and used mostly for ``bare metal`` type
> +development where the reset vectors of the processor are taken into
> +account.
> +
> +ERST
> +
> +SRST
> +
> +For x86 machines and some other architectures ``-bios`` will generally
> +do the right thing with whatever it is given. For other machines the
> +more strict ``-pflash`` option needs an image that is sized for the
> +flash device for the given machine type.
> +
> +Please see the :ref:`system-targets-ref` section of the manual for
> +more detailed documentation.
> +
> +ERST
> +
> +DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
> +    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
> +SRST
> +``-bios file``
> +    Set the filename for the BIOS.
> +ERST
> +
> +DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
> +    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH_=
ALL)
>  SRST
> -When using these options, you can use a given Linux or Multiboot kernel
> -without installing it in the disk image. It can be useful for easier
> -testing of various kernels.
> +``-pflash file``
> +    Use file as a parallel flash image.
> +ERST
>
> +SRST
> +
> +The kernel options were designed to work with Linux kernels although
> +other things (like hypervisors) can be packaged up as a kernel
> +executable image. The exact format of a executable image is usually
> +architecture specific.

"The way in which the kernel is started (what address it is loaded at,
what if any information is passed to it via CPU registers, the state
of the hardware when it is started, and so on) is also architecture
specific. Typically it follows the specification laid down by the
Linux kernel for how kernels for that architecture must be started."


>  ERST
>
> @@ -3725,6 +3767,25 @@ SRST
>      kernel on boot.
>  ERST
>
> +SRST
> +
> +Finally you can also manually load images directly into the address
> +space of the guest. This is most useful for developers who already
> +know the layout of their guest and take care to ensure something sane
> +will happen when the reset vector executes.
> +
> +The generic loader can be invoked by using the loader device:
> +
> +``-device loader,addr=3D<addr>,data=3D<data>,data-len=3D<data-len>[,data=
-be=3D<data-be>][,cpu-num=3D<cpu-num>]``
> +
> +there is also the guest loader which operates in a similar way but
> +tweaks the DTB so a hypervisor loaded via ``-kernel`` can find where
> +the guest image is:
> +
> +``-device guest-loader,addr=3D<addr>[,kernel=3D<path>,[bootargs=3D<argum=
ents>]][,initrd=3D<path>]``
> +
> +ERST
> +
>  DEFHEADING()

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

