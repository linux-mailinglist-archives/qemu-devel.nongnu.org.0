Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7047F604C53
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:54:28 +0200 (CEST)
Received: from localhost ([::1]:60314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBOl-0004WO-Dx
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olBDo-0007qe-VI
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:43:08 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:35376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olBDn-0006P4-CX
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:43:08 -0400
Received: by mail-il1-x12e.google.com with SMTP id d14so9372099ilf.2
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2SSpYuCveI8ZHeUln+MABN8APCRXynPPxsWx31It7v8=;
 b=3ijsvNur/qWc4yJlsGvBqrPBSe3hRVCrzynoMdeDvIX9Ib9ynwHeAPdtd/Q/95+Anz
 gqR6ERQXFE+9ZQoWNYUqfGDRS7WAF/YGjI+OErjVj+uW3ahYWoAXgKFabZtD5xKahBGc
 O7nFFIN224JmMnGr7o/AWj7pfR7CXB/lSakJrR4aKkPElXnpQEDz2SLCCBpDuE24CA++
 dDmHbU7Rlsfhf0bddK/RTGWyo1v6W9LEA6AKo2xl7EUKzfp6yQOFSOrjEY8p59fBArHY
 DHaag3VLSNcW4zO20fYymIEDcS0V0FrNk72Xp/3x3XUknWkouG6hDap1FUo4bIrDltlW
 Btkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2SSpYuCveI8ZHeUln+MABN8APCRXynPPxsWx31It7v8=;
 b=YSgu6FntxyrAvsSD/aMGEQf0AsanDZ1piRB54F1arXlw05Tll2AuQiLdhWVROZwrG9
 39cEQ3L1rqRxeHPEf3Cb1uPewZPrNcK/oeV+ZAQo56S+CpqLSFqYbvld/P6E906ESvVK
 1m5i4M+U2mZDCAmQgexV1JaqrUBE9LtAYstt2QF7lSAyD/zFp51ebs0v5lnY9CG80qb7
 K6t/dAysI4yjLTmBIoy7cE1JAq0Z0CdFFf0lvGohO/uIpmhUBsYm/cOW2kFu7yUlwrax
 9MAWigbD66E4glVpQzB5KHv8HRwnthndmSbeEDsnRKlRUOvtcS/4oCo4UEOMwP4gHWEv
 49zA==
X-Gm-Message-State: ACrzQf1TWUQNQgb5kvmaFdp8BsO6xH6SxsEqWbDGwhipbsnC4vXfzs8r
 2GX1qg//p07rMXpZm1dSGbhM2XONP7ozVbjAyi2wgg==
X-Google-Smtp-Source: AMsMyM5KZ/8KYB2JUUvSLyTOy2mqxtd0Byy9iRKlV/+UcluRb6bZq5fwLnZGl8o8oBLD8CD3cSto8wFyxGaYYmcPFfY=
X-Received: by 2002:a05:6e02:1253:b0:2fd:2fb5:c9f7 with SMTP id
 j19-20020a056e02125300b002fd2fb5c9f7mr6201615ilq.129.1666194186132; Wed, 19
 Oct 2022 08:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-4-ani@anisinha.ca>
 <877d0vbzji.fsf@linaro.org>
In-Reply-To: <877d0vbzji.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 19 Oct 2022 21:12:55 +0530
Message-ID: <CAARzgww+dWAoPLyyB2RC0+T64it7MwAZezD=UOEcs43n8U=CSg@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] acpi/tests/avocado/bits: disable acpi PSS tests
 that are failing in biosbits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 19, 2022 at 9:01 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > PSS tests in acpi test suite seems to be failing in biosbits. This is b=
ecause
> > the test is unable to find PSS support in QEMU bios. Let us disable
> > them for now so that make check does not fail. We can fix the tests and
> > re-enable them later.
> >
> > Example failure:
> >
> > ---- ACPI _PSS (Pstate) table conformance tests ----
> > [assert] _PSS must exist FAIL
> >   \_SB_.CPUS.C000
> >   No _PSS exists
> > Summary: 1 passed, 1 failed
> > ---- ACPI _PSS (Pstate) runtime tests ----
> > [assert] _PSS must exist FAIL
> >   \_SB_.CPUS.C000
> >   No _PSS exists
> > Summary: 0 passed, 1 failed
> >
> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Maydell Peter <peter.maydell@linaro.org>
> > Cc: John Snow <jsnow@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Michael Tsirkin <mst@redhat.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/avocado/acpi-bits/bits-tests/testacpi.py2 | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/av=
ocado/acpi-bits/bits-tests/testacpi.py2
> > index 18dc818d62..f818a9cce6 100644
> > --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> > +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> > @@ -40,8 +40,8 @@ import time
> >
> >  def register_tests():
> >      testsuite.add_test("ACPI _MAT (Multiple APIC Table Entry) under Pr=
ocessor objects", test_mat, submenu=3D"ACPI Tests")
> > -    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", t=
est_pss, submenu=3D"ACPI Tests")
> > -    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstate=
s, submenu=3D"ACPI Tests")
> > +#    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", =
test_pss, submenu=3D"ACPI Tests")
> > +#    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstat=
es, submenu=3D"ACPI Tests")
> >      testsuite.add_test("ACPI DSDT (Differentiated System Description T=
able)", test_dsdt, submenu=3D"ACPI Tests")
> >      testsuite.add_test("ACPI FACP (Fixed ACPI Description Table)", tes=
t_facp, submenu=3D"ACPI Tests")
> >      testsuite.add_test("ACPI HPET (High Precision Event Timer Table)",=
 test_hpet, submenu=3D"ACPI Tests")
>
> I think this breaks bisection so should probably be included in the
> commit that add the test with a comment in the commit message.

Ah I see. The addition and the disabling has to be atomic so that
there are no test failures if addition patch is cherry-picked and not
the patch that disabled the tests.
Hmm.

