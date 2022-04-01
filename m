Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3545E4EF900
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 19:33:19 +0200 (CEST)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naL9B-0006vh-G8
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 13:33:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1naL88-0006Gx-5Z
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1naL84-000473-1C
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648834326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6M87s0BqoPypK7UOzvlbGBQPV6r5DuGz9oy7xt4bMcA=;
 b=K61PB4GTq1i1JHsMYdX5/xcwJ15/n4rh+UXI6Wc7Nwa5vk8sEZlb2cNk+RZn/5IBOM23HG
 nloeHTso2VPQZ2W0g9Alng6dOi5XtUjcUQJM7R+45FTTy3escaUz4rvLVSugqHzxwwnYPI
 SKNcBVIFPcfsTcpgAI5D3IttnTl+pKg=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-PArBI72ZNZe4av_RcXn7-Q-1; Fri, 01 Apr 2022 13:32:05 -0400
X-MC-Unique: PArBI72ZNZe4av_RcXn7-Q-1
Received: by mail-vk1-f197.google.com with SMTP id
 g69-20020a1f9d48000000b00343eed5c697so443311vke.17
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 10:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6M87s0BqoPypK7UOzvlbGBQPV6r5DuGz9oy7xt4bMcA=;
 b=NS1mPZzlS/R3AJZAnXyRuQkX/JRBcro1t223vHNhJKd18T3UJbGpZONlbRRgZoZIg9
 ReZnwbku4dwmBR2I6QyMUR3hlpwUfIfXcDO/0qLrBf3Cj5+pp6oUM/tOMCNZaK7ynrmg
 9w0ONltUt86lH4amYwrQoJn3tBH+LKGurSvmBGWN4sCgZ3Ydo7RKivPaJJ4MqucxbLH5
 tCduYfH+0N3WFUcU8mwdMdn00a4SBruJ1iS7EglG/2wl/tu182ysvtCQcZejWQfFrbXh
 hRX93NAkaFRqCid5o8DGlQ4+fXGFlIwaU1cjTGPywhudsjyCN1mvkflFNe9DG/+heXP9
 h+DQ==
X-Gm-Message-State: AOAM5324ZXV0Bd1kEq36v2Tw0jOtdR1P+Yy6JHHcP21Mrs/xsvM8MJHC
 hG2yHRdlsoj46r37JzQBBJNhABHjl7NnN+CvH3b++QMJve/pblmS0AzriJgNqvXAAOgAXagBHcx
 roNL7DLv3wjNvKSDyaSpJcuwpdyKCmFg=
X-Received: by 2002:ab0:7610:0:b0:354:21d1:9dc7 with SMTP id
 o16-20020ab07610000000b0035421d19dc7mr4169040uap.100.1648834324812; 
 Fri, 01 Apr 2022 10:32:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrTErWqKZS2kWY1EdvHEknT4x441lutckdEsd6YkisxR+sQZYY2WuDTOM7NTfUsw3sJRcjzUGvIf4m2LC+EY4=
X-Received: by 2002:ab0:7610:0:b0:354:21d1:9dc7 with SMTP id
 o16-20020ab07610000000b0035421d19dc7mr4169029uap.100.1648834324577; Fri, 01
 Apr 2022 10:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-10-jsnow@redhat.com>
 <Ykcq5LSltMThruoM@paraplu>
In-Reply-To: <Ykcq5LSltMThruoM@paraplu>
From: John Snow <jsnow@redhat.com>
Date: Fri, 1 Apr 2022 13:31:55 -0400
Message-ID: <CAFn=p-YLJuHRjbQn8KmrAX2mm3-cwQjs6ge_BUktYNTiEg0Upw@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 09/13] [FIXME] move PACKAGE.rst to README.rst and
 update
To: Kashyap Chamarthy <kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000035d0fd05db9b2833"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000035d0fd05db9b2833
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 1, 2022, 12:40 PM Kashyap Chamarthy <kchamart@redhat.com> wrote=
:

> On Wed, Mar 30, 2022 at 02:24:20PM -0400, John Snow wrote:
> > The README here will reflect both what is shown on GitLab and on the
> > PyPI landing page. Update it accordingly, and freshen it up.
> >
> > FIXME: Update URLs when pushing to the production repo.
> >
> > Suggested-by: Kashyap Chamarthy <kchamart@redhat.com>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
>
> Hi,
>
> This version reads good to me. :)
>
> [...]
>
> > +
> > +Who isn't this library for?
> > +---------------------------
> > +
> > +It is not designed for anyone looking for a turn-key solution for VM
> > +management. QEMU is a low-level component that resembles a particularl=
y
> > +impressive Swiss Army knife. This library does not manage that
> > +complexity and is largely "VM-ignorant". It's not a replacement for
> > +projects like `libvirt <https://libvirt.org/>`_, `virt-manager
> > +<https://virt-manager.org/>`_, `GNOME Boxes
> > +<https://wiki.gnome.org/Apps/Boxes>`_, etc.
> > +
> > +
> > +Installing
> > +----------
> > +
> > +This package can be installed from PyPI with pip: ``> pip3 install
> > +qemu.qmp``.
> >
> > +
> > +Usage
> > +-----
> > +
> > +Launch QEMU with a monitor, e.g.::
> > +
> > +  > qemu-system-x86_64 -qmp unix:qmp.sock,server=3Don,wait=3Doff
> > +
> > +
> > +Then, at its simplest, script-style usage looks like this::
> > +
> > +  import asyncio
> > +  from qemu.qmp import QMPClient
> > +
> > +  async def main():
> > +      qmp =3D QMPClient('my-vm-nickname')
> > +      await qmp.connect('qmp.sock')
> > +
> > +      res =3D await qmp.execute('query-status')
> > +      print(f"VM status: {res['status']}")
> > +
> > +      await qmp.disconnect()
> > +
> > +  asyncio.run(main())
>
> Tested the exmaple; this works!
>
> > +The above script will connect to the UNIX socket located at
> > +``qmp.sock``, query the VM's runstate, then print it out
> > +to the terminal::
> > +
> > +  > python3 example.py
> > +  VM status: running
> > +
> > +
> > +For more complex usages, especially those that make full advantage of
> > +monitoring asynchronous events, refer to the `online documentation
> > +<https://jsnow.gitlab.io/qemu.qmp/>`_ or type ``import qemu.qmp;
> > +help(qemu.qmp)`` in your Python terminal of choice.
> > +
> > +
> > +Contributing
> > +------------
> > +
> > +Contributions are quite welcome! Please file bugs using the `GitLab
> > +issue tracker <https://gitlab.com/jsnow/qemu.qmp/-/issues>`_. This
> > +project will accept GitLab merge requests, but due to the close
> > +association with the QEMU project, there are some additional guideline=
s:
> > +
> > +1. Please use the "Signed-off-by" tag in your commit messages. See
> > +   https://wiki.linuxfoundation.org/dco for more information on this
> > +   requirement.
> > +
> > +2. This repository won't squash merge requests into a single commit on
> > +   pull; each commit should seek to be self-contained (within reason).
> > +
> > +3. Owing to the above, each commit sent as part of a merge request
> > +   should not introduce any temporary regressions, even if fixed later
> > +   in the same merge request. This is done to preserve bisectability.
> > +
> > +4. Please associate every merge request with at least one `GitLab issu=
e
> > +   <https://gitlab.com/jsnow/qemu.qmp/-/issues>`_. This helps with
> > +   generating Changelog text and staying organized. Thank you =F0=9F=
=99=87
>
> /me didn't miss the Japanese bow.
>
> > +Developing
> > +^^^^^^^^^^
> > +
> > +Optional packages necessary for running code quality analysis for this
> > +package can be installed with the optional dependency group "devel":
> > +``pip install qemu.qmp[devel]``.
> > +
> > +``make develop`` can be used to install this package in editable mode
> > +(to the current environment) *and* bring in testing dependencies in on=
e
> > +command.
> > +
> > +``make check`` can be used to run the available tests. Consult ``make
> > +help`` for other targets and tests that make sense for different
> > +occasions.
> > +
> > +Before submitting a pull request, consider running ``make check-tox &&
> > +make check-pipenv`` locally to spot any issues that will cause the CI =
to
> > +fail. These checks use their own virtual environments and won't pollut=
e
> > +your working space.
>
> Nit: Consider hyper-linking "virtual environments" to:
> https://docs.python.org/3/library/venv.html#module-venv
>
> (I realize, within context people will recognize the term "virtual
> environment" is not a virtual guest environment, but a Python venv.  I
> have a mild preference for being explicit here.)
>

OK. it's tough: there's a dual audience in mind here. People who are
familiar with Python development and QEMU devs who are not!

A link would suffice, but how to install, develop, and use python packages
can get a little complex. Longer than a paragraph, anyway.

Hard to know which complexities to omit and which to front-load.

=C2=AF\_(=E3=83=84)_/=C2=AF


> FWIW:
>
> Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>


Thanks for your review prior to sending, and thanks for your re-review here
=F0=9F=99=82


>
> [...]
>
>
> --
> /kashyap
>
>

--00000000000035d0fd05db9b2833
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Apr 1, 2022, 12:40 PM Kashyap Chamarthy &lt;<a=
 href=3D"mailto:kchamart@redhat.com">kchamart@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Wed, Mar 30, 2022 at 02:24:20PM -04=
00, John Snow wrote:<br>
&gt; The README here will reflect both what is shown on GitLab and on the<b=
r>
&gt; PyPI landing page. Update it accordingly, and freshen it up.<br>
&gt; <br>
&gt; FIXME: Update URLs when pushing to the production repo.<br>
&gt; <br>
&gt; Suggested-by: Kashyap Chamarthy &lt;<a href=3D"mailto:kchamart@redhat.=
com" target=3D"_blank" rel=3D"noreferrer">kchamart@redhat.com</a>&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi,<br>
<br>
This version reads good to me. :)<br>
<br>
[...]<br>
<br>
&gt; +<br>
&gt; +Who isn&#39;t this library for?<br>
&gt; +---------------------------<br>
&gt; +<br>
&gt; +It is not designed for anyone looking for a turn-key solution for VM<=
br>
&gt; +management. QEMU is a low-level component that resembles a particular=
ly<br>
&gt; +impressive Swiss Army knife. This library does not manage that<br>
&gt; +complexity and is largely &quot;VM-ignorant&quot;. It&#39;s not a rep=
lacement for<br>
&gt; +projects like `libvirt &lt;<a href=3D"https://libvirt.org/" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://libvirt.org/</a>&gt;`_, `vir=
t-manager<br>
&gt; +&lt;<a href=3D"https://virt-manager.org/" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://virt-manager.org/</a>&gt;`_, `GNOME Boxes<br>
&gt; +&lt;<a href=3D"https://wiki.gnome.org/Apps/Boxes" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://wiki.gnome.org/Apps/Boxes</a>&gt;`_, e=
tc.<br>
&gt; +<br>
&gt; +<br>
&gt; +Installing<br>
&gt; +----------<br>
&gt; +<br>
&gt; +This package can be installed from PyPI with pip: ``&gt; pip3 install=
<br>
&gt; +qemu.qmp``.<br>
&gt; <br>
&gt; +<br>
&gt; +Usage<br>
&gt; +-----<br>
&gt; +<br>
&gt; +Launch QEMU with a monitor, e.g.::<br>
&gt; +<br>
&gt; +=C2=A0 &gt; qemu-system-x86_64 -qmp unix:qmp.sock,server=3Don,wait=3D=
off<br>
&gt; +<br>
&gt; +<br>
&gt; +Then, at its simplest, script-style usage looks like this::<br>
&gt; +<br>
&gt; +=C2=A0 import asyncio<br>
&gt; +=C2=A0 from qemu.qmp import QMPClient<br>
&gt; +<br>
&gt; +=C2=A0 async def main():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 qmp =3D QMPClient(&#39;my-vm-nickname&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 await qmp.connect(&#39;qmp.sock&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 res =3D await qmp.execute(&#39;query-status&#39;=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 print(f&quot;VM status: {res[&#39;status&#39;]}&=
quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 await qmp.disconnect()<br>
&gt; +<br>
&gt; +=C2=A0 asyncio.run(main())<br>
<br>
Tested the exmaple; this works!<br>
<br>
&gt; +The above script will connect to the UNIX socket located at<br>
&gt; +``qmp.sock``, query the VM&#39;s runstate, then print it out<br>
&gt; +to the terminal::<br>
&gt; +<br>
&gt; +=C2=A0 &gt; python3 example.py<br>
&gt; +=C2=A0 VM status: running<br>
&gt; +<br>
&gt; +<br>
&gt; +For more complex usages, especially those that make full advantage of=
<br>
&gt; +monitoring asynchronous events, refer to the `online documentation<br=
>
&gt; +&lt;<a href=3D"https://jsnow.gitlab.io/qemu.qmp/" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://jsnow.gitlab.io/qemu.qmp/</a>&gt;`_ or=
 type ``import qemu.qmp;<br>
&gt; +help(qemu.qmp)`` in your Python terminal of choice.<br>
&gt; +<br>
&gt; +<br>
&gt; +Contributing<br>
&gt; +------------<br>
&gt; +<br>
&gt; +Contributions are quite welcome! Please file bugs using the `GitLab<b=
r>
&gt; +issue tracker &lt;<a href=3D"https://gitlab.com/jsnow/qemu.qmp/-/issu=
es" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/jsno=
w/qemu.qmp/-/issues</a>&gt;`_. This<br>
&gt; +project will accept GitLab merge requests, but due to the close<br>
&gt; +association with the QEMU project, there are some additional guidelin=
es:<br>
&gt; +<br>
&gt; +1. Please use the &quot;Signed-off-by&quot; tag in your commit messag=
es. See<br>
&gt; +=C2=A0 =C2=A0<a href=3D"https://wiki.linuxfoundation.org/dco" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://wiki.linuxfoundation.org/d=
co</a> for more information on this<br>
&gt; +=C2=A0 =C2=A0requirement.<br>
&gt; +<br>
&gt; +2. This repository won&#39;t squash merge requests into a single comm=
it on<br>
&gt; +=C2=A0 =C2=A0pull; each commit should seek to be self-contained (with=
in reason).<br>
&gt; +<br>
&gt; +3. Owing to the above, each commit sent as part of a merge request<br=
>
&gt; +=C2=A0 =C2=A0should not introduce any temporary regressions, even if =
fixed later<br>
&gt; +=C2=A0 =C2=A0in the same merge request. This is done to preserve bise=
ctability.<br>
&gt; +<br>
&gt; +4. Please associate every merge request with at least one `GitLab iss=
ue<br>
&gt; +=C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.com/jsnow/qemu.qmp/-/issue=
s" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/jsnow=
/qemu.qmp/-/issues</a>&gt;`_. This helps with<br>
&gt; +=C2=A0 =C2=A0generating Changelog text and staying organized. Thank y=
ou =F0=9F=99=87<br>
<br>
/me didn&#39;t miss the Japanese bow.<br>
<br>
&gt; +Developing<br>
&gt; +^^^^^^^^^^<br>
&gt; +<br>
&gt; +Optional packages necessary for running code quality analysis for thi=
s<br>
&gt; +package can be installed with the optional dependency group &quot;dev=
el&quot;:<br>
&gt; +``pip install qemu.qmp[devel]``.<br>
&gt; +<br>
&gt; +``make develop`` can be used to install this package in editable mode=
<br>
&gt; +(to the current environment) *and* bring in testing dependencies in o=
ne<br>
&gt; +command.<br>
&gt; +<br>
&gt; +``make check`` can be used to run the available tests. Consult ``make=
<br>
&gt; +help`` for other targets and tests that make sense for different<br>
&gt; +occasions.<br>
&gt; +<br>
&gt; +Before submitting a pull request, consider running ``make check-tox &=
amp;&amp;<br>
&gt; +make check-pipenv`` locally to spot any issues that will cause the CI=
 to<br>
&gt; +fail. These checks use their own virtual environments and won&#39;t p=
ollute<br>
&gt; +your working space.<br>
<br>
Nit: Consider hyper-linking &quot;virtual environments&quot; to:<br>
<a href=3D"https://docs.python.org/3/library/venv.html#module-venv" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://docs.python.org/3/library/=
venv.html#module-venv</a><br>
<br>
(I realize, within context people will recognize the term &quot;virtual<br>
environment&quot; is not a virtual guest environment, but a Python venv.=C2=
=A0 I<br>
have a mild preference for being explicit here.)<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">OK. it&#39;s tough: there&#=
39;s a dual audience in mind here. People who are familiar with Python deve=
lopment and QEMU devs who are not!</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">A link would suffice, but how to install, develop, and use pytho=
n packages can get a little complex. Longer than a paragraph, anyway.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Hard to know which complexiti=
es to omit and which to front-load.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">=C2=AF\_(=E3=83=84)_/=C2=AF<br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
FWIW:<br>
<br>
Reviewed-by: Kashyap Chamarthy &lt;<a href=3D"mailto:kchamart@redhat.com" t=
arget=3D"_blank" rel=3D"noreferrer">kchamart@redhat.com</a>&gt;</blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for your =
review prior to sending, and thanks for your re-review here =F0=9F=99=82</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"> <br>
<br>
[...]<br>
<br>
<br>
-- <br>
/kashyap<br>
<br>
</blockquote></div></div></div>

--00000000000035d0fd05db9b2833--


