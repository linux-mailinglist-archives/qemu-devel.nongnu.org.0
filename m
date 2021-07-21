Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD93D17EB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:27:00 +0200 (CEST)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Inz-0000SP-6o
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m6IkO-0004iV-04
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:23:16 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m6IkJ-00040n-Sh
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:23:15 -0400
Received: by mail-il1-x130.google.com with SMTP id m20so3405187ili.9
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YB6XKW0CqKcv9GJkQzp6fLg1PUa61wJnU3ZA3raU9q0=;
 b=DTtK5DW20L/wLpIO+cF5QxAcT+/vTAT/rB+nFmmK2RAKUI8iizCV645Irh9S52soip
 qSFasiIwvZ41DiYWUcjfUJHEPqxqQZ3b+bjnlFZfMLhrtIyn/chru2GgbgkcbjoyQJ99
 2pJx3LPsCtCY+o3jS1JqXmV7qSPdxp1Z1knrtekKH6dS6lLGB0I15K+dD489FoLF9z6T
 FnjHgNP/EiBBlTv249B86SSsVvK2xIY2RK5dU4osGp/N0Mv175N6bjYG9IC5oOOD7KuM
 lwoZ9qtFc+LIxfmLBOcMs53xpiksWiBrCfDd5yphdw0/rAK6c6zVkaO37JcM9MTAdCgC
 EZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YB6XKW0CqKcv9GJkQzp6fLg1PUa61wJnU3ZA3raU9q0=;
 b=da+EkZwIz9p4yjtbCwk3IsTW6R0cfMOVlU7GUd9ilhHq6U/TgYDnmLYIpZLBfNoaWn
 c6NO/16knsQ6EUwKexPWvMJpqq8/osTcQMQN22Qr+/UPh4zrszPjmLEZ0FoeU1OU6KRy
 jBT9e2Vza7lSI5c0rjPnZQKK7FATq8nf0iedjE8zM646APdpFK9P55x6U15JNhYS6+6k
 KNPPaARfGJnzWQ9/dWJ/3I91vc2h7q8/pdZOT4zoubY4NnSBdl+lReXRiKFnT8YoxA+b
 ALq3wMI2OBUqnrQh+NC0vCH/y7mGEFgLZeVQpI2yHR6OitqV0XG7UnSddn/ufakVjeEC
 sBfg==
X-Gm-Message-State: AOAM532DbzcA1W36E8HCj4+dm7tK8U0AGCwmk0AWow9qXxb6UZU1+G3W
 //3ROCoJXkUofLXSnOHe3x1zMtZUYlXU/52zn44=
X-Google-Smtp-Source: ABdhPJzDGq186iZd+TKgLO7ZMHtnpC4vcaw69VuRc89PT44TWd5qa5jF6aXhPhL7zqrZabiAAzdp9sxgWsGWnNwGM8w=
X-Received: by 2002:a92:db4e:: with SMTP id w14mr26203855ilq.188.1626898990441; 
 Wed, 21 Jul 2021 13:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
 <20210713220734.26302-4-niteesh.gs@gmail.com>
 <CAFn=p-Z6DV+Jjk+sNe4L0hgttnF=SKiL3efFD4QH1WkMFJnzbA@mail.gmail.com>
In-Reply-To: <CAFn=p-Z6DV+Jjk+sNe4L0hgttnF=SKiL3efFD4QH1WkMFJnzbA@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Thu, 22 Jul 2021 01:52:44 +0530
Message-ID: <CAN6ztm83sRzvY1JBqXKPHFfgsiOQQSn=fCr9L0f14SL+pRnpuQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] python/aqmp-tui: Add AQMP TUI draft
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000069292705c7a7f0f9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x130.google.com
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000069292705c7a7f0f9
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 21, 2021 at 12:34 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Tue, Jul 13, 2021 at 6:07 PM G S Niteesh Babu <niteesh.gs@gmail.com>
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
>>  python/qemu/aqmp/aqmp_tui.py | 332 +++++++++++++++++++++++++++++++++++
>>  python/setup.cfg             |  21 ++-
>>  2 files changed, 352 insertions(+), 1 deletion(-)
>>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>>
>> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
>> new file mode 100644
>> index 0000000000..f853efc1f5
>> --- /dev/null
>> +++ b/python/qemu/aqmp/aqmp_tui.py
>> @@ -0,0 +1,332 @@
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
>> +from .error import MultiException
>> +from .protocol import ConnectError
>> +from .qmp_protocol import QMP, ExecInterruptedError, ExecuteError
>> +from .util import create_task, pretty_traceback
>> +
>> +
>> +UPDATE_MSG = 'UPDATE_MSG'
>> +
>> +# Using root logger to enable all loggers under qemu and asyncio
>> +LOGGER = logging.getLogger()
>> +
>> +palette = [
>> +    (Token.Punctuation, '', '', '', 'h15,bold', 'g7'),
>> +    (Token.Text, '', '', '', '', 'g7'),
>> +    (Token.Name.Tag, '', '', '', 'bold,#f88', 'g7'),
>> +    (Token.Literal.Number.Integer, '', '', '', '#fa0', 'g7'),
>> +    (Token.Literal.String.Double, '', '', '', '#6f6', 'g7'),
>> +    (Token.Keyword.Constant, '', '', '', '#6af', 'g7'),
>> +    ('background', '', 'black', '', '', 'g7'),
>> +]
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
>> +        self.editor = EditorWidget(master)
>> +        self.editor_widget = urwid.LineBox(self.editor)
>>
>
> It's a little confusing that "editor" is of type EditorWidget but
> "editor_widget" is urwid.LineBox.
>
Fixed.

>
>
>> +        self.history = HistoryBox(master)
>> +        self.body = urwid.Pile([('weight', 80, self.history),
>> +                                ('weight', 20, self.editor_widget)])
>> +        super().__init__(self.body)
>> +        urwid.connect_signal(self.master, UPDATE_MSG,
>> self.cb_add_to_history)
>> +
>> +    def cb_add_to_history(self, msg, level=None):
>> +        formatted = []
>> +        if level:
>> +            msg = f'[{level}]: {msg}'
>> +            formatted.append(msg)
>> +        else:
>> +            lexer = lexers.JsonLexer()  # pylint: disable=no-member
>> +            for token in lexer.get_tokens(msg):
>> +                formatted.append(token)
>> +        self.history.add_to_history(formatted)
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
>> +class App(QMP):
>> +    def __init__(self, address):
>> +        urwid.register_signal(type(self), UPDATE_MSG)
>> +        self.window = Window(self)
>> +        self.address = address
>> +        self.aloop = None
>> +        self.loop = None
>> +        super().__init__()
>> +
>> +    def add_to_history(self, msg, level=None):
>> +        urwid.emit_signal(self, UPDATE_MSG, msg, level)
>> +
>> +    def _cb_outbound(self, msg):
>> +        LOGGER.debug('Request: %s', str(msg))
>> +        self.add_to_history('<-- ' + str(msg))
>> +        return msg
>> +
>> +    def _cb_inbound(self, msg):
>> +        LOGGER.debug('Response: %s', str(msg))
>> +        self.add_to_history('--> ' + str(msg))
>> +        return msg
>> +
>>
>
> [DEBUG]: Response seems to duplicate the "--> {...}" incoming messages.
>
The debug stuff is nice to have because it gets saved to the logfile, but
> is there some way to omit it from the history view, even when --debug is
> on? I think we simply don't need to see the responses twice. What do you
> think?
>
Ahh, I totally missed this. I didn't really try out the TUILogHandler much.
I just made sure I was
able to log all levels of messages properly.
Yup, I too feel we should omit the inbound/outbound debug messages
during logging inside TUI.

+    async def wait_for_events(self):
>> +        async for event in self.events:
>> +            self.handle_event(event)
>> +
>> +    async def _send_to_server(self, msg):
>> +        # TODO: Handle more validation errors (eg: ValueError)
>> +        try:
>> +            await self._raw(bytes(msg, 'utf-8'))
>> +        except ExecuteError:
>> +            LOGGER.info('Error response from server for msg: %s', msg)
>> +        except ExecInterruptedError:
>> +            LOGGER.info('Error server disconnected before reply')
>> +            # FIXME: Handle this better
>> +            # Show the disconnected message in the history window
>> +            urwid.emit_signal(self, UPDATE_MSG,
>> +                              '{"error": "Server disconnected before
>> reply"}')
>> +            self.window.footer.set_text("Server disconnected")
>> +        except Exception as err:
>> +            LOGGER.error('Exception from _send_to_server: %s', str(err))
>> +            raise err
>>
>
> Type non-JSON or a JSON value that isn't an object will crash the whole
> application.
>
> You need to look out for these:
>
>   File "/home/jsnow/src/qemu/python/qemu/aqmp/qmp_protocol.py", line 479,
> in _raw
>     msg = Message(msg)
>   File "/home/jsnow/src/qemu/python/qemu/aqmp/message.py", line 71, in
> __init__
>     self._obj = self._deserialize(self._data)
>   File "/home/jsnow/src/qemu/python/qemu/aqmp/message.py", line 158, in
> _deserialize
>     raise DeserializationError(emsg, data) from err
> qemu.aqmp.message.DeserializationError: Failed to deserialize QMP message.
>   raw bytes were: b'q\n\n'
>
>   File "/home/jsnow/src/qemu/python/qemu/aqmp/qmp_protocol.py", line 479,
> in _raw
>     msg = Message(msg)
>   File "/home/jsnow/src/qemu/python/qemu/aqmp/message.py", line 71, in
> __init__
>     self._obj = self._deserialize(self._data)
>   File "/home/jsnow/src/qemu/python/qemu/aqmp/message.py", line 160, in
> _deserialize
>     raise UnexpectedTypeError(
> qemu.aqmp.message.UnexpectedTypeError: QMP message is not a JSON object.
>   json value was: []
>
> There's also ValueError and TypeError, but I think the way you've written
> the shell here that there's not much of a chance to actually see these --
> they show up when serializing a python object, but you do bytes(msg) which
> means we use the *deserialization* interface to validate user input, so you
> might not actually see the other errors here ...
>
> Still, you theoretically could if somehow
> serialize(deserialize(bytes(msg)))) raised those errors. I don't expect
> that they would, but you may as well treat all of these errors the same:
> the input by the user is garbage and cannot be used. No need to exit or
> crash.
>
Will fix.

>
>
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
>> +        except MultiException as err:
>> +            LOGGER.info('Multiple exception on disconnect: %s', str(err))
>> +            # Let the app crash after providing a proper stack trace
>> +            raise err
>> +        raise urwid.ExitMainLoop()
>>
>
> I got rid of MultiException in v2, thankfully.... !
>
Nice :).

>
> If the server goes away, aqmp-shell shows the disconnect debug messages
> well enough, but then when hitting 'esc' afterwards, we get an Exception
> printed out to the terminal. Ideally, aqmp-shell should call disconnect()
> as soon as it notices a problem and not only when we call _kill_app.
>
Will refactor.

> +
>> +    def handle_event(self, event):
>> +        # FIXME: Consider all states present in qapi/run-state.json
>> +        if event['event'] == 'SHUTDOWN':
>> +            self.window.footer.set_text('Server shutdown')
>> +
>> +    async def connect_server(self):
>> +        try:
>> +            await self.connect(self.address)
>> +            self.window.footer.set_text("Connected to {:s}".format(
>> +                f"{self.address[0]}:{self.address[1]}"
>> +                if isinstance(self.address, tuple)
>> +                else self.address
>> +            ))
>> +        except ConnectError as err:
>> +            LOGGER.debug('Cannot connect to server %s', str(err))
>> +            self.window.footer.set_text('Server shutdown')
>> +
>> +    def run(self, debug=False):
>> +        self.screen.set_terminal_properties(256)
>> +
>> +        self.aloop = asyncio.get_event_loop()
>> +        self.aloop.set_debug(debug)
>> +
>> +        # Gracefully handle SIGTERM and SIGINT signals
>> +        cancel_signals = [signal.SIGTERM, signal.SIGINT]
>> +        for sig in cancel_signals:
>> +            self.aloop.add_signal_handler(sig, self.kill_app)
>> +
>> +        event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
>> +        self.loop = urwid.MainLoop(self.window,
>> +                                   unhandled_input=self.unhandled_input,
>> +                                   handle_mouse=True,
>> +                                   event_loop=event_loop)
>> +
>> +        create_task(self.wait_for_events(), self.aloop)
>> +        create_task(self.connect_server(), self.aloop)
>> +        try:
>> +            self.loop.run()
>> +        except Exception as err:
>> +            LOGGER.error('%s\n%s\n', str(err), pretty_traceback())
>> +            raise err
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
>> +        self.tui.add_to_history(msg, level)
>> +
>> +
>> +def parse_address(address):
>> +    """
>> +    This snippet was taken from qemu.qmp.__init__.
>> +    pylint complaints about duplicate code so it has been
>> +    temprorily disabled. This should be fixed once qmp is
>> +    replaced by aqmp in the future.
>> +    """
>> +    components = address.split(':')
>> +    if len(components) == 2:
>> +        try:
>> +            port = int(components[1])
>> +        except ValueError:
>> +            raise ValueError(f'Bad Port value in {address}') from None
>> +        return (components[0], port)
>> +    return address
>> +
>>
>
> You can just import the old QMP package and use the old function directly.
> That will save you the trouble of needing to silence the duplicate code
> checker too.
>
OK. Will change it.

> +
>> +def main():
>> +    parser = argparse.ArgumentParser(description='AQMP TUI')
>> +    parser.add_argument('qmp_server', help='Address of the QMP server'
>> +                        '< UNIX socket path | TCP addr:port >')
>> +    parser.add_argument('--log-file', help='The Log file name')
>> +    parser.add_argument('--log-level', help='Log level
>> <debug|info|error>',
>> +                        default='debug')
>> +    parser.add_argument('--debug', action='store_true',
>> +                        help='Enable debug mode for asyncio loop'
>> +                        'Generates lot of output, makes TUI unusable
>> when'
>> +                        'logs are logged in the TUI itself.'
>> +                        'Use only when logging to a file')
>> +    args = parser.parse_args()
>> +
>> +    try:
>> +        address = parse_address(args.qmp_server)
>> +    except ValueError as err:
>> +        parser.error(err)
>> +
>> +    app = App(address)
>> +
>>
>
> Initializing the app can go down below the logging initialization stuff,
> because the init method engages the logging module to set up the loggers,
> but we want to initialize the logging paradigm ourselves before anything
> touches it.
>
I can't move it below the initialization of loggers because TUILogHandler
requires a reference to the App class.
It was the simplest way I could think of to get the log messages inside the
TUI. Any ideas on how can I refactor it?

+    if args.log_file:
>> +        LOGGER.addHandler(logging.FileHandler(args.log_file))
>> +    else:
>> +        LOGGER.addHandler(TUILogHandler(app))
>> +
>> +    log_levels = {'debug': logging.DEBUG,
>> +                  'info': logging.INFO,
>> +                  'error': logging.ERROR}
>>
>
> There are more log levels than just 'debug', 'info' and 'error' ...
> There's probably a way to avoid having to re-write the mapping yourself.
> Something in the logging module can help here.
>
Yes, found a way.
https://github.com/python/cpython/blob/c8e35abfe304eb052a5220974006072c37d4b06a/Lib/logging/__init__.py#L119

>
>
>> +
>> +    if args.log_level not in log_levels:
>> +        parser.error('Invalid log level')
>> +    LOGGER.setLevel(log_levels[args.log_level])
>> +
>>
>
> You can initialize the app here instead.
>
>
>> +    app.run(args.debug)
>> +
>>
>>
>  I didn't pass "--debug", but I still got DEBUG messages in the history
> panel.
>


> What I'd like to see is only WARNING messages and above in the application
> unless I pass --debug, and then I want to see additional messages.
>

The --debug option is to enable the event loop logging and not the TUI
logging.
You can change the TUI logging levels using the --log-level option.
Maybe I'll rename the --debug option to --asyncio-debug and set the default
--log-level to WARNING.


> Looking good otherwise, I think it's shaping up. Thanks!
>

--00000000000069292705c7a7f0f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Jul 21, 2021 at 12:34 AM John Snow &lt;<a href=3D"mai=
lto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br>=
</div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Jul 13, 2021 at 6:07 PM G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.=
gs@gmail.com" target=3D"_blank">niteesh.gs@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Added a draft of AQMP T=
UI.<br>
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
=C2=A0python/qemu/aqmp/aqmp_tui.py | 332 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 21 ++-<br>
=C2=A02 files changed, 352 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br>
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py<br=
>
new file mode 100644<br>
index 0000000000..f853efc1f5<br>
--- /dev/null<br>
+++ b/python/qemu/aqmp/aqmp_tui.py<br>
@@ -0,0 +1,332 @@<br>
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
+from .error import MultiException<br>
+from .protocol import ConnectError<br>
+from .qmp_protocol import QMP, ExecInterruptedError, ExecuteError<br>
+from .util import create_task, pretty_traceback<br>
+<br>
+<br>
+UPDATE_MSG =3D &#39;UPDATE_MSG&#39;<br>
+<br>
+# Using root logger to enable all loggers under qemu and asyncio<br>
+LOGGER =3D logging.getLogger()<br>
+<br>
+palette =3D [<br>
+=C2=A0 =C2=A0 (Token.Punctuation, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39=
;h15,bold&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Text, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39;&#39;,=
 &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Name.Tag, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39;bo=
ld,#f88&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Literal.Number.Integer, &#39;&#39;, &#39;&#39;, &#39;=
&#39;, &#39;#fa0&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Literal.String.Double, &#39;&#39;, &#39;&#39;, &#39;&=
#39;, &#39;#6f6&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Keyword.Constant, &#39;&#39;, &#39;&#39;, &#39;&#39;,=
 &#39;#6af&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (&#39;background&#39;, &#39;&#39;, &#39;black&#39;, &#39;&#3=
9;, &#39;&#39;, &#39;g7&#39;),<br>
+]<br>
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
g)<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.editor =3D EditorWidget(master)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.editor_widget =3D urwid.LineBox(self.edit=
or)<br></blockquote><div><br></div><div>It&#39;s a little confusing that &q=
uot;editor&quot; is of type EditorWidget but &quot;editor_widget&quot; is u=
rwid.LineBox.<br></div></div></div></blockquote><div><span class=3D"gmail_d=
efault" style=3D"font-size:small">Fixed.</span>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history =3D HistoryBox(master)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.body =3D urwid.Pile([(&#39;weight&#39;, 8=
0, self.history),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;weight&#39;, 20, self.editor_w=
idget)])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(self.body)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.connect_signal(self.master, UPDATE_MSG, =
self.cb_add_to_history)<br>
+<br>
+=C2=A0 =C2=A0 def cb_add_to_history(self, msg, level=3DNone):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 formatted =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if level:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D f&#39;[{level}]: {msg}&#=
39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 formatted.append(msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lexer =3D lexers.JsonLexer()=C2=
=A0 # pylint: disable=3Dno-member<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for token in lexer.get_tokens(ms=
g):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 formatted.append(t=
oken)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.add_to_history(formatted)<br>
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
+class App(QMP):<br>
+=C2=A0 =C2=A0 def __init__(self, address):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.register_signal(type(self), UPDATE_MSG)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window =3D Window(self)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.address =3D address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.loop =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__()<br>
+<br>
+=C2=A0 =C2=A0 def add_to_history(self, msg, level=3DNone):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.emit_signal(self, UPDATE_MSG, msg, level=
)<br>
+<br>
+=C2=A0 =C2=A0 def _cb_outbound(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.debug(&#39;Request: %s&#39;, str(msg))<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(&#39;&lt;-- &#39; + str(ms=
g))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg<br>
+<br>
+=C2=A0 =C2=A0 def _cb_inbound(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.debug(&#39;Response: %s&#39;, str(msg))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(&#39;--&gt; &#39; + str(ms=
g))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg<br>
+<br></blockquote><div><br></div><div>[DEBUG]: Response seems to duplicate =
the &quot;--&gt; {...}&quot; incoming messages.</div></div></div></blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div>The debug stuff is nice to have because it gets =
saved to the logfile, but is there some way to omit it from the history vie=
w, even when --debug is on? I think we simply don&#39;t need to see the res=
ponses twice. What do you think?</div></div></div></blockquote><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Ahh, I totally missed this.=
 I didn&#39;t really try out the TUILogHandler much. I just made sure I was=
</div><div class=3D"gmail_default" style=3D"font-size:small">able to log al=
l levels of messages properly.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Yup, I too feel we should omit the inbound/outbound debug m=
essages during=C2=A0logging inside TUI.</div></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =
async def wait_for_events(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 async for event in self.events:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.handle_event(event)<br>
+<br>
+=C2=A0 =C2=A0 async def _send_to_server(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: Handle more validation errors (eg: Val=
ueError)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._raw(bytes(msg, &#39;=
utf-8&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExecuteError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;Error response =
from server for msg: %s&#39;, msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExecInterruptedError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;Error server di=
sconnected before reply&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: Handle this better<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Show the disconnected message =
in the history window<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.emit_signal(self, UPDATE_M=
SG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;{&quot;error&quot;: &quot;Server disco=
nnected before reply&quot;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window.footer.set_text(&quo=
t;Server disconnected&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.error(&#39;Exception from=
 _send_to_server: %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br></blockquote><div><=
br></div><div>Type non-JSON or a<span class=3D"gmail_default" style=3D"font=
-size:small"></span> JSON value that isn&#39;t an object will crash the who=
le application.</div><div><br></div><div>You need to look out for these:</d=
iv><div><br></div><div>=C2=A0 File &quot;/home/jsnow/src/qemu/python/qemu/a=
qmp/qmp_protocol.py&quot;, line 479, in _raw<br>=C2=A0 =C2=A0 msg =3D Messa=
ge(msg)<br>=C2=A0 File &quot;/home/jsnow/src/qemu/python/qemu/aqmp/message.=
py&quot;, line 71, in __init__<br>=C2=A0 =C2=A0 self._obj =3D self._deseria=
lize(self._data)<br>=C2=A0 File &quot;/home/jsnow/src/qemu/python/qemu/aqmp=
/message.py&quot;, line 158, in _deserialize<br>=C2=A0 =C2=A0 raise Deseria=
lizationError(emsg, data) from err<br>qemu.aqmp.message.DeserializationErro=
r: Failed to deserialize QMP message.<br>=C2=A0 raw bytes were: b&#39;q\n\n=
&#39;</div><div><br></div><div>=C2=A0 File &quot;/home/jsnow/src/qemu/pytho=
n/qemu/aqmp/qmp_protocol.py&quot;, line 479, in _raw<br>=C2=A0 =C2=A0 msg =
=3D Message(msg)<br>=C2=A0 File &quot;/home/jsnow/src/qemu/python/qemu/aqmp=
/message.py&quot;, line 71, in __init__<br>=C2=A0 =C2=A0 self._obj =3D self=
._deserialize(self._data)<br>=C2=A0 File &quot;/home/jsnow/src/qemu/python/=
qemu/aqmp/message.py&quot;, line 160, in _deserialize<br>=C2=A0 =C2=A0 rais=
e UnexpectedTypeError(<br>qemu.aqmp.message.UnexpectedTypeError: QMP messag=
e is not a JSON object.<br>=C2=A0 json value was: []</div><div><br></div><d=
iv>There&#39;s also ValueError and TypeError, but I think the way you&#39;v=
e written the shell here that there&#39;s not much of a chance to actually =
see these -- they show up when serializing a python object, but you do byte=
s(msg) which means we use the *deserialization* interface to validate user =
input, so you might not actually see the other errors here ...</div><div><b=
r></div><div>Still, you theoretically could if somehow serialize(deserializ=
e(bytes(msg)))) raised those errors. I don&#39;t expect that they would, bu=
t you may as well treat all of these errors the same: the input by the user=
 is garbage and cannot be used. No need to exit or crash.<br></div></div></=
div></blockquote><div><span class=3D"gmail_default" style=3D"font-size:smal=
l">Will fix.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except MultiException as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.info(&#39;Multiple except=
ion on disconnect: %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Let the app crash after provid=
ing a proper stack trace<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise urwid.ExitMainLoop()<br></blockquote><di=
v><br></div><div>I got rid of MultiException in v2, thankfully.... <span cl=
ass=3D"gmail_default" style=3D"font-size:small">!</span></div></div></div><=
/blockquote><div><span class=3D"gmail_default" style=3D"font-size:small"></=
span>Nice :).<span class=3D"gmail_default" style=3D"font-size:small"></span=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div class=3D"gmail_quote"><div><span class=3D"gmail_default" style=3D"font-=
size:small"></span></div><div><br></div><div>If the server goes away, aqmp-=
shell shows the disconnect debug messages well enough, but then when hittin=
g &#39;esc&#39; afterwards, we get an Exception printed out to the terminal=
. Ideally, aqmp-shell should call disconnect() as soon as it notices a prob=
lem and not only when we call _kill_app.</div></div></div></blockquote><div=
><span class=3D"gmail_default" style=3D"font-size:small">Will refactor.</sp=
an>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
+=C2=A0 =C2=A0 def handle_event(self, event):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: Consider all states present in qapi/r=
un-state.json<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if event[&#39;event&#39;] =3D=3D &#39;SHUTDOWN=
&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window.footer.set_text(&#39=
;Server shutdown&#39;)<br>
+<br>
+=C2=A0 =C2=A0 async def connect_server(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.connect(self.address)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window.footer.set_text(&quo=
t;Connected to {:s}&quot;.format(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;{self.addre=
ss[0]}:{self.address[1]}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(self=
.address, tuple)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else self.address<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ConnectError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.debug(&#39;Cannot connect=
 to server %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window.footer.set_text(&#39=
;Server shutdown&#39;)<br>
+<br>
+=C2=A0 =C2=A0 def run(self, debug=3DFalse):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.screen.set_terminal_properties(256)<br>
+<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.loop =3D urwid.MainLoop(self.window,<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.loop.run()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.error(&#39;%s\n%s\n&#39;,=
 str(err), pretty_traceback())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tui.add_to_history(msg, level)<br>
+<br>
+<br>
+def parse_address(address):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 This snippet was taken from qemu.qmp.__init__.<br>
+=C2=A0 =C2=A0 pylint complaints about duplicate code so it has been<br>
+=C2=A0 =C2=A0 temprorily disabled. This should be fixed once qmp is<br>
+=C2=A0 =C2=A0 replaced by aqmp in the future.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 components =3D address.split(&#39;:&#39;)<br>
+=C2=A0 =C2=A0 if len(components) =3D=3D 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port =3D int(components[1])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ValueError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ValueError(f&#39;Bad Port =
value in {address}&#39;) from None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (components[0], port)<br>
+=C2=A0 =C2=A0 return address<br>
+<br></blockquote><div><br></div><div>You can just import the old QMP packa=
ge and use the old function directly. That will save you the trouble of nee=
ding to silence the duplicate code checker too.</div></div></div></blockquo=
te><div><span class=3D"gmail_default" style=3D"font-size:small">OK. Will ch=
ange it.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
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
+=C2=A0 =C2=A0 parser.add_argument(&#39;--log-level&#39;, help=3D&#39;Log l=
evel &lt;debug|info|error&gt;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 default=3D&#39;debug&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--debug&#39;, action=3D&#39;store_t=
rue&#39;,<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 address =3D parse_address(args.qmp_server)<br>
+=C2=A0 =C2=A0 except ValueError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.error(err)<br>
+<br>
+=C2=A0 =C2=A0 app =3D App(address)<br>
+<br></blockquote><div><br></div><div>Initializing the app can go down belo=
w the logging initialization stuff, because the init method engages the log=
ging module to set up the loggers, but we want to initialize the logging pa=
radigm ourselves before anything touches it.</div></div></div></blockquote>=
<div class=3D"gmail_default" style=3D"font-size:small">I can&#39;t move it =
below the initialization of loggers because TUILogHandler requires a refere=
nce to the App class.</div><div class=3D"gmail_default" style=3D"font-size:=
small">It was the simplest=C2=A0way I could think of to get the log message=
s inside the TUI. Any ideas on how can I refactor it?</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 if args.log_file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.addHandler(logging.FileHandler(args.log=
_file))<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGGER.addHandler(TUILogHandler(app))<br>
+<br>
+=C2=A0 =C2=A0 log_levels =3D {&#39;debug&#39;: logging.DEBUG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;info&#=
39;: logging.INFO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;error&=
#39;: logging.ERROR}<br></blockquote><div><br></div><div>There are more log=
 levels than just &#39;debug&#39;, &#39;info&#39; and &#39;error&#39; ... T=
here&#39;s probably a way to avoid having to re-write the mapping yourself.=
 Something in the logging module can help here.</div></div></div></blockquo=
te><div class=3D"gmail_default" style=3D"font-size:small">Yes, found a way.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><a href=3D"htt=
ps://github.com/python/cpython/blob/c8e35abfe304eb052a5220974006072c37d4b06=
a/Lib/logging/__init__.py#L119" target=3D"_blank">https://github.com/python=
/cpython/blob/c8e35abfe304eb052a5220974006072c37d4b06a/Lib/logging/__init__=
.py#L119</a></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 if args.log_level not in log_levels:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.error(&#39;Invalid log level&#39;)<br>
+=C2=A0 =C2=A0 LOGGER.setLevel(log_levels[args.log_level])<br>
+<br></blockquote><div><br></div><div>You can initialize the app here inste=
ad.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+=C2=A0 =C2=A0 app.run(args.debug)<br>
+<br>
<br></blockquote><div><br></div><div>=C2=A0I didn&#39;t pass &quot;--debug&=
quot;, but I still got DEBUG messages in the history panel.</div></div></di=
v></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>What I&#39;d like t=
o see is only WARNING messages and above in the application unless I pass -=
-debug, and then I want to see additional messages.<br></div></div></div></=
blockquote><div>=C2=A0</div><div><div class=3D"gmail_default" style=3D"font=
-size:small">The --debug option is to enable the event loop logging and not=
 the TUI logging.</div><div><span class=3D"gmail_default">You can change th=
e TUI logging levels using the --log-level option.</span></div><div><span c=
lass=3D"gmail_default">Maybe I&#39;ll rename the --debug option to --asynci=
o-debug and set the default</span></div><div><span class=3D"gmail_default">=
--log-level to WARNING.</span></div></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div></div><div>Looking good otherwise, I think it&#39;s shaping up. Tha=
nks!<br></div></div></div>
</blockquote></div></div>
</div>

--00000000000069292705c7a7f0f9--

