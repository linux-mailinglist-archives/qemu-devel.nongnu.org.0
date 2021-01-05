Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381922EA735
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 10:24:36 +0100 (CET)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwiZu-0007Lg-OQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 04:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwiXd-0006hj-80
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:22:13 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwiXa-00084e-Cz
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:22:13 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w5so35388502wrm.11
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 01:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nows0qVut4wWoeMnHtoMuBIdIVrUS83pTidJTQIdgVk=;
 b=mcyJ2+OUWD8E6+XpI9n/jtSlT68kG1ZTdCMkpgLTHD4Rm38qjtGV3M97rz3tosQkJd
 aiFiXjFRyXehX1ylHJnoCCS4jiDXlMF1f6oQnuNYzF8VSKnl6Inz2mS2sHW36WxeaF4E
 7Tq5magEkntGqSUb6BeBCHEYSEOeLgAImJDnjt8CKy9nHc/owAemyBURu8uQ6KXgYhAd
 Y/mbXsRqftrHGbxk0WJ5w9isr7ijX2A5wOaxc00pyT+2E0dACnehSZ6m+7vpE3PY3G1J
 Xi+FY9A7P6935cBEHZbAM47Bw/f7f2DL9aQTb4oFt9b4ag4xqAPsT6fakDpaaxl57tym
 1I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nows0qVut4wWoeMnHtoMuBIdIVrUS83pTidJTQIdgVk=;
 b=MhdI6F5gklS3TMhBEfv21+15ylRO7nUqxfQcZ6v1SFkU2VSpWRuvbxV9F3aJNLFyIE
 0/tVKErTyewcxqMuFLxK5k7T/gCJdVqAYBM57hNtC8vZ6B7jh54jsLR/Xai+M2MweW3t
 kikUX9iGRppk1d2VzM6TP1i1Rm54QPjNnD9fnYJuFxdvBMj/dyFvCfl04OMar2vhkKKK
 yB8dBWF7JAG4IVdtmCzHIaTtJeUVUchrUfp+XXaGLc1tZDEPurc3eYjDEXN/cnDTKBRy
 Zn1BYXkh3eqsPSA/lVygOTGW9lTphfMQABLZG0LRddkVDcv1LRF1on+2LZBGyfthuAYO
 a7zA==
X-Gm-Message-State: AOAM531KNpY3bbWGlnhFXMvDgqmWN+DROok71EtRV6S2wHVaJHsA1RUX
 rT9AwMORTYamu8eF4J5dUth/Zg==
X-Google-Smtp-Source: ABdhPJz9w+BULd/CdoQwaRYbelNBx4rCGLXZpJHx5XxSDUs8jzzdqYGzOhPA+P/YURcTEd30f/HLPw==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr86104309wrt.396.1609838528506; 
 Tue, 05 Jan 2021 01:22:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j2sm94386754wrt.35.2021.01.05.01.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 01:22:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7AD761FF7E;
 Tue,  5 Jan 2021 09:22:06 +0000 (GMT)
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
 <1608704767-9317-5-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 4/4] docs/system: arm: Add sabrelite board description
Date: Tue, 05 Jan 2021 09:21:38 +0000
In-reply-to: <1608704767-9317-5-git-send-email-bmeng.cn@gmail.com>
Message-ID: <87turv3fi9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> This adds the target guide for SABRE Lite board, and documents how
> to boot a Linux kernel and U-Boot bootloader.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Awesome documentation =F0=9F=91=8F

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> ---
>
> Changes in v2:
> - new patch: add sabrelite target guide
>
>  docs/system/arm/sabrelite.rst | 119 ++++++++++++++++++++++++++++++++++++=
++++++
>  docs/system/target-arm.rst    |   1 +
>  2 files changed, 120 insertions(+)
>  create mode 100644 docs/system/arm/sabrelite.rst
>
> diff --git a/docs/system/arm/sabrelite.rst b/docs/system/arm/sabrelite.rst
> new file mode 100644
> index 0000000..4c5d101
> --- /dev/null
> +++ b/docs/system/arm/sabrelite.rst
> @@ -0,0 +1,119 @@
> +Boundary Devices SABRE Lite (``sabrelite``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Boundary Devices SABRE Lite i.MX6 Development Board is a low-cost develo=
pment
> +platform featuring the powerful Freescale / NXP Semiconductor's i.MX 6 Q=
uad
> +Applications Processor.
> +
> +Supported devices
> +-----------------
> +
> +The SABRE Lite machine supports the following devices:
> +
> + * Up to 4 Cortex A9 cores
> + * Generic Interrupt Controller
> + * 1 Clock Controller Module
> + * 1 System Reset Controller
> + * 5 UARTs
> + * 2 EPIC timers
> + * 1 GPT timer
> + * 2 Watchdog timers
> + * 1 FEC ethernet controller
> + * 3 I2C controllers
> + * 7 GPIO controllers
> + * 4 SDHC storage controllers
> + * 4 USB 2.0 host controllers
> + * 5 ECSPI controllers
> + * 1 SST 25VF016B flash
> +
> +Please note above list is a complete superset the QEMU SABRE Lite machin=
e can
> +support. For a normal use case, a device tree blob that reprents a real =
world
> +SABRE Lite board, only exposes a subset of devices to the guest software.
> +
> +Boot options
> +------------
> +
> +The SABRE Lite machine can start using the standard -kernel functionality
> +for loading a Linux kernel, U-Boot bootloader or ELF executable.
> +
> +Running Linux kernel
> +--------------------
> +
> +Linux mainline v5.10 release is tested at the time of writing. To build =
a Linux
> +mainline kernel that can be booted by the SABRE Lite machine, simply con=
figure
> +the kernel using the imx_v6_v7_defconfig configuration:
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=3Darm
> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
> +  $ make imx_v6_v7_defconfig
> +  $ make
> +
> +To boot the newly built Linux kernel in QEMU with the SABRE Lite machine=
, use:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
> +      -display none -serial null -serial stdio \
> +      -kernel arch/arm/boot/zImage \
> +      -dtb arch/arm/boot/dts/imx6q-sabrelite.dtb \
> +      -initrd /path/to/rootfs.ext4 \
> +      -append "root=3D/dev/ram"
> +
> +Running U-Boot
> +--------------
> +
> +U-Boot mainline v2020.10 release is tested at the time of writing. To bu=
ild a
> +U-Boot mainline bootloader that can be booted by the SABRE Lite machine,=
 use
> +the mx6qsabrelite_defconfig with similar commands as described above for=
 Linux:
> +
> +.. code-block:: bash
> +
> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
> +  $ make mx6qsabrelite_defconfig
> +
> +Note we need to adjust settings by:
> +
> +.. code-block:: bash
> +
> +  $ make menuconfig
> +
> +then manually select the following configuration in U-Boot:
> +
> +  Device Tree Control > Provider of DTB for DT Control > Embedded DTB
> +
> +To start U-Boot using the SABRE Lite machine, provide the u-boot binary =
to
> +the -kernel argument, along with an SD card image with rootfs:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
> +      -display none -serial null -serial stdio \
> +      -kernel u-boot
> +
> +The following example shows booting Linux kernel from dhcp, and uses the
> +rootfs on an SD card. This requies some additional command line paramete=
rs
> +for QEMU:
> +
> +.. code-block:: none
> +
> +  -nic user,tftp=3D/path/to/kernel/zImage \
> +  -drive file=3Dsdcard.img,id=3Drootfs -device sd-card,drive=3Drootfs
> +
> +The directory for the built-in TFTP server should also contain the devic=
e tree
> +blob of the SABRE Lite board. The sample SD card image was populated wit=
h the
> +root file system with one single partition. You may adjust the kernel "r=
oot=3D"
> +boot parameter accordingly.
> +
> +After U-Boot boots, type the following commands in the U-Boot command sh=
ell to
> +boot the Linux kernel:
> +
> +.. code-block:: none
> +
> +  =3D> setenv ethaddr 00:11:22:33:44:55
> +  =3D> setenv bootfile zImage
> +  =3D> dhcp
> +  =3D> tftpboot 14000000 imx6q-sabrelite.dtb
> +  =3D> setenv bootargs root=3D/dev/mmcblk3p1
> +  =3D> bootz 12000000 - 14000000
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index bde4b8e..edd013c 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -83,6 +83,7 @@ undocumented; you can get a complete list by running
>     arm/versatile
>     arm/vexpress
>     arm/aspeed
> +   arm/sabrelite
>     arm/digic
>     arm/musicpal
>     arm/gumstix


--=20
Alex Benn=C3=A9e

