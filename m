Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0A6074F4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:24:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpCV-0002hq-HG
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:24:43 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnZk-0004Yz-40
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olnZa-00046m-70
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:40:10 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olnZY-0008NQ-25
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:40:09 -0400
Received: by mail-il1-x12c.google.com with SMTP id q18so1262632ils.12
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 01:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gN/IWnN4i4mj9ANFciejCOi8iM7M4vqPHnKXpSEW1Qw=;
 b=yDnev7cxsAy1HRv0JWHTu9nN+5XLQKk1nWFcm/oq6wvzV8Mbnxlx/nKOushRMC1qb1
 MMYJBUTUR4Z0han1won99wp8f8Xuh0aDg7ez3xwPsFjT5cbwpK4HjRZ+npjIuQA5qYuL
 arW65MdFxeq6dIjPz9zx6FBufF1Q85begvuum25osErDNdamD/Bda271keSPKMXLst5L
 AoKbs+PV3dGancLc5Tu57tHXetR2gTHafluDaiZqSs/9GKtFO89mr6Ajp9YmD91+hnXu
 Qwa5TSynkfDc/J5NkVGyvbUg2I5po/CnMAVjyoKGsqyaSe4/qYe1obPRlJMesclOj5CM
 bkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gN/IWnN4i4mj9ANFciejCOi8iM7M4vqPHnKXpSEW1Qw=;
 b=0xIHEDCw8S0+sQpSBQ5kYakqlDtE+X/t1TzHxaDnnaC9R0p28N7dwCOO97QWSpndw5
 aRooI7Z9pKArL+xZRc0lNs2nAsUc57D8fg+46Sqy5lcNIw1qe+DlAZ7vxeudEm4ezswd
 ZPaJjY0xQo5bfthwEiP4Q8gx9isMQIYpZI5bl2kUVvdiJuybkA9pjLC+13+63HpH4eUQ
 mlL9FFKVBmLHZbXE8HZeRNp6pAz2vwraTHML1tE3XcOv76O5dGhyCHg9anp5iFdLeLy1
 BRJIVjjHGui5ULdz9k2qGa1wLMcPYVg1Jc1KsgyD8eBAhjtyieaJ7JCpPM/zQ6Z4uGfY
 wifw==
X-Gm-Message-State: ACrzQf2bKsnRlG/pwCyVESIq9iMmP+6LVWQQMaQYQ4QqD5WvIVhSinvx
 oOOmEfVf2OiJHsVPm3HZsBagJP6sbOuwSqpQBpXD5g==
X-Google-Smtp-Source: AMsMyM7R3oMkjbW9l3gy17DQ7KFcaXhIeEQkLwjIFHBcL4TWVoVMY6C5hztok3u+2IofA1A/VmpcSu/91ovSK4lPcsU=
X-Received: by 2002:a92:2601:0:b0:2fc:48be:e77a with SMTP id
 n1-20020a922601000000b002fc48bee77amr12795801ile.202.1666341606513; Fri, 21
 Oct 2022 01:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020123506.26363-7-ani@anisinha.ca>
 <87sfji75g2.fsf@linaro.org>
In-Reply-To: <87sfji75g2.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 21 Oct 2022 14:09:55 +0530
Message-ID: <CAARzgwzK41qMoC2j5sYOYBpCOV8-2EOu2SLTDbaZvWEkqws0YQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] acpi/tests/avocado/bits: disable smilatency test
 since it does not pass everytime
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
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12c.google.com
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

On Thu, Oct 20, 2022 at 11:17 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > smilatency test is latency sensitive and does not pass deterministicall=
y when
> > run in QEMU environment under biosbits. Disable the test suite for now.
> >
> > Example failure:
> >
> > =3D=3D=3D=3D SMI latency test =3D=3D=3D=3D
> > Warning: touching the keyboard can affect the results of this test.
> > Starting test. Wait here, I will be back in 15 seconds.
> > [assert] SMI latency < 150us to minimize risk of OS timeouts FAIL
> >   1us   < t <=3D  10us; average =3D 1372ns; count =3D 10912449
> >    Times between first few observations:  176us 1646ns 1441ns 1450ns 14=
62ns
> >   10us  < t <=3D 100us; average =3D 16us; count =3D 1187
> >    Times between first few observations:   15ms 3148us 5856us   49ms   =
33ms
> >   100us < t <=3D   1ms; average =3D 259us; count =3D 8
> >    Times between first few observations:  111ms 2227ms 1779ms  999ms  2=
19ms
> >   0 SMI detected using MSR_SMI_COUNT (MSR 0x34)
> >   Summary of impact: observed maximum latency =3D 298us
> > Summary: 0 passed, 1 failed
>
> Is this because of TCG slowness? You might try running under icount for
> a more consistent elapsed time for the guest.

bang on! It does indeed pass consistently with "-icount auto" set. I
have tried 10 iterations on baremetal and on a VM environment.
I will remove smilatency test stuff from the patchset for now and add
that additional command line in v7.

>
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
> >  tests/avocado/acpi-bits/bits-tests/smilatency.py2 | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/avocado/acpi-bits/bits-tests/smilatency.py2 b/tests/=
avocado/acpi-bits/bits-tests/smilatency.py2
> > index d616970b31..e907c55cc2 100644
> > --- a/tests/avocado/acpi-bits/bits-tests/smilatency.py2
> > +++ b/tests/avocado/acpi-bits/bits-tests/smilatency.py2
> > @@ -37,8 +37,9 @@ import time
> >  import usb
> >
> >  def register_tests():
> > -    testsuite.add_test("SMI latency test", smi_latency);
> > -    testsuite.add_test("SMI latency test with USB disabled via BIOS ha=
ndoff", test_with_usb_disabled, runall=3DFalse);
> > +    pass
> > +    # testsuite.add_test("SMI latency test", smi_latency);
> > +    # testsuite.add_test("SMI latency test with USB disabled via BIOS =
handoff", test_with_usb_disabled, runall=3DFalse);
> >
> >  def smi_latency():
> >      MSR_SMI_COUNT =3D 0x34
>
>
> --
> Alex Benn=C3=A9e

