Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F8479179
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 17:29:46 +0100 (CET)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myG77-00018b-26
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 11:29:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1myG5p-0000Be-8r
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 11:28:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1myG5l-0000pZ-Jz
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 11:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639758500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5U44A8+v1GVVjCZZEqZbRv3fvWmOHJ4XKta+nWQmiPg=;
 b=bvp2dYuEOsFs4Osgf/tykyFmrhLRn0m/KqmeityDh+aC5pYH1x2i/lzLrSwvB51Dgf0x2C
 iehrOJn5zVckxvXnk8UrN9M6sl9b5DX06+ziuSVj+eTQiQ9B1AJhP2j5YjH/GSgPxn0zZF
 Cj3TSRDm2iJq78ddNCykqDhBfIK8K8k=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-amyTgROgMQiIuv0T-YQRzQ-1; Fri, 17 Dec 2021 11:28:17 -0500
X-MC-Unique: amyTgROgMQiIuv0T-YQRzQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 x4-20020ab05ac4000000b002f713d873c4so1529205uae.9
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 08:28:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5U44A8+v1GVVjCZZEqZbRv3fvWmOHJ4XKta+nWQmiPg=;
 b=ryhBtorclb1HKbr4j7IR07jB/SyqKce3U+cPHiQ2ZmEDqkLgvrOZyjSIc2d83rhEDK
 7kDf09172csQzqw4iPr6b+VWrpQd4Wet+s6+Td2s1IKIrfcmIiPgVrXhUm6CS5kUPtck
 xGT4yUU7VMAs7a4Q0KPeL5TGLMpOy3K9H46UGUTzydubZphYirz9Z7uJ041rXfz7Hqe6
 y5uFoqztzvDNk6k/BUJeleYhojozfCMadTCwXGb8F/5LIwaiWvBXDM9pqCVwVGWrlNdG
 5DueH8SasBfGA2jO6cbDjIV+neoKuUaf8df4VYkSJJx2O+ODLv/9PfI16ohKknWd4Vun
 EaJA==
X-Gm-Message-State: AOAM530YVYmQfFrarsfzOIP+KFrdSYCWby/eZ8XT2rw1KwyP0EW8r9Mo
 KiTpEVPjaAI9MXqOjabuE8e189JV8KA3OEhspG4qEvbIl360qVb4DVV1QBfapvNlT0UBb4FjnXx
 THKl8PCLytFCcu951QTTFkYKq0q1tX1k=
X-Received: by 2002:a05:6102:c86:: with SMTP id
 f6mr1613537vst.38.1639758496555; 
 Fri, 17 Dec 2021 08:28:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoPp3eA4Xcx0DrIkfqTXCgJ/scAvf6cpXd3GsUyDnL1rxSIJuukZKfDG/X0S54vZ1HtQ5RWIlWpXVVq32rMjo=
X-Received: by 2002:a05:6102:c86:: with SMTP id
 f6mr1613527vst.38.1639758496353; 
 Fri, 17 Dec 2021 08:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-26-jsnow@redhat.com>
 <59b70dd8-cae7-4106-7ba3-ba0b6f74897d@virtuozzo.com>
 <CAFn=p-apQ=rocDVeAUCu_JJVAPV90H3uRemWv0ndEwOmKq6nMA@mail.gmail.com>
 <cbf2841c-dbd6-5284-b8a3-06b19b1c9f0a@virtuozzo.com>
In-Reply-To: <cbf2841c-dbd6-5284-b8a3-06b19b1c9f0a@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Dec 2021 11:28:05 -0500
Message-ID: <CAFn=p-bkVnUeAc=zEOUhZ8qqOLLR7TbOSrn6QDjHnvNnoP_W5Q@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] python: rename qemu.aqmp to qemu.qmp
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b1640305d35a0613"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

--000000000000b1640305d35a0613
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 17, 2021, 2:40 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 17.12.2021 00:10, John Snow wrote:
> >
> >
> > On Thu, Dec 16, 2021 at 6:41 AM Vladimir Sementsov-Ogievskiy <
> vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> >
> >     15.12.2021 22:39, John Snow wrote:
> >      > Now that we are fully switched over to the new QMP library, move
> it back
> >      > over the old namespace. This is being done primarily so that we
> may
> >      > upload this package simply as "qemu.qmp" without introducing
> confusion
> >      > over whether or not "aqmp" is a new protocol or not.
> >      >
> >      > The trade-off is increased confusion inside the QEMU developer
> >      > tree. Sorry!
> >      >
> >      > Signed-off-by: John Snow<jsnow@redhat.com <mailto:
> jsnow@redhat.com>>
> >
> >     Great job!
> >
> >     I looked thorough the patch, changes looks correct. Simply rename
> every aqmp / AQMP occurrence.. But:
> >
> >
> >     [root@kvm review]# git grep -i aqmp
> >     python/qemu/qmp/aqmp_tui.py:AQMP TUI
> >     python/qemu/qmp/aqmp_tui.py:AQMP TUI is an asynchronous interface
> built on top the of the AQMP library.
> >     python/qemu/qmp/aqmp_tui.py:Example Usage: aqmp-tui <SOCKET | TCP
> IP:PORT>
> >     python/qemu/qmp/aqmp_tui.py:Full Usage: aqmp-tui --help
> >     python/qemu/qmp/aqmp_tui.py:    Implements the AQMP TUI.
> >     python/qemu/qmp/aqmp_tui.py:    parser =
> argparse.ArgumentParser(description='AQMP TUI')
> >     python/qemu/qmp/legacy.py:        self._aqmp = QMPClient(nickname)
> >     python/qemu/qmp/legacy.py:        if self._aqmp.greeting is not None:
> >     python/qemu/qmp/legacy.py:            return
> self._aqmp.greeting._asdict()
> >     python/qemu/qmp/legacy.py:        self._aqmp.await_greeting =
> negotiate
> >     python/qemu/qmp/legacy.py:        self._aqmp.negotiate = negotiate
> >     python/qemu/qmp/legacy.py:
> self._aqmp.connect(self._address)
> >     python/qemu/qmp/legacy.py:        self._aqmp.await_greeting = True
> >     python/qemu/qmp/legacy.py:        self._aqmp.negotiate = True
> >     python/qemu/qmp/legacy.py:
> self._aqmp.accept(self._address),
> >     python/qemu/qmp/legacy.py:                self._aqmp._raw(qmp_cmd,
> assign_id=False),
> >     python/qemu/qmp/legacy.py:            self._aqmp.execute(cmd, kwds),
> >     python/qemu/qmp/legacy.py:            if self._aqmp.events.empty():
> >     python/qemu/qmp/legacy.py:                self._aqmp.events.get(),
> >     python/qemu/qmp/legacy.py:        events = [dict(x) for x in
> self._aqmp.events.clear()]
> >     python/qemu/qmp/legacy.py:        self._aqmp.events.clear()
> >     python/qemu/qmp/legacy.py:            self._aqmp.disconnect()
> >     python/qemu/qmp/legacy.py:        self._aqmp.send_fd_scm(fd)
> >     python/qemu/qmp/legacy.py:        if self._aqmp.runstate ==
> Runstate.IDLE:
> >     python/setup.cfg:# AQMP TUI dependencies
> >     python/setup.cfg:    aqmp-tui = qemu.qmp.aqmp_tui:main [tui]
> >     python/setup.cfg:[mypy-qemu.qmp.aqmp_tui]
> >
> >     [root@kvm review]# git ls-tree -r --name-only HEAD | grep -i aqmp
> >     python/qemu/qmp/aqmp_tui.py
> >
> >
> >     I think, this all should be renamed too
> >
> >
> > For aqmp_tui.py, sure. The new TUI isn't 100% ready to replace qmp-shell
> yet, so I wasn't entirely certain what to name it... qmp-tui?
> >
> > *shrugs*.
>
> I don't remember what tui is abbreviating) qmp-tui is OK, and it may be
> renamed to qmp-shell when it is ready to replace it..
>

"text user interface", by analogy with GUI (graphical UI).


> >
> > for legacy.py, it's just an internal variable name and I wasn't sure it
> was worth the churn just to change a private variable. I could still do it
> if you feel strongly about it.
> >
>
> I'd rename everything.
>

Alright, I'll do so in the respin.


>
> --
> Best regards,
> Vladimir
>

Thanks for the reviews!

>

--000000000000b1640305d35a0613
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Dec 17, 2021, 2:40 AM Vladimir Sementsov-Ogiev=
skiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsementsov@virtuozzo.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">17.12.2021 00:10,=
 John Snow wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Dec 16, 2021 at 6:41 AM Vladimir Sementsov-Ogievskiy &lt;<a hr=
ef=3D"mailto:vsementsov@virtuozzo.com" target=3D"_blank" rel=3D"noreferrer"=
>vsementsov@virtuozzo.com</a> &lt;mailto:<a href=3D"mailto:vsementsov@virtu=
ozzo.com" target=3D"_blank" rel=3D"noreferrer">vsementsov@virtuozzo.com</a>=
&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A015.12.2021 22:39, John Snow wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Now that we are fully switched over to the ne=
w QMP library, move it back<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; over the old namespace. This is being done pr=
imarily so that we may<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; upload this package simply as &quot;qemu.qmp&=
quot; without introducing confusion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; over whether or not &quot;aqmp&quot; is a new=
 protocol or not.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The trade-off is increased confusion inside t=
he QEMU developer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; tree. Sorry!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: John Snow&lt;<a href=3D"mailto=
:jsnow@redhat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a=
> &lt;mailto:<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"n=
oreferrer">jsnow@redhat.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Great job!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I looked thorough the patch, changes looks correct.=
 Simply rename every aqmp / AQMP occurrence.. But:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[root@kvm review]# git grep -i aqmp<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/aqmp_tui.py:AQMP TUI<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/aqmp_tui.py:AQMP TUI is an asynchro=
nous interface built on top the of the AQMP library.<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/aqmp_tui.py:Example Usage: aqmp-tui=
 &lt;SOCKET | TCP IP:PORT&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/aqmp_tui.py:Full Usage: aqmp-tui --=
help<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/aqmp_tui.py:=C2=A0 =C2=A0 Implement=
s the AQMP TUI.<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/aqmp_tui.py:=C2=A0 =C2=A0 parser =
=3D argparse.ArgumentParser(description=3D&#39;AQMP TUI&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._aqmp =3D QMPClient(nickname)<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if self._aqmp.greeting is not None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return self._aqmp.greeting._asdict()<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._aqmp.await_greeting =3D negotiate<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._aqmp.negotiate =3D negotiate<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 self._aqmp.connect(self._address)<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._aqmp.await_greeting =3D True<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._aqmp.negotiate =3D True<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 self._aqmp.accept(self._address),<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._aqmp._raw(qmp_cmd, assign_id=3DFalse)=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 self._aqmp.execute(cmd, kwds),<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if self._aqmp.events.empty():<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._aqmp.events.get(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 events =3D [dict(x) for x in self._aqmp.events.clear()]<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._aqmp.events.clear()<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 self._aqmp.disconnect()<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self._aqmp.send_fd_scm(fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/legacy.py:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if self._aqmp.runstate =3D=3D Runstate.IDLE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/setup.cfg:# AQMP TUI dependencies<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/setup.cfg:=C2=A0 =C2=A0 aqmp-tui =3D qemu.qm=
p.aqmp_tui:main [tui]<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/setup.cfg:[mypy-qemu.qmp.aqmp_tui]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[root@kvm review]# git ls-tree -r --name-only HEAD =
| grep -i aqmp<br>
&gt;=C2=A0 =C2=A0 =C2=A0python/qemu/qmp/aqmp_tui.py<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I think, this all should be renamed too<br>
&gt; <br>
&gt; <br>
&gt; For aqmp_tui.py, sure. The new TUI isn&#39;t 100% ready to replace qmp=
-shell yet, so I wasn&#39;t entirely certain what to name it... qmp-tui?<br=
>
&gt; <br>
&gt; *shrugs*.<br>
<br>
I don&#39;t remember what tui is abbreviating) qmp-tui is OK, and it may be=
 renamed to qmp-shell when it is ready to replace it..<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">&quot;text user inter=
face&quot;, by analogy with GUI (graphical UI).</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><br>
&gt; <br>
&gt; for legacy.py, it&#39;s just an internal variable name and I wasn&#39;=
t sure it was worth the churn just to change a private variable. I could st=
ill do it if you feel strongly about it.<br>
&gt; <br>
<br>
I&#39;d rename everything.<br></blockquote></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Alright, I&#39;ll do so in the respin.=C2=A0</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks for the reviews!</div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div></div>

--000000000000b1640305d35a0613--


