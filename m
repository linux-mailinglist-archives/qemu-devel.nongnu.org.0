Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE47606F94
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 07:46:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olkrU-0001So-6K
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 01:46:28 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olkjC-0001fz-Ke
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 01:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olkiz-0001Zp-KU
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 01:37:43 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olkix-0008Tn-IZ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 01:37:41 -0400
Received: by mail-il1-x135.google.com with SMTP id q11so1082418ilj.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 22:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gWHqvcmSGye6d8J6gddvP83nE9hY0LWorQqMeCj88x8=;
 b=EvL/HX9oatKDaXqNxZtN4KYZTjrJ0+zYMdSAn6tuBlvMoBLMSLWncy+a44/W2AEWPX
 Yj7RL+h7nRBmWQDsoYQs3j6kcdoCXkvXYs6NLZ7iEnxV9uvfOrZRtG1y9AB+EQ1Jm/Yc
 rFy9hyfTI8oV5KqwBbfHBA94Nf5VRQk16+QRV3quTh1rQ8+kDiFpxBaHPqYIjgq4sb3C
 rrin7vVWUDnMzG1pn8K6whhS1q1HWqAnHMkIWcbDdkLrlpFkhhRZIJMM0MdaVseWHKzw
 tnvNXn+TxOVQOfuC+OaGRv7NBWMf6PSoS2Q38IO/73/xvG55+LzajI6MQb9y4b1fhVjA
 f2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gWHqvcmSGye6d8J6gddvP83nE9hY0LWorQqMeCj88x8=;
 b=gFYKPjBBbWMkmvEOFIc2rHsb+uLFb2M/oowQRpg8emRtMD4I0PbS97ps6knG/Se6qC
 qKy5wsXyWeszYwmCwwn/KtdiMg6PnuIx+vii9TxTAPvTtKBnSOo2iM+8+p/wBqvPFL6O
 guPLEBKMa5EXlsMK3VVNsiRK92hsc+zLVhS11Ni4VWEM01+mBcpjW08zN7QZ7Myp+F8k
 vK51JA/UbuY94ldrFw9oyTlpXu4g/hn/z6E2BPxto7whJ4cOJGMF/gnvNA3gi9zRB3EI
 rPMFSBt2dfE6T6RApikFmw4nRcv9KIImm2cZaynSnP7UCy9rJbJgCnbTLuftRo2wCwj6
 B0YA==
X-Gm-Message-State: ACrzQf025ZBzSNshgeVQsU6AAheA/UtwX7L2vYF7efutQykng/3PED4t
 /VvRQWvt6jfU+4jxuVwh+7q26bpF2ps2mNKhz3blQA==
X-Google-Smtp-Source: AMsMyM4ywDaRleTsoeRVprVHXFsjI/u0ag/MWu5hiHo0W+Oec5R/sA6X9Q8sVGywNH9CD1XpE5kxoPxYODT3YmfWMXQ=
X-Received: by 2002:a05:6e02:1253:b0:2fd:2fb5:c9f7 with SMTP id
 j19-20020a056e02125300b002fd2fb5c9f7mr12627533ilq.129.1666330658197; Thu, 20
 Oct 2022 22:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020123506.26363-8-ani@anisinha.ca>
 <87o7u675el.fsf@linaro.org>
In-Reply-To: <87o7u675el.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 21 Oct 2022 11:07:27 +0530
Message-ID: <CAARzgwzF0=gN3md2awgY85oSn2zUGrz5gbX_zoMRg-OZc1WeBA@mail.gmail.com>
Subject: Re: [PATCH v6 07/10] acpi/tests/avocado/bits: add biosbits config
 file for running bios tests
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 11:18 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > This change adds initial biosbits config file that instructs biosbits t=
o run
> > bios test suits in batch mode. Additionally acpi and smbios structures =
are also
> > dumped.
>
> Is it possible to split this into different avocado tests or would it
> require building multiple isos?

Bits takes this configuration to decide which tests it should run.
Currently, this config is not modified from the original bits config
file upstream.
It might be possible to use different config files for different bits
tests as you suggested and generate a separate iso for each of the
tests with their corresponding config file (and then use that iso for
the corresponding test).
However, I would like to leave this as a future exercise. Currently,
it's simple enough in my opinion to have just one config file and run
all the tests in batch mode. I do not see a compelling reason to add
the extra complication of generating an iso for every sub-test yet.

>
> Otherwise:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
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
> >  .../avocado/acpi-bits/bits-config/bits-cfg.txt | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
> >
> > diff --git a/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
> > b/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
> > new file mode 100644
> > index 0000000000..8010804453
> > --- /dev/null
> > +++ b/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
> > @@ -0,0 +1,18 @@
> > +# BITS configuration file
> > +[bits]
> > +
> > +# To run BITS in batch mode, set batch to a list of one or more of the
> > +# following keywords; BITS will then run all of the requested operatio=
ns, then
> > +# save the log file to disk.
> > +#
> > +# test: Run the full BITS testsuite.
> > +# acpi: Dump all ACPI structures.
> > +# smbios: Dump all SMBIOS structures.
> > +#
> > +# Leave batch set to an empty string to disable batch mode.
> > +# batch =3D
> > +
> > +# Uncomment the following to run all available batch operations
> > +# please take a look at boot/python/init.py in bits zip file
> > +# to see how these options are parsed and used.
> > +batch =3D test acpi smbios
>
>
> --
> Alex Benn=C3=A9e

