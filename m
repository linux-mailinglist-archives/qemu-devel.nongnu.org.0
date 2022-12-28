Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4012E6586CF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 21:44:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAdG7-0003bP-Mj; Wed, 28 Dec 2022 15:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pAdG2-0003b1-9t; Wed, 28 Dec 2022 15:42:38 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pAdFy-0005i1-VC; Wed, 28 Dec 2022 15:42:36 -0500
Received: by mail-yb1-xb30.google.com with SMTP id g4so18584121ybg.7;
 Wed, 28 Dec 2022 12:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wyT1y8MzFuYNPjaJ3WwbYkVyX7G467X8O7pcp6P7Mvg=;
 b=hqUuvw2RdM2KtnJvAcOv+Rx1sKuU+4gKKf0vttV7ehM2jdda0+NfbxQJ94XkascNSn
 cteqthxb8e6Et0DUGbOXBcTPJd0sgYPKjoqM21aNDnRjx3s4vsd08NbBPjjt0LzwK/Rj
 EHpC16IJEgfYw2VcUD8qkfI9X1XbzrholOJJO7A27YgRR9+3y3VbZjgOAr9TdPxWuzwV
 myX1LyQU35dK4pm21UuF54Diwj641kQj7tBCMvFYL60mCXYm//I5LTHzo+lyV48PjvJy
 hViV/lDj0DU03bKc65KUAJL57VZb4gCNhV5ezoU87kU7fRgKOms6abMGvR+VS6z1GrxY
 kfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wyT1y8MzFuYNPjaJ3WwbYkVyX7G467X8O7pcp6P7Mvg=;
 b=WskaXu1qrTnUNJKOtoBVjiqbfX7hPrBsg5tn8LDlMrQvT4Zohx6oS/JkTBCeQt3YAx
 BwdyYbTxbTeokB8CX0aSeSaAhnw2cfO4WNGQ/a0HaOmK2dxSdZR4ky8xDWZS3h9e7db5
 myEiTdUKAaXTUK5gdVkYbR8uEk7tZ2i4KWS6S6E75k+f/aBHnlf+5XA8ZCKeGmBvkKwg
 iyLXyGWmDQxhd7Nt7pRjjne39ZrxNXUFgopJ+tQ0O7BXIBMos5Pq6FDblGDga7NItqTQ
 epU3JF7dkdyGKd14K2rgNaNUBz5Xsf5DyGZWeyppEWVOpM88jIXeCNZLpM00NA60MiM1
 B+cQ==
X-Gm-Message-State: AFqh2koKLb5k9k4f2hOn97XRIi46RtIERpZ6cT3uTYm6DD+7Xptrbm+Z
 ns1EZmOyYuAtiM9/t9o00rcofVIz4Lma9MXA41Y=
X-Google-Smtp-Source: AMrXdXvYag69z7Y2acePUisXRHn3hnycuqtQtMxIIETRdQ3Q4Ybz4+jtXwRMNJ7ehAA3Zi+DRXf4bptV741GbCxxC5w=
X-Received: by 2002:a25:b78b:0:b0:703:657f:9c91 with SMTP id
 n11-20020a25b78b000000b00703657f9c91mr2189857ybh.387.1672260153671; Wed, 28
 Dec 2022 12:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
 <20221226220303.14420-8-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221226220303.14420-8-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 28 Dec 2022 21:42:22 +0100
Message-ID: <CAPan3Wriw0+zRf3+FbYpjDKBbsQSgozxEEcX8yR9F_6P-zdqzw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] tests/avocado: Add SD boot test to Cubieboard
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, philmd@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006e838c05f0e9681b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000006e838c05f0e9681b
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 26, 2022 at 11:03 PM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> Cubieboard now can boot directly from SD card, without the need to pass
> `-kernel` parameter. Update Avocado tests to cover this functionality.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>

Test looks fine to me, and is also working well with:

$ AVOCADO_ALLOW_LARGE_STORAGE=yes ./build/tests/venv/bin/avocado
--show=app,console run -t machine:cubieboard
tests/avocado/boot_linux_console.py
...
 (3/3)
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_openwrt_22_03_2:
 console: U-Boot SPL 2020.04-OpenWrt-r19803-9a599fee93 (Oct 14 2022 -
22:44:41 +0000)
console: DRAM: 1024 MiB
console: CPU: 1008000000Hz, AXI/AHB/APB: 3/2/2
...
console: Hardware : Allwinner sun4i/sun5i Families
PASS (13.98 s)
RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 36.82 s

So for me:

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

> ---
>  tests/avocado/boot_linux_console.py | 47 +++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/tests/avocado/boot_linux_console.py
> b/tests/avocado/boot_linux_console.py
> index ec07c64291..8c1d981586 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -620,6 +620,53 @@ def test_arm_cubieboard_sata(self):
>                                                  'sda')
>          # cubieboard's reboot is not functioning; omit reboot test.
>
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage
> limited')
> +    def test_arm_cubieboard_openwrt_22_03_2(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:cubieboard
> +        :avocado: tags=device:sd
> +        """
> +
> +        # This test download a 7.5 MiB compressed image and expand it
> +        # to 126 MiB.
> +        image_url = ('
> https://downloads.openwrt.org/releases/22.03.2/targets/'
> +                     'sunxi/cortexa8/openwrt-22.03.2-sunxi-cortexa8-'
> +                     'cubietech_a10-cubieboard-ext4-sdcard.img.gz')
> +        image_hash = ('94b5ecbfbc0b3b56276e5146b899eafa'
> +                      '2ac5dc2d08733d6705af9f144f39f554')
> +        image_path_gz = self.fetch_asset(image_url, asset_hash=image_hash,
> +                                         algorithm='sha256')
> +        image_path = archive.extract(image_path_gz, self.workdir)
> +        image_pow2ceil_expand(image_path)
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-drive', 'file=' + image_path +
> ',if=sd,format=raw',
> +                         '-nic', 'user',
> +                         '-no-reboot')
> +        self.vm.launch()
> +
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'usbcore.nousb '
> +                               'noreboot')
> +
> +        self.wait_for_console_pattern('U-Boot SPL')
> +
> +        interrupt_interactive_console_until_pattern(
> +                self, 'Hit any key to stop autoboot:', '=>')
> +        exec_command_and_wait_for_pattern(self, "setenv extraargs '" +
> +                                                kernel_command_line +
> "'", '=>')
> +        exec_command_and_wait_for_pattern(self, 'boot', 'Starting kernel
> ...');
> +
> +        self.wait_for_console_pattern(
> +            'Please press Enter to activate this console.')
> +
> +        exec_command_and_wait_for_pattern(self, ' ', 'root@')
> +
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                                                'Allwinner sun4i/sun5i')
> +        # cubieboard's reboot is not functioning; omit reboot test.
> +
>      @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might
> timeout')
>      def test_arm_quanta_gsj(self):
>          """
> --
> 2.30.2
>
>

-- 
Niek Linnenbank

--0000000000006e838c05f0e9681b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 26, 2022 at 11:03 PM Stra=
hinja Jankovic &lt;<a href=3D"mailto:strahinjapjankovic@gmail.com">strahinj=
apjankovic@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Cubieboard now can boot directly from SD card, without =
the need to pass<br>
`-kernel` parameter. Update Avocado tests to cover this functionality.<br>
<br>
Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.jankovi=
c@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<br></=
blockquote><div><br></div><div>Test looks fine to me, and is also working w=
ell with:</div><div><br></div><div>$ AVOCADO_ALLOW_LARGE_STORAGE=3Dyes ./bu=
ild/tests/venv/bin/avocado --show=3Dapp,console run -t machine:cubieboard t=
ests/avocado/boot_linux_console.py</div><div>...</div><div>=C2=A0(3/3) test=
s/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_openwr=
t_22_03_2: =C2=A0console: U-Boot SPL 2020.04-OpenWrt-r19803-9a599fee93 (Oct=
 14 2022 - 22:44:41 +0000)<br>console: DRAM: 1024 MiB<br>console: CPU: 1008=
000000Hz, AXI/AHB/APB: 3/2/2</div><div>...</div><div>console: Hardware	: Al=
lwinner sun4i/sun5i Families<br>PASS (13.98 s)<br>RESULTS =C2=A0 =C2=A0: PA=
SS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0<br>JOB T=
IME =C2=A0 : 36.82 s<br></div><div><br></div><div>So for me:<br></div><div>=
<br></div><div>Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinne=
nbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;</div><div>Tested-by: Niek=
 Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@=
gmail.com</a>&gt; <br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0tests/avocado/boot_linux_console.py | 47 ++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 47 insertions(+)<br>
<br>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux=
_console.py<br>
index ec07c64291..8c1d981586 100644<br>
--- a/tests/avocado/boot_linux_console.py<br>
+++ b/tests/avocado/boot_linux_console.py<br>
@@ -620,6 +620,53 @@ def test_arm_cubieboard_sata(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sda&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# cubieboard&#39;s reboot is not function=
ing; omit reboot test.<br>
<br>
+=C2=A0 =C2=A0 @skipUnless(os.getenv(&#39;AVOCADO_ALLOW_LARGE_STORAGE&#39;)=
, &#39;storage limited&#39;)<br>
+=C2=A0 =C2=A0 def test_arm_cubieboard_openwrt_22_03_2(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:arm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:cubieboard<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Ddevice:sd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This test download a 7.5 MiB compressed imag=
e and expand it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to 126 MiB.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_url =3D (&#39;<a href=3D"https://downloa=
ds.openwrt.org/releases/22.03.2/targets/" rel=3D"noreferrer" target=3D"_bla=
nk">https://downloads.openwrt.org/releases/22.03.2/targets/</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;sunxi/cortexa8/openwrt-22.03.2-sunxi-cortexa8-&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;cubietech_a10-cubieboard-ext4-sdcard.img.gz&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_hash =3D (&#39;94b5ecbfbc0b3b56276e5146b=
899eafa&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;2ac5dc2d08733d6705af9f144f39f554&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_path_gz =3D self.fetch_asset(image_url, =
asset_hash=3Dimage_hash,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0al=
gorithm=3D&#39;sha256&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_path =3D archive.extract(image_path_gz, =
self.workdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_pow2ceil_expand(image_path)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_console()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-drive&#39;, &#39;file=
=3D&#39; + image_path + &#39;,if=3Dsd,format=3Draw&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-nic&#39;, &#39;user&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-no-reboot&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (self.KERNEL_COMMON_CO=
MMAND_LINE +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;usbcore.nousb &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;noreboot&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(&#39;U-Boot SPL&=
#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt_interactive_console_until_pattern(<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self, &#39;Hit any=
 key to stop autoboot:&#39;, &#39;=3D&gt;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &quot;=
setenv extraargs &#39;&quot; +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 kernel_command_line + &quot;&#39;&quot;, &#39;=3D&gt;&=
#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;b=
oot&#39;, &#39;Starting kernel ...&#39;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Please press Enter to activ=
ate this console.&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39; =
&#39;, &#39;root@&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;c=
at /proc/cpuinfo&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;Allwinner sun4i/sun5i&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cubieboard&#39;s reboot is not functioning; =
omit reboot test.<br>
+<br>
=C2=A0 =C2=A0 =C2=A0@skipUnless(os.getenv(&#39;AVOCADO_TIMEOUT_EXPECTED&#39=
;), &#39;Test might timeout&#39;)<br>
=C2=A0 =C2=A0 =C2=A0def test_arm_quanta_gsj(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000006e838c05f0e9681b--

