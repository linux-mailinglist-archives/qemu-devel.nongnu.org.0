Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D9D62ECC0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 05:08:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovsda-0003QF-LH; Thu, 17 Nov 2022 23:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovsdY-0003OZ-2e
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 23:05:56 -0500
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovsdW-0001N1-GH
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 23:05:55 -0500
Received: by mail-il1-x12a.google.com with SMTP id bp12so1976898ilb.9
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 20:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lp431cawiufDv++n+jFNmXiLMZNSqUZslP8AhmBOLWc=;
 b=O1h0cR8RmkC3VNXjIzPv/Tib0jFaX/FVLBFB4jaK4SG/eHQotFUoGZ2Ix4NQa9NtGq
 fihryD0UNucQgmbXRKPCu8VeWww+zMc5VQqogYfmyiNjsxpGWZOG8OsXOV/pkR1MwUWB
 f16wmxWZ3lVFkp8YyT11PA7+kWnxh0Bq2UlNs21tm0BWtKIJhtTNNAy3TbaJbEs0L6cu
 +MNdRDdMLE5TjfmmNckquUi4juAYmhyGoxDU/h+vBCEYqJ32RKXUcrufts94110voKUa
 LP4ixmLtHNsHDNkOzl4RFyeVVqEravF9NtTVrBqAmaIALetPpY0tBWPUIF7Cy8/cH/SJ
 Gv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lp431cawiufDv++n+jFNmXiLMZNSqUZslP8AhmBOLWc=;
 b=RKlT61Me4jbJUUiIGhK5xl5tpuV3dLkLTBSwSbgAvhiEu3zcdUqA59zefI1OPNCHGg
 gHPKSG3FvDDmKS5aVpxoL9UPZD+RXMPHf3qLib2ahEZllNWOkcbBWo1/OyGn7Fv+fmuz
 azxUtYuclJC2SR6a+QOXF9+OgpNns9sBRtHeQqQUO1Bvyzh4D1fhSZH02evoeE7JMNfT
 809jwCVJy58TmzDl8KbkFH8BNMf4MRYW6f3XLPtkARvMJi90b/SPsnTqhFHDBYRSdtTB
 9tOjCN+xJt3qIbmfE0iF6X1igZqSbIyBaXiH2vmSNoYOFTN7J+cqWCgaf3z7Z/wIL4ZL
 5dag==
X-Gm-Message-State: ANoB5plKdTwAhstbwpSQIFSPviirLV3+IrohfQsqnwcvB5eslk0JJMrQ
 HwiYaU3VgKXPH84O6OKLdA9UmEttG5qzL0boMin6iw==
X-Google-Smtp-Source: AA0mqf5jle/iktZM5jVOApHPYFezPD24HBS88WmAhVQSvsq7vWU5vMwhctlD4IYTVG591MFpvfTOmTXsFTdN1wdWI4g=
X-Received: by 2002:a05:6e02:f4f:b0:302:8a15:a01e with SMTP id
 y15-20020a056e020f4f00b003028a15a01emr2626740ilj.20.1668744352838; Thu, 17
 Nov 2022 20:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <CAARzgwxaVyQf424PeUOO=efyPHdiMK9nF7g+pHuKufqU1cg1-g@mail.gmail.com>
In-Reply-To: <CAARzgwxaVyQf424PeUOO=efyPHdiMK9nF7g+pHuKufqU1cg1-g@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 18 Nov 2022 09:35:41 +0530
Message-ID: <CAARzgwzYn8=vsWO+pEfRouJY3PWYn_XEZps9wurpHpVogxcEHg@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12a.google.com
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

On Wed, Nov 16, 2022 at 8:54 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Wed, Nov 16, 2022 at 2:58 AM John Snow <jsnow@redhat.com> wrote:
> >
> > Instead of using a hardcoded timeout, just rely on Avocado's built-in
> > test case timeout. This helps avoid timeout issues on machines where 60
> > seconds is not sufficient.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>
> > ---
> >  tests/avocado/acpi-bits.py | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)

Thomas, since you are picking up my other patch, maybe you want to
also pick this one up as well if you have not sent out your PR
already?

> >
> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> > index 8745a58a766..ac13e22dc93 100644
> > --- a/tests/avocado/acpi-bits.py
> > +++ b/tests/avocado/acpi-bits.py
> > @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
> >          self._vm.launch()
> >          # biosbits has been configured to run all the specified test suites
> >          # in batch mode and then automatically initiate a vm shutdown.
> > -        # sleep for maximum of one minute
> > -        max_sleep_time = time.monotonic() + 60
> > -        while self._vm.is_running() and time.monotonic() < max_sleep_time:
> > -            time.sleep(1)
> > -
> > -        self.assertFalse(time.monotonic() > max_sleep_time,
> > -                         'The VM seems to have failed to shutdown in time')
> > -
> > +        # Rely on avocado's unit test timeout.
> > +        self._vm.wait(timeout=None)
>
> I think this is fine. This just waits until the VM is shutdown on its
> own and relies on the avocado framework to timeout if it doesn't. We
> do not need to look into the console. The test issues a shutdown from
> the VM itself once its done with the batch operations.
>
> >          self.parse_log()
> > --
> > 2.37.3
> >

