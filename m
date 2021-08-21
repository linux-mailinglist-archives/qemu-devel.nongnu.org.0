Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83453F3C65
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 22:09:44 +0200 (CEST)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHXJH-0008KZ-Pp
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 16:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHXFt-0003dv-Qb
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHXFn-0000Oy-7i
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629576365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wJNJ1vG+fIdWMCC5RYDbZY6Yjx32JEi4etpCtoqcvb0=;
 b=a0HX9Zd0dErGMOIfO4PWtZPqutqSFOkBXG5lQWNDJW5CT3QPa38SH3VcbuwPthWPXHReSy
 Jpz9VLNddeAlu78qL8SXWe9a2KwFNB+QkFkpQxrkVN7Uq2Q+0+yKi7mJBijBlR/6MR/mrW
 qkDkI7WlNEDnj5ueo0THF0egkIJCozI=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120--s7gGydqMNyBzRDaPTFYMg-1; Sat, 21 Aug 2021 16:06:02 -0400
X-MC-Unique: -s7gGydqMNyBzRDaPTFYMg-1
Received: by mail-ot1-f72.google.com with SMTP id
 c21-20020a0568301af500b0051af51e2a5bso3936844otd.10
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 13:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJNJ1vG+fIdWMCC5RYDbZY6Yjx32JEi4etpCtoqcvb0=;
 b=oTolroZEllhCjX4p9xLPpZbyl8JJL83d+kI5ERrWeDW5gYZuNS0IOpNJGZR5Bmz7Vs
 2L+Lcuvpj7xkjXjss2MQRzKyHsRnto4VhT3kTKmv4vwC6SNuK79EqLgUBkp0rU+l/vma
 uk8gzWLd4Vcw3BcHW+0dTNFT8M4na6BU/bZ6qISg7nDgJNY7WB8vw3gtdUl76ENH9A5S
 kPI8VcPytYwVaNzxOxSfj92WshwNx0OkxQHJIqVMnVdPLjnfT88/ODlm64qyszZZ9A0s
 xIbGRaeNLf6iFRXABnjwFs08u/zHUhX+c2y+L7d4aWnLwA8P4bfIIyAN+v1n3U6SGYBW
 Y07A==
X-Gm-Message-State: AOAM533XVz89subUkvEOYpMHt+0/EQInm5CX4i4mbJeFZ4+zRXY7GUIW
 AKGuWMqxZLRAgTyOFbxWh/+xz/y6EcfA+efPdm12ziNdrQklkv0NYtsCSHBIMtIyfhKccM6Butq
 F8cQxH9uLnI9v86NEV/TQo2wP6rxDnoM=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr21975602otb.323.1629576361381; 
 Sat, 21 Aug 2021 13:06:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHwu+sXBBoZkE4QmHi6aw3s2rfGRfA/lCKXIkksv29lElahMDbHZhOLEDeZjP9fIpJNL5mx3oh270TXCUFFAo=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr21975579otb.323.1629576361159; 
 Sat, 21 Aug 2021 13:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
 <20210819173831.23515-4-niteesh.gs@gmail.com>
In-Reply-To: <20210819173831.23515-4-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Sat, 21 Aug 2021 16:05:50 -0400
Message-ID: <CAFn=p-ZK2spGmcNwgbWjAbj4kb_T9uu8nwCE3=-P_fi+onhc5w@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] python/aqmp-tui: Add AQMP TUI draft
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000024437f05ca175066"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--00000000000024437f05ca175066
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021 at 1:39 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Added a draft of AQMP TUI.
>
> Implements the follwing basic features:
> 1) Command transmission/reception.
> 2) Shows events asynchronously.
> 3) Shows server status in the bottom status bar.
>
> Also added type annotations and necessary pylint,
> mypy configurations
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> ---
>  python/qemu/aqmp/aqmp_tui.py | 566 +++++++++++++++++++++++++++++++++++
>  python/setup.cfg             |  15 +-
>  2 files changed, 579 insertions(+), 2 deletions(-)
>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>
> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
> new file mode 100644
> index 0000000000..12c9c4162a
> --- /dev/null
> +++ b/python/qemu/aqmp/aqmp_tui.py
> @@ -0,0 +1,566 @@
> +# Copyright (c) 2021
> +#
> +# Authors:
> +#  Niteesh Babu G S <niteesh.gs@gmail.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +"""
> +AQMP TUI
> +
> +AQMP TUI is an asynchronous interface built on top the of the AQMP
> library.
> +It is the successor of QMP-shell and is bought-in as a replacement for it.
> +
> +Example Usage: aqmp-tui <SOCKET | TCP IP:PORT>
> +Full Usage: aqmp-tui --help
> +"""
> +
> +import argparse
> +import asyncio
> +import logging
> +from logging import Handler, LogRecord
> +import signal
> +from typing import (
> +    List,
> +    Optional,
> +    Tuple,
> +    Type,
> +    Union,
> +    cast,
> +)
> +
> +import urwid
> +import urwid_readline
> +
> +from ..qmp import QEMUMonitorProtocol, QMPBadPortError
> +from .message import DeserializationError, Message, UnexpectedTypeError
> +from .protocol import ConnectError
> +from .qmp_client import ExecInterruptedError, QMPClient
> +from .util import create_task, pretty_traceback
> +
> +
> +# The name of the signal that is used to update the history list
> +UPDATE_MSG: str = 'UPDATE_MSG'
> +
> +
> +def format_json(msg: str) -> str:
> +    """
> +    Formats given multi-line JSON message into a single-line message.
> +    Converting into single line is more asthetically pleasing when looking
> +    along with error messages.
> +
> +    Eg:
> +    Input:
> +          [ 1,
> +            true,
> +            3 ]
> +    The above input is not a valid QMP message and produces the following
> error
> +    "QMP message is not a JSON object."
> +    When displaying this in TUI in multiline mode we get
> +
> +        [ 1,
> +          true,
> +          3 ]: QMP message is not a JSON object.
> +
> +    whereas in singleline mode we get the following
> +
> +        [1, true, 3]: QMP message is not a JSON object.
> +
> +    The single line mode is more asthetically pleasing.
> +
> +    :param msg:
> +        The message to formatted into single line.
> +
> +    :return: Formatted singleline message.
> +
> +    NOTE: We cannot use the JSON module here because it is only capable of
> +    format valid JSON messages. But here the goal is to also format
> invalid
> +    JSON messages.
> +    """
> +    msg = msg.replace('\n', '')
> +    words = msg.split(' ')
> +    words = [word for word in words if word != '']
> +    return ' '.join(words)
> +
> +
> +def has_tui_handler(logger: logging.Logger,
> +                    handler_type: Type[Handler]) -> bool:
> +    """
> +    The Logger class has no interface to check if a certain type of
> handler is
> +    installed or not. So we provide an interface to do so.
> +
> +    :param logger:
> +        Logger object
> +    :param handler_type:
> +        The type of the handler to be checked.
> +
> +    :return: returns True if handler of type `handler_type` is installed
> else
> +             False.
> +    """
> +    handlers = logger.handlers
> +    for handler in handlers:
> +        if isinstance(handler, handler_type):
> +            return True
> +    return False
> +
> +
> +class App(QMPClient):
> +    """
> +    Implements the AQMP TUI.
> +
> +    Initializes the widgets and starts the urwid event loop.
> +    """
> +    def __init__(self, address: Union[str, Tuple[str, int]]) -> None:
> +        """
> +        Initializes the TUI.
> +
> +        :param address:
> +            Address of the server to connect to.
> +        """
> +        urwid.register_signal(type(self), UPDATE_MSG)
> +        self.window = Window(self)
> +        self.address = address
> +        self.aloop: Optional[asyncio.AbstractEventLoop] = None
> +        super().__init__()
> +
> +    def add_to_history(self, msg: str, level: Optional[str] = None) ->
> None:
> +        """
> +        Appends the msg to the history list.
> +
> +        :param msg:
> +            The raw message to be appended in string type.
> +        """
> +        urwid.emit_signal(self, UPDATE_MSG, msg, level)
> +
> +    def _cb_outbound(self, msg: Message) -> Message:
> +        """
> +        Callback: outbound message hook.
> +
> +        Appends the outgoing messages to the history box.
> +
> +        :param msg: raw outbound message.
> +        :return: final outbound message.
> +        """
> +        str_msg = str(msg)
> +
> +        if not has_tui_handler(logging.getLogger(), TUILogHandler):
> +            logging.debug('Request: %s', str_msg)
> +        self.add_to_history('<-- ' + str_msg)
> +        return msg
> +
> +    def _cb_inbound(self, msg: Message) -> Message:
> +        """
> +        Callback: outbound message hook.
> +
> +        Appends the incoming messages to the history box.
> +
> +        :param msg: raw inbound message.
> +        :return: final inbound message.
> +        """
> +        str_msg = str(msg)
> +
> +        if not has_tui_handler(logging.getLogger(), TUILogHandler):
> +            logging.debug('Request: %s', str_msg)
> +        self.add_to_history('--> ' + str_msg)
> +        return msg
> +
>

Starting here: ...


> +    def handle_event(self, event: Message) -> None:
> +        """
> +        Handles the event.
> +
> +        :param event:
> +            The event to be handled.
> +        """
> +        # TODO: Consider all states present in qapi/run-state.json
> +        if event['event'] == 'SHUTDOWN':
> +            self._set_status('[Server Shutdown]')
> +
> +    async def wait_for_events(self) -> None:
> +        """
> +        This coroutine continously waits for events and dispatches them.
> +        """
> +        async for event in self.events:
> +            self.handle_event(event)
> +
>

... until here, we can remove these from this series, because we don't use
them for anything by the end of this series. We can re-add them once that
"TODO" is done.


> +    async def _send_to_server(self, msg: Message) -> None:
> +        """
> +        This coroutine sends the message to the server.
> +        The message has to be pre-validated.
> +
> +        :param msg:
> +            Pre-validated message to be to sent to the server.
> +
> +        :raise Exception: When an unhandled exception is caught.
> +        """
> +        try:
> +            await self._raw(msg, assign_id='id' not in msg)
> +        except ExecInterruptedError:
> +            logging.info('Error server disconnected before reply')
> +            self.add_to_history('Server disconnected before reply',
> 'ERROR')
> +            self._set_status("[Server Disconnected]")
> +        except Exception as err:
> +            logging.error('Exception from _send_to_server: %s', str(err))
> +            raise err
> +
> +    def cb_send_to_server(self, raw_msg: str) -> None:
> +        """
> +        Validates and sends the message to the server.
> +        The raw string message is first converted into a Message object
> +        and is then sent to the server.
> +
> +        :param raw_msg:
> +            The raw string message to be sent to the server.
> +
> +        :raise Exception: When an unhandled exception is caught.
> +        """
> +        try:
> +            raw_msg = format_json(raw_msg)
> +            msg = Message(bytes(raw_msg, encoding='utf-8'))
> +            create_task(self._send_to_server(msg))
> +        except (ValueError, TypeError) as err:
> +            logging.info('Invalid message: %s', str(err))
> +            self.add_to_history(f'{raw_msg}: {err}')
> +        except (DeserializationError, UnexpectedTypeError) as err:
> +            logging.info('Invalid message: %s', err.error_message)
> +            self.add_to_history(f'{raw_msg}: {err.error_message}')
> +
> +    def unhandled_input(self, key: str) -> None:
> +        """
> +        Handle's keys which haven't been handled by the child widgets.
> +
> +        :param key:
> +            Unhandled key
> +        """
> +        if key == 'esc':
> +            self.kill_app()
> +
> +    def kill_app(self) -> None:
> +        """
> +        Initiates killing of app. A bridge between asynchronous and
> synchronous
> +        code.
> +        """
> +        create_task(self._kill_app())
> +
> +    async def _kill_app(self) -> None:
> +        """
> +        This coroutine initiates the actual disconnect process and calls
> +        urwid.ExitMainLoop() to kill the TUI.
> +
> +        :raise Exception: When an unhandled exception is caught.
> +        """
> +        # It is ok to call disconnect even in disconnect state
> +        try:
> +            await self.disconnect()
> +            logging.debug('Disconnect finished. Exiting app')
> +        except EOFError:
> +            # We receive an EOF during disconnect, ignore that
> +            pass
> +        except Exception as err:
> +            logging.info('_kill_app: %s', str(err))
> +            # Let the app crash after providing a proper stack trace
> +            raise err
> +        raise urwid.ExitMainLoop()
> +
> +    def _set_status(self, msg: str) -> None:
> +        """
> +        Sets the message as the status.
> +
> +        :param msg:
> +            The message to be displayed in the status bar.
> +        """
> +        self.window.footer.set_text(msg)
> +
> +    def _get_formatted_address(self) -> str:
> +        """
> +        Returns a formatted version of the server's address.
> +
> +        :return: formatted address
> +        """
> +        if isinstance(self.address, tuple):
> +            host, port = self.address
> +            addr = f'{host}:{port}'
> +        else:
> +            addr = f'{self.address}'
> +        return addr
> +
> +    async def connect_server(self) -> None:
> +        """
> +        Initiates a connection to the server at address `self.address`
> +        and in case of a failure, sets the status to the respective error.
> +        """
> +        try:
> +            await self.connect(self.address)
> +            addr = self._get_formatted_address()
> +            self._set_status(f'Connected to {addr}')
> +        except ConnectError as err:
> +            logging.info('connect_server: ConnectError %s', str(err))
> +            self._set_status(f'[ConnectError: {err.error_message}]')
> +
> +    def run(self, debug: bool = False) -> None:
> +        """
> +        Starts the long running co-routines and the urwid event loop.
> +
> +        :param debug:
> +            Enables/Disables asyncio event loop debugging
> +        """
> +        self.aloop = asyncio.get_event_loop()
> +        self.aloop.set_debug(debug)
> +
> +        # Gracefully handle SIGTERM and SIGINT signals
> +        cancel_signals = [signal.SIGTERM, signal.SIGINT]
> +        for sig in cancel_signals:
> +            self.aloop.add_signal_handler(sig, self.kill_app)
> +
> +        event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
> +        main_loop = urwid.MainLoop(urwid.AttrMap(self.window,
> 'background'),
> +                                   unhandled_input=self.unhandled_input,
> +                                   handle_mouse=True,
> +                                   event_loop=event_loop)
> +
> +        create_task(self.wait_for_events(), self.aloop)
>

This can be removed since it isn't used for anything by the end of this
series. We can re-add the event watcher when the status updater is actually
completed.


> +        create_task(self.connect_server(), self.aloop)
> +        try:
> +            main_loop.run()
> +        except Exception as err:
> +            logging.error('%s\n%s\n', str(err), pretty_traceback())
> +            raise err
> +
> +
> +class StatusBar(urwid.Text):
> +    """
> +    A simple statusbar modelled using the Text widget. The status can be
> +    set using the set_text function. All text set is aligned to right.
> +    """
> +    def __init__(self, text: str = ''):
> +        super().__init__(text, align='right')
> +
> +
> +class Editor(urwid_readline.ReadlineEdit):
> +    """
> +    A simple editor modelled using the urwid_readline.ReadlineEdit widget.
> +    Mimcs GNU readline shortcuts and provides history support.
> +
> +    The readline shortcuts can be found below:
> +    https://github.com/rr-/urwid_readline#features
> +
> +    Along with the readline features, this editor also has support for
> +    history. Pressing the 'up' arrow key with empty message box, lists the
> +    previous message inplace.
> +
> +    Currently there is no support to save the history to a file. The
> history of
> +    previous commands is lost on exit.
> +    """
> +    def __init__(self, master: App) -> None:
> +        """
> +        Initializes the editor widget
> +
> +        :param master: Reference to the TUI object.
> +        """
> +        super().__init__(caption='> ', multiline=True)
> +        self.master = master
> +        self.history: List[str] = []
> +        self.last_index: int = -1
> +        self.show_history: bool = False
> +
> +    def keypress(self, size: Tuple[int, int], key: str) -> Optional[str]:
> +        """
> +        Handles the keypress on this widget.
> +
> +        :param size:
> +            The current size of the widget.
> +        :param key:
> +            The key to be handled.
> +
> +        :return: Unhandled key if any.
> +        """
> +        # TODO: Add some logic for down key and clean up logic if
> possible.
>

What logic needs to be added here? Can this comment be made more explicit?
What kind of cleanup do we need to do here, still?
(Is now the right time to do that cleanup, or not?)

If you want to leave the TODO in, then edit setup.cfg and add the exemption
for it.


> +        # Returning None means the key has been handled by this widget
> +        # which otherwise is propogated to the parent widget to be
> +        # handled
> +        msg = self.get_edit_text()
> +        if key == 'up' and not msg:
> +            # Show the history when 'up arrow' is pressed with no input
> text.
> +            # NOTE: The show_history logic is necessary because in
> 'multiline'
> +            # mode (which we use) 'up arrow' is used to move between
> lines.
> +            self.show_history = True
> +            last_msg = self.history[self.last_index] if self.history else
> ''
> +            self.set_edit_text(last_msg)
> +            self.edit_pos = len(last_msg)
> +            self.last_index += 1
> +        elif key == 'up' and self.show_history:
> +            if self.last_index < len(self.history):
> +                self.set_edit_text(self.history[self.last_index])
> +                self.edit_pos = len(self.history[self.last_index])
> +                self.last_index += 1
> +        elif key == 'meta enter':
> +            # When using multiline, enter inserts a new line into the
> editor
> +            # send the input to the server on alt + enter
> +            self.master.cb_send_to_server(msg)
> +            self.history.insert(0, msg)
> +            self.set_edit_text('')
> +            self.last_index = 0
> +            self.show_history = False
> +        else:
> +            self.show_history = False
> +            self.last_index = 0
> +            return cast(Optional[str], super().keypress(size, key))
> +        return None
> +
> +
> +class EditorWidget(urwid.Filler):
> +    """
> +    The Editor is a flow widget and has to wrapped inside a box widget.
> +    This class wraps the Editor inside filler widget.
> +    """
> +    def __init__(self, master: App) -> None:
> +        super().__init__(Editor(master), valign='top')
> +
> +
> +class HistoryBox(urwid.ListBox):
> +    """
> +    This widget is modelled using the ListBox widget, contains the list of
> +    all messages both QMP messages and log messsages to be shown in the
> TUI.
> +
> +    The messages are urwid.Text widgets. On every append of a message, the
> +    focus is shifted to the last appended message.
> +    """
> +    def __init__(self, master: App) -> None:
> +        """
> +        Initializes the historybox widget
> +
> +        :param master: Reference to the TUI object.
> +        """
> +        self.master = master
> +        self.history = urwid.SimpleFocusListWalker([])
> +        super().__init__(self.history)
> +
> +    def add_to_history(self, history: str) -> None:
> +        """
> +        Appends a message to the list and set the focus to the last
> appended
> +        message.
> +
> +        :param history:
> +            The history item(message/event) to be appended to the list.
> +        """
> +        self.history.append(urwid.Text(history))
> +        if self.history:
> +            self.history.set_focus(len(self.history) - 1)
> +
> +
> +class HistoryWindow(urwid.Frame):
> +    """
> +    This window composes the HistoryBox and EditorWidget in a horizontal
> split.
> +    By default the first focus is given to the history box.
> +    """
> +    def __init__(self, master: App) -> None:
> +        """
> +        Initializes this widget and its child widgets.
> +
> +        :param master: Reference to the TUI object.
> +        """
> +        self.master = master
> +        self.editor_widget = EditorWidget(master)
> +        self.editor = urwid.LineBox(self.editor_widget)
> +        self.history = HistoryBox(master)
> +        self.body = urwid.Pile([('weight', 80, self.history),
> +                                ('weight', 20, self.editor)])
> +        super().__init__(self.body)
> +        urwid.connect_signal(self.master, UPDATE_MSG,
> self.cb_add_to_history)
> +
> +    def cb_add_to_history(self, msg: str, level: Optional[str] = None) ->
> None:
> +        """
> +        Appends a message to the history box
> +
> +        :param msg:
> +            The message to be appended to the history box.
> +        """
> +        if level:
> +            msg = f'[{level}]: {msg}'
> +        self.history.add_to_history(msg)
> +
> +
> +class Window(urwid.Frame):
> +    """
> +    This window is the top most widget of the TUI and will contain other
> +    windows. Each window is responsible for displaying a specific
> +    functionality.
> +    For eg: The history window is responsible for showing the history of
> +    messages and the editor.
> +    """
> +    def __init__(self, master: App) -> None:
> +        """
> +        Initializes this widget and its child windows.
> +
> +        :param master: Reference to the TUI object.
> +        """
> +        self.master = master
> +        footer = StatusBar()
> +        body = HistoryWindow(master)
> +        super().__init__(body, footer=footer)
> +
> +
> +class TUILogHandler(Handler):
> +    """
> +    This handler routes all the log messages to the TUI screen.
> +    It is installed to the root logger to so that the log message from all
> +    libraries begin used is routed to the screen.
> +    """
> +    def __init__(self, tui: App) -> None:
> +        """
> +        Initializes the handler class.
> +
> +        :param tui:
> +            Reference to the TUI object.
> +        """
> +        super().__init__()
> +        self.tui = tui
> +
> +    def emit(self, record: LogRecord) -> None:
> +        """
> +        Emits a record to the TUI screen.
> +
> +        Appends the log message to the TUI screen
> +        """
> +        level = record.levelname
> +        msg = record.getMessage()
> +        self.tui.add_to_history(msg, level)
> +
> +
> +def main() -> None:
> +    """
> +    Driver of the whole script, parses arguments, initialize the TUI and
> +    the logger.
> +    """
> +    parser = argparse.ArgumentParser(description='AQMP TUI')
> +    parser.add_argument('qmp_server', help='Address of the QMP server. '
> +                        'Format <UNIX socket path | TCP addr:port>')
> +    parser.add_argument('--log-file', help='The Log file name')
> +    parser.add_argument('--log-level', default='WARNING',
> +                        help='Log level
> <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
> +    parser.add_argument('--asyncio-debug', action='store_true',
> +                        help='Enable debug mode for asyncio loop. '
> +                        'Generates lot of output, makes TUI unusable when
> '
> +                        'logs are logged in the TUI. '
> +                        'Use only when logging to a file.')
> +    args = parser.parse_args()
> +
> +    try:
> +        address = QEMUMonitorProtocol.parse_address(args.qmp_server)
> +    except QMPBadPortError as err:
> +        parser.error(str(err))
> +
> +    app = App(address)
> +
> +    root_logger = logging.getLogger()
> +    root_logger.setLevel(logging.getLevelName(args.log_level))
> +
> +    if args.log_file:
> +        root_logger.addHandler(logging.FileHandler(args.log_file))
> +    else:
> +        root_logger.addHandler(TUILogHandler(app))
> +
> +    app.run(args.asyncio_debug)
> +
> +
> +if __name__ == '__main__':
> +    main()
> diff --git a/python/setup.cfg b/python/setup.cfg
> index a0ed3279d8..1ff2b907a2 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -81,8 +81,19 @@ namespace_packages = True
>  # fusepy has no type stubs:
>  allow_subclassing_any = True
>
> +[mypy-qemu.aqmp.aqmp_tui]
> +# urwid and urwid_readline have no type stubs:
> +allow_subclassing_any = True
> +
> +# The following missing import directives are because these libraries do
> not
> +# provide type stubs. Allow them on an as-needed basis for mypy.
>  [mypy-fuse]
> -# fusepy has no type stubs:
> +ignore_missing_imports = True
> +
> +[mypy-urwid]
> +ignore_missing_imports = True
> +
> +[mypy-urwid_readline]
>  ignore_missing_imports = True
>
>  [pylint.messages control]
> @@ -97,7 +108,7 @@ ignore_missing_imports = True
>  # --disable=W".
>  disable=too-many-function-args,  # mypy handles this with less false
> positives.
>          no-member,  # mypy also handles this better.
> -        missing-docstring, # FIXME
> +        # missing-docstring, # FIXME
>

^ Once patch #1 is removed, this stuff should also go.


>          fixme, # FIXME
>
>  [pylint.basic]
> --
> 2.17.1
>

--00000000000024437f05ca175066
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 19, 2021 at 1:39 PM G S Niteesh Babu &lt;<a hr=
ef=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com</a>&gt; wrote:<br><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Added a draft of AQMP TUI.<br>
<br>
Implements the follwing basic features:<br>
1) Command transmission/reception.<br>
2) Shows events asynchronously.<br>
3) Shows server status in the bottom status bar.<br>
<br>
Also added type annotations and necessary pylint,<br>
mypy configurations<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 566 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 15 +-<br>
=C2=A02 files changed, 579 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br>
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py<br=
>
new file mode 100644<br>
index 0000000000..12c9c4162a<br>
--- /dev/null<br>
+++ b/python/qemu/aqmp/aqmp_tui.py<br>
@@ -0,0 +1,566 @@<br>
+# Copyright (c) 2021<br>
+#<br>
+# Authors:<br>
+#=C2=A0 Niteesh Babu G S &lt;<a href=3D"mailto:niteesh.gs@gmail.com" targe=
t=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
+#<br>
+# This work is licensed under the terms of the GNU GPL, version 2 or<br>
+# later.=C2=A0 See the COPYING file in the top-level directory.<br>
+&quot;&quot;&quot;<br>
+AQMP TUI<br>
+<br>
+AQMP TUI is an asynchronous interface built on top the of the AQMP library=
.<br>
+It is the successor of QMP-shell and is bought-in as a replacement for it.=
<br>
+<br>
+Example Usage: aqmp-tui &lt;SOCKET | TCP IP:PORT&gt;<br>
+Full Usage: aqmp-tui --help<br>
+&quot;&quot;&quot;<br>
+<br>
+import argparse<br>
+import asyncio<br>
+import logging<br>
+from logging import Handler, LogRecord<br>
+import signal<br>
+from typing import (<br>
+=C2=A0 =C2=A0 List,<br>
+=C2=A0 =C2=A0 Optional,<br>
+=C2=A0 =C2=A0 Tuple,<br>
+=C2=A0 =C2=A0 Type,<br>
+=C2=A0 =C2=A0 Union,<br>
+=C2=A0 =C2=A0 cast,<br>
+)<br>
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
+# The name of the signal that is used to update the history list<br>
+UPDATE_MSG: str =3D &#39;UPDATE_MSG&#39;<br>
+<br>
+<br>
+def format_json(msg: str) -&gt; str:<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Formats given multi-line JSON message into a single-line mes=
sage.<br>
+=C2=A0 =C2=A0 Converting into single line is more asthetically pleasing wh=
en looking<br>
+=C2=A0 =C2=A0 along with error messages.<br>
+<br>
+=C2=A0 =C2=A0 Eg:<br>
+=C2=A0 =C2=A0 Input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 ]<br>
+=C2=A0 =C2=A0 The above input is not a valid QMP message and produces the =
following error<br>
+=C2=A0 =C2=A0 &quot;QMP message is not a JSON object.&quot;<br>
+=C2=A0 =C2=A0 When displaying this in TUI in multiline mode we get<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 ]: QMP message is not a JSON object.<=
br>
+<br>
+=C2=A0 =C2=A0 whereas in singleline mode we get the following<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [1, true, 3]: QMP message is not a JSON object=
.<br>
+<br>
+=C2=A0 =C2=A0 The single line mode is more asthetically pleasing.<br>
+<br>
+=C2=A0 =C2=A0 :param msg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The message to formatted into single line.<br>
+<br>
+=C2=A0 =C2=A0 :return: Formatted singleline message.<br>
+<br>
+=C2=A0 =C2=A0 NOTE: We cannot use the JSON module here because it is only =
capable of<br>
+=C2=A0 =C2=A0 format valid JSON messages. But here the goal is to also for=
mat invalid<br>
+=C2=A0 =C2=A0 JSON messages.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 msg =3D msg.replace(&#39;\n&#39;, &#39;&#39;)<br>
+=C2=A0 =C2=A0 words =3D msg.split(&#39; &#39;)<br>
+=C2=A0 =C2=A0 words =3D [word for word in words if word !=3D &#39;&#39;]<b=
r>
+=C2=A0 =C2=A0 return &#39; &#39;.join(words)<br>
+<br>
+<br>
+def has_tui_handler(logger: logging.Logger,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hand=
ler_type: Type[Handler]) -&gt; bool:<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 The Logger class has no interface to check if a certain type=
 of handler is<br>
+=C2=A0 =C2=A0 installed or not. So we provide an interface to do so.<br>
+<br>
+=C2=A0 =C2=A0 :param logger:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Logger object<br>
+=C2=A0 =C2=A0 :param handler_type:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The type of the handler to be checked.<br>
+<br>
+=C2=A0 =C2=A0 :return: returns True if handler of type `handler_type` is i=
nstalled else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0False.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 handlers =3D logger.handlers<br>
+=C2=A0 =C2=A0 for handler in handlers:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(handler, handler_type):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
+=C2=A0 =C2=A0 return False<br>
+<br>
+<br>
+class App(QMPClient):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Implements the AQMP TUI.<br>
+<br>
+=C2=A0 =C2=A0 Initializes the widgets and starts the urwid event loop.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, address: Union[str, Tuple[str, int]]) -&g=
t; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes the TUI.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param address:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Address of the server to connect=
 to.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.register_signal(type(self), UPDATE_MSG)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window =3D Window(self)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.address =3D address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop: Optional[asyncio.AbstractEventLoop=
] =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__()<br>
+<br>
+=C2=A0 =C2=A0 def add_to_history(self, msg: str, level: Optional[str] =3D =
None) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Appends the msg to the history list.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param msg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The raw message to be appended i=
n string type.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.emit_signal(self, UPDATE_MSG, msg, level=
)<br>
+<br>
+=C2=A0 =C2=A0 def _cb_outbound(self, msg: Message) -&gt; Message:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Callback: outbound message hook.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Appends the outgoing messages to the history b=
ox.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param msg: raw outbound message.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :return: final outbound message.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 str_msg =3D str(msg)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not has_tui_handler(logging.getLogger(), TU=
ILogHandler):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.debug(&#39;Request: %s&#=
39;, str_msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(&#39;&lt;-- &#39; + str_ms=
g)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg<br>
+<br>
+=C2=A0 =C2=A0 def _cb_inbound(self, msg: Message) -&gt; Message:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Callback: outbound message hook.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Appends the incoming messages to the history b=
ox.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param msg: raw inbound message.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :return: final inbound message.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 str_msg =3D str(msg)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not has_tui_handler(logging.getLogger(), TU=
ILogHandler):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.debug(&#39;Request: %s&#=
39;, str_msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(&#39;--&gt; &#39; + str_ms=
g)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msg<br>
+<br></blockquote><div><br></div><div>Starting here: ...<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 def handle_event(self, event: Message) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Handles the event.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param event:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The event to be handled.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: Consider all states present in qapi/ru=
n-state.json<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if event[&#39;event&#39;] =3D=3D &#39;SHUTDOWN=
&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(&#39;[Server Sh=
utdown]&#39;)<br>
+<br>
+=C2=A0 =C2=A0 async def wait_for_events(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This coroutine continously waits for events an=
d dispatches them.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 async for event in self.events:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.handle_event(event)<br>
+<br></blockquote><div><br></div><div>... until here, we can remove these f=
rom this series, because we don&#39;t use them for anything by the end of t=
his series. We can re-add them once that &quot;TODO&quot; is done.<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 async def _send_to_server(self, msg: Message) -&gt; None:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This coroutine sends the message to the server=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The message has to be pre-validated.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param msg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Pre-validated message to be to s=
ent to the server.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise Exception: When an unhandled exception =
is caught.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._raw(msg, assign_id=
=3D&#39;id&#39; not in msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExecInterruptedError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Error server dis=
connected before reply&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(&#39;Server =
disconnected before reply&#39;, &#39;ERROR&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(&quot;[Server D=
isconnected]&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.error(&#39;Exception fro=
m _send_to_server: %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br>
+<br>
+=C2=A0 =C2=A0 def cb_send_to_server(self, raw_msg: str) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Validates and sends the message to the server.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 The raw string message is first converted into=
 a Message object<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 and is then sent to the server.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param raw_msg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The raw string message to be sen=
t to the server.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise Exception: When an unhandled exception =
is caught.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_msg =3D format_json(raw_msg)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D Message(bytes(raw_msg, e=
ncoding=3D&#39;utf-8&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self._send_to_server=
(msg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (ValueError, TypeError) as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Invalid message:=
 %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(f&#39;{raw_m=
sg}: {err}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (DeserializationError, UnexpectedTypeEr=
ror) as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Invalid message:=
 %s&#39;, err.error_message)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(f&#39;{raw_m=
sg}: {err.error_message}&#39;)<br>
+<br>
+=C2=A0 =C2=A0 def unhandled_input(self, key: str) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Handle&#39;s keys which haven&#39;t been handl=
ed by the child widgets.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param key:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Unhandled key<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if key =3D=3D &#39;esc&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.kill_app()<br>
+<br>
+=C2=A0 =C2=A0 def kill_app(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initiates killing of app. A bridge between asy=
nchronous and synchronous<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 code.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self._kill_app())<br>
+<br>
+=C2=A0 =C2=A0 async def _kill_app(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This coroutine initiates the actual disconnect=
 process and calls<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.ExitMainLoop() to kill the TUI.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :raise Exception: When an unhandled exception =
is caught.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # It is ok to call disconnect even in disconne=
ct state<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.disconnect()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.debug(&#39;Disconnect fi=
nished. Exiting app&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except EOFError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We receive an EOF during disco=
nnect, ignore that<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;_kill_app: %s&#3=
9;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Let the app crash after provid=
ing a proper stack trace<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise urwid.ExitMainLoop()<br>
+<br>
+=C2=A0 =C2=A0 def _set_status(self, msg: str) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sets the message as the status.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param msg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The message to be displayed in t=
he status bar.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window.footer.set_text(msg)<br>
+<br>
+=C2=A0 =C2=A0 def _get_formatted_address(self) -&gt; str:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Returns a formatted version of the server&#39;=
s address.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :return: formatted address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(self.address, tuple):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host, port =3D self.address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D f&#39;{host}:{port}&#39=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D f&#39;{self.address}&#3=
9;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return addr<br>
+<br>
+=C2=A0 =C2=A0 async def connect_server(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initiates a connection to the server at addres=
s `self.address`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 and in case of a failure, sets the status to t=
he respective error.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.connect(self.address)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D self._get_formatted_add=
ress()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(f&#39;Connected=
 to {addr}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ConnectError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;connect_server: =
ConnectError %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(f&#39;[ConnectE=
rror: {err.error_message}]&#39;)<br>
+<br>
+=C2=A0 =C2=A0 def run(self, debug: bool =3D False) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Starts the long running co-routines and the ur=
wid event loop.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param debug:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enables/Disables asyncio event l=
oop debugging<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
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
)<br></blockquote><div><br></div><div>This can be removed since it isn&#39;=
t used for anything by the end of this series. We can re-add the event watc=
her when the status updater is actually completed.<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self.connect_server(), self.aloop)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 main_loop.run()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.error(&#39;%s\n%s\n&#39;=
, str(err), pretty_traceback())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br>
+<br>
+<br>
+class StatusBar(urwid.Text):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 A simple statusbar modelled using the Text widget. The statu=
s can be<br>
+=C2=A0 =C2=A0 set using the set_text function. All text set is aligned to =
right.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, text: str =3D &#39;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(text, align=3D&#39;right&#39;=
)<br>
+<br>
+<br>
+class Editor(urwid_readline.ReadlineEdit):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 A simple editor modelled using the urwid_readline.ReadlineEd=
it widget.<br>
+=C2=A0 =C2=A0 Mimcs GNU readline shortcuts and provides history support.<b=
r>
+<br>
+=C2=A0 =C2=A0 The readline shortcuts can be found below:<br>
+=C2=A0 =C2=A0 <a href=3D"https://github.com/rr-/urwid_readline#features" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/rr-/urwid_readline#f=
eatures</a><br>
+<br>
+=C2=A0 =C2=A0 Along with the readline features, this editor also has suppo=
rt for<br>
+=C2=A0 =C2=A0 history. Pressing the &#39;up&#39; arrow key with empty mess=
age box, lists the<br>
+=C2=A0 =C2=A0 previous message inplace.<br>
+<br>
+=C2=A0 =C2=A0 Currently there is no support to save the history to a file.=
 The history of<br>
+=C2=A0 =C2=A0 previous commands is lost on exit.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, master: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes the editor widget<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param master: Reference to the TUI object.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(caption=3D&#39;&gt; &#39;, mu=
ltiline=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master =3D master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history: List[str] =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index: int =3D -1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_history: bool =3D False<br>
+<br>
+=C2=A0 =C2=A0 def keypress(self, size: Tuple[int, int], key: str) -&gt; Op=
tional[str]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Handles the keypress on this widget.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param size:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The current size of the widget.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param key:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The key to be handled.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :return: Unhandled key if any.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: Add some logic for down key and clean =
up logic if possible.<br></blockquote><div><br></div><div>What logic needs =
to be added here? Can this comment be made more explicit? What kind of clea=
nup do we need to do here, still?</div><div>(Is now the right time to do th=
at cleanup, or not?)<br><br></div><div>If you want to leave the TODO in, th=
en edit setup.cfg and add the exemption for it.<br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cast(Optional[str], super=
().keypress(size, key))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+<br>
+class EditorWidget(urwid.Filler):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 The Editor is a flow widget and has to wrapped inside a box =
widget.<br>
+=C2=A0 =C2=A0 This class wraps the Editor inside filler widget.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, master: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(Editor(master), valign=3D&#39=
;top&#39;)<br>
+<br>
+<br>
+class HistoryBox(urwid.ListBox):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 This widget is modelled using the ListBox widget, contains t=
he list of<br>
+=C2=A0 =C2=A0 all messages both QMP messages and log messsages to be shown=
 in the TUI.<br>
+<br>
+=C2=A0 =C2=A0 The messages are urwid.Text widgets. On every append of a me=
ssage, the<br>
+=C2=A0 =C2=A0 focus is shifted to the last appended message.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, master: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes the historybox widget<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param master: Reference to the TUI object.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master =3D master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history =3D urwid.SimpleFocusListWalker([=
])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(self.history)<br>
+<br>
+=C2=A0 =C2=A0 def add_to_history(self, history: str) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Appends a message to the list and set the focu=
s to the last appended<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 message.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param history:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The history item(message/event) =
to be appended to the list.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.append(urwid.Text(history))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.history:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.set_focus(len(self.=
history) - 1)<br>
+<br>
+<br>
+class HistoryWindow(urwid.Frame):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 This window composes the HistoryBox and EditorWidget in a ho=
rizontal split.<br>
+=C2=A0 =C2=A0 By default the first focus is given to the history box.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, master: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes this widget and its child widgets.=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param master: Reference to the TUI object.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
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
+=C2=A0 =C2=A0 def cb_add_to_history(self, msg: str, level: Optional[str] =
=3D None) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Appends a message to the history box<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param msg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The message to be appended to th=
e history box.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if level:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D f&#39;[{level}]: {msg}&#=
39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.add_to_history(msg)<br>
+<br>
+<br>
+class Window(urwid.Frame):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 This window is the top most widget of the TUI and will conta=
in other<br>
+=C2=A0 =C2=A0 windows. Each window is responsible for displaying a specifi=
c<br>
+=C2=A0 =C2=A0 functionality.<br>
+=C2=A0 =C2=A0 For eg: The history window is responsible for showing the hi=
story of<br>
+=C2=A0 =C2=A0 messages and the editor.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, master: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes this widget and its child windows.=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param master: Reference to the TUI object.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master =3D master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 footer =3D StatusBar()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 body =3D HistoryWindow(master)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(body, footer=3Dfooter)<br>
+<br>
+<br>
+class TUILogHandler(Handler):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 This handler routes all the log messages to the TUI screen.<=
br>
+=C2=A0 =C2=A0 It is installed to the root logger to so that the log messag=
e from all<br>
+=C2=A0 =C2=A0 libraries begin used is routed to the screen.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, tui: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes the handler class.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param tui:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Reference to the TUI object.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tui =3D tui<br>
+<br>
+=C2=A0 =C2=A0 def emit(self, record: LogRecord) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Emits a record to the TUI screen.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Appends the log message to the TUI screen<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 level =3D record.levelname<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D record.getMessage()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tui.add_to_history(msg, level)<br>
+<br>
+<br>
+def main() -&gt; None:<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Driver of the whole script, parses arguments, initialize the=
 TUI and<br>
+=C2=A0 =C2=A0 the logger.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(description=3D&#39;AQMP T=
UI&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;qmp_server&#39;, help=3D&#39;Addres=
s of the QMP server. &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;Format &lt;UNIX socket path | TCP addr:port&gt;&#39;)<br>
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
=A0 =C2=A0 help=3D&#39;Enable debug mode for asyncio loop. &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;Generates lot of output, makes TUI unusable when &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;logs are logged in the TUI. &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;Use only when logging to a file.&#39;)<br>
+=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 address =3D QEMUMonitorProtocol.parse_address(=
args.qmp_server)<br>
+=C2=A0 =C2=A0 except QMPBadPortError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.error(str(err))<br>
+<br>
+=C2=A0 =C2=A0 app =3D App(address)<br>
+<br>
+=C2=A0 =C2=A0 root_logger =3D logging.getLogger()<br>
+=C2=A0 =C2=A0 root_logger.setLevel(logging.getLevelName(args.log_level))<b=
r>
+<br>
+=C2=A0 =C2=A0 if args.log_file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 root_logger.addHandler(logging.FileHandler(arg=
s.log_file))<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 root_logger.addHandler(TUILogHandler(app))<br>
+<br>
+=C2=A0 =C2=A0 app.run(args.asyncio_debug)<br>
+<br>
+<br>
+if __name__ =3D=3D &#39;__main__&#39;:<br>
+=C2=A0 =C2=A0 main()<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index a0ed3279d8..1ff2b907a2 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -81,8 +81,19 @@ namespace_packages =3D True<br>
=C2=A0# fusepy has no type stubs:<br>
=C2=A0allow_subclassing_any =3D True<br>
<br>
+[mypy-qemu.aqmp.aqmp_tui]<br>
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
@@ -97,7 +108,7 @@ ignore_missing_imports =3D True<br>
=C2=A0# --disable=3DW&quot;.<br>
=C2=A0disable=3Dtoo-many-function-args,=C2=A0 # mypy handles this with less=
 false positives.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no-member,=C2=A0 # mypy also handles this=
 better.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 missing-docstring, # FIXME<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # missing-docstring, # FIXME<br></blockquote><=
div><br></div><div>^ Once patch #1 is removed, this stuff should also go.<b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fixme, # FIXME<br>
<br>
=C2=A0[pylint.basic]<br>
-- <br>
2.17.1<br></blockquote><div>=C2=A0<br></div></div></div>

--00000000000024437f05ca175066--


