Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA641625B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:50:04 +0200 (CEST)
Received: from localhost ([::1]:49438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQz5-0008F6-Mh
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTQwA-000662-QB
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:47:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTQw3-0001g3-4J
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632412014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1qv9jx7uT50mVIqTpi/NoZvbWTwg6IMYxNY9OE2yc0c=;
 b=CzGyu4YvO0gr7b4OgMC58VSrTsY0xkNV5wtJNDAHAhLlLqUBP0bjizpuVzzQRTEZR09qaU
 n64NuQFMc4Y3txMNatL6NTNhFGA6kKIgh0BGU0RALEiCu//PJ766VXC+KPol01uDb0Lm1E
 R7d6qQxytpgD9eUaCEW6qjgzPS2tvI8=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-bWfHs8ymN6KTjiopVOxGPQ-1; Thu, 23 Sep 2021 11:46:51 -0400
X-MC-Unique: bWfHs8ymN6KTjiopVOxGPQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 t6-20020a056808158600b00269838692deso3765851oiw.17
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 08:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1qv9jx7uT50mVIqTpi/NoZvbWTwg6IMYxNY9OE2yc0c=;
 b=PFFcsn1kJZFNEORpxyNw3rgBK1ur2TONxqTDaD1t9DI/mAV2068xgkUWlb/yMC6XiZ
 gGQlR1kbVEZOKW4Wd+I4BpScwnHfQ8pD4EZmKaetOc0VfOAp9YDFnORXpWMX6Si0s2eK
 mB34jA1s3Mo/vzhCP9fuz9NDjXXTPJZbS+dxglPJt6XU4a/QL1JTqOe8vIS9H5iHBZYM
 /XBWRmYKrnupJJomUMBTDS37IJTtK0aggPcF/2ayHUuTuNJYMTVn42LeZ1fRIg4HD+UZ
 gPsfR4yiR3MWsMfm+ZQb9FEDOKZpFgaotJW73SwNAW0t8UkE0FB0HLGm5kbR3A+7vhJH
 zvNA==
X-Gm-Message-State: AOAM533hYauLCutV1cIAGuGpvSQdzMRt/1f+XdE6rsH80IaULaEKN5uR
 WuEfyrNqjJQ/JFSI2cDBJoRsOqXALg+Sup/B7dbuaI7oJHgZLVjLQ9kLYrvIy8grakJUMKrV0/5
 JqxCr7q+AF+mOQ8qpTTMjerOHn6OqOIE=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr5121406ots.252.1632412010792; 
 Thu, 23 Sep 2021 08:46:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRkQVCtkQn8p7vZ6q4pnSNJXP04XwIQ+TyPR114hbo8p5gh+4TA+bOpMDKzKFh+aLJ6WkxQ1O/IuRTbJvlpwE=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr5121387ots.252.1632412010592; 
 Thu, 23 Sep 2021 08:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-2-jsnow@redhat.com>
 <20e02fed-5c74-022a-78bb-2122cf12374b@virtuozzo.com>
In-Reply-To: <20e02fed-5c74-022a-78bb-2122cf12374b@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 23 Sep 2021 11:46:39 -0400
Message-ID: <CAFn=p-bpmRBEM4YwQh=nAjDeCTXnNirQgULpcVmmE0k2+g1dYw@mail.gmail.com>
Subject: Re: [PATCH 1/6] iotests: add 'qemu' package location to PYTHONPATH in
 testenv
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000004ceac05ccab8a8f"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000004ceac05ccab8a8f
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 11:20 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 23.09.2021 03:16, John Snow wrote:
> > We can drop the sys.path hacking in various places by doing
> > this. Additionally, by doing it in one place right up top, we can print
> > interesting warnings in case the environment does not look correct.
> >
> > If we ever decide to change how the environment is crafted, all of the
> > "help me find my python packages" goop is all in one place, right in one
> > function.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> Hurrah!!
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> > ---
> >   tests/qemu-iotests/235                    |  2 --
> >   tests/qemu-iotests/297                    |  6 ------
> >   tests/qemu-iotests/300                    |  7 +++----
> >   tests/qemu-iotests/iotests.py             |  2 --
> >   tests/qemu-iotests/testenv.py             | 14 +++++++++-----
> >   tests/qemu-iotests/tests/mirror-top-perms |  7 +++----
> >   6 files changed, 15 insertions(+), 23 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
> > index 8aed45f9a76..4de920c3801 100755
> > --- a/tests/qemu-iotests/235
> > +++ b/tests/qemu-iotests/235
> > @@ -24,8 +24,6 @@ import os
> >   import iotests
> >   from iotests import qemu_img_create, qemu_io, file_path, log
> >
> > -sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..',
> 'python'))
> > -
> >   from qemu.machine import QEMUMachine
> >
> >   iotests.script_initialize(supported_fmts=['qcow2'])
> > diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> > index b04cba53667..467b712280e 100755
> > --- a/tests/qemu-iotests/297
> > +++ b/tests/qemu-iotests/297
> > @@ -68,12 +68,6 @@ def run_linters():
> >       # Todo notes are fine, but fixme's or xxx's should probably just be
> >       # fixed (in tests, at least)
> >       env = os.environ.copy()
> > -    qemu_module_path = os.path.join(os.path.dirname(__file__),
> > -                                    '..', '..', 'python')
> > -    try:
> > -        env['PYTHONPATH'] += os.pathsep + qemu_module_path
> > -    except KeyError:
> > -        env['PYTHONPATH'] = qemu_module_path
> >       subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX',
> *files),
> >                      env=env, check=False)
> >
> > diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
> > index fe94de84edd..10f9f2a8da6 100755
> > --- a/tests/qemu-iotests/300
> > +++ b/tests/qemu-iotests/300
> > @@ -24,12 +24,11 @@ import random
> >   import re
> >   from typing import Dict, List, Optional
> >
> > -import iotests
> > -
> > -# Import qemu after iotests.py has amended sys.path
> > -# pylint: disable=wrong-import-order
> >   from qemu.machine import machine
> >
> > +import iotests
> > +
> > +
> >   BlockBitmapMapping = List[Dict[str, object]]
> >
> >   mig_sock = os.path.join(iotests.sock_dir, 'mig_sock')
> > diff --git a/tests/qemu-iotests/iotests.py
> b/tests/qemu-iotests/iotests.py
> > index ce06cf56304..b06ad76e0c5 100644
> > --- a/tests/qemu-iotests/iotests.py
> > +++ b/tests/qemu-iotests/iotests.py
> > @@ -36,8 +36,6 @@
> >
> >   from contextlib import contextmanager
> >
> > -# pylint: disable=import-error, wrong-import-position
> > -sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..',
> 'python'))
> >   from qemu.machine import qtest
> >   from qemu.qmp import QMPMessage
> >
> > diff --git a/tests/qemu-iotests/testenv.py
> b/tests/qemu-iotests/testenv.py
> > index 70da0d60c80..88104dace90 100644
> > --- a/tests/qemu-iotests/testenv.py
> > +++ b/tests/qemu-iotests/testenv.py
> > @@ -108,12 +108,16 @@ def init_directories(self) -> None:
> >                SAMPLE_IMG_DIR
> >                OUTPUT_DIR
> >           """
> > +
> > +        # Path where qemu goodies live in this source tree.
> > +        qemu_srctree_path = Path(__file__, '../../../python').resolve()
> > +
> >           self.pythonpath = os.getenv('PYTHONPATH')
> > -        if self.pythonpath:
> > -            self.pythonpath = self.source_iotests + os.pathsep + \
> > -                self.pythonpath
> > -        else:
> > -            self.pythonpath = self.source_iotests
> > +        self.pythonpath = os.pathsep.join(filter(None, (
> > +            self.source_iotests,
> > +            str(qemu_srctree_path),
> > +            self.pythonpath,
> > +        )))
>
> That was simple:)
>
>
Only because a very dedicated engineer from Virtuozzo spent so much time
writing a new iotest launcher ;)


> Hmm, after you this you have
>
> self.pythonpath = ...
> self.pythonpath = something other
>
>
> If have to resend, you may just use os.getenv('PYTHONPATH') inside
> filter(), it seems to be even nicer.
>
>
Ah, yeah. I'll just fold that in. Thanks!


> >
> >           self.test_dir = os.getenv('TEST_DIR',
> >                                     os.path.join(os.getcwd(), 'scratch'))
> > diff --git a/tests/qemu-iotests/tests/mirror-top-perms
> b/tests/qemu-iotests/tests/mirror-top-perms
> > index 2fc8dd66e0a..73138a0ef91 100755
> > --- a/tests/qemu-iotests/tests/mirror-top-perms
> > +++ b/tests/qemu-iotests/tests/mirror-top-perms
> > @@ -20,13 +20,12 @@
> >   #
> >
> >   import os
> > +
> > +import qemu
> > +
> >   import iotests
> >   from iotests import qemu_img
> >
> > -# Import qemu after iotests.py has amended sys.path
> > -# pylint: disable=wrong-import-order
> > -import qemu
> > -
> >
> >   image_size = 1 * 1024 * 1024
> >   source = os.path.join(iotests.test_dir, 'source.img')
> >
>
>
> --
> Best regards,
> Vladimir
>
>

--00000000000004ceac05ccab8a8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 11:20 AM Vlad=
imir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vs=
ementsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">23.09.2021 03:16, John Snow wrote:<br>
&gt; We can drop the sys.path hacking in various places by doing<br>
&gt; this. Additionally, by doing it in one place right up top, we can prin=
t<br>
&gt; interesting warnings in case the environment does not look correct.<br=
>
&gt; <br>
&gt; If we ever decide to change how the environment is crafted, all of the=
<br>
&gt; &quot;help me find my python packages&quot; goop is all in one place, =
right in one<br>
&gt; function.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Hurrah!!<br>
<br>
Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@=
virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/235=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ------<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/300=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++----<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/iotests.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 --<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/testenv.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 14 +++++++++-----<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/tests/mirror-top-perms |=C2=A0 7 +++---=
-<br>
&gt;=C2=A0 =C2=A06 files changed, 15 insertions(+), 23 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235<br>
&gt; index 8aed45f9a76..4de920c3801 100755<br>
&gt; --- a/tests/qemu-iotests/235<br>
&gt; +++ b/tests/qemu-iotests/235<br>
&gt; @@ -24,8 +24,6 @@ import os<br>
&gt;=C2=A0 =C2=A0import iotests<br>
&gt;=C2=A0 =C2=A0from iotests import qemu_img_create, qemu_io, file_path, l=
og<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -sys.path.append(os.path.join(os.path.dirname(__file__), &#39;..&#39;,=
 &#39;..&#39;, &#39;python&#39;))<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0from qemu.machine import QEMUMachine<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0iotests.script_initialize(supported_fmts=3D[&#39;qcow2&#39=
;])<br>
&gt; diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297<br>
&gt; index b04cba53667..467b712280e 100755<br>
&gt; --- a/tests/qemu-iotests/297<br>
&gt; +++ b/tests/qemu-iotests/297<br>
&gt; @@ -68,12 +68,6 @@ def run_linters():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Todo notes are fine, but fixme&#39;s or xx=
x&#39;s should probably just be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# fixed (in tests, at least)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D os.environ.copy()<br>
&gt; -=C2=A0 =C2=A0 qemu_module_path =3D os.path.join(os.path.dirname(__fil=
e__),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;..&#39;, &#39=
;..&#39;, &#39;python&#39;)<br>
&gt; -=C2=A0 =C2=A0 try:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env[&#39;PYTHONPATH&#39;] +=3D os.pathsep=
 + qemu_module_path<br>
&gt; -=C2=A0 =C2=A0 except KeyError:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env[&#39;PYTHONPATH&#39;] =3D qemu_module=
_path<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.run((&#39;pylint-3&#39;, &#39;--s=
core=3Dn&#39;, &#39;--notes=3DFIXME,XXX&#39;, *files),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 env=3Denv, check=3DFalse)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300<br>
&gt; index fe94de84edd..10f9f2a8da6 100755<br>
&gt; --- a/tests/qemu-iotests/300<br>
&gt; +++ b/tests/qemu-iotests/300<br>
&gt; @@ -24,12 +24,11 @@ import random<br>
&gt;=C2=A0 =C2=A0import re<br>
&gt;=C2=A0 =C2=A0from typing import Dict, List, Optional<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -import iotests<br>
&gt; -<br>
&gt; -# Import qemu after iotests.py has amended sys.path<br>
&gt; -# pylint: disable=3Dwrong-import-order<br>
&gt;=C2=A0 =C2=A0from qemu.machine import machine<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +import iotests<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0BlockBitmapMapping =3D List[Dict[str, object]]<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0mig_sock =3D os.path.join(iotests.sock_dir, &#39;mig_sock&=
#39;)<br>
&gt; diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotest=
s.py<br>
&gt; index ce06cf56304..b06ad76e0c5 100644<br>
&gt; --- a/tests/qemu-iotests/iotests.py<br>
&gt; +++ b/tests/qemu-iotests/iotests.py<br>
&gt; @@ -36,8 +36,6 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0from contextlib import contextmanager<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -# pylint: disable=3Dimport-error, wrong-import-position<br>
&gt; -sys.path.append(os.path.join(os.path.dirname(__file__), &#39;..&#39;,=
 &#39;..&#39;, &#39;python&#39;))<br>
&gt;=C2=A0 =C2=A0from qemu.machine import qtest<br>
&gt;=C2=A0 =C2=A0from qemu.qmp import QMPMessage<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testen=
v.py<br>
&gt; index 70da0d60c80..88104dace90 100644<br>
&gt; --- a/tests/qemu-iotests/testenv.py<br>
&gt; +++ b/tests/qemu-iotests/testenv.py<br>
&gt; @@ -108,12 +108,16 @@ def init_directories(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAMPLE_IMG_DIR<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OUTPUT_DIR<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Path where qemu goodies live in this so=
urce tree.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_srctree_path =3D Path(__file__, &#39=
;../../../python&#39;).resolve()<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pythonpath =3D os.getenv(=
&#39;PYTHONPATH&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.pythonpath:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pythonpath =3D self.so=
urce_iotests + os.pathsep + \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pythonpa=
th<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pythonpath =3D self.so=
urce_iotests<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pythonpath =3D os.pathsep.join(filte=
r(None, (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.source_iotests,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str(qemu_srctree_path),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pythonpath,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )))<br>
<br>
That was simple:)<br>
<br></blockquote><div><br></div><div>Only because a very dedicated engineer=
 from Virtuozzo spent so much time writing a new iotest launcher ;)<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Hmm, after you this you have<br>
<br>
self.pythonpath =3D ...<br>
self.pythonpath =3D something other<br>
<br>
<br>
If have to resend, you may just use os.getenv(&#39;PYTHONPATH&#39;) inside =
filter(), it seems to be even nicer.<br>
<br></blockquote><div><br></div><div>Ah, yeah. I&#39;ll just fold that in. =
Thanks!<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.test_dir =3D os.getenv(&#=
39;TEST_DIR&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.path.join(=
os.getcwd(), &#39;scratch&#39;))<br>
&gt; diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-io=
tests/tests/mirror-top-perms<br>
&gt; index 2fc8dd66e0a..73138a0ef91 100755<br>
&gt; --- a/tests/qemu-iotests/tests/mirror-top-perms<br>
&gt; +++ b/tests/qemu-iotests/tests/mirror-top-perms<br>
&gt; @@ -20,13 +20,12 @@<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0import os<br>
&gt; +<br>
&gt; +import qemu<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0import iotests<br>
&gt;=C2=A0 =C2=A0from iotests import qemu_img<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -# Import qemu after iotests.py has amended sys.path<br>
&gt; -# pylint: disable=3Dwrong-import-order<br>
&gt; -import qemu<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0image_size =3D 1 * 1024 * 1024<br>
&gt;=C2=A0 =C2=A0source =3D os.path.join(iotests.test_dir, &#39;source.img&=
#39;)<br>
&gt; <br>
<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br>
<br>
</blockquote></div></div>

--00000000000004ceac05ccab8a8f--


