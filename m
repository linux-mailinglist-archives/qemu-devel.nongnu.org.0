Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA09642C48E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 17:12:19 +0200 (CEST)
Received: from localhost ([::1]:42424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mafvX-0007CY-2N
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 11:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mafua-0006Pm-6t
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:11:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mafuY-0003Mn-7W
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634137877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DDS/cm/BoEygq7CeXUer+T0mPmrtKrLVpnBIVE/wx0U=;
 b=cFyI/FBX4wQC1l6PEQkFnM+cYNqLaems4y04t/lLg7wLVuohaC28TpRB4KuI0W9VMjTtKw
 ehFtya3lum0zUt0cnUresPRxtp1c/2/mxM2dMwVvxj7h98zL8t3MoXN90F2miyeMqrwunu
 DRNqwu40PhuL9oCRpQsT07Gn/skautM=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-XvMNB9fSMi6zFhWXR0Wt4A-1; Wed, 13 Oct 2021 11:11:16 -0400
X-MC-Unique: XvMNB9fSMi6zFhWXR0Wt4A-1
Received: by mail-vk1-f200.google.com with SMTP id
 h3-20020a0561220b6300b00293bbf7804bso1202668vkf.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 08:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDS/cm/BoEygq7CeXUer+T0mPmrtKrLVpnBIVE/wx0U=;
 b=7XyfVHq+1NORxdL5S61Fk4oVFSo6QLaNXy1OoIA50NFl2YiPNILHDoId361wu2Y2j+
 1CKeu5yzgWmZpoKLbt5QXSioE1Gn8fQtFWZAxTazhAwyNv2xI7lIZ0bZSlJD5LF3MJKl
 J2P6zdcBdrAafWlrax8vlZlf/T8ibftyW7/Z4TOHEw3inLfbWE4KaeI+9ZLhUdQVMBhP
 kgwq+/k9R4BqIuThFC3dp6jDkTSeggqXBe0bIHBgcchrK1FTkIGxTpqZ5Jd8XtFQ+ypD
 LnC7w+9Z3roxF75q826yAk6YMU6a7LfD0J9UdvREvnMVcvx9W+lPfsDiN7p4djy55rM3
 Lmjg==
X-Gm-Message-State: AOAM530GBbgeJmR+Xrp+rmpkmsxL+NGXxjD67r2InQI2fzi/uCNnJoyD
 4a7Syp0DcnITw7+l1gD7Vkls/d6FndKyK0i3IiK1jh40rXmR/ICHPtRGgi5l8gUjWIx7YA7mgid
 WzCtbCCpsspXb93SdjRL9Hri9HGA61hU=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr38495901vsp.59.1634137875616; 
 Wed, 13 Oct 2021 08:11:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6gGtENblbwJuYrYX52T0navDxtutRPqZI5vFuHyEU95NB9Ncrvs3RPHvX/lKs0ykG/2558CBndwjI4g4/y6c=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr38495875vsp.59.1634137875384; 
 Wed, 13 Oct 2021 08:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-11-jsnow@redhat.com>
 <19f3d6b1-f3bc-55e8-0fe0-79daf081a778@redhat.com>
In-Reply-To: <19f3d6b1-f3bc-55e8-0fe0-79daf081a778@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 13 Oct 2021 11:11:04 -0400
Message-ID: <CAFn=p-Z25JLuC9cpf2OPgEmgPwk2g0GAcBRm-ZHFL2-ZuC0O=g@mail.gmail.com>
Subject: Re: [PATCH 10/13] iotests/linters: Add entry point for linting via
 Python CI
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000093a01f05ce3d5f1b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000093a01f05ce3d5f1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 8:11 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 04.10.21 23:05, John Snow wrote:
> > We need at least a tiny little shim here to join test file discovery
> > with test invocation. This logic could conceivably be hosted somewhere
> > in python/, but I felt it was strictly the least-rude thing to keep the
> > test logic here in iotests/, even if this small function isn't itself a=
n
> > iotest.
> >
> > Note that we don't actually even need the executable bit here, we'll be
> > relying on the ability to run this module as a script using Python CLI
> > arguments. No chance it gets misunderstood as an actual iotest that way=
.
> >
> > (It's named, not in tests/, doesn't have the execute bit, and doesn't
> > have an execution shebang.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > ---
> >
> > (1) I think that the test file discovery logic and skip list belong
> together,
> >      and that those items belong in iotests/. I think they also belong =
in
> >      whichever directory pylintrc and mypy.ini are in, also in iotests/=
.
>
> Agreed.
>
> > (2) Moving this logic into python/tests/ is challenging because I'd hav=
e
> >      to import iotests code from elsewhere in the source tree, which ju=
st
> >      inverts an existing problem I have been trying to rid us of --
> >      needing to muck around with PYTHONPATH or sys.path hacking in pyth=
on
> >      scripts. I'm keen to avoid this.
>
> OK.
>
> > (3) If we moved all python tests into tests/ and gave them *.py
> >      extensions, we wouldn't even need the test discovery functions
> >      anymore, and all of linters.py could be removed entirely, includin=
g
> >      this execution shim. We could rely on mypy/pylint's own file
> >      discovery mechanisms at that point. More work than I'm up for with
> >      just this series, but I could be coaxed into doing it if there was
> >      some promise of not rejecting all that busywork ;)
>
> I believe the only real value this would gain is that the tests would
> have nicer names and we would have to delint them.  If we find those
> goals to justify the effort, then we can put in the effort; and we can
> do that slowly, test by test.  I don=E2=80=99t think we must do it now in=
 one
> big lump just to get rid of the file discovery functions.
>
>
Yeah, I agree -- just do it over time and as-needed. I'm sure I will be
bothered by something-or-other sooner-or-later and I'll wind up doing it
anyway. Just maybe not this week!


> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/linters.py | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/tests/qemu-iotests/linters.py
> b/tests/qemu-iotests/linters.py
> > index f6a2dc139fd..191df173064 100644
> > --- a/tests/qemu-iotests/linters.py
> > +++ b/tests/qemu-iotests/linters.py
> > @@ -16,6 +16,7 @@
> >   import os
> >   import re
> >   import subprocess
> > +import sys
> >   from typing import List, Mapping, Optional
> >
> >
> > @@ -81,3 +82,20 @@ def run_linter(
> >
> >       return p.returncode
> >
> > +
> > +def main() -> int:
> > +    """
> > +    Used by the Python CI system as an entry point to run these linter=
s.
> > +    """
> > +    files =3D get_test_files()
> > +
> > +    if sys.argv[1] =3D=3D '--pylint':
> > +        return run_linter('pylint', files)
> > +    elif sys.argv[1] =3D=3D '--mypy':
> > +        return run_linter('mypy', files)
>
> So I can run it as `python linters.py --pylint foo bar` and it won=E2=80=
=99t
> complain? :)
>
> I don=E2=80=99t feel like it=E2=80=99s important, but, well, it isn=E2=80=
=99t right either.
>
>
Alright. I hacked it together to be "minimal" in terms of SLOC, but I can
make it ... less minimal.

--00000000000093a01f05ce3d5f1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 13, 2021 at 8:11 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 04.10.2=
1 23:05, John Snow wrote:<br>
&gt; We need at least a tiny little shim here to join test file discovery<b=
r>
&gt; with test invocation. This logic could conceivably be hosted somewhere=
<br>
&gt; in python/, but I felt it was strictly the least-rude thing to keep th=
e<br>
&gt; test logic here in iotests/, even if this small function isn&#39;t its=
elf an<br>
&gt; iotest.<br>
&gt;<br>
&gt; Note that we don&#39;t actually even need the executable bit here, we&=
#39;ll be<br>
&gt; relying on the ability to run this module as a script using Python CLI=
<br>
&gt; arguments. No chance it gets misunderstood as an actual iotest that wa=
y.<br>
&gt;<br>
&gt; (It&#39;s named, not in tests/, doesn&#39;t have the execute bit, and =
doesn&#39;t<br>
&gt; have an execution shebang.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; (1) I think that the test file discovery logic and skip list belong to=
gether,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 and that those items belong in iotests/. I think t=
hey also belong in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 whichever directory pylintrc and mypy.ini are in, =
also in iotests/.<br>
<br>
Agreed.<br>
<br>
&gt; (2) Moving this logic into python/tests/ is challenging because I&#39;=
d have<br>
&gt;=C2=A0 =C2=A0 =C2=A0 to import iotests code from elsewhere in the sourc=
e tree, which just<br>
&gt;=C2=A0 =C2=A0 =C2=A0 inverts an existing problem I have been trying to =
rid us of --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 needing to muck around with PYTHONPATH or sys.path=
 hacking in python<br>
&gt;=C2=A0 =C2=A0 =C2=A0 scripts. I&#39;m keen to avoid this.<br>
<br>
OK.<br>
<br>
&gt; (3) If we moved all python tests into tests/ and gave them *.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0 extensions, we wouldn&#39;t even need the test dis=
covery functions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 anymore, and all of linters.py could be removed en=
tirely, including<br>
&gt;=C2=A0 =C2=A0 =C2=A0 this execution shim. We could rely on mypy/pylint&=
#39;s own file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 discovery mechanisms at that point. More work than=
 I&#39;m up for with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 just this series, but I could be coaxed into doing=
 it if there was<br>
&gt;=C2=A0 =C2=A0 =C2=A0 some promise of not rejecting all that busywork ;)=
<br>
<br>
I believe the only real value this would gain is that the tests would <br>
have nicer names and we would have to delint them.=C2=A0 If we find those <=
br>
goals to justify the effort, then we can put in the effort; and we can <br>
do that slowly, test by test.=C2=A0 I don=E2=80=99t think we must do it now=
 in one <br>
big lump just to get rid of the file discovery functions.<br>
<br></blockquote><div><br></div><div>Yeah, I agree -- just do it over time =
and as-needed. I&#39;m sure I will be bothered by something-or-other sooner=
-or-later and I&#39;ll wind up doing it anyway. Just maybe not this week! <=
br></div></div><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/linters.py | 18 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 18 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linter=
s.py<br>
&gt; index f6a2dc139fd..191df173064 100644<br>
&gt; --- a/tests/qemu-iotests/linters.py<br>
&gt; +++ b/tests/qemu-iotests/linters.py<br>
&gt; @@ -16,6 +16,7 @@<br>
&gt;=C2=A0 =C2=A0import os<br>
&gt;=C2=A0 =C2=A0import re<br>
&gt;=C2=A0 =C2=A0import subprocess<br>
&gt; +import sys<br>
&gt;=C2=A0 =C2=A0from typing import List, Mapping, Optional<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -81,3 +82,20 @@ def run_linter(<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return p.returncode<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +<br>
&gt; +def main() -&gt; int:<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 Used by the Python CI system as an entry point to run t=
hese linters.<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 files =3D get_test_files()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if sys.argv[1] =3D=3D &#39;--pylint&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return run_linter(&#39;pylint&#39;, files=
)<br>
&gt; +=C2=A0 =C2=A0 elif sys.argv[1] =3D=3D &#39;--mypy&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return run_linter(&#39;mypy&#39;, files)<=
br>
<br>
So I can run it as `python linters.py --pylint foo bar` and it won=E2=80=99=
t <br>
complain? :)<br>
<br>
I don=E2=80=99t feel like it=E2=80=99s important, but, well, it isn=E2=80=
=99t right either.<br>
<br></blockquote><div><br></div><div>Alright. I hacked it together to be &q=
uot;minimal&quot; in terms of SLOC, but I can make it ... less minimal.</di=
v><div> <br></div></div></div>

--00000000000093a01f05ce3d5f1b--


