Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6EC478027
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:49:25 +0100 (CET)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxzYy-00039t-It
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:49:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxy1P-0001a0-Ia
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 16:10:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxy1M-0006ug-3d
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 16:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639689034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YFxhIPFD20BllQMENMF0cM3JQOC6XSU5EA+u/nxu9gM=;
 b=KlA1h10b4sqsuIOPigvVzkh+CqbUl9QHWUpLmfqmVecTGFoQWPnGjo24O8rG4LdFIVdIlF
 KtZP09rybg1dSQyudyne9J/vz5AFFXpvqQY/O3B8DE+YRo2Pm0ilF7wdO/orNISXFC0ad6
 G6f65bqkFjI//MpSv8VSDA+gN4t9QNk=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-ZCVALFuUN-OHRv3qjN_AFA-1; Thu, 16 Dec 2021 16:10:31 -0500
X-MC-Unique: ZCVALFuUN-OHRv3qjN_AFA-1
Received: by mail-ua1-f69.google.com with SMTP id
 y21-20020ab025d5000000b002d3ca52eab5so142624uan.22
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 13:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YFxhIPFD20BllQMENMF0cM3JQOC6XSU5EA+u/nxu9gM=;
 b=cjcVGplNggZoZq2Fz++rzML8fuYAuG4pktqWiSEwb7QV5ZHKV+MyNM6O0+vZaU6t7q
 ihZW7zo/IaWaw1dYCyzgnGeJQq+fq/QwO4KojI0ypfUNmzwg2TFatAldH+ob7DGaOnJ5
 Paqtqr14QeR/8R5WGmQ9nUniHECdVZSAU8WYXn3EEPzeZBrGRXFgSghJrlhH63GGixad
 pZmfKF0UXp22iSdXKqkssTjxGusXPPA9EBuho3fVHcuc1enr2Gifq5PBb7G2vy8OH/F/
 7q0HL7Q/JKrcemc5/hNzGdmyDUr6SgihIrtE86wzpZLuHuxWU3RZuaEbFMsNCFsxdfd+
 ZflQ==
X-Gm-Message-State: AOAM532+lYc8nEJR0gSF3SEnj9MyHce9H0SkKslDTvtHH9iRtFwGy8vb
 ni0O2b2Jxu/YHKZIcspgpZd2bFXRBh7oU1lNUw0l/wj6S6I6IUzT5DHx61zJ2F92G7enBkxgpDC
 qsZlqKBXJpjG28S4s8YxH6gg+QGhhMMU=
X-Received: by 2002:a67:441:: with SMTP id 62mr5911068vse.61.1639689030526;
 Thu, 16 Dec 2021 13:10:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUtUIcRhT1VLEnLSKIZBVUVWELinKqw9YPcbNhVLla3BEkmmhm0xOmcN8vIQY5cXNNNWGtOJQhb/2aSg8Fr5w=
X-Received: by 2002:a67:441:: with SMTP id 62mr5911057vse.61.1639689030349;
 Thu, 16 Dec 2021 13:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-26-jsnow@redhat.com>
 <59b70dd8-cae7-4106-7ba3-ba0b6f74897d@virtuozzo.com>
In-Reply-To: <59b70dd8-cae7-4106-7ba3-ba0b6f74897d@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 16:10:19 -0500
Message-ID: <CAFn=p-apQ=rocDVeAUCu_JJVAPV90H3uRemWv0ndEwOmKq6nMA@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] python: rename qemu.aqmp to qemu.qmp
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000324d3205d349da04"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000324d3205d349da04
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 6:41 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 15.12.2021 22:39, John Snow wrote:
> > Now that we are fully switched over to the new QMP library, move it back
> > over the old namespace. This is being done primarily so that we may
> > upload this package simply as "qemu.qmp" without introducing confusion
> > over whether or not "aqmp" is a new protocol or not.
> >
> > The trade-off is increased confusion inside the QEMU developer
> > tree. Sorry!
> >
> > Signed-off-by: John Snow<jsnow@redhat.com>
>
> Great job!
>
> I looked thorough the patch, changes looks correct. Simply rename every
> aqmp / AQMP occurrence.. But:
>
>
> [root@kvm review]# git grep -i aqmp
> python/qemu/qmp/aqmp_tui.py:AQMP TUI
> python/qemu/qmp/aqmp_tui.py:AQMP TUI is an asynchronous interface built on
> top the of the AQMP library.
> python/qemu/qmp/aqmp_tui.py:Example Usage: aqmp-tui <SOCKET | TCP IP:PORT>
> python/qemu/qmp/aqmp_tui.py:Full Usage: aqmp-tui --help
> python/qemu/qmp/aqmp_tui.py:    Implements the AQMP TUI.
> python/qemu/qmp/aqmp_tui.py:    parser =
> argparse.ArgumentParser(description='AQMP TUI')
> python/qemu/qmp/legacy.py:        self._aqmp = QMPClient(nickname)
> python/qemu/qmp/legacy.py:        if self._aqmp.greeting is not None:
> python/qemu/qmp/legacy.py:            return self._aqmp.greeting._asdict()
> python/qemu/qmp/legacy.py:        self._aqmp.await_greeting = negotiate
> python/qemu/qmp/legacy.py:        self._aqmp.negotiate = negotiate
> python/qemu/qmp/legacy.py:            self._aqmp.connect(self._address)
> python/qemu/qmp/legacy.py:        self._aqmp.await_greeting = True
> python/qemu/qmp/legacy.py:        self._aqmp.negotiate = True
> python/qemu/qmp/legacy.py:            self._aqmp.accept(self._address),
> python/qemu/qmp/legacy.py:                self._aqmp._raw(qmp_cmd,
> assign_id=False),
> python/qemu/qmp/legacy.py:            self._aqmp.execute(cmd, kwds),
> python/qemu/qmp/legacy.py:            if self._aqmp.events.empty():
> python/qemu/qmp/legacy.py:                self._aqmp.events.get(),
> python/qemu/qmp/legacy.py:        events = [dict(x) for x in
> self._aqmp.events.clear()]
> python/qemu/qmp/legacy.py:        self._aqmp.events.clear()
> python/qemu/qmp/legacy.py:            self._aqmp.disconnect()
> python/qemu/qmp/legacy.py:        self._aqmp.send_fd_scm(fd)
> python/qemu/qmp/legacy.py:        if self._aqmp.runstate == Runstate.IDLE:
> python/setup.cfg:# AQMP TUI dependencies
> python/setup.cfg:    aqmp-tui = qemu.qmp.aqmp_tui:main [tui]
> python/setup.cfg:[mypy-qemu.qmp.aqmp_tui]
>
> [root@kvm review]# git ls-tree -r --name-only HEAD | grep -i aqmp
> python/qemu/qmp/aqmp_tui.py
>
>
> I think, this all should be renamed too


For aqmp_tui.py, sure. The new TUI isn't 100% ready to replace qmp-shell
yet, so I wasn't entirely certain what to name it... qmp-tui?

*shrugs*.

for legacy.py, it's just an internal variable name and I wasn't sure it was
worth the churn just to change a private variable. I could still do it if
you feel strongly about it.

--js

--000000000000324d3205d349da04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 6:41 AM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">15.12.2021 22:39, John Snow wrote:<br>
&gt; Now that we are fully switched over to the new QMP library, move it ba=
ck<br>
&gt; over the old namespace. This is being done primarily so that we may<br=
>
&gt; upload this package simply as &quot;qemu.qmp&quot; without introducing=
 confusion<br>
&gt; over whether or not &quot;aqmp&quot; is a new protocol or not.<br>
&gt; <br>
&gt; The trade-off is increased confusion inside the QEMU developer<br>
&gt; tree. Sorry!<br>
&gt; <br>
&gt; Signed-off-by: John Snow&lt;<a href=3D"mailto:jsnow@redhat.com" target=
=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Great job!<br>
<br>
I looked thorough the patch, changes looks correct. Simply rename every aqm=
p / AQMP occurrence.. But:<br>
<br>
<br>
[root@kvm review]# git grep -i aqmp<br>
python/qemu/qmp/aqmp_tui.py:AQMP TUI<br>
python/qemu/qmp/aqmp_tui.py:AQMP TUI is an asynchronous interface built on =
top the of the AQMP library.<br>
python/qemu/qmp/aqmp_tui.py:Example Usage: aqmp-tui &lt;SOCKET | TCP IP:POR=
T&gt;<br>
python/qemu/qmp/aqmp_tui.py:Full Usage: aqmp-tui --help<br>
python/qemu/qmp/aqmp_tui.py:=C2=A0 =C2=A0 Implements the AQMP TUI.<br>
python/qemu/qmp/aqmp_tui.py:=C2=A0 =C2=A0 parser =3D argparse.ArgumentParse=
r(description=3D&#39;AQMP TUI&#39;)<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._aqmp =3D QMPCli=
ent(nickname)<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._aqmp.greetin=
g is not None:<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
self._aqmp.greeting._asdict()<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._aqmp.await_gree=
ting =3D negotiate<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._aqmp.negotiate =
=3D negotiate<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._a=
qmp.connect(self._address)<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._aqmp.await_gree=
ting =3D True<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._aqmp.negotiate =
=3D True<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._a=
qmp.accept(self._address),<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self._aqmp._raw(qmp_cmd, assign_id=3DFalse),<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._a=
qmp.execute(cmd, kwds),<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self=
._aqmp.events.empty():<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self._aqmp.events.get(),<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 events =3D [dict(x) f=
or x in self._aqmp.events.clear()]<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._aqmp.events.cle=
ar()<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._a=
qmp.disconnect()<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._aqmp.send_fd_sc=
m(fd)<br>
python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._aqmp.runstat=
e =3D=3D Runstate.IDLE:<br>
python/setup.cfg:# AQMP TUI dependencies<br>
python/setup.cfg:=C2=A0 =C2=A0 aqmp-tui =3D qemu.qmp.aqmp_tui:main [tui]<br=
>
python/setup.cfg:[mypy-qemu.qmp.aqmp_tui]<br>
<br>
[root@kvm review]# git ls-tree -r --name-only HEAD | grep -i aqmp<br>
python/qemu/qmp/aqmp_tui.py<br>
<br>
<br>
I think, this all should be renamed too</blockquote><div><br></div><div>For=
 aqmp_tui.py, sure. The new TUI isn&#39;t 100% ready to replace qmp-shell y=
et, so I wasn&#39;t entirely certain what to name it... qmp-tui?</div><div>=
<br></div><div>*shrugs*.</div><div><br></div><div>for legacy.py, it&#39;s j=
ust an internal variable name and I wasn&#39;t sure it was worth the churn =
just to change a private variable. I could still do it if you feel strongly=
 about it.</div><div><br></div><div>--js<br></div></div></div>

--000000000000324d3205d349da04--


