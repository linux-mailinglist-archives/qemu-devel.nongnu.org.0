Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D5454DAA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:09:38 +0100 (CET)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnQJN-0008Hs-JN
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:09:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnQI0-0006yx-Dn
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:08:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnQHw-0004GP-PT
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637176087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ayNyeIntKHNQw30/WtxgXi9ZvsuuIkQ7CPCukYV7TVo=;
 b=gNpyTq1xJe+XPDOFe/qUnTQiAWjpELP9jaUFUrgcQdXRv1ESarCKERuNJmWzVEW+sQdvYi
 XO3f/x42dO/FVF847pv/Mn69I52eZovSrTfTmaIWZhhCBfbo0lLjmC81XHJ8e9ED4lh9xV
 zx3jC6AS53/KFcFjVin4+MIJlDV18aA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-m2KkLelhO0mJO-XUGx_rUQ-1; Wed, 17 Nov 2021 14:08:05 -0500
X-MC-Unique: m2KkLelhO0mJO-XUGx_rUQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 m25-20020a056122215900b002fac70f81c1so1829542vkd.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 11:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ayNyeIntKHNQw30/WtxgXi9ZvsuuIkQ7CPCukYV7TVo=;
 b=N9AYvonRHbXRHACa1UC87yjyS6qd+GbbG6Gey2YRldkB+q8t1cRGBokBVpCk76K2Sf
 pk7J8OPvmo/waxPN1pyI/CcSWqbfMpdKjwuJQr6IhQhC5iVEjHAo/KX3wtqu3BIwO0Xe
 B7khgQexuA/JHqjuLcIZlcxCDA1JwPISbWQxA70o4aKKDIDMzvQFvnwNcKbjLL+PhwDh
 3s/dRu9WTx2iLWsOTEJNRETFCEe/gBs3kUqcJj+xhXXgTyFZT0gklB1mWYhvDbdh3A6A
 3Dfkc/7g0TZfKt3kg+vW9E8BkWsd0D9u9MWMmEVST/KfahsMXJgFNHGKPmKMGFIv/4kJ
 T67w==
X-Gm-Message-State: AOAM533v4LQQx9BV+WsYIal5JoenU71S2WzJ0xUUqDhNyIIJ95ig/DW6
 euJ76m9uyjSN76TRlSn91PX0JOYlTFFGyoJjbWXQSaFdYjq5PXSSUQ1sUtqBktPLbC0dMqIlYVE
 8BNbBxL0sZN3F3SgrAt2ywUJgocfsZXg=
X-Received: by 2002:a9f:21e1:: with SMTP id 88mr25990597uac.79.1637176084906; 
 Wed, 17 Nov 2021 11:08:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqTcR21DvBdLh5T4jbU+54srMymYh6OCNAB9xviOapckGP9ktbAY93MFjQ6KMfoT9CapKPOjaKhXh0Z04BZqo=
X-Received: by 2002:a9f:21e1:: with SMTP id 88mr25990546uac.79.1637176084670; 
 Wed, 17 Nov 2021 11:08:04 -0800 (PST)
MIME-Version: 1.0
References: <20211117003317.2844087-1-jsnow@redhat.com>
 <20211117094157.cef4x5jdsddd3hfy@sirius.home.kraxel.org>
 <CAFn=p-Y-dxRLrvEwz1M=HgPumQqwzUSHe1UTy-H_9D8PuCv0xg@mail.gmail.com>
 <92fb55dd-1f0c-bf23-2b6f-dfb46c40b3f4@virtuozzo.com>
In-Reply-To: <92fb55dd-1f0c-bf23-2b6f-dfb46c40b3f4@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 17 Nov 2021 14:07:53 -0500
Message-ID: <CAFn=p-Z0RPqwN9=KBa2UkHgXmd6fg-KettAtYYygZ2TdOU+BeQ@mail.gmail.com>
Subject: Re: [PULL 0/5] Python patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f640e505d100c28f"
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
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f640e505d100c28f
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 1:20 PM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 17.11.2021 20:56, John Snow wrote:
> >
> > On Wed, Nov 17, 2021 at 4:42 AM Gerd Hoffmann <kraxel@redhat.com
> <mailto:kraxel@redhat.com>> wrote:
> >
> >        Hi,
> >
> >      > https://gitlab.com/jsnow/qemu.git <
> https://gitlab.com/jsnow/qemu.git> tags/python-pull-request
> >
> >     What is the status of the plan to upload this to pypi eventually?
> >
> >
> > Thanks for asking!
> >
> > The honest answer is "I'm not exactly sure", but there are a few things
> to work out still. Let me use this as an opportunity to try and give you an
> honest answer.
> > We've got four packages right now: qmp, aqmp, machine and utils.
> >
> > - I don't intend to *ever* upload utils, I created that one specifically
> as an in-tree package for "low quality" code that we just need as glue.
> > - aqmp is brand new. It was moved as the default provider for the QMP
> protocol in the tree (being used by machine.py) only two weeks ago. I am
> using this current RC testing phase to find any problems with it.
> > - qmp is something I want to deprecate, I don't intend to upload it to
> PyPI. I intend to rename aqmp -> qmp and have just the one qmp package. I
> can't do this until next release, and only after we are confident and happy
> that aqmp is stable enough.
> > - machine has a few problems with it. I am reluctant to upload it in its
> current form. I am actively developing a new version of it that uses the
> new Async QMP module. However, this might take a bit of time, I fear.
> >
> > So, I think I have this timeline for myself:
> >
> > - Fix bugs in AQMP package revealed during RC testing
> > - Introduce sync wrapper for AQMP that resembles the native AQMP
> interface more than it resembles the "legacy QMP" interface.
> > - Remove all QEMU source tree uses of qemu.qmp and qemu.aqmp.legacy.
> > - Delete qemu.qmp and rename qemu.aqmp to qemu.qmp.
> > - Split python/qemu/qmp out into its own repository and begin uploading
> it to PyPI, as a test. (Do not delete python/qemu/qmp yet at this phase.)
> > - Transition any users of the Python packages in the QEMU source tree to
> installing the QMP dependency from PyPI instead of grabbing it from the
> tree.
> > - Delete python/qemu/qmp from the QEMU source tree at this moment;
> "re-fork" the package if necessary to collect any commits since the "test
> split" procedure.
> >
>
> That all sounds great!
>
> >
> > Some questions to work out:
> > - What tools should be uploaded with qemu.qmp? a version of qmp-shell is
> high on the list for me. qom, qom-set, qom-get, qom-list, qom-tree,
> qom-fuse etc I am suspecting might be better left behind in qemu.utils
> instead, though. I am not sure I want to support those more broadly. They
> weren't designed for "external consumption".
> > - qemu-ga-client should be moved over into utils, or possibly even
> deleted -- it hasn't seen a lot of love and I doubt there are any users. I
> don't have the bandwidth to refurbish it for no users. Maybe if there's a
> demand in the future ...
> >
> >
> > ... This might be being overcautious, though. Perhaps I can upload a
> version of "qemu.aqmp" even this week just as a demonstration of how it
> would work.
> >
>
> Why do we need wait for next release for renaming aqmp -> qmp? Or what
> next release do you mean? I think you can rename it as soon as 6.3
> development phase is open.
>
>
I might be confused in my thinking because there's a ton of little tasks to
do, and I won't pretend I have thought extremely carefully about the
precise order in which they *have* to be done, only the order in which that
it occurs to me to do them. :)

I suppose I could do something like rename "qmp" to "legacy_qmp" in the
tree as an intermediate step and accomplish the "aqmp -> qmp" rename
sooner, but there's a lot of churn inherent to that. Since there's a lot of
churn inherent to moving users off of the old interface anyway, I figured
I'd just tackle it all at once... which I can't do until the tree re-opens
again.

I can certainly work on it in the meantime, though.

I'm not sure that's a good idea to upload qemu.aqmp to public and than
> rename it to qemu.qmp.. Maybe, you can upload it now as qemu.qmp? So,
> first, create a separate repo with aqmp (already renamed to qmp), upload it
> to PyPI (as qmp) - this all as a first step. And then gradually move Qemu
> to use this new repo instead its own qmp/aqmp.
>

I'm afraid of doing this because I don't want to pollute the 'qemu.qmp'
space with two packages that contain radically different things in it. It
feels safer to fully switch over the QEMU source tree first, and THEN
upload to PyPI. If I go out of order there, I worry that we will run into
circumstances where various scripts/tools will use "the wrong qemu.qmp",
and it will be frustrating for people without a lot of Python packaging
experience to diagnose on their own.

The safest thing is just to wait for me to do all the cleanup churn I laid
out above, but if I were to demo a "preview", doing it under the
'qemu.aqmp' name seems like the safest bet because I don't plan to use that
name long-term.

--js

--000000000000f640e505d100c28f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 1:20 PM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">17.11.2021 20:56, John Snow wrote:<br>
&gt; <br>
&gt; On Wed, Nov 17, 2021 at 4:42 AM Gerd Hoffmann &lt;<a href=3D"mailto:kr=
axel@redhat.com" target=3D"_blank">kraxel@redhat.com</a> &lt;mailto:<a href=
=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt;&g=
t; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://gitlab.com/jsnow/qemu.git"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu.git</a>=
 &lt;<a href=3D"https://gitlab.com/jsnow/qemu.git" rel=3D"noreferrer" targe=
t=3D"_blank">https://gitlab.com/jsnow/qemu.git</a>&gt; tags/python-pull-req=
uest<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0What is the status of the plan to upload this to py=
pi eventually?<br>
&gt; <br>
&gt; <br>
&gt; Thanks for asking!<br>
&gt; <br>
&gt; The honest answer is &quot;I&#39;m not exactly sure&quot;, but there a=
re a few things to work out still. Let me use this as an opportunity to try=
 and give you an honest answer.<br>
&gt; We&#39;ve got four packages right now: qmp, aqmp, machine and utils.<b=
r>
&gt; <br>
&gt; - I don&#39;t intend to *ever* upload utils, I created that one specif=
ically as an in-tree package for &quot;low quality&quot; code that we just =
need as glue.<br>
&gt; - aqmp is brand new. It was moved as the default provider for the QMP =
protocol in the tree (being used by machine.py) only two weeks ago. I am us=
ing this current RC testing phase to find any problems with it.<br>
&gt; - qmp is something I want to deprecate, I don&#39;t intend to upload i=
t to PyPI. I intend to rename aqmp -&gt; qmp and have just the one qmp pack=
age. I can&#39;t do this until next release, and only after we are confiden=
t and happy that aqmp is stable enough.<br>
&gt; - machine has a few problems with it. I am reluctant to upload it in i=
ts current form. I am actively developing a new version of it that uses the=
 new Async QMP module. However, this might take a bit of time, I fear.<br>
&gt; <br>
&gt; So, I think I have this timeline for myself:<br>
&gt; <br>
&gt; - Fix bugs in AQMP package revealed during RC testing<br>
&gt; - Introduce sync wrapper for AQMP that resembles the native AQMP inter=
face more than it resembles the &quot;legacy QMP&quot; interface.<br>
&gt; - Remove all QEMU source tree uses of qemu.qmp and qemu.aqmp.legacy.<b=
r>
&gt; - Delete qemu.qmp and rename qemu.aqmp to qemu.qmp.<br>
&gt; - Split python/qemu/qmp out into its own repository and begin uploadin=
g it to PyPI, as a test. (Do not delete python/qemu/qmp yet at this phase.)=
<br>
&gt; - Transition any users of the Python packages in the QEMU source tree =
to installing the QMP dependency from PyPI instead of grabbing it from the =
tree.<br>
&gt; - Delete python/qemu/qmp from the QEMU source tree at this moment; &qu=
ot;re-fork&quot; the package if necessary to collect any commits since the =
&quot;test split&quot; procedure.<br>
&gt; <br>
<br>
That all sounds great!<br>
<br>
&gt; <br>
&gt; Some questions to work out:<br>
&gt; - What tools should be uploaded with qemu.qmp? a version of qmp-shell =
is high on the list for me. qom, qom-set, qom-get, qom-list, qom-tree, qom-=
fuse etc I am suspecting might be better left behind in qemu.utils instead,=
 though. I am not sure I want to support those more broadly. They weren&#39=
;t designed for &quot;external consumption&quot;.<br>
&gt; - qemu-ga-client should be moved over into utils, or possibly even del=
eted -- it hasn&#39;t seen a lot of love and I doubt there are any users. I=
 don&#39;t have the bandwidth to refurbish it for no users. Maybe if there&=
#39;s a demand in the future ...<br>
&gt; <br>
&gt; <br>
&gt; ... This might be being overcautious, though. Perhaps I can upload a v=
ersion of &quot;qemu.aqmp&quot; even this week just as a demonstration of h=
ow it would work.<br>
&gt; <br>
<br>
Why do we need wait for next release for renaming aqmp -&gt; qmp? Or what n=
ext release do you mean? I think you can rename it as soon as 6.3 developme=
nt phase is open.<br>
<br></blockquote><div><br></div><div>I might be confused in my thinking bec=
ause there&#39;s a ton of little tasks to do, and I won&#39;t pretend I hav=
e thought extremely carefully about the precise order in which they *have* =
to be done, only the order in which that it occurs to me to do them. :)</di=
v><div><br></div><div>I suppose I could do something like rename &quot;qmp&=
quot; to &quot;legacy_qmp&quot; in the tree as an intermediate step and acc=
omplish the &quot;aqmp -&gt; qmp&quot; rename sooner, but there&#39;s a lot=
 of churn inherent to that. Since there&#39;s a lot of churn inherent to mo=
ving users off of the old interface anyway, I figured I&#39;d just tackle i=
t all at once... which I can&#39;t do until the tree re-opens again.<br><br=
></div><div>I can certainly work on it in the meantime, though.<br></div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I&#39;m not sure that&#39;s a good idea to upload qemu.aqmp to public and t=
han rename it to qemu.qmp.. Maybe, you can upload it now as qemu.qmp? So, f=
irst, create a separate repo with aqmp (already renamed to qmp), upload it =
to PyPI (as qmp) - this all as a first step. And then gradually move Qemu t=
o use this new repo instead its own qmp/aqmp.<br></blockquote><div><br></di=
v><div>I&#39;m afraid of doing this because I don&#39;t want to pollute the=
 &#39;qemu.qmp&#39; space with two packages that contain radically differen=
t things in it. It feels safer to fully switch over the QEMU source tree fi=
rst, and THEN upload to PyPI. If I go out of order there, I worry that we w=
ill run into circumstances where various scripts/tools will use &quot;the w=
rong qemu.qmp&quot;, and it will be frustrating for people without a lot of=
 Python packaging experience to diagnose on their own.<br><br></div><div>Th=
e safest thing is just to wait for me to do all the cleanup churn I laid ou=
t above, but if I were to demo a &quot;preview&quot;, doing it under the &#=
39;qemu.aqmp&#39; name seems like the safest bet because I don&#39;t plan t=
o use that name long-term.</div><div><br></div><div>--js<br></div></div></d=
iv>

--000000000000f640e505d100c28f--


