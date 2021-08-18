Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71033F0CB6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:24:59 +0200 (CEST)
Received: from localhost ([::1]:52052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS7O-0000Gv-RM
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mGRMo-0004DH-C7
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:36:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mGRMj-0003U2-Cw
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629315403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MtSRlnhi3JtiTb06IZCub2AI5WRVpz899kqCg84XIpo=;
 b=FDoOJrdghYeD5C1odhx+I4AX+APfy+4iNpiju5ZtPDJveUzW+DIXkSHkCXDxa/dVOsKd0S
 ZpnLFHItB154W1Bb/CgaNBOhqPVWs9JU5zmlR1MQoJPBZPUncNwUev8ez8dmyy8EKo0KR5
 Ei7T+R3KhYZBK4XWGgC7k59Xxjg1P8E=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-U8SSHaZBONOwrnOks2C1MQ-1; Wed, 18 Aug 2021 15:36:40 -0400
X-MC-Unique: U8SSHaZBONOwrnOks2C1MQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 e17-20020a0568081491b02901f566a77bb8so1490442oiw.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MtSRlnhi3JtiTb06IZCub2AI5WRVpz899kqCg84XIpo=;
 b=HGhRjZliuJA+xUR4ocaNUU0Xdc6520uuZ0Oo7Z55ldmbF2geM+sBx/XiqiUnBRhD9H
 3auBg34RUxikh4PRCwQKeQvLrlaP2ae8DqLA1kUuD0Nnf1u17g/1fkW2/juEyM9+ZaXk
 9v0Ys7AbCPiuY5CHnlxMiMywxRYHyoOBcipDD4ATkrWjPpzgdmkcfFoIODUOyMu0wmGU
 Bz9m2N5C7KgWTp6+K/CxnDyZQdjZnfRiRbz4hlsh0hE/lQIY9/cAxyGjTUIt7dDOMqaa
 Baa9ufmUngOQy/d/v8vrrRa5kg8BO32eynwC07kC4kYOhTBal1jAFU0mUdhMmLdNSy72
 5S6g==
X-Gm-Message-State: AOAM530DiugCeVnNELOuLueDPTCBaTQhMcTnAD8RwAz44cZjVecOrw7F
 A6XYa5FRiz7l4sNselEt0GKDUYPFOMiEGAHUr0Hf75kOHgipv0vzH4Swpp7NuQ6mXnH5c6rFVoU
 hpeASNtNlQTh/TEqRH+lzf6/i+9XfyAw=
X-Received: by 2002:a05:6808:1906:: with SMTP id
 bf6mr8219914oib.52.1629315398742; 
 Wed, 18 Aug 2021 12:36:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqiQq3umqcq3jZ+E8Gze1QoeJWlzp6c3tuYtN0e+nlY89SYPJf5CvydpMIBeKNxVtPvO7ZyJFSt1Tx9wNuSMg=
X-Received: by 2002:a05:6808:1906:: with SMTP id
 bf6mr8219893oib.52.1629315398535; 
 Wed, 18 Aug 2021 12:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-10-niteesh.gs@gmail.com>
 <CAFn=p-bBXyDQDa7-sD2_zOwU-QVdYJLEJ+LwH2t8472LHgvHyA@mail.gmail.com>
 <CAN6ztm--n7FuOm2DMj8nbpMr=-_LyiFM-7J0gZymqKddrZ6rOg@mail.gmail.com>
In-Reply-To: <CAN6ztm--n7FuOm2DMj8nbpMr=-_LyiFM-7J0gZymqKddrZ6rOg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 18 Aug 2021 15:36:27 -0400
Message-ID: <CAFn=p-boj5GurWmTQEnNSRZtaLPWvbLbqx_bh-JRmxSj_ZM1QQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] python/aqmp-tui: Add QMP connection manager
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008e9cd705c9da8db8"
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008e9cd705c9da8db8
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 3:07 PM Niteesh G. S. <niteesh.gs@gmail.com> wrote:

>
>
> On Tue, Aug 17, 2021 at 10:21 AM John Snow <jsnow@redhat.com> wrote:
>
>>
>>
>> On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
>> wrote:
>>
>>
[...]


>
>>
>>> +
>>> +
>>>  class App(QMPClient):
>>> -    def __init__(self, address: Union[str, Tuple[str, int]]) -> None:
>>> +    def __init__(self, address: Union[str, Tuple[str, int]],
>>> num_retries: int,
>>> +                 retry_delay: Optional[int]) -> None:
>>>          urwid.register_signal(type(self), UPDATE_MSG)
>>>          self.window = Window(self)
>>>          self.address = address
>>>          self.aloop: Optional[Any] = None  # FIXME: Use more concrete
>>> type.
>>> +        self.num_retries = num_retries
>>> +        self.retry_delay = retry_delay
>>> +        self.retry: bool = False
>>> +        self.disconnecting: bool = False
>>>
>>
>> Why is this one needed again ? ...
>>
>

> A race condition occurs in protocol.py line 597
> The reason behind this is there are two disconnect calls initiated. The
> first one via kill_app
> and the second one via manage_connection when the state is set to
> disconnecting by the first call.
> One of the calls set's the state to IDLE(protocol.py:584) after it has
> finished disconnecting, meanwhile
> the second call is somehow in the process of disconnecting and assert the
> state to be in DISCONNECTING
> in protocol.py:597, which it is not since it has been set to IDLE by the
> first call.
>
> If I don't gaurd against the second call I get the following exception
>
> ------------------------------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/home/niteesh/development/qemu/python/.venv/bin/aqmp-tui", line
> 33, in <module>
>     sys.exit(load_entry_point('qemu', 'console_scripts', 'aqmp-tui')())
>   File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
> 695, in main
>     app.run(args.asyncio_debug)
>   File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
> 444, in run
>     raise err
>   File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
> 441, in run
>     main_loop.run()
>   File
> "/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
> line 287, in run
>     self._run()
>   File
> "/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
> line 385, in _run
>     self.event_loop.run()
>   File
> "/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
> line 1494, in run
>     reraise(*exc_info)
>   File
> "/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/compat.py",
> line 58, in reraise
>     raise value
>   File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
> 391, in manage_connection
>     await self.disconnect()
>   File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
> 312, in disconnect
>     raise err
>   File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
> 300, in disconnect
>     await super().disconnect()
>   File "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py", line
> 302, in disconnect
>     await self._wait_disconnect()
>   File "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py", line
> 583, in _wait_disconnect
>     self._cleanup()
>   File "/home/niteesh/development/qemu/python/qemu/aqmp/qmp_client.py",
> line 331, in _cleanup
>     super()._cleanup()
>   File "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py", line
> 597, in _cleanup
>     assert self.runstate == Runstate.DISCONNECTING
> AssertionError
>
> -------------------------------------------------------------------------------------------
>

Hm, OK. I'm not sure if this is a bug on my part or not yet, I'll
investigate.


>      def add_to_history(self, msg: str, level: Optional[str] = None) ->
>>> None:
>>> @@ -119,7 +132,7 @@ def _cb_inbound(self, msg: Message) -> Message:
>>>              LOGGER.info('Error server disconnected before reply')
>>>              urwid.emit_signal(self, UPDATE_MSG,
>>>                                '{"error": "Server disconnected before
>>> reply"}')
>>> -            self._set_status("Server disconnected")
>>> +            await self.disconnect()
>>>          except Exception as err:
>>>              LOGGER.error('Exception from _send_to_server: %s', str(err))
>>>              raise err
>>> @@ -136,15 +149,29 @@ def kill_app(self) -> None:
>>>          create_task(self._kill_app())
>>
>> Is this required? I would have hoped that after calling disconnect that
>> the state would have again changed to IDLE and you wouldn't need this
>> clause here.
>>
> After you mentioned it I too felt it was redundant. But on removing it the
> whole app freezes when trying to exit.
> I logged the state after the call to disconnect, instead of being in the
> IDLE state, it is still in DISCONNECTING state.
> I suspect this results in the constant infinite looping which doesn't give
> other coroutines a chance to run and blocks
> the event loop thus resulting in the freezing of the app. But I am not
> sure why the state isn't changing to IDLE.
>

Hmm ... That may well be a bug in AQMP then. I will investigate.

--0000000000008e9cd705c9da8db8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 17, 2021 at 3:07 PM Nitee=
sh G. S. &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Aug 17, 2021 at 10:21 AM John Snow &lt;<a href=3D"mailto:jsnow@redhat=
.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu &lt;<a href=3D"mailto:n=
iteesh.gs@gmail.com" target=3D"_blank">niteesh.gs@gmail.com</a>&gt; wrote:<=
br></div><br></div></div></blockquote></div></div></blockquote><div><br></d=
iv><div>[...]<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"></div></div></blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+<br>
+<br>
=C2=A0class App(QMPClient):<br>
-=C2=A0 =C2=A0 def __init__(self, address: Union[str, Tuple[str, int]]) -&g=
t; None:<br>
+=C2=A0 =C2=A0 def __init__(self, address: Union[str, Tuple[str, int]], num=
_retries: int,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retry_delay:=
 Optional[int]) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urwid.register_signal(type(self), UPDATE_=
MSG)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.window =3D Window(self)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.address =3D address<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.aloop: Optional[Any] =3D None=C2=A0 =
# FIXME: Use more concrete type.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.num_retries =3D num_retries<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry_delay =3D retry_delay<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry: bool =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.disconnecting: bool =3D False<br></blockq=
uote><div><br></div><div>Why is this one needed again ? ...<br></div></div>=
</div></blockquote></div></div></blockquote><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><div></div></div></div></blockquote><div><div style=
=3D"font-size:small"></div><div style=3D"font-size:small">A race condition =
occurs in protocol.py line 597</div><div style=3D"font-size:small">The reas=
on behind this is there are two disconnect calls initiated. The first one v=
ia kill_app</div><div style=3D"font-size:small">and the second one via mana=
ge_connection when the state is set to disconnecting by the first call.</di=
v><div style=3D"font-size:small">One of the calls set&#39;s the state to ID=
LE(protocol.py:584) after it has finished disconnecting, meanwhile</div><di=
v style=3D"font-size:small">the second call is somehow in the process of di=
sconnecting and assert the state to be in DISCONNECTING</div><div style=3D"=
font-size:small">in protocol.py:597, which it is not since it has been set =
to IDLE by the first call.</div></div><div style=3D"font-size:small"><br></=
div><div style=3D"font-size:small">If I don&#39;t gaurd against the second =
call I get the following exception</div><div style=3D"font-size:small">----=
---------------------------------------------------------------------------=
-----------</div><div style=3D"font-size:small">Traceback (most recent call=
 last):<br>=C2=A0 File &quot;/home/niteesh/development/qemu/python/.venv/bi=
n/aqmp-tui&quot;, line 33, in &lt;module&gt;<br>=C2=A0 =C2=A0 sys.exit(load=
_entry_point(&#39;qemu&#39;, &#39;console_scripts&#39;, &#39;aqmp-tui&#39;)=
())<br>=C2=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/aq=
mp_tui.py&quot;, line 695, in main<br>=C2=A0 =C2=A0 app.run(args.asyncio_de=
bug)<br>=C2=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/a=
qmp_tui.py&quot;, line 444, in run<br>=C2=A0 =C2=A0 raise err<br>=C2=A0 Fil=
e &quot;/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, =
line 441, in run<br>=C2=A0 =C2=A0 main_loop.run()<br>=C2=A0 File &quot;/hom=
e/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/m=
ain_loop.py&quot;, line 287, in run<br>=C2=A0 =C2=A0 self._run()<br>=C2=A0 =
File &quot;/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-p=
ackages/urwid/main_loop.py&quot;, line 385, in _run<br>=C2=A0 =C2=A0 self.e=
vent_loop.run()<br>=C2=A0 File &quot;/home/niteesh/development/qemu/python/=
.venv/lib/python3.6/site-packages/urwid/main_loop.py&quot;, line 1494, in r=
un<br>=C2=A0 =C2=A0 reraise(*exc_info)<br>=C2=A0 File &quot;/home/niteesh/d=
evelopment/qemu/python/.venv/lib/python3.6/site-packages/urwid/compat.py&qu=
ot;, line 58, in reraise<br>=C2=A0 =C2=A0 raise value<br>=C2=A0 File &quot;=
/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, line 391=
, in manage_connection<br>=C2=A0 =C2=A0 await self.disconnect()<br>=C2=A0 F=
ile &quot;/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py&quot;=
, line 312, in disconnect<br>=C2=A0 =C2=A0 raise err<br>=C2=A0 File &quot;/=
home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, line 300,=
 in disconnect<br>=C2=A0 =C2=A0 await super().disconnect()<br>=C2=A0 File &=
quot;/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py&quot;, lin=
e 302, in disconnect<br>=C2=A0 =C2=A0 await self._wait_disconnect()<br>=C2=
=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py&=
quot;, line 583, in _wait_disconnect<br>=C2=A0 =C2=A0 self._cleanup()<br>=
=C2=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/qmp_clien=
t.py&quot;, line 331, in _cleanup<br>=C2=A0 =C2=A0 super()._cleanup()<br>=
=C2=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/protocol.=
py&quot;, line 597, in _cleanup<br>=C2=A0 =C2=A0 assert self.runstate =3D=
=3D Runstate.DISCONNECTING<br>AssertionError<br></div><div style=3D"font-si=
ze:small">-----------------------------------------------------------------=
--------------------------</div></div></div></blockquote><div><br></div><di=
v>Hm, OK. I&#39;m not sure if this is a bug on my part or not yet, I&#39;ll=
 investigate.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0def add_to_history(self, msg: str, level: Optional[str]=
 =3D None) -&gt; None:<br>
@@ -119,7 +132,7 @@ def _cb_inbound(self, msg: Message) -&gt; Message:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOGGER.info(&#39;Error serv=
er disconnected before reply&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urwid.emit_signal(self, UPD=
ATE_MSG,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;{&quot;error&quot;: &quot;Server=
 disconnected before reply&quot;}&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(&quot;Server di=
sconnected&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.disconnect()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as err:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOGGER.error(&#39;Exception=
 from _send_to_server: %s&#39;, str(err))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise err<br>
@@ -136,15 +149,29 @@ def kill_app(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_task(self._kill_app())</blockquote=
></div></div></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_quote"><div>Is this required? I would=
 have hoped that after calling disconnect that the state would have again c=
hanged to IDLE and you wouldn&#39;t need this clause here.<br></div></div><=
/div></blockquote><div><div style=3D"font-size:small">After you mentioned i=
t I too felt it was redundant. But on removing it the whole app freezes whe=
n trying to exit.</div></div><div style=3D"font-size:small">I logged the st=
ate after the call to disconnect, instead of being in the IDLE state, it is=
 still in DISCONNECTING state.</div><div style=3D"font-size:small">I suspec=
t this results in the constant infinite looping which doesn&#39;t give othe=
r coroutines a chance to run and blocks</div><div style=3D"font-size:small"=
>the event loop thus resulting in the freezing of the app. But I am not sur=
e why the state isn&#39;t changing to IDLE.</div></div></div></blockquote><=
div><br></div><div>Hmm ... That may well be a bug in AQMP then. I will inve=
stigate.<br></div></div></div>

--0000000000008e9cd705c9da8db8--


