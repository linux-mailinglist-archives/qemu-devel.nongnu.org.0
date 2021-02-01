Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126E30AD81
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:12:57 +0100 (CET)
Received: from localhost ([::1]:56442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cky-00050Z-83
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6cg3-00006Q-Mp
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:07:52 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6cfz-0003pM-Ag
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:07:51 -0500
Received: by mail-ej1-x62d.google.com with SMTP id w1so25482084ejf.11
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 09:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UqMXe4bj2183Q2V8DecL5lKHTV0DrJz0QnkHc5l4VKM=;
 b=lOZaLpCDAhpROl1PjGc+qfGs4KzBWA3t4X5dvWHsEDJ10AZnW6IGLzEEQVJVLFwdJh
 690FgmAjgNpDjP7ef1NRdQNbeF5QfUwnWSscnLcugaSmiuSy/elCNIhufZUupr0CLzP7
 MZwFplOgkgtMXg9lww/jkSErPGs9Famnx2fwKNlH0xt6rlKpyq3RHBBkKZtN2Uwsvg8v
 y9ttFTxXgRt5EeedU4hU/1LFAYFzmivIkKy4sQtpn0IoCOaYIVCkQWLs32uPsj97H4zF
 IV+e0G8Ej06rGTdfZn5LVPdZFS17nnfg09wLs5mItiDOCj2vjJsh5aP5qPiTmTQU4MsK
 wmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UqMXe4bj2183Q2V8DecL5lKHTV0DrJz0QnkHc5l4VKM=;
 b=dwIuFUQw+Tls8ALMTM6DYNI2lIQvnafGn1LgqoHG1yliLuvT0Ip/AXNW209InMPiog
 3se0bnUuwQoeSrKVvLwiGjY/AvoqPV45VJQadgNggU2cO0RHpoknTLWSlC4huxy8IZ6M
 cbRLTw2Ncg+rMfVuKRiYofUTto5mQnBCwkuMfU0a1XAID5M+1M5TEtZyjiAPrcKPFCLF
 pHtn13a4k/LCJE18ivpIkfOmMVTjPQATUbs6gz2sTr9EDeB4l4N5ctx0gtEfYHlDVrkJ
 ZbViIGpOlAOClRxBviBuHJsgo7/ngGOlaUkBObScISo+xloohm8Em9trEiiRllY1HrR+
 t2MA==
X-Gm-Message-State: AOAM532jj9R7X4xx8oQH2PCnCNhCSHggabd6Srq9XcdjuJQdaLlrk1IY
 OILKIG0a/bCSGu2lcMa1xLOXZvNv25pMvtmKzj531g==
X-Google-Smtp-Source: ABdhPJyXc6gh49MENCUngbO+7YtlsviC2beGtFhKs0W7vGAQWzK5YCu+riev2sFWNOWKys49gbDNX5m3eTgLkVTm0nY=
X-Received: by 2002:a17:906:4002:: with SMTP id
 v2mr18821993ejj.85.1612199265589; 
 Mon, 01 Feb 2021 09:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20210129181319.2992-1-alex.bennee@linaro.org>
In-Reply-To: <20210129181319.2992-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 17:07:34 +0000
Message-ID: <CAFEAcA9M+J3X1hS6dPrTM-QxGVfLSrP2=VE7cpdJZPovCuzuJg@mail.gmail.com>
Subject: Re: [PATCH] docs/system: document an example booting the versatilepb
 machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Anders Roxell <anders.roxell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 18:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> There is a bit more out there including Aurelien's excellent write up
> and older Debian images here:
>
>   https://www.aurel32.net/info/debian_arm_qemu.php
>   https://people.debian.org/~aurel32/qemu/armel/
>
> However the web is transitory and git is forever so lets add something
> to the fine manual.
>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/system/arm/versatile.rst | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/docs/system/arm/versatile.rst b/docs/system/arm/versatile.rs=
t
> index 51221c30a4..d16f20ccae 100644
> --- a/docs/system/arm/versatile.rst
> +++ b/docs/system/arm/versatile.rst
> @@ -27,3 +27,35 @@ The Arm Versatile baseboard is emulated with the follo=
wing devices:
>     devices.
>
>  -  PL181 MultiMedia Card Interface with SD card.
> +
> +Booting a Linux kernel
> +----------------------
> +
> +Building a current Linux kernel with ``versatile_defconfig`` should be
> +enough to get something running.
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=3Darm
> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
> +  $ make versatile_defconfig
> +  $ make

same remarks as for other patch.

Does the 'make' make the right dtb automatically, by the way?
(I have some notes where I had to tell the kernel to build the
dtb explicitly, but maybe they are out of date.)

> +
> +You may want to enable some additional modules if you want to boot
> +something from the SCSI interface::
> +
> +  CONFIG_PCI=3Dy
> +  CONFIG_PCI_VERSATILE=3Dy

It's a bit daft that these aren't in the defconfig, but hey.

> +  CONFIG_SCSI=3Dy
> +  CONFIG_SCSI_SYM53C8XX_2=3Dy
> +
> +You can then boot with a command line like:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -machine type=3Dversatilepb \
> +      -serial mon:stdio \
> +      -drive if=3Dscsi,driver=3Dfile,filename=3Ddebian-buster-armel-root=
fs.ext4 \
> +      -kernel zImage \
> +      -dtb versatile-pb.dtb  \
> +      -append "console=3DttyAMA0 ro root=3D/dev/sda"

thanks
-- PMM

