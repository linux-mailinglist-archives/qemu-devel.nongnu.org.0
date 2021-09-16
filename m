Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A938540DBA1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:46:13 +0200 (CEST)
Received: from localhost ([::1]:60990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQriO-0007zo-8i
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQrfG-0005gQ-OZ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:42:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQrfB-0000FN-Q7
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631799771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPiUXY4+c3KhodmENffwvEWaABK/LRXjEo6QDhno+2Y=;
 b=Bn3OmPZOA/pUnp4m1ab+bh+MInlQr/KOLcl/Dkg9MuKo469FOCy212cuKso/pb5j7IQPTY
 egBDpJcpu5ANJgDnKhXB7+umJrM+7E55HxKkaD/t4sbdKxYX5HsD+ypFqyD1/YZ1nViMos
 Z/yZhOFK9e6r9Cxms361h+weinGOIc4=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-3un-lICHPvWPfhv9-m9hHA-1; Thu, 16 Sep 2021 09:42:42 -0400
X-MC-Unique: 3un-lICHPvWPfhv9-m9hHA-1
Received: by mail-ot1-f72.google.com with SMTP id
 r10-20020a056830448a00b0051b9c05a2a8so26720899otv.2
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 06:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HPiUXY4+c3KhodmENffwvEWaABK/LRXjEo6QDhno+2Y=;
 b=bIx27CuwcEVYryzBFqk12fyC9LjCKt9aWQFL0rVuuWzWHi1AgCgDQDK8H8sfXvnKeY
 HaN0yMUks/+hyc4QVNxlzgcMVHXHpmth8N4pGcJQU3ZowKELeh+SeJsGJe+LczhAP0fE
 g1bLt5yKKh4ouzQ5p3Mv230Ja1MZjCsFPZ/8cAr/wjbbqZWW4pGf8sj+wEe73H8Rx77i
 MmZwYG3Z6hSM0jYwplqNoQAooPY4DYdPus/cPUYiQ/0cUvOqCk3jnxuTma8XcgdAue1I
 6rZZi4ahKOkl9CMnVPAG+Pt8fegSOBSk7wshvK6qtBmkndQLQTQ3zQFEy0t2WvCI1d8Z
 xMZQ==
X-Gm-Message-State: AOAM532IsKRg5RpHrCrb8sNS6WSOpsTnzX6+WWL1Nv5cUi/j5LWyqk9N
 McBa/UtC+wa3teOxbwpfBEF43466OT8M5XUC7eO0oCJD/+trzN91zmiEAJ4CkwYoq0Rn9lwyYhO
 1xVKUbAmdlAXY3VQ+dT3e9NCO3qzlp14=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr1297713ots.252.1631799762141; 
 Thu, 16 Sep 2021 06:42:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOjz/15BhHeHfcoz8jUi2HvwBb7cRJXgMyHDWCQMap6MRj7cTdgJPrhdij69VZh1E8/TB/54ApJ4C+YNVIVqQ=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr1297694ots.252.1631799761884; 
 Thu, 16 Sep 2021 06:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210915154031.321592-1-jsnow@redhat.com>
 <20210915154031.321592-2-jsnow@redhat.com>
 <YUM/n/QWlxLvp3lw@redhat.com>
In-Reply-To: <YUM/n/QWlxLvp3lw@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Sep 2021 09:42:30 -0400
Message-ID: <CAFn=p-bNB9s8LPg_Y6SjD-KPdn7boauphTb8iqBin_evxRRJqw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] python: Update for pylint 2.10
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000026e97a05cc1cfdf2"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000026e97a05cc1cfdf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 8:59 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Sep 15, 2021 at 11:40:31AM -0400, John Snow wrote:
> > A few new annoyances. Of note is the new warning for an unspecified
> > encoding when opening a text file, which actually does indicate a
> > potentially real problem; see
> > https://www.python.org/dev/peps/pep-0597/#motivation
> >
> > Use LC_CTYPE to determine an encoding to use for interpreting QEMU's
> > terminal output. Note that Python states: "language code and encoding
> > may be None if their values cannot be determined" -- use a platform
> > default as a backup.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/machine/machine.py | 9 ++++++++-
> >  python/setup.cfg               | 1 +
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> > index a7081b1845..51b6e79a13 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -19,6 +19,7 @@
> >
> >  import errno
> >  from itertools import chain
> > +import locale
> >  import logging
> >  import os
> >  import shutil
> > @@ -290,8 +291,14 @@ def get_pid(self) -> Optional[int]:
> >          return self._subp.pid
> >
> >      def _load_io_log(self) -> None:
> > +        # Assume that the output encoding of QEMU's terminal output
> > +        # is defined by our locale. If indeterminate, use a platform
> default.
> > +        _, encoding =3D locale.getlocale()
> > +        if encoding is None:
> > +            encoding =3D locale.getpreferredencoding(do_setlocale=3DFa=
lse)
>
> Do we really need this getpreferredencoding ?  IIUC, this is a sign
> that the application is buggy by not calling
>
>   locale.setlocale(locale.LC_ALL, '')
>
> during its main() method, which I think we can just delegate to the
> code in question to fix. Missing setlocale will affect everything
> they run, so doing workarounds in only 1 place is not worth it IMHO
>
>
I genuinely don't know! (And, I try to keep the Python code free from
assuming Linux as much as I can help it.)

Python's getlocale documentation states: "language code and encoding may be
None if their values cannot be determined."
https://docs.python.org/3/library/locale.html#locale.getlocale

But it is quiet as to the circumstances under which this may happen.
Browsing the cpython source code, (3.9ish):

```
def getlocale(category=3DLC_CTYPE):
    localename =3D _setlocale(category)
    if category =3D=3D LC_ALL and ';' in localename:
        raise TypeError('category LC_ALL is not supported')
    return _parse_localename(localename)
```
_setlocale is ultimately a call to (I think) _localemodule.c's
PyLocale_setlocale(PyObject *self, PyObject *args) C function.
It calls `result =3D setlocale(category, locale)` where the category is goi=
ng
to be LC_CTYPE, so this should be equivalent to locale(3) (LC_CTYPE, NULL).

locale(3) says that "The return value is NULL if the request cannot be
honored."

Python parses that string according to _parse_localename, which in turn
calls normalize(localename).
Normalization looks quite involved, but has a fallback of returning the
string verbatim. If the normalized locale string is "C", we return the
tuple (None, None)!

So I figured there was a non-zero chance that we'd see a value of `None`
here.

Source code is in cpython/Lib/locale.py and cpython/Modules/_localemodule.c
if you want to nose around yourself.

I also have no idea how this will all shake out on Windows, so I decided to
add the fallback here just in case. (Does the Python package work on
Windows? I don't know, but I avoid assuming it won't EVER run there...
Certainly, I have an interest in having the QMP packages I am building work
on all platforms.)

Thoughts?

>          if self._qemu_log_path is not None:
> > -            with open(self._qemu_log_path, "r") as iolog:
> > +            with open(self._qemu_log_path, "r",
> > +                      encoding=3Dencoding) as iolog:
> >                  self._iolog =3D iolog.read()
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--00000000000026e97a05cc1cfdf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 16, 2021 at 8:59 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_bl=
ank">berrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Sep 15, 2021 at 11:40:31AM -0400, John Snow=
 wrote:<br>
&gt; A few new annoyances. Of note is the new warning for an unspecified<br=
>
&gt; encoding when opening a text file, which actually does indicate a<br>
&gt; potentially real problem; see<br>
&gt; <a href=3D"https://www.python.org/dev/peps/pep-0597/#motivation" rel=
=3D"noreferrer" target=3D"_blank">https://www.python.org/dev/peps/pep-0597/=
#motivation</a><br>
&gt; <br>
&gt; Use LC_CTYPE to determine an encoding to use for interpreting QEMU&#39=
;s<br>
&gt; terminal output. Note that Python states: &quot;language code and enco=
ding<br>
&gt; may be None if their values cannot be determined&quot; -- use a platfo=
rm<br>
&gt; default as a backup.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/qemu/machine/machine.py | 9 ++++++++-<br>
&gt;=C2=A0 python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 +<br>
&gt;=C2=A0 2 files changed, 9 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mach=
ine.py<br>
&gt; index a7081b1845..51b6e79a13 100644<br>
&gt; --- a/python/qemu/machine/machine.py<br>
&gt; +++ b/python/qemu/machine/machine.py<br>
&gt; @@ -19,6 +19,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 import errno<br>
&gt;=C2=A0 from itertools import chain<br>
&gt; +import locale<br>
&gt;=C2=A0 import logging<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 import shutil<br>
&gt; @@ -290,8 +291,14 @@ def get_pid(self) -&gt; Optional[int]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._subp.pid<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def _load_io_log(self) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Assume that the output encoding of QEMU=
&#39;s terminal output<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # is defined by our locale. If indetermin=
ate, use a platform default.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _, encoding =3D locale.getlocale()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if encoding is None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encoding =3D locale.getpref=
erredencoding(do_setlocale=3DFalse)<br>
<br>
Do we really need this getpreferredencoding ?=C2=A0 IIUC, this is a sign<br=
>
that the application is buggy by not calling<br>
<br>
=C2=A0 locale.setlocale(locale.LC_ALL, &#39;&#39;)<br>
<br>
during its main() method, which I think we can just delegate to the<br>
code in question to fix. Missing setlocale will affect everything<br>
they run, so doing workarounds in only 1 place is not worth it IMHO<br>
<br></blockquote><div><br></div><div>I genuinely don&#39;t know! (And, I tr=
y to keep the Python code free from assuming Linux as much as I can help it=
.)<br></div><div><br></div><div>Python&#39;s getlocale documentation states=
: &quot;language code and encoding may be None if their values cannot be de=
termined.&quot;</div><div><a href=3D"https://docs.python.org/3/library/loca=
le.html#locale.getlocale">https://docs.python.org/3/library/locale.html#loc=
ale.getlocale</a></div><div><br></div><div>But it is quiet as to the circum=
stances under which this may happen. Browsing the cpython source code, (3.9=
ish):</div><div><br></div><div>```<br></div><div>def getlocale(category=3DL=
C_CTYPE):<br>=C2=A0 =C2=A0 localename =3D _setlocale(category)<br>=C2=A0 =
=C2=A0 if category =3D=3D LC_ALL and &#39;;&#39; in localename:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 raise TypeError(&#39;category LC_ALL is not supported&=
#39;)<br>=C2=A0 =C2=A0 return _parse_localename(localename)</div><div>```</=
div><div>_setlocale is ultimately a call to (I think) _localemodule.c&#39;s=
 PyLocale_setlocale(PyObject *self, PyObject *args) C function.</div><div>I=
t calls `result =3D setlocale(category, locale)` where the category is goin=
g to be LC_CTYPE, so this should be equivalent to locale(3) (LC_CTYPE, NULL=
).</div><div><br></div><div>locale(3) says that &quot;The return value is N=
ULL if the request cannot be honored.&quot;</div><div><br></div><div>Python=
 parses that string according to _parse_localename, which in turn calls nor=
malize(localename).</div><div>Normalization looks quite involved, but has a=
 fallback of returning the string verbatim. If the normalized locale string=
 is &quot;C&quot;, we return the tuple (None, None)!</div><div><br></div><d=
iv>So I figured there was a non-zero chance that we&#39;d see a value of `N=
one` here.</div><div><br></div><div>Source code is in cpython/Lib/locale.py=
 and cpython/Modules/_localemodule.c if you want to nose around yourself.</=
div><div><br></div><div>I also have no idea how this will all shake out on =
Windows, so I decided to add the fallback here just in case. (Does the Pyth=
on package work on Windows? I don&#39;t know, but I avoid assuming it won&#=
39;t EVER run there... Certainly, I have an interest in having the QMP pack=
ages I am building work on all platforms.)<br></div><div>=C2=A0</div><div>T=
houghts?</div></div><div class=3D"gmail_quote"><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._qemu_log_path is not None:<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(self._qemu_log_pa=
th, &quot;r&quot;) as iolog:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(self._qemu_log_pa=
th, &quot;r&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 encoding=3Dencoding) as iolog:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._io=
log =3D iolog.read()<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--00000000000026e97a05cc1cfdf2--


