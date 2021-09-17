Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B654240FF01
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 20:07:32 +0200 (CEST)
Received: from localhost ([::1]:52658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRIGp-0000rd-7L
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 14:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRIFY-0008Ih-Mk
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRIFU-0003rY-Tl
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631901967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eZr3aYX3hTwMANeHLnfzdIzggoNZVQl7oFHIs/AZf2U=;
 b=ObbFMdKdVYq5Py1AjgF2ttf1yW6YRyUu0fTgN9Uwk3T1jeh38KlkdVqNcL0DmprYtatxiK
 ol9wbkFaxP6OLAMRmf6HdE0wSli5ksOjyjbqrCCNjtS65fhbbKSkcOc+UwwD5QEr06I/iT
 O7AHx/poPBcvFqicNz4Mfjo6cT+5XxQ=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-aKicMIgtNA-k-i23zcVg8w-1; Fri, 17 Sep 2021 14:06:06 -0400
X-MC-Unique: aKicMIgtNA-k-i23zcVg8w-1
Received: by mail-ot1-f70.google.com with SMTP id
 i11-20020a9d53cb000000b00538e5ca17d6so39707360oth.18
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 11:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZr3aYX3hTwMANeHLnfzdIzggoNZVQl7oFHIs/AZf2U=;
 b=HHYQD3CJOmLXz7010LzTxUueY737AfysU5TDcttzodJNjo6VzgAVxmQ2LDMzW7SQ3r
 ks4xH4EA+3KnDJD8AmssOPslDgFL5EuZE88gJZ6E60K9iSHFnjwt2ly3tAcOGTYgT+HS
 oAGTeYjzNZUbWP6pdj6QiOqaDsEPmcDIYfHaHNI/DxRrnl9YQZkjTF7fZsOWUCi10bAC
 tV/sFXXEm4g0YJ0tDSWr+4ZVNzpBAdwL/Nv00KAao6cSQAk20kS8NnK/uXBBz7eRq4BF
 D06ypS03ZU5BRh0r0xE6t1oqU8q4QaNTOdje0/ig8RCGBOdYsssLlGRgFpBw7fTa6w3h
 R96A==
X-Gm-Message-State: AOAM530IHdYm+NjQoLKmot/MjpwVOGa9vKDUILaEzz9A2R+hMfzPwCPb
 9Eg1zWXyvdegTAxKc5BWAwRUDsewuRftpYbEBJLqDMNk4q3TXYsKAroXcD6TAzoro3iX6XqcbHS
 2PgVXRIuVy6AscDjg6c/OTrhUeZnXwMg=
X-Received: by 2002:a05:6830:2685:: with SMTP id
 l5mr7006007otu.129.1631901965391; 
 Fri, 17 Sep 2021 11:06:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/vJYtHzsWBIBhhoKIoEogSimlbVbEqllylsH/FIIDZtUy4RNKsDGWHFHAQWlKloqfGzaMaHYQFdsEYjcUAZo=
X-Received: by 2002:a05:6830:2685:: with SMTP id
 l5mr7005991otu.129.1631901965164; 
 Fri, 17 Sep 2021 11:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-8-jsnow@redhat.com>
 <ad49775f-f6a7-c527-6844-e28e913d1c3c@redhat.com>
In-Reply-To: <ad49775f-f6a7-c527-6844-e28e913d1c3c@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 14:05:54 -0400
Message-ID: <CAFn=p-a4Ef_vT2pyB1s2dcNtH-AHihYc6oNH_TnVgWBGv7jOyA@mail.gmail.com>
Subject: Re: [PATCH 07/15] python/aqmp: add send_fd_scm
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f132e505cc34c8e4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--000000000000f132e505cc34c8e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 9:34 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > The single space is indeed required to successfully transmit the file
> > descriptor to QEMU.
>
> Yeah, socket_scm_helper.c said =E2=80=9CSend a blank to notify qemu=E2=80=
=9D.
>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/aqmp/qmp_client.py | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/python/qemu/aqmp/qmp_client.py
> b/python/qemu/aqmp/qmp_client.py
> > index d2ad7459f9..58f85990bc 100644
> > --- a/python/qemu/aqmp/qmp_client.py
> > +++ b/python/qemu/aqmp/qmp_client.py
> > @@ -9,6 +9,8 @@
> >
> >   import asyncio
> >   import logging
> > +import socket
> > +import struct
> >   from typing import (
> >       Dict,
> >       List,
> > @@ -624,3 +626,18 @@ async def execute(self, cmd: str,
> >           """
> >           msg =3D self.make_execute_msg(cmd, arguments, oob=3Doob)
> >           return await self.execute_msg(msg)
> > +
> > +    @upper_half
> > +    @require(Runstate.RUNNING)
> > +    def send_fd_scm(self, fd: int) -> None:
> > +        """
> > +        Send a file descriptor to the remote via SCM_RIGHTS.
> > +        """
> > +        assert self._writer is not None
> > +        sock =3D self._writer.transport.get_extra_info('socket')
> > +
> > +        # Python 3.9+ adds socket.send_fds(...)
> > +        sock.sendmsg(
> > +            [b' '],
> > +            [(socket.SOL_SOCKET, socket.SCM_RIGHTS, struct.pack('@i',
> fd))]
> > +        )
>
> AFAIU the socket can be either TCP or a UNIX socket
> (AsyncProtocol._do_accept=E2=80=99s docstring sounds this way), so should=
 we
> check that this is a UNIX socket?  (Or is it fine to just run into the
> error that I suspect we would get with a TCP socket?)
>
> Hanna
>
>
Uhh, hm. I was going to say "Yeah, just let it fail!" but ... upon going to
document what error to expect in this case, I am realizing it fails
silently. So, uh, that's not ideal.

I'll fix this to make it bark.

--js

--000000000000f132e505cc34c8e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 9:34 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.2=
1 07:40, John Snow wrote:<br>
&gt; The single space is indeed required to successfully transmit the file<=
br>
&gt; descriptor to QEMU.<br>
<br>
Yeah, socket_scm_helper.c said =E2=80=9CSend a blank to notify qemu=E2=80=
=9D.<br>
<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/aqmp/qmp_client.py | 17 +++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 17 insertions(+)<br>
&gt;<br>
&gt; diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_cli=
ent.py<br>
&gt; index d2ad7459f9..58f85990bc 100644<br>
&gt; --- a/python/qemu/aqmp/qmp_client.py<br>
&gt; +++ b/python/qemu/aqmp/qmp_client.py<br>
&gt; @@ -9,6 +9,8 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0import asyncio<br>
&gt;=C2=A0 =C2=A0import logging<br>
&gt; +import socket<br>
&gt; +import struct<br>
&gt;=C2=A0 =C2=A0from typing import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0List,<br>
&gt; @@ -624,3 +626,18 @@ async def execute(self, cmd: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D self.make_execute_msg(=
cmd, arguments, oob=3Doob)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return await self.execute_msg(=
msg)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @upper_half<br>
&gt; +=C2=A0 =C2=A0 @require(Runstate.RUNNING)<br>
&gt; +=C2=A0 =C2=A0 def send_fd_scm(self, fd: int) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Send a file descriptor to the remote via =
SCM_RIGHTS.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._writer is not None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sock =3D self._writer.transport.get_extra=
_info(&#39;socket&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Python 3.9+ adds socket.send_fds(...)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sock.sendmsg(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [b&#39; &#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [(socket.SOL_SOCKET, socket=
.SCM_RIGHTS, struct.pack(&#39;@i&#39;, fd))]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
<br>
AFAIU the socket can be either TCP or a UNIX socket <br>
(AsyncProtocol._do_accept=E2=80=99s docstring sounds this way), so should w=
e <br>
check that this is a UNIX socket?=C2=A0 (Or is it fine to just run into the=
 <br>
error that I suspect we would get with a TCP socket?)<br>
<br>
Hanna<br>
<br></blockquote><div><br></div><div>Uhh, hm. I was going to say &quot;Yeah=
, just let it fail!&quot; but ... upon going to document what error to expe=
ct in this case, I am realizing it fails silently. So, uh, that&#39;s not i=
deal.</div><div><br></div><div>I&#39;ll fix this to make it bark.<br></div>=
<div><br></div><div>--js<br></div><br></div></div>

--000000000000f132e505cc34c8e4--


