Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297C162B20C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 05:08:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov9hj-00077Z-0w; Tue, 15 Nov 2022 23:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ov9hg-00077P-Dr
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 23:07:12 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ov9hd-0003oO-IU
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 23:07:12 -0500
Received: by mail-il1-x134.google.com with SMTP id z15so1736221ilp.4
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 20:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1Bs1v0ukoumFXFBaUZq3ubDANY8mBDTvXur1GrLK8I=;
 b=Wese5xJI1aaOIT57VA9UxSbNfWu/n0PUdhaoMCXKCOcwyMYtY5kxFV44dV9Hx2JVIW
 IZD5HPGFS/6xZIAupKM7Tya05vZGpB2WEva6U6mzWeWl1FArKDRRy0sAJPOrZJJGGWmB
 dptsVnguYp/bbtjmtA88oFbUWyOkKlTm5p7EaGDRngNuTsSHSMCXCfzqbUnOqsAGRAqV
 4GucVyro/fuekcBf5Cg0FMGpbhcW04kaU60F5E99zwf1+r7qpzZFRmU8ggFJi49LMned
 DrRhVA/pR5eu7Se2OH8w0nGlmS9rFgj0Oas+9cxQWrpcdXj/xf1kzaJr6VQccTsWF66E
 F7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q1Bs1v0ukoumFXFBaUZq3ubDANY8mBDTvXur1GrLK8I=;
 b=Yyp40VgqzVU13ZB7/68Q2IKTDus5I1oyMRoNHobMqqjq/ja5wdc4GMPXFb4urxAzs6
 r4vptb9ZLmaUV/ynuISqZ1AC2lkgHCuSblsrHQ1rdtvWhcvVUe6EcVfE407+0xzPt8IA
 F/5Oysrk8yUNByydb5IIR/nD3OI5h8NdMMalUMQ4uHZ0+mTbyvnL7pcew2Hb7qrRaLut
 miJFCdl2pFclGBMMH27YAEGZJK+a9QHrGCIl4ykaJQilFmYD3Re6c2lU9E8qlQQrSjPI
 y088j01C8Rj9xEHyh2MHbNWiuSa+ekprC8d9siiKkEwiY2gOJEV3blE5ROA3qOODGYvT
 7o7g==
X-Gm-Message-State: ANoB5pkKbN/W43wTqDa/k1aTmmfMDvDkshTLAI0o3Yq6aj5VY431ai4q
 cKyycy/tVWmjOM1AA/lZuk0Hl5WGWJsSni2o8AZhXw==
X-Google-Smtp-Source: AA0mqf72O2aCQET6LxsinW5ufpuyWGMvX4dS+epBPS6LO+YBkLJlM81/I4qim7G7SwkCAcCFn5/tQq/BEQ1Yc0kkxoM=
X-Received: by 2002:a92:c0ca:0:b0:2fa:de7:7c09 with SMTP id
 t10-20020a92c0ca000000b002fa0de77c09mr10165927ilf.94.1668571626855; Tue, 15
 Nov 2022 20:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <874juzal7m.fsf@linaro.org>
In-Reply-To: <874juzal7m.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 16 Nov 2022 09:36:55 +0530
Message-ID: <CAARzgwziPg+u17FjWLmXDU9W6jAAMf9nHO-WrSpytUoea1xkxw@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x134.google.com
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

On Wed, Nov 16, 2022 at 4:17 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> John Snow <jsnow@redhat.com> writes:
>
> > Instead of using a hardcoded timeout, just rely on Avocado's built-in
> > test case timeout. This helps avoid timeout issues on machines where 60
> > seconds is not sufficient.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/avocado/acpi-bits.py | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> > index 8745a58a766..ac13e22dc93 100644
> > --- a/tests/avocado/acpi-bits.py
> > +++ b/tests/avocado/acpi-bits.py
> > @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
> >          self._vm.launch()
> >          # biosbits has been configured to run all the specified test s=
uites
> >          # in batch mode and then automatically initiate a vm shutdown.
> > -        # sleep for maximum of one minute
> > -        max_sleep_time =3D time.monotonic() + 60
> > -        while self._vm.is_running() and time.monotonic() < max_sleep_t=
ime:
> > -            time.sleep(1)
> > -
> > -        self.assertFalse(time.monotonic() > max_sleep_time,
> > -                         'The VM seems to have failed to shutdown in t=
ime')
> > -
>
> We might want some wait for consoles as well depending on what is output
> during the run.

actually I think you won't get anything on the console since grub is
not configured to use the serial console.  I tried "-serial stdio" a
while back without any output.

>
>
> > +        # Rely on avocado's unit test timeout.
> > +        self._vm.wait(timeout=3DNone)
> >          self.parse_log()
>
>
> --
> Alex Benn=C3=A9e

