Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF03F06A8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 16:26:23 +0200 (CEST)
Received: from localhost ([::1]:56040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGMWM-00013W-IY
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 10:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mGMVH-0000DC-JC
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 10:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mGMVD-0003xt-Ou
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 10:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629296709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YQgIjbSOpBiCqOKaJIy9Oy6lnj00lsxSU8+QN6Xrxuo=;
 b=gQCLvqQtvWvQ3ai4hgo2Z4CuD/5ClLHez6vulLWoIP5qKPZ25blxRi45+2Z2/3shZqARN0
 WoWCPJLSv+OpnP+bvYxuaNS6q68jjhd8TG+Mjhk5boHH+35w8mj+/ZES41N/ptzEufPwQG
 YQ2AK6dmnf6ENjCh8A0CPbyexCxCKEo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-3CIaEjpROmmeN9GG31QTeg-1; Wed, 18 Aug 2021 10:25:04 -0400
X-MC-Unique: 3CIaEjpROmmeN9GG31QTeg-1
Received: by mail-ot1-f69.google.com with SMTP id
 66-20020a9d01480000b02904f7776681dbso1064864otu.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 07:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YQgIjbSOpBiCqOKaJIy9Oy6lnj00lsxSU8+QN6Xrxuo=;
 b=GOYFEEfvblyaEyrOSQC3zGQj3tWrtXfYm4BYV64ygmSMG8l+1297vdV8v9B7vKieJ0
 tU3BAj9sC/Ez2EnqUq6KkqY5XKWo/XCSv1eGBsIdjYwe6B+A1/6FlAJB783nTlGM61Qf
 WCTYbv5+JEEygRs6FN0NTg1rkHRYRH1s6Ajp9ZrNcxmHUsEjjmqtgLoCPe5IZrvk4ANj
 NBxlWHF+gpPYmoKO6v1RcaLz2Qw/H5ULcMsuE7Yr1hP3QnxrzGimlW0KWhNljtgRzFK3
 N26Sth3cKoDtn5aFW4Fd1FgJA1RKh+7NTLYR4JrwjR63sWr+pZhVhKlthjFJ6o6ra8ac
 hkew==
X-Gm-Message-State: AOAM531u4Bo6+KHN+So5jPQ/s1ur6MxrX9sKhJH0/GyN+nAA1tYtK45t
 fXRRWv/80C2lVLLI6xt2XOaGV9ytxwncCP9I384AzkaB2tkehwFZHeVO6cjjgHJcuJaJLmiS/0Q
 SeKDOc0tffd6Qz/Ph7hPGERcNGy8Srvw=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr7324860otr.45.1629296703266; 
 Wed, 18 Aug 2021 07:25:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+uVV0zWoAlfn+5GRngWoA9Qcb+cGd4t4u4qa2eDv/lL1OfDGeAnCWUZpdlzYx/qEwGqUj+H1hw8+D/3nQLlw=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr7324835otr.45.1629296703070; 
 Wed, 18 Aug 2021 07:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210803182941.504537-1-jsnow@redhat.com>
 <20210803182941.504537-10-jsnow@redhat.com>
 <20210817192949.cglc7ah2ohlmtf43@redhat.com>
In-Reply-To: <20210817192949.cglc7ah2ohlmtf43@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 18 Aug 2021 10:24:52 -0400
Message-ID: <CAFn=p-bhHBC2dxq3EiuVOo8UBTy5AhBMwDyzFu-c0L_o4=VsAg@mail.gmail.com>
Subject: Re: [PATCH v3 09/25] python/aqmp: add AsyncProtocol.accept() method
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003876e905c9d63347"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003876e905c9d63347
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 3:30 PM Eric Blake <eblake@redhat.com> wrote:

> On Tue, Aug 03, 2021 at 02:29:25PM -0400, John Snow wrote:
> > It's a little messier than connect, because it wasn't designed to accept
> > *precisely one* connection. Such is life.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/aqmp/protocol.py | 89 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 85 insertions(+), 4 deletions(-)
> >
> > diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
> > index 77b330627b3..7eca65aa265 100644
> > --- a/python/qemu/aqmp/protocol.py
> > +++ b/python/qemu/aqmp/protocol.py
> > @@ -243,6 +243,24 @@ async def runstate_changed(self) -> Runstate:
> >          await self._runstate_event.wait()
> >          return self.runstate
> >
> > +    @upper_half
> > +    @require(Runstate.IDLE)
> > +    async def accept(self, address: Union[str, Tuple[str, int]],
> > +                     ssl: Optional[SSLContext] = None) -> None:
> > +        """
> > +        Accept a connection and begin processing message queues.
> > +
> > +        If this call fails, `runstate` is guaranteed to be set back to
> `IDLE`.
> > +
> > +        :param address:
> > +            Address to listen to; UNIX socket path or TCP address/port.
>
> Can't TCP use a well-known port name instead of an int?  But limiting
> clients to just int port for now isn't fatal to the patch.
>
>
The old QMP library didn't support this, and I used the old library as my
template here. I'm willing to change the address format and types to be
more comprehensive, but I was thinking that it should probably try to match
or adhere to some standard; de-facto or otherwise. I wasn't sure which to
pick, and we use a few different ones in QEMU itself. Any recommendations
for me?


> > +        :param ssl: SSL context to use, if any.
> > +
> > +        :raise StateError: When the `Runstate` is not `IDLE`.
> > +        :raise ConnectError: If a connection could not be accepted.
> > +        """
> > +        await self._new_session(address, ssl, accept=True)
> > +
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--0000000000003876e905c9d63347
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 17, 2021 at 3:30 PM Eric =
Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Aug=
 03, 2021 at 02:29:25PM -0400, John Snow wrote:<br>
&gt; It&#39;s a little messier than connect, because it wasn&#39;t designed=
 to accept<br>
&gt; *precisely one* connection. Such is life.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/qemu/aqmp/protocol.py | 89 ++++++++++++++++++++++++++++++=
++++--<br>
&gt;=C2=A0 1 file changed, 85 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.=
py<br>
&gt; index 77b330627b3..7eca65aa265 100644<br>
&gt; --- a/python/qemu/aqmp/protocol.py<br>
&gt; +++ b/python/qemu/aqmp/protocol.py<br>
&gt; @@ -243,6 +243,24 @@ async def runstate_changed(self) -&gt; Runstate:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._runstate_event.wait()<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.runstate<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 @upper_half<br>
&gt; +=C2=A0 =C2=A0 @require(Runstate.IDLE)<br>
&gt; +=C2=A0 =C2=A0 async def accept(self, address: Union[str, Tuple[str, i=
nt]],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ssl: Optional[SSLContext] =3D None) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Accept a connection and begin processing =
message queues.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 If this call fails, `runstate` is guarant=
eed to be set back to `IDLE`.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param address:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Address to listen to; UNIX =
socket path or TCP address/port.<br>
<br>
Can&#39;t TCP use a well-known port name instead of an int?=C2=A0 But limit=
ing<br>
clients to just int port for now isn&#39;t fatal to the patch.<br>
<br></blockquote><div><br></div><div>The old QMP library didn&#39;t support=
 this, and I used the old library as my template here. I&#39;m willing to c=
hange the address format and types to be more comprehensive, but I was thin=
king that it should probably try to match or adhere to some standard; de-fa=
cto or otherwise. I wasn&#39;t sure which to pick, and we use a few differe=
nt ones in QEMU itself. Any recommendations for me?<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param ssl: SSL context to use, if any.<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise StateError: When the `Runstate` is=
 not `IDLE`.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise ConnectError: If a connection coul=
d not be accepted.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._new_session(address, ssl, acc=
ept=3DTrue)<br>
&gt; +<br>
<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank">eblake@redhat.com</a>&gt;<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div></div>

--0000000000003876e905c9d63347--


