Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4AC40DED0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:58:48 +0200 (CEST)
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtmh-0000uL-TT
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQtVM-0003kS-UE
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQtVJ-0002Vc-Iv
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631806849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M66nfg5/9svfKvLf/f7AIeZQFYSYlVUiKuZsZqx8DRw=;
 b=TyPXPhrTmFetDY76B4rrdQyKyYZKgNU6jNXoW3ux2NnAqGh9pFWtputKXFmgeEyu+aREKe
 eUsKnDlOMPvgl3FEzeKGduFS2y0BryW6/LWZHU3vwYgyu3JLekVe+XrrPFD4dSo4nCXoqe
 3+6Y8g9J1F9FW2G704ilrqFuYsg4VzM=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-d6XTWjIpO_6cbqipJWUcsA-1; Thu, 16 Sep 2021 11:40:45 -0400
X-MC-Unique: d6XTWjIpO_6cbqipJWUcsA-1
Received: by mail-oo1-f70.google.com with SMTP id
 m4-20020a4ae3c4000000b00291a653baceso30866706oov.21
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M66nfg5/9svfKvLf/f7AIeZQFYSYlVUiKuZsZqx8DRw=;
 b=J2C9PsVul3zTjPUWDtee9bJNI9EQdGDZL4tOvhgNb6E5VDrjyYbIpTGVYWgaE6+iVr
 ekIsOl3U1juTgx3jZ3Te8zzSzjr7MvEgcvQdd5VctEA+OKV+wBitrCs6hc0A/l6hv+kk
 BvrZCnaK266Lnbd0GL8zdlrhrZxl/Hojfk3OPrJrsSHjZQuxy7aQvYDkVuBW4IAecKAQ
 7y+NhmRdTZnxBgjzbPUeBSj3z6NW0CWeA0EMonKln7cy4kp9Y8m+I9cyxOjXW2mPL+Ag
 mE6ymXIdcRSZWAIi98MY3fd/kFV8EXcjPOuZJHKKqU3dPxvaFC6qehA2ldXm6WRZlxwF
 gILw==
X-Gm-Message-State: AOAM533OCCq4vL9vVpyswkkdDMEU/znx4xQlkmpwxqinLiXz8DzDa7lj
 7yQGi/IwS1olReJYFMemHw9w/wsT61usqJtHm70gLgvsX1DzDqNX4yXtaHCSXhqHkoOt1JJ9kAD
 946p7KeP7dMPN/A7/xa0tUeeBdpl0k7o=
X-Received: by 2002:aca:3887:: with SMTP id f129mr2216213oia.112.1631806844920; 
 Thu, 16 Sep 2021 08:40:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyepQbycICIe52Bf3m1Aq9838GHWIB5Q4rF8vWsRD/M0eVDXPtKH6zeFXsjMj24/f8/F3N3JUZfk8ghICZS7DQ=
X-Received: by 2002:aca:3887:: with SMTP id f129mr2216192oia.112.1631806844681; 
 Thu, 16 Sep 2021 08:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210915154031.321592-1-jsnow@redhat.com>
 <20210915154031.321592-2-jsnow@redhat.com>
 <YUM/n/QWlxLvp3lw@redhat.com>
 <CAFn=p-bNB9s8LPg_Y6SjD-KPdn7boauphTb8iqBin_evxRRJqw@mail.gmail.com>
 <YUNlGvkSDtynuH7N@redhat.com>
In-Reply-To: <YUNlGvkSDtynuH7N@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Sep 2021 11:40:34 -0400
Message-ID: <CAFn=p-YX7jFqU0g_DAwD3zxC3LxDVQjPRpjdpRcQ6Fy7GeZJKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] python: Update for pylint 2.10
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000051d3e505cc1ea36b"
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

--00000000000051d3e505cc1ea36b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 11:39 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> On Thu, Sep 16, 2021 at 09:42:30AM -0400, John Snow wrote:
> > On Thu, Sep 16, 2021 at 8:59 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> > > On Wed, Sep 15, 2021 at 11:40:31AM -0400, John Snow wrote:
> > > > A few new annoyances. Of note is the new warning for an unspecified
> > > > encoding when opening a text file, which actually does indicate a
> > > > potentially real problem; see
> > > > https://www.python.org/dev/peps/pep-0597/#motivation
> > > >
> > > > Use LC_CTYPE to determine an encoding to use for interpreting QEMU'=
s
> > > > terminal output. Note that Python states: "language code and encodi=
ng
> > > > may be None if their values cannot be determined" -- use a platform
> > > > default as a backup.
> > > >
> > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > ---
> > > >  python/qemu/machine/machine.py | 9 ++++++++-
> > > >  python/setup.cfg               | 1 +
> > > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/python/qemu/machine/machine.py
> > > b/python/qemu/machine/machine.py
> > > > index a7081b1845..51b6e79a13 100644
> > > > --- a/python/qemu/machine/machine.py
> > > > +++ b/python/qemu/machine/machine.py
> > > > @@ -19,6 +19,7 @@
> > > >
> > > >  import errno
> > > >  from itertools import chain
> > > > +import locale
> > > >  import logging
> > > >  import os
> > > >  import shutil
> > > > @@ -290,8 +291,14 @@ def get_pid(self) -> Optional[int]:
> > > >          return self._subp.pid
> > > >
> > > >      def _load_io_log(self) -> None:
> > > > +        # Assume that the output encoding of QEMU's terminal outpu=
t
> > > > +        # is defined by our locale. If indeterminate, use a platfo=
rm
> > > default.
> > > > +        _, encoding =3D locale.getlocale()
> > > > +        if encoding is None:
> > > > +            encoding =3D
> locale.getpreferredencoding(do_setlocale=3DFalse)
> > >
> > > Do we really need this getpreferredencoding ?  IIUC, this is a sign
> > > that the application is buggy by not calling
> > >
> > >   locale.setlocale(locale.LC_ALL, '')
> > >
> > > during its main() method, which I think we can just delegate to the
> > > code in question to fix. Missing setlocale will affect everything
> > > they run, so doing workarounds in only 1 place is not worth it IMHO
> > >
> > >
> > I genuinely don't know! (And, I try to keep the Python code free from
> > assuming Linux as much as I can help it.)
> >
> > Python's getlocale documentation states: "language code and encoding ma=
y
> be
> > None if their values cannot be determined."
> > https://docs.python.org/3/library/locale.html#locale.getlocale
> >
> > But it is quiet as to the circumstances under which this may happen.
> > Browsing the cpython source code, (3.9ish):
> >
> > ```
> > def getlocale(category=3DLC_CTYPE):
> >     localename =3D _setlocale(category)
> >     if category =3D=3D LC_ALL and ';' in localename:
> >         raise TypeError('category LC_ALL is not supported')
> >     return _parse_localename(localename)
> > ```
> > _setlocale is ultimately a call to (I think) _localemodule.c's
> > PyLocale_setlocale(PyObject *self, PyObject *args) C function.
> > It calls `result =3D setlocale(category, locale)` where the category is
> going
> > to be LC_CTYPE, so this should be equivalent to locale(3) (LC_CTYPE,
> NULL).
> >
> > locale(3) says that "The return value is NULL if the request cannot be
> > honored."
> >
> > Python parses that string according to _parse_localename, which in turn
> > calls normalize(localename).
> > Normalization looks quite involved, but has a fallback of returning the
> > string verbatim. If the normalized locale string is "C", we return the
> > tuple (None, None)!
> >
> > So I figured there was a non-zero chance that we'd see a value of `None=
`
> > here.
> >
> > Source code is in cpython/Lib/locale.py and
> cpython/Modules/_localemodule.c
> > if you want to nose around yourself.
> >
> > I also have no idea how this will all shake out on Windows, so I decide=
d
> to
> > add the fallback here just in case. (Does the Python package work on
> > Windows? I don't know, but I avoid assuming it won't EVER run there...
> > Certainly, I have an interest in having the QMP packages I am building
> work
> > on all platforms.)
> >
> > Thoughts?
>
> Well this machine.py is using UNIX domain sockets and FD passing,
> so Windows is out of the question.
>
> I'd be inclined to just keep it simple unless someone reports a
> real bug with it.
>
>
What about the case where getlocale finds "C" and can't/won't return an
encoding? Is that not a real circumstance?

--js

--00000000000051d3e505cc1ea36b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 16, 2021 at 11:39 AM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Thu, Sep 16, 2021 at 09:42:30AM -0400, John Snow wrote:<br>
&gt; On Thu, Sep 16, 2021 at 8:59 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Sep 15, 2021 at 11:40:31AM -0400, John Snow wrote:<br>
&gt; &gt; &gt; A few new annoyances. Of note is the new warning for an unsp=
ecified<br>
&gt; &gt; &gt; encoding when opening a text file, which actually does indic=
ate a<br>
&gt; &gt; &gt; potentially real problem; see<br>
&gt; &gt; &gt; <a href=3D"https://www.python.org/dev/peps/pep-0597/#motivat=
ion" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/dev/peps/p=
ep-0597/#motivation</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Use LC_CTYPE to determine an encoding to use for interpretin=
g QEMU&#39;s<br>
&gt; &gt; &gt; terminal output. Note that Python states: &quot;language cod=
e and encoding<br>
&gt; &gt; &gt; may be None if their values cannot be determined&quot; -- us=
e a platform<br>
&gt; &gt; &gt; default as a backup.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.=
com" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 python/qemu/machine/machine.py | 9 ++++++++-<br>
&gt; &gt; &gt;=C2=A0 python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 +<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 9 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/python/qemu/machine/machine.py<br>
&gt; &gt; b/python/qemu/machine/machine.py<br>
&gt; &gt; &gt; index a7081b1845..51b6e79a13 100644<br>
&gt; &gt; &gt; --- a/python/qemu/machine/machine.py<br>
&gt; &gt; &gt; +++ b/python/qemu/machine/machine.py<br>
&gt; &gt; &gt; @@ -19,6 +19,7 @@<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 import errno<br>
&gt; &gt; &gt;=C2=A0 from itertools import chain<br>
&gt; &gt; &gt; +import locale<br>
&gt; &gt; &gt;=C2=A0 import logging<br>
&gt; &gt; &gt;=C2=A0 import os<br>
&gt; &gt; &gt;=C2=A0 import shutil<br>
&gt; &gt; &gt; @@ -290,8 +291,14 @@ def get_pid(self) -&gt; Optional[int]:<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self._subp.pid<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 def _load_io_log(self) -&gt; None:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Assume that the output encodi=
ng of QEMU&#39;s terminal output<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # is defined by our locale. If =
indeterminate, use a platform<br>
&gt; &gt; default.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _, encoding =3D locale.getlocal=
e()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if encoding is None:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encoding =3D loca=
le.getpreferredencoding(do_setlocale=3DFalse)<br>
&gt; &gt;<br>
&gt; &gt; Do we really need this getpreferredencoding ?=C2=A0 IIUC, this is=
 a sign<br>
&gt; &gt; that the application is buggy by not calling<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0locale.setlocale(locale.LC_ALL, &#39;&#39;)<br>
&gt; &gt;<br>
&gt; &gt; during its main() method, which I think we can just delegate to t=
he<br>
&gt; &gt; code in question to fix. Missing setlocale will affect everything=
<br>
&gt; &gt; they run, so doing workarounds in only 1 place is not worth it IM=
HO<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; I genuinely don&#39;t know! (And, I try to keep the Python code free f=
rom<br>
&gt; assuming Linux as much as I can help it.)<br>
&gt; <br>
&gt; Python&#39;s getlocale documentation states: &quot;language code and e=
ncoding may be<br>
&gt; None if their values cannot be determined.&quot;<br>
&gt; <a href=3D"https://docs.python.org/3/library/locale.html#locale.getloc=
ale" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/3/library=
/locale.html#locale.getlocale</a><br>
&gt; <br>
&gt; But it is quiet as to the circumstances under which this may happen.<b=
r>
&gt; Browsing the cpython source code, (3.9ish):<br>
&gt; <br>
&gt; ```<br>
&gt; def getlocale(category=3DLC_CTYPE):<br>
&gt;=C2=A0 =C2=A0 =C2=A0localename =3D _setlocale(category)<br>
&gt;=C2=A0 =C2=A0 =C2=A0if category =3D=3D LC_ALL and &#39;;&#39; in locale=
name:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise TypeError(&#39;category LC_ALL =
is not supported&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0return _parse_localename(localename)<br>
&gt; ```<br>
&gt; _setlocale is ultimately a call to (I think) _localemodule.c&#39;s<br>
&gt; PyLocale_setlocale(PyObject *self, PyObject *args) C function.<br>
&gt; It calls `result =3D setlocale(category, locale)` where the category i=
s going<br>
&gt; to be LC_CTYPE, so this should be equivalent to locale(3) (LC_CTYPE, N=
ULL).<br>
&gt; <br>
&gt; locale(3) says that &quot;The return value is NULL if the request cann=
ot be<br>
&gt; honored.&quot;<br>
&gt; <br>
&gt; Python parses that string according to _parse_localename, which in tur=
n<br>
&gt; calls normalize(localename).<br>
&gt; Normalization looks quite involved, but has a fallback of returning th=
e<br>
&gt; string verbatim. If the normalized locale string is &quot;C&quot;, we =
return the<br>
&gt; tuple (None, None)!<br>
&gt; <br>
&gt; So I figured there was a non-zero chance that we&#39;d see a value of =
`None`<br>
&gt; here.<br>
&gt; <br>
&gt; Source code is in cpython/Lib/locale.py and cpython/Modules/_localemod=
ule.c<br>
&gt; if you want to nose around yourself.<br>
&gt; <br>
&gt; I also have no idea how this will all shake out on Windows, so I decid=
ed to<br>
&gt; add the fallback here just in case. (Does the Python package work on<b=
r>
&gt; Windows? I don&#39;t know, but I avoid assuming it won&#39;t EVER run =
there...<br>
&gt; Certainly, I have an interest in having the QMP packages I am building=
 work<br>
&gt; on all platforms.)<br>
&gt; <br>
&gt; Thoughts?<br>
<br>
Well this machine.py is using UNIX domain sockets and FD passing,<br>
so Windows is out of the question.<br>
<br>
I&#39;d be inclined to just keep it simple unless someone reports a<br>
real bug with it.<br>
<br></blockquote><div><br></div><div>What about the case where getlocale fi=
nds &quot;C&quot; and can&#39;t/won&#39;t return an encoding? Is that not a=
 real circumstance?</div><div><br></div><div>--js<br></div></div></div>

--00000000000051d3e505cc1ea36b--


