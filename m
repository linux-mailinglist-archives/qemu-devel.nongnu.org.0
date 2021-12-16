Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D83477A83
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:25:17 +0100 (CET)
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxuVI-0004eK-IR
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:25:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxuT8-00032g-J1
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:23:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxuT6-0007JN-Qe
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639675379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r0wgXwH5zFHJFuLpbwgtKO+e8qxYgq8NNsi7qpuaD6I=;
 b=KgYC7Xuzik8cGhPLvDE76dWF7kvmtE0nxCSCxUi0gaUbFLOpkSuxMvpFIG8lbXqB2xqmF+
 09YbHYJyqgKSjn4bek0IcW/zkkh8Tb/kppcW3xT89VSstxiGP5H2DdtC7zsmavKmgUeuAn
 1WNB/MYl8Ze7xRPUS1Ja+TRNVXUtQm4=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-7rBvr2j7ONWUB_irwjPQ6g-1; Thu, 16 Dec 2021 12:22:56 -0500
X-MC-Unique: 7rBvr2j7ONWUB_irwjPQ6g-1
Received: by mail-vk1-f198.google.com with SMTP id
 j194-20020a1f23cb000000b00302c74a4262so12336960vkj.11
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r0wgXwH5zFHJFuLpbwgtKO+e8qxYgq8NNsi7qpuaD6I=;
 b=bgzjPC/4t0cRx+Z/ZbBmM7ECYuQkR3540vemcHlUnygOXZnJp/cH32q3DQXRDCdNAo
 9GBIrDPHuAQ+pck3StzvImqPZ1TLvubwN8joKpIcRd3GZ7DP95gImoRIJGilgaUtah/Z
 c4dmo8Gi5sEJ/ajiltwE5GbOtTsm0sfwsXBWKzoOTlvmVfq7wc4Vxqa03NthNj0QHr3/
 LiJr1SzakoMi0NTSt4RQ58DLx8H1e9xrHk30o07K/lXfranVJIU8p5BZIFMi56fmGYtk
 F+1YZwhjBl8uGNnbZ5r0RlZKQusmfbI0ujkRNE3haeiKFg+u7U11vDNGZn/zoNDdo2Ig
 Z9Cw==
X-Gm-Message-State: AOAM531xW5Xp1kDhEBfLzDS/GN2AUOM2H/xb3MGDq0eyfkI1RougaFCg
 znt5kQwcQZpHDafJbO6gYKLKMKntQySwoAki7+O9F3DCLte8yagpSxgv8i2dpUu8m3fbbkAOzSh
 37CmrR4XniqqNMlUbEi6OnM2mxepe45k=
X-Received: by 2002:a05:6102:c86:: with SMTP id
 f6mr6413935vst.38.1639675376279; 
 Thu, 16 Dec 2021 09:22:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzs8WoPkoqCAEfvUcehydJYr+UC7MDErwWNSq6IWPoUaj2OZ7+L0ufYqHLjmconekvOVQbrhngV3AdRUM+80Po=
X-Received: by 2002:a05:6102:c86:: with SMTP id
 f6mr6413923vst.38.1639675376090; 
 Thu, 16 Dec 2021 09:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-3-jsnow@redhat.com>
 <d02c037f-6d6d-7ea8-4647-87dd9f5f014b@virtuozzo.com>
In-Reply-To: <d02c037f-6d6d-7ea8-4647-87dd9f5f014b@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 12:22:45 -0500
Message-ID: <CAFn=p-bCgLKP=4-o9PORrwpjH+gTQRRhF_+6gCp_wb6AqqZqyg@mail.gmail.com>
Subject: Re: [PATCH v2 02/25] python/aqmp: handle asyncio.TimeoutError on
 execute()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000056d34105d346acd1"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

--00000000000056d34105d346acd1
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 4:51 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 15.12.2021 22:39, John Snow wrote:
> > This exception can be injected into any await statement. If we are
> > canceled via timeout, we want to clear the pending execution record on
> > our way out.
>
> Hmm, but there are more await statements in the file, shouldn't we care
> about them too ?
>
>
Did any catch your eye? Depending on where it fails, it may not need any
additional cleanup. In this case, it's important to delete the _pending
entry so that we don't leave stale entries behind.


> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/aqmp/qmp_client.py | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/python/qemu/aqmp/qmp_client.py
> b/python/qemu/aqmp/qmp_client.py
> > index 8105e29fa8..6a985ffe30 100644
> > --- a/python/qemu/aqmp/qmp_client.py
> > +++ b/python/qemu/aqmp/qmp_client.py
> > @@ -435,7 +435,11 @@ async def _issue(self, msg: Message) -> Union[None,
> str]:
> >               msg_id = msg['id']
> >
> >           self._pending[msg_id] = asyncio.Queue(maxsize=1)
> > -        await self._outgoing.put(msg)
> > +        try:
> > +            await self._outgoing.put(msg)
> > +        except:
>
> Doesn't pylint and others complain about plain "except". Do we really need
> to catch any exception here? As far as I know that's not a good practice.
>
>
pylint won't complain as long as you also ubiquitously re-raise the
exception. It's only a bad practice to suppress all exceptions, but it's OK
to define cleanup actions.

> +            del self._pending[msg_id]
> > +            raise
> >
> >           return msg_id
> >
> > @@ -452,9 +456,9 @@ async def _reply(self, msg_id: Union[str, None]) ->
> Message:
> >               was lost, or some other problem.
> >           """
> >           queue = self._pending[msg_id]
> > -        result = await queue.get()
> >
> >           try:
> > +            result = await queue.get()
> >               if isinstance(result, ExecInterruptedError):
> >                   raise result
> >               return result
> >
>
> This one looks good, just include it into existing try-finally
>
> Hmm. _issue() and _reply() are used only in one place, as a pair. It looks
> like both "awaits" should be better under one try-finally block.
>

They could. I split them for the sake of sub-classing if you wanted to
perform additional actions on the outgoing/incoming arms of the execute()
action. Specifically, I am accommodating the case that someone wants to
subclass QMPClient and create methods where a QMP command is *sent* but is
not *awaited*, i.e. _issue() is called without an immediate _reply(). This
allows us the chance to create something like a PendingExecution object
that could be awaited later on.

The simpler case, execute(), doesn't bother with separating those actions
and just awaits the reply immediately.


>
>
For example, move "self._pending[msg_id] = asyncio.Queue(maxsize=1)" to
> _execute, and just do try-finally in _execute() around _issue and _reply.
> Or may be just merge the whole logic in _execute, it doesn't seem too much.
> What do you think?
>
>

--00000000000056d34105d346acd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 4:51 AM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">15.12.2021 22:39, John Snow wrote:<br>
&gt; This exception can be injected into any await statement. If we are<br>
&gt; canceled via timeout, we want to clear the pending execution record on=
<br>
&gt; our way out.<br>
<br>
Hmm, but there are more await statements in the file, shouldn&#39;t we care=
 about them too ?<br>
<br></blockquote><div><br></div><div>Did any catch your eye? Depending on w=
here it fails, it may not need any additional cleanup. In this case, it&#39=
;s important to delete the _pending entry so that we don&#39;t leave stale =
entries behind.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/qmp_client.py | 8 ++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_cli=
ent.py<br>
&gt; index 8105e29fa8..6a985ffe30 100644<br>
&gt; --- a/python/qemu/aqmp/qmp_client.py<br>
&gt; +++ b/python/qemu/aqmp/qmp_client.py<br>
&gt; @@ -435,7 +435,11 @@ async def _issue(self, msg: Message) -&gt; Union[=
None, str]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg_id =3D msg[&=
#39;id&#39;]<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._pending[msg_id] =3D asyn=
cio.Queue(maxsize=3D1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._outgoing.put(msg)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._outgoing.put(ms=
g)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
<br>
Doesn&#39;t pylint and others complain about plain &quot;except&quot;. Do w=
e really need to catch any exception here? As far as I know that&#39;s not =
a good practice.<br>
<br></blockquote><div><br></div><div>pylint won&#39;t complain as long as y=
ou also ubiquitously re-raise the exception. It&#39;s only a bad practice t=
o suppress all exceptions, but it&#39;s OK to define cleanup actions.</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del self._pending[msg_id]<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return msg_id<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -452,9 +456,9 @@ async def _reply(self, msg_id: Union[str, None]) -=
&gt; Message:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0was lost, or som=
e other problem.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0queue =3D self._pending[msg_id=
]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D await queue.get()<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D await queue.get(=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(re=
sult, ExecInterruptedError):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ra=
ise result<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return result<br=
>
&gt; <br>
<br>
This one looks good, just include it into existing try-finally<br>
<br>
Hmm. _issue() and _reply() are used only in one place, as a pair. It looks =
like both &quot;awaits&quot; should be better under one try-finally block.<=
br></blockquote><div><br></div><div>They could. I split them for the sake o=
f sub-classing if you wanted to perform additional actions on the outgoing/=
incoming arms of the execute() action. Specifically, I am accommodating the=
 case that someone wants to subclass QMPClient and create methods where a Q=
MP command is *sent* but is not *awaited*, i.e. _issue() is called without =
an immediate _reply(). This allows us the chance to create something like a=
 PendingExecution object that could be awaited later on.</div><div><br></di=
v><div>The simpler case, execute(), doesn&#39;t bother with separating thos=
e actions and just awaits the reply immediately.<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 <br></blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
For example, move &quot;self._pending[msg_id] =3D asyncio.Queue(maxsize=3D1=
)&quot; to _execute, and just do try-finally in _execute() around _issue an=
d _reply. Or may be just merge the whole logic in _execute, it doesn&#39;t =
seem too much. What do you think?<br>
<br>
</blockquote></div></div>

--00000000000056d34105d346acd1--


