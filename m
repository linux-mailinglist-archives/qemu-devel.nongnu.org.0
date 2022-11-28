Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C6E63A656
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:48:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozbet-0002Td-8K; Mon, 28 Nov 2022 05:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozbem-0002Rv-Ub
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:46:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozbej-0001J0-8i
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669632387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VWJsvYAELs0MbJ9fMU8j1KwF5ADBcYktWWrmFQG6n3c=;
 b=UgARfUCt/97vXcOQxeNbu6OEQBPJp8KGjW0nmiFh4fCv/xapm3yZhLa+Bv+Kow8EbhGzU4
 EOQa2ltJGwVcx+OO7PlkYO3NIC0WtCTTCwFYl7dnEOHGBLbjUmZLmXmA+JOVvdvo8bQUII
 wMnAwy+f1eJNmEiESMuxYkJiN+gwNnU=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-7Vg9w9E0OiuBIEv3GF-QsA-1; Mon, 28 Nov 2022 05:46:25 -0500
X-MC-Unique: 7Vg9w9E0OiuBIEv3GF-QsA-1
Received: by mail-il1-f200.google.com with SMTP id
 k3-20020a92c243000000b0030201475a6bso8496989ilo.9
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 02:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VWJsvYAELs0MbJ9fMU8j1KwF5ADBcYktWWrmFQG6n3c=;
 b=Utfb51wxPnoQPvccm2y9gNC66nNRUNJGfmfPvp+xNSeSXoJuyImSkGnmP4+t5WNYsz
 uXjAF+NbcAFOVXPmu7X9RJQ14kknbygqGmEzILh4l2+rHjrrHtd8e8Veo29Ag2Qe5yxv
 3zhs/MKyIfNs3M/N6smkjUAQoaRcrnIik4Vr/o5kveLJquLCuC7UlJPhl93JU1dsxTXD
 ipTDMIGa4D/+/NrCeJkkZLT1CstVkx16F/h4fQJRVAJhFLTZua0P7U/89Mz+J2qXU/dj
 egcrdU9YRFrDoY8GmdkZZ5ZQtRLn1NXorlmUHDLNfEHW3GUxK11Ag09pIi2PCSCmOcvQ
 YWWQ==
X-Gm-Message-State: ANoB5plpw08l5mbUuDLKDp9dtbyPNkXuggsWZZicdkk4gs/vdk2vODim
 VcQlcuJ+MgaPoMl81cpOPTvanN9rKdc5+OBFh2xphUrWQnFdzi8g9bbFU2xOuOzw9V+aw0ocs/p
 W9ri4yy3vF3ZRm5JOsT3Q0qyswuSrBKE=
X-Received: by 2002:a02:c492:0:b0:375:c128:72a6 with SMTP id
 t18-20020a02c492000000b00375c12872a6mr23586014jam.151.1669632385254; 
 Mon, 28 Nov 2022 02:46:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf40TUP0OchydLFu+aCkWww9UV0tmoqkHHX65xujB5M10ygCiCtXeiSPEhf+cBme6atq6DtKN574Rgz3BD9L66M=
X-Received: by 2002:a02:c492:0:b0:375:c128:72a6 with SMTP id
 t18-20020a02c492000000b00375c12872a6mr23586004jam.151.1669632384973; Mon, 28
 Nov 2022 02:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-3-nsoffer@redhat.com>
 <81bd7016-70e7-b3de-2181-5610724f55d8@redhat.com>
 <CAMRbyysLRw6oLpagLyQR3KeRNcW_aPuckMvqVviWiHhhENNH2A@mail.gmail.com>
 <8fac5092-86bb-869a-7a75-067d2cb11169@redhat.com>
In-Reply-To: <8fac5092-86bb-869a-7a75-067d2cb11169@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Mon, 28 Nov 2022 12:46:08 +0200
Message-ID: <CAMRbyysjHyjy5Kpy4VQxVz19arEbADQve_O36jEWePSks89=mw@mail.gmail.com>
Subject: Re: [PATCH 2/3] iotests: Test qemu-img checksum
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000365ca505ee85957a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000365ca505ee85957a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2022 at 1:41 PM Hanna Reitz <hreitz@redhat.com> wrote:

> On 30.10.22 18:38, Nir Soffer wrote:
> > On Wed, Oct 26, 2022 at 4:31 PM Hanna Reitz <hreitz@redhat.com> wrote:
> >
> >     On 01.09.22 16:32, Nir Soffer wrote:
> >     > Add simple tests creating an image with all kinds of extents,
> >     different
> >     > formats, different backing chain, different protocol, and differe=
nt
> >     > image options. Since all images have the same guest visible
> >     content they
> >     > must have the same checksum.
> >     >
> >     > To help debugging in case of failures, the output includes a
> >     json map of
> >     > every test image.
> >     >
> >     > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> >     > ---
> >     >   tests/qemu-iotests/tests/qemu-img-checksum    | 149
> >     ++++++++++++++++++
> >     >   .../qemu-iotests/tests/qemu-img-checksum.out  |  74 +++++++++
> >     >   2 files changed, 223 insertions(+)
> >     >   create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
> >     >   create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.o=
ut
> >     >
> >     > diff --git a/tests/qemu-iotests/tests/qemu-img-checksum
> >     b/tests/qemu-iotests/tests/qemu-img-checksum
> >     > new file mode 100755
> >     > index 0000000000..3a85ba33f2
> >     > --- /dev/null
> >     > +++ b/tests/qemu-iotests/tests/qemu-img-checksum
> >     > @@ -0,0 +1,149 @@
> >     > +#!/usr/bin/env python3
> >     > +# group: rw auto quick
> >     > +#
> >     > +# Test cases for qemu-img checksum.
> >     > +#
> >     > +# Copyright (C) 2022 Red Hat, Inc.
> >     > +#
> >     > +# This program is free software; you can redistribute it and/or
> >     modify
> >     > +# it under the terms of the GNU General Public License as
> >     published by
> >     > +# the Free Software Foundation; either version 2 of the License,
> or
> >     > +# (at your option) any later version.
> >     > +#
> >     > +# This program is distributed in the hope that it will be useful=
,
> >     > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> >     > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >     > +# GNU General Public License for more details.
> >     > +#
> >     > +# You should have received a copy of the GNU General Public
> License
> >     > +# along with this program.  If not, see
> >     <http://www.gnu.org/licenses/>.
> >     > +
> >     > +import re
> >     > +
> >     > +import iotests
> >     > +
> >     > +from iotests import (
> >     > +    filter_testfiles,
> >     > +    qemu_img,
> >     > +    qemu_img_log,
> >     > +    qemu_io,
> >     > +    qemu_nbd_popen,
> >     > +)
> >     > +
> >     > +
> >     > +def checksum_available():
> >     > +    out =3D qemu_img("--help").stdout
> >     > +    return re.search(r"\bchecksum .+ filename\b", out) is not No=
ne
> >     > +
> >     > +
> >     > +if not checksum_available():
> >     > +    iotests.notrun("checksum command not available")
> >     > +
> >     > +iotests.script_initialize(
> >     > +    supported_fmts=3D["raw", "qcow2"],
> >     > +    supported_cache_modes=3D["none", "writeback"],
> >
> >     It doesn=E2=80=99t work with writeback, though, because it uses -T =
none
> below.
> >
> >
> > Good point
> >
> >
> >     Which by the way is a heavy cost, because I usually run tests in
> >     tmpfs,
> >     where this won=E2=80=99t work.  Is there any way of not doing the -=
T none
> >     below?
> >
> >
> > Testing using tempfs is problematic since you cannot test -T none.In
> > oVirt
> > we alway use /var/tmp which usually uses something that supports
> > direct I/O.
> >
> > Do we have a way to specify cache mode in the tests, so we can use -T
> none
> > only when the option is set?
>
> `./check` has a `-c` option (e.g. `./check -c none`), which lands in
> `iotests.cachemode`.  That isn=E2=80=99t automatically passed to qemu-img=
 calls,
> but you can do it manually (i.e. `qemu_img_log("checksum", "-T",
> iotests.cachemode, disk_top)` instead of `"-T", "none"`).
>

Ok, I will change to use the current cache setting.


> >
> >     > +    supported_protocols=3D["file", "nbd"],
> >     > +    required_fmts=3D["raw", "qcow2"],
> >     > +)
> >     > +
> >     > +print()
> >     > +print("=3D=3D=3D Test images =3D=3D=3D")
> >     > +print()
> >     > +
> >     > +disk_raw =3D iotests.file_path('raw')
> >     > +qemu_img("create", "-f", "raw", disk_raw, "10m")
> >     > +qemu_io("-f", "raw",
> >     > +        "-c", "write -P 0x1 0 2m",      # data
> >     > +        "-c", "write -P 0x0 2m 2m",     # data with zeroes
> >     > +        "-c", "write -z 4m 2m",         # zero allocated
> >     > +        "-c", "write -z -u 6m 2m",      # zero hole
> >     > +                                        # unallocated
> >     > +        disk_raw)
> >     > +print(filter_testfiles(disk_raw))
> >     > +qemu_img_log("map", "--output", "json", disk_raw)
> >     > +
> >     > +disk_qcow2 =3D iotests.file_path('qcow2')
> >     > +qemu_img("create", "-f", "qcow2", disk_qcow2, "10m")
> >     > +qemu_io("-f", "qcow2",
> >     > +        "-c", "write -P 0x1 0 2m",      # data
> >     > +        "-c", "write -P 0x0 2m 2m",     # data with zeroes
> >     > +        "-c", "write -z 4m 2m",         # zero allocated
> >     > +        "-c", "write -z -u 6m 2m",      # zero hole
> >     > +                                        # unallocated
> >     > +        disk_qcow2)
> >     > +print(filter_testfiles(disk_qcow2))
> >     > +qemu_img_log("map", "--output", "json", disk_qcow2)
> >
> >     This isn=E2=80=99t how iotests work, generally.  When run with -qco=
w2
> >     -file, it
> >     should only test qcow2 on file, not raw on file, not raw on nbd.
> >     Perhaps
> >     this way this test could even support other formats than qcow2 and
> >     raw.
> >
> >
> > For this type of tests, running the same code with raw, qcow2 (and
> > other formats)
> > and using file or nbd is the best way to test this feature - one test
> > verifies all the
> > use cases.
>
> Yes, I see, but that=E2=80=99s a general thing in the iotests.  The desig=
n is
> such that tests don=E2=80=99t cycle through their test matrix themselves,=
 but
> that they always only test a single combination of format+protocol on
> each run, and the user is responsible for cycling through the desired
> test matrix.
>
> I=E2=80=99m not saying that was definitely the best design decision, but =
the
> problem now that if a test cycles through its test matrix by itself, it
> must also ensure that it is run only once when the user cycles through
> the same test matrix.  For example, a reasonable run of the iotests
> consists of `./check -raw`, `./check -qcow2`, and `./check -nbd`.  This
> test here would then run in all three configurations, but do the same
> thing every time (specifically, test all of those configurations every
> time).
>
> So there=E2=80=99s a conflict.  Either the test follows the existing desi=
gn and
> only tests a single configuration, as iotests are expected to do, or we
> have the question of how to deal with the fact that users will run the
> test suite in multiple configurations, but one run of this test would
> already cover them all.
>
> I=E2=80=99m not sternly against cycling through the possible combinations=
 right
> here in the test, but I want to lay out the problems with that approach.
>
> > I can change this to use the current format (raw, qcow2, ...),
> > protocol (file, nbd, ...)
> > and cache value (none, writeback), but I'm not sure how this can work
> > with the
> > out files. The output from nbd is different from file. Maybe we need
> > different out
> > files for file and nbd (qemu-img-checksum.file.out,
> > qemu-img-checksum.nbd.out)?
>
> We already have that for the format (e.g. 178.out.{qcow2,raw}).  If you
> decide to do that, it shouldn=E2=80=99t be too difficult to implement
> (testrunner.py=E2=80=99s `TestRunner.find_reference()`).  Alternatively, =
it=E2=80=99s
> also possible to basically ignore the reference output and verify the
> expected output right in the test code.
>

In this kind of test checking the output is the right thing since this is
the actual result of the command.

I'll change to use the current format and cache mode - this should work fin=
e
with file protocol, and will simplify the test a lot.

I'm not sure if this will work for NBD but it is less important and can be
added
later. There is nothing related to NBD in the code.

Nir

--000000000000365ca505ee85957a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Nov 7, 2022 at 1:41 PM Hanna Reit=
z &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 30.10.22 18:38, Nir Soffer wrote:<br>
&gt; On Wed, Oct 26, 2022 at 4:31 PM Hanna Reitz &lt;<a href=3D"mailto:hrei=
tz@redhat.com" target=3D"_blank">hreitz@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 01.09.22 16:32, Nir Soffer wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Add simple tests creating an image with all ki=
nds of extents,<br>
&gt;=C2=A0 =C2=A0 =C2=A0different<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; formats, different backing chain, different pr=
otocol, and different<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; image options. Since all images have the same =
guest visible<br>
&gt;=C2=A0 =C2=A0 =C2=A0content they<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; must have the same checksum.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; To help debugging in case of failures, the out=
put includes a<br>
&gt;=C2=A0 =C2=A0 =C2=A0json map of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; every test image.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Nir Soffer &lt;<a href=3D"mailt=
o:nsoffer@redhat.com" target=3D"_blank">nsoffer@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0tests/qemu-iotests/tests/qemu-img-=
checksum=C2=A0 =C2=A0 | 149<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0.../qemu-iotests/tests/qemu-img-ch=
ecksum.out=C2=A0 |=C2=A0 74 +++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A02 files changed, 223 insertions(+)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100755 tests/qemu-iote=
sts/tests/qemu-img-checksum<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100644 tests/qemu-iote=
sts/tests/qemu-img-checksum.out<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/tests/qemu-iotests/tests/qemu-img=
-checksum<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/tests/qemu-iotests/tests/qemu-img-checksum<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; new file mode 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000000..3a85ba33f2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/tests/qemu-iotests/tests/qemu-img-checks=
um<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -0,0 +1,149 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#!/usr/bin/env python3<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# group: rw auto quick<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# Test cases for qemu-img checksum.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# Copyright (C) 2022 Red Hat, Inc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# This program is free software; you can redi=
stribute it and/or<br>
&gt;=C2=A0 =C2=A0 =C2=A0modify<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# it under the terms of the GNU General Publi=
c License as<br>
&gt;=C2=A0 =C2=A0 =C2=A0published by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# the Free Software Foundation; either versio=
n 2 of the License, or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# (at your option) any later version.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# This program is distributed in the hope tha=
t it will be useful,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# but WITHOUT ANY WARRANTY; without even the =
implied warranty of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# MERCHANTABILITY or FITNESS FOR A PARTICULAR=
 PURPOSE.=C2=A0 See the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# GNU General Public License for more details=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# You should have received a copy of the GNU =
General Public License<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +# along with this program.=C2=A0 If not, see<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +import re<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +import iotests<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +from iotests import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 filter_testfiles,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 qemu_img,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 qemu_img_log,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 qemu_io,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 qemu_nbd_popen,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +def checksum_available():<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 out =3D qemu_img(&quot;--help&q=
uot;).stdout<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 return re.search(r&quot;\bcheck=
sum .+ filename\b&quot;, out) is not None<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +if not checksum_available():<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 iotests.notrun(&quot;checksum c=
ommand not available&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +iotests.script_initialize(<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 supported_fmts=3D[&quot;raw&quo=
t;, &quot;qcow2&quot;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 supported_cache_modes=3D[&quot;=
none&quot;, &quot;writeback&quot;],<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0It doesn=E2=80=99t work with writeback, though, bec=
ause it uses -T none below.<br>
&gt;<br>
&gt;<br>
&gt; Good point<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Which by the way is a heavy cost, because I usually=
 run tests in<br>
&gt;=C2=A0 =C2=A0 =C2=A0tmpfs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0where this won=E2=80=99t work.=C2=A0 Is there any w=
ay of not doing the -T none<br>
&gt;=C2=A0 =C2=A0 =C2=A0below?<br>
&gt;<br>
&gt;<br>
&gt; Testing using tempfs is problematic since you cannot test -T none.In <=
br>
&gt; oVirt<br>
&gt; we alway use /var/tmp which usually uses something that supports <br>
&gt; direct I/O.<br>
&gt;<br>
&gt; Do we have a way to specify cache mode in the tests, so we can use -T =
none<br>
&gt; only when the option is set?<br>
<br>
`./check` has a `-c` option (e.g. `./check -c none`), which lands in <br>
`iotests.cachemode`.=C2=A0 That isn=E2=80=99t automatically passed to qemu-=
img calls, <br>
but you can do it manually (i.e. `qemu_img_log(&quot;checksum&quot;, &quot;=
-T&quot;, <br>
iotests.cachemode, disk_top)` instead of `&quot;-T&quot;, &quot;none&quot;`=
).<br></blockquote><div><br></div><div>Ok, I will change to use the current=
 cache setting.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 supported_protocols=3D[&quot;fi=
le&quot;, &quot;nbd&quot;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 required_fmts=3D[&quot;raw&quot=
;, &quot;qcow2&quot;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +print()<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +print(&quot;=3D=3D=3D Test images =3D=3D=3D&q=
uot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +print()<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +disk_raw =3D iotests.file_path(&#39;raw&#39;)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +qemu_img(&quot;create&quot;, &quot;-f&quot;, =
&quot;raw&quot;, disk_raw, &quot;10m&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +qemu_io(&quot;-f&quot;, &quot;raw&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &=
quot;write -P 0x1 0 2m&quot;,=C2=A0 =C2=A0 =C2=A0 # data<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &=
quot;write -P 0x0 2m 2m&quot;,=C2=A0 =C2=A0 =C2=A0# data with zeroes<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &=
quot;write -z 4m 2m&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# zero allocate=
d<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &=
quot;write -z -u 6m 2m&quot;,=C2=A0 =C2=A0 =C2=A0 # zero hole<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # unallocated<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_raw)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +print(filter_testfiles(disk_raw))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +qemu_img_log(&quot;map&quot;, &quot;--output&=
quot;, &quot;json&quot;, disk_raw)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +disk_qcow2 =3D iotests.file_path(&#39;qcow2&#=
39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +qemu_img(&quot;create&quot;, &quot;-f&quot;, =
&quot;qcow2&quot;, disk_qcow2, &quot;10m&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +qemu_io(&quot;-f&quot;, &quot;qcow2&quot;,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &=
quot;write -P 0x1 0 2m&quot;,=C2=A0 =C2=A0 =C2=A0 # data<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &=
quot;write -P 0x0 2m 2m&quot;,=C2=A0 =C2=A0 =C2=A0# data with zeroes<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &=
quot;write -z 4m 2m&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# zero allocate=
d<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &=
quot;write -z -u 6m 2m&quot;,=C2=A0 =C2=A0 =C2=A0 # zero hole<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # unallocated<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_qcow2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +print(filter_testfiles(disk_qcow2))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +qemu_img_log(&quot;map&quot;, &quot;--output&=
quot;, &quot;json&quot;, disk_qcow2)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This isn=E2=80=99t how iotests work, generally.=C2=
=A0 When run with -qcow2<br>
&gt;=C2=A0 =C2=A0 =C2=A0-file, it<br>
&gt;=C2=A0 =C2=A0 =C2=A0should only test qcow2 on file, not raw on file, no=
t raw on nbd.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Perhaps<br>
&gt;=C2=A0 =C2=A0 =C2=A0this way this test could even support other formats=
 than qcow2 and<br>
&gt;=C2=A0 =C2=A0 =C2=A0raw.<br>
&gt;<br>
&gt;<br>
&gt; For this type of tests, running the same code with raw, qcow2 (and <br=
>
&gt; other formats)<br>
&gt; and using file or nbd is the best way to test this feature - one test =
<br>
&gt; verifies all the<br>
&gt; use cases.<br>
<br>
Yes, I see, but that=E2=80=99s a general thing in the iotests.=C2=A0 The de=
sign is <br>
such that tests don=E2=80=99t cycle through their test matrix themselves, b=
ut <br>
that they always only test a single combination of format+protocol on <br>
each run, and the user is responsible for cycling through the desired <br>
test matrix.<br>
<br>
I=E2=80=99m not saying that was definitely the best design decision, but th=
e <br>
problem now that if a test cycles through its test matrix by itself, it <br=
>
must also ensure that it is run only once when the user cycles through <br>
the same test matrix.=C2=A0 For example, a reasonable run of the iotests <b=
r>
consists of `./check -raw`, `./check -qcow2`, and `./check -nbd`.=C2=A0 Thi=
s <br>
test here would then run in all three configurations, but do the same <br>
thing every time (specifically, test all of those configurations every <br>
time).<br>
<br>
So there=E2=80=99s a conflict.=C2=A0 Either the test follows the existing d=
esign and <br>
only tests a single configuration, as iotests are expected to do, or we <br=
>
have the question of how to deal with the fact that users will run the <br>
test suite in multiple configurations, but one run of this test would <br>
already cover them all.<br>
<br>
I=E2=80=99m not sternly against cycling through the possible combinations r=
ight <br>
here in the test, but I want to lay out the problems with that approach.<br=
>
<br>
&gt; I can change this to use the current format (raw, qcow2, ...), <br>
&gt; protocol (file, nbd, ...)<br>
&gt; and cache value (none, writeback), but I&#39;m not sure how this can w=
ork <br>
&gt; with the<br>
&gt; out files. The output from nbd is different from file. Maybe we need <=
br>
&gt; different out<br>
&gt; files for file and nbd (qemu-img-checksum.file.out, <br>
&gt; qemu-img-checksum.nbd.out)?<br>
<br>
We already have that for the format (e.g. 178.out.{qcow2,raw}).=C2=A0 If yo=
u <br>
decide to do that, it shouldn=E2=80=99t be too difficult to implement <br>
(testrunner.py=E2=80=99s `TestRunner.find_reference()`).=C2=A0 Alternativel=
y, it=E2=80=99s <br>
also possible to basically ignore the reference output and verify the <br>
expected output right in the test code.<br>
</blockquote><div><br></div><div>In this=C2=A0kind of test checking the out=
put is the right thing since this is</div><div>the actual result of the com=
mand.</div><div><br></div><div>I&#39;ll change to use the current format an=
d cache mode - this should work fine</div><div>with file protocol, and will=
 simplify the test a lot.</div><div><br></div><div>I&#39;m not sure if this=
 will work for NBD but it is less important and can be added</div><div>late=
r. There is nothing related to NBD in the code.<br></div><div><br></div><di=
v>Nir</div></div></div>

--000000000000365ca505ee85957a--


