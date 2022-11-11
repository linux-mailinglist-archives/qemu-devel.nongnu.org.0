Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAC3625B2B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:29:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otSzR-0007hV-Q2; Fri, 11 Nov 2022 07:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otSzP-0007ch-VM
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:18:31 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otSzO-0000DE-2r
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:18:31 -0500
Received: by mail-il1-x131.google.com with SMTP id o13so2440566ilc.7
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9cnSLRv6PF9YQiKuF1YZUDfLXKh5Z2p06g+3JNU0y8=;
 b=MgSF3NPQ2VOIf3XmuFtfeCvM7/l7Zc+a1IVruvjOIkyiupUIdxljlxJ/ZeKA7SRIYn
 ky+p82NESK20uRPGuVMj8ZxX2xAH+2T/KjsYGO4Sp/PCMprNALMYOUWvWXnX/Un0NFzO
 2sAk3C/h0P0fy1gxVWQtgCjoE31XGNKIh69B2e7ccecNGXPeRYthl8vGN9Ty/ohFEp3s
 KUa/VuZvExgZVdJ12qnpMudd1m0fnCgusRe8zY/G6JAqDRwC+z/2jHBoekd4QGQ5WRbF
 WynqUd9nadM+jc1UIe3HVNLZlOBCpPMKtMS/1Tn2I16lgyXOP/P8cL5Tn6V7YOI7f+zM
 x5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9cnSLRv6PF9YQiKuF1YZUDfLXKh5Z2p06g+3JNU0y8=;
 b=iqdAwYnXTBulUTLz0ce0fSaVAvM4OK7MPh9iq6r8ksCOx3bOt9WSsupJJMFelfVGuf
 rGIJmsFomwcv3pz1ib6IJ5HSqX7c5dpcXjwIVAXNDiy86fHV4AY/yNYU9e+52zokePiT
 NTEO2uT7oMKunxc9PeQyHXCQUf5/5faynucquosbdrULseAymkPSw5SzioUQJrZEnu9X
 mMOnNPTncq244KGLjG4d++EqAoklzZU7vOJiFh4J/wz2jmHfFJ0ptRmgdGJvMKWhmJ3C
 VwcTG3/Hnnexl0GY5q8NHXvGypOXhcMJo+smxjdIIsRgRq14NmZhD7j5vbIxPPVQ37/5
 O/3Q==
X-Gm-Message-State: ANoB5pnmimCshpXw622rJ/LxnshRZ0g3C8TgQJJDzQ9k9Be8tKHYXcsU
 1apfBvQi8vhkNU+xgCZf5PBwxrfZaoKHFbQg4l9oHQ==
X-Google-Smtp-Source: AA0mqf4pQTIUdR2aC90AZ9ID1NiOL0jU5FoVLTjxevzRSUPnqhySmaaGFS+S3YmgGb6pmAz61/or8stZtBONAakPM+I=
X-Received: by 2002:a92:c745:0:b0:2f9:8a1e:914b with SMTP id
 y5-20020a92c745000000b002f98a1e914bmr911848ilp.259.1668169108697; Fri, 11 Nov
 2022 04:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20221111085221.1216196-1-ani@anisinha.ca>
 <8bd0cd78-0a69-0e0e-e764-0375ff627fd8@redhat.com>
In-Reply-To: <8bd0cd78-0a69-0e0e-e764-0375ff627fd8@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 11 Nov 2022 17:48:17 +0530
Message-ID: <CAARzgwwohqW6bFpFQZjJruO6ywmDZ7mnmHoEOSW7dmM5CoOO1Q@mail.gmail.com>
Subject: Re: [PATCH] acpi/tests/avocado/bits: some misc fixes and spelling
 corrections
To: Thomas Huth <thuth@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-trivial@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x131.google.com
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

On Fri, Nov 11, 2022 at 2:36 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 11/11/2022 09.52, Ani Sinha wrote:
> > Most of the changes are cosmetic. The bits test timeout has now been in=
creased
> > to 90 seconds in order to accommodate slower systems and fewer unnecess=
ary
> > failures. One spelling correction in docs along with removal of the ref=
erence
> > to non-existent README file.
> >
> > CC: Thomas Huth <thuth@redhat.com>
> > CC: qemu-trivial@nongnu.org
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >   docs/devel/acpi-bits.rst   | 3 +--
> >   tests/avocado/acpi-bits.py | 5 +++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> > index c9564d871a..a9020adb2d 100644
> > --- a/docs/devel/acpi-bits.rst
> > +++ b/docs/devel/acpi-bits.rst
> > @@ -41,7 +41,6 @@ Under ``tests/avocado/`` as the root we have:
> >      =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smbios.py2
> >      =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 testacpi.py2
> >      =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 testcpuid.py2
>
> That leaves the second "|" dangling around ... should those second pipe
> characters now be removed, too?

No, the second "|" is for everything under "acpi-bits" directory,
which is "bits-config" and "bits-test" directories. README was a file
under the same hierarchy which now we want to remove, leaving only the
directories there.

>
> > -   =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 README
> >      =E2=94=9C=E2=94=80=E2=94=80 acpi-bits.py
> >
> >   * ``tests/avocado``:
> > @@ -132,7 +131,7 @@ Under ``tests/avocado/`` as the root we have:
> >
> >      (a) They are python2.7 based scripts and not python 3 scripts.
> >      (b) They are run from within the bios bits VM and is not subjected=
 to QEMU
> > -       build/test python script maintainance and dependency resolution=
s.
> > +       build/test python script maintenance and dependency resolutions=
.
>
> FWIW, this will also be fixed by Stefan Weil's current pending doc update=
 patch.

Since you pulled his patch, I will drop this change.

>
> >      (c) They need not be loaded by avocado framework when running test=
s.
> >
> >
> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> > index 8745a58a76..5ebe8c14a2 100644
> > --- a/tests/avocado/acpi-bits.py
> > +++ b/tests/avocado/acpi-bits.py
> > @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
> >           self._vm.launch()
> >           # biosbits has been configured to run all the specified test =
suites
> >           # in batch mode and then automatically initiate a vm shutdown=
.
> > -        # sleep for maximum of one minute
> > -        max_sleep_time =3D time.monotonic() + 60
> > +        # sleep for maximum of a minute and a half to accomomodate eve=
n slower
>
> s/accomomodate/accomodate/

Ugh! Will fix it too.

>
> > +        # test setups.
> > +        max_sleep_time =3D time.monotonic() + 90
> >           while self._vm.is_running() and time.monotonic() < max_sleep_=
time:
> >               time.sleep(1)
> >
>
>   Thomas
>

