Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF884240BB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:04:29 +0200 (CEST)
Received: from localhost ([::1]:35680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8T6-0005BZ-7D
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mY8Qi-0004J6-R5
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mY8Qb-0007B7-9O
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633532512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xmqe1yTVpU/fvDT0GdU+6Juvr0//INNKNxiN8c0Ln8I=;
 b=Hpieowr06o0P/kQ/2scqQkVvDWg4ge9dolbst2xZnWuZxUkSyQI53rpaPCVVT6LXCP4ZvW
 BsotwBfjSAphFoUdhrGxiaAgtdGKVOsIhLrSvcd8V+/lj1zf97vNpKBnCilb+pc8vL/qJ/
 OpmqsA1tRFPRCLVDWEwy7QyW675QvE0=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-6pod0NGqPf2r8DeRAZC7pQ-1; Wed, 06 Oct 2021 11:01:47 -0400
X-MC-Unique: 6pod0NGqPf2r8DeRAZC7pQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 62-20020a670841000000b002d7fb639041so319833vsi.11
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xmqe1yTVpU/fvDT0GdU+6Juvr0//INNKNxiN8c0Ln8I=;
 b=LHX6C4waaLPHbRCJ8CgfIqt2gf3kxGfKjv2wjnL9+UZwJs1uCCyktUK8MUFyyhu+n7
 3OSIDZRBGKhEAtROEWChbBkiUFmSD/QWx5wZ+ftJOltF5mJFDF8L4zSZIfMgyHRP76Jm
 AFJNxY8sYIm4e1xvlE41tR1lEFporB4sOXmcW5+YUe9o10opYqCLZc1nk1Ne8ou4T5fI
 CInUxTdsEQsXaT3ML08LV+p4JTQV2sp6ea0gLh2aUFO5Kh3+Rva6B8jnwo0EBOmQ/un/
 n8nWmfvCKKVWwrXEp4umH2c9/shCNMJtiubEH5bQHgb3UyB4W5g1IY636sd3UVh2++j/
 Tibw==
X-Gm-Message-State: AOAM532n1ycifW/ch9+IiXpbboWObD3XV3pdTWb1sL/h0fRl2n1imI66
 uJw9oZ5QoCSyTr4V/lA/YbuigZxLKE8jV7sZ5AQOLzvHzbhcZlVbOp/xDRVWbdUvt9kziJ0xe4X
 /2GiQ0eacyYx1z+QTPI+McOJBWVT0RSU=
X-Received: by 2002:a67:f685:: with SMTP id n5mr25128139vso.31.1633532506621; 
 Wed, 06 Oct 2021 08:01:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrCcA4yu6Q2oZFpuY8qomYxPqqYHq2Dzskaiwmh61tKmoFuJPQMlN6hJyr630Y1Mql4kcc2UWpaJrYzhgEkh4=
X-Received: by 2002:a67:f685:: with SMTP id n5mr25128112vso.31.1633532506397; 
 Wed, 06 Oct 2021 08:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <d480430f-4e46-e4a5-32c2-8e90d97d8461@redhat.com>
In-Reply-To: <d480430f-4e46-e4a5-32c2-8e90d97d8461@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 6 Oct 2021 11:01:35 -0400
Message-ID: <CAFn=p-aY0jB_6cJ28hac_DKZz+aehVz302DCCOO2em3rjVo8jA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] Switch iotests to using Async QMP
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c5efd105cdb06cef"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c5efd105cdb06cef
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 6:14 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 23/09/21 02:49, John Snow wrote:
> > Based-on: <20210915162955.333025-1-jsnow@redhat.com>
> >            [PATCH v4 00/27] python: introduce Asynchronous QMP package
> > GitLab:
> https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper
> > CI: https://gitlab.com/jsnow/qemu/-/pipelines/375637927
> >
> > Hiya,
> >
> > This series continues where the first AQMP series left off and adds a
> > synchronous 'legacy' wrapper around the new AQMP interface, then drops
> > it straight into iotests to prove that AQMP is functional and totally
> > cool and fine. The disruption and churn to iotests is extremely minimal.
> > (There's actually a net negative SLOC in tests/qemu-iotests.)
> >
> > In the event that a regression happens and I am not physically proximate
> > to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variable
> > to any non-empty string as it pleases you to engage the QMP machinery
> > you are used to.
> >
> > I'd like to try and get this committed early in the 6.2 development
> > cycle to give ample time to smooth over any possible regressions. I've
> > tested it locally and via gitlab CI, across Python versions 3.6 through
> > 3.10, and "worksforme". If something bad happens, we can revert the
> > actual switch-flip very trivially.
> >
> > Layout:
> >
> > Patches 1-7: ./python/qemu/aqmp changes that serve as pre-requisites.
> > Patches 8-12: other ./python changes that ease the transition.
> > Patches 13-14: iotest changes to support the new QMP backend.
> > Patches 15-17: Make the switch.
> >
> > V2:
> >
> > 001/17:[----] [--] 'python/aqmp: add greeting property to QMPClient'
> > 002/17:[----] [--] 'python/aqmp: add .empty() method to EventListener'
> > 003/17:[----] [--] 'python/aqmp: Return cleared events from
> EventListener.clear()'
> > 004/17:[0007] [FC] 'python/aqmp: add send_fd_scm'
> > 005/17:[down] 'python/aqmp: Add dict conversion method to Greeting
> object'
> > 006/17:[down] 'python/aqmp: Reduce severity of EOFError-caused loop
> terminations'
> > 007/17:[down] 'python/aqmp: Disable logging messages by default'
> >
> > 008/17:[0002] [FC] 'python/qmp: clear events on get_events() call'
> > 009/17:[----] [--] 'python/qmp: add send_fd_scm directly to
> QEMUMonitorProtocol'
> > 010/17:[----] [--] 'python, iotests: remove socket_scm_helper'
> > 011/17:[0013] [FC] 'python/machine: remove has_quit argument'
> > 012/17:[down] 'python/machine: Handle QMP errors on close more
> meticulously'
> >
> > 013/17:[0009] [FC] 'iotests: Accommodate async QMP Exception classes'
> > 014/17:[down] 'iotests: Conditionally silence certain AQMP errors'
> >
> > 015/17:[0016] [FC] 'python/aqmp: Create sync QMP wrapper for iotests'
> > 016/17:[0002] [FC] 'python/aqmp: Remove scary message'
> > 017/17:[----] [--] 'python, iotests: replace qmp with aqmp'
> >
> > - Rebased on jsnow/python, which was recently rebased on origin/master.
> > - Make aqmp's send_fd_scm method bark if the socket isn't AF_UNIX (Hanna)
> > - Uh... modify send_fd_scm so it doesn't break when Python 3.11 comes
> out ...
> >    See the commit message for more detail.
> > - Drop the "python/aqmp: Create MessageModel and StandaloneModel class"
> >    patch and replace with a far simpler method that just adds an
> >    _asdict() method.
> > - Add patches 06 and 07 to change how the AQMP library handles logging.
> > - Adjust docstring in patch 08 (Hanna)
> > - Rename "_has_quit" attribute to "_quid_issued" (Hanna)
> > - Renamed patch 12, simplified the logic in _soft_shutdown a tiny bit.
> > - Fixed bad exception handling logic in 13 (Hanna)
> > - Introduce a helper in patch 14 to silence log output when it's
> unwanted.
> > - Small addition of _get_greeting() helper in patch 15, coinciding with
> the
> >    new patch 05 here.
> > - Contextual changes in 16.
> >
> > John Snow (17):
> >    python/aqmp: add greeting property to QMPClient
> >    python/aqmp: add .empty() method to EventListener
> >    python/aqmp: Return cleared events from EventListener.clear()
> >    python/aqmp: add send_fd_scm
> >    python/aqmp: Add dict conversion method to Greeting object
> >    python/aqmp: Reduce severity of EOFError-caused loop terminations
> >    python/aqmp: Disable logging messages by default
> >    python/qmp: clear events on get_events() call
> >    python/qmp: add send_fd_scm directly to QEMUMonitorProtocol
> >    python, iotests: remove socket_scm_helper
> >    python/machine: remove has_quit argument
> >    python/machine: Handle QMP errors on close more meticulously
> >    iotests: Accommodate async QMP Exception classes
> >    iotests: Conditionally silence certain AQMP errors
> >    python/aqmp: Create sync QMP wrapper for iotests
> >    python/aqmp: Remove scary message
> >    python, iotests: replace qmp with aqmp
> >
> >   tests/qemu-iotests/socket_scm_helper.c    | 136 ----------------------
> >   python/qemu/aqmp/__init__.py              |  14 +--
> >   python/qemu/aqmp/events.py                |  15 ++-
> >   python/qemu/aqmp/legacy.py                | 135 +++++++++++++++++++++
> >   python/qemu/aqmp/models.py                |  13 +++
> >   python/qemu/aqmp/protocol.py              |   7 +-
> >   python/qemu/aqmp/qmp_client.py            |  27 +++++
> >   python/qemu/machine/machine.py            | 133 +++++++++++----------
> >   python/qemu/machine/qtest.py              |   2 -
> >   python/qemu/qmp/__init__.py               |  27 +++--
> >   python/qemu/qmp/qmp_shell.py              |   1 -
> >   scripts/simplebench/bench_block_job.py    |   3 +-
> >   tests/Makefile.include                    |   1 -
> >   tests/meson.build                         |   4 -
> >   tests/qemu-iotests/040                    |   7 +-
> >   tests/qemu-iotests/218                    |   2 +-
> >   tests/qemu-iotests/255                    |   2 +-
> >   tests/qemu-iotests/iotests.py             |  23 +++-
> >   tests/qemu-iotests/meson.build            |   5 -
> >   tests/qemu-iotests/testenv.py             |   8 +-
> >   tests/qemu-iotests/tests/mirror-top-perms |  12 +-
> >   21 files changed, 315 insertions(+), 262 deletions(-)
> >   delete mode 100644 tests/qemu-iotests/socket_scm_helper.c
> >   create mode 100644 python/qemu/aqmp/legacy.py
> >   delete mode 100644 tests/qemu-iotests/meson.build
> >
>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
> apart from the name nit in patch 15.  I would really like this to go in
> and get rid of socket_scm_helper.c!
>
> Paolo
>
>
Got a thumbs up from Hanna on IRC to stage patches 1-10 myself. I'll leave
patches 11-17 for further scrutiny.

so, patches 1-10: staged to my Python branch.

https://gitlab.com/jsnow/qemu/-/commits/python

thanks!

--js

--000000000000c5efd105cdb06cef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 6, 2021 at 6:14 AM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 23/09/21 02:49, John Snow wrote:<br>
&gt; Based-on: &lt;<a href=3D"mailto:20210915162955.333025-1-jsnow@redhat.c=
om" target=3D"_blank">20210915162955.333025-1-jsnow@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [PATCH v4 00/27] python: intr=
oduce Asynchronous QMP package<br>
&gt; GitLab: <a href=3D"https://gitlab.com/jsnow/qemu/-/commits/python-aqmp=
-iotest-wrapper" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/js=
now/qemu/-/commits/python-aqmp-iotest-wrapper</a><br>
&gt; CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/375637927" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipeline=
s/375637927</a><br>
&gt; <br>
&gt; Hiya,<br>
&gt; <br>
&gt; This series continues where the first AQMP series left off and adds a<=
br>
&gt; synchronous &#39;legacy&#39; wrapper around the new AQMP interface, th=
en drops<br>
&gt; it straight into iotests to prove that AQMP is functional and totally<=
br>
&gt; cool and fine. The disruption and churn to iotests is extremely minima=
l.<br>
&gt; (There&#39;s actually a net negative SLOC in tests/qemu-iotests.)<br>
&gt; <br>
&gt; In the event that a regression happens and I am not physically proxima=
te<br>
&gt; to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variabl=
e<br>
&gt; to any non-empty string as it pleases you to engage the QMP machinery<=
br>
&gt; you are used to.<br>
&gt; <br>
&gt; I&#39;d like to try and get this committed early in the 6.2 developmen=
t<br>
&gt; cycle to give ample time to smooth over any possible regressions. I&#3=
9;ve<br>
&gt; tested it locally and via gitlab CI, across Python versions 3.6 throug=
h<br>
&gt; 3.10, and &quot;worksforme&quot;. If something bad happens, we can rev=
ert the<br>
&gt; actual switch-flip very trivially.<br>
&gt; <br>
&gt; Layout:<br>
&gt; <br>
&gt; Patches 1-7: ./python/qemu/aqmp changes that serve as pre-requisites.<=
br>
&gt; Patches 8-12: other ./python changes that ease the transition.<br>
&gt; Patches 13-14: iotest changes to support the new QMP backend.<br>
&gt; Patches 15-17: Make the switch.<br>
&gt; <br>
&gt; V2:<br>
&gt; <br>
&gt; 001/17:[----] [--] &#39;python/aqmp: add greeting property to QMPClien=
t&#39;<br>
&gt; 002/17:[----] [--] &#39;python/aqmp: add .empty() method to EventListe=
ner&#39;<br>
&gt; 003/17:[----] [--] &#39;python/aqmp: Return cleared events from EventL=
istener.clear()&#39;<br>
&gt; 004/17:[0007] [FC] &#39;python/aqmp: add send_fd_scm&#39;<br>
&gt; 005/17:[down] &#39;python/aqmp: Add dict conversion method to Greeting=
 object&#39;<br>
&gt; 006/17:[down] &#39;python/aqmp: Reduce severity of EOFError-caused loo=
p terminations&#39;<br>
&gt; 007/17:[down] &#39;python/aqmp: Disable logging messages by default&#3=
9;<br>
&gt; <br>
&gt; 008/17:[0002] [FC] &#39;python/qmp: clear events on get_events() call&=
#39;<br>
&gt; 009/17:[----] [--] &#39;python/qmp: add send_fd_scm directly to QEMUMo=
nitorProtocol&#39;<br>
&gt; 010/17:[----] [--] &#39;python, iotests: remove socket_scm_helper&#39;=
<br>
&gt; 011/17:[0013] [FC] &#39;python/machine: remove has_quit argument&#39;<=
br>
&gt; 012/17:[down] &#39;python/machine: Handle QMP errors on close more met=
iculously&#39;<br>
&gt; <br>
&gt; 013/17:[0009] [FC] &#39;iotests: Accommodate async QMP Exception class=
es&#39;<br>
&gt; 014/17:[down] &#39;iotests: Conditionally silence certain AQMP errors&=
#39;<br>
&gt; <br>
&gt; 015/17:[0016] [FC] &#39;python/aqmp: Create sync QMP wrapper for iotes=
ts&#39;<br>
&gt; 016/17:[0002] [FC] &#39;python/aqmp: Remove scary message&#39;<br>
&gt; 017/17:[----] [--] &#39;python, iotests: replace qmp with aqmp&#39;<br=
>
&gt; <br>
&gt; - Rebased on jsnow/python, which was recently rebased on origin/master=
.<br>
&gt; - Make aqmp&#39;s send_fd_scm method bark if the socket isn&#39;t AF_U=
NIX (Hanna)<br>
&gt; - Uh... modify send_fd_scm so it doesn&#39;t break when Python 3.11 co=
mes out ...<br>
&gt;=C2=A0 =C2=A0 See the commit message for more detail.<br>
&gt; - Drop the &quot;python/aqmp: Create MessageModel and StandaloneModel =
class&quot;<br>
&gt;=C2=A0 =C2=A0 patch and replace with a far simpler method that just add=
s an<br>
&gt;=C2=A0 =C2=A0 _asdict() method.<br>
&gt; - Add patches 06 and 07 to change how the AQMP library handles logging=
.<br>
&gt; - Adjust docstring in patch 08 (Hanna)<br>
&gt; - Rename &quot;_has_quit&quot; attribute to &quot;_quid_issued&quot; (=
Hanna)<br>
&gt; - Renamed patch 12, simplified the logic in _soft_shutdown a tiny bit.=
<br>
&gt; - Fixed bad exception handling logic in 13 (Hanna)<br>
&gt; - Introduce a helper in patch 14 to silence log output when it&#39;s u=
nwanted.<br>
&gt; - Small addition of _get_greeting() helper in patch 15, coinciding wit=
h the<br>
&gt;=C2=A0 =C2=A0 new patch 05 here.<br>
&gt; - Contextual changes in 16.<br>
&gt; <br>
&gt; John Snow (17):<br>
&gt;=C2=A0 =C2=A0 python/aqmp: add greeting property to QMPClient<br>
&gt;=C2=A0 =C2=A0 python/aqmp: add .empty() method to EventListener<br>
&gt;=C2=A0 =C2=A0 python/aqmp: Return cleared events from EventListener.cle=
ar()<br>
&gt;=C2=A0 =C2=A0 python/aqmp: add send_fd_scm<br>
&gt;=C2=A0 =C2=A0 python/aqmp: Add dict conversion method to Greeting objec=
t<br>
&gt;=C2=A0 =C2=A0 python/aqmp: Reduce severity of EOFError-caused loop term=
inations<br>
&gt;=C2=A0 =C2=A0 python/aqmp: Disable logging messages by default<br>
&gt;=C2=A0 =C2=A0 python/qmp: clear events on get_events() call<br>
&gt;=C2=A0 =C2=A0 python/qmp: add send_fd_scm directly to QEMUMonitorProtoc=
ol<br>
&gt;=C2=A0 =C2=A0 python, iotests: remove socket_scm_helper<br>
&gt;=C2=A0 =C2=A0 python/machine: remove has_quit argument<br>
&gt;=C2=A0 =C2=A0 python/machine: Handle QMP errors on close more meticulou=
sly<br>
&gt;=C2=A0 =C2=A0 iotests: Accommodate async QMP Exception classes<br>
&gt;=C2=A0 =C2=A0 iotests: Conditionally silence certain AQMP errors<br>
&gt;=C2=A0 =C2=A0 python/aqmp: Create sync QMP wrapper for iotests<br>
&gt;=C2=A0 =C2=A0 python/aqmp: Remove scary message<br>
&gt;=C2=A0 =C2=A0 python, iotests: replace qmp with aqmp<br>
&gt; <br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/socket_scm_helper.c=C2=A0 =C2=A0 | 136 =
----------------------<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +--<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/events.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 ++-<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/legacy.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 135 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/models.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +++<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/protocol.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/qmp_client.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 27 +++++<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/machine.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 133 +++++++++++----------<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/qtest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
&gt;=C2=A0 =C2=A0python/qemu/qmp/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 27 +++--<br>
&gt;=C2=A0 =C2=A0python/qemu/qmp/qmp_shell.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 =C2=A0scripts/simplebench/bench_block_job.py=C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0tests/Makefile.include=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 =C2=A0tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 -<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/040=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/218=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/255=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/iotests.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 23 +++-<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A05 -<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/testenv.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/tests/mirror-top-perms |=C2=A0 12 +-<br=
>
&gt;=C2=A0 =C2=A021 files changed, 315 insertions(+), 262 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 tests/qemu-iotests/socket_scm_helper.c<=
br>
&gt;=C2=A0 =C2=A0create mode 100644 python/qemu/aqmp/legacy.py<br>
&gt;=C2=A0 =C2=A0delete mode 100644 tests/qemu-iotests/meson.build<br>
&gt; <br>
<br>
Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targe=
t=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
<br>
apart from the name nit in patch 15.=C2=A0 I would really like this to go i=
n <br>
and get rid of socket_scm_helper.c!<br>
<br>
Paolo<br>
<br></blockquote><div><br></div><div>Got a thumbs up from Hanna on IRC to s=
tage patches 1-10 myself. I&#39;ll leave patches 11-17 for further scrutiny=
.</div><div><br></div><div>so, patches 1-10: staged to my Python branch.</d=
iv><div><br></div><div><a href=3D"https://gitlab.com/jsnow/qemu/-/commits/p=
ython">https://gitlab.com/jsnow/qemu/-/commits/python</a></div><div><br></d=
iv><div>thanks!</div><div><br></div><div>--js<br></div></div></div>

--000000000000c5efd105cdb06cef--


