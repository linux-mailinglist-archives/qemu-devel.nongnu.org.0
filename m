Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E6442082
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:07:59 +0100 (CET)
Received: from localhost ([::1]:54070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcf0-0000LS-3Z
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhbTK-0007G4-FU
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:51:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhbTF-00006N-Kh
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635789104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0S6+Om3mwexqHvaHOvzgLHf6nRLt5nN5suGHcXY/OtY=;
 b=g0j8bgf2BRZH4HP9IqTP5xiQ5dm2TmMMSLbRcuia58B7xxq+R3ox9CcJMO1qWB8jqJ4/kW
 akeyKWp2ydDgz9DLe5SmQzBsTG28NjADTQd8HlYuwo6ErlsfJYobxPXOsvcQHVjd8Jglgk
 /yewkgOcwFYPkoKEF08lUtKHxpPjKfw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-cAkpoWsvOFesU2mWTQc-6g-1; Mon, 01 Nov 2021 13:51:42 -0400
X-MC-Unique: cAkpoWsvOFesU2mWTQc-6g-1
Received: by mail-pf1-f198.google.com with SMTP id
 j3-20020a628003000000b004811bc66186so807576pfd.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0S6+Om3mwexqHvaHOvzgLHf6nRLt5nN5suGHcXY/OtY=;
 b=xcuae1lXD5kCdFskOauTXpMRfEGuOkR7MPnr1sNQhPugKJHWI7TPJnTzB4+QQAJ8Hi
 EqNHip5263SiclpcJAdPG1U0lS7dlc2n3uF952SWy3Cwy3AnCfSUKEJW2FH+KcUj7JHM
 k5efcuascFXAA1th74yX+0sW4kNbNF34n01UrTNohoX+4OCCq4xxJXZLuFao7roUCVKx
 ebolSewaq77E4X6vI8tJD48hGoceDOO1aVt1Vu0Tj3nF7Io0YQ5kf8ELev0pIzHQCqN4
 /wAjLLCbbmhBuWhV6U2EkhpdFOQoZKPbf4Mi+c4aE5SlBL4vLGgIcOfz2p8+6Lj/PW/i
 XgbQ==
X-Gm-Message-State: AOAM532kNE5jfQhvP6xR0G25c9ckG10Lb2ojJnMhfXDz6SLSKRC5z3ov
 3MefFNcgIKWR/aRuwED0H3vvD5Yo7+b4+zIHzT4jG4DMZUZFje1zWS/2trHMt4AgrgPU5bhmf3B
 twBKUlrxO6bPWq9an8Mviajs8r/dGjxs=
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr422953pju.123.1635789100947; 
 Mon, 01 Nov 2021 10:51:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuUMzkdxRrucAhS/cBNfFUDnYrDZo9fMJnslJ9z8itPrZ3KIVyh7XBjCVgV+pHEjHKYKDpfkvKl474KMocHcA=
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr422918pju.123.1635789100614; 
 Mon, 01 Nov 2021 10:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-6-f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-6-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 1 Nov 2021 14:51:14 -0300
Message-ID: <CAKJDGDb81ST8YyYw-8KV+jx0mjaqdd9siKL2sFM4yaFwG5769w@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] tests/acceptance: Add bFLT loader linux-user test
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Warner Losh <imp@bsdimp.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Phill,

On Mon, Sep 27, 2021 at 1:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Add a very quick test that runs a busybox binary in bFLT format:
>
>   $ AVOCADO_ALLOW_UNTRUSTED_CODE=3D1 \
>     avocado --show=3Dapp run -t linux_user tests/acceptance/load_bflt.py
>   JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
>   JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
>    (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
>   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>   JOB TIME   : 0.54 s
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/load_bflt.py | 54 +++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 tests/acceptance/load_bflt.py
>
> diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.p=
y
> new file mode 100644
> index 00000000000..f071a979d8e
> --- /dev/null
> +++ b/tests/acceptance/load_bflt.py
> @@ -0,0 +1,54 @@
> +# Test the bFLT loader format
> +#
> +# Copyright (C) 2019 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import bz2
> +import subprocess
> +
> +from avocado import skipUnless
> +from avocado_qemu import QemuUserTest
> +from avocado_qemu import has_cmd
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
> +    @skipUnless(*has_cmd('cpio'))
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

If there are other changes to this patch, also, change this to use the
`os` library:

busybox_path =3D os.path.join(self.workdir, "/bin/busybox")

Sorry for not catching this before.

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
> 2.31.1
>


