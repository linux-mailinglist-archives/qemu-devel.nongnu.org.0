Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0619EE786A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 19:28:53 +0100 (CET)
Received: from localhost ([::1]:41708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP9l4-0002yx-Rf
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 14:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iP8B2-0002Zj-6x
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iP8Az-0007jN-0H
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:47:30 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27127
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iP8Aw-0007gz-SL
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572281245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQltGlws9vvQiSWinUnZY84Ux+YubCBA+KpudcuhUwY=;
 b=iI8upqqY+SznAzXR8jZrNI/qPPJ2J+8o5Umkcp2zCjd4Cyn1/dwzmItV1a8Cid6s5MiEOU
 CcBi9PAs7LFpAqdHkiym8UlqDwXEul2ZaJqCLNJmeSJD/4CO8V9Lg3eEYFBpY5BdfwLHPv
 3kOMYNGHxBbsxHnEtOnVPSn6ReKnEIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-UtAvauPOObaCxDcaykz2Ag-1; Mon, 28 Oct 2019 12:47:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DF2885B6EF;
 Mon, 28 Oct 2019 16:47:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1F145DA8C;
 Mon, 28 Oct 2019 16:47:13 +0000 (UTC)
Date: Mon, 28 Oct 2019 12:47:11 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 11/26] tests/acceptance: Add test that boots Linux up to
 BusyBox on Leon3
Message-ID: <20191028164711.GF3978@localhost.localdomain>
References: <20191028073441.6448-1-philmd@redhat.com>
 <20191028073441.6448-12-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191028073441.6448-12-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: UtAvauPOObaCxDcaykz2Ag-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 28, 2019 at 08:34:26AM +0100, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Gaisler provides convenient images:
> https://www.gaisler.com/index.php/downloads/linux
>=20
> HOWTO build:
> https://www.gaisler.com/index.php/products/operating-systems/linux
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/acceptance/machine_sparc_leon3.py | 28 +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/tests/acceptance/machine_sparc_leon3.py b/tests/acceptance/m=
achine_sparc_leon3.py
> index a1394ba8ad..1172fd5da0 100644
> --- a/tests/acceptance/machine_sparc_leon3.py
> +++ b/tests/acceptance/machine_sparc_leon3.py
> @@ -10,6 +10,8 @@ import logging
> =20
>  from avocado import skipIf
>  from avocado_qemu import MachineTest
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import exec_command_and_wait_for_pattern
> =20
> =20
>  class Leon3Machine(MachineTest):
> @@ -35,3 +37,29 @@ class Leon3Machine(MachineTest):
> =20
>          wait_for_console_pattern(self,'Copyright (c) 2001-2014 HelenOS p=
roject')
>          wait_for_console_pattern(self,'Booting the kernel ...')
> +
> +    def test_leon3_linux_kernel_4_9_busybox(self):
> +        """
> +        :avocado: tags=3Darch:sparc
> +        :avocado: tags=3Dmachine:leon3
> +        """
> +        kernel_url =3D ('https://www.gaisler.com/anonftp/linux/linux-4/i=
mages/'
> +                     'leon-linux-4.9/leon-linux-4.9-1.0/up/image.ram')
> +        kernel_hash =3D '289bd1bcca10cda76d0ef2264a8657adc251f5f5'
> +        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
> +
> +        self.vm.set_machine('leon3_generic')
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_path)
> +
> +        self.vm.launch()
> +
> +        wait_for_console_pattern(self, 'TYPE: Leon3 System-on-a-Chip')
> +
> +        wait_for_console_pattern(self, 'Welcome to Buildroot')
> +
> +        wait_for_console_pattern(self, 'buildroot login:')
> +        exec_command_and_wait_for_pattern(self, 'root', '#')

On my testing, I never got passed this point (the prompt after the
username is never received/acknowledged).

> +        uname =3D 'Linux buildroot 4.9.54-00018-g62dab2c #2 ' \
> +                'Wed Oct 18 09:45:51 CEST 2017 sparc GNU/Linux'

A matter of style, certainly, but I find this better:

        uname =3D ('Linux buildroot 4.9.54-00018-g62dab2c #2 '
                 'Wed Oct 18 09:45:51 CEST 2017 sparc GNU/Linux')

- Cleber.

> +        exec_command_and_wait_for_pattern(self, 'uname -a', uname)
> --=20
> 2.21.0
>=20


