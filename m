Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB9D62D98F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 12:38:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovdDW-0005Bl-Sc; Thu, 17 Nov 2022 06:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovdDR-0005AF-7I
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 06:37:59 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovdDN-0000bt-2D
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 06:37:54 -0500
Received: by mail-il1-x131.google.com with SMTP id q5so750115ilt.13
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 03:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zzNj8VOYeQDOrRvZC9E986bh188PLpGpy9XU5LKua00=;
 b=XYpFZG8nr2OSTKvUcQU/ymRwkUBOHPW8AHacDaBgFX/sJrEgyPkehMZ2ugfO5ruKGj
 LFYhHmwTQKq3jSuaMTjPXf+9nIWeVJcXw//4audIeCat7AG7k0L4WeHhAtkJ8TS7P+lz
 IKHECS6NWUjB5TLDLL3UMQN3Pe1MtJkg+UEIjc/M+2qfUYquvpdPMcdrAS2jQWIRDSFI
 NArmBBfV6GLo2MWvM57Ves6/KGDT+zrbXa1qP72pgtPIKxb494eB/H3YdA82fvvyHeud
 lxOdRkS9BCh3WedN6CU7ijhPWU0JxdgbLZMKsosYBNsBC2kPmWD3QRFgv36FN2mu5jWw
 ji+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zzNj8VOYeQDOrRvZC9E986bh188PLpGpy9XU5LKua00=;
 b=26KFt11MSS1PqyN+1goy8ljbI9zUZBU/ohqZTRL4+9a4Eq9WkMKK3mKWeqcxymJisl
 kJNSHm8/5U6vlFOJ/AQ3H/IYFMKb3Qwk7Q7AS3XF3MiMMGdz+TZOeKHUQ3z8i++IbK4y
 sMoOYcDlPKJm305xXmX+MqLuoa/6wKABAaBlOxyAGIh2WmTyQaFJiWQ4TKTVBg7vl04Y
 JP7OM/8CeeQY6Tu1keSiJIeFlKDjfOGKuXpNqSXqgY/b60lnWf1UAbyRHxoW8JE9CD74
 VF0GQ1xTUsBf5qTK3wZXwZrXsaRnKC/By8xz7lOPOyTaUMP7Ch1f4qasl3NBltxqL83y
 466w==
X-Gm-Message-State: ANoB5pnTMLRrguywVXGQAyQqaVpDiGGqLJ3K5gSXOLHrv+mbXQ2gRHl5
 ztXayd4JmjpREkBfYyjVtu7ecuTXVlKnuSFx4ZmzzA==
X-Google-Smtp-Source: AA0mqf4PcGkFw8fAAP8xB3mdz/uzguSQTIYxs+j+6yjUVGwgRVXeXniJ8CUhfLBdDAdnAQDJiZKlRxT7Qc7W0+oWpqw=
X-Received: by 2002:a92:c64c:0:b0:2fa:de7:7c09 with SMTP id
 12-20020a92c64c000000b002fa0de77c09mr1015556ill.94.1668685071366; Thu, 17 Nov
 2022 03:37:51 -0800 (PST)
MIME-Version: 1.0
References: <20221117074629.526448-1-ani@anisinha.ca>
 <Y3X1UKtTm1G5dBBu@redhat.com>
In-Reply-To: <Y3X1UKtTm1G5dBBu@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 17 Nov 2022 17:07:38 +0530
Message-ID: <CAARzgwzo9t0oeeW-n59VjPTf5mxU5cbL8ELUgbdPqkjKfwNM7w@mail.gmail.com>
Subject: Re: [PATCH] acpi/tests/avocado/bits: don't remove the work directory
 when V is in env
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
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

On Thu, Nov 17, 2022 at 2:18 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Nov 17, 2022 at 01:16:29PM +0530, Ani Sinha wrote:
> > Debugging bits issue often involves running the QEMU command line manua=
lly
> > outside of the avocado environment with the generated ISO. Hence, its
> > inconvenient if the iso gets cleaned up after the test has finished. Th=
is change
> > makes sure that the work directory is kept after the test finishes if t=
he test
> > is run with V=3D1 in the environment so that the iso is available for u=
se with the
> > QEMU command line.
> >
> > CC: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/avocado/acpi-bits.py | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> > index 8745a58a76..7657343f2a 100644
> > --- a/tests/avocado/acpi-bits.py
> > +++ b/tests/avocado/acpi-bits.py
> > @@ -354,7 +354,11 @@ def tearDown(self):
> >          if self._vm:
> >              self.assertFalse(not self._vm.is_running)
> >          self.logger.info('removing the work directory %s', self._workD=
ir)
> > -        shutil.rmtree(self._workDir)
> > +        if not os.getenv('V'):
> > +            shutil.rmtree(self._workDir)
> > +        else:
> > +            self.logger.info('not removing the work directory %s as V =
is ' \
> > +                             'passed in the environment', self._workDi=
r)
> >          super().tearDown()
>
> I don't think it is a good idea to hook into 'V=3D1'.
>
> That is something commonly used simply to get a record of the verbose
> build process. It shouldn't affect the functional operation at all.

yeah you are right. I have sent out a v2. introduced BITS_DEBUG for
it. much better.

> So leaving around undeleted state is an undesirable side effect.
>
> If you want a means for debugging invent a new env variable such
> as BIOSBITS_DEBUG=3D1 or whatever name..
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

