Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6F93C7986
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:17:39 +0200 (CEST)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qig-0004H7-0x
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QaP-0003Rh-M4
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:09:05 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:39843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QaL-0006qd-3d
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:09:05 -0400
Received: by mail-io1-xd35.google.com with SMTP id h6so29206053iok.6
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1b0xIlqPbcdORH+rk5gIG7Lm/s7+HMEqZ39acVJJXHk=;
 b=dpTMmDqAJ/osIYysm2qaskCtQpXr5Fjq2HBnSbqrpqecQtuqXyG9e9Ck/kdfMjq5Ct
 Pk+VRyoYkT9g4PNCljklxbqx9Yz82NAs2RQj09vQiuzVvuQ0nj7ToDapJBFU1JaXYQ2I
 MgG0YztYVaGkaBjC15kGq6Lqb2mBw2Q9IG110NDtrWt5eJuk0mNTSdNBg5wvzbWbP/Kl
 7P6A2QEDVCL9eiqW57DuOe2oIKEq9dDKr7CPAW9Hmaj3dIKom+9UDEUU/xDn21ByyPOd
 ZKbA2E5nu0YJa26FQK0eNEjOsE6ifOKGtZRdkkO8beNWf7+8gFbLCSwvFfBvL8NLZcDE
 hIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1b0xIlqPbcdORH+rk5gIG7Lm/s7+HMEqZ39acVJJXHk=;
 b=a1z2OcXvFM7S8Fz+A4JI9lqPErk8zoU1nsqaP4KtwHVq0jHwR4negWQaGVS+mqruI3
 YVVrIpAEVbiY5FvjAEtkAVi7stAowBwSoARfx6afv+oPsM6ArtI/WJOpXNCsgQgPd8Du
 HFoj/Edj7ien4rsgrsskVHcSYKz+DABmT348NRp8WLRCzjI+9Q2B6d8SrSrZgHFcZ0MI
 y6sa5DPJa1YNeO0zjgSIzZVszvAbJ4AA11L7lpuVsyxtIrT7w0ZdRYQfZrxFOFZ1KEK8
 8RnQ9vIGOu7nXzMul2rDkB241JRKps4a9MfjSi/XsO8vv/qPnHCbQ3s3moqK9cwti8hU
 9tAQ==
X-Gm-Message-State: AOAM531IUaMXXfiER5iijYHYgblyTVy5L+wngumPbKkvjRoRREXNq7PS
 YAhGUcDQdLM5hteF3mehMTK8mb1UjgW8zNLyVvY=
X-Google-Smtp-Source: ABdhPJy50hbHOa3y2DKe6Or27YiCa4YtWsWK174IjD/tQRYnK0TV4Rm00v8UX30ityPh9vdPyvEuEGUdMYBcj5MBEYs=
X-Received: by 2002:a02:9109:: with SMTP id a9mr6011524jag.93.1626214139855;
 Tue, 13 Jul 2021 15:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
 <20210702212603.26465-4-niteesh.gs@gmail.com>
 <CAFn=p-Zu2Sycq8o0mNb0pKq2hiN5ctiQgVr-cKA_VUq0A-x_xA@mail.gmail.com>
In-Reply-To: <CAFn=p-Zu2Sycq8o0mNb0pKq2hiN5ctiQgVr-cKA_VUq0A-x_xA@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Wed, 14 Jul 2021 03:38:33 +0530
Message-ID: <CAN6ztm8C54JudUWTH+7byg7qGkM5u6eEgRWxjxvy0KFgnyK75Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] python/aqmp-tui: Add AQMP TUI draft
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000022893c05c7087c39"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd35.google.com
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
Cc: Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000022893c05c7087c39
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 8:50 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Fri, Jul 2, 2021 at 5:26 PM G S Niteesh Babu <niteesh.gs@gmail.com>
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
>>  python/qemu/aqmp/aqmp_tui.py | 246 +++++++++++++++++++++++++++++++++++
>>  python/setup.cfg             |  16 ++-
>>  2 files changed, 261 insertions(+), 1 deletion(-)
>>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>>
>> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
>> new file mode 100644
>> index 0000000000..8e9e8ac8ff
>> --- /dev/null
>> +++ b/python/qemu/aqmp/aqmp_tui.py
>> @@ -0,0 +1,246 @@
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
>> +import signal
>> +
>> +import urwid
>> +import urwid_readline
>> +
>> +from .protocol import ConnectError
>> +from .qmp_protocol import QMP, ExecInterruptedError, ExecuteError
>> +from .util import create_task, pretty_traceback
>> +
>> +
>> +UPDATE_MSG = 'UPDATE_MSG'
>>
> +
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
>> +        self.history = HistoryBox(master)
>> +        self.body = urwid.Pile([('weight', 80, self.history),
>> +                                ('weight', 10, self.editor_widget)])
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
>> +class App(QMP):
>> +    def __init__(self, address):
>> +        urwid.register_signal(self.__class__, UPDATE_MSG)
>>
>
> Do we really need a custom signal? It looks like Urwid has some "default"
> ones... are they not sufficient? I suppose the idea here is that the
> 'UPDATE_MSG' signal means that we've updated the history list, so we need
> to re-render.
>
AFAIK urwid has default signals only for inbuilt widgets like Button, Edit,
and a few more. For eg the button class has a 'click' signal which we can
connect to and is emitted on a button click. I had again gone through the
document to check if there are any default one that we can use here. But I
couldn't find any.
And yes we use UPDATE_MSG to notify the history list widget of a new
message.

If not, you may use type(self) here which looks just a little cleaner.
>
Fixed.

>
>
>> +        self.window = Window(self)
>> +        self.address = address
>> +        self.aloop = asyncio.get_event_loop()
>>
>
> I would recommend delaying calling get_event_loop() until run(), just so
> that all of the loop management stuff is handled in one place. That way,
> the loop isn't "fixed" until we call run().
>
Fixed.

>
>
>> +        self.loop = None
>> +        super().__init__()
>> +
>> +        # Gracefully handle SIGTERM and SIGINT signals
>> +        cancel_signals = [signal.SIGTERM, signal.SIGINT]
>> +        for sig in cancel_signals:
>> +            self.aloop.add_signal_handler(sig, self.kill_app)
>>
>
> If you agree with the above comment, this needs to move into run() as well.
>
Fixed.

>
>
>> +
>> +    def _cb_outbound(self, msg):
>> +        urwid.emit_signal(self, UPDATE_MSG, "<-- " + str(msg))
>> +        return msg
>> +
>> +    def _cb_inbound(self, msg):
>> +        urwid.emit_signal(self, UPDATE_MSG, "--> " + str(msg))
>> +        return msg
>> +
>> +    async def wait_for_events(self):
>> +        async for event in self.events:
>> +            self.handle_event(event)
>> +
>> +    async def _send_to_server(self, msg):
>> +        # TODO: Handle more validation errors (eg: ValueError)
>> +        try:
>> +            response = await self._raw(bytes(msg, 'utf-8'))
>> +            logging.info('Response: %s %s', response, type(response))
>>
>
> You could log the responses in the inbound hook instead.
>
I'd also use self.logger.debug instead of logging.info(...) so that you
> re-use the same logger instance.
>
Fixed.

>
>
>> +        except ExecuteError:
>> +            logging.info('Error response from server for msg: %s', msg)
>>
>
> self.logger.info() here.
>
Fixed

>
>
>> +        except ExecInterruptedError:
>> +            logging.info('Error server disconnected before reply')
>>
>
> And same here.
>
>
>> +            # FIXME: Handle this better
>>
>
> What ideas do you have for handling this better? What's wrong with it
> right now?
>
We can initiate a reconnect here and maybe add this request to a pending
list and
prompt the user for a reissue automatically after reconnecting.

>
>
>> +            # Show the disconnected message in the history window
>> +            urwid.emit_signal(self, UPDATE_MSG,
>> +                              '{"error": "Server disconnected before
>> reply"}')
>> +            self.window.footer.set_text("Server disconnected")
>> +        except Exception as err:
>> +            logging.info('Exception from _send_to_server: %s', str(err))
>>
>
> use self.logger.error here, since it's an unhandled error.
>
Fixed.

> +            raise err
>> +
>> +    def cb_send_to_server(self, msg):
>> +        create_task(self._send_to_server(msg))
>> +
>>
>
> I wish we didn't have to create tasks for this, but I suppose bridging
> asyncio and Urwid is just simply not very pretty. One thing to keep in mind
> is that when you create a task without a handle like this (i.e. you aren't
> saving the 'task' value anywhere), if that task exits with an Exception, it
> will cause Python to emit that "Unhandled Exception" warning that you see
> ... but only once the program otherwise ends. What will end up happening in
> practice is that the task will die without showing you the Exception.
>
> You might want to find a way to make Python crash a little more
> aggressively when an unhandled exception happens in a task, or otherwise
> make sure that ERROR level logging messages are visible directly in the TUI
> history pane, so that we can see te errors when they happen.
>
Though discussed in IRC. Putting it here so that others can also see.
We are OK to create tasks with one-shot actions because the urwid loop
takes care for handling the exceptions and crashing the App.
This relieves us from the pain of manually handling the task exceptions.

>
>
>> +    def unhandled_input(self, key):
>> +        if key == 'esc':
>> +            self.kill_app()
>> +
>> +    def kill_app(self):
>> +        # TODO: Work on the disconnect logic
>> +        create_task(self._kill_app())
>> +
>>
>
> Yes, the next thing I'd like to see here is reconnection logic -- I made a
> little prototype in some code I gave you, but it probably needs to be
> touched up. I recall that my version would attempt to reconnect infinitely
> whenever the app was disconnected, regardless of what happened to cause the
> disconnection. What we likely want is only to reconnect on certain kinds of
> errors -- ConnectionResetError is likely a good candidate, but other kinds
> of problems are likely ones we want to STAY disconnected when encountering.
>
> We also probably want some logic like num_retries, and retry_delay.
>
As you mentioned our primary goal is to have a proper base. I'll work on
this feature once we are done reviewing this base.

>
>
>> +    async def _kill_app(self):
>> +        # It is ok to call disconnect even in disconnect state
>> +        await self.disconnect()
>>
>
> Be aware that this raises Exceptions if the connection terminated
> ungracefully, i.e. the server hung up before we were expecting it. You
> might want to handle it (and do something related to connection retry
> management) first -- there are at least a few erorrs here that wouldn't be
> too strange to run into.
>
> I worry that when you hit 'esc' instead of ctrl^C, you'll see different
> behavior here -- because ctrl+C creates a task, if this raises an exception
> here, I think that we won't exit -- we'll get another unhandled exception
> that won't show up until the app exits. I'm not confident in this, but I
> think you should confirm that exiting both ways works exactly like you
> think it does.
>
Fixed.

>
>
>> +        logging.info('disconnect finished, Exiting app')
>>
>
> self.logger.debug
>
Fixed.

>
>
>> +        raise urwid.ExitMainLoop()
>> +
>> +    def handle_event(self, event):
>> +        if event['event'] == 'SHUTDOWN':
>> +            self.window.footer.set_text('Server shutdown')
>> +
>>
>
> A bit spartan as an event handler, but it serves its purpose as a
> demonstration for the proof of concept.
>
> It'd be nice to have the footer show a [VM: {state}] status where the
> state maps 1:1 with qapi/run-state.json's @RunState enumeration. I made a
> quick hack that you saw, but it wasn't strictly correct.
>
Sure will add in future revisions.

>
>
>> +    async def connect_server(self):
>> +        try:
>> +            await self.connect(self.address)
>> +            self.window.footer.set_text("Connected to {:s}".format(
>> +                f"{self.address[0]}:{self.address[1]}"
>> +                if isinstance(self.address, tuple)
>> +                else self.address
>> +            ))
>> +        except ConnectError as err:
>> +            logging.debug('Cannot connect to server %s', str(err))
>> +            self.window.footer.set_text('Server shutdown')
>>
>
> Like in other places, I wonder what happens if we have an unhandled
> exception here, because this is running in a task.
>
Fixed.

>
>
+
>> +    def run(self):
>> +        self.aloop.set_debug(True)
>>
>
> Add a debug argument to run() and default it to False, and add a --debug
> flag to the argparser that turns this on conditionally instead.
>
Fixed.

> +        event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
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
>> +            logging.error('%s\n%s\n', str(err), pretty_traceback())
>> +            raise err
>> +
>> +
>> +def main():
>> +    parser = argparse.ArgumentParser(description='AQMP TUI')
>> +    parser.add_argument('-a', '--address', metavar='IP:PORT',
>> required=True,
>> +                        help='Address of the QMP server', dest='address')
>> +    parser.add_argument('--log', help='Address of the QMP server',
>> +                        dest='log_file')
>> +    args = parser.parse_args()
>> +
>> +    logging.basicConfig(filename=args.log_file, level=logging.DEBUG)
>> +
>> +    address = args.address.split(':')
>> +    address[1] = int(address[1])
>> +
>> +    App(tuple(address)).run()
>>
>
> I would take the address as a positional argument instead of with the
> '--address' flag to mimic how qmp-shell works.
>
Fixed

>
>>
>> +
>> +
>> +if __name__ == '__main__':
>> +    main()  # type: ignore
>> diff --git a/python/setup.cfg b/python/setup.cfg
>> index c62803bffc..c6d38451eb 100644
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
>>
>
> Just keep in mind that we'll need to remove these particular ignores. The
> rest can stay.
>
Yup!

>
>
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
> Looking good so far, let's focus on managing the connection state and
> making sure that Exceptions raised from task contexts are handled properly.
> I still need to look more deeply into the classes below App, but I wanted
> to give you your overdue feedback. Thank you for your patience!
>
Thanks for your feedback :)

>
> --js
>

--00000000000022893c05c7087c39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 8, 2021 at 8:50 AM John Snow &lt;<a hre=
f=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, Jul 2, 2021 at 5:26 PM G S Niteesh Babu =
&lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.gs@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Added a draft of AQMP TUI.<br>
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
=C2=A0python/qemu/aqmp/aqmp_tui.py | 246 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 16 ++-<br>
=C2=A02 files changed, 261 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br>
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py<br=
>
new file mode 100644<br>
index 0000000000..8e9e8ac8ff<br>
--- /dev/null<br>
+++ b/python/qemu/aqmp/aqmp_tui.py<br>
@@ -0,0 +1,246 @@<br>
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
+import signal<br>
+<br>
+import urwid<br>
+import urwid_readline<br>
+<br>
+from .protocol import ConnectError<br>
+from .qmp_protocol import QMP, ExecInterruptedError, ExecuteError<br>
+from .util import create_task, pretty_traceback<br>
+<br>
+<br>
+UPDATE_MSG =3D &#39;UPDATE_MSG&#39;<br></blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
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
or)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history =3D HistoryBox(master)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.body =3D urwid.Pile([(&#39;weight&#39;, 8=
0, self.history),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;weight&#39;, 10, self.editor_w=
idget)])<br>
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
+class App(QMP):<br>
+=C2=A0 =C2=A0 def __init__(self, address):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.register_signal(self.__class__, UPDATE_M=
SG)<br></blockquote><div><br></div><div>Do we really need a custom signal? =
It looks like Urwid has some &quot;default&quot; ones... are they not suffi=
cient? I suppose the idea here is that the &#39;UPDATE_MSG&#39; signal mean=
s that we&#39;ve updated the history list, so we need to re-render.</div></=
div></div></blockquote><div class=3D"gmail_default" style=3D"font-size:smal=
l">AFAIK urwid has default signals only for inbuilt widgets like Button, Ed=
it, and a few more. For eg the button class has a &#39;click&#39; signal wh=
ich we can connect to and is emitted on a button click. I had again gone th=
rough the document to check if there are any default one that we can use he=
re. But I couldn&#39;t find any.</div><div class=3D"gmail_default" style=3D=
"font-size:small">And yes we use UPDATE_MSG to notify the history list widg=
et of a new message.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div>If not, you may use type(self) her=
e which looks just a little cleaner.<br></div></div></div></blockquote><div=
><span class=3D"gmail_default" style=3D"font-size:small">Fixed.</span>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window =3D Window(self)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.address =3D address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop =3D asyncio.get_event_loop()<br></b=
lockquote><div><br></div><div>I would recommend delaying calling get_event_=
loop() until run(), just so that all of the loop management stuff is handle=
d in one place. That way, the loop isn&#39;t &quot;fixed&quot; until we cal=
l run().<br></div></div></div></blockquote><div><span class=3D"gmail_defaul=
t" style=3D"font-size:small">Fixed.</span>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><d=
iv></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.loop =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Gracefully handle SIGTERM and SIGINT signals=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cancel_signals =3D [signal.SIGTERM, signal.SIG=
INT]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for sig in cancel_signals:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop.add_signal_handler(si=
g, self.kill_app)<br></blockquote><div><br></div><div>If you agree with the=
 above comment, this needs to move into run() as well.<br></div></div></div=
></blockquote><div><span class=3D"gmail_default" style=3D"font-size:small">=
Fixed.</span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 def _cb_outbound(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.emit_signal(self, UPDATE_MSG, &quot;&lt;=
-- &quot; + str(msg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg<br>
+<br>
+=C2=A0 =C2=A0 def _cb_inbound(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.emit_signal(self, UPDATE_MSG, &quot;--&g=
t; &quot; + str(msg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg<br>
+<br>
+=C2=A0 =C2=A0 async def wait_for_events(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 async for event in self.events:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.handle_event(event)<br>
+<br>
+=C2=A0 =C2=A0 async def _send_to_server(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: Handle more validation errors (eg: Val=
ueError)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 response =3D await self._raw(byt=
es(msg, &#39;utf-8&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Response: %s %s&=
#39;, response, type(response))<br></blockquote><div><br></div><div>You cou=
ld log the responses in the inbound hook instead.</div></div></div></blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><div>I&#39;d also use self.logger.debug instead of =
<a href=3D"http://logging.info" target=3D"_blank">logging.info</a>(...) so =
that you re-use the same logger instance.<br></div></div></div></blockquote=
><div><span class=3D"gmail_default" style=3D"font-size:small"></span><span =
class=3D"gmail_default">Fixed.</span>=C2=A0<span class=3D"gmail_default"></=
span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExecuteError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Error response f=
rom server for msg: %s&#39;, msg)<br></blockquote><div><br></div><div><a hr=
ef=3D"http://self.logger.info" target=3D"_blank">self.logger.info</a>() her=
e.<br></div></div></div></blockquote><div><span class=3D"gmail_default" sty=
le=3D"font-size:small">Fixed</span>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExecInterruptedError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Error server dis=
connected before reply&#39;)<br></blockquote><div><br></div><div>And same h=
ere.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: Handle this better<br><=
/blockquote><div><br></div><div>What ideas do you have for handling this be=
tter? What&#39;s wrong with it right now?<br></div></div></div></blockquote=
><div><span class=3D"gmail_default" style=3D"font-size:small">We can initia=
te a reconnect here and maybe add this request to a pending list and</span>=
</div><div><span class=3D"gmail_default" style=3D"font-size:small">prompt t=
he user for a reissue automatically after reconnecting.</span></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Exception from _=
send_to_server: %s&#39;, str(err))<br></blockquote><div><br></div><div>use =
self.logger.error here, since it&#39;s an unhandled error.</div></div></div=
></blockquote><div><span class=3D"gmail_default" style=3D"font-size:small">=
Fixed.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br>
+<br>
+=C2=A0 =C2=A0 def cb_send_to_server(self, msg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self._send_to_server(msg))<br>
+<br></blockquote><div><br></div><div>I wish we didn&#39;t have to create t=
asks for this, but I suppose bridging asyncio and Urwid is just simply not =
very pretty. One thing to keep in mind is that when you create a task witho=
ut a handle like this (i.e. you aren&#39;t saving the &#39;task&#39; value =
anywhere), if that task exits with an Exception, it will cause Python to em=
it that &quot;Unhandled Exception&quot; warning that you see ... but only o=
nce the program otherwise ends. What will end up happening in practice is t=
hat the task will die without showing you the Exception.</div><div><br></di=
v><div>You might want to find a way to make Python crash a little more aggr=
essively when an unhandled exception happens in a task, or otherwise make s=
ure that ERROR level logging messages are visible directly in the TUI histo=
ry pane, so that we can see te errors when they happen.<br></div></div></di=
v></blockquote><div><span class=3D"gmail_default" style=3D"font-size:small"=
>Though discussed in IRC. Putting it here so that others can also see.</spa=
n></div><div><span class=3D"gmail_default">We are OK to create tasks with o=
ne-shot actions because the urwid loop takes care for handling the exceptio=
ns and crashing the App.</span><br></div><div><span class=3D"gmail_default"=
>This relieves us from the pain of manually handling the task exceptions.</=
span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div class=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 def unhandled_input(self, key):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if key =3D=3D &#39;esc&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.kill_app()<br>
+<br>
+=C2=A0 =C2=A0 def kill_app(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: Work on the disconnect logic<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self._kill_app())<br>
+<br></blockquote><div><br></div><div>Yes, the next thing I&#39;d like to s=
ee here is reconnection logic -- I made a little prototype in some code I g=
ave you, but it probably needs to be touched up. I recall that my version w=
ould attempt to reconnect infinitely whenever the app was disconnected, reg=
ardless of what happened to cause the disconnection. What we likely want is=
 only to reconnect on certain kinds of errors -- ConnectionResetError is li=
kely a good candidate, but other kinds of problems are likely ones we want =
to STAY disconnected when encountering.</div><div><br></div><div>We also pr=
obably want some logic like num_retries, and retry_delay.<br></div></div></=
div></blockquote><div><div class=3D"gmail_default" style=3D"font-size:small=
">As you mentioned our primary goal is to have a proper base. I&#39;ll work=
 on this feature once we are done reviewing this base.</div></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gma=
il_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
+=C2=A0 =C2=A0 async def _kill_app(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # It is ok to call disconnect even in disconne=
ct state<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.disconnect()<br></blockquote><div><=
br></div><div>Be aware that this raises Exceptions if the connection termin=
ated ungracefully, i.e. the server hung up before we were expecting it. You=
 might want to handle it (and do something related to connection retry mana=
gement) first -- there are at least a few erorrs here that wouldn&#39;t be =
too strange to run into.</div><div><br></div><div>I worry that when you hit=
 &#39;esc&#39; instead of ctrl^C, you&#39;ll see different behavior here --=
 because ctrl+C creates a task, if this raises an exception here, I think t=
hat we won&#39;t exit -- we&#39;ll get another unhandled exception that won=
&#39;t show up until the app exits. I&#39;m not confident in this, but I th=
ink you should confirm that exiting both ways works exactly like you think =
it does.<br></div></div></div></blockquote><div><span class=3D"gmail_defaul=
t" style=3D"font-size:small">Fixed.</span>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><d=
iv></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" rel=3D"norefer=
rer" target=3D"_blank">logging.info</a>(&#39;disconnect finished, Exiting a=
pp&#39;)<br></blockquote><div><br></div><div>self.logger.debug<br></div></d=
iv></div></blockquote><div><span class=3D"gmail_default" style=3D"font-size=
:small">Fixed.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise urwid.ExitMainLoop()<br>
+<br>
+=C2=A0 =C2=A0 def handle_event(self, event):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if event[&#39;event&#39;] =3D=3D &#39;SHUTDOWN=
&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window.footer.set_text(&#39=
;Server shutdown&#39;)<br>
+ <br></blockquote><div><br></div><div>A bit spartan as an event handler, b=
ut it serves its purpose as a demonstration for the proof of concept.</div>=
<div><br></div><div>It&#39;d be nice to have the footer show a [VM: {state}=
] status where the state maps 1:1 with qapi/run-state.json&#39;s @RunState =
enumeration. I made a quick hack that you saw, but it wasn&#39;t strictly c=
orrect.<br></div></div></div></blockquote><div><span class=3D"gmail_default=
" style=3D"font-size:small">Sure will add in future revisions.</span></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.debug(&#39;Cannot connec=
t to server %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window.footer.set_text(&#39=
;Server shutdown&#39;)<br></blockquote><div><br></div><div>Like in other pl=
aces, I wonder what happens if we have an unhandled exception here, because=
 this is running in a task.</div></div></div></blockquote><div><span class=
=3D"gmail_default" style=3D"font-size:small">Fixed.</span>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_quote"><div>=C2=A0</div></div></div></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 def run(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop.set_debug(True)<br></blockquote><di=
v><br></div><div>Add a debug argument to run() and default it to False, and=
 add a --debug flag to the argparser that turns this on conditionally inste=
ad.</div></div></div></blockquote><div><span class=3D"gmail_default" style=
=3D"font-size:small">Fixed.</span>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.error(&#39;%s\n%s\n&#39;=
, str(err), pretty_traceback())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br>
+<br>
+<br>
+def main():<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(description=3D&#39;AQMP T=
UI&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;-a&#39;, &#39;--address&#39;, metav=
ar=3D&#39;IP:PORT&#39;, required=3DTrue,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&#39;Address of the QMP server&#39;, dest=3D&#39;address&=
#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--log&#39;, help=3D&#39;Address of =
the QMP server&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dest=3D&#39;log_file&#39;)<br>
+=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
+<br>
+=C2=A0 =C2=A0 logging.basicConfig(filename=3Dargs.log_file, level=3Dloggin=
g.DEBUG)<br>
+<br>
+=C2=A0 =C2=A0 address =3D args.address.split(&#39;:&#39;)<br>
+=C2=A0 =C2=A0 address[1] =3D int(address[1])<br>
+<br>
+=C2=A0 =C2=A0 App(tuple(address)).run()<br></blockquote><div><br></div><di=
v>I would take the address as a positional argument instead of with the &#3=
9;--address&#39; flag to mimic how qmp-shell works.</div></div></div></bloc=
kquote><div><span class=3D"gmail_default" style=3D"font-size:small">Fixed</=
span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote">=C2=A0<blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
+<br>
+<br>
+if __name__ =3D=3D &#39;__main__&#39;:<br>
+=C2=A0 =C2=A0 main()=C2=A0 # type: ignore<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index c62803bffc..c6d38451eb 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -81,8 +81,22 @@ namespace_packages =3D True<br>
=C2=A0# fusepy has no type stubs:<br>
=C2=A0allow_subclassing_any =3D True<br>
<br>
+[mypy-qemu.aqmp.aqmp_tui]<br>
+disallow_untyped_defs =3D False<br>
+disallow_incomplete_defs =3D False<br>
+check_untyped_defs =3D False<br></blockquote><div><br></div><div>Just keep=
 in mind that we&#39;ll need to remove these particular ignores. The rest c=
an stay.<br></div></div></div></blockquote><div><span class=3D"gmail_defaul=
t" style=3D"font-size:small">Yup!</span>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
<br></blockquote><div><br></div><div>Looking good so far, let&#39;s focus o=
n managing the connection state and making sure that Exceptions raised from=
 task contexts are handled properly. I still need to look more deeply into =
the classes below App, but I wanted to give you your overdue feedback. Than=
k you for your patience!</div></div></div></blockquote><div><span class=3D"=
gmail_default" style=3D"font-size:small">Thanks for your feedback :)</span>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><div><br></div><div>--js<br></div></div></di=
v>
</blockquote></div></div>

--00000000000022893c05c7087c39--

