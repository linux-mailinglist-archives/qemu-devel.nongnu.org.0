Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB9571F14
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:26:59 +0200 (CEST)
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHms-0000l2-13
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oBHk2-0006kS-TU
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oBHjy-0004MV-Cn
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657639437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Kj9er0AGEdF+qCChLb6AZ1utabiwntc7MiE32ZdPiQ=;
 b=e9zI4vtxQzs7GaQ7JRxC6yqEAn7JdRrIyelHvuwd8ZcgXsdLassDHumArnry66GB2aQt83
 WkpXUvRh+Oy0QBQioRDJ5RAig0M6wdc0e5XTPBM+aTX/WE3rvr1JqiykKc90u4ntHWwjdc
 3aIV4xxuGl3VCZOK16oBhLXmu7pVszg=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-djR0uxzQNG-klo7oBsRAEA-1; Tue, 12 Jul 2022 11:23:54 -0400
X-MC-Unique: djR0uxzQNG-klo7oBsRAEA-1
Received: by mail-ua1-f71.google.com with SMTP id
 h11-20020ab0470b000000b003832767ad4eso1899610uac.23
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 08:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Kj9er0AGEdF+qCChLb6AZ1utabiwntc7MiE32ZdPiQ=;
 b=TpRh4hiH3XhTOa/jA8oT/MT+gzvY+4tg0GE+3d3yDXafgMoCwsv/NJbw+uNCNRuSAf
 OYRix+Coxuziu5lPC7co8l5oV5YfDldghDTE5RueFfXu03fdS4oOuYi+LdbdLESyKN9w
 LT92sMxQbHsjnm3Zd3ptVS2eciguixjiI3zxKK4lsJ9xqO1vXsnfiHYd5vLDlkSWNT1P
 2o+hREKtZe7n7kMe7tV3L1b8BVtln7GvCy/ayva/+TKYnck+PcJmgq5IhNVS6td/zXAG
 VmWJWgeFT9ANGErnahv8Agj+wIls39FZaSzA6p3xcxPl2zwR+TH9f6TOhI41qJwyTFfJ
 7siQ==
X-Gm-Message-State: AJIora9hWaCJyK5BKMp1Qct3y8tlP6s06HN6SscabuRuvGvUOHZyc1Tn
 oRtvF5OlCuZEtSAit+j3BombuA1mSLgICw6yzSldVo07Ga5OqQduvodkN/XPjHiAd8cvM1qUANr
 AD+e4eKDJMeBV65VMPd1jtSRyxjOp63Q=
X-Received: by 2002:a1f:27d6:0:b0:374:3614:d037 with SMTP id
 n205-20020a1f27d6000000b003743614d037mr8908450vkn.1.1657639433631; 
 Tue, 12 Jul 2022 08:23:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vlZ97CwYWPdu/GHysWct4sQJsfHdnaoHv0XOkR3jdsXoNx1gWJwxg6ocgXWRjSpLupvsPB1L9402NgPJe+dYU=
X-Received: by 2002:a1f:27d6:0:b0:374:3614:d037 with SMTP id
 n205-20020a1f27d6000000b003743614d037mr8908430vkn.1.1657639433277; Tue, 12
 Jul 2022 08:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-2-ani@anisinha.ca>
 <CAFn=p-bcY7xuT-wAZqShhTD9KeVu52OM6-kh3XFNkWgKXbDYUA@mail.gmail.com>
 <alpine.DEB.2.22.394.2207121246490.1824593@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2207121246490.1824593@anisinha-lenovo>
From: John Snow <jsnow@redhat.com>
Date: Tue, 12 Jul 2022 11:23:42 -0400
Message-ID: <CAFn=p-bTwoj7+0o0jKVSirwA3cU316XmiOD316NsB0m5yQ_dnw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] acpi/tests/bits: initial commit of test scripts
 that are run by biosbits
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Daniel Berrange <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009628e005e39d4127"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000009628e005e39d4127
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022, 3:17 AM Ani Sinha <ani@anisinha.ca> wrote:

>
>
> On Mon, 11 Jul 2022, John Snow wrote:
>
> > On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > This is initial commit of cpuid, acpi and smbios python test scripts
> for
> > > biosbits to execute. No change has been made to them from the original
> code
> > > written by the biosbits author Josh Triplett. They are required to be
> installed
> > > into the bits iso file and then run from within the virtual machine
> booted off
> > > with biosbits iso.
> > >
> > > The original location of these tests are here:
> > > https://github.com/biosbits/bits/blob/master/python/testacpi.py
> > > https://github.com/biosbits/bits/blob/master/python/smbios.py
> > > https://github.com/biosbits/bits/blob/master/python/testcpuid.py
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  tests/pytest/acpi-bits/bits-tests/meson.build |   11 +
> > >  tests/pytest/acpi-bits/bits-tests/smbios.py   | 2430 +++++++++++++++++
> > >  tests/pytest/acpi-bits/bits-tests/testacpi.py |  283 ++
> > >  .../pytest/acpi-bits/bits-tests/testcpuid.py  |   83 +
> > >  4 files changed, 2807 insertions(+)
> > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/meson.build
> > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/smbios.py
> > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/testacpi.py
> > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/testcpuid.py
> > >
> > > diff --git a/tests/pytest/acpi-bits/bits-tests/meson.build
> b/tests/pytest/acpi-bits/bits-tests/meson.build
> > > new file mode 100644
> > > index 0000000000..3056731a53
> > > --- /dev/null
> > > +++ b/tests/pytest/acpi-bits/bits-tests/meson.build
> > > @@ -0,0 +1,11 @@
> > > +test_files = ['smbios.py', 'testacpi.py', 'testcpuid.py']
> > > +
> > > +copytestfiles = custom_target('copy test files',
> > > +  input : test_files,
> > > +  output :  test_files,
> > > +  command : ['cp', '@INPUT@', '@OUTDIR@'],
> > > +  install : true,
> > > +  install_dir : 'bits-tests',
> > > +  build_by_default : true)
> > > +
> > > +other_deps += copytestfiles
> > > diff --git a/tests/pytest/acpi-bits/bits-tests/smbios.py
> b/tests/pytest/acpi-bits/bits-tests/smbios.py
> > > new file mode 100644
> > > index 0000000000..9667d0542c
> > > --- /dev/null
> > > +++ b/tests/pytest/acpi-bits/bits-tests/smbios.py
> > > @@ -0,0 +1,2430 @@
> > > +# Copyright (c) 2015, Intel Corporation
> > > +# All rights reserved.
> > > +#
> > > +# Redistribution and use in source and binary forms, with or without
> > > +# modification, are permitted provided that the following conditions
> are met:
> > > +#
> > > +#     * Redistributions of source code must retain the above
> copyright notice,
> > > +#       this list of conditions and the following disclaimer.
> > > +#     * Redistributions in binary form must reproduce the above
> copyright notice,
> > > +#       this list of conditions and the following disclaimer in the
> documentation
> > > +#       and/or other materials provided with the distribution.
> > > +#     * Neither the name of Intel Corporation nor the names of its
> contributors
> > > +#       may be used to endorse or promote products derived from this
> software
> > > +#       without specific prior written permission.
> > > +#
> > > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> "AS IS" AND
> > > +# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
> THE IMPLIED
> > > +# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> ARE
> > > +# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
> BE LIABLE FOR
> > > +# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> CONSEQUENTIAL DAMAGES
> > > +# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
> SERVICES;
> > > +# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
> CAUSED AND ON
> > > +# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
> TORT
> > > +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
> USE OF THIS
> > > +# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > > +
> > > +"""SMBIOS/DMI module."""
> > > +
> > > +import bits
> > > +import bitfields
> >
> > New deps?
> >
> > > +import ctypes
> > > +import redirect
> >
> > Also a new dep?
> >
> > > +import struct
> > > +import uuid
> > > +import unpack
> >
> > And another?
> >
> > > +import ttypager
> > > +import sys
> >
> > What's the proposed strategy for dependency management for these
> > tests? I know there's some mail I'm backlogged on ...
> >
>
> For some reason I did not need to add those libraries as dependencies. If
> needed we can add them in requirements.txt for pyenv.
>

Probably pulled in as deps to what you do install; pinning them may be
helpful for repeatability reasons and to avoid playing whackamole with new
pypi releases during the rc testing phase - speaking from experience with
the other python test packages in the tree.

That said, explicitly enumerating all of the deps is also a costly
maintenance activity, so ... YMMV.

It depends on how fastidiously the main requirements you state manage their
own sub deps. Some projects do it well, some don't.

Just something to consider.

--js

>

--0000000000009628e005e39d4127
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jul 12, 2022, 3:17 AM Ani Sinha &lt;<a href=3D=
"mailto:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><br>
<br>
On Mon, 11 Jul 2022, John Snow wrote:<br>
<br>
&gt; On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha &lt;<a href=3D"mailto:ani@an=
isinha.ca" target=3D"_blank" rel=3D"noreferrer">ani@anisinha.ca</a>&gt; wro=
te:<br>
&gt; &gt;<br>
&gt; &gt; This is initial commit of cpuid, acpi and smbios python test scri=
pts for<br>
&gt; &gt; biosbits to execute. No change has been made to them from the ori=
ginal code<br>
&gt; &gt; written by the biosbits author Josh Triplett. They are required t=
o be installed<br>
&gt; &gt; into the bits iso file and then run from within the virtual machi=
ne booted off<br>
&gt; &gt; with biosbits iso.<br>
&gt; &gt;<br>
&gt; &gt; The original location of these tests are here:<br>
&gt; &gt; <a href=3D"https://github.com/biosbits/bits/blob/master/python/te=
stacpi.py" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.c=
om/biosbits/bits/blob/master/python/testacpi.py</a><br>
&gt; &gt; <a href=3D"https://github.com/biosbits/bits/blob/master/python/sm=
bios.py" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/biosbits/bits/blob/master/python/smbios.py</a><br>
&gt; &gt; <a href=3D"https://github.com/biosbits/bits/blob/master/python/te=
stcpuid.py" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.=
com/biosbits/bits/blob/master/python/testcpuid.py</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" t=
arget=3D"_blank" rel=3D"noreferrer">ani@anisinha.ca</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 tests/pytest/acpi-bits/bits-tests/meson.build |=C2=A0 =C2=
=A011 +<br>
&gt; &gt;=C2=A0 tests/pytest/acpi-bits/bits-tests/smbios.py=C2=A0 =C2=A0| 2=
430 +++++++++++++++++<br>
&gt; &gt;=C2=A0 tests/pytest/acpi-bits/bits-tests/testacpi.py |=C2=A0 283 +=
+<br>
&gt; &gt;=C2=A0 .../pytest/acpi-bits/bits-tests/testcpuid.py=C2=A0 |=C2=A0 =
=C2=A083 +<br>
&gt; &gt;=C2=A0 4 files changed, 2807 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/bits-tests/meson.=
build<br>
&gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/bits-tests/smbios=
.py<br>
&gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/bits-tests/testac=
pi.py<br>
&gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/bits-tests/testcp=
uid.py<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/tests/pytest/acpi-bits/bits-tests/meson.build b/test=
s/pytest/acpi-bits/bits-tests/meson.build<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..3056731a53<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/tests/pytest/acpi-bits/bits-tests/meson.build<br>
&gt; &gt; @@ -0,0 +1,11 @@<br>
&gt; &gt; +test_files =3D [&#39;smbios.py&#39;, &#39;testacpi.py&#39;, &#39=
;testcpuid.py&#39;]<br>
&gt; &gt; +<br>
&gt; &gt; +copytestfiles =3D custom_target(&#39;copy test files&#39;,<br>
&gt; &gt; +=C2=A0 input : test_files,<br>
&gt; &gt; +=C2=A0 output :=C2=A0 test_files,<br>
&gt; &gt; +=C2=A0 command : [&#39;cp&#39;, &#39;@INPUT@&#39;, &#39;@OUTDIR@=
&#39;],<br>
&gt; &gt; +=C2=A0 install : true,<br>
&gt; &gt; +=C2=A0 install_dir : &#39;bits-tests&#39;,<br>
&gt; &gt; +=C2=A0 build_by_default : true)<br>
&gt; &gt; +<br>
&gt; &gt; +other_deps +=3D copytestfiles<br>
&gt; &gt; diff --git a/tests/pytest/acpi-bits/bits-tests/smbios.py b/tests/=
pytest/acpi-bits/bits-tests/smbios.py<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..9667d0542c<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/tests/pytest/acpi-bits/bits-tests/smbios.py<br>
&gt; &gt; @@ -0,0 +1,2430 @@<br>
&gt; &gt; +# Copyright (c) 2015, Intel Corporation<br>
&gt; &gt; +# All rights reserved.<br>
&gt; &gt; +#<br>
&gt; &gt; +# Redistribution and use in source and binary forms, with or wit=
hout<br>
&gt; &gt; +# modification, are permitted provided that the following condit=
ions are met:<br>
&gt; &gt; +#<br>
&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0* Redistributions of source code must retai=
n the above copyright notice,<br>
&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0this list of conditions and the foll=
owing disclaimer.<br>
&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0* Redistributions in binary form must repro=
duce the above copyright notice,<br>
&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0this list of conditions and the foll=
owing disclaimer in the documentation<br>
&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0and/or other materials provided with=
 the distribution.<br>
&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0* Neither the name of Intel Corporation nor=
 the names of its contributors<br>
&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0may be used to endorse or promote pr=
oducts derived from this software<br>
&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0without specific prior written permi=
ssion.<br>
&gt; &gt; +#<br>
&gt; &gt; +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIB=
UTORS &quot;AS IS&quot; AND<br>
&gt; &gt; +# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED =
TO, THE IMPLIED<br>
&gt; &gt; +# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE ARE<br>
&gt; &gt; +# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUT=
ORS BE LIABLE FOR<br>
&gt; &gt; +# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSE=
QUENTIAL DAMAGES<br>
&gt; &gt; +# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOOD=
S OR SERVICES;<br>
&gt; &gt; +# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEV=
ER CAUSED AND ON<br>
&gt; &gt; +# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY=
, OR TORT<br>
&gt; &gt; +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF =
THE USE OF THIS<br>
&gt; &gt; +# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.<b=
r>
&gt; &gt; +<br>
&gt; &gt; +&quot;&quot;&quot;SMBIOS/DMI module.&quot;&quot;&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +import bits<br>
&gt; &gt; +import bitfields<br>
&gt;<br>
&gt; New deps?<br>
&gt;<br>
&gt; &gt; +import ctypes<br>
&gt; &gt; +import redirect<br>
&gt;<br>
&gt; Also a new dep?<br>
&gt;<br>
&gt; &gt; +import struct<br>
&gt; &gt; +import uuid<br>
&gt; &gt; +import unpack<br>
&gt;<br>
&gt; And another?<br>
&gt;<br>
&gt; &gt; +import ttypager<br>
&gt; &gt; +import sys<br>
&gt;<br>
&gt; What&#39;s the proposed strategy for dependency management for these<b=
r>
&gt; tests? I know there&#39;s some mail I&#39;m backlogged on ...<br>
&gt;<br>
<br>
For some reason I did not need to add those libraries as dependencies. If<b=
r>
needed we can add them in requirements.txt for pyenv.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Probably pulled in as =
deps to what you do install; pinning them may be helpful for repeatability =
reasons and to avoid playing whackamole with new pypi releases during the r=
c testing phase - speaking from experience with the other python test packa=
ges in the tree.</div><div dir=3D"auto"><br></div><div dir=3D"auto">That sa=
id, explicitly enumerating all of the deps is also a costly maintenance act=
ivity, so ... YMMV.</div><div dir=3D"auto"><br></div><div dir=3D"auto">It d=
epends on how fastidiously the main requirements you state manage their own=
 sub deps. Some projects do it well, some don&#39;t.=C2=A0</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Just something to consider.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">--js</div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000009628e005e39d4127--


