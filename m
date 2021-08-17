Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F83EE5EB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 06:52:19 +0200 (CEST)
Received: from localhost ([::1]:38700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFr5G-0007Yl-Mc
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 00:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mFr4A-0006ne-TF
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 00:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mFr45-0002Xo-7k
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 00:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629175863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yTTiGItEpODMeQqAMmTo2/rj8tEQ/JPwpssft3/CoxA=;
 b=IW2BhWsdxJzNohd5Wyz8gsvh2gqZERInG1IHRasNSsKMi7VNPpw0mHSelvZfyV3JbHwMiG
 OBmxXYRzuy/vjhEd+V8x6A/1U040tINl9SyJ0DA/ewUnaE28asBIqOLSomLZ/10g8L307g
 N5wRfbDXGSekqZbL0QlLwhGzcLbDt4w=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-aI8hIh0JPjOFtsjRqJHIiw-1; Tue, 17 Aug 2021 00:50:58 -0400
X-MC-Unique: aI8hIh0JPjOFtsjRqJHIiw-1
Received: by mail-oo1-f70.google.com with SMTP id
 w6-20020a4adec6000000b0028b7d13a4c8so2823225oou.13
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 21:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTTiGItEpODMeQqAMmTo2/rj8tEQ/JPwpssft3/CoxA=;
 b=kM54QFa87WFaf30UaCW2iJUetdymbU/tiGhF40/To3ij/3MY4uCiQpQJL0es0t8UxT
 P4cZtAiclfri34ZVqO79QE4Aa4X/oN+4A52GQO5rXL4P2NZDUFUBOd263yUsAmDGxVO0
 F1LwwZrn3X5UbgPPKU5Qc1esyLrc3B3JRLPuKx44+253NaYw/mMOqcYEnMk7VJByJpkG
 3Qs3GMD8PbIvBBpyR+ur70chl9fg/43du6Z2XeqoLIZ2luwv2OMJLfNh0O8b3aEv/YsJ
 BorbboZtoXjlPAzDsuzi0cAeSygwlYz1RNhGzC81F3xiGGbgP0F9HCJNIlsezQybNUyr
 EUVw==
X-Gm-Message-State: AOAM5318GkBVmy/vpajcl/qE6Ae5zJGbslbCJgb8afPAUNCVfU6wHbkK
 isHbHJCS2F+s+E4bzcCOrkKKnyp75GLFMNAtRKWzcsHTzdjzh7nBGC2xeFlpdW5VELiUbfAM2O/
 KrOYqTDrq6dzFYsw1ojW+PqGk7L14Bx8=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr1193688otr.45.1629175857360; 
 Mon, 16 Aug 2021 21:50:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwytrWFZkIHoFQexaE128K5OpX0kCWZ59Q6kR4BL8zNBAWRLQac/0DOr8i4genOpFlrPTikIA4udN/LjXWIE68=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr1193671otr.45.1629175857147; 
 Mon, 16 Aug 2021 21:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-10-niteesh.gs@gmail.com>
In-Reply-To: <20210730201846.5147-10-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 17 Aug 2021 00:50:46 -0400
Message-ID: <CAFn=p-bBXyDQDa7-sD2_zOwU-QVdYJLEJ+LwH2t8472LHgvHyA@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] python/aqmp-tui: Add QMP connection manager
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003e046505c9ba109f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

--0000000000003e046505c9ba109f
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Instead of manually connecting and disconnecting from the
> server. We now rely on the runstate to manage the QMP
> connection.
>
> Along with this the ability to reconnect on certain exceptions
> has also been added.
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> ---
>  python/qemu/aqmp/aqmp_tui.py | 109 ++++++++++++++++++++++++++++++-----
>  1 file changed, 94 insertions(+), 15 deletions(-)
>
> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
> index 0d5ec62cb7..ef91883fa5 100644
> --- a/python/qemu/aqmp/aqmp_tui.py
> +++ b/python/qemu/aqmp/aqmp_tui.py
> @@ -25,8 +25,9 @@
>  import urwid_readline
>
>  from ..qmp import QEMUMonitorProtocol, QMPBadPortError
> +from .error import ProtocolError
>  from .message import DeserializationError, Message, UnexpectedTypeError
> -from .protocol import ConnectError
> +from .protocol import ConnectError, Runstate
>  from .qmp_client import ExecInterruptedError, QMPClient
>  from .util import create_task, pretty_traceback
>
> @@ -67,12 +68,24 @@ def format_json(msg: str) -> str:
>      return ' '.join(words)
>
>
> +def type_name(mtype: Any) -> str:
> +    """
> +    Returns the type name
> +    """
> +    return type(mtype).__name__
>

This is a lot of lines for something that doesn't do very much -- do we
really need it?


> +
> +
>  class App(QMPClient):
> -    def __init__(self, address: Union[str, Tuple[str, int]]) -> None:
> +    def __init__(self, address: Union[str, Tuple[str, int]], num_retries:
> int,
> +                 retry_delay: Optional[int]) -> None:
>          urwid.register_signal(type(self), UPDATE_MSG)
>          self.window = Window(self)
>          self.address = address
>          self.aloop: Optional[Any] = None  # FIXME: Use more concrete type.
> +        self.num_retries = num_retries
> +        self.retry_delay = retry_delay
> +        self.retry: bool = False
> +        self.disconnecting: bool = False
>

Why is this one needed again ? ...


>          super().__init__()
>
>      def add_to_history(self, msg: str, level: Optional[str] = None) ->
> None:
> @@ -119,7 +132,7 @@ def _cb_inbound(self, msg: Message) -> Message:
>              LOGGER.info('Error server disconnected before reply')
>              urwid.emit_signal(self, UPDATE_MSG,
>                                '{"error": "Server disconnected before
> reply"}')
> -            self._set_status("Server disconnected")
> +            await self.disconnect()
>          except Exception as err:
>              LOGGER.error('Exception from _send_to_server: %s', str(err))
>              raise err
> @@ -136,15 +149,29 @@ def kill_app(self) -> None:
>          create_task(self._kill_app())
>
>      async def _kill_app(self) -> None:
> -        # It is ok to call disconnect even in disconnect state
> +        await self.disconnect()
> +        LOGGER.debug('Disconnect finished. Exiting app')
> +        raise urwid.ExitMainLoop()
> +
> +    async def disconnect(self) -> None:
> +        if self.disconnecting:
> +            return
>          try:
> -            await self.disconnect()
> -            LOGGER.debug('Disconnect finished. Exiting app')
> +            self.disconnecting = True
> +            await super().disconnect()
> +            self.retry = True
> +        except EOFError as err:
> +            LOGGER.info('disconnect: %s', type_name(err))
> +            self.retry = True
> +        except ProtocolError as err:
> +            LOGGER.info('disconnect: %s', type_name(err))
> +            self.retry = False
>          except Exception as err:
> -            LOGGER.info('_kill_app: %s', str(err))
> -            # Let the app crash after providing a proper stack trace
> +            LOGGER.error('disconnect: Unhandled exception %s', str(err))
> +            self.retry = False
>              raise err
> -        raise urwid.ExitMainLoop()
> +        finally:
> +            self.disconnecting = False
>
>      def handle_event(self, event: Message) -> None:
>          # FIXME: Consider all states present in qapi/run-state.json
> @@ -161,14 +188,61 @@ def _get_formatted_address(self) -> str:
>              addr = f'{host}:{port}'
>          return addr
>
> -    async def connect_server(self) -> None:
> +    async def _retry_connection(self) -> Optional[str]:
> +        current_retries = 0
> +        err = None
> +        # Increase in power sequence of 2 if no delay is provided
> +        cur_delay = 1
> +        inc_delay = 2
> +        if self.retry_delay:
> +            inc_delay = 1
> +            cur_delay = self.retry_delay
> +        # initial try
> +        await self.connect_server()
> +        while self.retry and current_retries < self.num_retries:
> +            LOGGER.info('Connection Failed, retrying in %d', cur_delay)
> +            status = f'[Retry #{current_retries} ({cur_delay}s)]'
> +            self._set_status(status)
> +
> +            await asyncio.sleep(cur_delay)
> +
> +            err = await self.connect_server()
> +            cur_delay *= inc_delay
> +            # Cap delay to 5mins
> +            cur_delay = min(cur_delay, 5 * 60)
> +            current_retries += 1
> +        # If all retries failed report the last error
> +        LOGGER.info('All retries failed: %s', str(err))
> +        return type_name(err)
>

I had suggested something like an exponential backoff, but maybe a constant
delay would be a little cleaner to implement for right now without getting
too fancy over it. If you go with a simpler retry algorithm, do you think
you could clean up the logic in the retry loop here a bit more?

Something like:

for _ in range(num_retries):
    try:
        whatever_you_have_to_do_to_connect()
        return
    except ConnectError as err:
        LOGGER.info(...etc)
    await asyncio.sleep(whatever_the_delay_is)
# ran out of retries here, presumably the connection manager will just go
idle until the user interferes some other way.

In particular, I think passing around the name of the exception is a little
dubious -- we should be logging with the actual Exception we've received.


> +
> +    async def manage_connection(self) -> None:
> +        while True:
> +            if self.runstate == Runstate.IDLE:
> +                LOGGER.info('Trying to reconnect')
>

But will this be true upon the very first boot? This message might not be
right.


> +                err = await self._retry_connection()
>

This seems named oddly too, since it might be the initial attempt and not
necessarily a reconnection or a retry.


> +                # If retry is still true then, we have exhausted all our
> tries.
> +                if self.retry:
> +                    self._set_status(f'Error: {err}')
>
+                else:
> +                    addr = self._get_formatted_address()
> +                    self._set_status(f'[Connected {addr}]')
> +            elif self.runstate == Runstate.DISCONNECTING:
> +                self._set_status('[Disconnected]')
> +                await self.disconnect()
> +                # check if a retry is needed
>

Is this required? I would have hoped that after calling disconnect that the
state would have again changed to IDLE and you wouldn't need this clause
here.


> +                if self.runstate == Runstate.IDLE:
> +                    continue
> +            await self.runstate_changed()
> +
> +    async def connect_server(self) -> Optional[str]:
>          try:
>              await self.connect(self.address)
> -            addr = self._get_formatted_address()
> -            self._set_status(f'Connected to {addr}')
> +            self.retry = False
>          except ConnectError as err:
>              LOGGER.info('connect_server: ConnectError %s', str(err))
> -            self._set_status('Server shutdown')
> +            self.retry = True
> +            return type_name(err)
> +        return None
>
>      def run(self, debug: bool = False) -> None:
>          screen = urwid.raw_display.Screen()
> @@ -191,7 +265,7 @@ def run(self, debug: bool = False) -> None:
>                                     event_loop=event_loop)
>
>          create_task(self.wait_for_events(), self.aloop)
> -        create_task(self.connect_server(), self.aloop)
> +        create_task(self.manage_connection(), self.aloop)
>          try:
>              main_loop.run()
>          except Exception as err:
> @@ -333,6 +407,11 @@ def main() -> None:
>      parser = argparse.ArgumentParser(description='AQMP TUI')
>      parser.add_argument('qmp_server', help='Address of the QMP server'
>                          '< UNIX socket path | TCP addr:port >')
> +    parser.add_argument('--num-retries', type=int, default=10,
> +                        help='Number of times to reconnect before giving
> up')
> +    parser.add_argument('--retry-delay', type=int,
> +                        help='Time(s) to wait before next retry.'
> +                        'Default action is to increase delay in powers of
> 2')
>      parser.add_argument('--log-file', help='The Log file name')
>      parser.add_argument('--log-level', default='WARNING',
>                          help='Log level
> <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
> @@ -348,7 +427,7 @@ def main() -> None:
>      except QMPBadPortError as err:
>          parser.error(str(err))
>
> -    app = App(address)
> +    app = App(address, args.num_retries, args.retry_delay)
>
>      if args.log_file:
>          LOGGER.addHandler(logging.FileHandler(args.log_file))
> --
> 2.17.1
>
>
Right idea overall - possibly needs some polish and to be integrated with
an earlier patch to avoid the intermediate FIXMEs.

Thanks,
--js

--0000000000003e046505c9ba109f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S N=
iteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Instead of manually connecting and disconnecting from the<br>
server. We now rely on the runstate to manage the QMP<br>
connection.<br>
<br>
Along with this the ability to reconnect on certain exceptions<br>
has also been added.<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 109 ++++++++++++++++++++++++++++++----=
-<br>
=C2=A01 file changed, 94 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py<br=
>
index 0d5ec62cb7..ef91883fa5 100644<br>
--- a/python/qemu/aqmp/aqmp_tui.py<br>
+++ b/python/qemu/aqmp/aqmp_tui.py<br>
@@ -25,8 +25,9 @@<br>
=C2=A0import urwid_readline<br>
<br>
=C2=A0from ..qmp import QEMUMonitorProtocol, QMPBadPortError<br>
+from .error import ProtocolError<br>
=C2=A0from .message import DeserializationError, Message, UnexpectedTypeErr=
or<br>
-from .protocol import ConnectError<br>
+from .protocol import ConnectError, Runstate<br>
=C2=A0from .qmp_client import ExecInterruptedError, QMPClient<br>
=C2=A0from .util import create_task, pretty_traceback<br>
<br>
@@ -67,12 +68,24 @@ def format_json(msg: str) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0return &#39; &#39;.join(words)<br>
<br>
<br>
+def type_name(mtype: Any) -&gt; str:<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Returns the type name<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 return type(mtype).__name__<br></blockquote><div><br></div><=
div>This is a lot of lines for something that doesn&#39;t do very much -- d=
o we really need it?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
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
uote><div><br></div><div>Why is this one needed again ? ...<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__()<br>
<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_task(self._kill_app())<br>
<br>
=C2=A0 =C2=A0 =C2=A0async def _kill_app(self) -&gt; None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # It is ok to call disconnect even in disconne=
ct state<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.disconnect()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.debug(&#39;Disconnect finished. Exiting=
 app&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise urwid.ExitMainLoop()<br>
+<br>
+=C2=A0 =C2=A0 async def disconnect(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.disconnecting:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.disconnect()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.debug(&#39;Disconnect fin=
ished. Exiting app&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.disconnecting =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await super().disconnect()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except EOFError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;disconnect: %s&=
#39;, type_name(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ProtocolError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;disconnect: %s&=
#39;, type_name(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as err:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;_kill_app: %s&#=
39;, str(err))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Let the app crash after provid=
ing a proper stack trace<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.error(&#39;disconnect: Un=
handled exception %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise err<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise urwid.ExitMainLoop()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.disconnecting =3D False<br>
<br>
=C2=A0 =C2=A0 =C2=A0def handle_event(self, event: Message) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# FIXME: Consider all states present in q=
api/run-state.json<br>
@@ -161,14 +188,61 @@ def _get_formatted_address(self) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D f&#39;{host}:{port=
}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return addr<br>
<br>
-=C2=A0 =C2=A0 async def connect_server(self) -&gt; None:<br>
+=C2=A0 =C2=A0 async def _retry_connection(self) -&gt; Optional[str]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 current_retries =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Increase in power sequence of 2 if no delay =
is provided<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_delay =3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 inc_delay =3D 2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.retry_delay:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inc_delay =3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_delay =3D self.retry_delay<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # initial try<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.connect_server()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while self.retry and current_retries &lt; self=
.num_retries:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;Connection Fail=
ed, retrying in %d&#39;, cur_delay)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D f&#39;[Retry #{curren=
t_retries} ({cur_delay}s)]&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(status)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await asyncio.sleep(cur_delay)<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D await self.connect_serve=
r()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_delay *=3D inc_delay<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Cap delay to 5mins<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_delay =3D min(cur_delay, 5 *=
 60)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 current_retries +=3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If all retries failed report the last error<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;All retries failed: %s&#39;, =
str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return type_name(err)<br></blockquote><div><br=
></div><div>I had suggested something like an exponential backoff, but mayb=
e a constant delay would be a little cleaner to implement for right now wit=
hout getting too fancy over it. If you go with a simpler retry algorithm, d=
o you think you could clean up the logic in the retry loop here a bit more?=
</div></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"=
>Something like:</div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">for _ in range(num_retries):</div><div class=3D"gmail_quote">=C2=
=A0=C2=A0=C2=A0 try:</div><div class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 whatever_you_have_to_do_to_connect()</div><div class=
=3D"gmail_quote">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return<br></div=
><div class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0 except ConnectError as err:<=
/div><div class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
LOGGER.info(...etc)</div><div class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0 awai=
t asyncio.sleep(whatever_the_delay_is)</div><div class=3D"gmail_quote"># ra=
n out of retries here, presumably the connection manager will just go idle =
until the user interferes some other way.<br></div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">In particular, I think passing arou=
nd the name of the exception is a little dubious -- we should be logging wi=
th the actual Exception we&#39;ve received.<br></div><div class=3D"gmail_qu=
ote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 async def manage_connection(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while True:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.runstate =3D=3D Runstate=
.IDLE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;T=
rying to reconnect&#39;)<br></blockquote><div><br></div><div>But will this =
be true upon the very first boot? This message might not be right.<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D await self=
._retry_connection()<br></blockquote><div><br></div><div>This seems named o=
ddly too, since it might be the initial attempt and not necessarily a recon=
nection or a retry.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If retry is stil=
l true then, we have exhausted all our tries.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.retry:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
._set_status(f&#39;Error: {err}&#39;)<br></blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr=
 =3D self._get_formatted_address()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
._set_status(f&#39;[Connected {addr}]&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self.runstate =3D=3D Runsta=
te.DISCONNECTING:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(&=
#39;[Disconnected]&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.disconn=
ect()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # check if a retry=
 is needed<br></blockquote><div><br></div><div>Is this required? I would ha=
ve hoped that after calling disconnect that the state would have again chan=
ged to IDLE and you wouldn&#39;t need this clause here.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.runstate =
=3D=3D Runstate.IDLE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.runstate_changed()<br=
>
+<br>
+=C2=A0 =C2=A0 async def connect_server(self) -&gt; Optional[str]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0await self.connect(self.add=
ress)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D self._get_formatted_add=
ress()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(f&#39;Connected=
 to {addr}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except ConnectError as err:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOGGER.info(&#39;connect_se=
rver: ConnectError %s&#39;, str(err))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(&#39;Server shu=
tdown&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return type_name(err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0def run(self, debug: bool =3D False) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0screen =3D urwid.raw_display.Screen()<br>
@@ -191,7 +265,7 @@ def run(self, debug: bool =3D False) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_loop=3Devent_loo=
p)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_task(self.wait_for_events(), self.=
aloop)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self.connect_server(), self.aloop)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self.manage_connection(), self.alo=
op)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0main_loop.run()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as err:<br>
@@ -333,6 +407,11 @@ def main() -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0parser =3D argparse.ArgumentParser(description=3D&#39;A=
QMP TUI&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;qmp_server&#39;, help=3D&#39;A=
ddress of the QMP server&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&lt; UNIX socket path | TCP addr:port &gt;&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--num-retries&#39;, type=3Dint, def=
ault=3D10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&#39;Number of times to reconnect before giving up&#39;)<=
br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--retry-delay&#39;, type=3Dint,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&#39;Time(s) to wait before next retry.&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;Default action is to increase delay in powers of 2&#39;)<br=
>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--log-file&#39;, help=3D&#39;T=
he Log file name&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--log-level&#39;, default=3D&#=
39;WARNING&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&#39;Log level &lt;CRITICAL|ERROR|WARNING|INFO|DEBU=
G|&gt;&#39;)<br>
@@ -348,7 +427,7 @@ def main() -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0except QMPBadPortError as err:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parser.error(str(err))<br>
<br>
-=C2=A0 =C2=A0 app =3D App(address)<br>
+=C2=A0 =C2=A0 app =3D App(address, args.num_retries, args.retry_delay)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if args.log_file:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOGGER.addHandler(logging.FileHandler(arg=
s.log_file))<br>
-- <br>
2.17.1<br>
<br></blockquote><div><br></div><div>Right idea overall - possibly needs so=
me polish and to be integrated with an earlier patch to avoid the intermedi=
ate FIXMEs.</div><div><br></div><div>Thanks,</div><div>--js<br></div></div>=
</div>

--0000000000003e046505c9ba109f--


