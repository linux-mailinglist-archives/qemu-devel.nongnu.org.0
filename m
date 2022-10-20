Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE040606745
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:48:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZeP-0006Li-0d
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:48:17 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZeM-0007Tk-Dk
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZdt-00060o-IJ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:47:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZdg-0007EY-6j
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:47:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id bp11so140607wrb.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g82xJrm8GmoYBYWTc4nt12yaFZ22EeRcFnqfyu9+Q+o=;
 b=bGikip/c6VjWO8dO4FwYQ5sKK9uPLtmTZxpJoRH6N2V/1Ir6vp8G0XFhKJrYWgFREG
 nQTzhFH966+M7toswDZBzzyT2PBQ493sI2Wly4cm3vWHukaFvbBwz7q+yU+ESBmnHl7y
 rGnXQkvDRJkhGDjjaSkoVJKyefCF5ERy2s1up5RSTo3Bi671jUWvvsnQ0b56okL+Jxv1
 W5ltPFOcbPB4F7bdxhy8LIMt88KLw1ElpV3gGqCWshEEKbwykUzvQaASB10ZsSxo7DAR
 DCOT7v0hAKNku4z3It2T9sjqWeZc6gstMBfF4FmRcrpxIVh81/eXe2fQ1jtsX0R83W4z
 5rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=g82xJrm8GmoYBYWTc4nt12yaFZ22EeRcFnqfyu9+Q+o=;
 b=qj5poXuYvuRysEYYkthpq7vkAPCsYm0iypqioX5f+9bIB4XxF48giIW5PiHB2djxRP
 p38B1oIeBRuKLAtUHIxk2eLIvUiXnaDTNGJG/X3jbJbowe9Jm1X51Vo59/6oXwEPQgSK
 fO1y51sPrgljX/yCrDhIRvHtN9uxG15fEYu5M9rlYrFz5grI5500BXHrzuhbZe3wBDzu
 KKA8eAbagtHr6XqXuqXTeiGi+o7F4KL1CSZhC3RM/oC7C6QSEuW1+2Cfqf8KXLOXhc7Y
 T0FXB6kZ2wzyEuL+t6gsJPAidSfvEkpupmMuOb4AKjbe9qMdmNjkqUVAV4k2Aj9p6utp
 kGYA==
X-Gm-Message-State: ACrzQf3pLKZralCqq+NYVQP44fRADvM5FvDzGEmWTqZ3QP02LqpaZzV3
 s3UpfvUmEd/345AwuAmPSzvzEA==
X-Google-Smtp-Source: AMsMyM59NHfbQ7rhpk084DqUdIT/EESDxeDxphK+lmQ63dzwDBKXEcyd3P23RrCD0aoxl/Iwv3wS3w==
X-Received: by 2002:a05:6000:1f04:b0:22e:5e0b:e1fb with SMTP id
 bv4-20020a0560001f0400b0022e5e0be1fbmr9064427wrb.222.1666288046558; 
 Thu, 20 Oct 2022 10:47:26 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az24-20020a05600c601800b003c7087f6ca8sm294752wmb.2.2022.10.20.10.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 10:47:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8DE241FFB7;
 Thu, 20 Oct 2022 18:47:25 +0100 (BST)
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020123506.26363-7-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 06/10] acpi/tests/avocado/bits: disable smilatency
 test since it does not pass everytime
Date: Thu, 20 Oct 2022 18:46:53 +0100
In-reply-to: <20221020123506.26363-7-ani@anisinha.ca>
Message-ID: <87sfji75g2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Ani Sinha <ani@anisinha.ca> writes:

> smilatency test is latency sensitive and does not pass deterministically =
when
> run in QEMU environment under biosbits. Disable the test suite for now.
>
> Example failure:
>
> =3D=3D=3D=3D SMI latency test =3D=3D=3D=3D
> Warning: touching the keyboard can affect the results of this test.
> Starting test. Wait here, I will be back in 15 seconds.
> [assert] SMI latency < 150us to minimize risk of OS timeouts FAIL
>   1us   < t <=3D  10us; average =3D 1372ns; count =3D 10912449
>    Times between first few observations:  176us 1646ns 1441ns 1450ns 1462=
ns
>   10us  < t <=3D 100us; average =3D 16us; count =3D 1187
>    Times between first few observations:   15ms 3148us 5856us   49ms   33=
ms
>   100us < t <=3D   1ms; average =3D 259us; count =3D 8
>    Times between first few observations:  111ms 2227ms 1779ms  999ms  219=
ms
>   0 SMI detected using MSR_SMI_COUNT (MSR 0x34)
>   Summary of impact: observed maximum latency =3D 298us
> Summary: 0 passed, 1 failed

Is this because of TCG slowness? You might try running under icount for
a more consistent elapsed time for the guest.

>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/avocado/acpi-bits/bits-tests/smilatency.py2 | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/avocado/acpi-bits/bits-tests/smilatency.py2 b/tests/av=
ocado/acpi-bits/bits-tests/smilatency.py2
> index d616970b31..e907c55cc2 100644
> --- a/tests/avocado/acpi-bits/bits-tests/smilatency.py2
> +++ b/tests/avocado/acpi-bits/bits-tests/smilatency.py2
> @@ -37,8 +37,9 @@ import time
>  import usb
>=20=20
>  def register_tests():
> -    testsuite.add_test("SMI latency test", smi_latency);
> -    testsuite.add_test("SMI latency test with USB disabled via BIOS hand=
off", test_with_usb_disabled, runall=3DFalse);
> +    pass
> +    # testsuite.add_test("SMI latency test", smi_latency);
> +    # testsuite.add_test("SMI latency test with USB disabled via BIOS ha=
ndoff", test_with_usb_disabled, runall=3DFalse);
>=20=20
>  def smi_latency():
>      MSR_SMI_COUNT =3D 0x34


--=20
Alex Benn=C3=A9e

