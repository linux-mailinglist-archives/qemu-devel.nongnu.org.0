Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7D83EB6DD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 16:40:37 +0200 (CEST)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEYMO-00005U-U3
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 10:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mEYL3-0007Lg-1S
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 10:39:13 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:39737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mEYKz-0002aw-L1
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 10:39:12 -0400
Received: by mail-io1-xd36.google.com with SMTP id r72so13608232iod.6
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mk4WjG3ZrMiNv89AXKke6w2wBQ900+i6U0Zr6yjJl+w=;
 b=PlMxlVqgNsqrWwGq1bldcDzmRru+uTW1hG0vHzXS1T2kPrGGfJugyxH9Qd9J9c/MZT
 NLpTv4KSnBspjfs8TSVBDXCVwxUGQrJ40hrPDvkm/6LKHrVwnP86Vy0mZ0w/p94hPXib
 TEQk5/ksvDO5WAprYFVaKHAscz0jEJdW5s/b5H1R1jhvQEklc1myg6KX/JbC/znypWAr
 3sN0Aphjr/klTKk9uqigFzHDl5SQGonL8MOjAbmmoiKazBsfmjEIBLzvXAJ3B6tOu0gt
 1qTj1lsBY30ZRe2cbAwqUQVcv+uZBCClj4EAygI5k/RlV5GBPnKESG21niNlUnRNQDaL
 +tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mk4WjG3ZrMiNv89AXKke6w2wBQ900+i6U0Zr6yjJl+w=;
 b=OhH2kkGqjoGHQ9ODCnXLw9bGCoUK9kpy0gVXmrP8qs2/J+uRGjCpOlQ8HI/Jb7atH1
 OQs43nXY+6JwJxHIp5ra1Ty4tPevRj5BZp4KiGTDlb24TflAd6HOXuOyFrHukVZ61+CM
 +TWsmf7SbhZ1meotnnFmvDSvbgxS7+QmSZ8PwYbrWU0zNwqw4IUxIOQNaNLqw7Ba1yWJ
 zGIzBDLfNxZT+smqXgwkQYRFdAyUXH/bWRS6iujvHw0QfHVuPCCP80GR8aq/Eg9xlFs0
 TS5JvQgX641ijZkmFQ1/Q92zbpsbAyK3UHD//58pSUCN8WbEyRk7nGM6us731ov/IM8q
 EjoQ==
X-Gm-Message-State: AOAM530AYvqAf2y0MWcIOfSfwrUBqfTAZRxJIs/dbRavvusMnh2DC1HC
 f4p7JORrcSLrMtpFcusrE3s/lHi6r4rykVsUQLM=
X-Google-Smtp-Source: ABdhPJxZskeLKFLS0G26WwZfEBxBicJcsXpFI+IhwaJsPuGdbZzzBv7T7HmWPsS9jkqT6fSgt7/Q/UFinVFzAz64LJA=
X-Received: by 2002:a02:7f48:: with SMTP id r69mr2598477jac.17.1628865546001; 
 Fri, 13 Aug 2021 07:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-5-niteesh.gs@gmail.com>
 <CAFn=p-bSN9Vip3a_dg=qM0F-mO+Y6+axugM15FQBAbvd33VngA@mail.gmail.com>
In-Reply-To: <CAFn=p-bSN9Vip3a_dg=qM0F-mO+Y6+axugM15FQBAbvd33VngA@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Fri, 13 Aug 2021 20:08:39 +0530
Message-ID: <CAN6ztm8eZQxd-1DvzadTARQjUguaMq4=ijXBLKgYMXpLy7bU+g@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] python/aqmp-tui: Add AQMP TUI draft
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000419e7005c971d0b4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd36.google.com
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

--000000000000419e7005c971d0b4
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 6, 2021 at 12:41 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
> wrote:
>
>> Added a draft of AQMP TUI.
>>
>> Implements the follwing basic features:
>> 1) Command transmission/reception.
>> 2) Shows events asynchronously.
>> 3) Shows server status in the bottom status bar.
>>
>> Also added necessary pylint, mypy configurations
>>
>> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>> ---
>>  python/qemu/aqmp/aqmp_tui.py | 333 +++++++++++++++++++++++++++++++++++
>>  python/setup.cfg             |  16 +-
>>  2 files changed, 348 insertions(+), 1 deletion(-)
>>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>>
>> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
>> new file mode 100644
>> index 0000000000..ec9eba0aa7
>> --- /dev/null
>> +++ b/python/qemu/aqmp/aqmp_tui.py
>> @@ -0,0 +1,333 @@
>> +# Copyright (c) 2021
>> +#
>> +# Authors:
>> +#  Niteesh Babu G S <niteesh.gs@gmail.com>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +import argparse
>> +import asyncio
>> +import logging
>> +from logging import Handler
>> +import signal
>> +
>> +import urwid
>> +import urwid_readline
>> +
>> +from ..qmp import QEMUMonitorProtocol, QMPBadPortError
>> +from .message import DeserializationError, Message, UnexpectedTypeError
>> +from .protocol import ConnectError
>> +from .qmp_client import ExecInterruptedError, QMPClient
>> +from .util import create_task, pretty_traceback
>> +
>> +
>> +UPDATE_MSG = 'UPDATE_MSG'
>> +
>> +# Using root logger to enable all loggers under qemu and asyncio
>> +LOGGER = logging.getLogger()
>> +
>> +
>> +def format_json(msg):
>> +    """
>> +    Formats given multiline JSON message into a single line message.
>> +    Converting into single line is more asthetically pleasing when
>> looking
>> +    along with error messages compared to multiline JSON.
>> +    """
>> +    # FIXME: Use better formatting mechanism. Might break at more
>> complex JSON
>> +    # data.
>> +    msg = msg.replace('\n', '')
>> +    words = msg.split(' ')
>> +    words = [word for word in words if word != '']
>> +    return ' '.join(words)
>> +
>> +
>> +class App(QMPClient):
>> +    def __init__(self, address):
>> +        urwid.register_signal(type(self), UPDATE_MSG)
>> +        self.window = Window(self)
>> +        self.address = address
>> +        self.aloop = None
>> +        super().__init__()
>> +
>> +    def add_to_history(self, msg):
>> +        urwid.emit_signal(self, UPDATE_MSG, msg)
>> +
>> +    def _cb_outbound(self, msg):
>> +        # FIXME: I think the ideal way to omit these messages during
>> in-TUI
>> +        # logging will be to add a filter to the logger. We can use
>> regex to
>> +        # filter out messages starting with 'Request:' or 'Response:'
>> but I
>> +        # think a better approach will be encapsulate the message in an
>> object
>> +        # and filter based on the object. Encapsulation of the message
>> will
>> +        # also be necessary when we want different formatting of messages
>> +        # inside TUI.
>> +        handler = LOGGER.handlers[0]
>> +        if not isinstance(handler, TUILogHandler):
>> +            LOGGER.debug('Request: %s', str(msg))
>> +        self.add_to_history('<-- ' + str(msg))
>> +        return msg
>> +
>> +    def _cb_inbound(self, msg):
>> +        handler = LOGGER.handlers[0]
>> +        if not isinstance(handler, TUILogHandler):
>> +            LOGGER.debug('Response: %s', str(msg))
>> +        self.add_to_history('--> ' + str(msg))
>> +        return msg
>> +
>> +    async def wait_for_events(self):
>> +        async for event in self.events:
>> +            self.handle_event(event)
>> +
>> +    async def _send_to_server(self, raw_msg):
>> +        # FIXME: Format the raw_msg in history view to one line. It is
>> not
>> +        # pleasing to see multiple lines JSON object with an error
>> statement.
>> +        try:
>> +            msg = Message(bytes(raw_msg, encoding='utf-8'))
>> +            # Format multiline json into a single line JSON, since it is
>> more
>> +            # pleasing to look along with err message in TUI.
>> +            raw_msg = self.format_json(raw_msg)
>> +            await self._raw(msg, assign_id='id' not in msg)
>> +        except (ValueError, TypeError) as err:
>> +            LOGGER.info('Invalid message: %s', str(err))
>> +            self.add_to_history(f'{raw_msg}: {err}')
>> +        except (DeserializationError, UnexpectedTypeError) as err:
>> +            LOGGER.info('Invalid message: %s', err.error_message)
>> +            self.add_to_history(f'{raw_msg}: {err.error_message}')
>> +        except ExecInterruptedError:
>> +            LOGGER.info('Error server disconnected before reply')
>> +            urwid.emit_signal(self, UPDATE_MSG,
>> +                              '{"error": "Server disconnected before
>> reply"}')
>> +            self._set_status("Server disconnected")
>> +        except Exception as err:
>> +            LOGGER.error('Exception from _send_to_server: %s', str(err))
>> +            raise err
>> +
>> +    def cb_send_to_server(self, msg):
>> +        create_task(self._send_to_server(msg))
>> +
>> +    def unhandled_input(self, key):
>> +        if key == 'esc':
>> +            self.kill_app()
>> +
>> +    def kill_app(self):
>> +        # TODO: Work on the disconnect logic
>> +        create_task(self._kill_app())
>> +
>> +    async def _kill_app(self):
>> +        # It is ok to call disconnect even in disconnect state
>> +        try:
>> +            await self.disconnect()
>> +            LOGGER.debug('Disconnect finished. Exiting app')
>> +        except Exception as err:
>> +            LOGGER.info('_kill_app: %s', str(err))
>> +            # Let the app crash after providing a proper stack trace
>> +            raise err
>> +        raise urwid.ExitMainLoop()
>> +
>> +    def handle_event(self, event):
>> +        # FIXME: Consider all states present in qapi/run-state.json
>> +        if event['event'] == 'SHUTDOWN':
>> +            self._set_status('Server shutdown')
>> +
>> +    def _set_status(self, msg: str) -> None:
>> +        self.window.footer.set_text(msg)
>> +
>> +    def _get_formatted_address(self) -> str:
>> +        addr = f'{self.address}'
>> +        if isinstance(self.address, tuple):
>> +            host, port = self.address
>> +            addr = f'{host}:{port}'
>> +        return addr
>> +
>> +    async def connect_server(self):
>> +        try:
>> +            await self.connect(self.address)
>> +            addr = self._get_formatted_address()
>> +            self._set_status(f'Connected to {addr}')
>> +        except ConnectError as err:
>> +            LOGGER.info('connect_server: ConnectError %s', str(err))
>> +            self._set_status('Server shutdown')
>> +
>> +    def run(self, debug=False):
>> +        self.aloop = asyncio.get_event_loop()
>> +        self.aloop.set_debug(debug)
>> +
>> +        # Gracefully handle SIGTERM and SIGINT signals
>> +        cancel_signals = [signal.SIGTERM, signal.SIGINT]
>> +        for sig in cancel_signals:
>> +            self.aloop.add_signal_handler(sig, self.kill_app)
>> +
>> +        event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
>> +        main_loop = urwid.MainLoop(urwid.AttrMap(self.window,
>> 'background'),
>> +                                   unhandled_input=self.unhandled_input,
>> +                                   handle_mouse=True,
>> +                                   event_loop=event_loop)
>> +
>> +        create_task(self.wait_for_events(), self.aloop)
>> +        create_task(self.connect_server(), self.aloop)
>> +        try:
>> +            main_loop.run()
>> +        except Exception as err:
>> +            LOGGER.error('%s\n%s\n', str(err), pretty_traceback())
>> +            raise err
>> +
>> +
>> +class StatusBar(urwid.Text):
>> +    """
>> +    A simple Text widget that currently only shows connection status.
>> +    """
>> +    def __init__(self, text=''):
>> +        super().__init__(text, align='right')
>> +
>> +
>> +class Editor(urwid_readline.ReadlineEdit):
>> +    """
>> +    Support urwid_readline features along with
>> +    history support which lacks in urwid_readline
>> +    """
>> +    def __init__(self, master):
>> +        super().__init__(caption='> ', multiline=True)
>> +        self.master = master
>> +        self.history = []
>> +        self.last_index = -1
>> +        self.show_history = False
>> +
>> +    def keypress(self, size, key):
>> +        # TODO: Add some logic for down key and clean up logic if
>> possible.
>> +        # Returning None means the key has been handled by this widget
>> +        # which otherwise is propogated to the parent widget to be
>> +        # handled
>> +        msg = self.get_edit_text()
>> +        if key == 'up' and not msg:
>> +            # Show the history when 'up arrow' is pressed with no input
>> text.
>> +            # NOTE: The show_history logic is necessary because in
>> 'multiline'
>> +            # mode (which we use) 'up arrow' is used to move between
>> lines.
>> +            self.show_history = True
>> +            last_msg = self.history[self.last_index] if self.history
>> else ''
>> +            self.set_edit_text(last_msg)
>> +            self.edit_pos = len(last_msg)
>> +            self.last_index += 1
>> +        elif key == 'up' and self.show_history:
>> +            if self.last_index < len(self.history):
>> +                self.set_edit_text(self.history[self.last_index])
>> +                self.edit_pos = len(self.history[self.last_index])
>> +                self.last_index += 1
>> +        elif key == 'meta enter':
>> +            # When using multiline, enter inserts a new line into the
>> editor
>> +            # send the input to the server on alt + enter
>> +            self.master.cb_send_to_server(msg)
>>
>
> cb_send_to_server calls create_task(App._send_to_server(msg)) at which
> point in the coroutine you finally do msg = Message(bytes(raw_msg,
> encoding='utf-8')). However, you can do your message conversion *first*,
> here in the Editor.
>
> That way, you can avoid erasing the editor bar when the message is garbled
> and the user has a chance to fix the corrupted message *first* before we
> dispatch to the callback-async-machine. That should reduce quite a lot of
> the error cases in _send_to_server and helps separate out the two kinds of
> errors we expect to see here:
>
> 1. The user typed something that's garbage, and we didn't actually even
> send it (because we couldn't), and
> 2. We sent (or tried to send) the message; but a failure occurred.
>
Thanks. Refactored this.

>
>
>> +            self.history.insert(0, msg)
>> +            self.set_edit_text('')
>> +            self.last_index = 0
>> +            self.show_history = False
>> +        else:
>> +            self.show_history = False
>> +            self.last_index = 0
>> +            return super().keypress(size, key)
>> +        return None
>> +
>> +
>> +class EditorWidget(urwid.Filler):
>> +    """
>> +    Wraps CustomEdit
>> +    """
>> +    def __init__(self, master):
>> +        super().__init__(Editor(master), valign='top')
>> +
>> +
>> +class HistoryBox(urwid.ListBox):
>> +    """
>> +    Shows all the QMP message transmitted/received
>> +    """
>> +    def __init__(self, master):
>> +        self.master = master
>> +        self.history = urwid.SimpleFocusListWalker([])
>> +        super().__init__(self.history)
>> +
>> +    def add_to_history(self, history):
>> +        self.history.append(urwid.Text(history))
>> +        if self.history:
>> +            self.history.set_focus(len(self.history) - 1)
>> +
>> +
>> +class HistoryWindow(urwid.Frame):
>> +    """
>> +    Composes the HistoryBox and EditorWidget
>> +    """
>> +    def __init__(self, master):
>> +        self.master = master
>> +        self.editor_widget = EditorWidget(master)
>> +        self.editor = urwid.LineBox(self.editor_widget)
>> +        self.history = HistoryBox(master)
>> +        self.body = urwid.Pile([('weight', 80, self.history),
>> +                                ('weight', 20, self.editor)])
>> +        super().__init__(self.body)
>> +        urwid.connect_signal(self.master, UPDATE_MSG,
>> self.cb_add_to_history)
>> +
>> +    def cb_add_to_history(self, msg):
>> +        self.history.add_to_history(msg)
>> +
>> +
>> +class Window(urwid.Frame):
>> +    """
>> +    This is going to be the main window that is going to compose other
>> +    windows. In this stage it is unnecesssary but will be necessary in
>> +    future when we will have multiple windows and want to the switch
>> between
>> +    them and display overlays
>> +    """
>> +    def __init__(self, master):
>> +        self.master = master
>> +        footer = StatusBar()
>> +        body = HistoryWindow(master)
>> +        super().__init__(body, footer=footer)
>> +
>> +
>> +class TUILogHandler(Handler):
>> +    def __init__(self, tui):
>> +        super().__init__()
>> +        self.tui = tui
>> +
>> +    def emit(self, record):
>> +        level = record.levelname
>> +        msg = record.getMessage()
>> +        msg = f'[{level}]: {msg}'
>> +        self.tui.add_to_history(msg)
>> +
>> +
>> +def main():
>> +    parser = argparse.ArgumentParser(description='AQMP TUI')
>> +    parser.add_argument('qmp_server', help='Address of the QMP server'
>> +                        '< UNIX socket path | TCP addr:port >')
>> +    parser.add_argument('--log-file', help='The Log file name')
>> +    parser.add_argument('--log-level', default='WARNING',
>> +                        help='Log level
>> <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
>> +    parser.add_argument('--asyncio-debug', action='store_true',
>> +                        help='Enable debug mode for asyncio loop'
>> +                        'Generates lot of output, makes TUI unusable
>> when'
>> +                        'logs are logged in the TUI itself.'
>> +                        'Use only when logging to a file')
>> +    args = parser.parse_args()
>> +
>> +    try:
>> +        address = QEMUMonitorProtocol.parse_address(args.qmp_server)
>> +    except QMPBadPortError as err:
>> +        parser.error(err)
>> +
>> +    app = App(address)
>> +
>> +    if args.log_file:
>> +        LOGGER.addHandler(logging.FileHandler(args.log_file))
>> +    else:
>> +        LOGGER.addHandler(TUILogHandler(app))
>> +
>> +    log_level = logging.getLevelName(args.log_level)
>> +    # getLevelName returns 'Level {log_level}' when a invalid level is
>> passed.
>> +    if log_level == f'Level {args.log_level}':
>> +        parser.error('Invalid log level')
>> +    LOGGER.setLevel(log_level)
>> +
>> +    app.run(args.asyncio_debug)
>> +
>> +
>> +if __name__ == '__main__':
>> +    main()  # type: ignore
>> diff --git a/python/setup.cfg b/python/setup.cfg
>> index d106a0ed7a..50f9894468 100644
>> --- a/python/setup.cfg
>> +++ b/python/setup.cfg
>> @@ -81,8 +81,22 @@ namespace_packages = True
>>  # fusepy has no type stubs:
>>  allow_subclassing_any = True
>>
>> +[mypy-qemu.aqmp.aqmp_tui]
>> +disallow_untyped_defs = False
>> +disallow_incomplete_defs = False
>> +check_untyped_defs = False
>> +# urwid and urwid_readline have no type stubs:
>> +allow_subclassing_any = True
>> +
>> +# The following missing import directives are because these libraries do
>> not
>> +# provide type stubs. Allow them on an as-needed basis for mypy.
>>  [mypy-fuse]
>> -# fusepy has no type stubs:
>> +ignore_missing_imports = True
>> +
>> +[mypy-urwid]
>> +ignore_missing_imports = True
>> +
>> +[mypy-urwid_readline]
>>  ignore_missing_imports = True
>>
>>  [pylint.messages control]
>> --
>> 2.17.1
>>
>>

--000000000000419e7005c971d0b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div dir=3D"ltr"><div dir=3D"ltr"><div style=
=3D"font-size:small"><br></div></div><div dir=3D"ltr"><div dir=3D"ltr"><div=
 style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 6, 2021 at 12:41 AM John S=
now &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G =
S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank=
">niteesh.gs@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Added a draft of AQMP TUI.<br>
<br>
Implements the follwing basic features:<br>
1) Command transmission/reception.<br>
2) Shows events asynchronously.<br>
3) Shows server status in the bottom status bar.<br>
<br>
Also added necessary pylint, mypy configurations<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 333 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 16 +-<br>
=C2=A02 files changed, 348 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br>
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py<br=
>
new file mode 100644<br>
index 0000000000..ec9eba0aa7<br>
--- /dev/null<br>
+++ b/python/qemu/aqmp/aqmp_tui.py<br>
@@ -0,0 +1,333 @@<br>
+# Copyright (c) 2021<br>
+#<br>
+# Authors:<br>
+#=C2=A0 Niteesh Babu G S &lt;<a href=3D"mailto:niteesh.gs@gmail.com" targe=
t=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
+#<br>
+# This work is licensed under the terms of the GNU GPL, version 2 or<br>
+# later.=C2=A0 See the COPYING file in the top-level directory.<br>
+<br>
+import argparse<br>
+import asyncio<br>
+import logging<br>
+from logging import Handler<br>
+import signal<br>
+<br>
+import urwid<br>
+import urwid_readline<br>
+<br>
+from ..qmp import QEMUMonitorProtocol, QMPBadPortError<br>
+from .message import DeserializationError, Message, UnexpectedTypeError<br=
>
+from .protocol import ConnectError<br>
+from .qmp_client import ExecInterruptedError, QMPClient<br>
+from .util import create_task, pretty_traceback<br>
+<br>
+<br>
+UPDATE_MSG =3D &#39;UPDATE_MSG&#39;<br>
+<br>
+# Using root logger to enable all loggers under qemu and asyncio<br>
+LOGGER =3D logging.getLogger()<br>
+<br>
+<br>
+def format_json(msg):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Formats given multiline JSON message into a single line mess=
age.<br>
+=C2=A0 =C2=A0 Converting into single line is more asthetically pleasing wh=
en looking<br>
+=C2=A0 =C2=A0 along with error messages compared to multiline JSON.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 # FIXME: Use better formatting mechanism. Might break at mor=
e complex JSON<br>
+=C2=A0 =C2=A0 # data.<br>
+=C2=A0 =C2=A0 msg =3D msg.replace(&#39;\n&#39;, &#39;&#39;)<br>
+=C2=A0 =C2=A0 words =3D msg.split(&#39; &#39;)<br>
+=C2=A0 =C2=A0 words =3D [word for word in words if word !=3D &#39;&#39;]<b=
r>
+=C2=A0 =C2=A0 return &#39; &#39;.join(words)<br>
+<br>
+<br>
+class App(QMPClient):<br>
+=C2=A0 =C2=A0 def __init__(self, address):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.register_signal(type(self), UPDATE_MSG)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window =3D Window(self)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.address =3D address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__()<br>
+<br>
+=C2=A0 =C2=A0 def add_to_history(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.emit_signal(self, UPDATE_MSG, msg)<br>
+<br>
+=C2=A0 =C2=A0 def _cb_outbound(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: I think the ideal way to omit these m=
essages during in-TUI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # logging will be to add a filter to the logge=
r. We can use regex to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # filter out messages starting with &#39;Reque=
st:&#39; or &#39;Response:&#39; but I<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # think a better approach will be encapsulate =
the message in an object<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # and filter based on the object. Encapsulatio=
n of the message will<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # also be necessary when we want different for=
matting of messages<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # inside TUI.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 handler =3D LOGGER.handlers[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(handler, TUILogHandler):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.debug(&#39;Request: %s&#3=
9;, str(msg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(&#39;&lt;-- &#39; + str(ms=
g))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg<br>
+<br>
+=C2=A0 =C2=A0 def _cb_inbound(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 handler =3D LOGGER.handlers[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not isinstance(handler, TUILogHandler):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.debug(&#39;Response: %s&#=
39;, str(msg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(&#39;--&gt; &#39; + str(ms=
g))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg<br>
+<br>
+=C2=A0 =C2=A0 async def wait_for_events(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 async for event in self.events:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.handle_event(event)<br>
+<br>
+=C2=A0 =C2=A0 async def _send_to_server(self, raw_msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: Format the raw_msg in history view to=
 one line. It is not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # pleasing to see multiple lines JSON object w=
ith an error statement.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D Message(bytes(raw_msg, e=
ncoding=3D&#39;utf-8&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Format multiline json into a s=
ingle line JSON, since it is more<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # pleasing to look along with er=
r message in TUI.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_msg =3D self.format_json(raw=
_msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._raw(msg, assign_id=
=3D&#39;id&#39; not in msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (ValueError, TypeError) as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;Invalid message=
: %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(f&#39;{raw_m=
sg}: {err}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (DeserializationError, UnexpectedTypeEr=
ror) as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;Invalid message=
: %s&#39;, err.error_message)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(f&#39;{raw_m=
sg}: {err.error_message}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExecInterruptedError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;Error server di=
sconnected before reply&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.emit_signal(self, UPDATE_M=
SG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;{&quot;error&quot;: &quot;Server disco=
nnected before reply&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(&quot;Server di=
sconnected&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.error(&#39;Exception from=
 _send_to_server: %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br>
+<br>
+=C2=A0 =C2=A0 def cb_send_to_server(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self._send_to_server(msg))<br>
+<br>
+=C2=A0 =C2=A0 def unhandled_input(self, key):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if key =3D=3D &#39;esc&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.kill_app()<br>
+<br>
+=C2=A0 =C2=A0 def kill_app(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: Work on the disconnect logic<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self._kill_app())<br>
+<br>
+=C2=A0 =C2=A0 async def _kill_app(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # It is ok to call disconnect even in disconne=
ct state<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.disconnect()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.debug(&#39;Disconnect fin=
ished. Exiting app&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;_kill_app: %s&#=
39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Let the app crash after provid=
ing a proper stack trace<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise urwid.ExitMainLoop()<br>
+<br>
+=C2=A0 =C2=A0 def handle_event(self, event):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: Consider all states present in qapi/r=
un-state.json<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if event[&#39;event&#39;] =3D=3D &#39;SHUTDOWN=
&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(&#39;Server shu=
tdown&#39;)<br>
+<br>
+=C2=A0 =C2=A0 def _set_status(self, msg: str) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window.footer.set_text(msg)<br>
+<br>
+=C2=A0 =C2=A0 def _get_formatted_address(self) -&gt; str:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D f&#39;{self.address}&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(self.address, tuple):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host, port =3D self.address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D f&#39;{host}:{port}&#39=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return addr<br>
+<br>
+=C2=A0 =C2=A0 async def connect_server(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.connect(self.address)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D self._get_formatted_add=
ress()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(f&#39;Connected=
 to {addr}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ConnectError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;connect_server:=
 ConnectError %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(&#39;Server shu=
tdown&#39;)<br>
+<br>
+=C2=A0 =C2=A0 def run(self, debug=3DFalse):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop =3D asyncio.get_event_loop()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop.set_debug(debug)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Gracefully handle SIGTERM and SIGINT signals=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cancel_signals =3D [signal.SIGTERM, signal.SIG=
INT]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for sig in cancel_signals:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop.add_signal_handler(si=
g, self.kill_app)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 event_loop =3D urwid.AsyncioEventLoop(loop=3Ds=
elf.aloop)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 main_loop =3D urwid.MainLoop(urwid.AttrMap(sel=
f.window, &#39;background&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unhandled_input=3Dself.=
unhandled_input,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle_mouse=3DTrue,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_loop=3Devent_loop=
)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self.wait_for_events(), self.aloop=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self.connect_server(), self.aloop)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 main_loop.run()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.error(&#39;%s\n%s\n&#39;,=
 str(err), pretty_traceback())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br>
+<br>
+<br>
+class StatusBar(urwid.Text):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 A simple Text widget that currently only shows connection st=
atus.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, text=3D&#39;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(text, align=3D&#39;right&#39;=
)<br>
+<br>
+<br>
+class Editor(urwid_readline.ReadlineEdit):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Support urwid_readline features along with<br>
+=C2=A0 =C2=A0 history support which lacks in urwid_readline<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, master):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(caption=3D&#39;&gt; &#39;, mu=
ltiline=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master =3D master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index =3D -1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_history =3D False<br>
+<br>
+=C2=A0 =C2=A0 def keypress(self, size, key):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: Add some logic for down key and clean =
up logic if possible.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Returning None means the key has been handle=
d by this widget<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # which otherwise is propogated to the parent =
widget to be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # handled<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D self.get_edit_text()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if key =3D=3D &#39;up&#39; and not msg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Show the history when &#39;up =
arrow&#39; is pressed with no input text.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # NOTE: The show_history logic i=
s necessary because in &#39;multiline&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # mode (which we use) &#39;up ar=
row&#39; is used to move between lines.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_history =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_msg =3D self.history[self.l=
ast_index] if self.history else &#39;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.set_edit_text(last_msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.edit_pos =3D len(last_msg)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index +=3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif key =3D=3D &#39;up&#39; and self.show_his=
tory:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.last_index &lt; len(self=
.history):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.set_edit_text=
(self.history[self.last_index])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.edit_pos =3D =
len(self.history[self.last_index])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index +=
=3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif key =3D=3D &#39;meta enter&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # When using multiline, enter in=
serts a new line into the editor<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # send the input to the server o=
n alt + enter<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master.cb_send_to_server(ms=
g)<br></blockquote><div><br></div><div><div>cb_send_to_server calls create_=
task(App._send_to_server(msg)) at which=20
point in the coroutine you finally do msg =3D Message(bytes(raw_msg,=20
encoding=3D&#39;utf-8&#39;)). However, you can do your message conversion *=
first*, here in the Editor.<br><br></div><div>That way, you can avoid erasi=
ng the editor bar when the message is garbled and the user has a chance to =
fix the corrupted message *first* before we dispatch to the callback-async-=
machine. That should reduce quite a lot of the error cases in _send_to_serv=
er and helps separate out the two kinds of errors we expect to see here:<br=
><br></div><div>1. The user typed something that&#39;s garbage, and we didn=
&#39;t actually even send it (because we couldn&#39;t), and<br></div><div>2=
. We sent (or tried to send) the message; but a failure occurred.<br></div>=
</div></div></div></blockquote><div><span class=3D"gmail_default" style=3D"=
font-size:small">Thanks. Refactored this.</span>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quo=
te"><div><div></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.insert(0, msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.set_edit_text(&#39;&#39;)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_history =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_history =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return super().keypress(size, ke=
y)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+<br>
+class EditorWidget(urwid.Filler):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Wraps CustomEdit<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, master):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(Editor(master), valign=3D&#39=
;top&#39;)<br>
+<br>
+<br>
+class HistoryBox(urwid.ListBox):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Shows all the QMP message transmitted/received<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, master):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master =3D master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history =3D urwid.SimpleFocusListWalker([=
])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(self.history)<br>
+<br>
+=C2=A0 =C2=A0 def add_to_history(self, history):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.append(urwid.Text(history))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.history:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.set_focus(len(self.=
history) - 1)<br>
+<br>
+<br>
+class HistoryWindow(urwid.Frame):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Composes the HistoryBox and EditorWidget<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, master):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master =3D master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.editor_widget =3D EditorWidget(master)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.editor =3D urwid.LineBox(self.editor_widg=
et)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history =3D HistoryBox(master)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.body =3D urwid.Pile([(&#39;weight&#39;, 8=
0, self.history),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;weight&#39;, 20, self.editor)]=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(self.body)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.connect_signal(self.master, UPDATE_MSG, =
self.cb_add_to_history)<br>
+<br>
+=C2=A0 =C2=A0 def cb_add_to_history(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.add_to_history(msg)<br>
+<br>
+<br>
+class Window(urwid.Frame):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 This is going to be the main window that is going to compose=
 other<br>
+=C2=A0 =C2=A0 windows. In this stage it is unnecesssary but will be necess=
ary in<br>
+=C2=A0 =C2=A0 future when we will have multiple windows and want to the sw=
itch between<br>
+=C2=A0 =C2=A0 them and display overlays<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, master):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master =3D master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 footer =3D StatusBar()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 body =3D HistoryWindow(master)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(body, footer=3Dfooter)<br>
+<br>
+<br>
+class TUILogHandler(Handler):<br>
+=C2=A0 =C2=A0 def __init__(self, tui):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tui =3D tui<br>
+<br>
+=C2=A0 =C2=A0 def emit(self, record):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 level =3D record.levelname<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D record.getMessage()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D f&#39;[{level}]: {msg}&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tui.add_to_history(msg)<br>
+<br>
+<br>
+def main():<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(description=3D&#39;AQMP T=
UI&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;qmp_server&#39;, help=3D&#39;Addres=
s of the QMP server&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;&lt; UNIX socket path | TCP addr:port &gt;&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--log-file&#39;, help=3D&#39;The Lo=
g file name&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--log-level&#39;, default=3D&#39;WA=
RNING&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&#39;Log level &lt;CRITICAL|ERROR|WARNING|INFO|DEBUG|&gt;=
&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--asyncio-debug&#39;, action=3D&#39=
;store_true&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&#39;Enable debug mode for asyncio loop&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;Generates lot of output, makes TUI unusable when&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;logs are logged in the TUI itself.&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;Use only when logging to a file&#39;)<br>
+=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 address =3D QEMUMonitorProtocol.parse_address(=
args.qmp_server)<br>
+=C2=A0 =C2=A0 except QMPBadPortError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.error(err)<br>
+<br>
+=C2=A0 =C2=A0 app =3D App(address)<br>
+<br>
+=C2=A0 =C2=A0 if args.log_file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.addHandler(logging.FileHandler(args.log=
_file))<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.addHandler(TUILogHandler(app))<br>
+<br>
+=C2=A0 =C2=A0 log_level =3D logging.getLevelName(args.log_level)<br>
+=C2=A0 =C2=A0 # getLevelName returns &#39;Level {log_level}&#39; when a in=
valid level is passed.<br>
+=C2=A0 =C2=A0 if log_level =3D=3D f&#39;Level {args.log_level}&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.error(&#39;Invalid log level&#39;)<br>
+=C2=A0 =C2=A0 LOGGER.setLevel(log_level)<br>
+<br>
+=C2=A0 =C2=A0 app.run(args.asyncio_debug)<br>
+<br>
+<br>
+if __name__ =3D=3D &#39;__main__&#39;:<br>
+=C2=A0 =C2=A0 main()=C2=A0 # type: ignore<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index d106a0ed7a..50f9894468 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -81,8 +81,22 @@ namespace_packages =3D True<br>
=C2=A0# fusepy has no type stubs:<br>
=C2=A0allow_subclassing_any =3D True<br>
<br>
+[mypy-qemu.aqmp.aqmp_tui]<br>
+disallow_untyped_defs =3D False<br>
+disallow_incomplete_defs =3D False<br>
+check_untyped_defs =3D False<br>
+# urwid and urwid_readline have no type stubs:<br>
+allow_subclassing_any =3D True<br>
+<br>
+# The following missing import directives are because these libraries do n=
ot<br>
+# provide type stubs. Allow them on an as-needed basis for mypy.<br>
=C2=A0[mypy-fuse]<br>
-# fusepy has no type stubs:<br>
+ignore_missing_imports =3D True<br>
+<br>
+[mypy-urwid]<br>
+ignore_missing_imports =3D True<br>
+<br>
+[mypy-urwid_readline]<br>
=C2=A0ignore_missing_imports =3D True<br>
<br>
=C2=A0[pylint.messages control]<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>
</blockquote></div></div>
</div>
</div>

--000000000000419e7005c971d0b4--

