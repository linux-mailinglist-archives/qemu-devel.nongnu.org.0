Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5D454C9E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:57:36 +0100 (CET)
Received: from localhost ([::1]:38646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPBe-0001X4-Od
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:57:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnPAX-0000FF-99
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:56:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnPAS-0003PH-Tg
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637171780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6VBNtvGM9oP0cVHl8yeVfL1RCzjiLl6vcouBfPfxRM=;
 b=OswRcmeDtFYGfRU+5Z30ZGFSj9kQI2PHj1PGXf39dRa/5hNPLbCy/egvNDtUCrMb8PTX7g
 rqApjz0O312iqabTrq82KgqR3xQcrIIbheXOkqWpmJMlkZemg5TAqopUAkRzbPReI0mc3N
 gcFO1CV4cx5+S/kM5ZQpX4mo/qsmQVM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-rySeBP49OiWAYWxngg_S0g-1; Wed, 17 Nov 2021 12:56:16 -0500
X-MC-Unique: rySeBP49OiWAYWxngg_S0g-1
Received: by mail-vk1-f197.google.com with SMTP id
 c13-20020a05612214ad00b002faaab61b03so1705356vkq.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H6VBNtvGM9oP0cVHl8yeVfL1RCzjiLl6vcouBfPfxRM=;
 b=jItdulj6xoH3PXfe38ds3dKu+fQ6WO/eStCMgB6CJeEu26cJCwbTZ0kW7JiQVVvUJ3
 mv9Qi8951iJHbJ36XFIWlklxy6PzvbdsavIwofCZQPOVhG6MzHztWEJp2P2XGW5U4gqA
 xueKnQU7AgYtmQPrnJSdvhq0bplWveMPkgmsJKkerD6gQRq50sE47lniDOvP7EtTDY91
 EmtV5OxhUhq47mDexbbcm7x2BDZNtW0RbR2WrtfnWboXvlKwQmpFvhuciuvQBM6ixDa7
 70pwMhJiaVjQV9pT5nRQzJdeGbEG433vsEO5/lZW/u3MeGaH81zKAIJjwPNsGv8UJZh3
 fSOw==
X-Gm-Message-State: AOAM532JZe+ZGr6sZL8R8wWd5UNujuHZRXuyBkTIiAycYnRSSqeuj3eH
 CWLP3RF8cd7KUaTQTJByoKr5A8wLQfKrAV6V8xmAASuwWEa/2VysRZGp1X1haxVvoZ0CPtWhoAv
 GuFr88LI12lDsitYmTRW2gEYzAG1a6oY=
X-Received: by 2002:ab0:2b96:: with SMTP id q22mr26790165uar.87.1637171776212; 
 Wed, 17 Nov 2021 09:56:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoKa94jLJhpTYEzcn6KaAylC+4vgYgMXwHZcPr1yQaup0aN6XFL70Xvu2FnybOVdxEeaA5cQBrknLiq4OXz2g=
X-Received: by 2002:ab0:2b96:: with SMTP id q22mr26790102uar.87.1637171775954; 
 Wed, 17 Nov 2021 09:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20211117003317.2844087-1-jsnow@redhat.com>
 <20211117094157.cef4x5jdsddd3hfy@sirius.home.kraxel.org>
In-Reply-To: <20211117094157.cef4x5jdsddd3hfy@sirius.home.kraxel.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 17 Nov 2021 12:56:05 -0500
Message-ID: <CAFn=p-Y-dxRLrvEwz1M=HgPumQqwzUSHe1UTy-H_9D8PuCv0xg@mail.gmail.com>
Subject: Re: [PULL 0/5] Python patches
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000024716505d0ffc21a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000024716505d0ffc21a
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 4:42 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> >   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> What is the status of the plan to upload this to pypi eventually?
>
>
Thanks for asking!

The honest answer is "I'm not exactly sure", but there are a few things to
work out still. Let me use this as an opportunity to try and give you an
honest answer.
We've got four packages right now: qmp, aqmp, machine and utils.

- I don't intend to *ever* upload utils, I created that one specifically as
an in-tree package for "low quality" code that we just need as glue.
- aqmp is brand new. It was moved as the default provider for the QMP
protocol in the tree (being used by machine.py) only two weeks ago. I am
using this current RC testing phase to find any problems with it.
- qmp is something I want to deprecate, I don't intend to upload it to
PyPI. I intend to rename aqmp -> qmp and have just the one qmp package. I
can't do this until next release, and only after we are confident and happy
that aqmp is stable enough.
- machine has a few problems with it. I am reluctant to upload it in its
current form. I am actively developing a new version of it that uses the
new Async QMP module. However, this might take a bit of time, I fear.

So, I think I have this timeline for myself:

- Fix bugs in AQMP package revealed during RC testing
- Introduce sync wrapper for AQMP that resembles the native AQMP interface
more than it resembles the "legacy QMP" interface.
- Remove all QEMU source tree uses of qemu.qmp and qemu.aqmp.legacy.
- Delete qemu.qmp and rename qemu.aqmp to qemu.qmp.
- Split python/qemu/qmp out into its own repository and begin uploading it
to PyPI, as a test. (Do not delete python/qemu/qmp yet at this phase.)
- Transition any users of the Python packages in the QEMU source tree to
installing the QMP dependency from PyPI instead of grabbing it from the
tree.
- Delete python/qemu/qmp from the QEMU source tree at this moment;
"re-fork" the package if necessary to collect any commits since the "test
split" procedure.


Some questions to work out:
- What tools should be uploaded with qemu.qmp? a version of qmp-shell is
high on the list for me. qom, qom-set, qom-get, qom-list, qom-tree,
qom-fuse etc I am suspecting might be better left behind in qemu.utils
instead, though. I am not sure I want to support those more broadly. They
weren't designed for "external consumption".
- qemu-ga-client should be moved over into utils, or possibly even deleted
-- it hasn't seen a lot of love and I doubt there are any users. I don't
have the bandwidth to refurbish it for no users. Maybe if there's a demand
in the future ...


... This might be being overcautious, though. Perhaps I can upload a
version of "qemu.aqmp" even this week just as a demonstration of how it
would work.

Happy to take suggestions/feedback on this process.

--js

--00000000000024716505d0ffc21a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 4:42 AM Gerd Hoff=
mann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi,<b=
r>
<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/jsnow/qemu.git" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.com/jsnow/qemu.git</a> tags/python-=
pull-request<br>
<br>
What is the status of the plan to upload this to pypi eventually?<br>
<br></blockquote><div><br></div><div>Thanks for asking!</div><div><br></div=
><div>The honest answer is &quot;I&#39;m not exactly sure&quot;, but there =
are a few things to work out still. Let me use this as an opportunity to tr=
y and give you an honest answer.<br></div><div>We&#39;ve got four packages =
right now: qmp, aqmp, machine and utils.<br><br>- I don&#39;t intend to *ev=
er* upload utils, I created that one specifically as an in-tree package for=
 &quot;low quality&quot; code that we just need as glue.</div><div>- aqmp i=
s brand new. It was moved as the default provider for the QMP protocol in t=
he tree (being used by machine.py) only two weeks ago. I am using this curr=
ent RC testing phase to find any problems with it.</div><div>- qmp is somet=
hing I want to deprecate, I don&#39;t intend to upload it to PyPI. I intend=
 to rename aqmp -&gt; qmp and have just the one qmp package. I can&#39;t do=
 this until next release, and only after we are confident and happy that aq=
mp is stable enough.</div><div>- machine has a few problems with it. I am r=
eluctant to upload it in its current form. I am actively developing a new v=
ersion of it that uses the new Async QMP module. However, this might take a=
 bit of time, I fear.<br></div><div><br></div><div>So, I think I have this =
timeline for myself:<br><br></div><div>- Fix bugs in AQMP package revealed =
during RC testing<br></div><div>- Introduce sync wrapper for AQMP that rese=
mbles the native AQMP interface more than it resembles the &quot;legacy QMP=
&quot; interface.</div><div>- Remove all QEMU source tree uses of qemu.qmp =
and qemu.aqmp.legacy.</div><div>- Delete qemu.qmp and rename qemu.aqmp to q=
emu.qmp.</div><div>- Split python/qemu/qmp out into its own repository and =
begin uploading it to PyPI, as a test. (Do not delete python/qemu/qmp yet a=
t this phase.)<br></div><div>- Transition any users of the Python packages =
in the QEMU source tree to installing the QMP dependency from PyPI instead =
of grabbing it from the tree.</div><div>- Delete python/qemu/qmp from the Q=
EMU source tree at this moment; &quot;re-fork&quot; the package if necessar=
y to collect any commits since the &quot;test split&quot; procedure.<br></d=
iv><div><br></div><div><br></div><div>Some questions to work out:<br></div>=
<div>- What tools should be uploaded with qemu.qmp? a version of qmp-shell =
is high on the list for me. qom, qom-set, qom-get, qom-list, qom-tree, qom-=
fuse etc I am suspecting might be better left behind in qemu.utils instead,=
 though. I am not sure I want to support those more broadly. They weren&#39=
;t designed for &quot;external consumption&quot;.</div><div>- qemu-ga-clien=
t should be moved over into utils, or possibly even deleted -- it hasn&#39;=
t seen a lot of love and I doubt there are any users. I don&#39;t have the =
bandwidth to refurbish it for no users. Maybe if there&#39;s a demand in th=
e future ...</div><div><br></div><div><br></div></div><div class=3D"gmail_q=
uote">... This might be being overcautious, though. Perhaps I can upload a =
version of &quot;qemu.aqmp&quot; even this week just as a demonstration of =
how it would work.<br><br></div><div class=3D"gmail_quote">Happy to take su=
ggestions/feedback on this process.</div><div class=3D"gmail_quote"><br></d=
iv><div class=3D"gmail_quote">--js<br></div></div>

--00000000000024716505d0ffc21a--


