Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27BE6DA123
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 21:27:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkVGF-0006NZ-Hk; Thu, 06 Apr 2023 15:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pkVGD-0006My-Co; Thu, 06 Apr 2023 15:27:05 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pkVG9-0008MZ-JZ; Thu, 06 Apr 2023 15:27:05 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-54bfce685c1so89890157b3.1; 
 Thu, 06 Apr 2023 12:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680809220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YgCn4xS/H0cexMb4eU7NOSwj93gtkJLLBbHmETFO5+M=;
 b=ntbClMG9PDOEMtMIgD0TWbvkYdC8nJfxPssdH/dmb0eoTFgLFVB7mSDCt2QCduvDU4
 /47lP1aYlUYNoMwICrDLk7ZmAztFl3z5kSdfi3joH1fRDAQCjnB+2O/S3T8Zf6CJxbB2
 VObTlWl7uDNiZggXV/wmsAEW25S0DNmhcoU1YW63XmGdfQmer3JqxXw+wnM8BFfavwz+
 FsoaV3cBaUCS0s+USTNYr/3AzC7+fBuQ9mGopx9mwZ0X4oF/ygJY9AQY+gpYF7sR0kcm
 ddGOMAJgxr2/nBSgjB94wAkGP1ttZGqWt/crezey+KvrPiD24X0TOhfKnRsySFe30/Hn
 AggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680809220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YgCn4xS/H0cexMb4eU7NOSwj93gtkJLLBbHmETFO5+M=;
 b=cLLKkp25SAIj+YFhxavp1C6OYM0OMY2O9+gv98aCXhIz9QgMF19GXoklCo+Etbw1mP
 szHLvkvpGZfNClkTIQSyP7ncKNhiuiwrIl/WTyees02IM7ASjD7whIFzvOuU5aPfPie4
 PUBSRglJUcHaBFG46cu69ItGqOFfEDF4RaJWmgorgSoqfOHtj8MYnPlEyPulfk6C0YyN
 szjTVAa8dqjvlbmLTKyqWO3ABZgDz64rmBuHlErOaLbuJt0EPOdiAgrq7gLZyZjHMEUX
 WN8p1tU5+RJ2cpzEvrrrlCATleFJYAQBY2KCgU/Njzh7hBwZwBOfmpnqHdfpPLgaTBx/
 eopw==
X-Gm-Message-State: AAQBX9d0AQ61uip2L/fJjh1M7pgTMNrCMn2U281HnBuxs13mHyMTWEeR
 7FY2CrblgIMxCFz7WN4IhoLZdU2u3kFKXj9XeSI=
X-Google-Smtp-Source: AKy350bEJUNMUxaHBdyHDoix0kfxpkPSzcprsmJaCbE68zv1j9e2UzATTM+G3S9pCU/WeasUuY5W9yh2Wh1WYjVnTAk=
X-Received: by 2002:a81:eb0e:0:b0:545:883a:544d with SMTP id
 n14-20020a81eb0e000000b00545883a544dmr6636549ywm.9.1680809220056; Thu, 06 Apr
 2023 12:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230328054832.18790-1-qianfanguijin@163.com>
In-Reply-To: <20230328054832.18790-1-qianfanguijin@163.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 6 Apr 2023 21:26:49 +0200
Message-ID: <CAPan3WrW3LEfpk6pK_d7Hgf7KVVWC3zYXbkiktJtriqtAigKeQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] docs: system: arm: Introduce bananapi_m2u
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007f2b3605f8afe425"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

--0000000000007f2b3605f8afe425
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 7:48=E2=80=AFAM <qianfanguijin@163.com> wrote:

> From: qianfan Zhao <qianfanguijin@163.com>
>
> Add documents for Banana Pi M2U
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>


> ---
>  docs/system/arm/bananapi_m2u.rst | 138 +++++++++++++++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 docs/system/arm/bananapi_m2u.rst
>
> diff --git a/docs/system/arm/bananapi_m2u.rst
> b/docs/system/arm/bananapi_m2u.rst
> new file mode 100644
> index 0000000000..ae7194a9df
> --- /dev/null
> +++ b/docs/system/arm/bananapi_m2u.rst
> @@ -0,0 +1,138 @@
> +Banana Pi BPI-M2U (``bpim2u``)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Banana Pi BPI-M2 Ultra is a quad-core mini single board computer built
> with
> +Allwinner A40i/R40/V40 SoC. It features 2GB of RAM and 8GB eMMC. It also
> +has onboard WiFi and BT. On the ports side, the BPI-M2 Ultra has 2 USB A
> +2.0 ports, 1 USB OTG port, 1 HDMI port, 1 audio jack, a DC power port,
> +and last but not least, a SATA port.
> +
> +Supported devices
> +"""""""""""""""""
> +
> +The Banana Pi M2U machine supports the following devices:
> +
> + * SMP (Quad Core Cortex-A7)
> + * Generic Interrupt Controller configuration
> + * SRAM mappings
> + * SDRAM controller
> + * Timer device (re-used from Allwinner A10)
> + * UART
> + * SD/MMC storage controller
> + * EMAC ethernet
> + * GMAC ethernet
> + * Clock Control Unit
> + * TWI (I2C)
> +
> +Limitations
> +"""""""""""
> +
> +Currently, Banana Pi M2U does *not* support the following features:
> +
> +- Graphical output via HDMI, GPU and/or the Display Engine
> +- Audio output
> +- Hardware Watchdog
> +- Real Time Clock
> +- USB 2.0 interfaces
> +
> +Also see the 'unimplemented' array in the Allwinner R40 SoC module
> +for a complete list of unimplemented I/O devices:
> ``./hw/arm/allwinner-r40.c``
> +
> +Boot options
> +""""""""""""
> +
> +The Banana Pi M2U machine can start using the standard -kernel
> functionality
> +for loading a Linux kernel or ELF executable. Additionally, the Banana P=
i
> M2U
> +machine can also emulate the BootROM which is present on an actual
> Allwinner R40
> +based SoC, which loads the bootloader from a SD card, specified via the
> -sd
> +argument to qemu-system-arm.
> +
> +Running mainline Linux
> +""""""""""""""""""""""
> +
> +To build a Linux mainline kernel that can be booted by the Banana Pi M2U
> machine,
> +simply configure the kernel using the sunxi_defconfig configuration:
> +
> +.. code-block:: bash
> +
> +  $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make mrproper
> +  $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make sunxi_defconfig
> +
> +To boot the newly build linux kernel in QEMU with the Banana Pi M2U
> machine, use:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M bpim2u -nographic \
> +      -kernel /path/to/linux/arch/arm/boot/zImage \
> +      -append 'console=3DttyS0,115200' \
> +      -dtb
> /path/to/linux/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dtb
> +
> +Banana Pi M2U images
> +""""""""""""""""""""
> +
> +Note that the mainline kernel does not have a root filesystem. You can
> choose
> +to build you own image with buildroot using the
> bananapi_m2_ultra_defconfig.
> +Also see https://buildroot.org for more information.
> +
> +Another possibility is to run an OpenWrt image for Banana Pi M2U which
> +can be downloaded from:
> +
> +   https://downloads.openwrt.org/releases/22.03.3/targets/sunxi/cortexa7=
/
> +
> +When using an image as an SD card, it must be resized to a power of two.
> This can be
> +done with the ``qemu-img`` command. It is recommended to only increase
> the image size
> +instead of shrinking it to a power of two, to avoid loss of data. For
> example,
> +to prepare a downloaded Armbian image, first extract it and then increas=
e
> +its size to one gigabyte as follows:
> +
> +.. code-block:: bash
> +
> +  $ qemu-img resize \
> +
> openwrt-22.03.3-sunxi-cortexa7-sinovoip_bananapi-m2-ultra-ext4-sdcard.img=
 \
> +    1G
> +
> +Instead of providing a custom Linux kernel via the -kernel command you
> may also
> +choose to let the Banana Pi M2U machine load the bootloader from SD card=
,
> just like
> +a real board would do using the BootROM. Simply pass the selected image
> via the -sd
> +argument and remove the -kernel, -append, -dbt and -initrd arguments:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M bpim2u -nic user -nographic \
> +    -sd
> openwrt-22.03.3-sunxi-cortexa7-sinovoip_bananapi-m2-ultra-ext4-sdcard.img
> +
> +Running U-Boot
> +""""""""""""""
> +
> +U-Boot mainline can be build and configured using the
> Bananapi_M2_Ultra_defconfig
> +using similar commands as describe above for Linux. Note that it is
> recommended
> +for development/testing to select the following configuration setting in
> U-Boot:
> +
> +  Device Tree Control > Provider for DTB for DT Control > Embedded DTB
> +
> +The BootROM of allwinner R40 loading u-boot from the 8KiB offset of
> sdcard.
> +Let's create an bootable disk image:
> +
> +.. code-block:: bash
> +
> +  $ dd if=3D/dev/zero of=3Dsd.img bs=3D32M count=3D1
> +  $ dd if=3Du-boot-sunxi-with-spl.bin of=3Dsd.img bs=3D1k seek=3D8 conv=
=3Dnotrunc
> +
> +And then boot it.
> +
> +.. code-block:: bash
> +  $ qemu-system-arm -M bpim2u -nographic -sd sd.img
> +
> +Banana Pi M2U integration tests
> +""""""""""""""""""""""""""""""
> +
> +The Banana Pi M2U machine has several integration tests included.
> +To run the whole set of tests, build QEMU from source and simply
> +provide the following command:
> +
> +.. code-block:: bash
> +
> +  $ cd qemu-build-dir
> +  $ AVOCADO_ALLOW_LARGE_STORAGE=3Dyes tests/venv/bin/avocado \
> +    --verbose --show=3Dapp,console run -t machine:bpim2u \
> +    ../tests/avocado/boot_linux_console.py
> --
> 2.25.1
>
>

--=20
Niek Linnenbank

--0000000000007f2b3605f8afe425
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 28, 2023 at 7:48=E2=80=AF=
AM &lt;<a href=3D"mailto:qianfanguijin@163.com">qianfanguijin@163.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" target=3D"_blank"=
>qianfanguijin@163.com</a>&gt;<br>
<br>
Add documents for Banana Pi M2U<br>
<br>
Signed-off-by: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" ta=
rget=3D"_blank">qianfanguijin@163.com</a>&gt;<br></blockquote><div>Reviewed=
-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">niekli=
nnenbank@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
---<br>
=C2=A0docs/system/arm/bananapi_m2u.rst | 138 ++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 138 insertions(+)<br>
=C2=A0create mode 100644 docs/system/arm/bananapi_m2u.rst<br>
<br>
diff --git a/docs/system/arm/bananapi_m2u.rst b/docs/system/arm/bananapi_m2=
u.rst<br>
new file mode 100644<br>
index 0000000000..ae7194a9df<br>
--- /dev/null<br>
+++ b/docs/system/arm/bananapi_m2u.rst<br>
@@ -0,0 +1,138 @@<br>
+Banana Pi BPI-M2U (``bpim2u``)<br>
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
+<br>
+Banana Pi BPI-M2 Ultra is a quad-core mini single board computer built wit=
h<br>
+Allwinner A40i/R40/V40 SoC. It features 2GB of RAM and 8GB eMMC. It also<b=
r>
+has onboard WiFi and BT. On the ports side, the BPI-M2 Ultra has 2 USB A<b=
r>
+2.0 ports, 1 USB OTG port, 1 HDMI port, 1 audio jack, a DC power port,<br>
+and last but not least, a SATA port.<br>
+<br>
+Supported devices<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&q=
uot;&quot;&quot;&quot;&quot;<br>
+<br>
+The Banana Pi M2U machine supports the following devices:<br>
+<br>
+ * SMP (Quad Core Cortex-A7)<br>
+ * Generic Interrupt Controller configuration<br>
+ * SRAM mappings<br>
+ * SDRAM controller<br>
+ * Timer device (re-used from Allwinner A10)<br>
+ * UART<br>
+ * SD/MMC storage controller<br>
+ * EMAC ethernet<br>
+ * GMAC ethernet<br>
+ * Clock Control Unit<br>
+ * TWI (I2C)<br>
+<br>
+Limitations<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;<br>
+<br>
+Currently, Banana Pi M2U does *not* support the following features:<br>
+<br>
+- Graphical output via HDMI, GPU and/or the Display Engine<br>
+- Audio output<br>
+- Hardware Watchdog<br>
+- Real Time Clock<br>
+- USB 2.0 interfaces<br>
+<br>
+Also see the &#39;unimplemented&#39; array in the Allwinner R40 SoC module=
<br>
+for a complete list of unimplemented I/O devices: ``./hw/arm/allwinner-r40=
.c``<br>
+<br>
+Boot options<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;<b=
r>
+<br>
+The Banana Pi M2U machine can start using the standard -kernel functionali=
ty<br>
+for loading a Linux kernel or ELF executable. Additionally, the Banana Pi =
M2U<br>
+machine can also emulate the BootROM which is present on an actual Allwinn=
er R40<br>
+based SoC, which loads the bootloader from a SD card, specified via the -s=
d<br>
+argument to qemu-system-arm.<br>
+<br>
+Running mainline Linux<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&q=
uot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;<br>
+<br>
+To build a Linux mainline kernel that can be booted by the Banana Pi M2U m=
achine,<br>
+simply configure the kernel using the sunxi_defconfig configuration:<br>
+<br>
+.. code-block:: bash<br>
+<br>
+=C2=A0 $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make mrproper<br>
+=C2=A0 $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make sunxi_defconfi=
g<br>
+<br>
+To boot the newly build linux kernel in QEMU with the Banana Pi M2U machin=
e, use:<br>
+<br>
+.. code-block:: bash<br>
+<br>
+=C2=A0 $ qemu-system-arm -M bpim2u -nographic \<br>
+=C2=A0 =C2=A0 =C2=A0 -kernel /path/to/linux/arch/arm/boot/zImage \<br>
+=C2=A0 =C2=A0 =C2=A0 -append &#39;console=3DttyS0,115200&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 -dtb /path/to/linux/arch/arm/boot/dts/sun8i-r40-banan=
api-m2-ultra.dtb<br>
+<br>
+Banana Pi M2U images<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&q=
uot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;<br>
+<br>
+Note that the mainline kernel does not have a root filesystem. You can cho=
ose<br>
+to build you own image with buildroot using the bananapi_m2_ultra_defconfi=
g.<br>
+Also see <a href=3D"https://buildroot.org" rel=3D"noreferrer" target=3D"_b=
lank">https://buildroot.org</a> for more information.<br>
+<br>
+Another possibility is to run an OpenWrt image for Banana Pi M2U which<br>
+can be downloaded from:<br>
+<br>
+=C2=A0 =C2=A0<a href=3D"https://downloads.openwrt.org/releases/22.03.3/tar=
gets/sunxi/cortexa7/" rel=3D"noreferrer" target=3D"_blank">https://download=
s.openwrt.org/releases/22.03.3/targets/sunxi/cortexa7/</a><br>
+<br>
+When using an image as an SD card, it must be resized to a power of two. T=
his can be<br>
+done with the ``qemu-img`` command. It is recommended to only increase the=
 image size<br>
+instead of shrinking it to a power of two, to avoid loss of data. For exam=
ple,<br>
+to prepare a downloaded Armbian image, first extract it and then increase<=
br>
+its size to one gigabyte as follows:<br>
+<br>
+.. code-block:: bash<br>
+<br>
+=C2=A0 $ qemu-img resize \<br>
+=C2=A0 =C2=A0 openwrt-22.03.3-sunxi-cortexa7-sinovoip_bananapi-m2-ultra-ex=
t4-sdcard.img \<br>
+=C2=A0 =C2=A0 1G<br>
+<br>
+Instead of providing a custom Linux kernel via the -kernel command you may=
 also<br>
+choose to let the Banana Pi M2U machine load the bootloader from SD card, =
just like<br>
+a real board would do using the BootROM. Simply pass the selected image vi=
a the -sd<br>
+argument and remove the -kernel, -append, -dbt and -initrd arguments:<br>
+<br>
+.. code-block:: bash<br>
+<br>
+=C2=A0 $ qemu-system-arm -M bpim2u -nic user -nographic \<br>
+=C2=A0 =C2=A0 -sd openwrt-22.03.3-sunxi-cortexa7-sinovoip_bananapi-m2-ultr=
a-ext4-sdcard.img<br>
+<br>
+Running U-Boot<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&q=
uot;&quot;<br>
+<br>
+U-Boot mainline can be build and configured using the Bananapi_M2_Ultra_de=
fconfig<br>
+using similar commands as describe above for Linux. Note that it is recomm=
ended<br>
+for development/testing to select the following configuration setting in U=
-Boot:<br>
+<br>
+=C2=A0 Device Tree Control &gt; Provider for DTB for DT Control &gt; Embed=
ded DTB<br>
+<br>
+The BootROM of allwinner R40 loading u-boot from the 8KiB offset of sdcard=
.<br>
+Let&#39;s create an bootable disk image:<br>
+<br>
+.. code-block:: bash<br>
+<br>
+=C2=A0 $ dd if=3D/dev/zero of=3Dsd.img bs=3D32M count=3D1<br>
+=C2=A0 $ dd if=3Du-boot-sunxi-with-spl.bin of=3Dsd.img bs=3D1k seek=3D8 co=
nv=3Dnotrunc<br>
+<br>
+And then boot it.<br>
+<br>
+.. code-block:: bash<br>
+=C2=A0 $ qemu-system-arm -M bpim2u -nographic -sd sd.img<br>
+<br>
+Banana Pi M2U integration tests<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&q=
uot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot=
;&quot;&quot;&quot;&quot;&quot;<br>
+<br>
+The Banana Pi M2U machine has several integration tests included.<br>
+To run the whole set of tests, build QEMU from source and simply<br>
+provide the following command:<br>
+<br>
+.. code-block:: bash<br>
+<br>
+=C2=A0 $ cd qemu-build-dir<br>
+=C2=A0 $ AVOCADO_ALLOW_LARGE_STORAGE=3Dyes tests/venv/bin/avocado \<br>
+=C2=A0 =C2=A0 --verbose --show=3Dapp,console run -t machine:bpim2u \<br>
+=C2=A0 =C2=A0 ../tests/avocado/boot_linux_console.py<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div></div>

--0000000000007f2b3605f8afe425--

