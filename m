Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6EF76350
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 12:16:35 +0200 (CEST)
Received: from localhost ([::1]:38018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqxH7-00038J-S6
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 06:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36285)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hqxGm-0002hd-7o
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:16:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hqxGi-0007Ba-1t
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:16:10 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39857)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hqxGg-0006rQ-PA
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 06:16:07 -0400
Received: by mail-wr1-x441.google.com with SMTP id x4so689376wrt.6
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 03:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=A8c7FBmQXbxBQU4P/pA8IP6ZkMx8Vsd6UVTL0vHFK6c=;
 b=wzTVZHaW33vrI7WV8r62yizLdAB4V0461nVb9uOiJ3cyLrxDEviMlLjFyV9CZInII+
 EsdmWj33Lx5acd0a+vD9YqouO63H3HkHIn0L8/8ikOApaDjllcMX6Nno1u3G7LBoI2Vy
 svDMr7iTVKEcynZ8888vJ5haFKcCuTyadh3KxDsuT5cfLrZmsQePo3xglpeygVhEY6o2
 /RGUqV0IwdDqdleQY7FSpWr/zUxWDhUzpHndtAz9rn0nWSJ7YS/qSX4kocFZsj6u4R0w
 4ypY5ZkxqA8sE4WR4UN/jK1LVz+g2Cjq9b7u15VfAG6uRjDaeBKobutXxK0WyRIbTXjo
 Dmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=A8c7FBmQXbxBQU4P/pA8IP6ZkMx8Vsd6UVTL0vHFK6c=;
 b=Ejzk5w8bVe7luvSTnIMAzeD7ihZs1lwXV6hcUndsUdLC3ud2IlWM+4ey8TIfs/mbg0
 lh9hPXKDAs2FzGkr5hzFoNXOfC4a9ZcjtdsNYiq9Mj31LNA0QuymHfHakUPdbReXD6Cb
 mliAXtyDgrp8Tl6fpatFe9Lgic1jxgOYSTQ22LYo3qlm9gonfMN697sJYwAeynLDFRDk
 /Xeu9xCzjHnx9lDXWkSQGyLSB5UQdiqlq0Z77XGg40OnAwkI268Fu+IwPB5lUwHmDt6c
 6qsXpLK3qMm6JMhnNdPsPQ3sXf11Tyd27JEdfR4sFP9tIft2JKnp5lHSvNLMcHczGycw
 UZFw==
X-Gm-Message-State: APjAAAWZvpIgrErr8/AFjr/WXgMmn12iLlzO5xr/VNfgB6HU0IRERRSw
 OWEU3EkXZqtS2Yl05OZoM3W8Ig==
X-Google-Smtp-Source: APXvYqzWU4FbM7J6Pgi5WXZvzuqMaZ+FTuTD2a8SCY9BP1AulLPd2Z3z+MQE2juVD9AsK/YKyMABdA==
X-Received: by 2002:adf:f046:: with SMTP id t6mr1689754wro.307.1564136163223; 
 Fri, 26 Jul 2019 03:16:03 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id t15sm45454776wrx.84.2019.07.26.03.16.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 03:16:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 642621FF87;
 Fri, 26 Jul 2019 11:16:02 +0100 (BST)
References: <20190722151804.25467-1-peter.maydell@linaro.org>
 <20190722151804.25467-2-peter.maydell@linaro.org>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
In-reply-to: <20190722151804.25467-2-peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 11:16:02 +0100
Message-ID: <87y30lgkyl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH for-4.1? 1/2] hw/arm/boot:
 Rename elf_{low, high}_addr to image_{low, high}_addr
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Rename the elf_low_addr and elf_high_addr variables to image_low_addr
> and image_high_addr -- in the next commit we will extend them to
> be set for other kinds of image file and not just ELF files.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/boot.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 1fb24fbef27..b7b31753aca 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -986,7 +986,9 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>      int kernel_size;
>      int initrd_size;
>      int is_linux =3D 0;
> -    uint64_t elf_entry, elf_low_addr, elf_high_addr;
> +    uint64_t elf_entry;
> +    /* Addresses of first byte used and first byte not used by the image=
 */
> +    uint64_t image_low_addr, image_high_addr;
>      int elf_machine;
>      hwaddr entry;
>      static const ARMInsnFixup *primary_loader;
> @@ -1014,24 +1016,24 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>          info->nb_cpus =3D 1;
>
>      /* Assume that raw images are linux kernels, and ELF images are not.=
  */
> -    kernel_size =3D arm_load_elf(info, &elf_entry, &elf_low_addr,
> -                               &elf_high_addr, elf_machine, as);
> +    kernel_size =3D arm_load_elf(info, &elf_entry, &image_low_addr,
> +                               &image_high_addr, elf_machine, as);
>      if (kernel_size > 0 && have_dtb(info)) {
>          /*
>           * If there is still some room left at the base of RAM, try and =
put
>           * the DTB there like we do for images loaded with -bios or -pfl=
ash.
>           */
> -        if (elf_low_addr > info->loader_start
> -            || elf_high_addr < info->loader_start) {
> +        if (image_low_addr > info->loader_start
> +            || image_high_addr < info->loader_start) {
>              /*
> -             * Set elf_low_addr as address limit for arm_load_dtb if it =
may be
> +             * Set image_low_addr as address limit for arm_load_dtb if i=
t may be
>               * pointing into RAM, otherwise pass '0' (no limit)
>               */
> -            if (elf_low_addr < info->loader_start) {
> -                elf_low_addr =3D 0;
> +            if (image_low_addr < info->loader_start) {
> +                image_low_addr =3D 0;
>              }
>              info->dtb_start =3D info->loader_start;
> -            info->dtb_limit =3D elf_low_addr;
> +            info->dtb_limit =3D image_low_addr;
>          }
>      }
>      entry =3D elf_entry;


--
Alex Benn=C3=A9e

