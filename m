Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40C3F1D50
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:50:05 +0200 (CEST)
Received: from localhost ([::1]:43758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkIu-0003bg-UL
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mGkHY-0001Zs-DU
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mGkHQ-0006Qu-QI
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629388111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ouvaIjXnef7SvSzJrVFs7qwxW0iNgtSmdkFpyZAaO2A=;
 b=VuLLFotE1Axp6d2/UiW7OVHVObN5UJogOak1BY2v7G6asW/lly9aO5Xa27arNybILG3HOP
 U+JCxBwwuoZHZCYpIvp+iZnN6iaVnIj32MTHYGdG6yhl/p1X8pFina/394yiMGVgExLYTo
 lgFYGu2MKVm0kh/65nKzJMpm21iNVyQ=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-81qo6qXZNdmyyzADa9tqnw-1; Thu, 19 Aug 2021 11:48:28 -0400
X-MC-Unique: 81qo6qXZNdmyyzADa9tqnw-1
Received: by mail-oo1-f72.google.com with SMTP id
 b32-20020a4a98e30000b029026222bb0380so2832544ooj.23
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ouvaIjXnef7SvSzJrVFs7qwxW0iNgtSmdkFpyZAaO2A=;
 b=R1RY/gLt4jdehmYi30r7ycun//J+XYPoDhAdwR19H7EqzvOR48IR2tJ915BcrXlmt3
 ctjlitGgiTFx8prsbOHOrfGkiS4th+DdR6KEOYG+gS2Fig38x6kXQM8RzqBE70CHCwbR
 3ukWoLHCJWLvXkw40xRgOGIkN7FAgVmhumcNGoKsaRWv+hqTN8Bpc+axvozrZQitI0fS
 d4JM2aQBZC0IFnipN94hrGPhfidGQi5RHAbj2eCBg1FRklrK8kzBMcwGre5e99dLDfJU
 eMK7a99Hut5eq9gfr5f3WWqm7/XauFmmhMrrWFiD5RpcjSE4gARRNLjp5H5tNNzH+2cl
 bVig==
X-Gm-Message-State: AOAM5321l05/QUO+2LZ2hNBJ0hxCDdH9W8l6/Tp5+NYZdMx6ERWriUmO
 QvotzQw6ee00UtyA3CReTdzbAaXCDNWBcn4p+LmyBotfH7qxSXR4MKgbibCOh8+aw76JXcJV301
 7Om0wGr8vL+1mORT6BMpd/53ExVhGt0Q=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr3054183oiw.112.1629388107460; 
 Thu, 19 Aug 2021 08:48:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGRgJs+zlrdLCTZLXS/mUM8b48RrBX1AwmuP6Wi5hOMsmtgQKiKOGTBEsoSTGQG/4GrLRzZV/jtCpEGBxmNEc=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr3054166oiw.112.1629388107164; 
 Thu, 19 Aug 2021 08:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210803182941.504537-1-jsnow@redhat.com>
 <20210803182941.504537-10-jsnow@redhat.com>
 <20210817192949.cglc7ah2ohlmtf43@redhat.com>
 <CAFn=p-bhHBC2dxq3EiuVOo8UBTy5AhBMwDyzFu-c0L_o4=VsAg@mail.gmail.com>
 <20210819145009.4feupwleh4iyltkw@redhat.com>
In-Reply-To: <20210819145009.4feupwleh4iyltkw@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 19 Aug 2021 11:48:16 -0400
Message-ID: <CAFn=p-bq_7eD82hW67Gr5F6ff8HQsXDCkNSQZ7HqZ_wxfBd3Fg@mail.gmail.com>
Subject: Re: [PATCH v3 09/25] python/aqmp: add AsyncProtocol.accept() method
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000054415c05c9eb7b80"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--00000000000054415c05c9eb7b80
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021 at 10:50 AM Eric Blake <eblake@redhat.com> wrote:

> On Wed, Aug 18, 2021 at 10:24:52AM -0400, John Snow wrote:
> > > >
> > > > +    @upper_half
> > > > +    @require(Runstate.IDLE)
> > > > +    async def accept(self, address: Union[str, Tuple[str, int]],
> > > > +                     ssl: Optional[SSLContext] = None) -> None:
> > > > +        """
> > > > +        Accept a connection and begin processing message queues.
> > > > +
> > > > +        If this call fails, `runstate` is guaranteed to be set back
> to
> > > `IDLE`.
> > > > +
> > > > +        :param address:
> > > > +            Address to listen to; UNIX socket path or TCP
> address/port.
> > >
> > > Can't TCP use a well-known port name instead of an int?  But limiting
> > > clients to just int port for now isn't fatal to the patch.
> > >
> > >
> > The old QMP library didn't support this, and I used the old library as my
> > template here. I'm willing to change the address format and types to be
> > more comprehensive, but I was thinking that it should probably try to
> match
> > or adhere to some standard; de-facto or otherwise. I wasn't sure which to
> > pick, and we use a few different ones in QEMU itself. Any recommendations
> > for me?
>
> I asked because I know QAPI specifies TCP as string/string (the
> hostname as a string makes absolute sense, but the port number as a
> string is because of the less-used feature of a well-known port name).
> I'm fine if the initial patch uses an int for the port number here; we
> can always add support for more formats down the road when someone
> actually has a use for them.
>
>
https://docs.python.org/3/library/socket.html#socket-families

"A pair (host, port) is used for the AF_INET address family, where host is
a string representing either a hostname in Internet domain notation like '
daring.cwi.nl' or an IPv4 address like '100.50.200.5', and port is an
integer."

The docs seem to suggest that I am actually limited only to integers here.
Do you have an example of using a string for a port number? I have to admit
I am not well acquainted with it.

--00000000000054415c05c9eb7b80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 19, 2021 at 10:50 AM Eric=
 Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Au=
g 18, 2021 at 10:24:52AM -0400, John Snow wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 @upper_half<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 @require(Runstate.IDLE)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 async def accept(self, address: Union[str, Tu=
ple[str, int]],<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ssl: Optional[SSLContext] =3D None) -&gt; None:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Accept a connection and begin p=
rocessing message queues.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 If this call fails, `runstate` =
is guaranteed to be set back to<br>
&gt; &gt; `IDLE`.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param address:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Address to listen=
 to; UNIX socket path or TCP address/port.<br>
&gt; &gt;<br>
&gt; &gt; Can&#39;t TCP use a well-known port name instead of an int?=C2=A0=
 But limiting<br>
&gt; &gt; clients to just int port for now isn&#39;t fatal to the patch.<br=
>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; The old QMP library didn&#39;t support this, and I used the old librar=
y as my<br>
&gt; template here. I&#39;m willing to change the address format and types =
to be<br>
&gt; more comprehensive, but I was thinking that it should probably try to =
match<br>
&gt; or adhere to some standard; de-facto or otherwise. I wasn&#39;t sure w=
hich to<br>
&gt; pick, and we use a few different ones in QEMU itself. Any recommendati=
ons<br>
&gt; for me?<br>
<br>
I asked because I know QAPI specifies TCP as string/string (the<br>
hostname as a string makes absolute sense, but the port number as a<br>
string is because of the less-used feature of a well-known port name).<br>
I&#39;m fine if the initial patch uses an int for the port number here; we<=
br>
can always add support for more formats down the road when someone<br>
actually has a use for them.<br>
<br></blockquote><div><br></div><div><a href=3D"https://docs.python.org/3/l=
ibrary/socket.html#socket-families">https://docs.python.org/3/library/socke=
t.html#socket-families</a></div><div><br></div><div>&quot;A pair (host, por=
t) is used for the AF_INET address family, where host is a string represent=
ing either a hostname in Internet domain notation like &#39;<a href=3D"http=
://daring.cwi.nl">daring.cwi.nl</a>&#39; or an IPv4 address like &#39;100.5=
0.200.5&#39;, and port is an integer.&quot;</div><div><br></div><div>The do=
cs seem to suggest that I am actually limited only to integers here. Do you=
 have an example of using a string for a port number? I have to admit I am =
not well acquainted with it.</div><div><br></div></div></div>

--00000000000054415c05c9eb7b80--


