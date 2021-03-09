Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47409331F3B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 07:24:08 +0100 (CET)
Received: from localhost ([::1]:50458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJVmo-0001ew-Om
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 01:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lJVie-0008Co-O6; Tue, 09 Mar 2021 01:19:48 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lJVic-0007UH-Ln; Tue, 09 Mar 2021 01:19:48 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id 15so5873978qvp.13;
 Mon, 08 Mar 2021 22:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=miQeKNkvU8lnqhe4eX7n0EAYZqmKfdLV68+1Zj20kXw=;
 b=YvfDI6F1dsvxuSVYQYq0yOCc1BMuTN424Owb4vdEY9K9PbwCpWYO3o3uZaPekIOLul
 Yv7CQNxtuk/R/ygn8okmoJzzK6Z0dG7G0mmPI91+1ZLxClnRUSe+9zGFcySA5ZTJLOVi
 1pCMAiYtuozU9Ke56WOytDsp5n80R1gU9fENw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=miQeKNkvU8lnqhe4eX7n0EAYZqmKfdLV68+1Zj20kXw=;
 b=W+HeYEuoUd6ko8BMB1Ka1CUsK3XB+5H90wQCZIho4QqcysX4KoYU788uvQf/ifzXSJ
 eQj46bab8GLcttaiXb/CJ9YrqaShOxsZJFVORMcntBntqs029qwYm5LulV9uiH02AHPo
 WYoL7guiOiXc8tA+ZiinMPJC4AHoGEpFCZgPK6QR1i6IIotnE50UuuC8NnxJjRGuoqvD
 5Kx7hmHurpSK9Nf3ZMUDDc2+268XVFqEBTrHMd0Ya5wMENXMms3kCz2ira06w07l//zI
 B3vDEkkMMURE6yyl/Fz5Tqj65u+dbKbpbYMjJc6XS/ZlCcS0EiS0U4vQgNwE+z54SpOf
 dTMQ==
X-Gm-Message-State: AOAM531+b6ZkSHNc/nK1sKhddismcy/5Bur91o1Jdawh4+SlJxPtvhB3
 aHZkJG5XQb6INRIVtTt+PEjZ88jm7QbS0Uqp524=
X-Google-Smtp-Source: ABdhPJy+P4yxJWpxPJkju6HfI2TlbUZNU6jCHCLySJKYfoTf183NgNxUJwxVrwek8IgxFwli553IyPc/M8WLyGpFfSM=
X-Received: by 2002:a0c:b894:: with SMTP id y20mr24547768qvf.43.1615270784686; 
 Mon, 08 Mar 2021 22:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20210304123951.163411-1-joel@jms.id.au>
 <20210304123951.163411-3-joel@jms.id.au>
 <5e6691b6-1cdc-8d66-25e7-4df1be63be46@redhat.com>
In-Reply-To: <5e6691b6-1cdc-8d66-25e7-4df1be63be46@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Mar 2021 06:19:31 +0000
Message-ID: <CACPK8XfYVO2VBcvAhPXPx+MSe75Oi+YoJ-SCAGhUWDs1xh4RNQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tests/acceptance: Test ast2600 machine
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 20:46, Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> Hi,
>
> On 3/4/21 9:39 AM, Joel Stanley wrote:
> > This tests a Debian multi-soc arm32 Linux kernel on the AST2600 based
> > Tacoma BMC machine.
> >
> > There is no root file system so the test terminates when boot reaches
> > the stage where it attempts and fails to mount something.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > v2: Update expected strings so test passes
> > ---
> >   tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> >
> > diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> > index 2f46a08fdc10..4f1df69bc75c 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -1094,6 +1094,32 @@ def do_test_arm_aspeed(self, image):
> >           # self.wait_for_console_pattern("login:")
> >           self.vm.shutdown()
> >
> > +    def test_arm_ast2600_debian(self):
> > +        """
> > +        :avocado: tags=arch:arm
> > +        :avocado: tags=machine:tacoma-bmc
> > +        """
> > +        deb_url = ('http://snapshot.debian.org/archive/debian/'
> > +                   '20210302T203551Z/'
> > +                   'pool/main/l/linux/'
> > +                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
> > +        deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
> > +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
> > +                                    algorithm='sha256')
> > +        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
> > +        dtb_path = self.extract_from_deb(deb_path,
> > +                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
> > +
> > +        self.vm.set_console()
> > +        self.vm.add_args('-kernel', kernel_path,
> > +                         '-dtb', dtb_path,
> > +                         '-net', 'nic')
> > +        self.vm.launch()
> > +        self.wait_for_console_pattern("Booting Linux on physical CPU 0xf00")
> > +        self.wait_for_console_pattern("SMP: Total of 2 processors activated")
>
> Above check isn't reliable. Here the VM started with smp 1, therefore
> the test failed as:

We should reliably pass that check once this fix has been merged:

 https://lore.kernel.org/qemu-devel/20210303010505.635621-1-joel@jms.id.au/T/

Having that line included is helpful, as it tests the smp boot stub
functionality in our emulated machine.

>
> FAIL: Failure message found in console: Kernel panic - not syncing
>
> > +        self.wait_for_console_pattern("No filesystem could mount root")
> > +        self.vm.shutdown()
>
> You don't need to shutdown the VM as the test's tearDown() does that for
> you.

Thanks, I'll send a v2 with those removed.


>
> Thanks!
>
> - Wainer
>
> > +
> >       def test_m68k_mcf5208evb(self):
> >           """
> >           :avocado: tags=arch:m68k
>

