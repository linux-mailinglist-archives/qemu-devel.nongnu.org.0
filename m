Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780856DA28D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 22:22:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkW7F-00088r-E7; Thu, 06 Apr 2023 16:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pkW7D-00088V-9L; Thu, 06 Apr 2023 16:21:51 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pkW7A-0001HC-5O; Thu, 06 Apr 2023 16:21:51 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-54c061acbc9so81235257b3.11; 
 Thu, 06 Apr 2023 13:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680812506;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hwZIOk9r8WecfKC7qcRFGFJG7SUVCUqRcjrp8HwA4Ek=;
 b=W5mZuJFB578NfKe7LCRwEzhXFryUgbcbtXSZhaUPhMqCJQi9VdKJg+bnnGz8GR1GLa
 XQHWlOhwuB43J5u1IlC8hcfIe0QFDSPQZzf9En2TbdedihcG6JO47h4fjEbxtIi1R299
 /XfJSkNu2YPyTqwYTZrAKCahrtWsm3o15ttZPb9txxn8zKn4wq+GCS0RmIERUaJ4a+RI
 3EQ6oqQEQTaw1f+0Dq6LpiYFrFmN1NIXeHjgOjoIStq+3+oGYleS5EUCLkp1rs25t8Rp
 c05O8meRYGD4bfj7JtXyXHZGySLbNEcTYS+iPsqzoBtnToZv/+qFMxdwA0ufu6RmTMDU
 K/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680812506;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hwZIOk9r8WecfKC7qcRFGFJG7SUVCUqRcjrp8HwA4Ek=;
 b=s4d27vLzldlqSJfRjNEvFgLH/j0QE7OxiBVdwNebL0NON2LGU4G8gBV/5gMTPy5gUk
 I1QvNS7Mr1tF03lvW/V5/bAcJRFYDNt92C+9Tk1a3zb2puTg9+H8wQkarnELLgpkhfAZ
 Cdjygj73z0DG0JU1948LZNculNBY+OCDWd6nkOl8eZbFwd99fwxRMciJKnoBUDkKyRZn
 32NDPPup8WEjx08rdnHu7IxYYpMEFwK8xEH9C+o6lmX9f+s+WyqFTZCEvXhMZH30tve3
 2yvZIqdj6ln7ibHTX9NGi3UzuxJ/a+/BFtxyxuQP1JtYlsmH96kuCwQmp9hZcLtVAZE3
 z31A==
X-Gm-Message-State: AAQBX9egjY/LU9H2jD6Prjyua+E7cyI1gOGjrRmFfd4gXdvrGvKl8eCp
 CvrL38u23d9jiPhzb81OdjM3BRMvzUk9GK4osLfdeIOHyYs=
X-Google-Smtp-Source: AKy350Zt1kj4mmSKSdG/nqdKJkL7iHcqNMhUVnYx/6AOoAibQJCzUuojmq8DYHlWYqg1MF0ho0AFpYgxWUPr57r/dLA=
X-Received: by 2002:a81:c406:0:b0:534:d71f:14e6 with SMTP id
 j6-20020a81c406000000b00534d71f14e6mr6683197ywi.9.1680812505737; Thu, 06 Apr
 2023 13:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230328054832.18790-1-qianfanguijin@163.com>
 <20230328054832.18790-2-qianfanguijin@163.com>
In-Reply-To: <20230328054832.18790-2-qianfanguijin@163.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 6 Apr 2023 22:21:34 +0200
Message-ID: <CAPan3WpDB-Zhck8TQO_6Tu4Et11qKL=Vyro=fCbnTwDDhEha6Q@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] tests: avocado: boot_linux_console: Add test
 case for bpim2u
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000056af0505f8b0a83c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yw1-x1131.google.com
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

--00000000000056af0505f8b0a83c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qianfan,

The tests look good to me and are working OK:

ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes
./build/tests/venv/bin/avocado --show=3Dapp,console run -t machine:bpim2u
tests/avocado/boot_linux_console.py
 (1/4)
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_bpim2u:
/console: [    0.000000] Booting Linux on physical CPU 0x0
console: [    0.000000] Linux version 5.10.16-sunxi (root@beast)
(arm-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture
8.3-2019.03 (arm-rel-8.36)) 8.3.0, GNU ld (GNU Toolchain for the A-profile
Architecture 8.3-2019.03 (arm-rel-8.36)) 2.32.0.20190321) #21.02.2 SMP Sun
Feb 14 21:12:17 CET 2021
console: [    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7),
cr=3D50c5387d
...
PASS (15.77 s)
RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 62.90 s

So for me:

Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>


On Tue, Mar 28, 2023 at 7:49=E2=80=AFAM <qianfanguijin@163.com> wrote:

> From: qianfan Zhao <qianfanguijin@163.com>
>
> Add test case for booting from initrd and sd card.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  tests/avocado/boot_linux_console.py | 176 ++++++++++++++++++++++++++++
>  1 file changed, 176 insertions(+)
>
> diff --git a/tests/avocado/boot_linux_console.py
> b/tests/avocado/boot_linux_console.py
> index 574609bf43..d17417828c 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -760,6 +760,182 @@ def test_arm_quanta_gsj_initrd(self):
>          self.wait_for_console_pattern(
>                  'Give root password for system maintenance')
>
> +    def test_arm_bpim2u(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:bpim2u
> +        :avocado: tags=3Daccel:tcg
> +        """
> +        deb_url =3D ('
> https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
> +                   'linux-image-current-sunxi_21.02.2_armhf.deb')
> +        deb_hash =3D '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> +        kernel_path =3D self.extract_from_deb(deb_path,
> +                                            '/boot/vmlinuz-5.10.16-sunxi=
')
> +        dtb_path =3D ('/usr/lib/linux-image-current-sunxi/'
> +                    'sun8i-r40-bananapi-m2-ultra.dtb')
> +        dtb_path =3D self.extract_from_deb(deb_path, dtb_path)
> +
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=3DttyS0,115200n8 '
> +                               'earlycon=3Duart,mmio32,0x1c28000')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
> +        self.wait_for_console_pattern(console_pattern)
> +
> +    def test_arm_bpim2u_initrd(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Daccel:tcg
> +        :avocado: tags=3Dmachine:bpim2u
> +        """
> +        deb_url =3D ('
> https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
> +                   'linux-image-current-sunxi_21.02.2_armhf.deb')
> +        deb_hash =3D '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> +        kernel_path =3D self.extract_from_deb(deb_path,
> +                                            '/boot/vmlinuz-5.10.16-sunxi=
')
> +        dtb_path =3D ('/usr/lib/linux-image-current-sunxi/'
> +                    'sun8i-r40-bananapi-m2-ultra.dtb')
> +        dtb_path =3D self.extract_from_deb(deb_path, dtb_path)
> +        initrd_url =3D ('https://github.com/groeck/linux-build-test/raw/=
'
> +                      '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
> +                      'arm/rootfs-armv7a.cpio.gz')
> +        initrd_hash =3D '604b2e45cdf35045846b8bbfbf2129b1891bdc9c'
> +        initrd_path_gz =3D self.fetch_asset(initrd_url,
> asset_hash=3Dinitrd_hash)
> +        initrd_path =3D os.path.join(self.workdir, 'rootfs.cpio')
> +        archive.gzip_uncompress(initrd_path_gz, initrd_path)
> +
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=3DttyS0,115200 '
> +                               'panic=3D-1 noreboot')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line,
> +                         '-no-reboot')
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Boot successful.')
> +
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                                                'Allwinner sun8i Family'=
)
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
> +                                                'system-control@1c00000'=
)
> +        exec_command_and_wait_for_pattern(self, 'reboot',
> +                                                'reboot: Restarting
> system')
> +        # Wait for VM to shut down gracefully
> +        self.vm.wait()
> +
> +    def test_arm_bpim2u_gmac(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Daccel:tcg
> +        :avocado: tags=3Dmachine:bpim2u
> +        :avocado: tags=3Ddevice:sd
> +        """
> +        self.require_netdev('user')
> +
> +        deb_url =3D ('
> https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
> +                   'linux-image-current-sunxi_21.02.2_armhf.deb')
> +        deb_hash =3D '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
> +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> +        kernel_path =3D self.extract_from_deb(deb_path,
> +                                            '/boot/vmlinuz-5.10.16-sunxi=
')
> +        dtb_path =3D ('/usr/lib/linux-image-current-sunxi/'
> +                    'sun8i-r40-bananapi-m2-ultra.dtb')
> +        dtb_path =3D self.extract_from_deb(deb_path, dtb_path)
> +        rootfs_url =3D ('
> http://storage.kernelci.org/images/rootfs/buildroot/'
> +
> 'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
> +        rootfs_hash =3D 'fae32f337c7b87547b10f42599acf109da8b6d9a'
> +        rootfs_path_xz =3D self.fetch_asset(rootfs_url,
> asset_hash=3Drootfs_hash)
> +        rootfs_path =3D os.path.join(self.workdir, 'rootfs.cpio')
> +        archive.lzma_uncompress(rootfs_path_xz, rootfs_path)
> +        image_pow2ceil_expand(rootfs_path)
> +
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=3DttyS0,115200 '
> +                               'root=3D/dev/mmcblk0 rootwait rw '
> +                               'panic=3D-1 noreboot')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-drive', 'file=3D' + rootfs_path +
> ',if=3Dsd,format=3Draw',
> +                         '-net', 'nic,model=3Dgmac,netdev=3Dhost_gmac',
> +                         '-netdev', 'user,id=3Dhost_gmac',
> +                         '-append', kernel_command_line,
> +                         '-no-reboot')
> +        self.vm.launch()
> +        shell_ready =3D "/bin/sh: can't access tty; job control turned o=
ff"
> +        self.wait_for_console_pattern(shell_ready)
> +
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                                                'Allwinner sun8i Family'=
)
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/partitions',
> +                                                'mmcblk0')
> +        exec_command_and_wait_for_pattern(self, 'ifconfig eth0 up',
> +                                                 'eth0: Link is Up')
> +        exec_command_and_wait_for_pattern(self, 'udhcpc eth0',
> +            'udhcpc: lease of 10.0.2.15 obtained')
> +        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
> +            '3 packets transmitted, 3 packets received, 0% packet loss')
> +        exec_command_and_wait_for_pattern(self, 'reboot',
> +                                                'reboot: Restarting
> system')
> +        # Wait for VM to shut down gracefully
> +        self.vm.wait()
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage
> limited')
> +    def test_arm_bpim2u_openwrt_22_03_3(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:bpim2u
> +        :avocado: tags=3Ddevice:sd
> +        """
> +
> +        # This test download a 8.9 MiB compressed image and expand it
> +        # to 127 MiB.
> +        image_url =3D ('
> https://downloads.openwrt.org/releases/22.03.3/targets/'
> +                     'sunxi/cortexa7/openwrt-22.03.3-sunxi-cortexa7-'
> +                     'sinovoip_bananapi-m2-ultra-ext4-sdcard.img.gz')
> +        image_hash =3D ('5b41b4e11423e562c6011640f9a7cd3b'
> +                      'dd0a3d42b83430f7caa70a432e6cd82c')
> +        image_path_gz =3D self.fetch_asset(image_url, asset_hash=3Dimage=
_hash,
> +                                         algorithm=3D'sha256')
> +        image_path =3D archive.extract(image_path_gz, self.workdir)
> +        image_pow2ceil_expand(image_path)
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-drive', 'file=3D' + image_path +
> ',if=3Dsd,format=3Draw',
> +                         '-nic', 'user',
> +                         '-no-reboot')
> +        self.vm.launch()
> +
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'usbcore.nousb '
> +                               'noreboot')
> +
> +        self.wait_for_console_pattern('U-Boot SPL')
> +
> +        interrupt_interactive_console_until_pattern(
> +                self, 'Hit any key to stop autoboot:', '=3D>')
> +        exec_command_and_wait_for_pattern(self, "setenv extraargs '" +
> +                                                kernel_command_line +
> "'", '=3D>')
> +        exec_command_and_wait_for_pattern(self, 'boot', 'Starting kernel
> ...');
> +
> +        self.wait_for_console_pattern(
> +            'Please press Enter to activate this console.')
> +
> +        exec_command_and_wait_for_pattern(self, ' ', 'root@')
> +
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                                                'Allwinner sun8i Family'=
)
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
> +                                                'system-control@1c00000'=
)
> +
>      def test_arm_orangepi(self):
>          """
>          :avocado: tags=3Darch:arm
> --
> 2.25.1
>
>

--=20
Niek Linnenbank

--00000000000056af0505f8b0a83c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Qianfan,</div><div><br></div><div>The tests look g=
ood to me and are working OK:</div><div><br></div><div>ARMBIAN_ARTIFACTS_CA=
CHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes ./build/tests/venv/bin/avocado=
 --show=3Dapp,console run -t machine:bpim2u tests/avocado/boot_linux_consol=
e.py</div><div>=C2=A0(1/4) tests/avocado/boot_linux_console.py:BootLinuxCon=
sole.test_arm_bpim2u: /console: [ =C2=A0 =C2=A00.000000] Booting Linux on p=
hysical CPU 0x0<br>console: [ =C2=A0 =C2=A00.000000] Linux version 5.10.16-=
sunxi (root@beast) (arm-linux-gnueabihf-gcc (GNU Toolchain for the A-profil=
e Architecture 8.3-2019.03 (arm-rel-8.36)) 8.3.0, GNU ld (GNU Toolchain for=
 the A-profile Architecture 8.3-2019.03 (arm-rel-8.36)) 2.32.0.20190321) #2=
1.02.2 SMP Sun Feb 14 21:12:17 CET 2021<br>console: [ =C2=A0 =C2=A00.000000=
] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D50c5387d<br></di=
v><div>...</div><div>PASS (15.77 s)<br>RESULTS =C2=A0 =C2=A0: PASS 4 | ERRO=
R 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0<br>JOB TIME =C2=A0 =
: 62.90 s</div><div><br></div><div>So for me:</div><div><br></div><div>Test=
ed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">niek=
linnenbank@gmail.com</a>&gt;<br></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 28, 2023=
 at 7:49=E2=80=AFAM &lt;<a href=3D"mailto:qianfanguijin@163.com">qianfangui=
jin@163.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" =
target=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
<br>
Add test case for booting from initrd and sd card.<br>
<br>
Signed-off-by: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" ta=
rget=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
---<br>
=C2=A0tests/avocado/boot_linux_console.py | 176 +++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 176 insertions(+)<br>
<br>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux=
_console.py<br>
index 574609bf43..d17417828c 100644<br>
--- a/tests/avocado/boot_linux_console.py<br>
+++ b/tests/avocado/boot_linux_console.py<br>
@@ -760,6 +760,182 @@ def test_arm_quanta_gsj_initrd(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wait_for_console_pattern(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Give roo=
t password for system maintenance&#39;)<br>
<br>
+=C2=A0 =C2=A0 def test_arm_bpim2u(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:arm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:bpim2u<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Daccel:tcg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"https://apt.armbi=
an.com/pool/main/l/linux-5.10.16-sunxi/" rel=3D"noreferrer" target=3D"_blan=
k">https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
linux-image-current-sunxi_21.02.2_armhf.deb&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D &#39;9fa84beda245cabf0b4fa84cf6ea=
a7738ead1da0&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, asset_h=
ash=3Ddeb_hash)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.extract_from_deb(deb_path=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;/boot/vmlinuz-5.10.16-sunxi&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path =3D (&#39;/usr/lib/linux-image-curren=
t-sunxi/&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;sun8i-r40-bananapi-m2-ultra.dtb&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path =3D self.extract_from_deb(deb_path, d=
tb_path)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_console()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (self.KERNEL_COMMON_CO=
MMAND_LINE +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;console=3DttyS0,115200n8 &#39;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;earlycon=3Duart,mmio32,0x1c28000=
&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-kernel&#39;, kernel_pat=
h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-dtb&#39;, dtb_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-append&#39;, kernel_command_line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 console_pattern =3D &#39;Kernel command line: =
%s&#39; % kernel_command_line<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(console_pattern)=
<br>
+<br>
+=C2=A0 =C2=A0 def test_arm_bpim2u_initrd(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:arm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Daccel:tcg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:bpim2u<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"https://apt.armbi=
an.com/pool/main/l/linux-5.10.16-sunxi/" rel=3D"noreferrer" target=3D"_blan=
k">https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
linux-image-current-sunxi_21.02.2_armhf.deb&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D &#39;9fa84beda245cabf0b4fa84cf6ea=
a7738ead1da0&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, asset_h=
ash=3Ddeb_hash)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.extract_from_deb(deb_path=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;/boot/vmlinuz-5.10.16-sunxi&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path =3D (&#39;/usr/lib/linux-image-curren=
t-sunxi/&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;sun8i-r40-bananapi-m2-ultra.dtb&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path =3D self.extract_from_deb(deb_path, d=
tb_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_url =3D (&#39;<a href=3D"https://github=
.com/groeck/linux-build-test/raw/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/groeck/linux-build-test/raw/</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;arm/rootfs-armv7a.cpio.gz&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_hash =3D &#39;604b2e45cdf35045846b8bbfb=
f2129b1891bdc9c&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_path_gz =3D self.fetch_asset(initrd_url=
, asset_hash=3Dinitrd_hash)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_path =3D os.path.join(self.workdir, &#3=
9;rootfs.cpio&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive.gzip_uncompress(initrd_path_gz, initrd=
_path)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_console()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (self.KERNEL_COMMON_CO=
MMAND_LINE +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;console=3DttyS0,115200 &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;panic=3D-1 noreboot&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-kernel&#39;, kernel_pat=
h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-dtb&#39;, dtb_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-initrd&#39;, initrd_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-append&#39;, kernel_command_line,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-no-reboot&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(&#39;Boot succes=
sful.&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;c=
at /proc/cpuinfo&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;Allwinner sun8i Family&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;c=
at /proc/iomem&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;system-control@1c00000&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;r=
eboot&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;reboot: Restarting system&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Wait for VM to shut down gracefully<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.wait()<br>
+<br>
+=C2=A0 =C2=A0 def test_arm_bpim2u_gmac(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:arm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Daccel:tcg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:bpim2u<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Ddevice:sd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.require_netdev(&#39;user&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"https://apt.armbi=
an.com/pool/main/l/linux-5.10.16-sunxi/" rel=3D"noreferrer" target=3D"_blan=
k">https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
linux-image-current-sunxi_21.02.2_armhf.deb&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D &#39;9fa84beda245cabf0b4fa84cf6ea=
a7738ead1da0&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, asset_h=
ash=3Ddeb_hash)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.extract_from_deb(deb_path=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;/boot/vmlinuz-5.10.16-sunxi&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path =3D (&#39;/usr/lib/linux-image-curren=
t-sunxi/&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;sun8i-r40-bananapi-m2-ultra.dtb&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path =3D self.extract_from_deb(deb_path, d=
tb_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs_url =3D (&#39;<a href=3D"http://storage=
.kernelci.org/images/rootfs/buildroot/" rel=3D"noreferrer" target=3D"_blank=
">http://storage.kernelci.org/images/rootfs/buildroot/</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;buildroot-baseline/20221116.0/armel/rootfs.ext2.xz&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs_hash =3D &#39;fae32f337c7b87547b10f4259=
9acf109da8b6d9a&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs_path_xz =3D self.fetch_asset(rootfs_url=
, asset_hash=3Drootfs_hash)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs_path =3D os.path.join(self.workdir, &#3=
9;rootfs.cpio&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive.lzma_uncompress(rootfs_path_xz, rootfs=
_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_pow2ceil_expand(rootfs_path)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_console()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (self.KERNEL_COMMON_CO=
MMAND_LINE +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;console=3DttyS0,115200 &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;root=3D/dev/mmcblk0 rootwait rw =
&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;panic=3D-1 noreboot&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-kernel&#39;, kernel_pat=
h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-dtb&#39;, dtb_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-drive&#39;, &#39;file=3D&#39; + rootfs_path + &#39;,=
if=3Dsd,format=3Draw&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-net&#39;, &#39;nic,model=3Dgmac,netdev=3Dhost_gmac&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-netdev&#39;, &#39;user,id=3Dhost_gmac&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-append&#39;, kernel_command_line,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-no-reboot&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shell_ready =3D &quot;/bin/sh: can&#39;t acces=
s tty; job control turned off&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(shell_ready)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;c=
at /proc/cpuinfo&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;Allwinner sun8i Family&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;c=
at /proc/partitions&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;mmcblk0&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;i=
fconfig eth0 up&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;eth0: Link is Up&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;u=
dhcpc eth0&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;udhcpc: lease of 10.0.2.15 =
obtained&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;p=
ing -c 3 10.0.2.2&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;3 packets transmitted, 3 pa=
ckets received, 0% packet loss&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;r=
eboot&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;reboot: Restarting system&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Wait for VM to shut down gracefully<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.wait()<br>
+<br>
+=C2=A0 =C2=A0 @skipUnless(os.getenv(&#39;AVOCADO_ALLOW_LARGE_STORAGE&#39;)=
, &#39;storage limited&#39;)<br>
+=C2=A0 =C2=A0 def test_arm_bpim2u_openwrt_22_03_3(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:arm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:bpim2u<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Ddevice:sd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This test download a 8.9 MiB compressed imag=
e and expand it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to 127 MiB.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_url =3D (&#39;<a href=3D"https://downloa=
ds.openwrt.org/releases/22.03.3/targets/" rel=3D"noreferrer" target=3D"_bla=
nk">https://downloads.openwrt.org/releases/22.03.3/targets/</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;sunxi/cortexa7/openwrt-22.03.3-sunxi-cortexa7-&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;sinovoip_bananapi-m2-ultra-ext4-sdcard.img.gz&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_hash =3D (&#39;5b41b4e11423e562c6011640f=
9a7cd3b&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;dd0a3d42b83430f7caa70a432e6cd82c&#39;)<br>
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
=C2=A0 =C2=A0 =C2=A0 &#39;Allwinner sun8i Family&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_command_and_wait_for_pattern(self, &#39;c=
at /proc/iomem&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;system-control@1c00000&#39;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def test_arm_orangepi(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Darch:arm<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div>

--00000000000056af0505f8b0a83c--

