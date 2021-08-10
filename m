Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0FD3E7E10
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 19:14:19 +0200 (CEST)
Received: from localhost ([::1]:45936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDVKU-0002tK-J7
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 13:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mDVJZ-0001ix-5z
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:13:21 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mDVJV-00028I-P0
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:13:20 -0400
Received: by mail-il1-x12c.google.com with SMTP id u7so1244565ilk.7
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 10:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZcomO3PWq7h5Kaij4CM7scqCxvBLI3+kUw/hudaSDc=;
 b=S9gg7t8Za3v3cWNhRIdYkKykYu0+m/cYgs7fTNLteRbIDD8fuNapLG5pkl1liPL8I5
 oFRUzxYs/vXmYISSHHdVewN680EKkJmrUkfYInw4LJZQIsHiybxLsBvuEwfczpSIIK7m
 qyudQbRv76rOpH7gCqhYQ8c6XG24ErgzqlsrkO3o6TBEU7o/kVXGexTgSunUVBCnzPpx
 C3vNs61fMtQhXIT9dQi2Fju3wp/qc6jzHY7GmRhCuFaT/zVwE05t+NNx5oiJWmSMcIqb
 zIWvcWXqlye9Fc4SF6loW4/lBLQsnCEevbLv6RijLwWcV0dP2cWk0vh3SMKh+A0iAr5g
 T6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZcomO3PWq7h5Kaij4CM7scqCxvBLI3+kUw/hudaSDc=;
 b=tulD+aJNhAd17ryuJIvC2LxipQXCSCoQhCjlbLkNt4aNUMPCeyw3qC9wDNeazSpKk9
 KhQ/VvbVKh3TjBc6a3ZKV2rB/BraMBkjgubcXkB+mDrJnW3sMbwIrgMHrWnvjVfbNYNs
 Qx3pjKTSLEABjceLz+3eGigj65r1Rd+V0kYRCKctTg1iYmflG/iP8J34Bj6F5ltFHRR2
 SVAr5QH8cZfn58f13Hi6+R9JVYlzuUpGtpu6TLeokgrFGu8L/NS/6fkTW0KPpc+24r4X
 5Q0014l6Zc2PMFgMbQRfKOmX0uww2Jyoe64x5suGvFRXOSczwyz8uH0Oc6kwa0VL4iJ6
 yu8A==
X-Gm-Message-State: AOAM531Ep28gQwqZuCrdGJdImDwzvZ7pt/Nygear98KCJdmj+o8p84yV
 HZaBismCRooFbEeTBTK8FL3goZ3DceZrmysL+Iw=
X-Google-Smtp-Source: ABdhPJwPnzlSOJptL52Q2lWj5DK3aJMt1DyfmwdH8HZkifXJdaB2SIJ7IsGfTaIAh4aNddjqJbxWgbyyfXWpb0vgSFc=
X-Received: by 2002:a92:a04c:: with SMTP id b12mr47149ilm.80.1628615595933;
 Tue, 10 Aug 2021 10:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-7-niteesh.gs@gmail.com>
 <CAFn=p-ZL6_VOQX_8hbh5mL3oD+5Vmr-PbeYnSc01jGEQauFHsg@mail.gmail.com>
In-Reply-To: <CAFn=p-ZL6_VOQX_8hbh5mL3oD+5Vmr-PbeYnSc01jGEQauFHsg@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Tue, 10 Aug 2021 22:42:50 +0530
Message-ID: <CAN6ztm86SwN4-Pub5uTu0GXjDXQm7f0HvfSeyFXuZFE2Z-DupA@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] python/aqmp-tui: Added type annotations for
 aqmp-tui
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001243fe05c9379ed4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x12c.google.com
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

--0000000000001243fe05c9379ed4
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 6, 2021 at 1:26 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
> wrote:
>
>> This patch adds type annotations for aqmp-tui using
>> the mypy library.
>>
>>
> Awesome, thanks for taking a swing at this. Looks like it wasn't as bad as
> I was fearing.
>
>
>> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>> ---
>>  python/qemu/aqmp/aqmp_tui.py | 79 ++++++++++++++++++++----------------
>>  python/setup.cfg             |  3 --
>>  2 files changed, 43 insertions(+), 39 deletions(-)
>>
>> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
>> index ec9eba0aa7..ab9ada793a 100644
>> --- a/python/qemu/aqmp/aqmp_tui.py
>> +++ b/python/qemu/aqmp/aqmp_tui.py
>> @@ -9,8 +9,15 @@
>>  import argparse
>>  import asyncio
>>  import logging
>> -from logging import Handler
>> +from logging import Handler, LogRecord
>>  import signal
>> +from typing import (
>> +    Any,
>> +    List,
>> +    Optional,
>> +    Tuple,
>> +    Union,
>> +)
>>
>>  import urwid
>>  import urwid_readline
>> @@ -22,13 +29,13 @@
>>  from .util import create_task, pretty_traceback
>>
>>
>> -UPDATE_MSG = 'UPDATE_MSG'
>> +UPDATE_MSG: str = 'UPDATE_MSG'
>>
>>  # Using root logger to enable all loggers under qemu and asyncio
>>  LOGGER = logging.getLogger()
>>
>>
>> -def format_json(msg):
>> +def format_json(msg: str) -> str:
>>      """
>>      Formats given multiline JSON message into a single line message.
>>      Converting into single line is more asthetically pleasing when
>> looking
>> @@ -43,17 +50,17 @@ def format_json(msg):
>>
>>
>>  class App(QMPClient):
>> -    def __init__(self, address):
>> +    def __init__(self, address: Union[str, Tuple[str, int]]) -> None:
>>          urwid.register_signal(type(self), UPDATE_MSG)
>>          self.window = Window(self)
>>          self.address = address
>> -        self.aloop = None
>> +        self.aloop: Optional[Any] = None  # FIXME: Use more concrete
>> type.
>>
>
> I ran into this in util.py; you want Optional[asyncio.AbstractEventLoop]
> here.
>
Thanks. Fixed.

>
>
>>          super().__init__()
>>
>> -    def add_to_history(self, msg):
>> +    def add_to_history(self, msg: str) -> None:
>>          urwid.emit_signal(self, UPDATE_MSG, msg)
>>
>> -    def _cb_outbound(self, msg):
>> +    def _cb_outbound(self, msg: Message) -> Message:
>>          # FIXME: I think the ideal way to omit these messages during
>> in-TUI
>>          # logging will be to add a filter to the logger. We can use
>> regex to
>>          # filter out messages starting with 'Request:' or 'Response:'
>> but I
>> @@ -67,25 +74,25 @@ def _cb_outbound(self, msg):
>>          self.add_to_history('<-- ' + str(msg))
>>          return msg
>>
>> -    def _cb_inbound(self, msg):
>> +    def _cb_inbound(self, msg: Message) -> Message:
>>          handler = LOGGER.handlers[0]
>>          if not isinstance(handler, TUILogHandler):
>>              LOGGER.debug('Response: %s', str(msg))
>>          self.add_to_history('--> ' + str(msg))
>>          return msg
>>
>> -    async def wait_for_events(self):
>> +    async def wait_for_events(self) -> None:
>>          async for event in self.events:
>>              self.handle_event(event)
>>
>> -    async def _send_to_server(self, raw_msg):
>> +    async def _send_to_server(self, raw_msg: str) -> None:
>>          # FIXME: Format the raw_msg in history view to one line. It is
>> not
>>          # pleasing to see multiple lines JSON object with an error
>> statement.
>>          try:
>>              msg = Message(bytes(raw_msg, encoding='utf-8'))
>>              # Format multiline json into a single line JSON, since it is
>> more
>>              # pleasing to look along with err message in TUI.
>> -            raw_msg = self.format_json(raw_msg)
>> +            raw_msg = format_json(raw_msg)
>>              await self._raw(msg, assign_id='id' not in msg)
>>          except (ValueError, TypeError) as err:
>>              LOGGER.info('Invalid message: %s', str(err))
>> @@ -102,18 +109,18 @@ def _cb_inbound(self, msg):
>>              LOGGER.error('Exception from _send_to_server: %s', str(err))
>>              raise err
>>
>> -    def cb_send_to_server(self, msg):
>> +    def cb_send_to_server(self, msg: str) -> None:
>>          create_task(self._send_to_server(msg))
>>
>> -    def unhandled_input(self, key):
>> +    def unhandled_input(self, key: str) -> None:
>>          if key == 'esc':
>>              self.kill_app()
>>
>> -    def kill_app(self):
>> +    def kill_app(self) -> None:
>>          # TODO: Work on the disconnect logic
>>          create_task(self._kill_app())
>>
>> -    async def _kill_app(self):
>> +    async def _kill_app(self) -> None:
>>          # It is ok to call disconnect even in disconnect state
>>          try:
>>              await self.disconnect()
>> @@ -124,7 +131,7 @@ def kill_app(self):
>>              raise err
>>          raise urwid.ExitMainLoop()
>>
>> -    def handle_event(self, event):
>> +    def handle_event(self, event: Message) -> None:
>>          # FIXME: Consider all states present in qapi/run-state.json
>>          if event['event'] == 'SHUTDOWN':
>>              self._set_status('Server shutdown')
>> @@ -139,7 +146,7 @@ def _get_formatted_address(self) -> str:
>>              addr = f'{host}:{port}'
>>          return addr
>>
>> -    async def connect_server(self):
>> +    async def connect_server(self) -> None:
>>          try:
>>              await self.connect(self.address)
>>              addr = self._get_formatted_address()
>> @@ -148,7 +155,7 @@ def _get_formatted_address(self) -> str:
>>              LOGGER.info('connect_server: ConnectError %s', str(err))
>>              self._set_status('Server shutdown')
>>
>> -    def run(self, debug=False):
>> +    def run(self, debug: bool = False) -> None:
>>          self.aloop = asyncio.get_event_loop()
>>          self.aloop.set_debug(debug)
>>
>> @@ -176,7 +183,7 @@ class StatusBar(urwid.Text):
>>      """
>>      A simple Text widget that currently only shows connection status.
>>      """
>> -    def __init__(self, text=''):
>> +    def __init__(self, text: str = ''):
>>          super().__init__(text, align='right')
>>
>>
>> @@ -185,14 +192,14 @@ class Editor(urwid_readline.ReadlineEdit):
>>      Support urwid_readline features along with
>>      history support which lacks in urwid_readline
>>      """
>> -    def __init__(self, master):
>> +    def __init__(self, master: App) -> None:
>>          super().__init__(caption='> ', multiline=True)
>>          self.master = master
>> -        self.history = []
>> -        self.last_index = -1
>> -        self.show_history = False
>> +        self.history: List[str] = []
>> +        self.last_index: int = -1
>> +        self.show_history: bool = False
>>
>> -    def keypress(self, size, key):
>> +    def keypress(self, size: Tuple[int, int], key: str) -> Optional[str]:
>>          # TODO: Add some logic for down key and clean up logic if
>> possible.
>>          # Returning None means the key has been handled by this widget
>>          # which otherwise is propogated to the parent widget to be
>> @@ -223,7 +230,7 @@ def keypress(self, size, key):
>>          else:
>>              self.show_history = False
>>              self.last_index = 0
>> -            return super().keypress(size, key)
>> +            return super().keypress(size, key)  # type: ignore
>>
>
> try using cast(Optional[str], super().keypress(size, key)) instead of the
> type: ignore. It doesn't make a gigantic difference, really, but it looks
> "narrower" in scope and will probably confuse *me* less in the future.
>
Fixed

>
>
>>          return None
>>
>>
>> @@ -231,7 +238,7 @@ class EditorWidget(urwid.Filler):
>>      """
>>      Wraps CustomEdit
>>      """
>> -    def __init__(self, master):
>> +    def __init__(self, master: App) -> None:
>>          super().__init__(Editor(master), valign='top')
>>
>>
>> @@ -239,12 +246,12 @@ class HistoryBox(urwid.ListBox):
>>      """
>>      Shows all the QMP message transmitted/received
>>      """
>> -    def __init__(self, master):
>> +    def __init__(self, master: App) -> None:
>>          self.master = master
>>          self.history = urwid.SimpleFocusListWalker([])
>>          super().__init__(self.history)
>>
>> -    def add_to_history(self, history):
>> +    def add_to_history(self, history: str) -> None:
>>          self.history.append(urwid.Text(history))
>>          if self.history:
>>              self.history.set_focus(len(self.history) - 1)
>> @@ -254,7 +261,7 @@ class HistoryWindow(urwid.Frame):
>>      """
>>      Composes the HistoryBox and EditorWidget
>>      """
>> -    def __init__(self, master):
>> +    def __init__(self, master: App) -> None:
>>          self.master = master
>>          self.editor_widget = EditorWidget(master)
>>          self.editor = urwid.LineBox(self.editor_widget)
>> @@ -264,7 +271,7 @@ def __init__(self, master):
>>          super().__init__(self.body)
>>          urwid.connect_signal(self.master, UPDATE_MSG,
>> self.cb_add_to_history)
>>
>> -    def cb_add_to_history(self, msg):
>> +    def cb_add_to_history(self, msg: str) -> None:
>>          self.history.add_to_history(msg)
>>
>>
>> @@ -275,7 +282,7 @@ class Window(urwid.Frame):
>>      future when we will have multiple windows and want to the switch
>> between
>>      them and display overlays
>>      """
>> -    def __init__(self, master):
>> +    def __init__(self, master: App) -> None:
>>          self.master = master
>>          footer = StatusBar()
>>          body = HistoryWindow(master)
>> @@ -283,18 +290,18 @@ def __init__(self, master):
>>
>>
>>  class TUILogHandler(Handler):
>> -    def __init__(self, tui):
>> +    def __init__(self, tui: App) -> None:
>>          super().__init__()
>>          self.tui = tui
>>
>> -    def emit(self, record):
>> +    def emit(self, record: LogRecord) -> None:
>>          level = record.levelname
>>          msg = record.getMessage()
>>          msg = f'[{level}]: {msg}'
>>          self.tui.add_to_history(msg)
>>
>>
>> -def main():
>> +def main() -> None:
>>      parser = argparse.ArgumentParser(description='AQMP TUI')
>>      parser.add_argument('qmp_server', help='Address of the QMP server'
>>                          '< UNIX socket path | TCP addr:port >')
>> @@ -311,7 +318,7 @@ def main():
>>      try:
>>          address = QEMUMonitorProtocol.parse_address(args.qmp_server)
>>      except QMPBadPortError as err:
>> -        parser.error(err)
>> +        parser.error(str(err))
>>
>>      app = App(address)
>>
>> @@ -330,4 +337,4 @@ def main():
>>
>>
>>  if __name__ == '__main__':
>> -    main()  # type: ignore
>> +    main()
>> diff --git a/python/setup.cfg b/python/setup.cfg
>> index 8cd9ac0d81..11c6240aba 100644
>> --- a/python/setup.cfg
>> +++ b/python/setup.cfg
>> @@ -83,9 +83,6 @@ namespace_packages = True
>>  allow_subclassing_any = True
>>
>>  [mypy-qemu.aqmp.aqmp_tui]
>> -disallow_untyped_defs = False
>> -disallow_incomplete_defs = False
>> -check_untyped_defs = False
>>  # urwid and urwid_readline have no type stubs:
>>  allow_subclassing_any = True
>>
>> --
>> 2.17.1
>>
>>
> Please squash this into the first patch, but it looks good, thanks!
>
Thanks.

>
> --js
>

--0000000000001243fe05c9379ed4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 6, 2021 at 1:26 AM John Snow &lt;<a hre=
f=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu=
 &lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.gs@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">This patch adds type annotations for aqmp-tui using<br>
the mypy library.<br>
<br></blockquote><div><br></div><div>Awesome, thanks for taking a swing at =
this. Looks like it wasn&#39;t as bad as I was fearing.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 79 ++++++++++++++++++++---------------=
-<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 3 --<br>
=C2=A02 files changed, 43 insertions(+), 39 deletions(-)<br>
<br>
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py<br=
>
index ec9eba0aa7..ab9ada793a 100644<br>
--- a/python/qemu/aqmp/aqmp_tui.py<br>
+++ b/python/qemu/aqmp/aqmp_tui.py<br>
@@ -9,8 +9,15 @@<br>
=C2=A0import argparse<br>
=C2=A0import asyncio<br>
=C2=A0import logging<br>
-from logging import Handler<br>
+from logging import Handler, LogRecord<br>
=C2=A0import signal<br>
+from typing import (<br>
+=C2=A0 =C2=A0 Any,<br>
+=C2=A0 =C2=A0 List,<br>
+=C2=A0 =C2=A0 Optional,<br>
+=C2=A0 =C2=A0 Tuple,<br>
+=C2=A0 =C2=A0 Union,<br>
+)<br>
<br>
=C2=A0import urwid<br>
=C2=A0import urwid_readline<br>
@@ -22,13 +29,13 @@<br>
=C2=A0from .util import create_task, pretty_traceback<br>
<br>
<br>
-UPDATE_MSG =3D &#39;UPDATE_MSG&#39;<br>
+UPDATE_MSG: str =3D &#39;UPDATE_MSG&#39;<br>
<br>
=C2=A0# Using root logger to enable all loggers under qemu and asyncio<br>
=C2=A0LOGGER =3D logging.getLogger()<br>
<br>
<br>
-def format_json(msg):<br>
+def format_json(msg: str) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Formats given multiline JSON message into a single line=
 message.<br>
=C2=A0 =C2=A0 =C2=A0Converting into single line is more asthetically pleasi=
ng when looking<br>
@@ -43,17 +50,17 @@ def format_json(msg):<br>
<br>
<br>
=C2=A0class App(QMPClient):<br>
-=C2=A0 =C2=A0 def __init__(self, address):<br>
+=C2=A0 =C2=A0 def __init__(self, address: Union[str, Tuple[str, int]]) -&g=
t; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urwid.register_signal(type(self), UPDATE_=
MSG)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.window =3D Window(self)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.address =3D address<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop: Optional[Any] =3D None=C2=A0 # FIX=
ME: Use more concrete type.<br></blockquote><div><br></div><div>I ran into =
this in util.py; you want Optional[<span class=3D"gmail_default" style=3D"f=
ont-size:small"></span>asyncio.AbstractEventLoop] here.<br></div></div></di=
v></blockquote><div><span class=3D"gmail_default" style=3D"font-size:small"=
>Thanks. Fixed.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__()<br>
<br>
-=C2=A0 =C2=A0 def add_to_history(self, msg):<br>
+=C2=A0 =C2=A0 def add_to_history(self, msg: str) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urwid.emit_signal(self, UPDATE_MSG, msg)<=
br>
<br>
-=C2=A0 =C2=A0 def _cb_outbound(self, msg):<br>
+=C2=A0 =C2=A0 def _cb_outbound(self, msg: Message) -&gt; Message:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# FIXME: I think the ideal way to omit th=
ese messages during in-TUI<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# logging will be to add a filter to the =
logger. We can use regex to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# filter out messages starting with &#39;=
Request:&#39; or &#39;Response:&#39; but I<br>
@@ -67,25 +74,25 @@ def _cb_outbound(self, msg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.add_to_history(&#39;&lt;-- &#39; + s=
tr(msg))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return msg<br>
<br>
-=C2=A0 =C2=A0 def _cb_inbound(self, msg):<br>
+=C2=A0 =C2=A0 def _cb_inbound(self, msg: Message) -&gt; Message:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handler =3D LOGGER.handlers[0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not isinstance(handler, TUILogHandler)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOGGER.debug(&#39;Response:=
 %s&#39;, str(msg))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.add_to_history(&#39;--&gt; &#39; + s=
tr(msg))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return msg<br>
<br>
-=C2=A0 =C2=A0 async def wait_for_events(self):<br>
+=C2=A0 =C2=A0 async def wait_for_events(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0async for event in self.events:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.handle_event(event)<br=
>
<br>
-=C2=A0 =C2=A0 async def _send_to_server(self, raw_msg):<br>
+=C2=A0 =C2=A0 async def _send_to_server(self, raw_msg: str) -&gt; None:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# FIXME: Format the raw_msg in history vi=
ew to one line. It is not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# pleasing to see multiple lines JSON obj=
ect with an error statement.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D Message(bytes(raw_m=
sg, encoding=3D&#39;utf-8&#39;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Format multiline json int=
o a single line JSON, since it is more<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# pleasing to look along wi=
th err message in TUI.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_msg =3D self.format_json(raw=
_msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_msg =3D format_json(raw_msg)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0await self._raw(msg, assign=
_id=3D&#39;id&#39; not in msg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except (ValueError, TypeError) as err:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOGGER.info(&#39;Invalid me=
ssage: %s&#39;, str(err))<br>
@@ -102,18 +109,18 @@ def _cb_inbound(self, msg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOGGER.error(&#39;Exception=
 from _send_to_server: %s&#39;, str(err))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise err<br>
<br>
-=C2=A0 =C2=A0 def cb_send_to_server(self, msg):<br>
+=C2=A0 =C2=A0 def cb_send_to_server(self, msg: str) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_task(self._send_to_server(msg))<br=
>
<br>
-=C2=A0 =C2=A0 def unhandled_input(self, key):<br>
+=C2=A0 =C2=A0 def unhandled_input(self, key: str) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if key =3D=3D &#39;esc&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kill_app()<br>
<br>
-=C2=A0 =C2=A0 def kill_app(self):<br>
+=C2=A0 =C2=A0 def kill_app(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# TODO: Work on the disconnect logic<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_task(self._kill_app())<br>
<br>
-=C2=A0 =C2=A0 async def _kill_app(self):<br>
+=C2=A0 =C2=A0 async def _kill_app(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# It is ok to call disconnect even in dis=
connect state<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0await self.disconnect()<br>
@@ -124,7 +131,7 @@ def kill_app(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise err<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise urwid.ExitMainLoop()<br>
<br>
-=C2=A0 =C2=A0 def handle_event(self, event):<br>
+=C2=A0 =C2=A0 def handle_event(self, event: Message) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# FIXME: Consider all states present in q=
api/run-state.json<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if event[&#39;event&#39;] =3D=3D &#39;SHU=
TDOWN&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._set_status(&#39;Serve=
r shutdown&#39;)<br>
@@ -139,7 +146,7 @@ def _get_formatted_address(self) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D f&#39;{host}:{port=
}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return addr<br>
<br>
-=C2=A0 =C2=A0 async def connect_server(self):<br>
+=C2=A0 =C2=A0 async def connect_server(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0await self.connect(self.add=
ress)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D self._get_formatte=
d_address()<br>
@@ -148,7 +155,7 @@ def _get_formatted_address(self) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOGGER.info(&#39;connect_se=
rver: ConnectError %s&#39;, str(err))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._set_status(&#39;Serve=
r shutdown&#39;)<br>
<br>
-=C2=A0 =C2=A0 def run(self, debug=3DFalse):<br>
+=C2=A0 =C2=A0 def run(self, debug: bool =3D False) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.aloop =3D asyncio.get_event_loop()<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.aloop.set_debug(debug)<br>
<br>
@@ -176,7 +183,7 @@ class StatusBar(urwid.Text):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0A simple Text widget that currently only shows connecti=
on status.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 def __init__(self, text=3D&#39;&#39;):<br>
+=C2=A0 =C2=A0 def __init__(self, text: str =3D &#39;&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__(text, align=3D&#39;right=
&#39;)<br>
<br>
<br>
@@ -185,14 +192,14 @@ class Editor(urwid_readline.ReadlineEdit):<br>
=C2=A0 =C2=A0 =C2=A0Support urwid_readline features along with<br>
=C2=A0 =C2=A0 =C2=A0history support which lacks in urwid_readline<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 def __init__(self, master):<br>
+=C2=A0 =C2=A0 def __init__(self, master: App) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__(caption=3D&#39;&gt; &#39=
;, multiline=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.master =3D master<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history =3D []<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index =3D -1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_history =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history: List[str] =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index: int =3D -1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_history: bool =3D False<br>
<br>
-=C2=A0 =C2=A0 def keypress(self, size, key):<br>
+=C2=A0 =C2=A0 def keypress(self, size: Tuple[int, int], key: str) -&gt; Op=
tional[str]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# TODO: Add some logic for down key and c=
lean up logic if possible.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Returning None means the key has been h=
andled by this widget<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# which otherwise is propogated to the pa=
rent widget to be<br>
@@ -223,7 +230,7 @@ def keypress(self, size, key):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.show_history =3D False=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.last_index =3D 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return super().keypress(size, ke=
y)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return super().keypress(size, ke=
y)=C2=A0 # type: ignore<br></blockquote><div><br></div><div>try using cast(=
Optional[str], super().keypress(size, key)) instead of the type: ignore. It=
 doesn&#39;t make a gigantic difference, really, but it looks &quot;narrowe=
r&quot; in scope and will probably confuse *me* less in the future.<br></di=
v></div></div></blockquote><div><span class=3D"gmail_default" style=3D"font=
-size:small">Fixed</span>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return None<br>
<br>
<br>
@@ -231,7 +238,7 @@ class EditorWidget(urwid.Filler):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Wraps CustomEdit<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 def __init__(self, master):<br>
+=C2=A0 =C2=A0 def __init__(self, master: App) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__(Editor(master), valign=
=3D&#39;top&#39;)<br>
<br>
<br>
@@ -239,12 +246,12 @@ class HistoryBox(urwid.ListBox):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Shows all the QMP message transmitted/received<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 def __init__(self, master):<br>
+=C2=A0 =C2=A0 def __init__(self, master: App) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.master =3D master<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.history =3D urwid.SimpleFocusListWal=
ker([])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__(self.history)<br>
<br>
-=C2=A0 =C2=A0 def add_to_history(self, history):<br>
+=C2=A0 =C2=A0 def add_to_history(self, history: str) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.history.append(urwid.Text(history))<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.history:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.history.set_focus(len(=
self.history) - 1)<br>
@@ -254,7 +261,7 @@ class HistoryWindow(urwid.Frame):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Composes the HistoryBox and EditorWidget<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 def __init__(self, master):<br>
+=C2=A0 =C2=A0 def __init__(self, master: App) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.master =3D master<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.editor_widget =3D EditorWidget(maste=
r)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.editor =3D urwid.LineBox(self.editor=
_widget)<br>
@@ -264,7 +271,7 @@ def __init__(self, master):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__(self.body)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urwid.connect_signal(self.master, UPDATE_=
MSG, self.cb_add_to_history)<br>
<br>
-=C2=A0 =C2=A0 def cb_add_to_history(self, msg):<br>
+=C2=A0 =C2=A0 def cb_add_to_history(self, msg: str) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.history.add_to_history(msg)<br>
<br>
<br>
@@ -275,7 +282,7 @@ class Window(urwid.Frame):<br>
=C2=A0 =C2=A0 =C2=A0future when we will have multiple windows and want to t=
he switch between<br>
=C2=A0 =C2=A0 =C2=A0them and display overlays<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 def __init__(self, master):<br>
+=C2=A0 =C2=A0 def __init__(self, master: App) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.master =3D master<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0footer =3D StatusBar()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0body =3D HistoryWindow(master)<br>
@@ -283,18 +290,18 @@ def __init__(self, master):<br>
<br>
<br>
=C2=A0class TUILogHandler(Handler):<br>
-=C2=A0 =C2=A0 def __init__(self, tui):<br>
+=C2=A0 =C2=A0 def __init__(self, tui: App) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.tui =3D tui<br>
<br>
-=C2=A0 =C2=A0 def emit(self, record):<br>
+=C2=A0 =C2=A0 def emit(self, record: LogRecord) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0level =3D record.levelname<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D record.getMessage()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D f&#39;[{level}]: {msg}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.tui.add_to_history(msg)<br>
<br>
<br>
-def main():<br>
+def main() -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0parser =3D argparse.ArgumentParser(description=3D&#39;A=
QMP TUI&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;qmp_server&#39;, help=3D&#39;A=
ddress of the QMP server&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&lt; UNIX socket path | TCP addr:port &gt;&#39;)<br>
@@ -311,7 +318,7 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address =3D QEMUMonitorProtocol.parse_add=
ress(args.qmp_server)<br>
=C2=A0 =C2=A0 =C2=A0except QMPBadPortError as err:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.error(err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.error(str(err))<br>
<br>
=C2=A0 =C2=A0 =C2=A0app =3D App(address)<br>
<br>
@@ -330,4 +337,4 @@ def main():<br>
<br>
<br>
=C2=A0if __name__ =3D=3D &#39;__main__&#39;:<br>
-=C2=A0 =C2=A0 main()=C2=A0 # type: ignore<br>
+=C2=A0 =C2=A0 main()<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index 8cd9ac0d81..11c6240aba 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -83,9 +83,6 @@ namespace_packages =3D True<br>
=C2=A0allow_subclassing_any =3D True<br>
<br>
=C2=A0[mypy-qemu.aqmp.aqmp_tui]<br>
-disallow_untyped_defs =3D False<br>
-disallow_incomplete_defs =3D False<br>
-check_untyped_defs =3D False<br>
=C2=A0# urwid and urwid_readline have no type stubs:<br>
=C2=A0allow_subclassing_any =3D True<br>
<br>
-- <br>
2.17.1<br>
<br></div></blockquote></div><div class=3D"gmail_quote"><br></div><div clas=
s=3D"gmail_quote">Please squash this into the first patch, but it looks goo=
d, thanks!</div></div></blockquote><div><span class=3D"gmail_default" style=
=3D"font-size:small">Thanks.</span>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><br></div=
><div class=3D"gmail_quote">--js<br></div></div>
</blockquote></div></div>

--0000000000001243fe05c9379ed4--

