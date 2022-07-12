Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16188571FD3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:45:47 +0200 (CEST)
Received: from localhost ([::1]:54622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBI52-00030E-Gq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oBHyd-00045t-TY
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:39:08 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oBHyT-0006rI-6s
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:39:07 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so11795849pjo.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 08:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=R19sxRisJN6FvZ5eVmRIchdvBHKFglBGy7qTiZrl/qY=;
 b=dc+mp07q3apiMpKOdA0hR7UDtCkjO7+++9k81O4A8CAWQa/IjkLfNJTWNFHzWUiP/T
 VO1T6GjTNDadZqtlDqIrvjF3AIN+eCpAwVxVi/lXHrOc6nFBPTN66jGQl/TGS4kKEf3b
 D0LwDqGYUrJcLx/YjGr3PoXCZwd5mbI4nkLyaGar8XmyA06ZnXQgemGRS7FCfo6LGzz/
 asreTGY0HCegkPIAo4aHoO0ujQGoXw8YGWzWRbech/uqkloGQ5BP+GW5imipDdBlg8Br
 azE5fXT9JSRcuXmVJWho6Kl5zZ/yCJmkDiEOU6aJNDM6TIswOM2mvWboceMz+1rjiQME
 c4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=R19sxRisJN6FvZ5eVmRIchdvBHKFglBGy7qTiZrl/qY=;
 b=UNsO+4UVOm9AtE1dYn5vl30NHhSfzvONc1s+vCwPDRNyEktghI6OrAx/S51ooB2ZmY
 cy2UwM1u4vv1oUbmm1SXXz2JeR4ZxO7twETIf1YUwN8YbYa7qJmT/0N7Lk76dXlSttQG
 sTvjk9EuLHK8/pkeaWwnVSRW0+JohTK8wAzIoUvpdYx7qfHcVIIGb+jTzWEFiGlRDSFf
 YGsRPMj0yCOc+MjkSqSy3aMsZWT2z6WY16DXa05xMn9al06LdwaF32EWmABBmb02F+bh
 VS/DqLurN9hj9dU7W8xiKxdru05+44E+tD7Wu5COlDIuSw78AdTRLJpws9DrxvJK8vHs
 D/JQ==
X-Gm-Message-State: AJIora90YeZck3KMcOjfcFW1v0edF7Rs1PSUo0BpAWHYwnLv8YBadxiK
 BoJnugr1XmQRiE3DFQfk/zIicw==
X-Google-Smtp-Source: AGRyM1ttMgjVxMyFenKnpVQO00ZTQzZVZ/JdIlqrXZQe2YyJ5+z2De01U8GwS+BKHVzjwHmeuPp2Iw==
X-Received: by 2002:a17:902:6acb:b0:16b:efc7:8de7 with SMTP id
 i11-20020a1709026acb00b0016befc78de7mr23975709plt.63.1657640333720; 
 Tue, 12 Jul 2022 08:38:53 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.118.4])
 by smtp.googlemail.com with ESMTPSA id
 t22-20020a17090a951600b001ef86a1330csm6979827pjo.34.2022.07.12.08.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 08:38:53 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 12 Jul 2022 21:08:46 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: John Snow <jsnow@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, qemu-devel <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
Subject: Re: [PATCH v2 01/11] acpi/tests/bits: initial commit of test scripts
 that are run by biosbits
In-Reply-To: <CAFn=p-bTwoj7+0o0jKVSirwA3cU316XmiOD316NsB0m5yQ_dnw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207122105530.1972389@anisinha-lenovo>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-2-ani@anisinha.ca>
 <CAFn=p-bcY7xuT-wAZqShhTD9KeVu52OM6-kh3XFNkWgKXbDYUA@mail.gmail.com>
 <alpine.DEB.2.22.394.2207121246490.1824593@anisinha-lenovo>
 <CAFn=p-bTwoj7+0o0jKVSirwA3cU316XmiOD316NsB0m5yQ_dnw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Tue, 12 Jul 2022, John Snow wrote:

> On Tue, Jul 12, 2022, 3:17 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> >
> >
> > On Mon, 11 Jul 2022, John Snow wrote:
> >
> > > On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > > This is initial commit of cpuid, acpi and smbios python test scripts
> > for
> > > > biosbits to execute. No change has been made to them from the original
> > code
> > > > written by the biosbits author Josh Triplett. They are required to be
> > installed
> > > > into the bits iso file and then run from within the virtual machine
> > booted off
> > > > with biosbits iso.
> > > >
> > > > The original location of these tests are here:
> > > > https://github.com/biosbits/bits/blob/master/python/testacpi.py
> > > > https://github.com/biosbits/bits/blob/master/python/smbios.py
> > > > https://github.com/biosbits/bits/blob/master/python/testcpuid.py
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > ---
> > > >  tests/pytest/acpi-bits/bits-tests/meson.build |   11 +
> > > >  tests/pytest/acpi-bits/bits-tests/smbios.py   | 2430 +++++++++++++++++
> > > >  tests/pytest/acpi-bits/bits-tests/testacpi.py |  283 ++
> > > >  .../pytest/acpi-bits/bits-tests/testcpuid.py  |   83 +
> > > >  4 files changed, 2807 insertions(+)
> > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/meson.build
> > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/smbios.py
> > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/testacpi.py
> > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/testcpuid.py
> > > >
> > > > diff --git a/tests/pytest/acpi-bits/bits-tests/meson.build
> > b/tests/pytest/acpi-bits/bits-tests/meson.build
> > > > new file mode 100644
> > > > index 0000000000..3056731a53
> > > > --- /dev/null
> > > > +++ b/tests/pytest/acpi-bits/bits-tests/meson.build
> > > > @@ -0,0 +1,11 @@
> > > > +test_files = ['smbios.py', 'testacpi.py', 'testcpuid.py']
> > > > +
> > > > +copytestfiles = custom_target('copy test files',
> > > > +  input : test_files,
> > > > +  output :  test_files,
> > > > +  command : ['cp', '@INPUT@', '@OUTDIR@'],
> > > > +  install : true,
> > > > +  install_dir : 'bits-tests',
> > > > +  build_by_default : true)
> > > > +
> > > > +other_deps += copytestfiles
> > > > diff --git a/tests/pytest/acpi-bits/bits-tests/smbios.py
> > b/tests/pytest/acpi-bits/bits-tests/smbios.py
> > > > new file mode 100644
> > > > index 0000000000..9667d0542c
> > > > --- /dev/null
> > > > +++ b/tests/pytest/acpi-bits/bits-tests/smbios.py
> > > > @@ -0,0 +1,2430 @@
> > > > +# Copyright (c) 2015, Intel Corporation
> > > > +# All rights reserved.
> > > > +#
> > > > +# Redistribution and use in source and binary forms, with or without
> > > > +# modification, are permitted provided that the following conditions
> > are met:
> > > > +#
> > > > +#     * Redistributions of source code must retain the above
> > copyright notice,
> > > > +#       this list of conditions and the following disclaimer.
> > > > +#     * Redistributions in binary form must reproduce the above
> > copyright notice,
> > > > +#       this list of conditions and the following disclaimer in the
> > documentation
> > > > +#       and/or other materials provided with the distribution.
> > > > +#     * Neither the name of Intel Corporation nor the names of its
> > contributors
> > > > +#       may be used to endorse or promote products derived from this
> > software
> > > > +#       without specific prior written permission.
> > > > +#
> > > > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> > "AS IS" AND
> > > > +# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
> > THE IMPLIED
> > > > +# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> > ARE
> > > > +# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
> > BE LIABLE FOR
> > > > +# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> > CONSEQUENTIAL DAMAGES
> > > > +# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
> > SERVICES;
> > > > +# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
> > CAUSED AND ON
> > > > +# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
> > TORT
> > > > +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
> > USE OF THIS
> > > > +# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > > > +
> > > > +"""SMBIOS/DMI module."""
> > > > +
> > > > +import bits
> > > > +import bitfields
> > >
> > > New deps?
> > >
> > > > +import ctypes
> > > > +import redirect
> > >
> > > Also a new dep?
> > >
> > > > +import struct
> > > > +import uuid
> > > > +import unpack
> > >
> > > And another?
> > >
> > > > +import ttypager
> > > > +import sys
> > >
> > > What's the proposed strategy for dependency management for these
> > > tests? I know there's some mail I'm backlogged on ...
> > >
> >
> > For some reason I did not need to add those libraries as dependencies. If
> > needed we can add them in requirements.txt for pyenv.
> >
>
> Probably pulled in as deps to what you do install; pinning them may be
> helpful for repeatability reasons and to avoid playing whackamole with new
> pypi releases during the rc testing phase - speaking from experience with
> the other python test packages in the tree.


Actually wait, I completely forgot something. These test scrips are run
*inside* bios-bits VM, That is, we need not worry about ensuring the
availability of these libraries and the deps they introduce ourselves.
Bios bits takes care of it. It is a software written and maintained
outside of QEMU.

The only python script whose deps we need to worry about is the one I
wrote myself - acpi-bits-test.py .

>
> That said, explicitly enumerating all of the deps is also a costly
> maintenance activity, so ... YMMV.
>
> It depends on how fastidiously the main requirements you state manage their
> own sub deps. Some projects do it well, some don't.
>
> Just something to consider.
>
> --js
>
> >
>

