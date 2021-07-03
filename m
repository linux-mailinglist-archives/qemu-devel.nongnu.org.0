Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564FB3BA7E4
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 10:45:22 +0200 (CEST)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzbH7-0002xm-9h
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 04:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzbFs-0002H6-Rz; Sat, 03 Jul 2021 04:44:04 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:37626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzbFr-0000iG-6y; Sat, 03 Jul 2021 04:44:04 -0400
Received: by mail-ot1-f53.google.com with SMTP id
 n99-20020a9d206c0000b029045d4f996e62so12648959ota.4; 
 Sat, 03 Jul 2021 01:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vrk7WgcY6F6uZcRhpzalMEJ4FGbkh+KCfTg/rbg0d9M=;
 b=BRmTXHJfv+d0vcpu3KoYGrF7eupF/VG6SYW4n5MExvgZCQAI4VPOxl5hS+Y1KjM/Nh
 9+ddEFkM+ydOg1Eqyhyt4O3fbG+pykNpIVvhVBHik3NrlVx6cS3YQAYabcoaPzxF+Xu/
 jysm8abo3/SNoyEjv/84pCNTYpQdE7BxW9HMwYkVG/T8b6LhVQBbhZskp/HF7+k6vBPI
 oyLBZ9+m5YXQUKAFMfdTi4v5Dtae280jQ3RYUM5SbrBr/+hdZxG+6+mFXdzUOQsc1xSW
 UTHidiKs5LQEenEhynHW2VUr2ftc5HGZL20D9ncA75Mf3tkfCQ9pypqUSEshjedglqYy
 Fhvg==
X-Gm-Message-State: AOAM530/7gmedhyhHvyrz/NRKxAwCpvqQ2Um0+iNdstH2BtkhCsYU2cj
 nNXCvKdEtIsreA5P7zS6OocWAlShbtgekh91N4dfMUOeSMA=
X-Google-Smtp-Source: ABdhPJz8Vg/+qkOPyra5xci06JCzUoo7razrsq3T645a9Y7KOn8G8Bo/sJC1pmgKmNSF7+87VYwFHkqX7ujZRo9/Hg0=
X-Received: by 2002:a05:6830:241d:: with SMTP id
 j29mr2792673ots.371.1625301841721; 
 Sat, 03 Jul 2021 01:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-4-f4bug@amsat.org>
 <6dc3fe10-924f-9f3d-baea-90e2539f58ee@amsat.org>
In-Reply-To: <6dc3fe10-924f-9f3d-baea-90e2539f58ee@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 3 Jul 2021 10:43:50 +0200
Message-ID: <CAAdtpL6+M2e=SvGFMgJBxanQJgTz0kg1th-9BxHy1TaWEfafog@mail.gmail.com>
Subject: Re: [PATCH 3/9] tests/acceptance: Tag NetBSD tests as 'os:netbsd'
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.53;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f53.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 3, 2021 at 10:41 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> CC'ing NetBSD maintainers.
>
> On 6/23/21 8:00 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Avocado allows us to select set of tests using tags.
> > When wanting to run all tests using a NetBSD guest OS,
> > it is convenient to have them tagged, add the 'os:netbsd'
> > tag.

I'll amend an command line example to run the NetBSD tests:

   $ avocado --show=3Dapp,console run -t os:netbsd tests/acceptance/

> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  tests/acceptance/boot_linux_console.py | 1 +
> >  tests/acceptance/ppc_prep_40p.py       | 2 ++
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
> > index cded547d1d4..20d57c1a8c6 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -862,6 +862,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
> >          :avocado: tags=3Darch:arm
> >          :avocado: tags=3Dmachine:orangepi-pc
> >          :avocado: tags=3Ddevice:sd
> > +        :avocado: tags=3Dos:netbsd
> >          """
> >          # This test download a 304MB compressed image and expand it to=
 2GB
> >          deb_url =3D ('http://snapshot.debian.org/archive/debian/'
> > diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_pr=
ep_40p.py
> > index 96ba13b8943..2993ee3b078 100644
> > --- a/tests/acceptance/ppc_prep_40p.py
> > +++ b/tests/acceptance/ppc_prep_40p.py
> > @@ -27,6 +27,7 @@ def test_factory_firmware_and_netbsd(self):
> >          """
> >          :avocado: tags=3Darch:ppc
> >          :avocado: tags=3Dmachine:40p
> > +        :avocado: tags=3Dos:netbsd
> >          :avocado: tags=3Dslowness:high
> >          """
> >          bios_url =3D ('http://ftpmirror.your.org/pub/misc/'
> > @@ -64,6 +65,7 @@ def test_openbios_and_netbsd(self):
> >          """
> >          :avocado: tags=3Darch:ppc
> >          :avocado: tags=3Dmachine:40p
> > +        :avocado: tags=3Dos:netbsd
> >          """
> >          drive_url =3D ('https://cdn.netbsd.org/pub/NetBSD/iso/7.1.2/'
> >                       'NetBSD-7.1.2-prep.iso')
> >
>

