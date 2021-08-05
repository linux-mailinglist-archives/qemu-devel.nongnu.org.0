Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9033E1E06
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 23:31:34 +0200 (CEST)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBkxe-0001G6-Ks
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 17:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBkwo-0000aj-8I
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 17:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBkwk-0006WX-AQ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 17:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628199031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JZtFfSRyKavp7LCugIAyrXaWsWGOj1CrReen4YbPmQE=;
 b=N0L3ofCZ4Id35FVbtRFR6RHkjgLf4655yv27s4QDHht84a3b4ivMmsubu1MgJKnwmQKIWC
 t5FDNQeRfvSy0d8P++fK/wL7lsBg52k7E6GbkZU8hICuUTWKv8GgXupfegUqn4Kp0JbpEn
 NvsW1SohUJ+71TgR8nCvRm9qvD/SbMg=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-kPL6rEZ_M9SKa2G3OzmWWw-1; Thu, 05 Aug 2021 17:30:28 -0400
X-MC-Unique: kPL6rEZ_M9SKa2G3OzmWWw-1
Received: by mail-oi1-f197.google.com with SMTP id
 m20-20020a0568080f14b029025a3cb2429bso3294626oiw.20
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 14:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZtFfSRyKavp7LCugIAyrXaWsWGOj1CrReen4YbPmQE=;
 b=U9uRtbRPjzcDIAOTBKe5RKNRmbnjT7hgo9rViRsG57Ngm1GgcFBMVELJB6qEenpXJe
 rduW/5ppLMeRbqMU5yorhMSyoxTKzwLYlaBRhqncqfJlgAHkeG8UAmsFvV5I2acqIs5x
 kEcI8vXbXweORNJ19SBjsG251b8lVM/yUQRwLuTibnrL1qO27OYdPU3NvdZXFZI7kTF/
 y3YLmvvrTwl9p3c+IPm/Ya5hUfa+XTh4evZAs8kciRp7eqtG+Ljec4usSAmK77hRgcfQ
 Uk0xvu2FybyK00Zd5uQOjf4pmUcjEzDXJIs4cwjOn6BOQTR+tLhdeJbKVZt6ZvupGJNB
 Q/OQ==
X-Gm-Message-State: AOAM530t/MEPwhPEIapcSGCuMMEHGQsBJbQvnIak5+0oCEVv+UBaCshi
 hV5HRgIfedG+B4zok/ECCDnyO8PW2NUi+PCwnduze0suRzyI1hJ2nu957JaQ4XenwjfnGp20ZYK
 2jECZqvfn+YilEUI+VEz2H8VCAWFFsyE=
X-Received: by 2002:a9d:17e8:: with SMTP id j95mr5008097otj.263.1628199027121; 
 Thu, 05 Aug 2021 14:30:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWDopADcm0GnY54Vnt3ohi06ZIvfUr8H4heCaDdtrE9OHi2+T8ZMNX++YZTTRSMlPstNZjBuYtfRZmchA2X/w=
X-Received: by 2002:a9d:17e8:: with SMTP id j95mr5008084otj.263.1628199026939; 
 Thu, 05 Aug 2021 14:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210803182941.504537-1-jsnow@redhat.com>
 <20210803182941.504537-7-jsnow@redhat.com>
 <20210805210241.ey36xvb57clvl3r5@redhat.com>
In-Reply-To: <20210805210241.ey36xvb57clvl3r5@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Aug 2021 17:30:16 -0400
Message-ID: <CAFn=p-arW63EzrcTo=8Ufcx7ppyBKmBR21F-AjVqr2f_BXL8cQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/25] python/aqmp: add runstate state machine to
 AsyncProtocol
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009fefab05c8d6a04c"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009fefab05c8d6a04c
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 5, 2021 at 5:02 PM Eric Blake <eblake@redhat.com> wrote:

> On Tue, Aug 03, 2021 at 02:29:22PM -0400, John Snow wrote:
> > This serves a few purposes:
> >
> > 1. Protect interfaces when it's not safe to call them (via @require)
> >
> > 2. Add an interface by which an async client can determine if the state
> > has changed, for the purposes of connection management.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/aqmp/__init__.py |   6 +-
> >  python/qemu/aqmp/protocol.py | 159 ++++++++++++++++++++++++++++++++++-
> >  2 files changed, 160 insertions(+), 5 deletions(-)
> >
>
> > +++ b/python/qemu/aqmp/protocol.py
> > +
> > +F = TypeVar('F', bound=Callable[..., Any])  # pylint:
> disable=invalid-name
> > +
> > +
> > +# Don't Panic.
> > +def require(required_state: Runstate) -> Callable[[F], F]:
>
> Technically, the definition of F is integral to the definition of
> require, so I might have put the 'Don't Panic' note a bit sooner.  And
> it took me a while before I noticed...
>
> > +    """
> > +    Decorator: protect a method so it can only be run in a certain
> `Runstate`.
> > +
> > +    :param required_state: The `Runstate` required to invoke this
> method.
> > +    :raise StateError: When the required `Runstate` is not met.
> > +    """
> > +    def _decorator(func: F) -> F:
> > +        # _decorator is the decorator that is built by calling the
> > +        # require() decorator factory; e.g.:
> > +        #
> > +        # @require(Runstate.IDLE) def # foo(): ...
>
> Is that second # intentional?
>
>
No, that one is a mistake. Comment reflow mishap.


> > +        # will replace 'foo' with the result of '_decorator(foo)'.
> > +
> > +        @wraps(func)
> > +        def _wrapper(proto: 'AsyncProtocol[Any]',
> > +                     *args: Any, **kwargs: Any) -> Any:
> > +            # _wrapper is the function that gets executed prior to the
> > +            # decorated method.
> > +
> > +            name = type(proto).__name__
> > +
> > +            if proto.runstate != required_state:
> > +                if proto.runstate == Runstate.CONNECTING:
> > +                    emsg = f"{name} is currently connecting."
> > +                elif proto.runstate == Runstate.DISCONNECTING:
> > +                    emsg = (f"{name} is disconnecting."
> > +                            " Call disconnect() to return to IDLE
> state.")
> > +                elif proto.runstate == Runstate.RUNNING:
> > +                    emsg = f"{name} is already connected and running."
> > +                elif proto.runstate == Runstate.IDLE:
> > +                    emsg = f"{name} is disconnected and idle."
> > +                else:
> > +                    assert False
> > +                raise StateError(emsg, proto.runstate, required_state)
> > +            # No StateError, so call the wrapped method.
> > +            return func(proto, *args, **kwargs)
> > +
> > +        # Return the decorated method;
> > +        # Transforming Func to Decorated[Func].
> > +        return cast(F, _wrapper)
> > +
> > +    # Return the decorator instance from the decorator factory. Phew!
> > +    return _decorator
>
> ...that it paired with this comment, explaining what looks like a
> monstrosity, but in reality is a fairly typical and boilerplate
> implementation of a function decorator (not that you write one every
> day - the whole point of the decorator is to have a one-word
> abstraction already implemented so you DON'T have to reimplement the
> decoration yourself ;).
>
>
> +
> > +
> >  class AsyncProtocol(Generic[T]):
> >      """
> >      AsyncProtocol implements a generic async message-based protocol.
> > @@ -118,7 +202,24 @@ def __init__(self) -> None:
> >          #: exit.
> >          self._dc_task: Optional[asyncio.Future[None]] = None
> >
> > +        self._runstate = Runstate.IDLE
> > +        self._runstate_changed: Optional[asyncio.Event] = None
> > +
> > +    @property  # @upper_half
>
> Is it intentional to leave the @upper_half decorator commented out?
>
>
In this case yes, because you can't decorate a property in Python. So for
the sake of leaving it greppable, especially when those decorators are just
a "notation only" thing anyway, I figured I'd stuff it behind a comment.


> But that's minor enough that I trust you to handle it as you see fit.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
>
Thanks!


> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--0000000000009fefab05c8d6a04c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 5:02 PM Eric B=
lake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Aug =
03, 2021 at 02:29:22PM -0400, John Snow wrote:<br>
&gt; This serves a few purposes:<br>
&gt; <br>
&gt; 1. Protect interfaces when it&#39;s not safe to call them (via @requir=
e)<br>
&gt; <br>
&gt; 2. Add an interface by which an async client can determine if the stat=
e<br>
&gt; has changed, for the purposes of connection management.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/qemu/aqmp/__init__.py |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 python/qemu/aqmp/protocol.py | 159 +++++++++++++++++++++++++++++=
+++++-<br>
&gt;=C2=A0 2 files changed, 160 insertions(+), 5 deletions(-)<br>
&gt; <br>
<br>
&gt; +++ b/python/qemu/aqmp/protocol.py<br>
&gt; +<br>
&gt; +F =3D TypeVar(&#39;F&#39;, bound=3DCallable[..., Any])=C2=A0 # pylint=
: disable=3Dinvalid-name<br>
&gt; +<br>
&gt; +<br>
&gt; +# Don&#39;t Panic.<br>
&gt; +def require(required_state: Runstate) -&gt; Callable[[F], F]:<br>
<br>
Technically, the definition of F is integral to the definition of<br>
require, so I might have put the &#39;Don&#39;t Panic&#39; note a bit soone=
r.=C2=A0 And<br>
it took me a while before I noticed...<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 Decorator: protect a method so it can only be run in a =
certain `Runstate`.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 :param required_state: The `Runstate` required to invok=
e this method.<br>
&gt; +=C2=A0 =C2=A0 :raise StateError: When the required `Runstate` is not =
met.<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 def _decorator(func: F) -&gt; F:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # _decorator is the decorator that is bui=
lt by calling the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # require() decorator factory; e.g.:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # @require(Runstate.IDLE) def # foo(): ..=
.<br>
<br>
Is that second # intentional?<br>
<br></blockquote><div><br></div><div>No, that one is a mistake. Comment ref=
low mishap.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # will replace &#39;foo&#39; with the res=
ult of &#39;_decorator(foo)&#39;.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 @wraps(func)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _wrapper(proto: &#39;AsyncProtocol[An=
y]&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*args: Any, **kwargs: Any) -&gt; Any:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # _wrapper is the function =
that gets executed prior to the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # decorated method.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D type(proto).__name=
__<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if proto.runstate !=3D requ=
ired_state:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if proto.runs=
tate =3D=3D Runstate.CONNECTING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 emsg =3D f&quot;{name} is currently connecting.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif proto.ru=
nstate =3D=3D Runstate.DISCONNECTING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 emsg =3D (f&quot;{name} is disconnecting.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; Call disconnect() to return to IDLE sta=
te.&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif proto.ru=
nstate =3D=3D Runstate.RUNNING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 emsg =3D f&quot;{name} is already connected and running.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif proto.ru=
nstate =3D=3D Runstate.IDLE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 emsg =3D f&quot;{name} is disconnected and idle.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 assert False<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise StateEr=
ror(emsg, proto.runstate, required_state)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # No StateError, so call th=
e wrapped method.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return func(proto, *args, *=
*kwargs)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Return the decorated method;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Transforming Func to Decorated[Func].<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cast(F, _wrapper)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Return the decorator instance from the decorator fact=
ory. Phew!<br>
&gt; +=C2=A0 =C2=A0 return _decorator<br>
<br>
...that it paired with this comment, explaining what looks like a<br>
monstrosity, but in reality is a fairly typical and boilerplate<br>
implementation of a function decorator (not that you write one every<br>
day - the whole point of the decorator is to have a one-word<br>
abstraction already implemented so you DON&#39;T have to reimplement the<br=
>
decoration yourself ;).<br>=C2=A0 <br></blockquote></div><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 class AsyncProtocol(Generic[T]):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 AsyncProtocol implements a generic async message-b=
ased protocol.<br>
&gt; @@ -118,7 +202,24 @@ def __init__(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #: exit.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._dc_task: Optional[asyncio.Futu=
re[None]] =3D None<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._runstate =3D Runstate.IDLE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._runstate_changed: Optional[asyncio.=
Event] =3D None<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @property=C2=A0 # @upper_half<br>
<br>
Is it intentional to leave the @upper_half decorator commented out?<br>
<br></blockquote><div><br></div><div>In this case yes, because you can&#39;=
t decorate a property in Python. So for the sake of leaving it greppable, e=
specially when those decorators are just a &quot;notation only&quot; thing =
anyway, I figured I&#39;d stuff it behind a comment.<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
But that&#39;s minor enough that I trust you to handle it as you see fit.<b=
r>
<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank">eblake@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks!<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div></div>

--0000000000009fefab05c8d6a04c--


