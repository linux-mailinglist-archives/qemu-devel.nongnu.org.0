Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285E26E965C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:53:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUgg-0006t2-Sq; Thu, 20 Apr 2023 09:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harsh.prateek.bora@gmail.com>)
 id 1ppUgd-0006V5-OP
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:50:59 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <harsh.prateek.bora@gmail.com>)
 id 1ppUgZ-0002p9-Ga
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:50:59 -0400
Received: by mail-ej1-x62c.google.com with SMTP id dx24so6444138ejb.11
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681998653; x=1684590653;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SwdHsn5hYckHWquNqMSLE1S53mL28v80n/BnOV8MPQQ=;
 b=jXGR75jForM/3mrG1+yb8p2CWhE2gV0vquOIrW0siw0RUCE/kqxT4PILEaHRksFl1O
 ta2xkQrd/k1k8v4hi6CcVvJwzmIl0oPj4vsGN5R4VkEQUHIcnFxqvGdl4E8g21t9+zFA
 DcIaPbtlsMR58kpcyOQWICzsQbaZK/QF2XHVW3DkuTMG0/lFP7bI06OQmPdj/RpvUj6D
 mywJrhLQjSPGXVyetO8T3CBSkI2c4Myz0m4bQKw1RzeA5jijqsztfX2P+qUKv+9B/6Vv
 sGdOFo9zicYfh8+4uzDcI0Yj7Z4XKRwyUspuyKRa9ZPctlWPqvgdFGMG0HtyVwwRCM/5
 iuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998653; x=1684590653;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SwdHsn5hYckHWquNqMSLE1S53mL28v80n/BnOV8MPQQ=;
 b=bbHIrOHtYA+zotvMEPTreDQbzFFKnbO4juB9psbbkHlkclwHdc92Q4mxb9vD2VTQT8
 WlCAJWcWtGi8bEfnaZEZB7fKwSSn52bxBujNGFp+yGAGaT9P5bbfY5GJz62KQE2UTLWi
 jiZ4oGfoqdN2n4kxCBrZfKeVMUOdz0g51opS53b3Ey1U7pI6U02GNnGZNmSL2bE4bNyy
 M6scps+EOfgdlzvgltt0Ub5pal67xYauyzUYOtPoUs2v1PjkeQlWfPRuhgj5/KBOD4mB
 UkS9CDJyAD8r3NPS1ejxxa8+ZWXKJp0pKGFXATEdRV/pc4r42N89k33JPh4+Rr/bZUJb
 Ykdw==
X-Gm-Message-State: AAQBX9eVsGG0YlpDhzhNe9JuKvDeHObMbukayXeVdK4nd4rbotb6VxYZ
 G5PZZ61UMAdphD3U6ae5/vMdtLpZXCW8hY4St+g=
X-Google-Smtp-Source: AKy350bJD4fyJB7164HNdr/UEJyq33VDyaJ4EVCQNmEnBwc98szLScSyR2r/Y2WuxDJIng15O7Zqzk8sbu2EavLPLIU=
X-Received: by 2002:a17:906:450:b0:94f:6852:549b with SMTP id
 e16-20020a170906045000b0094f6852549bmr1891475eja.9.1681998652508; Thu, 20 Apr
 2023 06:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230420125217.620928-1-kconsul@linux.vnet.ibm.com>
 <20230420125217.620928-3-kconsul@linux.vnet.ibm.com>
In-Reply-To: <20230420125217.620928-3-kconsul@linux.vnet.ibm.com>
From: Harsh Prateek Bora <harsh.prateek.bora@gmail.com>
Date: Thu, 20 Apr 2023 19:20:40 +0530
Message-ID: <CAEuJdmpXiTNpdW_Wi+9dFMfvMsAgbvsw+mVB7+ptNoUArkjhsg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org, harshpb@linux.ibm.com
Content-Type: multipart/alternative; boundary="000000000000320d5f05f9c4d408"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=harsh.prateek.bora@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000320d5f05f9c4d408
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since we are optimising code a lot, one suggestion below:


On Thu, Apr 20, 2023 at 6:23=E2=80=AFPM Kautuk Consul <kconsul@linux.vnet.i=
bm.com>
wrote:

> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> boot_linux.py test-case due to which the code coverage for ppc
> decreased by around 2%. As per the discussion on
> https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> was mentioned that the baseline test for ppc64 could be modified
> to make up this 2% code coverage. This patch attempts to achieve
> this 2% code coverage by adding various device command line
> arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> test-case.
>
> The code coverage report with boot_linux.py, without it and finally
> with these tuxrun_baselines.py changes is as follows:
>
> With boot_linux.py
> ------------------
>   lines......: 13.8% (58006 of 420997 lines)
>   functions..: 20.7% (7675 of 36993 functions)
>   branches...: 9.2% (22146 of 240611 branches)
> Without boot_linux.py (without this patch changes)
> --------------------------------------------------
>   lines......: 11.9% (50174 of 420997 lines)
>   functions..: 18.8% (6947 of 36993 functions)
>   branches...: 7.4% (17580 of 239017 branches)
> Without boot_linux.py (with this patch changes)
> -----------------------------------------------
>   lines......: 13.8% (58287 of 420997 lines)
>   functions..: 20.7% (7640 of 36993 functions)
>   branches...: 8.4% (20223 of 240611 branches)
>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/avocado/tuxrun_baselines.py | 120 +++++++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 4 deletions(-)
>
> diff --git a/tests/avocado/tuxrun_baselines.py
> b/tests/avocado/tuxrun_baselines.py
> index d343376faa..ae082ac028 100644
> --- a/tests/avocado/tuxrun_baselines.py
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -11,6 +11,7 @@
>
>  import os
>  import time
> +import tempfile
>
> <snip>
>          """
> -        self.common_tuxrun(drive=3D"scsi-hd")
> +
> +        # add device args to command line.
> +        self.vm.add_args('-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0.0.1=
:0
> -:22',
> +                         '-device', 'virtio-net,netdev=3Dvnet')
> +        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
> +                         '-device', '{"driver":"virtio-net-pci","netdev"=
:'
> +
>  '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
> +                         '"bus":"pci.0","addr":"0x9"}')
> +        self.vm.add_args('-device',
> '{"driver":"qemu-xhci","p2":15,"p3":15,'
> +                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
> +        self.vm.add_args('-device',
> '{"driver":"virtio-scsi-pci","id":"scsi0"'
> +                         ',"bus":"pci.0","addr":"0x3"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":=
'
> +                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
> +        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"=
'
> +                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
> +                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
> +                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
> +        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
> +        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0=
"'
> +                         ',"bus":"usb.0","port":"1"}')
> +        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
> +                         ',"bus":"usb.0","port":"2"}')
> +        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
> +                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
> +        self.vm.add_args('-object',
> '{"qom-type":"rng-random","id":"objrng0"'
> +                         ',"filename":"/dev/urandom"}',
> +                         '-device',
> '{"driver":"virtio-rng-pci","rng":"objrng0"'
> +                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
> +        self.vm.add_args('-object',
> '{"qom-type":"cryptodev-backend-builtin",'
> +                         '"id":"objcrypto0","queues":1}',
> +                         '-device', '{"driver":"virtio-crypto-pci",'
> +                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
> +                         ':"pci.0","addr":"0xa"}')
> +        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
> +                         ',"index":1,"id":"pci.1"}')
> +        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1=
"'
> +                         ',"reg":12288}')
> +        self.vm.add_args('-m', '2G,slots=3D32,maxmem=3D4G',
> +                         '-object', 'memory-backend-ram,id=3Dram1,size=
=3D1G',
> +                         '-device', 'pc-dimm,id=3Ddimm1,memdev=3Dram1')
> +
>


Most of the above code for adding args is getting duplicated in the test
for ppc64le below as well.
It could be contained in a helper routine which could be called from both,
and would be easier to maintain.

regards,
Harsh

+        # Create a temporary qcow2 and launch the test-case
> +        with tempfile.NamedTemporaryFile(prefix=3D'tuxrun_ppc64_',
> +                                         suffix=3D'.qcow2') as qcow2:
> +            process.run(self.qemu_img + ' create -f qcow2 ' +
> +                        qcow2.name + ' 1G')
> +
> +            self.vm.add_args('-drive', 'file=3D' + qcow2.name +
> +                         ',format=3Dqcow2,if=3Dnone,id=3D'
> +                         'drive-virtio-disk1',
> +                         '-device', 'virtio-blk-pci,scsi=3Doff,bus=3Dpci=
.0,'
> +
>  'addr=3D0xb,drive=3Ddrive-virtio-disk1,id=3Dvirtio-disk1'
> +                         ',bootindex=3D2')
> +            self.common_tuxrun(drive=3D"scsi-hd")
>
>      def test_ppc64le(self):
>          """
>          :avocado: tags=3Darch:ppc64
>          :avocado: tags=3Dmachine:pseries
> -        :avocado: tags=3Dcpu:POWER8
> +        :avocado: tags=3Dcpu:POWER10
>          :avocado: tags=3Dconsole:hvc0
>          :avocado: tags=3Dtuxboot:ppc64le
>          :avocado: tags=3Dimage:vmlinux
>          :avocado: tags=3Dextradev:driver=3Dspapr-vscsi
>          :avocado: tags=3Droot:sda
>          """
> -        self.common_tuxrun(drive=3D"scsi-hd")
> +        # add device args to command line.
> +        self.vm.add_args('-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0.0.1=
:0
> -:22',
> +                         '-device', 'virtio-net,netdev=3Dvnet')
> +        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
> +                         '-device', '{"driver":"virtio-net-pci","netdev"=
:'
> +
>  '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
> +                         '"bus":"pci.0","addr":"0x9"}')
> +        self.vm.add_args('-device',
> '{"driver":"qemu-xhci","p2":15,"p3":15,'
> +                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
> +        self.vm.add_args('-device',
> '{"driver":"virtio-scsi-pci","id":"scsi0"'
> +                         ',"bus":"pci.0","addr":"0x3"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":=
'
> +                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
> +        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"=
'
> +                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
> +                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
> +                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
> +        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
> +        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0=
"'
> +                         ',"bus":"usb.0","port":"1"}')
> +        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
> +                         ',"bus":"usb.0","port":"2"}')
> +        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
> +                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
> +        self.vm.add_args('-object',
> '{"qom-type":"rng-random","id":"objrng0"'
> +                         ',"filename":"/dev/urandom"}',
> +                         '-device',
> '{"driver":"virtio-rng-pci","rng":"objrng0"'
> +                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
> +        self.vm.add_args('-object',
> '{"qom-type":"cryptodev-backend-builtin",'
> +                         '"id":"objcrypto0","queues":1}',
> +                         '-device', '{"driver":"virtio-crypto-pci",'
> +                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
> +                         ':"pci.0","addr":"0xa"}')
> +        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
> +                         ',"index":1,"id":"pci.1"}')
> +        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1=
"'
> +                         ',"reg":12288}')
> +        self.vm.add_args('-m', '2G,slots=3D32,maxmem=3D4G',
> +                         '-object', 'memory-backend-ram,id=3Dram1,size=
=3D1G',
> +                         '-device', 'pc-dimm,id=3Ddimm1,memdev=3Dram1')
> +
> +        # Create a temporary qcow2 and launch the test-case
> +        with tempfile.NamedTemporaryFile(prefix=3D'tuxrun_ppc64le_',
> +                                         suffix=3D'.qcow2') as qcow2:
> +            process.run(self.qemu_img + ' create -f qcow2 ' +
> +                        qcow2.name + ' 1G')
> +
> +            self.vm.add_args('-drive', 'file=3D' + qcow2.name +
> +                         ',format=3Dqcow2,if=3Dnone,id=3D'
> +                         'drive-virtio-disk1',
> +                         '-device', 'virtio-blk-pci,scsi=3Doff,bus=3Dpci=
.0,'
> +
>  'addr=3D0xb,drive=3Ddrive-virtio-disk1,id=3Dvirtio-disk1'
> +                         ',bootindex=3D2')
> +            self.common_tuxrun(drive=3D"scsi-hd")
>
>      def test_riscv32(self):
>          """
> --
> 2.25.1
>
>
>

--000000000000320d5f05f9c4d408
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Since we are optimising code a lot, one suggestion below:<=
br><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Apr 20, 2023 at 6:23=E2=80=AFPM Kautuk Cons=
ul &lt;<a href=3D"mailto:kconsul@linux.vnet.ibm.com">kconsul@linux.vnet.ibm=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div>Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the<br>
boot_linux.py test-case due to which the code coverage for ppc<br>
decreased by around 2%. As per the discussion on<br>
<a href=3D"https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/" r=
el=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/qemu-devel/87sf=
dpqcy4.fsf@linaro.org/</a> it<br>
was mentioned that the baseline test for ppc64 could be modified<br>
to make up this 2% code coverage. This patch attempts to achieve<br>
this 2% code coverage by adding various device command line<br>
arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py<br>
test-case.<br>
<br>
The code coverage report with boot_linux.py, without it and finally<br>
with these tuxrun_baselines.py changes is as follows:<br>
<br>
With boot_linux.py<br>
------------------<br>
=C2=A0 lines......: 13.8% (58006 of 420997 lines)<br>
=C2=A0 functions..: 20.7% (7675 of 36993 functions)<br>
=C2=A0 branches...: 9.2% (22146 of 240611 branches)<br>
Without boot_linux.py (without this patch changes)<br>
--------------------------------------------------<br>
=C2=A0 lines......: 11.9% (50174 of 420997 lines)<br>
=C2=A0 functions..: 18.8% (6947 of 36993 functions)<br>
=C2=A0 branches...: 7.4% (17580 of 239017 branches)<br>
Without boot_linux.py (with this patch changes)<br>
-----------------------------------------------<br>
=C2=A0 lines......: 13.8% (58287 of 420997 lines)<br>
=C2=A0 functions..: 20.7% (7640 of 36993 functions)<br>
=C2=A0 branches...: 8.4% (20223 of 240611 branches)<br>
<br>
Signed-off-by: Kautuk Consul &lt;<a href=3D"mailto:kconsul@linux.vnet.ibm.c=
om" target=3D"_blank">kconsul@linux.vnet.ibm.com</a>&gt;<br>
Reported-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0tests/avocado/tuxrun_baselines.py | 120 +++++++++++++++++++++++++++++=
-<br>
=C2=A01 file changed, 116 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_basel=
ines.py<br>
index d343376faa..ae082ac028 100644<br>
--- a/tests/avocado/tuxrun_baselines.py<br>
+++ b/tests/avocado/tuxrun_baselines.py<br>
@@ -11,6 +11,7 @@<br>
<br>
=C2=A0import os<br>
=C2=A0import time<br>
+import tempfile<br>
<br></div>&lt;snip&gt;<br><div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.common_tuxrun(drive=3D&quot;scsi-hd&quot;=
)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # add device args to command line.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-netdev&#39;, &#39;user,=
id=3Dvnet,hostfwd=3D:127.0.0.1:0-:22&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;virtio-net,netdev=3Dvnet&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-netdev&#39;, &#39;{&quo=
t;type&quot;:&quot;user&quot;,&quot;id&quot;:&quot;hostnet0&quot;}&#39;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;{&quot;driver&quot;:&quot;virtio-n=
et-pci&quot;,&quot;netdev&quot;:&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;hostnet0&quot;,&quot;id&quot;:&quot;net0&quot;,=
&quot;mac&quot;:&quot;52:54:00:4c:e3:86&quot;,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;bus&quot;:&quot;pci.0&quot;,&quot;addr&quot;:&q=
uot;0x9&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;qemu-xhci&quot;,&quot;p2&quot;:15,&quot;p3&quot;:15,&#=
39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;id&quot;:&quot;usb&quot;,&quot;bus&quot;:&quot;=
pci.0&quot;,&quot;addr&quot;:&quot;0x2&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;virtio-scsi-pci&quot;,&quot;id&quot;:&quot;scsi0&quot;=
&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;bus&quot;:&quot;pci.0&quot;,&quot;addr&quot;:&=
quot;0x3&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;virtio-serial-pci&quot;,&quot;id&quot;:&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;virtio-serial0&quot;,&quot;bus&quot;:&quot;pci.=
0&quot;,&quot;addr&quot;:&quot;0x4&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;scsi-cd&quot;,&quot;bus&quot;:&quot;scsi0.0&quot;&#39;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;channel&quot;:0,&quot;scsi-id&quot;:0,&quot;lu=
n&quot;:0,&quot;device_id&quot;:&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;drive-scsi0-0-0-0&quot;,&quot;id&quot;:&quot;sc=
si0-0-0-0&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;virtio-balloon-pci&quot;,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;id&quot;:&quot;balloon0&quot;,&quot;bus&quot;:&=
quot;pci.0&quot;,&quot;addr&quot;:&quot;0x6&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-audiodev&#39;, &#39;{&q=
uot;id&quot;:&quot;audio1&quot;,&quot;driver&quot;:&quot;none&quot;}&#39;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;usb-tablet&quot;,&quot;id&quot;:&quot;input0&quot;&#39=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;bus&quot;:&quot;usb.0&quot;,&quot;port&quot;:&=
quot;1&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;usb-kbd&quot;,&quot;id&quot;:&quot;input1&quot;&#39;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;bus&quot;:&quot;usb.0&quot;,&quot;port&quot;:&=
quot;2&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;VGA&quot;,&quot;id&quot;:&quot;video0&quot;,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;vgamem_mb&quot;:16,&quot;bus&quot;:&quot;pci.0&=
quot;,&quot;addr&quot;:&quot;0x7&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-object&#39;, &#39;{&quo=
t;qom-type&quot;:&quot;rng-random&quot;,&quot;id&quot;:&quot;objrng0&quot;&=
#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;filename&quot;:&quot;/dev/urandom&quot;}&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;{&quot;driver&quot;:&quot;virtio-r=
ng-pci&quot;,&quot;rng&quot;:&quot;objrng0&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;id&quot;:&quot;rng0&quot;,&quot;bus&quot;:&quo=
t;pci.0&quot;,&quot;addr&quot;:&quot;0x8&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-object&#39;, &#39;{&quo=
t;qom-type&quot;:&quot;cryptodev-backend-builtin&quot;,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;id&quot;:&quot;objcrypto0&quot;,&quot;queues&qu=
ot;:1}&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;{&quot;driver&quot;:&quot;virtio-c=
rypto-pci&quot;,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;cryptodev&quot;:&quot;objcrypto0&quot;,&quot;id=
&quot;:&quot;crypto0&quot;,&quot;bus&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;:&quot;pci.0&quot;,&quot;addr&quot;:&quot;0xa&quot;}&=
#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;spapr-pci-host-bridge&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;index&quot;:1,&quot;id&quot;:&quot;pci.1&quot;=
}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;spapr-vscsi&quot;,&quot;id&quot;:&quot;scsi1&quot;&#39=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;reg&quot;:12288}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-m&#39;, &#39;2G,slots=
=3D32,maxmem=3D4G&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-object&#39;, &#39;memory-backend-ram,id=3Dram1,size=
=3D1G&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;pc-dimm,id=3Ddimm1,memdev=3Dram1&#=
39;)<br>
+<br></div></blockquote><div><br></div><div><br></div><div>Most of the abov=
e code for adding args is getting duplicated in the test for ppc64le below =
as well.</div><div>It could be contained in a helper routine which could be=
 called from both, and would be easier to maintain.<br></div><div><br></div=
><div>regards,</div><div>Harsh <br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create a temporary qcow2 and launch the test=
-case<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with tempfile.NamedTemporaryFile(prefix=3D&#39=
;tuxrun_ppc64_&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0su=
ffix=3D&#39;.qcow2&#39;) as qcow2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process.run(self.qemu_img + &#39=
; create -f qcow2 &#39; +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://qcow2.name" rel=3D"noreferrer" target=3D"_blan=
k">qcow2.name</a> + &#39; 1G&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-drive&#39=
;, &#39;file=3D&#39; + <a href=3D"http://qcow2.name" rel=3D"noreferrer" tar=
get=3D"_blank">qcow2.name</a> +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,format=3Dqcow2,if=3Dnone,id=3D&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;drive-virtio-disk1&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;virtio-blk-pci,scsi=3Doff,bus=3Dpc=
i.0,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;addr=3D0xb,drive=3Ddrive-virtio-disk1,id=3Dvirtio-dis=
k1&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,bootindex=3D2&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.common_tuxrun(drive=3D&quot=
;scsi-hd&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_ppc64le(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Darch:ppc64<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Dmachine:pseries<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dcpu:POWER8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dcpu:POWER10<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Dconsole:hvc0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Dtuxboot:ppc64le<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Dimage:vmlinux<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Dextradev:driver=3Dspapr-=
vscsi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Droot:sda<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.common_tuxrun(drive=3D&quot;scsi-hd&quot;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # add device args to command line.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-netdev&#39;, &#39;user,=
id=3Dvnet,hostfwd=3D:127.0.0.1:0-:22&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;virtio-net,netdev=3Dvnet&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-netdev&#39;, &#39;{&quo=
t;type&quot;:&quot;user&quot;,&quot;id&quot;:&quot;hostnet0&quot;}&#39;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;{&quot;driver&quot;:&quot;virtio-n=
et-pci&quot;,&quot;netdev&quot;:&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;hostnet0&quot;,&quot;id&quot;:&quot;net0&quot;,=
&quot;mac&quot;:&quot;52:54:00:4c:e3:86&quot;,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;bus&quot;:&quot;pci.0&quot;,&quot;addr&quot;:&q=
uot;0x9&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;qemu-xhci&quot;,&quot;p2&quot;:15,&quot;p3&quot;:15,&#=
39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;id&quot;:&quot;usb&quot;,&quot;bus&quot;:&quot;=
pci.0&quot;,&quot;addr&quot;:&quot;0x2&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;virtio-scsi-pci&quot;,&quot;id&quot;:&quot;scsi0&quot;=
&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;bus&quot;:&quot;pci.0&quot;,&quot;addr&quot;:&=
quot;0x3&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;virtio-serial-pci&quot;,&quot;id&quot;:&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;virtio-serial0&quot;,&quot;bus&quot;:&quot;pci.=
0&quot;,&quot;addr&quot;:&quot;0x4&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;scsi-cd&quot;,&quot;bus&quot;:&quot;scsi0.0&quot;&#39;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;channel&quot;:0,&quot;scsi-id&quot;:0,&quot;lu=
n&quot;:0,&quot;device_id&quot;:&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;drive-scsi0-0-0-0&quot;,&quot;id&quot;:&quot;sc=
si0-0-0-0&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;virtio-balloon-pci&quot;,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;id&quot;:&quot;balloon0&quot;,&quot;bus&quot;:&=
quot;pci.0&quot;,&quot;addr&quot;:&quot;0x6&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-audiodev&#39;, &#39;{&q=
uot;id&quot;:&quot;audio1&quot;,&quot;driver&quot;:&quot;none&quot;}&#39;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;usb-tablet&quot;,&quot;id&quot;:&quot;input0&quot;&#39=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;bus&quot;:&quot;usb.0&quot;,&quot;port&quot;:&=
quot;1&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;usb-kbd&quot;,&quot;id&quot;:&quot;input1&quot;&#39;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;bus&quot;:&quot;usb.0&quot;,&quot;port&quot;:&=
quot;2&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;VGA&quot;,&quot;id&quot;:&quot;video0&quot;,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;vgamem_mb&quot;:16,&quot;bus&quot;:&quot;pci.0&=
quot;,&quot;addr&quot;:&quot;0x7&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-object&#39;, &#39;{&quo=
t;qom-type&quot;:&quot;rng-random&quot;,&quot;id&quot;:&quot;objrng0&quot;&=
#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;filename&quot;:&quot;/dev/urandom&quot;}&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;{&quot;driver&quot;:&quot;virtio-r=
ng-pci&quot;,&quot;rng&quot;:&quot;objrng0&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;id&quot;:&quot;rng0&quot;,&quot;bus&quot;:&quo=
t;pci.0&quot;,&quot;addr&quot;:&quot;0x8&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-object&#39;, &#39;{&quo=
t;qom-type&quot;:&quot;cryptodev-backend-builtin&quot;,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;id&quot;:&quot;objcrypto0&quot;,&quot;queues&qu=
ot;:1}&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;{&quot;driver&quot;:&quot;virtio-c=
rypto-pci&quot;,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&quot;cryptodev&quot;:&quot;objcrypto0&quot;,&quot;id=
&quot;:&quot;crypto0&quot;,&quot;bus&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;:&quot;pci.0&quot;,&quot;addr&quot;:&quot;0xa&quot;}&=
#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;spapr-pci-host-bridge&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;index&quot;:1,&quot;id&quot;:&quot;pci.1&quot;=
}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-device&#39;, &#39;{&quo=
t;driver&quot;:&quot;spapr-vscsi&quot;,&quot;id&quot;:&quot;scsi1&quot;&#39=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,&quot;reg&quot;:12288}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-m&#39;, &#39;2G,slots=
=3D32,maxmem=3D4G&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-object&#39;, &#39;memory-backend-ram,id=3Dram1,size=
=3D1G&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;pc-dimm,id=3Ddimm1,memdev=3Dram1&#=
39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create a temporary qcow2 and launch the test=
-case<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with tempfile.NamedTemporaryFile(prefix=3D&#39=
;tuxrun_ppc64le_&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0su=
ffix=3D&#39;.qcow2&#39;) as qcow2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process.run(self.qemu_img + &#39=
; create -f qcow2 &#39; +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://qcow2.name" rel=3D"noreferrer" target=3D"_blan=
k">qcow2.name</a> + &#39; 1G&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-drive&#39=
;, &#39;file=3D&#39; + <a href=3D"http://qcow2.name" rel=3D"noreferrer" tar=
get=3D"_blank">qcow2.name</a> +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,format=3Dqcow2,if=3Dnone,id=3D&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;drive-virtio-disk1&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;virtio-blk-pci,scsi=3Doff,bus=3Dpc=
i.0,&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;addr=3D0xb,drive=3Ddrive-virtio-disk1,id=3Dvirtio-dis=
k1&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;,bootindex=3D2&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.common_tuxrun(drive=3D&quot=
;scsi-hd&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_riscv32(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000320d5f05f9c4d408--

