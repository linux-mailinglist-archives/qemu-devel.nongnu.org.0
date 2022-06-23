Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5C557AA0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 14:48:34 +0200 (CEST)
Received: from localhost ([::1]:56978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4MG8-0003uC-Qv
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 08:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4MBw-0002ew-M4
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:44:12 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:41636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4MBu-0005CK-K7
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:44:12 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id 23so35618845ybe.8
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 05:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YQN1Knn5+PyLSPJ6sjytn6j4rOC0oCPWQdrwudef9bQ=;
 b=Uy9LQGuWg5gzJxYLMciqG/vRPUdMrQZLS6kzhWMRMCUa6Ejj9w47HoXRXOM6F5gNo2
 w91QIcQN73XWuSEnZCfChtY5p/fTAQDjmmTqTq6uEO+OTBoQ7F26izc4+mx3+WuPi4Ia
 BsmxJxPGYyogiOcRSGSvXVt7iDFCFiz/KYRMYYQlc2R+iegA4cTHtp8IarNdzndbJ97p
 sjPmDl5OWYSZqXmVtRr6ydk/45JDgH7xpO0ntv/YQ1DG3a0f8aEakI7eG/WQebPYMYiJ
 q+conURiAdyldXpIUlswfjP82bS+xOlFGP2Y0x12zS3lOoORaezpJ1tlHA7x7mJKHKXv
 OtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YQN1Knn5+PyLSPJ6sjytn6j4rOC0oCPWQdrwudef9bQ=;
 b=koLH2TiUnwGqNyvBK08ONuia3BNsCMqXkcimnh8SVq4BOxxHlotJCYceGC075UjBfN
 Cza9UXK0CIpKLKkqfPqcmx59y58VMDCS9+b+oVii+EksoM3GF/KHIXZK+j+jFn8D7EiH
 I0fjnqEEjVpgA0M813SJ6MOPbEva2lEArTr7zATkIUOg/GyIIzCLXx0tsVxvyIW72sZG
 wcMaaWI7+Nef9KxHGqcuvLxMHl53I4s+O8ITnAcUDKZuairtKjpUNvEEE5hblsm4ufc6
 nVYkOTOhH0n1CLmfoxeIYm4JO6/cv+Rw8Y1AVTkkSoLEzZo2666fbhp16KmAMmzQ59B+
 Wayw==
X-Gm-Message-State: AJIora99Efjp97sKlPZ9N2705lprKODNyKEcdF5GNRQceRdhBNnim7WT
 en6wuwbo3hJQ6/zSD2sbOIM4kdoxN05fK3Mws93t+w==
X-Google-Smtp-Source: AGRyM1vbFA9okkycphssedHVhNtYVCrAXsOzd57dlzU10a7nK0Q3OpvpGKOfdDwHzpjt4t7xt6hYU6GkDj3/RdIpHvk=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr9249212ybr.39.1655988242237; Thu, 23
 Jun 2022 05:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220622145052.4012981-1-alex.bennee@linaro.org>
In-Reply-To: <20220622145052.4012981-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 13:43:51 +0100
Message-ID: <CAFEAcA-bisQy_WmRTi-L37XhGNtvdL4XnLj5+=HfbRqj6cQJsA@mail.gmail.com>
Subject: Re: [RFC PATCH] qemu-options: bring the kernel and image options
 together
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Wed, 22 Jun 2022 at 15:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> How to control the booting of QEMU is often a source of confusion for
> users. Bring the options that control this together in the manual
> pages and add some verbiage to describe when each option is
> appropriate.

https://stackoverflow.com/a/58434837/4499941 is my answer to
this common user question, though it's a bit more conversational
in tone than we want for the manual :-)

> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  qemu-options.hx | 80 ++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 62 insertions(+), 18 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 377d22fbd8..9b0242f0ef 100644
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
> @@ -3680,12 +3673,51 @@ DEFHEADING()
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
> + - manually load files into the guests address space

"guest's"

> +
> +The last method

Do you mean the third method? The last method isn't usually
used to load kernels, but rather bare-metal binaries.

 is useful for quickly testing kernels but as there is
> +no firmware to pass configuration information to the kernel it must
> +either be built for the exact configuration or be handed a DTB blob
> +which tells the kernel what drivers it needs.

This is all somewhat architecture specific: you don't necessarily
need to do either of those if the hardware is probeable.


You should also mention that all of this is board specific.

> +
> +ERST
> +
> +SRST
> +
> +For x86 machines ``-bios`` will generally do the right thing with
> +whatever it is given. For non-x86 machines the more strict ``-pflash``
> +option needs an image that is sized for the flash device for the given
> +machine type.

-bios works for some non-x86 machine types too.

Ideally we would:
 * have all our machine types have some documentation
 * have the documentation for each machine type say whether
   it supports -bios or not, and what it does

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
> +SRST
> +``-pflash file``
> +    Use file as a parallel flash image.
> +ERST
> +
>  SRST
> -When using these options, you can use a given Linux or Multiboot kernel
> -without installing it in the disk image. It can be useful for easier
> -testing of various kernels.
>
> +The kernel options were designed to work with Linux kernels although
> +other things (like hypervisors) can be packaged up as a kernel
> +executable image. The exact format of a executable image is usually
> +architecture specific.
>
>  ERST
>
> @@ -3725,6 +3757,25 @@ SRST
>      kernel on boot.
>  ERST
>
> +SRST
> +
> +Finally you can also manually load images directly into the address
> +space of the guest. This is most useful for developers who already
> +know the layout of their guest and take care to ensure something sane
> +will happen when the reset vector executes.

We should say that this is the favoured option for "I want to
run a bare-metal binary", and we should also say that this
option works the same way on any architecture and machine.

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

thanks
-- PMM

