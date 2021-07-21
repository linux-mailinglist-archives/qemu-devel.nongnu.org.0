Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612253D17DD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:18:39 +0200 (CEST)
Received: from localhost ([::1]:40680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ifu-0001g2-Eq
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m6IQv-0000GK-JW
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:03:09 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:34321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m6IQs-0007ZV-Vo
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:03:09 -0400
Received: by mail-io1-xd36.google.com with SMTP id g22so3769385iom.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BrWdDIUarzMp9Hd6Ja31J2qAUr16jMaBIlsrMGDODDk=;
 b=dZ5brRjQod2xdt56GkR7koGK6/WgoGRh8z0VyrjyvR5gEhY24sFbxLrHY3T3tLjiA9
 l7qTyT/GqPQ/nZQKm47XGh91tsD9T82IrwHMcKdv9LcdoeIs/LhwPVNiqSYPnkcqyqP0
 aON0J8e+XKEx/YNQH/lhXKSM6wDgHMKgbghk9ghN6p9rzHa/qyn/Pf4VYRSCjd0TFwbp
 YeG61robjyc68B0QnLf59raYF7cH0Z4F/BxEGZtZ4lDQYO6FqrCPr5Fdjm/O4bYbgTYt
 FTaqVIDbNRPBXHMAjcPQZsXgXG69Hw1BSkUbsjN7RFXT/s07Mt1rx43mrImQQXAAhNFi
 Yu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BrWdDIUarzMp9Hd6Ja31J2qAUr16jMaBIlsrMGDODDk=;
 b=RLXW1rrK6KnggpPcSv4MeEwErfeKjt1jqdLo9IA8T45C90tQpqv2bZ7JHegDr9unvN
 1LwTyNiOAbW+hBZPw0/UJp1g7+oSw0Uy6aqzr3Ms88l+N/IIQZFtEWiytZ6FegJMse6m
 InGKnfMzvwidHEUnLpU8DCMnvU7FacZDeZj0pEYUmcwHrrEsKUcYcSZ5cGF80/LH/C5X
 +u4AlesSzrVXZNcTYGJGqrpina6V88NIdvAJtKKHj0iT2sqzufqDOD3JcbiqgcfD5Ctg
 WwJziyAQC4ztEGy52p4ePHSgrIxYnIkWHqwawqdxUrIIwzSB3PjP42BZCVEq3E7hA+i6
 T1vQ==
X-Gm-Message-State: AOAM531XJ0LFt7398RlGTr93tqbrP02zqN8HJYxh/blKEQ6vbczJFmP2
 ScsRFTfMDzy1YbgGRtDkESB0Zm75+3zEJc9Y1Yg=
X-Google-Smtp-Source: ABdhPJzcrlgjvnW5ketoaeZC3EH7+aKPgebfRV6XynjbLJiLdXwnlp4YXwJ1uHCPNnijAGg0q3xi0JXlV9U5FZHVT2o=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr8242175ion.92.1626897785762; 
 Wed, 21 Jul 2021 13:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210717003253.457418-1-jsnow@redhat.com>
 <CAN6ztm8Evb+848p0TYDn63cxAxQbJ0NcfkSaf9s70rfx9rA22w@mail.gmail.com>
 <CAFn=p-YciuuRySs1F82ZyP_QGed=fbRZmzH3v7VNtdV-xM-XaA@mail.gmail.com>
 <CAN6ztm-LKWMZTURfE_q0bWpoXVKGMoqmm2jj4_CTb_kj-kEjYg@mail.gmail.com>
 <CAFn=p-YgJTWYm5-XNbQMKB2wn33Lrd2wbFRtpPeW0GTakSR0AA@mail.gmail.com>
In-Reply-To: <CAFn=p-YgJTWYm5-XNbQMKB2wn33Lrd2wbFRtpPeW0GTakSR0AA@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Thu, 22 Jul 2021 01:32:39 +0530
Message-ID: <CAN6ztm9tgh=MsrYDBBi9ZcUCWabL+NKf9WeqKJO2e9HB6oHedg@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] python: introduce Asynchronous QMP package
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009b393405c7a7a808"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009b393405c7a7a808
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 1:25 AM John Snow <jsnow@redhat.com> wrote:

> Looping qemu-devel back in: I removed them by accident by not hitting
> reply-all :(
>
> On Wed, Jul 21, 2021 at 2:06 PM Niteesh G. S. <niteesh.gs@gmail.com>
> wrote:
>
>>
>>
>> On Wed, Jul 21, 2021 at 11:03 PM John Snow <jsnow@redhat.com> wrote:
>>
>>>
>>>
>>> On Wed, Jul 21, 2021 at 1:04 PM Niteesh G. S. <niteesh.gs@gmail.com>
>>> wrote:
>>>
>>>> Hello all,
>>>>
>>>> I recently rebased(incrementally) my TUI on this V2 patch and faced an
>>>> issue.
>>>> https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v3
>>>> I decided to rebase incrementally so that I can address some of the
>>>> comments posted
>>>> in my patch series. While testing out, the initial draft of TUI
>>>> which worked fine in the V1
>>>> version of AQMP failed in this version.
>>>>
>>>> Disconnecting from a fully connected state doesn't exit cleanly.
>>>>
>>>> ---------------------------------------------------------------------------------
>>>> To reproduce the issue:
>>>> 1) Initiate a QMP server
>>>>
>>>
>>> Please provide the command line.
>>>
>> qemu-system-x86_64 -qmp tcp:localhost:1234,server,wait=on
>>
>>>
>>>
>>>> 2) Connect the TUI to the server using aqmp-tui localhost:1234
>>>> --log-file log.txt
>>>>
>>>
>>> The entry point isn't defined yet in your series, so I will assume
>>> "python3 -m qemu.aqmp.aqmp_tui localhost:1234" should work here.
>>>
>> Yup, sorry about that. I realized this later when recreated the venv.
>>
>>>
>>>
>>>> 3) Once the TUI is connected and running, press 'Esc' to exit the app.
>>>> This should result
>>>> in the following exception.
>>>>
>>>> --------------------------------------------------------------------------------------------------------------------------------------------
>>>> Transitioning from 'Runstate.IDLE' to 'Runstate.CONNECTING'.
>>>> Connecting to ('localhost', 1234) ...
>>>> Connected.
>>>> Awaiting greeting ...
>>>> Response: {
>>>>   "QMP": {
>>>>     .......... Skipping
>>>>   }
>>>> }
>>>> Negotiating capabilities ...
>>>> Request: {
>>>>   "execute": "qmp_capabilities",
>>>>     .......... Skipping
>>>>   }
>>>> }
>>>> Response: {
>>>>   "return": {}
>>>> }
>>>> Transitioning from 'Runstate.CONNECTING' to 'Runstate.RUNNING'.
>>>> Transitioning from 'Runstate.RUNNING' to 'Runstate.DISCONNECTING'.
>>>> Scheduling disconnect.
>>>> Draining the outbound queue ...
>>>> Flushing the StreamWriter ...
>>>> Cancelling writer task ...
>>>> Task.Writer: cancelled.
>>>> Task.Writer: exiting.
>>>> Cancelling reader task ...
>>>> Task.Reader: cancelled.
>>>> Task.Reader: exiting.
>>>> Closing StreamWriter.
>>>> Waiting for StreamWriter to close ...
>>>> QMP Disconnected.
>>>> Transitioning from 'Runstate.DISCONNECTING' to 'Runstate.IDLE'.
>>>> _kill_app: Connection lost
>>>> Connection lost
>>>>   | Traceback (most recent call last):
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line 246, in
>>>> run
>>>>   |     main_loop.run()
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
>>>> line 287, in run
>>>>   |     self._run()
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
>>>> line 385, in _run
>>>>   |     self.event_loop.run()
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
>>>> line 1494, in run
>>>>   |     reraise(*exc_info)
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/compat.py",
>>>> line 58, in reraise
>>>>   |     raise value
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line 206, in
>>>> _kill_app
>>>>   |     raise err
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line 201, in
>>>> _kill_app
>>>>   |     await self.disconnect()
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py", line 303, in
>>>> disconnect
>>>>   |     await self._wait_disconnect()
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py", line 573, in
>>>> _wait_disconnect
>>>>   |     await self._dc_task
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/qemu/aqmp/qmp_client.py", line 316,
>>>> in _bh_disconnect
>>>>   |     await super()._bh_disconnect()
>>>>   |   File
>>>> "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py", line 644, in
>>>> _bh_disconnect
>>>>   |     await wait_closed(self._writer)
>>>>   |   File "/home/niteesh/development/qemu/python/qemu/aqmp/util.py",
>>>> line 137, in wait_closed
>>>>   |     await flush(writer)
>>>>   |   File "/home/niteesh/development/qemu/python/qemu/aqmp/util.py",
>>>> line 49, in flush
>>>>   |     await writer.drain()
>>>>   |   File "/usr/lib/python3.6/asyncio/streams.py", line 339, in drain
>>>>   |     yield from self._protocol._drain_helper()
>>>>   |   File "/usr/lib/python3.6/asyncio/streams.py", line 210, in
>>>> _drain_helper
>>>>   |     raise ConnectionResetError('Connection lost')
>>>>   | ConnectionResetError: Connection lost
>>>>
>>>> --------------------------------------------------------------------------------------------------------------------------------------------
>>>>
>>>>
>>> I can't reproduce in Python 3.9, but I *can* reproduce in python 3.6
>>> using the pipenv environment; i.e.
>>>
>>> > make check-pipenv
>>> > pipenv shell
>>> > python3 -m qemu.aqmp.aqmp_tui 127.0.0.1:1234
>>>
>>> What python version are you using to see this failure? Is it 3.6 ?
>>>
>> Yes, I was using python 3.6. I just tried it on 3.8 and I don't face this
>> issue.
>>
>>>
>>> It seems like the wait_closed() wrapper I wrote isn't quite compatible
>>> with Python 3.6, it looks like it's not really safe to try and flush a
>>> closing socket. I was doing so in an attempt to tell when the socket had
>>> finished closing out its buffer (expecting it to normally be a no-op) but
>>> in this case even a no-op drain in 3.6 seems to raise an error if we
>>> attempt it after we've asked for the socket to close.
>>>
>>
>>
>>> wait_closed() was added in Python 3.7 and we just don't have access to
>>> it here ... I'm not sure if there's something else we can do here to serve
>>> as a workaround for not having this function.
>>>
>>> --js
>>>
>>>
> I can't find a *nice* workaround, but I found one that should probably
> work in most universes. We can remove this ugly code when we support 3.7 as
> a minimum. However, please try this patch as a fixup:
>
> diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
> index de0df44cbd7..eaa5fc7d5f9 100644
> --- a/python/qemu/aqmp/util.py
> +++ b/python/qemu/aqmp/util.py
> @@ -134,7 +134,17 @@ async def wait_closed(writer: asyncio.StreamWriter)
> -> None:
>
>      while not transport.is_closing():
>          await asyncio.sleep(0)
> -    await flush(writer)
> +
> +    # This is an ugly workaround, but it's the best I can come up with.
> +    sock = transport.get_extra_info('socket')
> +
> +    if sock is None:
> +        # Our transport doesn't have a socket? ...
> +        # Nothing we can reasonably do.
> +        return
> +
> +    while sock.fileno() != -1:
> +        await asyncio.sleep(0)
>
Thanks for the patch. I am now able to disconnect/quit without any
exceptions.

Thanks,
Niteesh.

>
>
>

--0000000000009b393405c7a7a808
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 22, 2021 at 1:25 AM John Snow &lt;<a hr=
ef=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Loopin=
g qemu-devel back in: I removed them by accident by not hitting reply-all :=
(<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Jul 21, 2021 at 2:06 PM Niteesh G. S. &lt;<a href=3D"mailto:ni=
teesh.gs@gmail.com" target=3D"_blank">niteesh.gs@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 21, 2=
021 at 11:03 PM John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D=
"_blank">jsnow@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul =
21, 2021 at 1:04 PM Niteesh G. S. &lt;<a href=3D"mailto:niteesh.gs@gmail.co=
m" target=3D"_blank">niteesh.gs@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div style=3D"fon=
t-size:small">Hello all,</div><div style=3D"font-size:small"><br></div><div=
 style=3D"font-size:small">I recently rebased(incrementally) my TUI on this=
 V2 patch and faced an issue.</div><div style=3D"font-size:small"><a href=
=3D"https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v3" tar=
get=3D"_blank">https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-protot=
ype-v3</a><br>I decided to rebase incrementally so that I can address some =
of the comments posted</div><div style=3D"font-size:small">in my patch seri=
es. While testing out, the initial=C2=A0draft of TUI which=C2=A0worked fine=
 in the V1</div><div style=3D"font-size:small">version of AQMP failed in th=
is version.</div><div style=3D"font-size:small"><br></div><div style=3D"fon=
t-size:small">Disconnecting from a fully connected state doesn&#39;t exit c=
leanly.</div><div style=3D"font-size:small">-------------------------------=
--------------------------------------------------</div><div style=3D"font-=
size:small">To reproduce the issue:</div><div style=3D"font-size:small">1) =
Initiate a QMP server</div></div></blockquote><div><br></div><div>Please pr=
ovide the command line.<br></div></div></div></blockquote><div><span class=
=3D"gmail_default" style=3D"font-size:small"></span>qemu-system-x86_64 -qmp=
 tcp:localhost:1234,server,wait=3Don</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div style=3D"font-size:small">2) Connect the TUI to the server using=
 aqmp-tui=C2=A0localhost:1234 --log-file log.txt</div></div></blockquote><d=
iv><br></div><div>The entry point isn&#39;t defined yet in your series, so =
I will assume &quot;python3 -m qemu.aqmp.aqmp_tui localhost:1234&quot; shou=
ld work here.<br></div></div></div></blockquote><div><span class=3D"gmail_d=
efault" style=3D"font-size:small">Yup, sorry about that. I realized this la=
ter when recreated the venv.</span>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div style=3D"font-size:small">3) Once the TUI is connected and =
running, press &#39;Esc&#39; to exit the app. This should result</div><div =
style=3D"font-size:small">in the following exception.</div><div style=3D"fo=
nt-size:small">------------------------------------------------------------=
---------------------------------------------------------------------------=
-----</div><div style=3D"font-size:small">Transitioning from &#39;Runstate.=
IDLE&#39; to &#39;Runstate.CONNECTING&#39;.<br>Connecting to (&#39;localhos=
t&#39;, 1234) ...<br>Connected.<br>Awaiting greeting ...<br>Response: {<br>=
=C2=A0 &quot;QMP&quot;: {<br>=C2=A0 =C2=A0 .......... Skipping<br>=C2=A0 }<=
br>}<br>Negotiating capabilities ...<br>Request: {<br>=C2=A0 &quot;execute&=
quot;: &quot;qmp_capabilities&quot;,<br>=C2=A0 =C2=A0 .......... Skipping<b=
r>=C2=A0 }<br>}<br>Response: {<br>=C2=A0 &quot;return&quot;: {}<br>}<br>Tra=
nsitioning from &#39;Runstate.CONNECTING&#39; to &#39;Runstate.RUNNING&#39;=
.<br>Transitioning from &#39;Runstate.RUNNING&#39; to &#39;Runstate.DISCONN=
ECTING&#39;.<br>Scheduling disconnect.<br>Draining the outbound queue ...<b=
r>Flushing the StreamWriter ...<br>Cancelling writer task ...<br>Task.Write=
r: cancelled.<br>Task.Writer: exiting.<br>Cancelling reader task ...<br>Tas=
k.Reader: cancelled.<br>Task.Reader: exiting.<br>Closing StreamWriter.<br>W=
aiting for StreamWriter to close ...<br>QMP Disconnected.<br>Transitioning =
from &#39;Runstate.DISCONNECTING&#39; to &#39;Runstate.IDLE&#39;.<br>_kill_=
app: Connection lost<br>Connection lost<br>=C2=A0 | Traceback (most recent =
call last):<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/development/qemu/py=
thon/qemu/aqmp/aqmp_tui.py&quot;, line 246, in run<br>=C2=A0 | =C2=A0 =C2=
=A0 main_loop.run()<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/development=
/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py&quot;, li=
ne 287, in run<br>=C2=A0 | =C2=A0 =C2=A0 self._run()<br>=C2=A0 | =C2=A0 Fil=
e &quot;/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-pack=
ages/urwid/main_loop.py&quot;, line 385, in _run<br>=C2=A0 | =C2=A0 =C2=A0 =
self.event_loop.run()<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/developme=
nt/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py&quot;, =
line 1494, in run<br>=C2=A0 | =C2=A0 =C2=A0 reraise(*exc_info)<br>=C2=A0 | =
=C2=A0 File &quot;/home/niteesh/development/qemu/python/.venv/lib/python3.6=
/site-packages/urwid/compat.py&quot;, line 58, in reraise<br>=C2=A0 | =C2=
=A0 =C2=A0 raise value<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/developm=
ent/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, line 206, in _kill_app<br>=C2=
=A0 | =C2=A0 =C2=A0 raise err<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/d=
evelopment/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, line 201, in _kill_app<=
br>=C2=A0 | =C2=A0 =C2=A0 await self.disconnect()<br>=C2=A0 | =C2=A0 File &=
quot;/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py&quot;, lin=
e 303, in disconnect<br>=C2=A0 | =C2=A0 =C2=A0 await self._wait_disconnect(=
)<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/development/qemu/python/qemu/=
aqmp/protocol.py&quot;, line 573, in _wait_disconnect<br>=C2=A0 | =C2=A0 =
=C2=A0 await self._dc_task<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/deve=
lopment/qemu/python/qemu/aqmp/qmp_client.py&quot;, line 316, in _bh_disconn=
ect<br>=C2=A0 | =C2=A0 =C2=A0 await super()._bh_disconnect()<br>=C2=A0 | =
=C2=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/protocol.=
py&quot;, line 644, in _bh_disconnect<br>=C2=A0 | =C2=A0 =C2=A0 await wait_=
closed(self._writer)<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/developmen=
t/qemu/python/qemu/aqmp/util.py&quot;, line 137, in wait_closed<br>=C2=A0 |=
 =C2=A0 =C2=A0 await flush(writer)<br>=C2=A0 | =C2=A0 File &quot;/home/nite=
esh/development/qemu/python/qemu/aqmp/util.py&quot;, line 49, in flush<br>=
=C2=A0 | =C2=A0 =C2=A0 await writer.drain()<br>=C2=A0 | =C2=A0 File &quot;/=
usr/lib/python3.6/asyncio/streams.py&quot;, line 339, in drain<br>=C2=A0 | =
=C2=A0 =C2=A0 yield from self._protocol._drain_helper()<br>=C2=A0 | =C2=A0 =
File &quot;/usr/lib/python3.6/asyncio/streams.py&quot;, line 210, in _drain=
_helper<br>=C2=A0 | =C2=A0 =C2=A0 raise ConnectionResetError(&#39;Connectio=
n lost&#39;)<br>=C2=A0 | ConnectionResetError: Connection lost<br><div>----=
---------------------------------------------------------------------------=
-------------------------------------------------------------</div></div><d=
iv style=3D"font-size:small"><br></div></div></blockquote><div><br></div><d=
iv>I can&#39;t reproduce in Python 3.9, but I *can* reproduce in python 3.6=
 using the pipenv environment; i.e.</div><div><br></div><div>&gt; make chec=
k-pipenv</div><div>&gt; pipenv shell</div><div>&gt; python3 -m qemu.aqmp.aq=
mp_tui <a href=3D"http://127.0.0.1:1234" target=3D"_blank">127.0.0.1:1234</=
a></div><div><br></div><div>What python version are you using to see this f=
ailure? Is it 3.6 ?</div></div></div></blockquote><div><span class=3D"gmail=
_default" style=3D"font-size:small">Yes, I was using python 3.6. I just tri=
ed it on 3.8 and I don&#39;t face this issue.</span></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div><br></div><div>It seems like the wait_closed() wrapper I wrote isn&#=
39;t quite compatible with Python 3.6, it looks like it&#39;s not really sa=
fe to try and flush a closing socket. I was doing so in an attempt to tell =
when the socket had finished closing out its buffer (expecting it to normal=
ly be a no-op) but in this case even a no-op drain in 3.6 seems to raise an=
 error if we attempt it after we&#39;ve asked for the socket to close.</div=
></div></div></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>wait_clo=
sed() was added in Python 3.7 and we just don&#39;t have access to it here =
... I&#39;m not sure if there&#39;s something else we can do here to serve =
as a workaround for not having this function.</div><div><br></div><div>--js=
<br></div><div><br></div></div></div></blockquote></div></div></blockquote>=
<div><br></div><div>I can&#39;t find a *nice* workaround, but I found one t=
hat should probably work in most universes. We can remove this ugly code wh=
en we support 3.7 as a minimum. However, please try this patch as a fixup:<=
/div><div><br></div><div>diff --git a/python/qemu/aqmp/util.py b/python/qem=
u/aqmp/util.py<br>index de0df44cbd7..eaa5fc7d5f9 100644<br>--- a/python/qem=
u/aqmp/util.py<br>+++ b/python/qemu/aqmp/util.py<br>@@ -134,7 +134,17 @@ as=
ync def wait_closed(writer: asyncio.StreamWriter) -&gt; None:<br>=C2=A0<br>=
=C2=A0 =C2=A0 =C2=A0while not transport.is_closing():<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0await asyncio.sleep(0)<br>- =C2=A0 =C2=A0await flush(write=
r)<br>+<br>+ =C2=A0 =C2=A0# This is an ugly workaround, but it&#39;s the be=
st I can come up with.<br>+ =C2=A0 =C2=A0sock =3D transport.get_extra_info(=
&#39;socket&#39;)<br>+<br>+ =C2=A0 =C2=A0if sock is None:<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# Our transport doesn&#39;t have a socket? ...<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0# Nothing we can reasonably do.<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return<br>+<br>+ =C2=A0 =C2=A0while sock.fileno() !=3D -1:<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0await asyncio.sleep(0)</div></div></div></blockq=
uote><div><span class=3D"gmail_default" style=3D"font-size:small">Thanks fo=
r the patch. I am now able to disconnect/quit without any exceptions.</span=
></div><div><span class=3D"gmail_default" style=3D"font-size:small"><br></s=
pan></div><div><span class=3D"gmail_default" style=3D"font-size:small">Than=
ks,</span></div><div><span class=3D"gmail_default" style=3D"font-size:small=
">Niteesh.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>=C2=A0<=
/div></div></div>
</blockquote></div></div>

--0000000000009b393405c7a7a808--

