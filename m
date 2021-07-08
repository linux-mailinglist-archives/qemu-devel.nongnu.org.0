Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5761F3BF3E3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 04:15:27 +0200 (CEST)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1JZV-0002AX-VD
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 22:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m1JYW-0001Vh-Sv
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:14:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m1JYS-0000s8-Ks
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625710458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XrPKP/BO6NhaaCIkSXA519ePaOXZLjHLy7HQL8H2GIk=;
 b=KIWMfvubeovRDzpZPlaE5E02TwKR0jMnlQultzyUo8yAV1b3oBtrlcOfg9HJmKzq/3YPXk
 ROrwGw09mSM17RwPKlIyq436EBZ91UwgEcIHE3wgl1YH+NT5V8BLtTmmMkhFfoGgT4uJTA
 nH3UHWo0wbQEXschmgymTvgb2vLu5GU=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-Aui3JY8BMn2ByGcHGkeL0w-1; Wed, 07 Jul 2021 22:14:15 -0400
X-MC-Unique: Aui3JY8BMn2ByGcHGkeL0w-1
Received: by mail-oo1-f70.google.com with SMTP id
 e10-20020a4ab14a0000b029020e1573bdb7so2599327ooo.9
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 19:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XrPKP/BO6NhaaCIkSXA519ePaOXZLjHLy7HQL8H2GIk=;
 b=pvgmzI9xxY/UQJfxyWWf8gXYru4XSlY471RDu1azOMOLuUdL3EUZiL6rZ7B39xjYRl
 doRPv7igtq+hI8VDXwbtkyKlz3gtBvzIc9GTSd2PUVWEBj6Oz9//akdcGYQbCh4lg5q/
 0x5OAsH8vME106cmYdcgCi0IzuBnqqF8HeAV2f+JJK6XsXdeYp0JwRcCtdkpeHEmjkOX
 KMosAVpnmiTz96yo8qpJCxXKcSzD0iItf3tKC+rmpVH+C18sgHgnWjY4fEfmaMGo4VBP
 QAajAGeZ22AajTjVwRGsAZGM7wX0c1a+6gnnpHaqtJLCvLv87GyiRkDYM6N56RbLjrcq
 15xA==
X-Gm-Message-State: AOAM532aKP1aDUMaUl86E/OR5IczhDbVhS1/27XH8OCJ+czeggSsFn82
 dtPgSm+j7lbowuR2TLcKQaoqgmeitvIXBDTU1Pd/SFhA5wQ2kgRfg+7NsG9zhvhGgQcddgpW4Rb
 IGcnTyBIN3uOW4Gt6mhsNun7DajpuBwI=
X-Received: by 2002:a9d:86d:: with SMTP id 100mr13270362oty.45.1625710455138; 
 Wed, 07 Jul 2021 19:14:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO6ICHJlgRTRqy6rA0L925HXMWFYXPQurKxnYEKyQ8PZlHGpuwzTVYuLp/62yFFRTeot5WIhkd5X6Vs+hZI0Y=
X-Received: by 2002:a9d:86d:: with SMTP id 100mr13270347oty.45.1625710454926; 
 Wed, 07 Jul 2021 19:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
 <20210702212603.26465-7-niteesh.gs@gmail.com>
In-Reply-To: <20210702212603.26465-7-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 7 Jul 2021 22:14:04 -0400
Message-ID: <CAFn=p-Yvw2R+dY+cgp6u0XK_nkZ-08E2VLQ2xnvJy7Wi88xPBQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] python: add entry point for aqmp-tui
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002c805b05c6933607"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002c805b05c6933607
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 2, 2021 at 5:26 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Add an entry point for aqmp-tui. This will allow it to be run from
> the command line using "aqmp-tui -a localhost:1234"
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> ---
>  python/setup.cfg | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 4782fe5241..23e30185f4 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -68,6 +68,7 @@ console_scripts =
>      qom-fuse = qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
>      qemu-ga-client = qemu.qmp.qemu_ga_client:main
>      qmp-shell = qemu.qmp.qmp_shell:main
> +    aqmp-tui = qemu.aqmp.aqmp_tui:main
>

I was going to suggest that you could use [tui] at the end here to protect
the script from being run when we don't have the optional dependency group
installed, but even with it, I get a pretty nasty error:

Traceback (most recent call last):
  File "/home/jsnow/src/qemu/python/.pyvenv/bin/aqmp-tui", line 33, in
<module>
    sys.exit(load_entry_point('qemu==0.6.1.0a1', 'console_scripts',
'aqmp-tui')())
  File "/home/jsnow/src/qemu/python/.pyvenv/bin/aqmp-tui", line 25, in
importlib_load_entry_point
    return next(matches).load()
  File "/usr/lib64/python3.9/importlib/metadata.py", line 77, in load
    module = import_module(match.group('module'))
  File "/usr/lib64/python3.9/importlib/__init__.py", line 127, in
import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 1030, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1007, in _find_and_load
  File "<frozen importlib._bootstrap>", line 986, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 680, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 855, in exec_module
  File "<frozen importlib._bootstrap>", line 228, in
_call_with_frames_removed
  File
"/home/jsnow/src/qemu/python/.pyvenv/lib64/python3.9/site-packages/qemu/aqmp/aqmp_tui.py",
line 14, in <module>
    from pygments import lexers
ModuleNotFoundError: No module named 'pygments'

It looks like this feature isn't working for me ... I'm not sure I know why.

In theory it should work:
https://setuptools.readthedocs.io/en/latest/userguide/entry_point.html#dependency-management

We might have to make our own custom entry point script that guards this a
little bit better if we can't solve this mystery. The goal is either to:

(1) Do not install an aqmp-tui script at all if we don't select the
optional TUI group, or
(2) Have the script error out early with a nice error message explaining
what optional dependencies it requires.


>
>  [flake8]
>  extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
> --
> 2.17.1
>
>

--0000000000002c805b05c6933607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 2, 2021 at 5:26 PM G S Ni=
teesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Add an entry point for aqmp-tui. This will allow it to be run from<br>
the command line using &quot;aqmp-tui -a localhost:1234&quot;<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/setup.cfg | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index 4782fe5241..23e30185f4 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -68,6 +68,7 @@ console_scripts =3D<br>
=C2=A0 =C2=A0 =C2=A0qom-fuse =3D qemu.qmp.qom_fuse:QOMFuse.entry_point [fus=
e]<br>
=C2=A0 =C2=A0 =C2=A0qemu-ga-client =3D qemu.qmp.qemu_ga_client:main<br>
=C2=A0 =C2=A0 =C2=A0qmp-shell =3D qemu.qmp.qmp_shell:main<br>
+=C2=A0 =C2=A0 aqmp-tui =3D qemu.aqmp.aqmp_tui:main<br></blockquote><div><b=
r></div><div>I was going to suggest that you could use [tui] at the end her=
e to protect the script from being run when we don&#39;t have the optional =
dependency group installed, but even with it, I get a pretty nasty error:<b=
r></div><div><br></div><div>Traceback (most recent call last):<br>=C2=A0 Fi=
le &quot;/home/jsnow/src/qemu/python/.pyvenv/bin/aqmp-tui&quot;, line 33, i=
n &lt;module&gt;<br>=C2=A0 =C2=A0 sys.exit(load_entry_point(&#39;qemu=3D=3D=
0.6.1.0a1&#39;, &#39;console_scripts&#39;, &#39;aqmp-tui&#39;)())<br>=C2=A0=
 File &quot;/home/jsnow/src/qemu/python/.pyvenv/bin/aqmp-tui&quot;, line 25=
, in importlib_load_entry_point<br>=C2=A0 =C2=A0 return next(matches).load(=
)<br>=C2=A0 File &quot;/usr/lib64/python3.9/importlib/metadata.py&quot;, li=
ne 77, in load<br>=C2=A0 =C2=A0 module =3D import_module(match.group(&#39;m=
odule&#39;))<br>=C2=A0 File &quot;/usr/lib64/python3.9/importlib/__init__.p=
y&quot;, line 127, in import_module<br>=C2=A0 =C2=A0 return _bootstrap._gcd=
_import(name[level:], package, level)<br>=C2=A0 File &quot;&lt;frozen impor=
tlib._bootstrap&gt;&quot;, line 1030, in _gcd_import<br>=C2=A0 File &quot;&=
lt;frozen importlib._bootstrap&gt;&quot;, line 1007, in _find_and_load<br>=
=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 986, in _=
find_and_load_unlocked<br>=C2=A0 File &quot;&lt;frozen importlib._bootstrap=
&gt;&quot;, line 680, in _load_unlocked<br>=C2=A0 File &quot;&lt;frozen imp=
ortlib._bootstrap_external&gt;&quot;, line 855, in exec_module<br>=C2=A0 Fi=
le &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 228, in _call_with=
_frames_removed<br>=C2=A0 File &quot;/home/jsnow/src/qemu/python/.pyvenv/li=
b64/python3.9/site-packages/qemu/aqmp/aqmp_tui.py&quot;, line 14, in &lt;mo=
dule&gt;<br>=C2=A0 =C2=A0 from pygments import lexers<br>ModuleNotFoundErro=
r: No module named &#39;pygments&#39;</div><div><br></div><div>It looks lik=
e this feature isn&#39;t working for me ... I&#39;m not sure I know why.</d=
iv><div><br></div><div>In theory it should work: <a href=3D"https://setupto=
ols.readthedocs.io/en/latest/userguide/entry_point.html#dependency-manageme=
nt">https://setuptools.readthedocs.io/en/latest/userguide/entry_point.html#=
dependency-management</a></div><div><br></div><div>We might have to make ou=
r own custom entry point script that guards this a little bit better if we =
can&#39;t solve this mystery. The goal is either to:</div><div><br></div><d=
iv>(1) Do not install an aqmp-tui script at all if we don&#39;t select the =
optional TUI group, or</div><div>(2) Have the script error out early with a=
 nice error message explaining what optional dependencies it requires.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0[flake8]<br>
=C2=A0extend-ignore =3D E722=C2=A0 # Prefer pylint&#39;s bare-except checks=
 to flake8&#39;s<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--0000000000002c805b05c6933607--


