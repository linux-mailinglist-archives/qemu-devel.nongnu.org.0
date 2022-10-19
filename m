Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F144604C3A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:52:56 +0200 (CEST)
Received: from localhost ([::1]:34172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBNH-0001T0-Hl
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olB4L-0005n1-8S
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:33:27 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olB4A-0004hI-Bl
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:33:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 186-20020a1c02c3000000b003c6c154d528so257794wmc.4
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/fiwFPpDkNuR1tcz8lJr0MKEeEkSrU5Zv7YYHh/c7fw=;
 b=aPAlApQy0QlhBk1GFIjZmOWMkLhOsonunM+qtuXYeKoYDwxYjzhUzaIQU9FizUx5lZ
 OQLz66UJvrCMHuArXW3P66OuFFZov22HRBIWu53d05DqQEPFBqXkt57UnqR4RtUuk+/c
 KKhHn46LDRLX8RbbmUep8ju5aMv+/P/5mLFq8AdUHGquEjA/nSbd8twcL2mvVcw6+7Zs
 sMF6IjwP0aioCo5nIc6y/GSWOYtuWh7EuglG3J4nm4mf7RVy6tUHFA5qc0Gm2kIIUU0e
 PDqPEZ2nNke0DXLBnSSkZvRcpvMfg4OlJ2YBXhpnxTNK77tYO0/6ppi+IJjZFhRxyr6e
 odhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/fiwFPpDkNuR1tcz8lJr0MKEeEkSrU5Zv7YYHh/c7fw=;
 b=vrQ7/ot18p8xpyUDM5aapb/fJgw/cgMoGSqJN12FWEbzNHabx54WL1SvZdftu5eJgj
 U35yJsA77rzjrBNU6tnJ/13e+vEvoTSKiIGX5Mx/cnudIDXjgapBTVBuH7x3PueoUe6m
 pgG+A4dE/yprsYM65yTnQNfv6iQapxyZ3xZzhBQhFfLmUusUuyxAuPd88mr6Vg1UhvXW
 bTVV3+Nr5t5HFWWQXLXkO+Wso/BIeAAcT9g02n0KiHZin8zQq1xynd/pi7KzPmqy8vCj
 jfaW2xnE7OZBg+ggMbAsOmjEhdHOcCDnnlYGubvAS7YGZIOrcgNNO/HkBSVrPR9SpXe4
 ydvw==
X-Gm-Message-State: ACrzQf3TLibMSoASBWT8ZCrXRG36fUVpWWHVSc3FLN/EIsEcBcRz/vCk
 cFQGyyGZiCSAyK5SrjHK6XwoaA==
X-Google-Smtp-Source: AMsMyM4KcG568xndEZk4DmlxONXyIYSWCCCFaut/QFLDg64GOa1iYxKIwF+WPhD8d701R8HA4UD2pA==
X-Received: by 2002:a1c:7c14:0:b0:3b5:1133:d2ed with SMTP id
 x20-20020a1c7c14000000b003b51133d2edmr6164369wmc.133.1666193588516; 
 Wed, 19 Oct 2022 08:33:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a05600c2cca00b003a5f4fccd4asm211312wmc.35.2022.10.19.08.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 08:33:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E38E91FFB7;
 Wed, 19 Oct 2022 16:33:06 +0100 (BST)
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-7-ani@anisinha.ca>
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
Subject: Re: [PATCH v5 06/10] acpi/tests/avocado/bits: disable smilatency
 test since it does not pass everytime
Date: Wed, 19 Oct 2022 16:32:54 +0100
In-reply-to: <20221019025828.683113-7-ani@anisinha.ca>
Message-ID: <87y1tbakwd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> +    # testsuite.add_test("SMI latency test with USB disabled via BIOS
>  handoff", test_with_usb_disabled, runall=3DFalse);

again this will break bisection.

>=20=20
>  def smi_latency():
>      MSR_SMI_COUNT =3D 0x34


--=20
Alex Benn=C3=A9e

