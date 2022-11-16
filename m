Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6F062BE2E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 13:35:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovHap-0007G4-7X; Wed, 16 Nov 2022 07:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovHaZ-0007EA-NE
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:32:23 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovHaX-00035E-G2
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:32:23 -0500
Received: by mail-io1-xd35.google.com with SMTP id y6so13046531iof.9
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 04:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y5wJIDCy/I7ltYkQSxqFvy2fhfIJrPNL3r6rbViSWGE=;
 b=fXKeAd+ZYvI5byq0e8BuRqHMeQmwDjaUsYk++B5uyEzJRLNgIb2PRyJsl6lSt4HXfd
 zhCnmWGlUikQILIhk8eHf45Aju9Lvet6gd8W+Ee/aV4BJFF1u0mHU3J5CbqzsOtvKupf
 lzE7mNlGkhQssv/DupTeOd6eWy3wVSPpjLessQvJT/XHh/QZcN6aOLC5tj2/JvzB3qXi
 uCg4G8I60XIS7dXDT1nrOpVyjnyBCwtX0wezgi6Zo/2UGsYlbU2HM/lvGE3iMcvOQkAl
 gkkNr745ISfyeOhyHikI0Ksal+iu7ztE5LDAdEDegouzOU5gq6FMSUYKRCiTJCoHy186
 10dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y5wJIDCy/I7ltYkQSxqFvy2fhfIJrPNL3r6rbViSWGE=;
 b=Phd2TsbfZz06L68M+pg2UQxIVyvSlFWttRyOalvh7CWWJ5ghBF0WUBLQeIBFSIp1SZ
 8krfhlK5Qejp8gEseZIiVZ13lGOEJ6eZ6cSsXcjRHFsyHGEEfFT20ElX6aqPHAIUKad/
 m4M0p1vJx5dcim2HBy6R1vC20mSDq7X35+5jqPhcFUTFzfVyh2TSwwIVMpGrtXko3ffA
 iFdbbBSC1ZUsmk+yRTNAwGVmfJ7JSJePNmaZP0oOHvFCylJ2zdh7zVqQwxevnloYOCEZ
 H76egOxfIcWXUlavJCyi4NIkpdpac7KIU8PTNj3FlD7c70Bj7B3ZXK76mSwBiYYoHqo5
 3Yxw==
X-Gm-Message-State: ANoB5pl8h8Id+ZETB7jwax1E/ZRjPl8mzPlJgaNWTnUp+Ln+JQ8PX2zI
 A0egtGVPaFR3NxJrsVGG81shPC7H+moS45Lw/6hcFw==
X-Google-Smtp-Source: AA0mqf4p698EzXU4NZrTP4ZWXJHd6tBIjiOh7+Givn72cVhw8Z/9RAoJXlkgFgo3BagsNScs36FMVjs8NL6SwSMf8vk=
X-Received: by 2002:a5d:9a12:0:b0:6dd:e590:6628 with SMTP id
 s18-20020a5d9a12000000b006dde5906628mr9046747iol.3.1668601939884; Wed, 16 Nov
 2022 04:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <874juzal7m.fsf@linaro.org>
 <CAARzgwziPg+u17FjWLmXDU9W6jAAMf9nHO-WrSpytUoea1xkxw@mail.gmail.com>
 <87zgcr8cki.fsf@linaro.org>
In-Reply-To: <87zgcr8cki.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 16 Nov 2022 18:02:08 +0530
Message-ID: <CAARzgwyXt=FmTNHaKY5Q9=OLjJKh2-MSn8JukCp6k9SCL-PttQ@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd35.google.com
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

On Wed, Nov 16, 2022 at 3:07 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > On Wed, Nov 16, 2022 at 4:17 AM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >>
> >>
> >> John Snow <jsnow@redhat.com> writes:
> >>
> >> > Instead of using a hardcoded timeout, just rely on Avocado's built-i=
n
> >> > test case timeout. This helps avoid timeout issues on machines where=
 60
> >> > seconds is not sufficient.
> >> >
> >> > Signed-off-by: John Snow <jsnow@redhat.com>
> >> > ---
> >> >  tests/avocado/acpi-bits.py | 10 ++--------
> >> >  1 file changed, 2 insertions(+), 8 deletions(-)
> >> >
> >> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> >> > index 8745a58a766..ac13e22dc93 100644
> >> > --- a/tests/avocado/acpi-bits.py
> >> > +++ b/tests/avocado/acpi-bits.py
> >> > @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
> >> >          self._vm.launch()
> >> >          # biosbits has been configured to run all the specified tes=
t suites
> >> >          # in batch mode and then automatically initiate a vm shutdo=
wn.
> >> > -        # sleep for maximum of one minute
> >> > -        max_sleep_time =3D time.monotonic() + 60
> >> > -        while self._vm.is_running() and time.monotonic() < max_slee=
p_time:
> >> > -            time.sleep(1)
> >> > -
> >> > -        self.assertFalse(time.monotonic() > max_sleep_time,
> >> > -                         'The VM seems to have failed to shutdown i=
n time')
> >> > -
> >>
> >> We might want some wait for consoles as well depending on what is outp=
ut
> >> during the run.
> >
> > actually I think you won't get anything on the console since grub is
> > not configured to use the serial console.  I tried "-serial stdio" a
> > while back without any output.
>
> Grub is certainly capable of serial output but I think the grub.cfg
> needs changes to support that. It would definitely be an improvement if
> we could enable serial output because currently the test is totally mute
> while running which is unlike every other test in avocado.

sounds reasonable. bits seems to have its own way to set up grub
serial port redirect and I tried something quickly but it didn't quite
work. Need to spend more time looking at it.

