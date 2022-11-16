Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060F62BE83
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 13:46:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovHn0-0005Nj-FH; Wed, 16 Nov 2022 07:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovHmx-0005N0-AH
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:45:11 -0500
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovHmv-0005e2-8z
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:45:10 -0500
Received: by mail-il1-x135.google.com with SMTP id d3so9080058ils.1
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 04:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NpjGMoNZmE6Su2TOkv92n62+R5wGyuae081F1iadB+Y=;
 b=GPWwHXeXlNbS11KaSU520YbtFOKkNXScBIOaCQmYKitgoBT2buP9U5+L3Tn9mRcymQ
 ms243yqICWonWVNGif9xyKlW7IUJtmnZgfyB01IOHRXa3hNiU7aHC6uvVgLgDAuxlZjM
 RxsX2N/NX18FKpQKPVDR2T0YedSp/KQ0x6Zbg+vgi54ovICMuH+tnSW835dG8RjsEEHw
 7+YHFuKKK7fE8qShPdpE4Lk8FM8g8eh5FlG9IWKILu7GjMcqvtCjahG34Gx49MNJ2G8o
 soqmcfMZJclLGwJWUdUR1BXDjYfRa6dFJ8x1OyZW6xqdD6UH5CgW84xjZ2bz4Wq0Vzjl
 uufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpjGMoNZmE6Su2TOkv92n62+R5wGyuae081F1iadB+Y=;
 b=d/gU6K5xjfTaphzk5QIgFy5nM3kkMnjenlxfWWgMei/BVVGd/cl+dIz3IdRRuSL1R7
 WvajQkCDkJQIvMy5EZvrVPakTKlIWlFdqXnEOgV9uaRJxvZ/kQucfMb6zlaxNy/X4m+W
 188k4IWHtDE3a9NpK3XVsuLne+4wLsWvALFFf6q7O35PzyeqSKINzmO+YXxbQ1E1pUJM
 K5tohoi3EiZxHBgGs1cAiIxd5NPmiV8uR9s/22NbsLTO/IhV6V2mQlMySvGKyRdJ1UDz
 8ztHfCVG1c7TrjvJUwEOKj3ULv9X54MMWzdBlIviBfGdigE6DiZaq2yqPQVYk3Z6h1/D
 iYKg==
X-Gm-Message-State: ANoB5pkUSR5HsX0LHQ5pxu5tO+qGzAJBrNfvcFj86g5ln1DUj3BxngWF
 ZS0+9dNn46Alb5R4eGVYWveGVxAFiaaN3Bcz3ogX5g==
X-Google-Smtp-Source: AA0mqf6/kJHpi20IEqMKTAmobUFyDY+bYolE9QsSTOTG+Y8DF1cRWSKQ31zJ1KMgMauxmIrmwDMDvzjHyhe8rA8P/Hc=
X-Received: by 2002:a92:cec3:0:b0:300:ef0e:9388 with SMTP id
 z3-20020a92cec3000000b00300ef0e9388mr10972148ilq.262.1668602707373; Wed, 16
 Nov 2022 04:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <874juzal7m.fsf@linaro.org>
 <CAARzgwziPg+u17FjWLmXDU9W6jAAMf9nHO-WrSpytUoea1xkxw@mail.gmail.com>
 <87zgcr8cki.fsf@linaro.org>
 <CAARzgwyXt=FmTNHaKY5Q9=OLjJKh2-MSn8JukCp6k9SCL-PttQ@mail.gmail.com>
In-Reply-To: <CAARzgwyXt=FmTNHaKY5Q9=OLjJKh2-MSn8JukCp6k9SCL-PttQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 16 Nov 2022 18:14:56 +0530
Message-ID: <CAARzgwx-=Ye5gXcW3YoqXevD=_g5e6iNTaQnd_F7VRKYZtf1yw@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 16, 2022 at 6:02 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Wed, Nov 16, 2022 at 3:07 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >
> >
> > Ani Sinha <ani@anisinha.ca> writes:
> >
> > > On Wed, Nov 16, 2022 at 4:17 AM Alex Benn=C3=A9e <alex.bennee@linaro.=
org> wrote:
> > >>
> > >>
> > >> John Snow <jsnow@redhat.com> writes:
> > >>
> > >> > Instead of using a hardcoded timeout, just rely on Avocado's built=
-in
> > >> > test case timeout. This helps avoid timeout issues on machines whe=
re 60
> > >> > seconds is not sufficient.
> > >> >
> > >> > Signed-off-by: John Snow <jsnow@redhat.com>
> > >> > ---
> > >> >  tests/avocado/acpi-bits.py | 10 ++--------
> > >> >  1 file changed, 2 insertions(+), 8 deletions(-)
> > >> >
> > >> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.=
py
> > >> > index 8745a58a766..ac13e22dc93 100644
> > >> > --- a/tests/avocado/acpi-bits.py
> > >> > +++ b/tests/avocado/acpi-bits.py
> > >> > @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
> > >> >          self._vm.launch()
> > >> >          # biosbits has been configured to run all the specified t=
est suites
> > >> >          # in batch mode and then automatically initiate a vm shut=
down.
> > >> > -        # sleep for maximum of one minute
> > >> > -        max_sleep_time =3D time.monotonic() + 60
> > >> > -        while self._vm.is_running() and time.monotonic() < max_sl=
eep_time:
> > >> > -            time.sleep(1)
> > >> > -
> > >> > -        self.assertFalse(time.monotonic() > max_sleep_time,
> > >> > -                         'The VM seems to have failed to shutdown=
 in time')
> > >> > -
> > >>
> > >> We might want some wait for consoles as well depending on what is ou=
tput
> > >> during the run.
> > >
> > > actually I think you won't get anything on the console since grub is
> > > not configured to use the serial console.  I tried "-serial stdio" a
> > > while back without any output.
> >
> > Grub is certainly capable of serial output but I think the grub.cfg
> > needs changes to support that. It would definitely be an improvement if
> > we could enable serial output because currently the test is totally mut=
e
> > while running which is unlike every other test in avocado.
>
> sounds reasonable. bits seems to have its own way to set up grub
> serial port redirect and I tried something quickly but it didn't quite
> work. Need to spend more time looking at it.

just when I wrote this, it seems my hack finally worked! Will need
more testing before pushing.

commit 58513f19ac7b537da0769a732ff0d93d6d93d3b0 (HEAD -> qemu-bits)
Author: Ani Sinha <ani@anisinha.ca>
Date:   Wed Nov 16 17:37:51 2022 +0530

    serial port redirection test

    Signed-off-by: Ani Sinha <ani@anisinha.ca>

diff --git a/python/init.py b/python/init.py
index 8fde344..1e36d51 100644
--- a/python/init.py
+++ b/python/init.py
@@ -85,7 +85,7 @@ def early_init():
         except Exception as e:
             print "Error parsing Serial Port Console Redirect (SPCR) table=
:"
             print e
-
+    serial_cmd =3D "serial --speed=3D115200 --unit=3D0 --word=3D8 --parity=
=3Dno --stop=3D1"
     with import_annotation("os"):
         import os
     with init_annotation("os"):

