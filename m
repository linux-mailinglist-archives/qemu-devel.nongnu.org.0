Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEC5571367
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:48:41 +0200 (CEST)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAdM-000389-OY
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oBA9S-0007Fa-1h
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:17:46 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oBA9Q-0006YV-3O
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:17:45 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 cp18-20020a17090afb9200b001ef79e8484aso732230pjb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=EXDIaVJw6NTm13nSx6MScq6d3xAv3jXKB0Bhg75k+7Q=;
 b=RSQsY0E1+pmz+WARvsakSAHnb8cYdA+TIi7BSZwlTsKuyNZMtjBUSGSdQVpJL71hFZ
 CtOl5ytEphGR+Su6mlC5nv2i6mWont+XtWtDBKIVteOz9/yDVWK3oBgt2pbOlYQHyR/3
 WYE8stmI4G9Ka5tUrNKv/cpF9EDvEVAfadcD8UOm+SfpiF98oqB7oSUffi8vJJonHRQ3
 M+SDXAlEG+RbMpAB1OZVC2TyZ+L2SXjLoHn86QSSz7foiOAOxRZefM/Q1ga+fPy2npSH
 Fdtwl25doScO5kZp0oJeymVyDsVWC/Q0b4K6VPv9PMJNZ/mtqPDMOjOiJeLZniGPpw3g
 /ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=EXDIaVJw6NTm13nSx6MScq6d3xAv3jXKB0Bhg75k+7Q=;
 b=t+Mg+4+xl1dKgVFMD5N74GEoZdp4WCajhEOtIYfOBerl35G5Hz8DwIU6HhVNQpXmiM
 QEq7add7IrMEYv1+WYEVqvvfFVsm4H8c6WlyRZBSkxyzg+FJcNlTOommfB3SbesvuSz3
 JiEuhi5Su6ldoKj7dg7NzdWjqmpJK87er9+n8SaRp9iKdUzbtPnhoyLy2KefcnWnhP4G
 8i0SXlOPhC4lEz46oj3TVZ1grYtkX9T5kchh/B+gg+YHK+Pjod8RgRYENvjIgWw1fLZf
 vKwF2F68LsmcR9QisXIqUxPsqo35uNr6aCyOdmu7aNSkPC1IoC73bUVlhtKvMxrGXoj/
 FI2w==
X-Gm-Message-State: AJIora/Kv52qhKqnqWn3h1dcmopXtq1zdQ69jDi6ilM6T9MLgbcTDXoc
 beap8a1Zmyei1g2WQA7J4RTxtQ==
X-Google-Smtp-Source: AGRyM1sdbPpgD/WsskvxeilHxlyCNvEnSQfWMdaoT/Ci8UFHQ3RlcqImoLlrLzxQPfQsgzt1ZWiAew==
X-Received: by 2002:a17:90a:9f46:b0:1ef:789a:315f with SMTP id
 q6-20020a17090a9f4600b001ef789a315fmr2676202pjv.68.1657610262720; 
 Tue, 12 Jul 2022 00:17:42 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.118.4])
 by smtp.googlemail.com with ESMTPSA id
 c135-20020a621c8d000000b00517c84fd24asm6157722pfc.172.2022.07.12.00.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 00:17:42 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 12 Jul 2022 12:47:36 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: John Snow <jsnow@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, qemu-devel <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
Subject: Re: [PATCH v2 01/11] acpi/tests/bits: initial commit of test scripts
 that are run by biosbits
In-Reply-To: <CAFn=p-bcY7xuT-wAZqShhTD9KeVu52OM6-kh3XFNkWgKXbDYUA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207121246490.1824593@anisinha-lenovo>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-2-ani@anisinha.ca>
 <CAFn=p-bcY7xuT-wAZqShhTD9KeVu52OM6-kh3XFNkWgKXbDYUA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Mon, 11 Jul 2022, John Snow wrote:

> On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > This is initial commit of cpuid, acpi and smbios python test scripts for
> > biosbits to execute. No change has been made to them from the original code
> > written by the biosbits author Josh Triplett. They are required to be installed
> > into the bits iso file and then run from within the virtual machine booted off
> > with biosbits iso.
> >
> > The original location of these tests are here:
> > https://github.com/biosbits/bits/blob/master/python/testacpi.py
> > https://github.com/biosbits/bits/blob/master/python/smbios.py
> > https://github.com/biosbits/bits/blob/master/python/testcpuid.py
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/pytest/acpi-bits/bits-tests/meson.build |   11 +
> >  tests/pytest/acpi-bits/bits-tests/smbios.py   | 2430 +++++++++++++++++
> >  tests/pytest/acpi-bits/bits-tests/testacpi.py |  283 ++
> >  .../pytest/acpi-bits/bits-tests/testcpuid.py  |   83 +
> >  4 files changed, 2807 insertions(+)
> >  create mode 100644 tests/pytest/acpi-bits/bits-tests/meson.build
> >  create mode 100644 tests/pytest/acpi-bits/bits-tests/smbios.py
> >  create mode 100644 tests/pytest/acpi-bits/bits-tests/testacpi.py
> >  create mode 100644 tests/pytest/acpi-bits/bits-tests/testcpuid.py
> >
> > diff --git a/tests/pytest/acpi-bits/bits-tests/meson.build b/tests/pytest/acpi-bits/bits-tests/meson.build
> > new file mode 100644
> > index 0000000000..3056731a53
> > --- /dev/null
> > +++ b/tests/pytest/acpi-bits/bits-tests/meson.build
> > @@ -0,0 +1,11 @@
> > +test_files = ['smbios.py', 'testacpi.py', 'testcpuid.py']
> > +
> > +copytestfiles = custom_target('copy test files',
> > +  input : test_files,
> > +  output :  test_files,
> > +  command : ['cp', '@INPUT@', '@OUTDIR@'],
> > +  install : true,
> > +  install_dir : 'bits-tests',
> > +  build_by_default : true)
> > +
> > +other_deps += copytestfiles
> > diff --git a/tests/pytest/acpi-bits/bits-tests/smbios.py b/tests/pytest/acpi-bits/bits-tests/smbios.py
> > new file mode 100644
> > index 0000000000..9667d0542c
> > --- /dev/null
> > +++ b/tests/pytest/acpi-bits/bits-tests/smbios.py
> > @@ -0,0 +1,2430 @@
> > +# Copyright (c) 2015, Intel Corporation
> > +# All rights reserved.
> > +#
> > +# Redistribution and use in source and binary forms, with or without
> > +# modification, are permitted provided that the following conditions are met:
> > +#
> > +#     * Redistributions of source code must retain the above copyright notice,
> > +#       this list of conditions and the following disclaimer.
> > +#     * Redistributions in binary form must reproduce the above copyright notice,
> > +#       this list of conditions and the following disclaimer in the documentation
> > +#       and/or other materials provided with the distribution.
> > +#     * Neither the name of Intel Corporation nor the names of its contributors
> > +#       may be used to endorse or promote products derived from this software
> > +#       without specific prior written permission.
> > +#
> > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
> > +# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> > +# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> > +# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
> > +# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> > +# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> > +# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
> > +# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> > +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
> > +# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > +
> > +"""SMBIOS/DMI module."""
> > +
> > +import bits
> > +import bitfields
>
> New deps?
>
> > +import ctypes
> > +import redirect
>
> Also a new dep?
>
> > +import struct
> > +import uuid
> > +import unpack
>
> And another?
>
> > +import ttypager
> > +import sys
>
> What's the proposed strategy for dependency management for these
> tests? I know there's some mail I'm backlogged on ...
>

For some reason I did not need to add those libraries as dependencies. If
needed we can add them in requirements.txt for pyenv.

