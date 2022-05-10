Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0830521B56
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 16:09:02 +0200 (CEST)
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noQXt-0006NR-Mr
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 10:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1noMp7-0000Xf-Fh
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:10:34 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:35511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1noMp4-0007zz-GC
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:10:33 -0400
Received: by mail-oi1-x231.google.com with SMTP id m25so17991419oih.2
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=llKiAx4B/+NOfc8CGhXHaVSUY97POH5TGLjq37RuNdw=;
 b=Q2fCj0bUS8cg+41CwdFho8HNnhLUFIfkl6C0lNGTJ2XTDJcrW0vAz7LH8HP1owWLzy
 dV/PenCFlwjYBNlaSInrxT62JaGE4pgfBYgaSjIVs1dviCdsiOIpXmxErDem+zicjA9W
 KYmJEs98VOFMNB4tCVYLgCKEq1xOUnlhRSfZiQlhRzApLEV6P8m7tCgZSNgl6mL5j7Wr
 wMsERIbvc7PW13sZLcjc/tDIBQyNBe+ClabDyRbqEPv6jpeD07mRWcSbZbY3E+OMupQY
 /oPMk21E+bL19nLfRCEwCdmaYwUTddhx72kJwX7kER8xQby00GQeg5SMv/VtS6LZx6kd
 uZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=llKiAx4B/+NOfc8CGhXHaVSUY97POH5TGLjq37RuNdw=;
 b=iC36COLqbK0o7EAaMZUAzKLAKE7aTLP3firqbvpKUco7oR8lkpGCd/wKbbnCFqkikQ
 vl6Xrb1geDOBkPek/o5j/WBESTyVDxus2glcVhfylsRjnOAvAPhOy1atRV+cvSHBi9ub
 1pVWjbk+wUlrgmWH6R2iJ0xvnbj0ArTxGrYmbinQL9+qmflmjIxT6hLkFWvLDRdzsOTp
 yMfc34QxOrknKP4n7uTnVf8HtVz4+MpOKNrivWFUmJ/iRVqSyqi2dv/wgCXEGWxfr+ER
 3fcKRt6nowHnsYpqWJSbOrp528iUAWzbmpIb73Leb9OqRSkpaOokZg/yso5kGtcvfa9v
 aF1Q==
X-Gm-Message-State: AOAM532x/j+g3ofnPeSxyfFeuR8mUCDcnoEbnWjuO0q054EMA1N+VWH3
 4DFHVlAKdaXrv/B7sjxqJm5Hw1lXPzq1r8B41U8=
X-Google-Smtp-Source: ABdhPJxyIa6p+YIqxPWT25eWHhboLReEVHYX2crBN/4kxFfQXkJw5a1B0izhiCCKwXeJyavq8YpLSQ5jd6mFuqd8RhI=
X-Received: by 2002:a05:6808:2016:b0:328:1b41:4036 with SMTP id
 q22-20020a056808201600b003281b414036mr1114407oiw.249.1652177427666; Tue, 10
 May 2022 03:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220509173618.467207-1-lvivier@redhat.com>
 <Ynohv8LzGG1vLy9N@redhat.com>
 <20220510105908.607c4de7@elisabeth> <Ynou6ASuaaP9aVCB@redhat.com>
In-Reply-To: <Ynou6ASuaaP9aVCB@redhat.com>
From: Ralph Schmieder <ralph.schmieder@gmail.com>
Date: Tue, 10 May 2022 12:10:16 +0200
Message-ID: <CAKLQTLNg4DGpKpHcjozZsaOWVUmj+RKFRyjdPPZrYX+J79E84A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] qapi: net: add unix socket type support to netdev
 backend
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Stefano Brivio <sbrivio@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ae9a3b05dea5885a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=ralph.schmieder@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 May 2022 09:56:51 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ae9a3b05dea5885a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks very promising to me as it provides the flexibility needed for
all the permutations.  Thanks for looking into it!

On Tue, May 10, 2022 at 11:22 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> On Tue, May 10, 2022 at 10:59:08AM +0200, Stefano Brivio wrote:
> > On Tue, 10 May 2022 09:26:39 +0100
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >
> > > On Mon, May 09, 2022 at 07:36:12PM +0200, Laurent Vivier wrote:
> > > > "-netdev socket" only supports inet sockets.
> > > >
> > > > It's not a complex task to add support for unix sockets, but
> > > > the socket netdev parameters are not defined to manage well unix
> > > > socket parameters.
> > > >
> > > > As discussed in:
> > > >
> > > >   "socket.c added support for unix domain socket datagram transport=
"
> > > >
> https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@g=
mail.com/
> > > >
> > > > This series adds support of unix socket type using SocketAddress
> QAPI structure.
> > > >
> > > > A new netdev backend "socket-ng" is added, that is barely a copy of
> "socket"
> > > > backend but it uses the SocketAddress QAPI to provide socket
> parameters.
> > > > And then it also implement unix sockets (TCP and UDP).
> > >
> > > So pulling in the QAPI from patch 2
> > >
> > >    { 'enum': 'NetdevSocketNGMode',
> > >      'data':  [ 'dgram', 'server', 'client' ] }
> > >
> > >    { 'struct': 'NetdevSocketNGOptions',
> > >      'data': {
> > >        'mode':    'NetdevSocketNGMode',
> > >        '*addr':   'SocketAddress',
> > >        '*remote': 'SocketAddress',
> > >        '*local':  'SocketAddress' } }
> > >
> > > > Some examples of CLI syntax:
> > > >
> > > >   for TCP:
> > > >
> > > >   -netdev
> socket-ng,id=3Dsocket0,mode=3Dserver,addr.type=3Dinet,addr.host=3Dlocalho=
st,addr.port=3D1234
> > > >   -netdev
> socket-ng,id=3Dsocket0,mode=3Dclient,addr.type=3Dinet,addr.host=3Dlocalho=
st,addr.port=3D1234
> > > >
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Ddgram,\
> > > >           local.type=3Dinet,local.host=3Dlocalhost,local.port=3D123=
4,\
> > > >           remote.type=3Dinet,remote.host=3Dlocalhost,remote.port=3D=
1235
> > > >
> > > >   for UNIX:
> > > >
> > > >   -netdev
> socket-ng,id=3Dsocket0,mode=3Dserver,addr.type=3Dunix,addr.path=3D/tmp/qe=
mu0
> > > >   -netdev
> socket-ng,id=3Dsocket0,mode=3Dclient,addr.type=3Dunix,addr.path=3D/tmp/qe=
mu0
> > > >
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Ddgram,\
> > > >           local.type=3Dunix,local.path=3D/tmp/qemu0,\
> > > >           remote.type=3Dunix,remote.path=3D/tmp/qemu1
> > > >
> > > >   for FD:
> > > >
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Dserver,addr.type=3Dfd,addr.=
str=3D4
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Dclient,addr.type=3Dfd,addr.=
str=3D5
> > > >
> > > >   -netdev socket-ng,id=3Dsocket0,mode=3Ddgram,local.type=3Dfd,addr.=
str=3D4
> > >
> > >                                                           ^^^
> local.str=3D4
> > >
> > > I notice that in all these examples, mode=3Dclient/server always use
> > > the 'addr' field, and mode=3Ddgram always uses the 'local'/'remote'
> > > fields. IOW, there is almost no commonality between the dgram scenari=
o
> > > and the stream scenario, which feels sub-optimal.
> > >
> > > Two alternatives come to mind
> > >
> > >  - mode=3Dclient could use 'remote' and mode=3Dserver could use 'loca=
l',
> > >    removing the 'addr' field entirely
> >
> > To me, "mode is client, address is x" sounds more intuitive than "mode
> > is client, remote is x". I mean, of course it's the remote address --
> > that's a bit redundant.
> >
> > >  - Have completely separate backends, ie '-netdev stream' for
> > >    client/server TCP/UNIX sockets, and '-netdev dgram' for UDP
> > >    sockets, removing 'mode' field.
> >
> > ...this won't work, though, because UNIX domain sockets can be
> > stream-oriented or datagram-oriented.
>
> Sure it can work, both the 'stream' and 'dgram' backends would
> allow the full range of addr types as they're independant config
> dimensions
>
>
>     -netdev
> stream,server=3Dno,addr.type=3Dinet,addr.host=3Dlocalhost,addr.port=3D123=
4
>     -netdev stream,server=3Dno,addr.type=3Dunix,addr.path=3D/some/stream/=
sock
>
>
>     -netdev dgram,id=3Dndev0,\
>             local.type=3Dinet,local.host=3Dlocalhost,local.port=3D1234,\
>             remote.type=3Dinet,remote.host=3Dlocalhost,remote.port=3D1235
>     -netdev dgram,id=3Dndev0,\
>             local.type=3Dunix,local.path=3D/some/dgram/sock0,
>             remote.type=3Dunix,remote.path=3D/some/dgram/sock1
>
>
> With regards,
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

--=20
Ralph Schmieder
Holtzstr. 2
76135 Karlsruhe
Germany
ralph.schmieder@gmail.com

--000000000000ae9a3b05dea5885a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This looks very promising to me as it provides the flexibi=
lity needed for all the permutations.=C2=A0 Thanks for looking into it!</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, May 10, 2022 at 11:22 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:=
berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Tue, May 10, 2022 at 10:59:08AM =
+0200, Stefano Brivio wrote:<br>
&gt; On Tue, 10 May 2022 09:26:39 +0100<br>
&gt; Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" tar=
get=3D"_blank">berrange@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, May 09, 2022 at 07:36:12PM +0200, Laurent Vivier wrote:<b=
r>
&gt; &gt; &gt; &quot;-netdev socket&quot; only supports inet sockets.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; It&#39;s not a complex task to add support for unix sockets,=
 but<br>
&gt; &gt; &gt; the socket netdev parameters are not defined to manage well =
unix<br>
&gt; &gt; &gt; socket parameters.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; As discussed in:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0&quot;socket.c added support for unix domain soc=
ket datagram transport&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"https://lore.kernel.org/qemu-devel/1C=
0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/" rel=3D"noreferrer" target=3D=
"_blank">https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E6=
7BE60@gmail.com/</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This series adds support of unix socket type using SocketAdd=
ress QAPI structure.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; A new netdev backend &quot;socket-ng&quot; is added, that is=
 barely a copy of &quot;socket&quot;<br>
&gt; &gt; &gt; backend but it uses the SocketAddress QAPI to provide socket=
 parameters.<br>
&gt; &gt; &gt; And then it also implement unix sockets (TCP and UDP).=C2=A0=
 <br>
&gt; &gt; <br>
&gt; &gt; So pulling in the QAPI from patch 2<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 { &#39;enum&#39;: &#39;NetdevSocketNGMode&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;data&#39;:=C2=A0 [ &#39;dgram&#39;, &#39=
;server&#39;, &#39;client&#39; ] }<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 { &#39;struct&#39;: &#39;NetdevSocketNGOptions&#39;,=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;data&#39;: {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;mode&#39;:=C2=A0 =C2=A0 &#39;Netd=
evSocketNGMode&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*addr&#39;:=C2=A0 =C2=A0&#39;Sock=
etAddress&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*remote&#39;: &#39;SocketAddress&=
#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*local&#39;:=C2=A0 &#39;SocketAdd=
ress&#39; } }<br>
&gt; &gt; <br>
&gt; &gt; &gt; Some examples of CLI syntax:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0for TCP:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0-netdev socket-ng,id=3Dsocket0,mode=3Dserver,add=
r.type=3Dinet,addr.host=3Dlocalhost,addr.port=3D1234<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-netdev socket-ng,id=3Dsocket0,mode=3Dclient,add=
r.type=3Dinet,addr.host=3Dlocalhost,addr.port=3D1234<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0-netdev socket-ng,id=3Dsocket0,mode=3Ddgram,\<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local.type=3Dinet,lo=
cal.host=3Dlocalhost,local.port=3D1234,\<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remote.type=3Dinet,r=
emote.host=3Dlocalhost,remote.port=3D1235<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0for UNIX:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0-netdev socket-ng,id=3Dsocket0,mode=3Dserver,add=
r.type=3Dunix,addr.path=3D/tmp/qemu0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-netdev socket-ng,id=3Dsocket0,mode=3Dclient,add=
r.type=3Dunix,addr.path=3D/tmp/qemu0<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0-netdev socket-ng,id=3Dsocket0,mode=3Ddgram,\<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local.type=3Dunix,lo=
cal.path=3D/tmp/qemu0,\<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remote.type=3Dunix,r=
emote.path=3D/tmp/qemu1<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0for FD:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0-netdev socket-ng,id=3Dsocket0,mode=3Dserver,add=
r.type=3Dfd,addr.str=3D4<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-netdev socket-ng,id=3Dsocket0,mode=3Dclient,add=
r.type=3Dfd,addr.str=3D5<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0-netdev socket-ng,id=3Dsocket0,mode=3Ddgram,loca=
l.type=3Dfd,addr.str=3D4=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^ lo=
cal.str=3D4<br>
&gt; &gt; <br>
&gt; &gt; I notice that in all these examples, mode=3Dclient/server always =
use<br>
&gt; &gt; the &#39;addr&#39; field, and mode=3Ddgram always uses the &#39;l=
ocal&#39;/&#39;remote&#39;<br>
&gt; &gt; fields. IOW, there is almost no commonality between the dgram sce=
nario<br>
&gt; &gt; and the stream scenario, which feels sub-optimal.<br>
&gt; &gt; <br>
&gt; &gt; Two alternatives come to mind<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 - mode=3Dclient could use &#39;remote&#39; and mode=3Dserve=
r could use &#39;local&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 removing the &#39;addr&#39; field entirely<br>
&gt; <br>
&gt; To me, &quot;mode is client, address is x&quot; sounds more intuitive =
than &quot;mode<br>
&gt; is client, remote is x&quot;. I mean, of course it&#39;s the remote ad=
dress --<br>
&gt; that&#39;s a bit redundant.<br>
&gt; <br>
&gt; &gt;=C2=A0 - Have completely separate backends, ie &#39;-netdev stream=
&#39; for<br>
&gt; &gt;=C2=A0 =C2=A0 client/server TCP/UNIX sockets, and &#39;-netdev dgr=
am&#39; for UDP<br>
&gt; &gt;=C2=A0 =C2=A0 sockets, removing &#39;mode&#39; field.<br>
&gt; <br>
&gt; ...this won&#39;t work, though, because UNIX domain sockets can be<br>
&gt; stream-oriented or datagram-oriented.<br>
<br>
Sure it can work, both the &#39;stream&#39; and &#39;dgram&#39; backends wo=
uld<br>
allow the full range of addr types as they&#39;re independant config<br>
dimensions<br>
<br>
<br>
=C2=A0 =C2=A0 -netdev stream,server=3Dno,addr.type=3Dinet,addr.host=3Dlocal=
host,addr.port=3D1234<br>
=C2=A0 =C2=A0 -netdev stream,server=3Dno,addr.type=3Dunix,addr.path=3D/some=
/stream/sock<br>
<br>
<br>
=C2=A0 =C2=A0 -netdev dgram,id=3Dndev0,\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local.type=3Dinet,local.host=3Dlo=
calhost,local.port=3D1234,\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote.type=3Dinet,remote.host=3D=
localhost,remote.port=3D1235<br>
=C2=A0 =C2=A0 -netdev dgram,id=3Dndev0,\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local.type=3Dunix,local.path=3D/s=
ome/dgram/sock0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote.type=3Dunix,remote.path=3D=
/some/dgram/sock1<br>
<br>
<br>
With regards,<br>
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Ralph Schmieder<br>Holtzstr. 2<br>76135 Karlsruh=
e<br>Germany<br><a href=3D"mailto:ralph.schmieder@gmail.com" target=3D"_bla=
nk">ralph.schmieder@gmail.com</a></div>

--000000000000ae9a3b05dea5885a--

