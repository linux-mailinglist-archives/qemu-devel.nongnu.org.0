Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0353F477ADC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:45:54 +0100 (CET)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxupE-0000LC-Kw
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:45:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxun5-00072h-2N
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:43:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxun2-0005b1-GW
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639676615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pL066niLK1uZ+S8MRff4iRJ1+87G/bJso74MnJaCmKU=;
 b=g6Ill4DBc9VySz9q5lIxM5qCdVoba/1Vnx3Q/+wpKnh0bdqnXR8m6c0smZRuhiZgWuH7rh
 clZUeL7ER2P0LhEc0RhMe9XBSsjLYTMk7Zce4uutapfnW0grbA0uti/wsHuwpaXR9hU0o3
 fnJQv3wO1JHeY0PK/QyKSsQUWIyuT+o=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-2Z3Fy1krOIWSDRF_hKDnpA-1; Thu, 16 Dec 2021 12:43:24 -0500
X-MC-Unique: 2Z3Fy1krOIWSDRF_hKDnpA-1
Received: by mail-ua1-f70.google.com with SMTP id
 k10-20020ab059ca000000b002e631c340b0so15954149uad.5
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pL066niLK1uZ+S8MRff4iRJ1+87G/bJso74MnJaCmKU=;
 b=XBFRHQUBZVV6+jez+y2Q/uZUkyX6U24+c3pMMCA1oApyYKtwQTmNbZybPMeXko8QDU
 H40uQsdYThdu2N6LBhsy/yJtPuABu+ccgD0fSaWKeJpEQnzdCeqf+3EzfgSdWnaKvAK3
 zRSjH7QIBnJhuQs8qcHfcUSN2jiR/D4Iybc9pJ0y/+rL1t8bXhmbuE85Eq5mIJe2tccv
 0l1KuU80kINspEXGyu/g8q3X9LHrA5TZDDZq7e7pQR1DP/nVWweibeaEs2PHfo8776hJ
 /iSihBWXsJ3zJWbiaottdrHynm0lZAW9mo4QxfueXBrA3byc9K62iNo5APyobN6vY+H4
 EpNg==
X-Gm-Message-State: AOAM530rKnjbGDYUmQFYQkZZcyY+h3GaO8lWPxf7Dz5be10M++IO6b+e
 Q8e8rSCQU8msQGb2CexB1OH40zdVIREdK9cpKE8MbtvTUsA6CQ4JVXz0G7NqbpTUX7HOAzHuXy2
 cZnDUdzTvKSCrMqKprHg4gJmOTTQrWtU=
X-Received: by 2002:a05:6122:21a6:: with SMTP id
 j38mr7238619vkd.3.1639676603410; 
 Thu, 16 Dec 2021 09:43:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4aGRw1G2KLGoW4zsLifwoJAG7lHsCENQL+7aRaXCFwOX07oCPpe0+UGXcndHdQ6nIBzzC89tOAsJAg6B4zXg=
X-Received: by 2002:a05:6122:21a6:: with SMTP id
 j38mr7238605vkd.3.1639676603239; 
 Thu, 16 Dec 2021 09:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-8-jsnow@redhat.com>
 <12948281-b5ea-b11a-4fbc-f3744254d1b8@virtuozzo.com>
In-Reply-To: <12948281-b5ea-b11a-4fbc-f3744254d1b8@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 12:43:12 -0500
Message-ID: <CAFn=p-YHCmXcrUorrVg0fH-wpWLVYN7UsQr=1ja5Z=_4Nri8rg@mail.gmail.com>
Subject: Re: [PATCH v2 07/25] python/qmp: switch qemu-ga-client to AQMP
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007ba75e05d346f59c"
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
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007ba75e05d346f59c
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 5:31 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 15.12.2021 22:39, John Snow wrote:
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> Not simple to check, how much new behavior is equal to the old one.. And
> impossible to check, is everything updated that should be )
>
>
Agree, it's hard to tell. Mostly: iotests has been using the new interface
for the 6.2 release testing cycle and we didn't find many bugs, so I'm
assuming we can largely switch these, too.

Big assumption! but, I actually doubt people use this script much ...


>
> > ---
> >   python/qemu/qmp/qemu_ga_client.py | 22 +++++++++++-----------
> >   1 file changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/python/qemu/qmp/qemu_ga_client.py
> b/python/qemu/qmp/qemu_ga_client.py
> > index b3e1d98c9e..15ed430c61 100644
> > --- a/python/qemu/qmp/qemu_ga_client.py
> > +++ b/python/qemu/qmp/qemu_ga_client.py
>
> [..]
>
> >
> >       try:
> >           client = QemuGuestAgentClient(address)
> > -    except OSError as err:
> > +    except ConnectError as err:
> >           print(err)
> > -        if err.errno == errno.ECONNREFUSED:
> > -            print('Hint: qemu is not running?')
> > +        if isinstance(err.exc, ConnectionError):
> > +            print('(Is QEMU running?)')
>
> It at least a bit changed from checking errno to checking the class, I'd
> note it in commit message. And anyway commit message may be more
> informative. Still, I just don't care too much about testing framework.
>
>
OK, I'll update the commit message. The problem is that the backing errors
originally emitted by a blocking socket may no longer be exactly those
raised by the async core, so it's not 1:1.

In this case, the new QMP library always raises qemu.[a]qmp.ConnectError,
and that houses a backing exception with the "real reason". that "real
reason" may be the built-in ConnectionError, which just indicates some kind
of connection problem, including ECONNREFUSED. So the scope of this
exception has expanded a little.

>
> Nothing seems wrong to me, so weak:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> --
> Best regards,
> Vladimir
>
>

--0000000000007ba75e05d346f59c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:31 AM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">15.12.2021 22:39, John Snow wrote:<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Not simple to check, how much new behavior is equal to the old one.. And im=
possible to check, is everything updated that should be )<br>
<br></blockquote><div><br></div><div>Agree, it&#39;s hard to tell. Mostly: =
iotests has been using the new interface for the 6.2 release testing cycle =
and we didn&#39;t find many bugs, so I&#39;m assuming we can largely switch=
 these, too.</div><div><br></div><div>Big assumption! but, I actually doubt=
 people use this script much ...<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/qmp/qemu_ga_client.py | 22 +++++++++++--------=
---<br>
&gt;=C2=A0 =C2=A01 file changed, 11 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/python/qemu/qmp/qemu_ga_client.py b/python/qemu/qmp/qemu_=
ga_client.py<br>
&gt; index b3e1d98c9e..15ed430c61 100644<br>
&gt; --- a/python/qemu/qmp/qemu_ga_client.py<br>
&gt; +++ b/python/qemu/qmp/qemu_ga_client.py<br>
<br>
[..]<br>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client =3D QemuGuestAgentClien=
t(address)<br>
&gt; -=C2=A0 =C2=A0 except OSError as err:<br>
&gt; +=C2=A0 =C2=A0 except ConnectError as err:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(err)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if err.errno =3D=3D errno.ECONNREFUSED:<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;Hint: qemu is no=
t running?&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(err.exc, ConnectionError):<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;(Is QEMU running=
?)&#39;)<br>
<br>
It at least a bit changed from checking errno to checking the class, I&#39;=
d note it in commit message. And anyway commit message may be more informat=
ive. Still, I just don&#39;t care too much about testing framework.<br>
<br></blockquote><div><br></div><div>OK, I&#39;ll update the commit message=
. The problem is that the backing errors originally emitted by a blocking s=
ocket may no longer be exactly those raised by the async core, so it&#39;s =
not 1:1.</div><div><br></div><div>In this case, the new QMP library always =
raises qemu.[a]qmp.ConnectError, and that houses a backing exception with t=
he &quot;real reason&quot;. that &quot;real reason&quot; may be the built-i=
n ConnectionError, which just indicates some kind of connection problem, in=
cluding ECONNREFUSED. So the scope of this exception has expanded a little.=
<br></div></div><div class=3D"gmail_quote">=C2=A0<blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
Nothing seems wrong to me, so weak:<br>
Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@=
virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br>
<br>
</blockquote></div></div>

--0000000000007ba75e05d346f59c--


