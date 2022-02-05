Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420784AA501
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 01:22:35 +0100 (CET)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG8qX-0008Su-Pp
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 19:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG8nH-0007j5-3k
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 19:19:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG8nD-0007Rz-Ak
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 19:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644020345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fGE4XH8zFcIPw4QGc2K3mYT/yjmrPu8MYjZ1xYIiNZg=;
 b=VAM8Tqp2LfCSy+KTtW5Z7gTNXMopRT6KLneIxDf9hxl/n0GJFxKJ+hLyVhbXO6P5rpAX++
 IkK9p6ZL7Dh4i6+1MneedftNPXzxjS2pGt4yQ+SNgqdgjzsAiF822ZK135cWBfO/YTcrSI
 5Xlhqn9cN6pPS+uNmNDeH0GTnwc2cfw=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-yx7hvTD3NAGz08bSmJ8ocQ-1; Fri, 04 Feb 2022 19:19:02 -0500
X-MC-Unique: yx7hvTD3NAGz08bSmJ8ocQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 x9-20020ab05789000000b002fa60bdf012so4422072uaa.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 16:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fGE4XH8zFcIPw4QGc2K3mYT/yjmrPu8MYjZ1xYIiNZg=;
 b=VAlxWOegxzvRhH4wdINDeCR93R9GPysyKGdAMLKPqpsA0iIpDlDIVOBpmOO5fsdgbG
 psFXA9KT5cQDSaxCPkYH5xiCEHvwHXHksai64Z5CGLprOpNdOAzSkb5L3MuS5F1IZGJz
 xYY388WJ0zgL5mKrBOetS4vDwaXHPg9UnBvQVwKCB5JzAcsIc8xJTEeRHymskrKab6qN
 53sVdPnHBCo1JUI94inY2TVHLBD10owICyrY4/dgLGnobZ3k4WK3XNu0LDEXG0o+JgnR
 VpKBTO4Xn2vz2zjTbyeH4BbA8q0JlVtfKFs61q3uVl2h2gkWp/jL1jKTfV3WuKXgUGer
 Gzww==
X-Gm-Message-State: AOAM532oH+g0guZSL2YKXJkkn+BuD8YnRI7B+7uvKCoMuuV1jkkP6BzY
 kAeDbV7JzisTgDQK99ymyLsEe35BeJltyVHQY9B+nAX8l21aWzTDG5yVsO+1B3usispzwkdoQDX
 zPwBRf8ingFJ7P+9pNDk/Ao+to9maFRw=
X-Received: by 2002:a05:6102:348:: with SMTP id
 e8mr1944919vsa.11.1644020342164; 
 Fri, 04 Feb 2022 16:19:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyykwncvP0X+wyDaAblv5eJLSOoHIjSoq75HfD2WWaa7wvBwDzJJBWp7C4YyYQ1YjLm9e/8VtGx1t/y6xiTDwE=
X-Received: by 2002:a05:6102:348:: with SMTP id
 e8mr1944908vsa.11.1644020341693; 
 Fri, 04 Feb 2022 16:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20220118100140.252920-1-berrange@redhat.com>
 <20220118100140.252920-2-berrange@redhat.com>
 <CAFn=p-Ytc=9mmWqPKyrXRY2EFOKsyZ3akw8z=F6g1af6jgq0ug@mail.gmail.com>
 <YfQU/N5QYGoxF2IF@redhat.com>
In-Reply-To: <YfQU/N5QYGoxF2IF@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 4 Feb 2022 19:18:52 -0500
Message-ID: <CAFn=p-aMSdB360HuoYTi4ghCRb+4XGtupEA786e1ojaD75NgNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] python: introduce qmp-shell-wrap convenience tool
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007875c605d73a5016"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007875c605d73a5016
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022, 11:08 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Tue, Jan 18, 2022 at 08:07:32PM -0500, John Snow wrote:
> > On Tue, Jan 18, 2022 at 5:01 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> wrote:
> > >
> > > With the current 'qmp-shell' tool developers must first spawn QEMU wi=
th
> > > a suitable -qmp arg and then spawn qmp-shell in a separate terminal
> > > pointing to the right socket.
> > >
> > > With 'qmp-shell-wrap' developers can ignore QMP sockets entirely and
> > > just pass the QEMU command and arguments they want. The program will
> > > listen on a UNIX socket and tell QEMU to connect QMP to that.
> > >
> > > For example, this:
> > >
> > >  # qmp-shell-wrap -- qemu-system-x86_64 -display none
> > >
> > > Is roughly equivalent of running:
> > >
> > >  # qemu-system-x86_64 -display none -qmp qmp-shell-1234 &
> > >  # qmp-shell qmp-shell-1234
> > >
> > > Except that 'qmp-shell-wrap' switches the socket peers around so that
> > > it is the UNIX socket server and QEMU is the socket client. This make=
s
> > > QEMU reliably go away when qmp-shell-wrap exits, closing the server
> > > socket.
> > >
> > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >
> > Thanks, I think this is pretty useful.
> >
> > Can you look at setup.cfg and see about adding a qmp-shell-wrap entry
> > point there? I had intended to wean people off of using /scripts for
> > things that rely on the QMP packages, because I'm gonna fork them out
> > and then these little forwards won't work without installing something
> > anyway.
>
> This looks simple enough but when I test I can't actuall get any of
> the existing programs to work this way.
>
> I did:
>
>  $ python setup.py  install --user
>  ...snip...
>  Processing qemu-0.6.1.0a1-py3.10.egg
>  Copying qemu-0.6.1.0a1-py3.10.egg to
> /home/berrange/.local/lib/python3.10/site-packages
>  Adding qemu 0.6.1.0a1 to easy-install.pth file
>  Installing aqmp-tui script to /home/berrange/.local/bin
>  Installing qemu-ga-client script to /home/berrange/.local/bin
>  Installing qmp-shell script to /home/berrange/.local/bin
>  Installing qmp-shell-wrap script to /home/berrange/.local/bin
>  Installing qom script to /home/berrange/.local/bin
>  Installing qom-fuse script to /home/berrange/.local/bin
>  Installing qom-get script to /home/berrange/.local/bin
>  Installing qom-list script to /home/berrange/.local/bin
>  Installing qom-set script to /home/berrange/.local/bin
>  Installing qom-tree script to /home/berrange/.local/bin
>
>  Installed
> /home/berrange/.local/lib/python3.10/site-packages/qemu-0.6.1.0a1-py3.10.=
egg
>  Processing dependencies for qemu=3D=3D0.6.1.0a1
>  Finished processing dependencies for qemu=3D=3D0.6.1.0a1
>
>
> $ export PYTHONPATH=3D/home/berrange/.local/lib/python3.10/site-packages
> $ qmp-shell
> $ qmp-shell
> Traceback (most recent call last):
>   File "/home/berrange/.local/bin/qmp-shell", line 33, in <module>
>     sys.exit(load_entry_point('qemu=3D=3D0.6.1.0a1', 'console_scripts',
> 'qmp-shell')())
>   File "/home/berrange/.local/bin/qmp-shell", line 25, in
> importlib_load_entry_point
>     return next(matches).load()
>   File "/usr/lib64/python3.10/importlib/metadata/__init__.py", line 162,
> in load
>     module =3D import_module(match.group('module'))
>   File "/usr/lib64/python3.10/importlib/__init__.py", line 126, in
> import_module
>     return _bootstrap._gcd_import(name[level:], package, level)
>   File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
>   File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
>   File "<frozen importlib._bootstrap>", line 992, in
> _find_and_load_unlocked
>   File "<frozen importlib._bootstrap>", line 241, in
> _call_with_frames_removed
>   File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
>   File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
>   File "<frozen importlib._bootstrap>", line 992, in
> _find_and_load_unlocked
>   File "<frozen importlib._bootstrap>", line 241, in
> _call_with_frames_removed
>   File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
>   File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
>   File "<frozen importlib._bootstrap>", line 1004, in
> _find_and_load_unlocked
> ModuleNotFoundError: No module named 'qemu'
>
> I can't see why this is failing to find 'qemu' when it exists fine:
>
> $ python
> >>> import qemu.aqmp.qmp_shell
> >>> qemu.aqmp.qmp_shell.main()
> usage: [-h] [-H] [-N] [-v] [-p] [-l LOGFILE] qmp_server
> : error: the following arguments are required: qmp_server
>
>
> Why is 'load_entry_point' unhappy ?
>

I'm sorry, I'm not sure.

It may be because you installed via setup.py instead of pip ... I always
use pip. "Eventually" setup.py is going away, but there's some reasons I
haven't dropped it for QEMU yet. (Our long support tail for RHEL.)

(I don't know if that's the reason, I'll test. If it is the reason, I'll
see if there's some way to guard against this in the future.)

I see you've posted a new version, I'll test with that version and if you
don't mind, if there's any small problem I'll just modify it for the PR
myself, and you can review the changes and I'll get you on your way
quicker.

Thanks (and sorry for so many long emails lately),
--js

--0000000000007875c605d73a5016
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Jan 28, 2022, 11:08 AM Daniel P. Berrang=C3=A9=
 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Tue, Jan 18, 2022 at 08:07:3=
2PM -0500, John Snow wrote:<br>
&gt; On Tue, Jan 18, 2022 at 5:01 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@=
redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; With the current &#39;qmp-shell&#39; tool developers must first s=
pawn QEMU with<br>
&gt; &gt; a suitable -qmp arg and then spawn qmp-shell in a separate termin=
al<br>
&gt; &gt; pointing to the right socket.<br>
&gt; &gt;<br>
&gt; &gt; With &#39;qmp-shell-wrap&#39; developers can ignore QMP sockets e=
ntirely and<br>
&gt; &gt; just pass the QEMU command and arguments they want. The program w=
ill<br>
&gt; &gt; listen on a UNIX socket and tell QEMU to connect QMP to that.<br>
&gt; &gt;<br>
&gt; &gt; For example, this:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # qmp-shell-wrap -- qemu-system-x86_64 -display none<br>
&gt; &gt;<br>
&gt; &gt; Is roughly equivalent of running:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # qemu-system-x86_64 -display none -qmp qmp-shell-1234 &amp=
;<br>
&gt; &gt;=C2=A0 # qmp-shell qmp-shell-1234<br>
&gt; &gt;<br>
&gt; &gt; Except that &#39;qmp-shell-wrap&#39; switches the socket peers ar=
ound so that<br>
&gt; &gt; it is the UNIX socket server and QEMU is the socket client. This =
makes<br>
&gt; &gt; QEMU reliably go away when qmp-shell-wrap exits, closing the serv=
er<br>
&gt; &gt; socket.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berr=
ange@redhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@redhat.com</=
a>&gt;<br>
&gt; <br>
&gt; Thanks, I think this is pretty useful.<br>
&gt; <br>
&gt; Can you look at setup.cfg and see about adding a qmp-shell-wrap entry<=
br>
&gt; point there? I had intended to wean people off of using /scripts for<b=
r>
&gt; things that rely on the QMP packages, because I&#39;m gonna fork them =
out<br>
&gt; and then these little forwards won&#39;t work without installing somet=
hing<br>
&gt; anyway.<br>
<br>
This looks simple enough but when I test I can&#39;t actuall get any of<br>
the existing programs to work this way.<br>
<br>
I did:<br>
<br>
=C2=A0$ python setup.py=C2=A0 install --user<br>
=C2=A0...snip...<br>
=C2=A0Processing qemu-0.6.1.0a1-py3.10.egg<br>
=C2=A0Copying qemu-0.6.1.0a1-py3.10.egg to /home/berrange/.local/lib/python=
3.10/site-packages<br>
=C2=A0Adding qemu 0.6.1.0a1 to easy-install.pth file<br>
=C2=A0Installing aqmp-tui script to /home/berrange/.local/bin<br>
=C2=A0Installing qemu-ga-client script to /home/berrange/.local/bin<br>
=C2=A0Installing qmp-shell script to /home/berrange/.local/bin<br>
=C2=A0Installing qmp-shell-wrap script to /home/berrange/.local/bin<br>
=C2=A0Installing qom script to /home/berrange/.local/bin<br>
=C2=A0Installing qom-fuse script to /home/berrange/.local/bin<br>
=C2=A0Installing qom-get script to /home/berrange/.local/bin<br>
=C2=A0Installing qom-list script to /home/berrange/.local/bin<br>
=C2=A0Installing qom-set script to /home/berrange/.local/bin<br>
=C2=A0Installing qom-tree script to /home/berrange/.local/bin<br>
<br>
=C2=A0Installed /home/berrange/.local/lib/python3.10/site-packages/qemu-0.6=
.1.0a1-py3.10.egg<br>
=C2=A0Processing dependencies for qemu=3D=3D0.6.1.0a1<br>
=C2=A0Finished processing dependencies for qemu=3D=3D0.6.1.0a1<br>
<br>
<br>
$ export PYTHONPATH=3D/home/berrange/.local/lib/python3.10/site-packages<br=
>
$ qmp-shell<br>
$ qmp-shell<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/berrange/.local/bin/qmp-shell&quot;, line 33, in &l=
t;module&gt;<br>
=C2=A0 =C2=A0 sys.exit(load_entry_point(&#39;qemu=3D=3D0.6.1.0a1&#39;, &#39=
;console_scripts&#39;, &#39;qmp-shell&#39;)())<br>
=C2=A0 File &quot;/home/berrange/.local/bin/qmp-shell&quot;, line 25, in im=
portlib_load_entry_point<br>
=C2=A0 =C2=A0 return next(matches).load()<br>
=C2=A0 File &quot;/usr/lib64/python3.10/importlib/metadata/__init__.py&quot=
;, line 162, in load<br>
=C2=A0 =C2=A0 module =3D import_module(match.group(&#39;module&#39;))<br>
=C2=A0 File &quot;/usr/lib64/python3.10/importlib/__init__.py&quot;, line 1=
26, in import_module<br>
=C2=A0 =C2=A0 return _bootstrap._gcd_import(name[level:], package, level)<b=
r>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 1050, in =
_gcd_import<br>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 1027, in =
_find_and_load<br>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 992, in _=
find_and_load_unlocked<br>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 241, in _=
call_with_frames_removed<br>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 1050, in =
_gcd_import<br>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 1027, in =
_find_and_load<br>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 992, in _=
find_and_load_unlocked<br>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 241, in _=
call_with_frames_removed<br>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 1050, in =
_gcd_import<br>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 1027, in =
_find_and_load<br>
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 1004, in =
_find_and_load_unlocked<br>
ModuleNotFoundError: No module named &#39;qemu&#39;<br>
<br>
I can&#39;t see why this is failing to find &#39;qemu&#39; when it exists f=
ine:<br>
<br>
$ python<br>
&gt;&gt;&gt; import qemu.aqmp.qmp_shell<br>
&gt;&gt;&gt; qemu.aqmp.qmp_shell.main()<br>
usage: [-h] [-H] [-N] [-v] [-p] [-l LOGFILE] qmp_server<br>
: error: the following arguments are required: qmp_server<br>
<br>
<br>
Why is &#39;load_entry_point&#39; unhappy ?<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m sorry, I&#39;m not sure.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">It may be because you i=
nstalled via setup.py instead of pip ... I always use pip. &quot;Eventually=
&quot; setup.py is going away, but there&#39;s some reasons I haven&#39;t d=
ropped it for QEMU yet. (Our long support tail for RHEL.)</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">(I don&#39;t know if that&#39;s the reaso=
n, I&#39;ll test. If it is the reason, I&#39;ll see if there&#39;s some way=
 to guard against this in the future.)</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I see you&#39;ve posted a new version, I&#39;ll test with th=
at version and if you don&#39;t mind, if there&#39;s any small problem I&#3=
9;ll just modify it for the PR myself, and you can review the changes and I=
&#39;ll get you on your way quicker.=C2=A0</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Thanks (and sorry for so many long emails lately),</div>=
<div dir=3D"auto">--js</div></div>

--0000000000007875c605d73a5016--


