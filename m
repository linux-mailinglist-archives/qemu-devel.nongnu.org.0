Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A244AE08A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:17:55 +0100 (CET)
Received: from localhost ([::1]:53860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHV3q-00082u-Dv
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:17:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHUHW-00040T-75
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:27:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHUHS-0004d7-6V
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644341272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f4ShG+MxW3UhMU1mrF1NjcrkR1eSfA/ZrHCLP2PhxFQ=;
 b=UzaP1Rdj6KBpRycRrcHBSjtY7YVBNbfCTS5lFAR0/7lTFT2ZjVZg59S5/vpd0m/LiugGWi
 fueh8fw1cXVdVInmrclgJnEhRXHr++iUJEtDiL/Hm4DFzSC68LpCThqARYX1tdbXg0aqgp
 zRKZWif2/Uwtk4N6MQKIkxJls8XTgaY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-0O5H_Mf5Pj2HxcUkF6BCAw-1; Tue, 08 Feb 2022 12:27:45 -0500
X-MC-Unique: 0O5H_Mf5Pj2HxcUkF6BCAw-1
Received: by mail-vk1-f198.google.com with SMTP id
 m193-20020a1f26ca000000b00328f25d5b3eso559238vkm.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 09:27:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4ShG+MxW3UhMU1mrF1NjcrkR1eSfA/ZrHCLP2PhxFQ=;
 b=v/vm9FFJAJg/hdLDmCzkvbqGNGqVAzVSYLupyP9XG/8fUbI1c+mOFdHXQehqgDw451
 OeRGe/tVAitajRYQuz7eezAPD0T80vqEncNnLJHEdMp9hlqaSDaLsfg5Zpsf9EGm+SmM
 HzhAk70zABpAPSpylsrtPPX71Xwk/RWmmcVITySTeWkdZCWdA7li3Kk+wQ4cvSUClUpX
 /UJnZgiPhCoScqd2HJT2YeZ49lHFCoBynkLuNAwtqsxaPtRz5E3FmL7J02rqEldjEFNv
 8/FeC+S8e3uXW/3IB4m++rLuj+sc27MKRZHSDq3h0jGmQK+0WqZU01ONkI6qovRRF9LH
 gFng==
X-Gm-Message-State: AOAM5319Nsa05oT+QkZuTqya3ESB5wDZRjULc0DfIT1RXUc1Vqn1Q1L8
 AJf6iWEK9pj10lNMuL9I1AjZpoMP1/zMlPWKFDRl8/umqcH9A1NAviKQNYN01VKE1NzLssYES2k
 mZ6yVHKSN5gDCaUUsyck065wz1KMlS9A=
X-Received: by 2002:ab0:6505:: with SMTP id w5mr2010348uam.32.1644341264954;
 Tue, 08 Feb 2022 09:27:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdiZ4Vxi5zDOyd5dR0KKNLeKq98WkUYZ5UhOMx4dQhFS5978Rt6sjHTEr/30vfLqZGk3dkAr678AIjwSk0qPA=
X-Received: by 2002:ab0:6505:: with SMTP id w5mr2010338uam.32.1644341264647;
 Tue, 08 Feb 2022 09:27:44 -0800 (PST)
MIME-Version: 1.0
References: <20220128161157.36261-1-berrange@redhat.com>
 <CAFn=p-btgUv5WKGOj0GyyU17vsOWkBT4_Xu=vzxsL7FH1dbjhw@mail.gmail.com>
 <YgIwObmUKckefAOR@redhat.com>
In-Reply-To: <YgIwObmUKckefAOR@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 8 Feb 2022 12:27:33 -0500
Message-ID: <CAFn=p-Y90WSfR72VeBmDLwLZAgYP02raoLr6LO3HXxcu4r_o5w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] python: a few improvements to qmp-shell
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f8190705d785089a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f8190705d785089a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 8, 2022, 3:56 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:

> On Mon, Feb 07, 2022 at 04:05:47PM -0500, John Snow wrote:
> > On Fri, Jan 28, 2022 at 11:12 AM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com>
> wrote:
> > >
> > > This makes the qmp-shell program a little more pleasant to use when y=
ou
> > > are just trying to spawn a throw-away QEMU process to query some info
> > > from.
> > >
> > > First it introduces a 'qmp-shell-wrap' command that takes a QEMU
> command
> > > line instead of QMP socket, and spawns QEMU automatically, so its lif=
e
> > > is tied to that of the shell.
> > >
> > > Second it adds ability to log QMP commands/responses to a file that c=
an
> > > be queried with 'jq' to extract information. This is good for command=
s
> > > which return huge JSON docs.
> > >
> > > In v3:
> > >
> > >  - Add qmp-shell-wrap to setup.cfg entry points
> > >
> > > In v2:
> > >
> > >  - Unlink unix socket path on exit
> > >  - Fix default command name
> > >  - Deal with flake8/pylint warnings
> > >
> > > Daniel P. Berrang=C3=A9 (2):
> > >   python: introduce qmp-shell-wrap convenience tool
> > >   python: support recording QMP session to a file
> > >
> > >  python/qemu/aqmp/qmp_shell.py | 88 ++++++++++++++++++++++++++++++++-=
--
> > >  python/setup.cfg              |  4 ++
> > >  scripts/qmp/qmp-shell-wrap    | 11 +++++
> > >  3 files changed, 96 insertions(+), 7 deletions(-)
> > >  create mode 100755 scripts/qmp/qmp-shell-wrap
> > >
> > > --
> > > 2.34.1
> > >
> > >
> >
> > Great, thanks! I rebased patch 1/2 myself as a courtesy and have staged
> these.
> >
> > --js
> >
> > (fwiw: using pip, it seems like the wrapper script works just fine. it
> > appears as though using 'python3 setup.py install' does indeed cause
> > issues here. I have a patch I'll send soon that discourages the direct
> > setup.py invocation to avoid frustration in the future.)
>
> I've only ever used  pip to install from pypi or remote git archives.
> How do you use it to install from your local git checkout
>

cd ~/src/qemu/python
pip install [-e] [--user] .

See python/README.rst:  https://gitlab.com/jsnow/qemu/-/tree/master/python

I've also sent a patch that disables the broken method (and explains why
it's broken), see

https://patchew.org/QEMU/20220207213039.2278569-1-jsnow@redhat.com/

thanks!
--js


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

--000000000000f8190705d785089a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Feb 8, 2022, 3:56 AM Daniel P. Berrang=C3=A9 &=
lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferr=
er">berrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">On Mon, Feb 07, 2022 at 04:05:47PM -0500, John Snow wrote:<br>
&gt; On Fri, Jan 28, 2022 at 11:12 AM Daniel P. Berrang=C3=A9 &lt;<a href=
=3D"mailto:berrange@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">berrange@redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; This makes the qmp-shell program a little more pleasant to use wh=
en you<br>
&gt; &gt; are just trying to spawn a throw-away QEMU process to query some =
info<br>
&gt; &gt; from.<br>
&gt; &gt;<br>
&gt; &gt; First it introduces a &#39;qmp-shell-wrap&#39; command that takes=
 a QEMU command<br>
&gt; &gt; line instead of QMP socket, and spawns QEMU automatically, so its=
 life<br>
&gt; &gt; is tied to that of the shell.<br>
&gt; &gt;<br>
&gt; &gt; Second it adds ability to log QMP commands/responses to a file th=
at can<br>
&gt; &gt; be queried with &#39;jq&#39; to extract information. This is good=
 for commands<br>
&gt; &gt; which return huge JSON docs.<br>
&gt; &gt;<br>
&gt; &gt; In v3:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 - Add qmp-shell-wrap to setup.cfg entry points<br>
&gt; &gt;<br>
&gt; &gt; In v2:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 - Unlink unix socket path on exit<br>
&gt; &gt;=C2=A0 - Fix default command name<br>
&gt; &gt;=C2=A0 - Deal with flake8/pylint warnings<br>
&gt; &gt;<br>
&gt; &gt; Daniel P. Berrang=C3=A9 (2):<br>
&gt; &gt;=C2=A0 =C2=A0python: introduce qmp-shell-wrap convenience tool<br>
&gt; &gt;=C2=A0 =C2=A0python: support recording QMP session to a file<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 python/qemu/aqmp/qmp_shell.py | 88 ++++++++++++++++++++++++=
++++++++---<br>
&gt; &gt;=C2=A0 python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 ++<br>
&gt; &gt;=C2=A0 scripts/qmp/qmp-shell-wrap=C2=A0 =C2=A0 | 11 +++++<br>
&gt; &gt;=C2=A0 3 files changed, 96 insertions(+), 7 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100755 scripts/qmp/qmp-shell-wrap<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; Great, thanks! I rebased patch 1/2 myself as a courtesy and have stage=
d these.<br>
&gt; <br>
&gt; --js<br>
&gt; <br>
&gt; (fwiw: using pip, it seems like the wrapper script works just fine. it=
<br>
&gt; appears as though using &#39;python3 setup.py install&#39; does indeed=
 cause<br>
&gt; issues here. I have a patch I&#39;ll send soon that discourages the di=
rect<br>
&gt; setup.py invocation to avoid frustration in the future.)<br>
<br>
I&#39;ve only ever used=C2=A0 pip to install from pypi or remote git archiv=
es.<br>
How do you use it to install from your local git checkout<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">cd ~/src/qemu/pyth=
on</div><div dir=3D"auto">pip install [-e] [--user] .</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">See python/README.rst:=C2=A0 <a href=3D"https=
://gitlab.com/jsnow/qemu/-/tree/master/python">https://gitlab.com/jsnow/qem=
u/-/tree/master/python</a></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I&#39;ve also sent a patch that disables the broken method (and explains=
 why it&#39;s broken), see</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><a href=3D"https://patchew.org/QEMU/20220207213039.2278569-1-jsnow@redha=
t.com/">https://patchew.org/QEMU/20220207213039.2278569-1-jsnow@redhat.com/=
</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">thanks!</div><d=
iv dir=3D"auto">--js</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer noreferrer=
" target=3D"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =
=C2=A0 <a href=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferre=
r noreferrer noreferrer" target=3D"_blank">https://www.flickr.com/photos/db=
errange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer noreferrer"=
 target=3D"_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-o-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138=
.berrange.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttps://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer nore=
ferrer" target=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=
=C2=A0 =C2=A0 <a href=3D"https://www.instagram.com/dberrange" rel=3D"norefe=
rrer noreferrer noreferrer" target=3D"_blank">https://www.instagram.com/dbe=
rrange</a> :|<br>
<br>
</blockquote></div></div></div>

--000000000000f8190705d785089a--


