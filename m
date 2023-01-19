Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6FA673516
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:07:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIROt-0000ty-5T; Thu, 19 Jan 2023 04:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pIROr-0000to-52
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:40:01 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pIROo-0000XQ-HS
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:40:00 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 348BA5C0148;
 Thu, 19 Jan 2023 04:39:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 19 Jan 2023 04:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1674121197; x=1674207597; bh=3W
 f7D4+rH3iJ38lRMhn5EeUs6SanHqPrlKGM5gsLHgc=; b=N7rx/c2O7oxSrGk5as
 TOIFKktlvM8rn0Z0ZTDNlHY+vg2sHNjRd6dqBnXPlRyoT8wHS8BbrAwjQ74pzIKf
 32+iWa67uHVlKTa+psO3Ii/BwkuCmZaLd1QPZ2ERhSFeyVMe4vdKfKgf8Mf3ZLyi
 f8Vj96kSVbk5TfSUCjNJcYZHWOEzkpC4KLbKZmVIN33uNfHCjOonyCyLAVBnHxws
 Snjuqs1sh9Tt6WZs6RzxROQCj2GWtu9kzr+6zhWDIjmYPmbN9paoyQP7yMfnC0+M
 q8UXMJCYxKmWajD3+TJiXY/d3y1KYaJ3YjOlB0Ff0PpyEOxM7jYjI54W3ZAg4syo
 mrMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674121197; x=1674207597; bh=3Wf7D4+rH3iJ38lRMhn5EeUs6San
 HqPrlKGM5gsLHgc=; b=FjT3C7OQq/nj2+QJelokt2PRf2UsBVuaGPqVSqNK2TMb
 NLyIFDxWlO/WgmIshfEOXLK+9zYdV+FcqFdwQZAlsl1qyS3li4BHK6mRB221zZoM
 TbE42CGnVYVqGHMOC0Z6xqQHpUnJpnHArz/YqnRXoYzmqYxsgllX+3MxGrg+kT6p
 Qly4X6gNDLWbhe6p8yPtCOVOUTibm43jzK+y2QNhpcpz72l9haHWpo1fh1C0am4+
 kmVA+PCLYPrUB8bS5PrGFKzWCVYJeeo64lGGZ6A+OG2WNhYiZ5I9la+Nt5osz5UK
 0QtDAB4mUXXcqLRjoJeA64BpuN85pt2om8x8Q08vqw==
X-ME-Sender: <xms:7A_JY2wfsC8gTrxqoS_st9ki2J-WxQIufQdvwUthzbVc3Qd0ktVK8Q>
 <xme:7A_JYySFvnH9ko8dywDjSoWfuaeatTOaKPIwMBgaJt9WPmWH-PXnVl_VWl5TE68fY
 1HGakxilySOW9vEs4E>
X-ME-Received: <xmr:7A_JY4VgTYbMS6d4zCqhH6Ri9AptOFkhnHJg2Vg0kpDYdQ4pOHEDhh4e0Cs36CzxD8cfMfdfS-v4wUybBE-BCUpmBsiL5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddutddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepveeiheffhfduieeikefghedtudehudduueekiefggeffuedvkefgfeeuheej
 ieefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:7A_JY8gCKUmQZ6DAMSh0EmnFx_CLsEOjDdH0YnMTSXOdSDQ_Wi3RWQ>
 <xmx:7A_JY4CjmTtW1rgZ_AM1oiUeZhh-KX47EcnrBWUY1_RgUVbRC3ANhA>
 <xmx:7A_JY9I5NqRyQtj39T-e4EwJFDtcWEhqiXnL79LalDgOG_Bj-4l-ew>
 <xmx:7Q_JY603VOQcgfBKZMuieH5OK1mO-yuoiR9B4iakuKoJbCqSv2XSdw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 04:39:54 -0500 (EST)
Date: Thu, 19 Jan 2023 10:39:53 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 2/2] tests/avocado: Add test accessing NVMe on
 big-endian MIPS target
Message-ID: <Y8kP6Zse1Uldjx6k@cormorant.local>
References: <20230118095751.49728-1-philmd@linaro.org>
 <20230118095751.49728-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FvQUKchLBZQ7RZ60"
Content-Disposition: inline
In-Reply-To: <20230118095751.49728-3-philmd@linaro.org>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--FvQUKchLBZQ7RZ60
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 10:57, Philippe Mathieu-Daud=C3=A9 wrote:
> Add a Linux-boot test accessing PCI NVMe drive on big-endian MIPS:
>=20
> $ avocado --show=3Dapp,console run -t device:nvme tests/avocado/
>    (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_mips64=
_malta_I6400_nvme:
>   console: Linux version 6.2.0-rc4 (kbj@butter) (mips64-buildroot-linux-g=
nu-gcc.br_real (Buildroot 2022.11) 11.3.0, GNU ld (GNU Binutils) 2.38) #6 T=
ue Jan 17 18:48:25 CET 2023
>   console: CPU0 revision is: 0001a900 (MIPS I6400)
>   console: FPU revision is: 20f30300
>   console: MIPS: machine is mti,malta
>   ...
>   console: PCI host bridge to bus 0000:00
>   console: pci_bus 0000:00: root bus resource [mem 0x10000000-0x17ffffff]
>   console: pci_bus 0000:00: root bus resource [io  0x1000-0x1fffff]
>   console: pci_bus 0000:00: No busn resource found for root bus, will use=
 [bus 00-ff]
>   console: pci 0000:00:0a.0: [8086:7110] type 00 class 0x060100
>   console: pci 0000:00:0a.1: [8086:7111] type 00 class 0x010180
>   console: pci 0000:00:0a.1: reg 0x20: [io  0x0000-0x000f]
>   console: pci 0000:00:0a.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01=
f7]
>   console: pci 0000:00:0a.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
>   console: pci 0000:00:0a.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x01=
77]
>   console: pci 0000:00:0a.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
>   console: pci 0000:00:0a.2: [8086:7112] type 00 class 0x0c0300
>   console: pci 0000:00:12.0: [1b36:0010] type 00 class 0x010802
>   console: pci 0000:00:12.0: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
>   console: pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
>   console: pci 0000:00:12.0: BAR 0: assigned [mem 0x10040000-0x10043fff 6=
4bit]
>   console: pci 0000:00:0a.1: BAR 4: assigned [io  0x1080-0x108f]
>   ...
>   console: ata_piix 0000:00:0a.1: enabling device (0000 -> 0001)
>   console: nvme nvme0: pci function 0000:00:12.0
>   console: nvme 0000:00:12.0: enabling device (0000 -> 0002)
>   console: nvme nvme0: 1/0/0 default/read/poll queues
>   console: nvme nvme0: Ignoring bogus Namespace Identifiers
>   ...
>   console: Run /sbin/init as init process
>   console: EXT4-fs (nvme0n1): re-mounted bf659b11-5a77-4ab5-a337-3d71ced2=
6114. Quota mode: disabled.
>   ...
>   console: Welcome to Buildroot
>   console: buildroot login: root
>   ...
>   console: # reboot
>   ...
>   console: umount: devtmpfs busy - remounted read-only
>   console: EXT4-fs (nvme0n1): re-mounted bf659b11-5a77-4ab5-a337-3d71ced2=
6114. Quota mode: disabled.
>   console: The system is going down NOW!
>   console: Requesting system reboot
>   console: reboot: Restarting system
>   PASS (11.17 s)
>   JOB TIME   : 11.91 s
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  tests/avocado/boot_linux_console.py | 44 +++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_lin=
ux_console.py
> index 8c1d981586..176793482e 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -12,6 +12,7 @@
>  import lzma
>  import gzip
>  import shutil
> +import time
> =20
>  from avocado import skip
>  from avocado import skipUnless
> @@ -269,6 +270,49 @@ def test_mips64el_malta_5KEc_cpio(self):
>          # Wait for VM to shut down gracefully
>          self.vm.wait()
> =20
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted co=
de')
> +    def test_mips64_malta_I6400_nvme(self):
> +        """
> +        :avocado: tags=3Darch:mips64
> +        :avocado: tags=3Dmachine:malta
> +        :avocado: tags=3Dendian:big
> +        :avocado: tags=3Dcpu:I6400
> +        :avocado: tags=3Ddevice:nvme
> +        """
> +        kernel_url =3D ('https://github.com/birkelund/qemu-nvme-boot/'
> +                      'raw/main/mips64/images/vmlinux')
> +        kernel_hash =3D '665662d7f7b17dc261ffb0e0ff4a1a7da91de948'
> +        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
> +        rootfs_url =3D ('https://github.com/birkelund/qemu-nvme-boot/'
> +                      'raw/main/mips64/images/rootfs.ext2.gz')
> +        rootfs_hash =3D '66f5ca4ef20ab983ec424c3ed8462bab305bbb73'
> +        rootfs_path_gz =3D self.fetch_asset(rootfs_url, asset_hash=3Droo=
tfs_hash)
> +        rootfs_path =3D os.path.join(self.workdir, "rootfs.ext2")
> +        archive.gzip_uncompress(rootfs_path_gz, rootfs_path)
> +
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE
> +                               + 'console=3DttyS0,115200 '
> +                               + 'root=3D/dev/nvme0n1 '
> +                               + 'rdinit=3D/sbin/init noreboot')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-append', kernel_command_line,
> +                         '-drive',
> +                                f'file=3D{rootfs_path},format=3Draw,if=
=3Dnone,id=3Dd0',
> +                         '-device', 'nvme,serial=3Ddefault,drive=3Dd0',
> +                         '-nic', 'user,model=3Dpcnet',
> +                         '-no-reboot', '-snapshot', '-nodefaults')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Welcome to Buildroot')
> +        time.sleep(0.1)
> +        exec_command(self, 'root')
> +        time.sleep(0.1)
> +
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                                                'MIPS I6400')
> +        exec_command_and_wait_for_pattern(self, 'reboot',
> +                                                'reboot: Restarting syst=
em')
> +
>      def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
>          kernel_path_xz =3D self.fetch_asset(kernel_url, asset_hash=3Dker=
nel_hash)
>          kernel_path =3D self.workdir + "kernel"
> --=20
> 2.38.1
>=20

Hi Philippe,

I didn't expect to store images in that repo, but can you change the
above to fetch it from

https://github.com/birkelund/qemu-issues/tree/main/20230117-mips-boot-nvme-=
pci/images

instead? Then I'll keep that archived and available.

--FvQUKchLBZQ7RZ60
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPJD+gACgkQTeGvMW1P
DekXXQf/Vcwc8WZHYbA/x9u6FNqbBV2k1tTRuGxewgxQeK2gpSJDAqXSTAJbXpn0
U55MgRAT2aM6TfB8uxtSdyjb+FEmxP9FONcY2G/454ezTD2iT0gYP0lFC9/sUgWS
+SEmpYeazgAoeEi9dP/zeIszjSP4YHi3eJZWwIPTONSHBX8zSJzH9387tbBmeoj3
K5Cycmrh6Xi/2hfyOvBqJg35vKyOaw0ym1Yek5DZ6Nm55m8aN9RSxw1vueA+WxZf
Fev221TDgel8EI05Q6s2HkU3kmI0CF8H3COQ249SXizdfhADl7jT6moZWfNUI6Hm
SnGyWbtL9bZGlhAoAiZWmada6G1GQg==
=BCVQ
-----END PGP SIGNATURE-----

--FvQUKchLBZQ7RZ60--

