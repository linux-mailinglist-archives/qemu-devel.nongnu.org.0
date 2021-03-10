Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1AD334165
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:22:00 +0100 (CET)
Received: from localhost ([::1]:45908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0et-0008Pi-4n
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK0dP-0007jT-JI
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK0dM-0005SX-JE
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615389622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbMLigH8Mpsu0ZbFvIpyL/zkpW0x74/TgwZ0GYk8LbU=;
 b=UcmaE46aGg+L/+IRswpRphPulFs53gBVT155x5s+5/C27fvF8B/3QnhoM2KF4GDhhyywzS
 VIBFB9hHRCIXjTx0dMUJkcY/JjaIRF/j23c8+iWekSvoVbbY777JBqPs2c/J8m//rQr4pg
 eq3xQWli5Xx4Bi7tHpuPAZDUg+ILu44=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-wNDZsa19PE-8GLUQHlABug-1; Wed, 10 Mar 2021 10:20:19 -0500
X-MC-Unique: wNDZsa19PE-8GLUQHlABug-1
Received: by mail-vk1-f198.google.com with SMTP id i83so4886991vki.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TbMLigH8Mpsu0ZbFvIpyL/zkpW0x74/TgwZ0GYk8LbU=;
 b=beM5R5uXkF9GHLFgT3DqJHWtpJrpE0R4r3ebfFg8g0XROgI+h6jMBlEf1Gf01gJK5Q
 Peu1izPJ32zY9qL/+GZ2J8uRZj38gGGL307fDSy+BKNDqZGDrAKm/a9Dh1YfI66CyEOC
 hxDc3Mhq6xehCtXcAITqCS1/iHiwOfS4gOGMGOOFTfsWGKGVMHEiO8qZyqIKFnBwnX3L
 8AQXNOykYniYIjrx1EK6w8OQvQXcok10KjQmaNx1oHWMxIx38CqPZFJPEn8CVoT2z4f0
 TnDLISC9dfOdOCMu5nV4QI+t2rLxp+naxuYMznko2dFnx2nJI74YHd2Au1T/2cGbmsVx
 bzxg==
X-Gm-Message-State: AOAM533H3b/FzA+/4VA+JwuIr+B+o4G+by63JXs2jTRJLwm/Mka9iMw0
 UsZpxE8uHGODoB6oTmb1gYDlHtYrJh3ZEPaWNXim8swSM02t2ijfvD4vgChHWlmaWpUp9fA5P4n
 R+qV0E9GLXn4w1qT2sPb84gTnh5AoOsQ=
X-Received: by 2002:a67:3241:: with SMTP id y62mr1922438vsy.45.1615389618878; 
 Wed, 10 Mar 2021 07:20:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyv1sPpYNOaFfJFEYZ9XtvQ6ICdSlP4opYfxsngHxeQ9aqXCE5wjEP6TFldZJ6E5WvRmxDfnz2CLLLwxdlg1LE=
X-Received: by 2002:a67:3241:: with SMTP id y62mr1922416vsy.45.1615389618673; 
 Wed, 10 Mar 2021 07:20:18 -0800 (PST)
MIME-Version: 1.0
References: <20210214194524.768660-1-f4bug@amsat.org>
In-Reply-To: <20210214194524.768660-1-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 10 Mar 2021 12:19:52 -0300
Message-ID: <CAKJDGDb_ZF_r3EzfXyQRKSWdvyV98eLD9=3PEdz=w+YAe_JWzw@mail.gmail.com>
Subject: Re: [PATCH v2] tests/acceptance: Add bFLT loader linux-user test
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Willian Rampazzo <willianr@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 14, 2021 at 4:45 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Add a very quick test that runs a busybox binary in bFLT format:
>
>   $ avocado --show=3Dapp run -t linux_user tests/acceptance/load_bflt.py
>   JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
>   JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
>    (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
>   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>   JOB TIME   : 0.54 s
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Based-on: <20210214175912.732946-1-f4bug@amsat.org>
>   tests/acceptance: Extract QemuBaseTest from Test
>   tests/acceptance: Make pick_default_qemu_bin() more generic
>   tests/acceptance: Introduce QemuUserTest base class
> ---
>  tests/acceptance/load_bflt.py | 51 +++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 tests/acceptance/load_bflt.py
>

Including the skipUnless on `cpio` mentioned by Thomas,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

> diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.p=
y
> new file mode 100644
> index 00000000000..4b7796d0775
> --- /dev/null
> +++ b/tests/acceptance/load_bflt.py
> @@ -0,0 +1,51 @@
> +# Test the bFLT format
> +#
> +# Copyright (C) 2019 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import bz2
> +import subprocess
> +
> +from avocado_qemu import QemuUserTest
> +
> +
> +class LoadBFLT(QemuUserTest):
> +
> +    def extract_cpio(self, cpio_path):
> +        """
> +        Extracts a cpio archive into the test workdir
> +
> +        :param cpio_path: path to the cpio archive
> +        """
> +        cwd =3D os.getcwd()
> +        os.chdir(self.workdir)
> +        with bz2.open(cpio_path, 'rb') as archive_cpio:
> +            subprocess.run(['cpio', '-i'], input=3Darchive_cpio.read(),
> +                           stderr=3Dsubprocess.DEVNULL)
> +        os.chdir(cwd)
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted co=
de')
> +    def test_stm32(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dlinux_user
> +        :avocado: tags=3Dquick
> +        """
> +        # See https://elinux.org/STM32#User_Space
> +        rootfs_url =3D ('https://elinux.org/images/5/51/'
> +                      'Stm32_mini_rootfs.cpio.bz2')
> +        rootfs_hash =3D '9f065e6ba40cce7411ba757f924f30fcc57951e6'
> +        rootfs_path_bz2 =3D self.fetch_asset(rootfs_url, asset_hash=3Dro=
otfs_hash)
> +        busybox_path =3D self.workdir + "/bin/busybox"
> +
> +        self.extract_cpio(rootfs_path_bz2)
> +
> +        res =3D self.run(busybox_path)
> +        ver =3D 'BusyBox v1.24.0.git (2015-02-03 22:17:13 CET) multi-cal=
l binary.'
> +        self.assertIn(ver, res.stdout_text)
> +
> +        res =3D self.run(busybox_path, ['uname', '-a'])
> +        unm =3D 'armv7l GNU/Linux'
> +        self.assertIn(unm, res.stdout_text)
> --
> 2.26.2
>


