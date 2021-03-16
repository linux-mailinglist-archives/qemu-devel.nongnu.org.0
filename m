Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90133DDB4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:41:16 +0100 (CET)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFZ5-0001aj-95
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lMEnk-0000NM-5f
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lMEng-0005y4-M9
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615920735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EACJ9883Q7MnEp/uF9ho4TOANiAD687SqaQL/J7HMJY=;
 b=GztSzCBt0AURM9mXsLmvRDh5s2joMJLJ02iqhfLt5qvoU/hcGDZ1szBoSHh9GQo4XPRflK
 YGzuvx9S3aBGs+uklfOoiRhavvSujNf9j5c+9TWWiu1WXN5uX/RTc98jq91HKWnBkHsgOm
 S9GZIWbaWUBgq/XKDFpXoMoDzv9HFdw=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-KxfSU7bqPke409DMswnptg-1; Tue, 16 Mar 2021 14:52:12 -0400
X-MC-Unique: KxfSU7bqPke409DMswnptg-1
Received: by mail-vk1-f199.google.com with SMTP id i83so10296061vki.4
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 11:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EACJ9883Q7MnEp/uF9ho4TOANiAD687SqaQL/J7HMJY=;
 b=CKkY1PwyJ9oABECblkBTr64hmHoTf2k+ZBwK1u/TuHAF27nf8YDfUq0BJmJhOu8oAa
 hJHJzr+pgaSAQP/nfC8pubnSQny8UsoBVZIsD0n4znT2qx9AnwhUOyKOWfWp/dRHngNZ
 bhyOo0yWdj+xN/ZH1dK2TEcSe7BijzetZlLqGN0+IL4nmZsUGxYHJJzEBephz8x5+LCk
 dX47TW6uLcymXCQM772ACbrWvFuMQ/bKJCWmDcdBgaRl/R0zDF2zYlbnCr8EhjWiBa6E
 iLBEIjs5Fccw8BJgJV8e+EGVXTGUDolDi0zJqTnv8pTnCjAkay5/hF4lvJl6neIRNtRM
 Wtkw==
X-Gm-Message-State: AOAM533qzSMMX0TlXhoDKod1+LlYd47tAgGLbtneFUJ+ffayF8PC2J8g
 FzXV9OJdhLaIstCTx3q+fOvBvdS4GzkLo3IzanvkzOfvw59yDPanwlqrRwab22ZPhPSIjibGAXP
 GQXw3FmeVuANWXYysxD2qF47LtZgLrRk=
X-Received: by 2002:a9f:2069:: with SMTP id 96mr393260uam.110.1615920731693;
 Tue, 16 Mar 2021 11:52:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6VXNM/gkFRY/WuQW7dNxCwuoe9micUwAm5riGmjv4HouMjBB+9KlD8uzq0SemBzbcna8swEoqos/h8t2AR40=
X-Received: by 2002:a9f:2069:: with SMTP id 96mr393244uam.110.1615920731462;
 Tue, 16 Mar 2021 11:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210214194524.768660-1-f4bug@amsat.org>
 <cae49194-7c6e-4c5e-6407-687c08ef67b9@amsat.org>
 <9e790254-2153-f24f-693a-6ecf22de814a@redhat.com>
In-Reply-To: <9e790254-2153-f24f-693a-6ecf22de814a@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 16 Mar 2021 15:51:45 -0300
Message-ID: <CAKJDGDat_bBKvkhcu1dTB54sE52od6K7NhKnVPVo8nGa9ATfdw@mail.gmail.com>
Subject: Re: [PATCH v2] tests/acceptance: Add bFLT loader linux-user test
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

Sorry for the late reply.

On Wed, Mar 10, 2021 at 2:49 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 09/03/2021 23.27, Philippe Mathieu-Daud=C3=A9 wrote:
> > ping?
>
> I guess we really need someone who could act as a maintainer for the
> tests/acceptance directory, who could pick up patches and send pull reque=
sts
> if nobody else is picking up these patches...
>
> Cleber, Wainer, Willian, any volunteers?
>

This is something I have discussed with Philippe some times already. I
understand the tests/acceptance directory is a gray area. I'm more
comfortable with the idea that subsystem maintainers are responsible
to send pull requests for tests related to them or, at least, ack
them. In case of a refactor or test improvement, someone else working
with testing core features could send the pull request.

I know Cleber has been sending pull requests with changes related to
the testing core (avocado_qemu) and changes related to tests
refactoring or code improvement. I would be more than happy to backup
him if needed.

Willian

>   Thomas
>
>
> > On 2/14/21 8:45 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Add a very quick test that runs a busybox binary in bFLT format:
> >>
> >>    $ avocado --show=3Dapp run -t linux_user tests/acceptance/load_bflt=
.py
> >>    JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
> >>    JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job=
.log
> >>     (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.1=
5 s)
> >>    RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUP=
T 0 | CANCEL 0
> >>    JOB TIME   : 0.54 s
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >> Based-on: <20210214175912.732946-1-f4bug@amsat.org>
> >>    tests/acceptance: Extract QemuBaseTest from Test
> >>    tests/acceptance: Make pick_default_qemu_bin() more generic
> >>    tests/acceptance: Introduce QemuUserTest base class
> >> ---
> >>   tests/acceptance/load_bflt.py | 51 +++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 51 insertions(+)
> >>   create mode 100644 tests/acceptance/load_bflt.py
> >>
> >> diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bfl=
t.py
> >> new file mode 100644
> >> index 00000000000..4b7796d0775
> >> --- /dev/null
> >> +++ b/tests/acceptance/load_bflt.py
> >> @@ -0,0 +1,51 @@
> >> +# Test the bFLT format
> >> +#
> >> +# Copyright (C) 2019 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> +#
> >> +# SPDX-License-Identifier: GPL-2.0-or-later
> >> +
> >> +import os
> >> +import bz2
> >> +import subprocess
> >> +
> >> +from avocado_qemu import QemuUserTest
> >> +
> >> +
> >> +class LoadBFLT(QemuUserTest):
> >> +
> >> +    def extract_cpio(self, cpio_path):
> >> +        """
> >> +        Extracts a cpio archive into the test workdir
> >> +
> >> +        :param cpio_path: path to the cpio archive
> >> +        """
> >> +        cwd =3D os.getcwd()
> >> +        os.chdir(self.workdir)
> >> +        with bz2.open(cpio_path, 'rb') as archive_cpio:
> >> +            subprocess.run(['cpio', '-i'], input=3Darchive_cpio.read(=
),
> >> +                           stderr=3Dsubprocess.DEVNULL)
> >> +        os.chdir(cwd)
> >> +
> >> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted=
 code')
> >> +    def test_stm32(self):
> >> +        """
> >> +        :avocado: tags=3Darch:arm
> >> +        :avocado: tags=3Dlinux_user
> >> +        :avocado: tags=3Dquick
> >> +        """
> >> +        # See https://elinux.org/STM32#User_Space
> >> +        rootfs_url =3D ('https://elinux.org/images/5/51/'
> >> +                      'Stm32_mini_rootfs.cpio.bz2')
> >> +        rootfs_hash =3D '9f065e6ba40cce7411ba757f924f30fcc57951e6'
> >> +        rootfs_path_bz2 =3D self.fetch_asset(rootfs_url, asset_hash=
=3Drootfs_hash)
> >> +        busybox_path =3D self.workdir + "/bin/busybox"
> >> +
> >> +        self.extract_cpio(rootfs_path_bz2)
> >> +
> >> +        res =3D self.run(busybox_path)
> >> +        ver =3D 'BusyBox v1.24.0.git (2015-02-03 22:17:13 CET) multi-=
call binary.'
> >> +        self.assertIn(ver, res.stdout_text)
> >> +
> >> +        res =3D self.run(busybox_path, ['uname', '-a'])
> >> +        unm =3D 'armv7l GNU/Linux'
> >> +        self.assertIn(unm, res.stdout_text)
> >>
> >
>


