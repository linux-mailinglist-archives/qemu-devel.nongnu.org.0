Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C44150C8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:54:53 +0200 (CEST)
Received: from localhost ([::1]:57582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT8KS-0007YN-2e
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT8JI-0005Q0-9r
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT8JG-0001ne-0f
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632340416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xpLzqlPfMjr6Do7DUcBQyceN+0LHfIrPRHRBTqPJ+r8=;
 b=YD6PumP55nZEAS08/SKtHiJrinV1WTMS/V2nqPUawn/8xllFg6CEIqcgaYO8u4zmIIyWin
 Io3UiIC/ChL3C5Wjh/wPRw69HlWCoctoDL2mrQotMjXYvMvcxo+s8/rg59wSVcDVL5Xjxo
 fIBlIWUdeoMqQv96QLBPV45uH5vgVO8=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-tvhKVgvpMPOhppTTHc6NZg-1; Wed, 22 Sep 2021 15:53:34 -0400
X-MC-Unique: tvhKVgvpMPOhppTTHc6NZg-1
Received: by mail-oo1-f72.google.com with SMTP id
 v11-20020a4a314b000000b002a9d9728566so2387581oog.1
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 12:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xpLzqlPfMjr6Do7DUcBQyceN+0LHfIrPRHRBTqPJ+r8=;
 b=xbtvOojLpEnOsJ88gjtKezgmYT7+SooybD1YCJ1uR721TcFUTk2FD0uGpDg36VMs/E
 FI2OmLSz2EulGA4BZGOsM9GKyEDE2ATcYJJW5TqNbD8FZgvFuTulp/2kuE0s03m0nHuc
 zBwOjH08eN5rWtYgXnI/CrHJ0W/vu63uHvmpxg0n1V+iALOqDBmTC+Yn+Io+5jG/utvq
 o+uu7FJFhJlcYIjJ940QGRdAfQQT507FW1TJXp54cChZ9sXW3aRMYYgG+ezRi3jJT21s
 1tcJcJsJw51rTye6EfnzJB8jx4DtMQa1+PwRCQV/fgeCwda/iCxYEoBnkdaK7MOl0cKn
 VTrw==
X-Gm-Message-State: AOAM533kvdiFkFRwX+MCHqzGeAGh731yKO72xgXVh7NfNMI7qFN3moz9
 RpbDylbXQtppZ5epx53ZKyDxQ3150rmoi9mtTYHzZxa9NX7GkiNfmNDT9h53XdyvCk6C78hUF+0
 Wl6B1x8ByRN+mL+y0Jk1pc4D13/WLcys=
X-Received: by 2002:aca:3887:: with SMTP id f129mr9385095oia.112.1632340413026; 
 Wed, 22 Sep 2021 12:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwaCGjkk5JNxz3WNKHcjoRg83YN488+/kruXkiWRZdD3mPkNIieFGyKdSepbVdtpzdJ20Q8ChcjnSt8HVzkrM=
X-Received: by 2002:aca:3887:: with SMTP id f129mr9385083oia.112.1632340412802; 
 Wed, 22 Sep 2021 12:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-8-jsnow@redhat.com>
 <374eff9f-0e9e-a2da-19ab-1c39a63191b0@redhat.com>
In-Reply-To: <374eff9f-0e9e-a2da-19ab-1c39a63191b0@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 22 Sep 2021 15:53:22 -0400
Message-ID: <CAFn=p-aVEvHXwZWroz2DitNw6-f0YdfJqsqkxBfKNfHzrB4DOw@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] iotests/297: Don't rely on distro-specific
 linter binaries
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000753b9505cc9ade54"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000753b9505cc9ade54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(This email just explains python packaging stuff. No action items in here.
Skim away.)

On Fri, Sep 17, 2021 at 5:43 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 16.09.21 06:09, John Snow wrote:
> > 'pylint-3' is another Fedora-ism. Use "python3 -m pylint" or "python3 -=
m
> > mypy" to access these scripts instead. This style of invocation will
> > prefer the "correct" tool when run in a virtual environment.
> >
> > Note that we still check for "pylint-3" before the test begins -- this
> > check is now "overly strict", but shouldn't cause anything that was
> > already running correctly to start failing.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >   tests/qemu-iotests/297 | 45 ++++++++++++++++++++++++-----------------=
-
> >   1 file changed, 26 insertions(+), 19 deletions(-)
>
> I know it sounds silly, but to be honest I have no idea if replacing
> `mypy` by `python3 -m mypy` is correct, because no mypy documentation
> seems to suggest it.
>
>
Right, I don't think it's necessarily documented that you can do this. It
just happens to be a very convenient way to invoke the same script without
needing to know *where* mypy is. You let python figure out where it's going
to import mypy from, and it handles the rest.

(This also makes it easier to use things like mypy, pylint etc with an
explicitly specified PYTHON interpreter. I don't happen to do that in this
patch, but ... we could.)

>
>  From what I understand, that=E2=80=99s generally how Python =E2=80=9Cbin=
aries=E2=80=9D work,
> though (i.e., installed as a module invokable with `python -m`, and then
> providing some stub binary that, well, effectively does this, but kind
> of in a weird way, I just don=E2=80=99t understand it), and none of the
> parameters seem to be hurt in this conversion, so:
>
>
Right. Technically, any python package can ask for any number of
executables to be installed, but the setuptools packaging ecosystem
provides a way to "generate" these based on package configuration. I use a
few in our own Python packages. If you look in python/setup.cfg, you'll see
stuff like this:

[options.entry_points]
console_scripts =3D
    qom =3D qemu.qmp.qom:main
    qom-set =3D qemu.qmp.qom:QOMSet.entry_point
    qom-get =3D qemu.qmp.qom:QOMGet.entry_point
    qom-list =3D qemu.qmp.qom:QOMList.entry_point
    qom-tree =3D qemu.qmp.qom:QOMTree.entry_point
    qom-fuse =3D qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
    qemu-ga-client =3D qemu.qmp.qemu_ga_client:main
    qmp-shell =3D qemu.qmp.qmp_shell:main

These entries cause those weird little binary wrapper scripts to be
generated for you when the package is *installed*. So our packages will put
'qmp-shell' and 'qom-tree' into your $PATH*.The stuff to the right of the
equals sign is just a pointer to a function that can be executed that
implements the CLI command. qemu.qmp.qmp_shell points to the module to
import, and ':main' points to the function to run.

The last bit of this is that many, though not all (and there's zero
requirement this has to be true), python packages that implement CLI
commands will often have a stanza in their __init__.py module that says
something like this:

if __name__ =3D=3D '__main__':
    do_the_command_line_stuff()

Alternatively, a package can include a literal __main__.py file that python
knows to check for, and this module is the one that gets executed for
`python3 -m mypackage` invocations. This is what mypy does.

Those are the magical blurbs that allow you to execute a module as if it
were a script by running "python3 -m mymodule" -- that hooks directly into
that little execution stanza. For python code distributed as packages,
that's the real reason to have that little magic stanza -- it provides a
convenient way to run stuff without needing to write the incredibly more
tedious:

python3 -c "from mypy.__main__ import console_entry; console_entry();"

... which is quite a bit more porcelain too, depending on how they
re/factor the code inside of the package.

Seeing as how mypy explicitly includes a __main__.py file:
https://github.com/python/mypy/blob/master/mypy/__main__.py, I am taking it
as a given that they are fully aware of invoking mypy in this fashion, and
believe it safe to rely on.

There will be a quiz later.
(There will not be a quiz.)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>

Thanks!

--js

*If your $PATH is configured to include, say, ~/.local/bin/, that is. On
Fedora, this is where executable shims for python get deposited when you do
"pip3 install --user somepackage". Python virtual environments will
configure your $PATH to include packages installed in that venv, etc etc
etc. Not every distro is configured such that pip packages are on the PATH,
so you can't rely on them being there when writing other scripts, usually.
Invoking the python interpreter directly seems far more flexible.

--000000000000753b9505cc9ade54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">(This email just explains python packagin=
g stuff. No action items in here. Skim away.)</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 5:43 A=
M Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
16.09.21 06:09, John Snow wrote:<br>
&gt; &#39;pylint-3&#39; is another Fedora-ism. Use &quot;python3 -m pylint&=
quot; or &quot;python3 -m<br>
&gt; mypy&quot; to access these scripts instead. This style of invocation w=
ill<br>
&gt; prefer the &quot;correct&quot; tool when run in a virtual environment.=
<br>
&gt;<br>
&gt; Note that we still check for &quot;pylint-3&quot; before the test begi=
ns -- this<br>
&gt; check is now &quot;overly strict&quot;, but shouldn&#39;t cause anythi=
ng that was<br>
&gt; already running correctly to start failing.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsemen=
tsov@virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@=
redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297 | 45 ++++++++++++++++++++++++------=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 26 insertions(+), 19 deletions(-)<br>
<br>
I know it sounds silly, but to be honest I have no idea if replacing <br>
`mypy` by `python3 -m mypy` is correct, because no mypy documentation <br>
seems to suggest it.<br>
<br></blockquote><div></div><div><br></div><div>Right, I don&#39;t think it=
&#39;s necessarily documented that you can do this. It just happens to be a=
 very convenient way to invoke the same script without needing to know *whe=
re* mypy is. You let python figure out where it&#39;s going to import mypy =
from, and it handles the rest.</div><div><br></div><div>(This also makes it=
 easier to use things like mypy, pylint etc with an explicitly specified PY=
THON interpreter. I don&#39;t happen to do that in this patch, but ... we c=
ould.)<br></div>=C2=A0<blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0From what I understand, that=E2=80=99s generally how Python =E2=80=9C=
binaries=E2=80=9D work, <br>
though (i.e., installed as a module invokable with `python -m`, and then <b=
r>
providing some stub binary that, well, effectively does this, but kind <br>
of in a weird way, I just don=E2=80=99t understand it), and none of the <br=
>
parameters seem to be hurt in this conversion, so:<br>
<br></blockquote><div><br></div><div>Right. Technically, any python package=
 can ask for any number of executables to be installed, but the setuptools =
packaging ecosystem provides a way to &quot;generate&quot; these based on p=
ackage configuration. I use a few in our own Python packages. If you look i=
n python/setup.cfg, you&#39;ll see stuff like this:</div><div><br></div><di=
v>[options.entry_points]<br>console_scripts =3D<br>=C2=A0 =C2=A0 qom =3D qe=
mu.qmp.qom:main<br>=C2=A0 =C2=A0 qom-set =3D qemu.qmp.qom:QOMSet.entry_poin=
t<br>=C2=A0 =C2=A0 qom-get =3D qemu.qmp.qom:QOMGet.entry_point<br>=C2=A0 =
=C2=A0 qom-list =3D qemu.qmp.qom:QOMList.entry_point<br>=C2=A0 =C2=A0 qom-t=
ree =3D qemu.qmp.qom:QOMTree.entry_point<br>=C2=A0 =C2=A0 qom-fuse =3D qemu=
.qmp.qom_fuse:QOMFuse.entry_point [fuse]<br>=C2=A0 =C2=A0 qemu-ga-client =
=3D qemu.qmp.qemu_ga_client:main<br>=C2=A0 =C2=A0 qmp-shell =3D qemu.qmp.qm=
p_shell:main</div><div><br></div><div>These entries cause those weird littl=
e binary wrapper scripts to be generated for you when the package is *insta=
lled*. So our packages will put &#39;qmp-shell&#39; and &#39;qom-tree&#39; =
into your $PATH*.The stuff to the right of the equals sign is just a pointe=
r to a function that can be executed that implements the CLI command. qemu.=
qmp.qmp_shell points to the module to import, and &#39;:main&#39; points to=
 the function to run.</div><div><br></div><div>The last bit of this is that=
 many, though not all (and there&#39;s zero requirement this has to be true=
), python packages that implement CLI commands will often have a stanza in =
their __init__.py module that says something like this:</div><div><br></div=
><div>if __name__ =3D=3D &#39;__main__&#39;:</div><div>=C2=A0=C2=A0=C2=A0 d=
o_the_command_line_stuff()</div><div><br></div><div>Alternatively, a packag=
e can include a literal __main__.py file that python knows to check for, an=
d this module is the one that gets executed for `python3 -m mypackage` invo=
cations. This is what mypy does.<br></div><div><br></div><div>Those are the=
 magical blurbs that allow you to execute a module as if it were a script b=
y running &quot;python3 -m mymodule&quot; -- that hooks directly into that =
little execution stanza. For python code distributed as packages, that&#39;=
s the real reason to have that little magic stanza -- it provides a conveni=
ent way to run stuff without needing to write the incredibly more tedious:<=
/div><div><br></div><div>python3 -c &quot;from mypy.__main__ import console=
_entry; console_entry();&quot;</div></div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">... which is quite a bit more porcelain too,=
 depending on how they re/factor the code inside of the package.</div><div =
class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Seeing as how my=
py explicitly includes a __main__.py file: <a href=3D"https://github.com/py=
thon/mypy/blob/master/mypy/__main__.py">https://github.com/python/mypy/blob=
/master/mypy/__main__.py</a>, I am taking it as a given that they are fully=
 aware of invoking mypy in this fashion, and believe it safe to rely on.<br=
></div><div class=3D"gmail_quote"></div><div class=3D"gmail_quote"><div>=C2=
=A0</div><div>There will be a quiz later.</div><div>(There will not be a qu=
iz.)</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Than=
ks!</div><div><br></div><div>--js<br></div><div><br></div><div>*If your $PA=
TH is configured to include, say, ~/.local/bin/, that is. On
Fedora, this is where executable shims for python get deposited when you
 do &quot;pip3 install --user somepackage&quot;. Python virtual environment=
s will=20
configure your $PATH to include packages installed in that venv,=20
etc etc etc. Not every distro is configured such that pip packages are on t=
he PATH, so you can&#39;t rely on them being there when writing other scrip=
ts, usually. Invoking the python interpreter directly seems far more flexib=
le. <br></div></div></div>

--000000000000753b9505cc9ade54--


