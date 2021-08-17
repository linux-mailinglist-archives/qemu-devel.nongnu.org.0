Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0D3EF278
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 21:08:19 +0200 (CEST)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG4Re-0004iq-FJ
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 15:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mG4QM-0003Uq-Kz
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 15:06:58 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:35819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mG4QJ-0002EK-E3
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 15:06:58 -0400
Received: by mail-il1-x12b.google.com with SMTP id h29so6777346ila.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 12:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f9VKpGNyDrZAYBZKtA3kpbXwJDzdgadlsW1nbDH0ifU=;
 b=Oz5PVu8N3EUh2SkagtXT8qwLuyEDgvdSMeVTxeEZBa6F7MDbAcxqQUpEdFViGtzb3k
 dSHynNFeRgXZnh5QPoHftSpzhBMBTAhuBlDChD4Sp5wq/hL8Kg09shiaQUGBQlT0Sprr
 IFlPPx6M17bTBb7yRGnML4bK0q8TPI2HM2TrRh3x55zWi1I99gB+hFmg0tBPWNSgt8iI
 wE6VYo+VLbAXmSi2NwIc/B4sKz20pdOSofUETC7UYbr7X6/eBGECW3VS8bIZHaWoFNbO
 Cqom8Q+hX4WHHVCwHNJk50cZnMfcAyK02f9Ccz4Kvn1A9pWKGDRyn/eTnpbUul77dneF
 KmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f9VKpGNyDrZAYBZKtA3kpbXwJDzdgadlsW1nbDH0ifU=;
 b=madsCLl1Ef+0E0YvaGAlDMHRHgiosGpmG/Pz+kkkd0kG4okempvjUxHLjUTlhDG4et
 NzWIVw+omG3B36q6coV9wTE6L9QkVqeEDDrQ5DuidYHvUcCQ8kymh33OdFM2RsoVY5Z7
 2kR3Ib8y83DCs7Kt4wsJHLqXx5bzUNlK4Ex7/DFAawm3CtHh/Uiqv9wN0WfmQKmuQUo0
 MNj37yUyBrfMbV9niAN1wI6jizZH5PyRqeOad/5FqUnxHqx8VJGnfoDt5G/PCG5LcAEI
 KQ0UrcMRBWkpgqjWrirz1KpmOw6QudSdzjEFT7V2Pj9F8KjP6+xIq7FFpieQ/2jFU5RJ
 nRlg==
X-Gm-Message-State: AOAM532bZlwq4J1e8QuB8ADH+C7HlvZMN5PX2GTlUNOAJ9Bt4TejP6D1
 kUgCFPQCdLGHx80DQNN73ZYt9kk7ow4wJaWmng4=
X-Google-Smtp-Source: ABdhPJwItZj7qdQLJGy1zUVBnOCCNjFm6exKsy90gEZCnoGGdv4bpD2YgPJVbco0/A5Fd7Pl/nb8Akl8lRxaAQ84YKY=
X-Received: by 2002:a92:bf0c:: with SMTP id z12mr3398543ilh.19.1629227213245; 
 Tue, 17 Aug 2021 12:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-10-niteesh.gs@gmail.com>
 <CAFn=p-bBXyDQDa7-sD2_zOwU-QVdYJLEJ+LwH2t8472LHgvHyA@mail.gmail.com>
In-Reply-To: <CAFn=p-bBXyDQDa7-sD2_zOwU-QVdYJLEJ+LwH2t8472LHgvHyA@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Wed, 18 Aug 2021 00:36:27 +0530
Message-ID: <CAN6ztm--n7FuOm2DMj8nbpMr=-_LyiFM-7J0gZymqKddrZ6rOg@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] python/aqmp-tui: Add QMP connection manager
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004dd2c105c9c60515"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004dd2c105c9c60515
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 10:21 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
> wrote:
>
>> Instead of manually connecting and disconnecting from the
>> server. We now rely on the runstate to manage the QMP
>> connection.
>>
>> Along with this the ability to reconnect on certain exceptions
>> has also been added.
>>
>> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>> ---
>>  python/qemu/aqmp/aqmp_tui.py | 109 ++++++++++++++++++++++++++++++-----
>>  1 file changed, 94 insertions(+), 15 deletions(-)
>>
>> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
>> index 0d5ec62cb7..ef91883fa5 100644
>> --- a/python/qemu/aqmp/aqmp_tui.py
>> +++ b/python/qemu/aqmp/aqmp_tui.py
>> @@ -25,8 +25,9 @@
>>  import urwid_readline
>>
>>  from ..qmp import QEMUMonitorProtocol, QMPBadPortError
>> +from .error import ProtocolError
>>  from .message import DeserializationError, Message, UnexpectedTypeError
>> -from .protocol import ConnectError
>> +from .protocol import ConnectError, Runstate
>>  from .qmp_client import ExecInterruptedError, QMPClient
>>  from .util import create_task, pretty_traceback
>>
>> @@ -67,12 +68,24 @@ def format_json(msg: str) -> str:
>>      return ' '.join(words)
>>
>>
>> +def type_name(mtype: Any) -> str:
>> +    """
>> +    Returns the type name
>> +    """
>> +    return type(mtype).__name__
>>
>
> This is a lot of lines for something that doesn't do very much -- do we
> really need it?
>
No. This has been removed in v4.

>
>
>> +
>> +
>>  class App(QMPClient):
>> -    def __init__(self, address: Union[str, Tuple[str, int]]) -> None:
>> +    def __init__(self, address: Union[str, Tuple[str, int]],
>> num_retries: int,
>> +                 retry_delay: Optional[int]) -> None:
>>          urwid.register_signal(type(self), UPDATE_MSG)
>>          self.window = Window(self)
>>          self.address = address
>>          self.aloop: Optional[Any] = None  # FIXME: Use more concrete
>> type.
>> +        self.num_retries = num_retries
>> +        self.retry_delay = retry_delay
>> +        self.retry: bool = False
>> +        self.disconnecting: bool = False
>>
>
> Why is this one needed again ? ...
>
A race condition occurs in protocol.py line 597
The reason behind this is there are two disconnect calls initiated. The
first one via kill_app
and the second one via manage_connection when the state is set to
disconnecting by the first call.
One of the calls set's the state to IDLE(protocol.py:584) after it has
finished disconnecting, meanwhile
the second call is somehow in the process of disconnecting and assert the
state to be in DISCONNECTING
in protocol.py:597, which it is not since it has been set to IDLE by the
first call.

If I don't gaurd against the second call I get the following exception
------------------------------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/niteesh/development/qemu/python/.venv/bin/aqmp-tui", line 33,
in <module>
    sys.exit(load_entry_point('qemu', 'console_scripts', 'aqmp-tui')())
  File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
695, in main
    app.run(args.asyncio_debug)
  File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
444, in run
    raise err
  File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
441, in run
    main_loop.run()
  File
"/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
line 287, in run
    self._run()
  File
"/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
line 385, in _run
    self.event_loop.run()
  File
"/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
line 1494, in run
    reraise(*exc_info)
  File
"/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/compat.py",
line 58, in reraise
    raise value
  File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
391, in manage_connection
    await self.disconnect()
  File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
312, in disconnect
    raise err
  File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py", line
300, in disconnect
    await super().disconnect()
  File "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py", line
302, in disconnect
    await self._wait_disconnect()
  File "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py", line
583, in _wait_disconnect
    self._cleanup()
  File "/home/niteesh/development/qemu/python/qemu/aqmp/qmp_client.py",
line 331, in _cleanup
    super()._cleanup()
  File "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py", line
597, in _cleanup
    assert self.runstate == Runstate.DISCONNECTING
AssertionError
-------------------------------------------------------------------------------------------


>
>>          super().__init__()
>>
>>      def add_to_history(self, msg: str, level: Optional[str] = None) ->
>> None:
>> @@ -119,7 +132,7 @@ def _cb_inbound(self, msg: Message) -> Message:
>>              LOGGER.info('Error server disconnected before reply')
>>              urwid.emit_signal(self, UPDATE_MSG,
>>                                '{"error": "Server disconnected before
>> reply"}')
>> -            self._set_status("Server disconnected")
>> +            await self.disconnect()
>>          except Exception as err:
>>              LOGGER.error('Exception from _send_to_server: %s', str(err))
>>              raise err
>> @@ -136,15 +149,29 @@ def kill_app(self) -> None:
>>          create_task(self._kill_app())
>>
>>      async def _kill_app(self) -> None:
>> -        # It is ok to call disconnect even in disconnect state
>> +        await self.disconnect()
>> +        LOGGER.debug('Disconnect finished. Exiting app')
>> +        raise urwid.ExitMainLoop()
>> +
>> +    async def disconnect(self) -> None:
>> +        if self.disconnecting:
>> +            return
>>          try:
>> -            await self.disconnect()
>> -            LOGGER.debug('Disconnect finished. Exiting app')
>> +            self.disconnecting = True
>> +            await super().disconnect()
>> +            self.retry = True
>> +        except EOFError as err:
>> +            LOGGER.info('disconnect: %s', type_name(err))
>> +            self.retry = True
>> +        except ProtocolError as err:
>> +            LOGGER.info('disconnect: %s', type_name(err))
>> +            self.retry = False
>>          except Exception as err:
>> -            LOGGER.info('_kill_app: %s', str(err))
>> -            # Let the app crash after providing a proper stack trace
>> +            LOGGER.error('disconnect: Unhandled exception %s', str(err))
>> +            self.retry = False
>>              raise err
>> -        raise urwid.ExitMainLoop()
>> +        finally:
>> +            self.disconnecting = False
>>
>>      def handle_event(self, event: Message) -> None:
>>          # FIXME: Consider all states present in qapi/run-state.json
>> @@ -161,14 +188,61 @@ def _get_formatted_address(self) -> str:
>>              addr = f'{host}:{port}'
>>          return addr
>>
>> -    async def connect_server(self) -> None:
>> +    async def _retry_connection(self) -> Optional[str]:
>> +        current_retries = 0
>> +        err = None
>> +        # Increase in power sequence of 2 if no delay is provided
>> +        cur_delay = 1
>> +        inc_delay = 2
>> +        if self.retry_delay:
>> +            inc_delay = 1
>> +            cur_delay = self.retry_delay
>> +        # initial try
>> +        await self.connect_server()
>> +        while self.retry and current_retries < self.num_retries:
>> +            LOGGER.info('Connection Failed, retrying in %d', cur_delay)
>> +            status = f'[Retry #{current_retries} ({cur_delay}s)]'
>> +            self._set_status(status)
>> +
>> +            await asyncio.sleep(cur_delay)
>> +
>> +            err = await self.connect_server()
>> +            cur_delay *= inc_delay
>> +            # Cap delay to 5mins
>> +            cur_delay = min(cur_delay, 5 * 60)
>> +            current_retries += 1
>> +        # If all retries failed report the last error
>> +        LOGGER.info('All retries failed: %s', str(err))
>> +        return type_name(err)
>>
>
> I had suggested something like an exponential backoff, but maybe a
> constant delay would be a little cleaner to implement for right now without
> getting too fancy over it. If you go with a simpler retry algorithm, do you
> think you could clean up the logic in the retry loop here a bit more?
>
Yes, we can. I'll refactor it to constant delay.


> Something like:
>
> for _ in range(num_retries):
>     try:
>         whatever_you_have_to_do_to_connect()
>         return
>     except ConnectError as err:
>         LOGGER.info(...etc)
>     await asyncio.sleep(whatever_the_delay_is)
> # ran out of retries here, presumably the connection manager will just go
> idle until the user interferes some other way.
>

> In particular, I think passing around the name of the exception is a
> little dubious -- we should be logging with the actual Exception we've
> received.
>
This has been fixed in V4. We pass the exception now instead of just
passing around the name.

>
>
>> +
>> +    async def manage_connection(self) -> None:
>> +        while True:
>> +            if self.runstate == Runstate.IDLE:
>> +                LOGGER.info('Trying to reconnect')
>>
>
> But will this be true upon the very first boot? This message might not be
> right.
>
Yes, it also occurs in the first boot. I'll fix this in the V3.

>
>
>> +                err = await self._retry_connection()
>>
>
> This seems named oddly too, since it might be the initial attempt and not
> necessarily a reconnection or a retry.
>
Will fix that.

>
>
>> +                # If retry is still true then, we have exhausted all our
>> tries.
>> +                if self.retry:
>> +                    self._set_status(f'Error: {err}')
>>
> +                else:
>> +                    addr = self._get_formatted_address()
>> +                    self._set_status(f'[Connected {addr}]')
>> +            elif self.runstate == Runstate.DISCONNECTING:
>> +                self._set_status('[Disconnected]')
>> +                await self.disconnect()
>> +                # check if a retry is needed
>>
>
> Is this required? I would have hoped that after calling disconnect that
> the state would have again changed to IDLE and you wouldn't need this
> clause here.
>
After you mentioned it I too felt it was redundant. But on removing it the
whole app freezes when trying to exit.
I logged the state after the call to disconnect, instead of being in the
IDLE state, it is still in DISCONNECTING state.
I suspect this results in the constant infinite looping which doesn't give
other coroutines a chance to run and blocks
the event loop thus resulting in the freezing of the app. But I am not sure
why the state isn't changing to IDLE.

>
>
>> +                if self.runstate == Runstate.IDLE:
>> +                    continue
>> +            await self.runstate_changed()
>> +
>> +    async def connect_server(self) -> Optional[str]:
>>          try:
>>              await self.connect(self.address)
>> -            addr = self._get_formatted_address()
>> -            self._set_status(f'Connected to {addr}')
>> +            self.retry = False
>>          except ConnectError as err:
>>              LOGGER.info('connect_server: ConnectError %s', str(err))
>> -            self._set_status('Server shutdown')
>> +            self.retry = True
>> +            return type_name(err)
>> +        return None
>>
>>      def run(self, debug: bool = False) -> None:
>>          screen = urwid.raw_display.Screen()
>> @@ -191,7 +265,7 @@ def run(self, debug: bool = False) -> None:
>>                                     event_loop=event_loop)
>>
>>          create_task(self.wait_for_events(), self.aloop)
>> -        create_task(self.connect_server(), self.aloop)
>> +        create_task(self.manage_connection(), self.aloop)
>>          try:
>>              main_loop.run()
>>          except Exception as err:
>> @@ -333,6 +407,11 @@ def main() -> None:
>>      parser = argparse.ArgumentParser(description='AQMP TUI')
>>      parser.add_argument('qmp_server', help='Address of the QMP server'
>>                          '< UNIX socket path | TCP addr:port >')
>> +    parser.add_argument('--num-retries', type=int, default=10,
>> +                        help='Number of times to reconnect before giving
>> up')
>> +    parser.add_argument('--retry-delay', type=int,
>> +                        help='Time(s) to wait before next retry.'
>> +                        'Default action is to increase delay in powers
>> of 2')
>>      parser.add_argument('--log-file', help='The Log file name')
>>      parser.add_argument('--log-level', default='WARNING',
>>                          help='Log level
>> <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
>> @@ -348,7 +427,7 @@ def main() -> None:
>>      except QMPBadPortError as err:
>>          parser.error(str(err))
>>
>> -    app = App(address)
>> +    app = App(address, args.num_retries, args.retry_delay)
>>
>>      if args.log_file:
>>          LOGGER.addHandler(logging.FileHandler(args.log_file))
>> --
>> 2.17.1
>>
>>
> Right idea overall - possibly needs some polish and to be integrated with
> an earlier patch to avoid the intermediate FIXMEs.
>
> Thanks,
> --js
>

--0000000000004dd2c105c9c60515
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 17, 2021 at 10:21 AM John Snow &lt;<a h=
ref=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu &lt;<a href=
=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.gs@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Inst=
ead of manually connecting and disconnecting from the<br>
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
o we really need it?<br></div><div></div></div></div></blockquote><div><spa=
n class=3D"gmail_default" style=3D"font-size:small">No. This has been remov=
ed in v4.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
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
</div></blockquote><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"></div><div class=3D"gmail_default" style=3D"font-size:small">A race con=
dition occurs in protocol.py line 597</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">The reason behind this is there are two disconnect c=
alls initiated. The first one via kill_app</div><div class=3D"gmail_default=
" style=3D"font-size:small">and the second one via manage_connection when t=
he state is set to disconnecting by the first call.</div><div class=3D"gmai=
l_default" style=3D"font-size:small">One of the calls set&#39;s the state t=
o IDLE(protocol.py:584) after it has finished disconnecting, meanwhile</div=
><div class=3D"gmail_default" style=3D"font-size:small">the second call is =
somehow in the process of disconnecting and assert the state to be in DISCO=
NNECTING</div><div class=3D"gmail_default" style=3D"font-size:small">in pro=
tocol.py:597, which it is not since it has been set to IDLE by the first ca=
ll.</div></div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">If I don&#39;t =
gaurd against the second call I get the following exception</div><div class=
=3D"gmail_default" style=3D"font-size:small">------------------------------=
------------------------------------------------------------</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Traceback (most recent call l=
ast):<br>=C2=A0 File &quot;/home/niteesh/development/qemu/python/.venv/bin/=
aqmp-tui&quot;, line 33, in &lt;module&gt;<br>=C2=A0 =C2=A0 sys.exit(load_e=
ntry_point(&#39;qemu&#39;, &#39;console_scripts&#39;, &#39;aqmp-tui&#39;)()=
)<br>=C2=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/aqmp=
_tui.py&quot;, line 695, in main<br>=C2=A0 =C2=A0 app.run(args.asyncio_debu=
g)<br>=C2=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/aqm=
p_tui.py&quot;, line 444, in run<br>=C2=A0 =C2=A0 raise err<br>=C2=A0 File =
&quot;/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, li=
ne 441, in run<br>=C2=A0 =C2=A0 main_loop.run()<br>=C2=A0 File &quot;/home/=
niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/mai=
n_loop.py&quot;, line 287, in run<br>=C2=A0 =C2=A0 self._run()<br>=C2=A0 Fi=
le &quot;/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-pac=
kages/urwid/main_loop.py&quot;, line 385, in _run<br>=C2=A0 =C2=A0 self.eve=
nt_loop.run()<br>=C2=A0 File &quot;/home/niteesh/development/qemu/python/.v=
env/lib/python3.6/site-packages/urwid/main_loop.py&quot;, line 1494, in run=
<br>=C2=A0 =C2=A0 reraise(*exc_info)<br>=C2=A0 File &quot;/home/niteesh/dev=
elopment/qemu/python/.venv/lib/python3.6/site-packages/urwid/compat.py&quot=
;, line 58, in reraise<br>=C2=A0 =C2=A0 raise value<br>=C2=A0 File &quot;/h=
ome/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, line 391, =
in manage_connection<br>=C2=A0 =C2=A0 await self.disconnect()<br>=C2=A0 Fil=
e &quot;/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, =
line 312, in disconnect<br>=C2=A0 =C2=A0 raise err<br>=C2=A0 File &quot;/ho=
me/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, line 300, i=
n disconnect<br>=C2=A0 =C2=A0 await super().disconnect()<br>=C2=A0 File &qu=
ot;/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py&quot;, line =
302, in disconnect<br>=C2=A0 =C2=A0 await self._wait_disconnect()<br>=C2=A0=
 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py&quo=
t;, line 583, in _wait_disconnect<br>=C2=A0 =C2=A0 self._cleanup()<br>=C2=
=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/qmp_client.p=
y&quot;, line 331, in _cleanup<br>=C2=A0 =C2=A0 super()._cleanup()<br>=C2=
=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py&=
quot;, line 597, in _cleanup<br>=C2=A0 =C2=A0 assert self.runstate =3D=3D R=
unstate.DISCONNECTING<br>AssertionError<br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">----------------------------------------------=
---------------------------------------------</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</div></div></div></blockquote><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Yes, we can. I&#39;ll refactor it to constant delay.</div><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote">Something like:</div><div class=3D=
"gmail_quote"><br></div><div class=3D"gmail_quote">for _ in range(num_retri=
es):</div><div class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0 try:</div><div clas=
s=3D"gmail_quote">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 whatever_you_h=
ave_to_do_to_connect()</div><div class=3D"gmail_quote">=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return<br></div><div class=3D"gmail_quote">=C2=A0=
=C2=A0=C2=A0 except ConnectError as err:</div><div class=3D"gmail_quote">=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LOGGER.info(...etc)</div><div cl=
ass=3D"gmail_quote">=C2=A0=C2=A0=C2=A0 await asyncio.sleep(whatever_the_del=
ay_is)</div><div class=3D"gmail_quote"># ran out of retries here, presumabl=
y the connection manager will just go idle until the user interferes some o=
ther way.<span class=3D"gmail_default"></span>=C2=A0</div></div></blockquot=
e><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"></div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">In particular, I think passing around the name of the exce=
ption is a little dubious -- we should be logging with the actual Exception=
 we&#39;ve received.<br></div></div></blockquote><div><span class=3D"gmail_=
default" style=3D"font-size:small">This has been fixed in V4. We pass the e=
xception now instead of just passing around the name.</span>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"></div><div class=3D"gmail_quote"><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 async def manage_connection(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while True:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.runstate =3D=3D Runstate=
.IDLE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;T=
rying to reconnect&#39;)<br></blockquote><div><br></div><div>But will this =
be true upon the very first boot? This message might not be right.<br></div=
></div></div></blockquote><div><span class=3D"gmail_default" style=3D"font-=
size:small">Yes, it also occurs in the first boot. I&#39;ll fix this in the=
 V3.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D await self=
._retry_connection()<br></blockquote><div><br></div><div>This seems named o=
ddly too, since it might be the initial attempt and not necessarily a recon=
nection or a retry.<br></div></div></div></blockquote><div><span class=3D"g=
mail_default" style=3D"font-size:small">Will fix that.</span>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
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
ged to IDLE and you wouldn&#39;t need this clause here.<br></div></div></di=
v></blockquote><div><div class=3D"gmail_default" style=3D"font-size:small">=
After you mentioned it I too felt it was redundant. But on removing it the =
whole app freezes when trying to exit.</div></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">I logged the state after the call to disconne=
ct, instead of being in the IDLE state, it is still in DISCONNECTING state.=
</div><div class=3D"gmail_default" style=3D"font-size:small">I suspect this=
 results in the constant infinite looping which doesn&#39;t give other coro=
utines a chance to run and blocks</div><div class=3D"gmail_default" style=
=3D"font-size:small">the event loop thus resulting in the freezing of the a=
pp. But I am not sure why the state isn&#39;t changing to IDLE.</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"=
gmail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
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
</blockquote></div></div>

--0000000000004dd2c105c9c60515--

