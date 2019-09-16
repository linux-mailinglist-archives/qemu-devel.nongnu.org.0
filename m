Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411E4B3740
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 11:39:39 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9nTu-00022S-Bm
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 05:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <atar4qemu@gmail.com>) id 1i9nR6-0007O8-Gv
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 05:36:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <atar4qemu@gmail.com>) id 1i9nR1-0003J8-KM
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 05:36:44 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:33095)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <atar4qemu@gmail.com>)
 id 1i9nQy-0003I2-QQ; Mon, 16 Sep 2019 05:36:36 -0400
Received: by mail-io1-xd41.google.com with SMTP id m11so77112709ioo.0;
 Mon, 16 Sep 2019 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6btzDUjduqfuVpjs7yTcIN8a4vRCz2jvO3uE0k6xd7M=;
 b=DVKho6sfNoleNtScS3oqwbMR7UiuMUhjpvKLrD96nHYPBK6HdMBQf9lqGDoQ8TtC/8
 i6r32+JSIT720ndC5/N6V6XaLZbyNNw5mbfBT0Vx2xIP4cyGXTKqss6oGa50UKmak14T
 GcFJY4Gu6n9J3NNa+HBvmfxPYqUvtM5GevPC9Akk1N2xnCKBxHPyg1WLbnrFtM1c+YV+
 CNUCAdmYjOq9ZRapVOTL9HAkydr+XHMLScsLnKNdprR3/cnHKo3/pp5TPRXzqlMRIomH
 8BYdYWtVj3l3FWtiEgffjDFWwmfkwS/Lf5PsQY78a4vz/m2K3c79O+rSEqkWYQIt9ffV
 FsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6btzDUjduqfuVpjs7yTcIN8a4vRCz2jvO3uE0k6xd7M=;
 b=uH5CWujbnTE9eWUkcaR0Pc9QCD1ALiFl4fexJINdGtTsbWMVWFZtR3WNiBPAyBPDWR
 X0MHjiu7Eqy12aMhDvEIvMe/RU+WEx5RP8mWVFNHE6/zH04Gz7eJxZx2KFNcdxeonShf
 SeMYudXXx5HEbw2qONq8aCJToq75vP61XLfw1lAL/RtTVSDnMVtVvYneCWS5y6f3DeTP
 1z4Xw7SZrbiylkfvF6J1YTxVt59NAa6M9XWvEfqNeu/8UdMdkAvE00yAvKPcvGm4Dgkl
 fUZ1tDX14p2eKwYI7wMogO/LLaYfwqEfbYmrEIil9Xx28lIuxs0GQO+SNGRNybfkCWyX
 gkSQ==
X-Gm-Message-State: APjAAAUBKSARFqLDiGGJkiZg9qle7WERbtSVeDwbAYLpZB+wQsuxA77d
 EyR3Y+rd80oQKvfqFOZTkjtENHwd3eiiiHlcC0s=
X-Google-Smtp-Source: APXvYqzMZ+orkIW3ZHDzWzTMmg9uPYiHOMdnEWWoYAR1Ycd8ALvnISYeFAfU9G4OFUeaDSVkCtPHjfvkOaGXvHVrPqg=
X-Received: by 2002:a6b:c7c2:: with SMTP id
 x185mr15979835iof.224.1568626595470; 
 Mon, 16 Sep 2019 02:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190915211940.30427-1-f4bug@amsat.org>
 <20190915211940.30427-3-f4bug@amsat.org>
In-Reply-To: <20190915211940.30427-3-f4bug@amsat.org>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Mon, 16 Sep 2019 11:36:24 +0200
Message-ID: <CACXAS8Dk-Gu4eM8pSPX3YWhCeoLKpsbOe14J8StLzYO-LTYuMw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
Subject: Re: [Qemu-devel] [PATCH v2 2/6] tests/acceptance: Test Open
 Firmware on the PReP/40p
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, "open list:PReP" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 15, 2019 at 11:19 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> User case from:
> https://tyom.blogspot.com/2019/04/aixprep-under-qemu-how-to.html
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks a lot for this one, Philippe!
Acked-by: Artyom Tarasenko <atar4qemu@gmail.com>

> ---
>  tests/acceptance/ppc_prep_40p.py | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep=
_40p.py
> index 53f2d2ecf0..a0eac40d9f 100644
> --- a/tests/acceptance/ppc_prep_40p.py
> +++ b/tests/acceptance/ppc_prep_40p.py
> @@ -61,3 +61,24 @@ class IbmPrep40pMachine(Test):
>          os_banner =3D 'NetBSD 4.0 (GENERIC) #0: Sun Dec 16 00:49:40 PST =
2007'
>          self.wait_for_console_pattern(os_banner)
>          self.wait_for_console_pattern('Model: IBM PPS Model 6015')
> +
> +    def test_openfirmware(self):
> +        """
> +        :avocado: tags=3Darch:ppc
> +        :avocado: tags=3Dmachine:40p
> +        """
> +        bios_url =3D ('https://github.com/artyom-tarasenko/openfirmware/=
'
> +                    'releases/download/40p-20190413/q40pofw-serial.rom')
> +        bios_hash =3D '880c80172ea5b2247c0ac2a8bf36bbe385192c72'
> +        bios_path =3D self.fetch_asset(bios_url, asset_hash=3Dbios_hash)
> +
> +        self.vm.set_machine('40p')
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', bios_path)
> +
> +        self.vm.launch()
> +        self.wait_for_console_pattern('QEMU PReP/40p')
> +        fw_banner =3D 'Open Firmware, built  April 13, 2019 09:29:23'
> +        self.wait_for_console_pattern(fw_banner)
> +        prompt_msg =3D 'Type any key to interrupt automatic startup'
> +        self.wait_for_console_pattern(prompt_msg)
> --
> 2.20.1
>


--=20
Regards,
Artyom Tarasenko

SPARC and PPC PReP under qemu blog: http://tyom.blogspot.com/search/label/q=
emu

