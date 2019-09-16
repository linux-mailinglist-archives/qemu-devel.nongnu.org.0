Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF6B4129
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 21:34:37 +0200 (CEST)
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9wlg-00078h-Bz
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 15:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1i9wk8-0006as-S3
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 15:33:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1i9wk1-0008ME-HD
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 15:32:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42866)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1i9wk1-0008Lp-9e; Mon, 16 Sep 2019 15:32:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ABD012BF02;
 Mon, 16 Sep 2019 19:32:51 +0000 (UTC)
Received: from dhcp-17-173.bos.redhat.com (dhcp-17-173.bos.redhat.com
 [10.18.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4798D60BF7;
 Mon, 16 Sep 2019 19:32:47 +0000 (UTC)
Date: Mon, 16 Sep 2019 15:32:45 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20190916193245.GA15318@dhcp-17-173.bos.redhat.com>
References: <20190915211940.30427-1-f4bug@amsat.org>
 <20190915211940.30427-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190915211940.30427-4-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 16 Sep 2019 19:32:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 3/6] tests/acceptance: Test OpenBIOS on
 the PReP/40p
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
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 15, 2019 at 11:19:37PM +0200, Philippe Mathieu-Daud=E9 wrote:
> User case from:
> https://mail.coreboot.org/pipermail/openbios/2018-May/010360.html
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/acceptance/ppc_prep_40p.py | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_pr=
ep_40p.py
> index a0eac40d9f..87b5311b89 100644
> --- a/tests/acceptance/ppc_prep_40p.py
> +++ b/tests/acceptance/ppc_prep_40p.py
> @@ -82,3 +82,35 @@ class IbmPrep40pMachine(Test):
>          self.wait_for_console_pattern(fw_banner)
>          prompt_msg =3D 'Type any key to interrupt automatic startup'
>          self.wait_for_console_pattern(prompt_msg)
> +
> +    def test_openbios_192m(self):
> +        """
> +        :avocado: tags=3Darch:ppc
> +        :avocado: tags=3Dmachine:40p
> +        """
> +        self.vm.set_machine('40p')
> +        self.vm.set_console()
> +        self.vm.add_args('-m', '192')

Is 192 a magic number (some kind of limit)?  Or just a value to check
against later?

> +
> +        self.vm.launch()
> +        self.wait_for_console_pattern('>> OpenBIOS')
> +        self.wait_for_console_pattern('>> Memory: 192M')
> +        self.wait_for_console_pattern('>> CPU type PowerPC,604')
> +

On my testing, this is a very stable test, I'm only getting PASSes.

> +    def test_openbios_and_netbsd(self):
> +        """
> +        :avocado: tags=3Darch:ppc
> +        :avocado: tags=3Dmachine:40p
> +        """
> +        drive_url =3D ('https://ftp.netbsd.org/pub/NetBSD/iso/7.1.2/'
> +                     'NetBSD-7.1.2-prep.iso')
> +        drive_hash =3D '78734c1bdda79778f0b6f391969ad2458ed8981c'

According to https://ftp.netbsd.org/pub/NetBSD/iso/7.1.2/MD5 :

  MD5 (NetBSD-7.1.2-prep.iso) =3D ac6fa2707d888b36d6fa64de6e7fe48e

Which would require either:

  drive_hash =3D 'ac6fa2707d888b36d6fa64de6e7fe48e'
  drive_path =3D self.fetch_asset(drive_url, asset_hash=3Ddrive_hash,
                                algorithm=3D'md5')

Or, if you want to use sha1:

  drive_hash =3D '467ba366e4574d32b060532660369542d607ec5d'

- Cleber.

> +        drive_path =3D self.fetch_asset(drive_url, asset_hash=3Ddrive_=
hash)
> +
> +        self.vm.set_machine('40p')
> +        self.vm.set_console()
> +        self.vm.add_args('-cdrom', drive_path,
> +                         '-boot', 'd')
> +
> +        self.vm.launch()
> +        self.wait_for_console_pattern('NetBSD/prep BOOT, Revision 1.9'=
)
> --=20
> 2.20.1
>=20
>=20

