Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE65571FFB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:54:27 +0200 (CEST)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBIDS-0004Aj-K2
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oBI65-0005WO-1J
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:46:49 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oBI62-0008J3-Ml
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:46:48 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q82so7922737pgq.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=9a/zgGWlUxWrsk8W948vzpObLZVaOkoNll1ek+o3lrc=;
 b=YcrV2oTLEXngckzPgv2CUIhJKIQROGmOITtGgOkVNKEe6s/Y0zVm6A391p5DQAq4p+
 LWkKhqS4TdX2ud/poe0kL4sJXWtRJFmpoCmAD199ChhfAFJ9kxK22BrIOOQwA0UjkTK4
 8l76LE1EwEVGz598KJQxy/iP0pQog+oPgjqYqlGfErhbfh7xakcH5br+1YMy6Q/Lk643
 sExkqnB1/LRXZwqo6VEkQQKe8nVAyIev/MyTlhj+xgyFTZpbypX3YnQBdxn/Gk69i7iC
 Jf51omtM0uRdmTSdvzT76DfWoXt16s1+Rzfk4FphcYXRZoK2crMtCtDR+uzm48U2Rvm4
 wxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=9a/zgGWlUxWrsk8W948vzpObLZVaOkoNll1ek+o3lrc=;
 b=Y9uhnvUl58xeyMVnbxK86WAxFgLHKVxI9hf2/AoPYaPMmUTsiToEDmOB2cPrH6LjfP
 xHj6RcnI6YGXkyN0MI37H7mM+t2aQ7p5cBvi4kBvt9gr0ZVKUC0kZbiMWxae2cJs5RlN
 GXWdc9fefqarBKY2+gWbbYIqS0Q1HefXEGyXp3YyYiidoUYf2yq0yL7vezv2yGvkyRw0
 w4cHty2tZKieJ/nMPmU5m2JgdD4VpMH8X5L0cOWOrwU9Qoq7fbbfSwsPX/Lw81B70a7D
 2rijieg/AirqM+QEzR54gipOirVGOo1uMgx6xpFXfH0S1yJAxF2d6G2mMO8NHFkvjWO9
 hB0w==
X-Gm-Message-State: AJIora/vmf0X0pE0Y06o660CuvAuIjajaaET/eOl7ORQ4KvpMy32WpXh
 Pn1ZFHK8Bjpy69DWYWFglf2ZZw==
X-Google-Smtp-Source: AGRyM1sJw+SMQDg79fhGNSbRBIHGBSm99agTtmSlybx4k3PNulgiNriHzgyHl9yofjNN5SawwnOZ8w==
X-Received: by 2002:a65:6893:0:b0:412:a990:c06a with SMTP id
 e19-20020a656893000000b00412a990c06amr20443505pgt.126.1657640804843; 
 Tue, 12 Jul 2022 08:46:44 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.118.4])
 by smtp.googlemail.com with ESMTPSA id
 d9-20020a170902654900b0016bfb09be10sm6949749pln.305.2022.07.12.08.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 08:46:44 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 12 Jul 2022 21:16:38 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: John Snow <jsnow@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, qemu-devel <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
Subject: Re: [PATCH v2 01/11] acpi/tests/bits: initial commit of test scripts
 that are run by biosbits
In-Reply-To: <CAFn=p-bm+o=gBpnBKmmGpfg85MqApi8A9+R9J1ukMpd-u5jpiA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207122116140.1972389@anisinha-lenovo>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-2-ani@anisinha.ca>
 <CAFn=p-bcY7xuT-wAZqShhTD9KeVu52OM6-kh3XFNkWgKXbDYUA@mail.gmail.com>
 <alpine.DEB.2.22.394.2207121246490.1824593@anisinha-lenovo>
 <CAFn=p-bTwoj7+0o0jKVSirwA3cU316XmiOD316NsB0m5yQ_dnw@mail.gmail.com>
 <alpine.DEB.2.22.394.2207122105530.1972389@anisinha-lenovo>
 <CAFn=p-bm+o=gBpnBKmmGpfg85MqApi8A9+R9J1ukMpd-u5jpiA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52a.google.com
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



On Tue, 12 Jul 2022, John Snow wrote:

> On Tue, Jul 12, 2022, 11:38 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> >
> >
> > On Tue, 12 Jul 2022, John Snow wrote:
> >
> > > On Tue, Jul 12, 2022, 3:17 AM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > >
> > > >
> > > > On Mon, 11 Jul 2022, John Snow wrote:
> > > >
> > > > > On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > > > >
> > > > > > This is initial commit of cpuid, acpi and smbios python test
> > scripts
> > > > for
> > > > > > biosbits to execute. No change has been made to them from the
> > original
> > > > code
> > > > > > written by the biosbits author Josh Triplett. They are required to
> > be
> > > > installed
> > > > > > into the bits iso file and then run from within the virtual machine
> > > > booted off
> > > > > > with biosbits iso.
> > > > > >
> > > > > > The original location of these tests are here:
> > > > > > https://github.com/biosbits/bits/blob/master/python/testacpi.py
> > > > > > https://github.com/biosbits/bits/blob/master/python/smbios.py
> > > > > > https://github.com/biosbits/bits/blob/master/python/testcpuid.py
> > > > > >
> > > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > > ---
> > > > > >  tests/pytest/acpi-bits/bits-tests/meson.build |   11 +
> > > > > >  tests/pytest/acpi-bits/bits-tests/smbios.py   | 2430
> > +++++++++++++++++
> > > > > >  tests/pytest/acpi-bits/bits-tests/testacpi.py |  283 ++
> > > > > >  .../pytest/acpi-bits/bits-tests/testcpuid.py  |   83 +
> > > > > >  4 files changed, 2807 insertions(+)
> > > > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/meson.build
> > > > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/smbios.py
> > > > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/testacpi.py
> > > > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/testcpuid.py
> > > > > >
> > > > > > diff --git a/tests/pytest/acpi-bits/bits-tests/meson.build
> > > > b/tests/pytest/acpi-bits/bits-tests/meson.build
> > > > > > new file mode 100644
> > > > > > index 0000000000..3056731a53
> > > > > > --- /dev/null
> > > > > > +++ b/tests/pytest/acpi-bits/bits-tests/meson.build
> > > > > > @@ -0,0 +1,11 @@
> > > > > > +test_files = ['smbios.py', 'testacpi.py', 'testcpuid.py']
> > > > > > +
> > > > > > +copytestfiles = custom_target('copy test files',
> > > > > > +  input : test_files,
> > > > > > +  output :  test_files,
> > > > > > +  command : ['cp', '@INPUT@', '@OUTDIR@'],
> > > > > > +  install : true,
> > > > > > +  install_dir : 'bits-tests',
> > > > > > +  build_by_default : true)
> > > > > > +
> > > > > > +other_deps += copytestfiles
> > > > > > diff --git a/tests/pytest/acpi-bits/bits-tests/smbios.py
> > > > b/tests/pytest/acpi-bits/bits-tests/smbios.py
> > > > > > new file mode 100644
> > > > > > index 0000000000..9667d0542c
> > > > > > --- /dev/null
> > > > > > +++ b/tests/pytest/acpi-bits/bits-tests/smbios.py
> > > > > > @@ -0,0 +1,2430 @@
> > > > > > +# Copyright (c) 2015, Intel Corporation
> > > > > > +# All rights reserved.
> > > > > > +#
> > > > > > +# Redistribution and use in source and binary forms, with or
> > without
> > > > > > +# modification, are permitted provided that the following
> > conditions
> > > > are met:
> > > > > > +#
> > > > > > +#     * Redistributions of source code must retain the above
> > > > copyright notice,
> > > > > > +#       this list of conditions and the following disclaimer.
> > > > > > +#     * Redistributions in binary form must reproduce the above
> > > > copyright notice,
> > > > > > +#       this list of conditions and the following disclaimer in
> > the
> > > > documentation
> > > > > > +#       and/or other materials provided with the distribution.
> > > > > > +#     * Neither the name of Intel Corporation nor the names of its
> > > > contributors
> > > > > > +#       may be used to endorse or promote products derived from
> > this
> > > > software
> > > > > > +#       without specific prior written permission.
> > > > > > +#
> > > > > > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> > CONTRIBUTORS
> > > > "AS IS" AND
> > > > > > +# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
> > TO,
> > > > THE IMPLIED
> > > > > > +# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
> > PURPOSE
> > > > ARE
> > > > > > +# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> > CONTRIBUTORS
> > > > BE LIABLE FOR
> > > > > > +# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> > > > CONSEQUENTIAL DAMAGES
> > > > > > +# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> > OR
> > > > SERVICES;
> > > > > > +# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
> > > > CAUSED AND ON
> > > > > > +# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> > OR
> > > > TORT
> > > > > > +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
> > THE
> > > > USE OF THIS
> > > > > > +# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > > > > > +
> > > > > > +"""SMBIOS/DMI module."""
> > > > > > +
> > > > > > +import bits
> > > > > > +import bitfields
> > > > >
> > > > > New deps?
> > > > >
> > > > > > +import ctypes
> > > > > > +import redirect
> > > > >
> > > > > Also a new dep?
> > > > >
> > > > > > +import struct
> > > > > > +import uuid
> > > > > > +import unpack
> > > > >
> > > > > And another?
> > > > >
> > > > > > +import ttypager
> > > > > > +import sys
> > > > >
> > > > > What's the proposed strategy for dependency management for these
> > > > > tests? I know there's some mail I'm backlogged on ...
> > > > >
> > > >
> > > > For some reason I did not need to add those libraries as dependencies.
> > If
> > > > needed we can add them in requirements.txt for pyenv.
> > > >
> > >
> > > Probably pulled in as deps to what you do install; pinning them may be
> > > helpful for repeatability reasons and to avoid playing whackamole with
> > new
> > > pypi releases during the rc testing phase - speaking from experience with
> > > the other python test packages in the tree.
> >
> >
> > Actually wait, I completely forgot something. These test scrips are run
> > *inside* bios-bits VM, That is, we need not worry about ensuring the
> > availability of these libraries and the deps they introduce ourselves.
> > Bios bits takes care of it. It is a software written and maintained
> > outside of QEMU.
> >
> > The only python script whose deps we need to worry about is the one I
> > wrote myself - acpi-bits-test.py .
> >
>
> Aha. Could I please ask for a comment in each .py file that isn't designed
> to run directly in the host v/environment? Just a small nod to the fact
> that it runs in a special VM so I can exclude it from other regular
> maintenance operations / considerations for dependency management in the
> host testing env.
>
> # Designed to run only in the biosbits VM.
>
> would be more than sufficient.

Perfect. Will do in the next iteration.


