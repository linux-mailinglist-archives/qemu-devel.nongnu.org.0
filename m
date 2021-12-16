Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F0C477A8A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:27:53 +0100 (CET)
Received: from localhost ([::1]:50096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxuXo-0007zj-LC
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:27:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxuWh-0006m7-8r
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:26:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxuWf-0008Jg-Le
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639675600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+pMfbut+FjdDc0LB8HozwkL7IY3z+fkMc9pbBkiET0=;
 b=RaKNXsruhlDL2Ed9gwPfEOE03So9eS87iL7WoShkK09c0s132UFTWHiDxaIhrpgyyb5az0
 IdLZPlKNVdrcBGncZDh9pbsut2GtTgGHtEce1aM08QLyf7FE5X+VKeTexxbf9UGCb4aKU4
 bZ2ICvkyt+zk9G0MRIXP2m+X6uGcM5g=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-l0BnuPxLMcy4s27tx9kd_Q-1; Thu, 16 Dec 2021 12:26:30 -0500
X-MC-Unique: l0BnuPxLMcy4s27tx9kd_Q-1
Received: by mail-vk1-f197.google.com with SMTP id
 t5-20020a1f9105000000b002f7fbb56d22so4038688vkd.17
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+pMfbut+FjdDc0LB8HozwkL7IY3z+fkMc9pbBkiET0=;
 b=IqUVWJ42CVSHmdzoYCfrtFi7+0kp41UjLsFxgXGoOc+wtFAGRAIvxL86yv70Lpt5FH
 ZFSdIBMP7dw7Wk7XtDBw334pB0ZF4TtoMGpdBuVsnU+WNuQ78jDy1knVCjvj8omKDUEx
 M2GMP889Tyc8x5T/V5AgZMb2C4eBBs3czl3XWwqLmUxVGq2IQfVRomrJSZEvUNkCGOA6
 H1/rHAxkHJZVSdFjKLP6w+57VTB/WnVhqdqoDnCub77hAUhrKEAEJYbveLsaZiTpuyX6
 siocxAxdJceveBgueuNixo1Gff1QXcLRKWHnvDW5JnHY7aqkN9QqPA5vnZF0tkQmjjDo
 c/8A==
X-Gm-Message-State: AOAM532D75KSF8aWhf6Wb67N7iTF0CIjDoKVKAvRUSjauQjHKS010xiX
 Nt+i1pKYRyN6bo6OSNdfIacxkn5bmIIbf3ClUOTsTneN+yS9tFHtCjXO6wQg+tGUvp2tcPhZQN/
 zvKTFzOruXfGgpQTJzXC5MT83VcPDpNg=
X-Received: by 2002:a05:6102:1ca:: with SMTP id
 s10mr6163438vsq.61.1639675589495; 
 Thu, 16 Dec 2021 09:26:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEmer1WrpWrldLhUutbjy9RACAzh+S9bTbaiLiYqeeNlp6xKBqVFRczL5YbxLuSeVqmjOJ3Wn8TfycnE7f/gk=
X-Received: by 2002:a05:6102:1ca:: with SMTP id
 s10mr6163419vsq.61.1639675589317; 
 Thu, 16 Dec 2021 09:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-3-jsnow@redhat.com>
 <20211216123937.br5tmrp2fm3ccm5x@laptop.redhat>
In-Reply-To: <20211216123937.br5tmrp2fm3ccm5x@laptop.redhat>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 12:26:18 -0500
Message-ID: <CAFn=p-aDO53per5C_4N397PsMbaue6jUnk-GxVsnuWwn1-trKw@mail.gmail.com>
Subject: Re: [PATCH v2 02/25] python/aqmp: handle asyncio.TimeoutError on
 execute()
To: Beraldo Leal <bleal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000c69fb05d346b9a9"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000c69fb05d346b9a9
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 7:39 AM Beraldo Leal <bleal@redhat.com> wrote:

> On Wed, Dec 15, 2021 at 02:39:16PM -0500, John Snow wrote:
> > This exception can be injected into any await statement. If we are
> > canceled via timeout, we want to clear the pending execution record on
> > our way out.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/aqmp/qmp_client.py | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/python/qemu/aqmp/qmp_client.py
> b/python/qemu/aqmp/qmp_client.py
> > index 8105e29fa8..6a985ffe30 100644
> > --- a/python/qemu/aqmp/qmp_client.py
> > +++ b/python/qemu/aqmp/qmp_client.py
> > @@ -435,7 +435,11 @@ async def _issue(self, msg: Message) -> Union[None,
> str]:
> >              msg_id = msg['id']
> >
> >          self._pending[msg_id] = asyncio.Queue(maxsize=1)
> > -        await self._outgoing.put(msg)
> > +        try:
> > +            await self._outgoing.put(msg)
> > +        except:
> > +            del self._pending[msg_id]
> > +            raise
>
> At first glance both, except and raise are not good practices, but I
> think I got what you are doing here, just intercepting to delete the
> pending message and raising it again. So maybe it will be safe to close
> the eyes here. ;)
>
>
Yeah, IMO it's 100% legitimate to define cleanup actions using catch-all
except statements as long as you re-raise. There's no other construct that
handles this case, AFAIK.

try
except <- on error
else <- on NOT error
finally <- always

Sometimes you just wanna undo stuff only on error. Maybe a higher layer
will "handle" that exception, maybe it'll crash the program. We don't know
here, we just know we need to undo some stuff.


> >
> >          return msg_id
> >
> > @@ -452,9 +456,9 @@ async def _reply(self, msg_id: Union[str, None]) ->
> Message:
> >              was lost, or some other problem.
> >          """
> >          queue = self._pending[msg_id]
> > -        result = await queue.get()
> >
> >          try:
> > +            result = await queue.get()
> >              if isinstance(result, ExecInterruptedError):
> >                  raise result
> >              return result
>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
>
>
ty :)

--0000000000000c69fb05d346b9a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 7:39 AM Beral=
do Leal &lt;<a href=3D"mailto:bleal@redhat.com">bleal@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Dec=
 15, 2021 at 02:39:16PM -0500, John Snow wrote:<br>
&gt; This exception can be injected into any await statement. If we are<br>
&gt; canceled via timeout, we want to clear the pending execution record on=
<br>
&gt; our way out.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/qemu/aqmp/qmp_client.py | 8 ++++++--<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_cli=
ent.py<br>
&gt; index 8105e29fa8..6a985ffe30 100644<br>
&gt; --- a/python/qemu/aqmp/qmp_client.py<br>
&gt; +++ b/python/qemu/aqmp/qmp_client.py<br>
&gt; @@ -435,7 +435,11 @@ async def _issue(self, msg: Message) -&gt; Union[=
None, str]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_id =3D msg[&#39;id=
&#39;]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._pending[msg_id] =3D asyncio.Qu=
eue(maxsize=3D1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._outgoing.put(msg)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._outgoing.put(ms=
g)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del self._pending[msg_id]<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
<br>
At first glance both, except and raise are not good practices, but I<br>
think I got what you are doing here, just intercepting to delete the<br>
pending message and raising it again. So maybe it will be safe to close<br>
the eyes here. ;)<br>
<br></blockquote><div><br></div><div>Yeah, IMO it&#39;s 100% legitimate to =
define cleanup actions using catch-all except statements as long as you re-=
raise. There&#39;s no other construct that handles this case, AFAIK.</div><=
div><br></div><div>try</div><div>except &lt;- on error</div><div>else &lt;-=
 on NOT error</div><div>finally &lt;- always</div><div><br></div><div>Somet=
imes you just wanna undo stuff only on error. Maybe a higher layer will &qu=
ot;handle&quot; that exception, maybe it&#39;ll crash the program. We don&#=
39;t know here, we just know we need to undo some stuff.<br></div></div><di=
v class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg_id<br>
&gt;=C2=A0 <br>
&gt; @@ -452,9 +456,9 @@ async def _reply(self, msg_id: Union[str, None]) -=
&gt; Message:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 was lost, or some othe=
r problem.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 queue =3D self._pending[msg_id]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D await queue.get()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D await queue.get(=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(result, =
ExecInterruptedError):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise re=
sult<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return result<br>
<br>
Reviewed-by: Beraldo Leal &lt;<a href=3D"mailto:bleal@redhat.com" target=3D=
"_blank">bleal@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>ty :) <br></div></div></div>

--0000000000000c69fb05d346b9a9--


