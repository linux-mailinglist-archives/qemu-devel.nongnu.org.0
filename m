Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD43E55B3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:41:21 +0200 (CEST)
Received: from localhost ([::1]:59200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNK3-0002eJ-VL
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mDNFJ-0008Ft-9X; Tue, 10 Aug 2021 04:36:25 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:42841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mDNFG-0007Iq-3h; Tue, 10 Aug 2021 04:36:25 -0400
Received: by mail-qk1-x735.google.com with SMTP id s132so638344qke.9;
 Tue, 10 Aug 2021 01:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ky41iBtKTsqOj6c47GrSldTpThWHtYYhYgNfn3sF2gM=;
 b=eWMNoSpSTWKQX5U6yiaJydP+e9kOx677ZtooH/BMfJn2bBQ0tvVSSfBrmI1lodl5hy
 IxP0Qda+lzFS+oAOdKTyq7G0PhzjCg6/mZlzddNGbR43H3RkDtbr0KdYZBMURTKS9wh2
 x5j2IY1h93RRcAtXvhzR+HqUhgzrHfFrrbgZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ky41iBtKTsqOj6c47GrSldTpThWHtYYhYgNfn3sF2gM=;
 b=BFMA8EaFA6rybfEmnFJG9hufBnr85vOzQVj34hEcuPzCqJsOpVCCHkt/U4MRgX8dnL
 SJ6BOvCGsOGr4f0hSxRQnWm1rPd+f8EaLVvUoXdWfMcaywu0GesnUjE96bNSsg4tZwLQ
 bt8+E6mwCTh5vDyyz7eXuwffAZwL1BdOTCuqKqWUmIktcQEGYkfogX/sDtVNxoL2SfPp
 R6S9blllSQZrdzk7mUMuITIQ+O8P9xMgndOSiGGsYtDzevGcQVch8Be18OoKqxdUI1lO
 cMHeMACGdpIQHlhnsM0pHQZkqjTsP2J5iPe5gLDJvb0cMIdZMUOq4r8og8hLeLpFFpzF
 EJJQ==
X-Gm-Message-State: AOAM531ItL61+oBExazOFtknG0s347xcFHlTYleaFJuWMvhE0WRYRMHd
 oZvSVxFKefNOthsnXG+jgFVJQO4I7ooqtU5vm6E=
X-Google-Smtp-Source: ABdhPJxAt7AEa6SHy5x3VEE8Oc0V4G+cYal1ln0CoGg0Hj9kt1Yg/XCjPIUaENQaplxpeBJcrszWradfqzWN/lLj/P4=
X-Received: by 2002:a37:a4c4:: with SMTP id n187mr23014985qke.55.1628584579833; 
 Tue, 10 Aug 2021 01:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210810083346.730652-1-clg@kaod.org>
In-Reply-To: <20210810083346.730652-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 10 Aug 2021 08:36:07 +0000
Message-ID: <CACPK8Xc5J3tgtv3Z4ZxpR_r3BDaXJvt3mcxSqjyAtTYa+nQA-w@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Test powernv machines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 08:34, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
> with a simple PCI layout.
>
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  tests/acceptance/boot_linux_console.py | 42 ++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 5248c8097df9..da93a475ca87 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -1176,6 +1176,48 @@ def test_ppc64_e500(self):
>          tar_hash =3D '6951d86d644b302898da2fd701739c9406527fe1'
>          self.do_test_advcal_2018('19', tar_hash, 'uImage')
>
> +    def do_test_ppc64_powernv(self, proc):
> +
> +        images_url =3D ('https://github.com/open-power/op-build/releases=
/download/v2.7/')
> +
> +        skiboot_url =3D images_url + 'skiboot.lid'
> +        skiboot_hash =3D 'a9ffcddbf238f86cda4b2cae2882d6bd13cff848910975=
8a4980efaf154f4a29'
> +        skiboot_path =3D self.fetch_asset(skiboot_url, asset_hash=3Dskib=
oot_hash,
> +                                       algorithm=3D'sha256')

What's the thought that led you to using this instead of the one that
gets packaged with qemu?

> +
> +        kernel_url =3D images_url + 'zImage.epapr'
> +        kernel_hash =3D '0ab237df661727e5392cee97460e8674057a883c5f74381=
a128fa772588d45cd'
> +        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash,
> +                                       algorithm=3D'sha256')
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', skiboot_path,
> +                         '-kernel', kernel_path,
> +                         '-append', 'console=3Dtty0 console=3Dhvc0',
> +                         '-device', 'pcie-pci-bridge,id=3Dbridge1,bus=3D=
pcie.1,addr=3D0x0',
> +                         '-device', 'nvme,bus=3Dpcie.2,addr=3D0x0,serial=
=3D1234',
> +                         '-device', 'e1000e,bus=3Dbridge1,addr=3D0x3',
> +                         '-device', 'nec-usb-xhci,bus=3Dbridge1,addr=3D0=
x2')
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern("CPU: " + proc + " generation proc=
essor")
> +        self.wait_for_console_pattern("zImage starting: loaded")
> +        self.wait_for_console_pattern("Run /init as init process")
> +        self.wait_for_console_pattern("Creating 1 MTD partitions")

This is great.

Is there any value in checking for some of the devices that come up,
like USB or ethernet?

Reviewed-by: Joel Stanley <joel@jms.id.au>

> +
> +    def test_ppc_powernv8(self):
> +        """
> +        :avocado: tags=3Darch:ppc64
> +        :avocado: tags=3Dmachine:powernv8
> +        """
> +        self.do_test_ppc64_powernv('P8')
> +
> +    def test_ppc_powernv9(self):
> +        """
> +        :avocado: tags=3Darch:ppc64
> +        :avocado: tags=3Dmachine:powernv9
> +        """
> +        self.do_test_ppc64_powernv('P9')
> +
>      def test_ppc_g3beige(self):
>          """
>          :avocado: tags=3Darch:ppc
> --
> 2.31.1
>

