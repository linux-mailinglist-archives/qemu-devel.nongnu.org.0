Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DFC40FEAE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 19:33:50 +0200 (CEST)
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRHkC-0001So-TM
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 13:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRHiA-00081l-0J
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRHi7-0001DX-Aa
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631899898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jtWSVVvw3bvEh9cpAz8Y0J9M6z5a86JIMYSTMufrKO4=;
 b=YpXP3ov/ubXuZD63l+OprJvnOw7N7ZRTP9OkpxolqjDln8/Oo1oSsV/Y6nRbPHtWus8Y1I
 uUPDwz+HR4FwPFgsykxOUBCEg+kNkwDCoLDRwyOby+UwF7wKgR/WTcHOrJiHFjrVyiuqdP
 tppmXzSJhk9iSh3TEwdEccTXX45U2r8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555--4CGq3JhMfW6C8TQz9ItSQ-1; Fri, 17 Sep 2021 13:31:37 -0400
X-MC-Unique: -4CGq3JhMfW6C8TQz9ItSQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 76-20020a9d0152000000b0053b372910bbso39692151otu.14
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 10:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jtWSVVvw3bvEh9cpAz8Y0J9M6z5a86JIMYSTMufrKO4=;
 b=2teiDctEt8pLw+fNqJE1qkZV6cJC8iuadnAF6flp7jUnHEWqv3DDlhc91P29XKwlAm
 V8hHcHyQSxKA+80z/o30L0pt2RBZ3o+X/Jr7q0YIiST8T6CovNYvCKpkOq5XNAQ3TnAL
 Ez5hmNug4Ja0jvngaH3Tjgmo9zh4gGOil2ipPcgGiVelfOAYoUEoeOHx7E+2peOH4OI/
 1r2j5DwsjA6xz0gCO8WgtXxV2GGlppnymni6jMGPtb0vV4HVC2XCed+vVVZPRAPJatzI
 S0jGykh9nFtLWfeeXIlOfhQqhFIZcA9YYFl4TSHRqG7PFM9XMRMjzhQ5nlsOqlfxNwuT
 voKA==
X-Gm-Message-State: AOAM5312OpxGRlCSmoVo7CoPOjks88JaoNsDq2g3dYfPB6q8CkQkQJbK
 ax0ZP5ncpXs3CxFuns0eKrPgNWGmGPSjqlLq4nxX78LL+S98jylza9E2wDG1rnb75rwKK2Dy+AN
 HjqOyJkgg2GetDQeLV6KY4zpXw+9MD/Q=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr7308506ots.252.1631899896264; 
 Fri, 17 Sep 2021 10:31:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9TC7lftrztoqu8CYVkb2csQWmU3Hf5hLm3I09TuyG4WYR+lAHldNAG/6LsvfswAhcC7LARS7Bej5nZ8I+Z38=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr7308493ots.252.1631899896081; 
 Fri, 17 Sep 2021 10:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-5-jsnow@redhat.com>
 <bc3f4366-6fa9-750d-3e33-ac8c3deaad2b@redhat.com>
In-Reply-To: <bc3f4366-6fa9-750d-3e33-ac8c3deaad2b@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 13:31:25 -0400
Message-ID: <CAFn=p-YEVMwY=j4Ts-C8gLzRynTQXeRNySjYheYAKTOHXAVuig@mail.gmail.com>
Subject: Re: [PATCH 04/15] python/qmp: clear events on get_events() call
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009d83da05cc344d1e"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009d83da05cc344d1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 8:51 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > All callers in the tree *already* clear the events after a call to
> > get_events(). Do it automatically instead and update callsites to remov=
e
> > the manual clear call.
> >
> > These semantics are quite a bit easier to emulate with async QMP, and
> > nobody appears to be abusing some emergent properties of what happens i=
f
> > you decide not to clear them, so let's dial down to the dumber, simpler
> > thing.
> >
> > Specifically: callers of clear() right after a call to get_events() are
> > more likely expressing their desire to not see any events they just
> > retrieved, whereas callers of clear_events() not in relation to a recen=
t
> > call to pull_event/get_events are likely expressing their desire to
> > simply drop *all* pending events straight onto the floor. In the sync
> > world, this is safe enough; in the async world it's nearly impossible t=
o
> > promise that nothing happens between getting and clearing the
> > events.
> >
> > Making the retrieval also clear the queue is vastly simpler.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/machine/machine.py | 1 -
> >   python/qemu/qmp/__init__.py    | 4 +++-
> >   python/qemu/qmp/qmp_shell.py   | 1 -
> >   3 files changed, 3 insertions(+), 3 deletions(-)
>
> [...]
>
> > diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
> > index 269516a79b..ba15668c25 100644
> > --- a/python/qemu/qmp/__init__.py
> > +++ b/python/qemu/qmp/__init__.py
> > @@ -374,7 +374,9 @@ def get_events(self, wait: bool =3D False) ->
> List[QMPMessage]:
> >           @return The list of available QMP events.
> >           """
> >           self.__get_events(wait)
> > -        return self.__events
> > +        events =3D self.__events
> > +        self.__events =3D []
> > +        return events
>
> Maybe it=E2=80=99s worth updating the doc string that right now just says=
 =E2=80=9CGet a
> list of available QMP events=E2=80=9D?
>
>
Yes, that's an oversight on my part. I'm updating it to:
"Get a list of available QMP events and clear the list of pending events."
and adding your RB.

(Also, perhaps renaming it to get_new_events, but that=E2=80=99s an even we=
aker
> suggestion.)
>

I tried to avoid churn in the iotests as much as I could manage, so I think
I will leave this be for now. I have an impression that the number of cases
where one might wish to see events that have already been witnessed is
actually quite low, so I am not sure that it needs disambiguation from a
case that is essentially never used. (I have certainly been wrong before,
though.)


> Anyway:
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>
~ thankyou ~

--0000000000009d83da05cc344d1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 8:51 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.2=
1 07:40, John Snow wrote:<br>
&gt; All callers in the tree *already* clear the events after a call to<br>
&gt; get_events(). Do it automatically instead and update callsites to remo=
ve<br>
&gt; the manual clear call.<br>
&gt;<br>
&gt; These semantics are quite a bit easier to emulate with async QMP, and<=
br>
&gt; nobody appears to be abusing some emergent properties of what happens =
if<br>
&gt; you decide not to clear them, so let&#39;s dial down to the dumber, si=
mpler<br>
&gt; thing.<br>
&gt;<br>
&gt; Specifically: callers of clear() right after a call to get_events() ar=
e<br>
&gt; more likely expressing their desire to not see any events they just<br=
>
&gt; retrieved, whereas callers of clear_events() not in relation to a rece=
nt<br>
&gt; call to pull_event/get_events are likely expressing their desire to<br=
>
&gt; simply drop *all* pending events straight onto the floor. In the sync<=
br>
&gt; world, this is safe enough; in the async world it&#39;s nearly impossi=
ble to<br>
&gt; promise that nothing happens between getting and clearing the<br>
&gt; events.<br>
&gt;<br>
&gt; Making the retrieval also clear the queue is vastly simpler.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/machine.py | 1 -<br>
&gt;=C2=A0 =C2=A0python/qemu/qmp/__init__.py=C2=A0 =C2=A0 | 4 +++-<br>
&gt;=C2=A0 =C2=A0python/qemu/qmp/qmp_shell.py=C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 =C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
[...]<br>
<br>
&gt; diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py=
<br>
&gt; index 269516a79b..ba15668c25 100644<br>
&gt; --- a/python/qemu/qmp/__init__.py<br>
&gt; +++ b/python/qemu/qmp/__init__.py<br>
&gt; @@ -374,7 +374,9 @@ def get_events(self, wait: bool =3D False) -&gt; L=
ist[QMPMessage]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@return The list of available =
QMP events.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.__get_events(wait)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.__events<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 events =3D self.__events<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.__events =3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return events<br>
<br>
Maybe it=E2=80=99s worth updating the doc string that right now just says =
=E2=80=9CGet a <br>
list of available QMP events=E2=80=9D?<br>
<br></blockquote><div><br></div><div>Yes, that&#39;s an oversight on my par=
t. I&#39;m updating it to:</div><div>&quot;Get a list of available QMP even=
ts and clear the list of pending events.&quot; and adding your RB.<br></div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
(Also, perhaps renaming it to get_new_events, but that=E2=80=99s an even we=
aker <br>
suggestion.)<br></blockquote><div><br></div><div>I tried to avoid churn in =
the iotests as much as I could manage, so I think I will leave this be for =
now. I have an impression that the number of cases where one might wish to =
see events that have already been witnessed is actually quite low, so I am =
not sure that it needs disambiguation from a case that is essentially never=
 used. (I have certainly been wrong before, though.)<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Anyway:<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>~ thankyou ~</div><div> <br></div></di=
v></div>

--0000000000009d83da05cc344d1e--


