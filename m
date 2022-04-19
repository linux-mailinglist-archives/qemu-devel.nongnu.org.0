Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44081507621
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 19:10:53 +0200 (CEST)
Received: from localhost ([::1]:56472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngrNL-0005AN-TB
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 13:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngrKw-0003br-DJ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:08:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngrKt-0004Z3-B9
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650388098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RaMyzwLWJ7vVM4uzXGYnow+dYxLVwUeQz0kuDm72Mn0=;
 b=OmvgUdrHpT7h5TmcSKIUIDRiKq7KXVc9wNRYWweVk7e8oAlO3nBcylSDcj/Xw4rW4xU5j7
 IjAl6EZ87wT6LAtym7wSIhBjyaX7QbMoSKuklST7/RDCoO/Czho3mkTc+Iz/OmzDSOVg5U
 qiEBsE1AucW+kKA22BJbpUYWt1hcsEg=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-keNLLjvuPHG-yv8jXR7L9g-1; Tue, 19 Apr 2022 13:08:16 -0400
X-MC-Unique: keNLLjvuPHG-yv8jXR7L9g-1
Received: by mail-vk1-f199.google.com with SMTP id
 t129-20020a1faa87000000b00349c9e1ceebso153787vke.17
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 10:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RaMyzwLWJ7vVM4uzXGYnow+dYxLVwUeQz0kuDm72Mn0=;
 b=OYria3nFON3UBYPp/eHqSYPb9xqDg2ITxXKv78EPwpJA/tfImr3ywOjqxs8niVDmzU
 FPnj2bGwkk+a/0FQ7+GaIz70XMCoLOQgZeED+H9b5CXrFzF9oOae5NF3+CJt3Z24Aq7v
 xayFRLaveAkr8XHCIBEkUDcekHwC7z64PtxPpbRnS5NJKteez/343+Iske1tZKgLQp0v
 zSRKNdZtc4akW/OTwLVzj8czsU9IBoQKnRjy7Qvo+uQMkpuCDE25Vvi4pp9Ve4Bsmy5O
 ffclGfIaYIvjIT0d+Twyizd40HafJqXgyfOiqXUdYdV90g9VKcOFr/xjhKJ+P+oJmXfD
 zNrg==
X-Gm-Message-State: AOAM532xecPj1e31Dnu1fWDNq5LZe5IP3Ka1K1hnSaRyS0ZSRPFcfmMf
 moNBELaam14LidD/7tjp+MbaW/Uupmj4+DwexgDylzbDJApu7VWZZmKth6AltIrnPRHmh/k3eOJ
 4JzbsjPrSGkqdoLU+zhvbr7C6nP/+C9Q=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr4435840uar.109.1650388096252; 
 Tue, 19 Apr 2022 10:08:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWhiHMfnZNdg5SEsui12EZjaJeAEghK0TPyaukuxY9FuU12HiLuqY0zeACpsnTFzIhIt8GzjwNvZfpwmPqG+U=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr4435832uar.109.1650388096044; Tue, 19
 Apr 2022 10:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220408170214.45585-1-vsementsov@openvz.org>
 <20220408170214.45585-2-vsementsov@openvz.org>
 <Yl7miQpTpPeLhfrK@redhat.com>
In-Reply-To: <Yl7miQpTpPeLhfrK@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 19 Apr 2022 13:08:06 -0400
Message-ID: <CAFn=p-Ym3_irrG_p8Wb5bmw9SQ3AOy+fAXMP3Qwm-uMLZVJwOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] python/machine.py: upgrade vm.command() method
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000034e31805dd04ec75"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 vsementsov@openvz.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000034e31805dd04ec75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022, 12:42 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Fri, Apr 08, 2022 at 08:02:13PM +0300, Vladimir Sementsov-Ogievskiy
> wrote:
> > The method is not popular, we prefer use vm.qmp() and then check
> > success by hand.. But that's not optimal. To simplify movement to
> > vm.command() support same interface improvements like in vm.qmp() and
> > rename to shorter vm.cmd().
> >
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> > ---
> >  python/qemu/machine/machine.py | 16 ++++++++++++---
> >  tests/qemu-iotests/256         | 34 ++++++++++++++++----------------
> >  tests/qemu-iotests/257         | 36 +++++++++++++++++-----------------
> >  3 files changed, 48 insertions(+), 38 deletions(-)
> >
> > diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> > index 07ac5a710b..a3fb840b93 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -648,14 +648,24 @@ def qmp(self, cmd: str,
> >              self._quit_issued =3D True
> >          return ret
> >
> > -    def command(self, cmd: str,
> > -                conv_keys: bool =3D True,
> > -                **args: Any) -> QMPReturnValue:
> > +    def cmd(self, cmd: str,
>
> FYI, the original 'command' name matches semantics of 'command'
> in the QEMUMonitorProtocol class.  The QEMUMonitorProtocol
> class has a 'cmd' method that matches semantics of 'qmp' in
> QEMUMachine.
>
> I think it is desirable to have consistency between naming in
> the two classes.
>

Broadly agree.


> The current use of both 'cmd' and 'command' in QEMUMonitorProtocol
> is horrible naming though. How is anyone supposed to remember which
> name raises the exception and which doesn't ? Urgh.
>

Also agree.


> I agree with your desire to simplify things, but if anything I would
> suggest we change both QEMUMonitorProtocol and QEMUMachine to have a
> convention more like python's subprocess module:
>
>  - 'cmd' runs without error checking, just returning the
>    reply data as is
>
>  - 'check_cmd' calls 'cmd' but raises an exception on error.
>

Not sure I'm on board here, though.

For what it's worth, in async qmp I added a single method "execute()",
mimicking the name of the field used over the wire. It uses semantics like
command() here, in that it raises an exception on error and returns only
the response data and not the entire QMP response.

I'm in favor of, broadly, an approach wherein the default behavior raises
an exception and the caller must opt-in to squelch it; either via
try-except or a check=3DFalse argument. It should be a conscious decision.

(I realize this is not what the majority of iotests already does, but I
consider that a problem to fix and not a feature. See also my recent
efforts to make qemu_img() and qemu_io() raise a CalledProcessError by
default to improve failed test diagnostics and remove logical errors from
several iotests.)

Over time, I want to migrate machine.py off of the legacy.py interface and
onto the native async qmp. I believe using asyncio subprocess and asyncio
qmp will give better failure characteristics and better error readouts.

I've prototyped this a little, but it's a big project and there are still
pre-requisites to hit before I worry about it too much. Maybe this summer
I'll tackle it. Anyway, that's nobody else's problem right now, but I have
a predisposition to not want to steer far away from what the async api
provides. Just some roadmap info in case we need to collaborate better on
the future of this module.

--js

>

--00000000000034e31805dd04ec75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 19, 2022, 12:42 PM Daniel P. Berrang=C3=A9=
 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Fri, Apr 08, 2022 at 08:02:1=
3PM +0300, Vladimir Sementsov-Ogievskiy wrote:<br>
&gt; The method is not popular, we prefer use vm.qmp() and then check<br>
&gt; success by hand.. But that&#39;s not optimal. To simplify movement to<=
br>
&gt; vm.command() support same interface improvements like in vm.qmp() and<=
br>
&gt; rename to shorter vm.cmd().<br>
&gt; <br>
&gt; Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsem=
entsov@openvz.org" target=3D"_blank" rel=3D"noreferrer">vsementsov@openvz.o=
rg</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/qemu/machine/machine.py | 16 ++++++++++++---<br>
&gt;=C2=A0 tests/qemu-iotests/256=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 34 +++=
+++++++++++++----------------<br>
&gt;=C2=A0 tests/qemu-iotests/257=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 36 +++=
++++++++++++++-----------------<br>
&gt;=C2=A0 3 files changed, 48 insertions(+), 38 deletions(-)<br>
&gt; <br>
&gt; diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mach=
ine.py<br>
&gt; index 07ac5a710b..a3fb840b93 100644<br>
&gt; --- a/python/qemu/machine/machine.py<br>
&gt; +++ b/python/qemu/machine/machine.py<br>
&gt; @@ -648,14 +648,24 @@ def qmp(self, cmd: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._quit_issued =3D =
True<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def command(self, cmd: str,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conv_keys: bo=
ol =3D True,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 **args: Any) =
-&gt; QMPReturnValue:<br>
&gt; +=C2=A0 =C2=A0 def cmd(self, cmd: str,<br>
<br>
FYI, the original &#39;command&#39; name matches semantics of &#39;command&=
#39;<br>
in the QEMUMonitorProtocol class.=C2=A0 The QEMUMonitorProtocol<br>
class has a &#39;cmd&#39; method that matches semantics of &#39;qmp&#39; in=
<br>
QEMUMachine.<br>
<br>
I think it is desirable to have consistency between naming in<br>
the two classes.<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Broadly agree.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
The current use of both &#39;cmd&#39; and &#39;command&#39; in QEMUMonitorP=
rotocol<br>
is horrible naming though. How is anyone supposed to remember which<br>
name raises the exception and which doesn&#39;t ? Urgh.=C2=A0<br></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Also agree.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
I agree with your desire to simplify things, but if anything I would<br>
suggest we change both QEMUMonitorProtocol and QEMUMachine to have a<br>
convention more like python&#39;s subprocess module:<br>
<br>
=C2=A0- &#39;cmd&#39; runs without error checking, just returning the<br>
=C2=A0 =C2=A0reply data as is<br>
<br>
=C2=A0- &#39;check_cmd&#39; calls &#39;cmd&#39; but raises an exception on =
error.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Not sure I&#39;m on board here, though.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">For what it&#39;s worth, in async qmp I added a singl=
e method &quot;execute()&quot;, mimicking the name of the field used over t=
he wire. It uses semantics like command() here, in that it raises an except=
ion on error and returns only the response data and not the entire QMP resp=
onse.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m in favor o=
f, broadly, an approach wherein the default behavior raises an exception an=
d the caller must opt-in to squelch it; either via try-except or a check=3D=
False argument. It should be a conscious decision.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">(I realize this is not what the majority of iote=
sts already does, but I consider that a problem to fix and not a feature. S=
ee also my recent efforts to make qemu_img() and qemu_io() raise a CalledPr=
ocessError by default to improve failed test diagnostics and remove logical=
 errors from several iotests.)</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Over time, I want to migrate machine.py off of the legacy.py interfa=
ce and onto the native async qmp. I believe using asyncio subprocess and as=
yncio qmp will give better failure characteristics and better error readout=
s.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ve prototyped t=
his a little, but it&#39;s a big project and there are still pre-requisites=
 to hit before I worry about it too much. Maybe this summer I&#39;ll tackle=
 it. Anyway, that&#39;s nobody else&#39;s problem right now, but I have a p=
redisposition to not want to steer far away from what the async api provide=
s. Just some roadmap info in case we need to collaborate better on the futu=
re of this module.</div><div dir=3D"auto"><br></div><div dir=3D"auto">--js<=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"></blockquote></div></div></div>

--00000000000034e31805dd04ec75--


