Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC53CD627
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:54:09 +0200 (CEST)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Tij-0004GF-2s
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1m5Th6-0002ZC-OO
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1m5Th4-0001gk-NX
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626702745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RfhGiw7K8LtWlN5Oz8f2JVOwrCsFlaCAldgNdaijXEY=;
 b=G0oj27X6f3EWa2A0UUUe5ely0sEh6ox0jqAEan9KxiZ1MIxPCu1BEqsnAbyL4Zi6mPFgyb
 CHiehXswU7ajrVq6sRt2zWhQvjKwpdHygEvyyg5bGbgwh2TmDv4+vTrvvKGmNFcN+hEyI7
 IPSi+fuDSMcTVQThtbzTpy1aBw3vt0Y=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-v_pI6PiBMr2bl140dlyi8g-1; Mon, 19 Jul 2021 09:52:23 -0400
X-MC-Unique: v_pI6PiBMr2bl140dlyi8g-1
Received: by mail-pf1-f198.google.com with SMTP id
 k11-20020aa792cb0000b02903305e16bd1dso13667848pfa.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 06:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfhGiw7K8LtWlN5Oz8f2JVOwrCsFlaCAldgNdaijXEY=;
 b=GL+N+M6FNXneZMw/XPwd5YKIiSf5zCdW/p/9HyPZgjobHgqDbfA2abwki4B6EvE/Ap
 xQeI9VJNI+tCYKxEs2IN9uSCRf1yG2Wrx4IkB9veVUT4S2euygGWgWFRKYStfxPcT1Di
 nL2DQXpmA4V2uZWdBkeUXx6UfjYeqljZ0sYG5Pol4CX8EBIOio8bTF8AOZBvUKfd5l3V
 Uqfq4Pbe+iBjknOQ4YlvjYq5TcrrlM6qEWUawn7TjfnQfUp12DruAFOsbnZ9wk6UmBut
 5bLK6DjgmcDtRAgfrhQhMPd8CqNx2D6dprIsWF54+yY8NvcbZ7WBkB1yjJtK7kfq8mm0
 2HyA==
X-Gm-Message-State: AOAM5316YpsSmUsKEhjo8ymW+3Ey9NQ0UdOuuYwpnKCbRoy65O3W5QS8
 Ij2TqTRAGzqtQe/sMLZKIhE3gscqzdNssRMM+bI2t0Uv9TGtvfdQAtHwv9t0bTV7LiUGZI5Ds2n
 wbkEYSjHTx/TI5AjOJMPnb9X1go8kFP8=
X-Received: by 2002:a65:564f:: with SMTP id m15mr25567001pgs.346.1626702741788; 
 Mon, 19 Jul 2021 06:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP7n6a+zPjkd1FDVci7oF/r4vI3Z9+kl+tuoqz1D3/vYR0moe+s/fvoSOvWVO40xImG4DxBtr7JVkaOteZHmA=
X-Received: by 2002:a65:564f:: with SMTP id m15mr25566969pgs.346.1626702741438; 
 Mon, 19 Jul 2021 06:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
 <YPWC6ixkaBKgnpr5@redhat.com>
In-Reply-To: <YPWC6ixkaBKgnpr5@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 19 Jul 2021 17:52:10 +0400
Message-ID: <CAMxuvay=Pa0mf+=EWKzXxOe_3v3cCd1oF0EtXHMFUjB5T_Lgvg@mail.gmail.com>
Subject: Re: [PATCH] util: fix abstract socket path copy
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000f1a3505c77a3fa7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zxq_yx_007@163.com, qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000f1a3505c77a3fa7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 5:49 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Mon, Jul 19, 2021 at 05:01:12PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Commit 776b97d360 "qemu-sockets: add abstract UNIX domain socket
> > support" neglected to update socket_sockaddr_to_address_unix() and
> > copied the whole sun_path without taking "salen" into account.
> >
> > Later, commit 3b14b4ec49 "sockets: Fix socket_sockaddr_to_address_unix(=
)
> > for abstract sockets" handled the abstract UNIX path, by stripping the
> > leading \0 character and fixing address details, but didn't use salen
> > either.
> >
> > Not taking "salen" into account may result in incorrect "path" being
> > returned in monitors commands, as we read past the address which is not
> > necessarily \0-terminated.
>
> So IIUC, this is only affecting what is printed in the monitor
> when querying chardevs, not the actual functional behaviour
> between clients/servers connecting/listening ?
>
>
I think so, both hmp & qmp, and the info_report() in server_accept_sync().
But I didn't carefully review all the potential users (who else could they
be?).


> >
> > Fixes: 776b97d3605ed0fc94443048fdf988c7725e38a9
> > Fixes: 3b14b4ec49a801067da19d6b8469eb1c1911c020
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  util/qemu-sockets.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > index 080a240b74..f2f3676d1f 100644
> > --- a/util/qemu-sockets.c
> > +++ b/util/qemu-sockets.c
> > @@ -1345,13 +1345,16 @@ socket_sockaddr_to_address_unix(struct
> sockaddr_storage *sa,
> >      SocketAddress *addr;
> >      struct sockaddr_un *su =3D (struct sockaddr_un *)sa;
> >
> > +    assert(salen >=3D sizeof(su->sun_family) + 1 &&
> > +           salen <=3D sizeof(struct sockaddr_un));
> > +
> >      addr =3D g_new0(SocketAddress, 1);
> >      addr->type =3D SOCKET_ADDRESS_TYPE_UNIX;
> >  #ifdef CONFIG_LINUX
> >      if (!su->sun_path[0]) {
> >          /* Linux abstract socket */
> >          addr->u.q_unix.path =3D g_strndup(su->sun_path + 1,
> > -                                        sizeof(su->sun_path) - 1);
> > +                                        salen - sizeof(su->sun_family)
> - 1);
> >          addr->u.q_unix.has_abstract =3D true;
> >          addr->u.q_unix.abstract =3D true;
> >          addr->u.q_unix.has_tight =3D true;
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000000f1a3505c77a3fa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 19, 2021 at 5:49 PM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, Jul 19, 2021 at 05:01:12PM +0400, <a href=3D"mailto:marcandre=
.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote=
:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Commit 776b97d360 &quot;qemu-sockets: add abstract UNIX domain socket<=
br>
&gt; support&quot; neglected to update socket_sockaddr_to_address_unix() an=
d<br>
&gt; copied the whole sun_path without taking &quot;salen&quot; into accoun=
t.<br>
&gt; <br>
&gt; Later, commit 3b14b4ec49 &quot;sockets: Fix socket_sockaddr_to_address=
_unix()<br>
&gt; for abstract sockets&quot; handled the abstract UNIX path, by strippin=
g the<br>
&gt; leading \0 character and fixing address details, but didn&#39;t use sa=
len<br>
&gt; either.<br>
&gt; <br>
&gt; Not taking &quot;salen&quot; into account may result in incorrect &quo=
t;path&quot; being<br>
&gt; returned in monitors commands, as we read past the address which is no=
t<br>
&gt; necessarily \0-terminated.<br>
<br>
So IIUC, this is only affecting what is printed in the monitor<br>
when querying chardevs, not the actual functional behaviour<br>
between clients/servers connecting/listening ?<br>
<br></blockquote><div><br></div><div>I think so, both hmp &amp; qmp, and th=
e info_report() in server_accept_sync(). But I didn&#39;t carefully review =
all the potential users (who else could they be?).<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Fixes: 776b97d3605ed0fc94443048fdf988c7725e38a9<br>
&gt; Fixes: 3b14b4ec49a801067da19d6b8469eb1c1911c020<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 util/qemu-sockets.c | 5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
&gt; index 080a240b74..f2f3676d1f 100644<br>
&gt; --- a/util/qemu-sockets.c<br>
&gt; +++ b/util/qemu-sockets.c<br>
&gt; @@ -1345,13 +1345,16 @@ socket_sockaddr_to_address_unix(struct sockadd=
r_storage *sa,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SocketAddress *addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct sockaddr_un *su =3D (struct sockaddr_un *)s=
a;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 assert(salen &gt;=3D sizeof(su-&gt;sun_family) + 1 &amp=
;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0salen &lt;=3D sizeof(struct =
sockaddr_un));<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 addr =3D g_new0(SocketAddress, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 addr-&gt;type =3D SOCKET_ADDRESS_TYPE_UNIX;<br>
&gt;=C2=A0 #ifdef CONFIG_LINUX<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!su-&gt;sun_path[0]) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Linux abstract socket */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.path =3D g_strndup=
(su-&gt;sun_path + 1,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=
of(su-&gt;sun_path) - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sale=
n - sizeof(su-&gt;sun_family) - 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.has_abstract =3D t=
rue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.abstract =3D true;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.q_unix.has_tight =3D true=
;<br>
<br>
Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--0000000000000f1a3505c77a3fa7--


