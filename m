Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012393F5C0E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:26:06 +0200 (CEST)
Received: from localhost ([::1]:43250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITd6-0008Ry-W9
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mITTF-0002yM-4H
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 06:15:53 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mITT9-0005Gh-MY
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 06:15:52 -0400
Received: by mail-pf1-x42f.google.com with SMTP id j187so17908667pfg.4
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7UvIXVMcBwGm8hyPIPo7SBC3DYbAb/hEKY6Qru3u/zU=;
 b=E8jmPMVdtBM709o7at4oMkvQgG/c3CT1h+NEZSiKI95atMB5JSBwp4CwIRTVmswWoy
 BhWHRAQufPCKyAo1Map9VyfXYRrIyHQhXsYvfqJOItQY2QTkzEz1S07jWxAY6eSjgVYM
 ntHANrt8bRd4f8GFua6FpbqDLtsKrnQW1ush9L7w4bnjyVKqvqIBOkFWjK0HSeEWl1PU
 bskfXM8lMri/wpPndIjAvm12JWnDE3MCqYqqPOy3i6JnVmo0RECGupborBXP3ypKg3iq
 PPlj3aylIGwrmsq8QF6hcOBhKwgBzRl97sG4fFqh2yI2lQor64lrd6fWq8qCtWhHg3X0
 DRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7UvIXVMcBwGm8hyPIPo7SBC3DYbAb/hEKY6Qru3u/zU=;
 b=t4HvGzOWxTiSk4clYBX1KcxamVEx8diE/zt3/8eb8dXWuUE9pi+Wv+EF92mG52ehox
 B5J6O2dQIIIF8FmbPsaEsDiOHzQgKUtEihJAR3Lt69O5mM5qIn9Wzn9CJ3IuryhWWiop
 qr7melKw4NGZ5sMCbYKdh5q20EkIvn38dvcKeDHUfZL8RBnHTjuOO73NFtXv6YxhOomZ
 6/s6pXLzUsytiYPp9/do0hX0EG3qI3QWZODpDPzux457XaC5iPJxmyixfH53R673yVHf
 PFtiDE8Rdzl6GMGy0b36oQyfkQUrCOP4slOTYgaXdTCzS1ywr9EO4dwpH85ghwoBvcv0
 UJhQ==
X-Gm-Message-State: AOAM531qA3OhQFaXldLF/OHqds/QoJtFCig6mqJ2d+pJc5MyDDNACmCx
 /bggYTGUMssXmKUU5PrXIy/tk45YgqwvuYfJnto=
X-Google-Smtp-Source: ABdhPJybgnIK9Rr4ZzNFHKq+TMTC10v1Lu/0bmYKSr+Fsqs4y9zPAsy3F83LNcJi/63eogj6Wta8z/caB3h70Sb67AA=
X-Received: by 2002:a63:cf41:: with SMTP id b1mr1043479pgj.407.1629800146133; 
 Tue, 24 Aug 2021 03:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210823162938.32757-1-niteesh.gs@gmail.com>
 <20210823162938.32757-3-niteesh.gs@gmail.com>
 <CAFn=p-a=JSGxQ4L+SEsjAZccj5SqGw2Zp_UcUO-6oNg3+WTNXw@mail.gmail.com>
In-Reply-To: <CAFn=p-a=JSGxQ4L+SEsjAZccj5SqGw2Zp_UcUO-6oNg3+WTNXw@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Tue, 24 Aug 2021 15:45:19 +0530
Message-ID: <CAN6ztm9X7iSuJg2VrgeFDBDmFAtG-orKC9n0K8wS9SDN4_WhrQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] python/aqmp-tui: Add AQMP TUI
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c3e70205ca4b6a00"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x42f.google.com
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

--000000000000c3e70205ca4b6a00
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 24, 2021 at 12:30 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Mon, Aug 23, 2021 at 12:31 PM G S Niteesh Babu <niteesh.gs@gmail.com>
> wrote:
>
>> Added AQMP TUI.
>>
>> Implements the follwing basic features:
>> 1) Command transmission/reception.
>> 2) Shows events asynchronously.
>> 3) Shows server status in the bottom status bar.
>> 4) Automatic retries on disconnects and error conditions.
>>
>> Also added type annotations and necessary pylint/mypy configurations.
>>
>> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>> ---
>>  python/qemu/aqmp/aqmp_tui.py | 637 +++++++++++++++++++++++++++++++++++
>>  python/setup.cfg             |  13 +-
>>  2 files changed, 649 insertions(+), 1 deletion(-)
>>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>>
>> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
>> new file mode 100644
>> index 0000000000..d3180e38bf
>> --- /dev/null
>> +++ b/python/qemu/aqmp/aqmp_tui.py
>> @@ -0,0 +1,637 @@
>> +# Copyright (c) 2021
>> +#
>> +# Authors:
>> +#  Niteesh Babu G S <niteesh.gs@gmail.com>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +"""
>> +AQMP TUI
>> +
>> +AQMP TUI is an asynchronous interface built on top the of the AQMP
>> library.
>> +It is the successor of QMP-shell and is bought-in as a replacement for
>> it.
>> +
>> +Example Usage: aqmp-tui <SOCKET | TCP IP:PORT>
>> +Full Usage: aqmp-tui --help
>> +"""
>> +
>> +import argparse
>> +import asyncio
>> +import logging
>> +from logging import Handler, LogRecord
>> +import signal
>> +from typing import (
>> +    List,
>> +    Optional,
>> +    Tuple,
>> +    Type,
>> +    Union,
>> +    cast,
>> +)
>> +
>> +import urwid
>> +import urwid_readline
>> +
>> +from ..qmp import QEMUMonitorProtocol, QMPBadPortError
>> +from .error import ProtocolError
>> +from .message import DeserializationError, Message, UnexpectedTypeError
>> +from .protocol import ConnectError, Runstate
>> +from .qmp_client import ExecInterruptedError, QMPClient
>> +from .util import create_task, pretty_traceback
>> +
>> +
>> +# The name of the signal that is used to update the history list
>> +UPDATE_MSG: str = 'UPDATE_MSG'
>> +
>> +
>> +def format_json(msg: str) -> str:
>> +    """
>> +    Formats given multi-line JSON message into a single-line message.
>> +    Converting into single line is more asthetically pleasing when
>> looking
>> +    along with error messages.
>> +
>> +    Eg:
>> +    Input:
>> +          [ 1,
>> +            true,
>> +            3 ]
>> +    The above input is not a valid QMP message and produces the
>> following error
>> +    "QMP message is not a JSON object."
>> +    When displaying this in TUI in multiline mode we get
>> +
>> +        [ 1,
>> +          true,
>> +          3 ]: QMP message is not a JSON object.
>> +
>> +    whereas in singleline mode we get the following
>> +
>> +        [1, true, 3]: QMP message is not a JSON object.
>> +
>> +    The single line mode is more asthetically pleasing.
>> +
>> +    :param msg:
>> +        The message to formatted into single line.
>> +
>> +    :return: Formatted singleline message.
>> +
>> +    NOTE: We cannot use the JSON module here because it is only capable
>> of
>> +    format valid JSON messages. But here the goal is to also format
>> invalid
>> +    JSON messages.
>> +    """
>> +    msg = msg.replace('\n', '')
>> +    words = msg.split(' ')
>> +    words = [word for word in words if word != '']
>>
>
> try list(filter(None, words)) -- it's a little easier to read.
>
Thanks. Fixed.

>
>
>> +    return ' '.join(words)
>> +
>> +
>> +def has_tui_handler(logger: logging.Logger,
>> +                    handler_type: Type[Handler]) -> bool:
>>
>
> maybe has_handler_type(...), since you wrote something a bit more generic
> than just checking for the TUI handler.
>
Ahh yes. First I had hardcoded the TUILogHandler type but then decided to
make it more generic.

>
>
>> +    """
>> +    The Logger class has no interface to check if a certain type of
>> handler is
>> +    installed or not. So we provide an interface to do so.
>> +
>> +    :param logger:
>> +        Logger object
>> +    :param handler_type:
>> +        The type of the handler to be checked.
>> +
>> +    :return: returns True if handler of type `handler_type` is installed
>> else
>> +             False.
>>
>
> If you wanted to fit this on one line, the "else False" is implied and
> could be omitted.
>
Omitted

>
>
>> +    """
>> +    handlers = logger.handlers
>> +    for handler in handlers:
>>
>
> You could combine these lines if you wanted: for handler in
> logger.handlers: ...
>
Fixed.

>
>
>> +        if isinstance(handler, handler_type):
>> +            return True
>> +    return False
>> +
>> +
>> +class App(QMPClient):
>> +    """
>> +    Implements the AQMP TUI.
>> +
>> +    Initializes the widgets and starts the urwid event loop.
>> +    """
>> +    def __init__(self, address: Union[str, Tuple[str, int]],
>> num_retries: int,
>> +                 retry_delay: Optional[int]) -> None:
>> +        """
>> +        Initializes the TUI.
>> +
>> +        :param address:
>> +            Address of the server to connect to.
>> +        :param num_retries:
>> +            The number of times to retry before stopping to reconnect.
>> +        :param retry_delay:
>> +            The delay(sec) before each retry
>> +        """
>>
>
> Here and elsewhere, the init documentation can actually go into the class
> docstring. So you don't have to write stuff like "Initializes the TUI"
> everywhere. Take a look at how I do it in the rest of AQMP as a guide.
>
Changed everywhere.

>
>
>> +        urwid.register_signal(type(self), UPDATE_MSG)
>> +        self.window = Window(self)
>> +        self.address = address
>> +        self.aloop: Optional[asyncio.AbstractEventLoop] = None
>> +        self.num_retries = num_retries
>> +        self.retry_delay = retry_delay if retry_delay else 2
>> +        self.retry: bool = False
>> +        self.exiting: bool = False
>> +        super().__init__()
>> +
>> +    def add_to_history(self, msg: str, level: Optional[str] = None) ->
>> None:
>> +        """
>> +        Appends the msg to the history list.
>> +
>> +        :param msg:
>> +            The raw message to be appended in string type.
>> +        """
>> +        urwid.emit_signal(self, UPDATE_MSG, msg, level)
>> +
>> +    def _cb_outbound(self, msg: Message) -> Message:
>> +        """
>> +        Callback: outbound message hook.
>> +
>> +        Appends the outgoing messages to the history box.
>> +
>> +        :param msg: raw outbound message.
>> +        :return: final outbound message.
>> +        """
>> +        str_msg = str(msg)
>> +
>> +        if not has_tui_handler(logging.getLogger(), TUILogHandler):
>> +            logging.debug('Request: %s', str_msg)
>> +        self.add_to_history('<-- ' + str_msg)
>> +        return msg
>> +
>> +    def _cb_inbound(self, msg: Message) -> Message:
>> +        """
>> +        Callback: outbound message hook.
>> +
>> +        Appends the incoming messages to the history box.
>> +
>> +        :param msg: raw inbound message.
>> +        :return: final inbound message.
>> +        """
>> +        str_msg = str(msg)
>> +
>> +        if not has_tui_handler(logging.getLogger(), TUILogHandler):
>> +            logging.debug('Request: %s', str_msg)
>> +        self.add_to_history('--> ' + str_msg)
>> +        return msg
>> +
>> +    async def _send_to_server(self, msg: Message) -> None:
>> +        """
>> +        This coroutine sends the message to the server.
>> +        The message has to be pre-validated.
>> +
>> +        :param msg:
>> +            Pre-validated message to be to sent to the server.
>> +
>> +        :raise Exception: When an unhandled exception is caught.
>> +        """
>> +        try:
>> +            await self._raw(msg, assign_id='id' not in msg)
>> +        except ExecInterruptedError as err:
>> +            logging.info('Error server disconnected before reply %s',
>> str(err))
>> +            self.add_to_history('Server disconnected before reply',
>> 'ERROR')
>> +            await self.disconnect()
>>
>
> In this case, the connection manager will probably already have noticed
> that we were disconnected, so you can probably omit the call to disconnect
> here.
>
Omitted.

>
>
>> +        except Exception as err:
>> +            logging.error('Exception from _send_to_server: %s', str(err))
>> +            raise err
>> +
>> +    def cb_send_to_server(self, raw_msg: str) -> None:
>> +        """
>> +        Validates and sends the message to the server.
>> +        The raw string message is first converted into a Message object
>> +        and is then sent to the server.
>> +
>> +        :param raw_msg:
>> +            The raw string message to be sent to the server.
>> +
>> +        :raise Exception: When an unhandled exception is caught.
>> +        """
>> +        try:
>> +            raw_msg = format_json(raw_msg)
>>
>
> Technically you're processing the message -- just a little bit. I'd prefer
> to pass the raw input straight to Message(...) if we could.
>
Fixed.

>
>
>> +            msg = Message(bytes(raw_msg, encoding='utf-8'))
>> +            create_task(self._send_to_server(msg))
>> +        except (ValueError, TypeError) as err:
>> +            logging.info('Invalid message: %s', str(err))
>> +            self.add_to_history(f'{raw_msg}: {err}', 'ERROR')
>> +        except (DeserializationError, UnexpectedTypeError) as err:
>> +            logging.info('Invalid message: %s', err.error_message)
>> +            self.add_to_history(f'{raw_msg}: {err.error_message}',
>> 'ERROR')
>>
>
> I see what you wanted to do here. You'd like to show a nice error message
> even when the message isn't a valid QMP message, or even valid JSON.
>

> In the case of UnexpectedTypeError, we know it was valid JSON but not
> valid QMP -- we can still use the JSON library to format this message.
> In the case of DeserializationError, it wasn't valid JSON at all -- and if
> you want nice formatting, you need to get creative.
>
> You could probably apply your format_json() function only in the
> DeserializationError case -- that way it's only being used for a fairly
> specific purpose, and if it isn't quite so rigorously good at formatting
> JSON, it doesn't matter. You could name it format_malformed_input to
> suggest what it's used for a bit more clearly, perhaps?
>
I did a couple of more changes than what you have mentioned.
1) Removed ValueError and TypeError - since these are possible to occur
because we use the deserialization interface of the message class.
2) Refactored the format_json method to use the standard JSON module to
format the message incase of a valid JSON message and use the simple string
manipulation method incase of an invalid JSON message.


>
>> +
>> +    def unhandled_input(self, key: str) -> None:
>> +        """
>> +        Handle's keys which haven't been handled by the child widgets.
>> +
>> +        :param key:
>> +            Unhandled key
>> +        """
>> +        if key == 'esc':
>> +            self.kill_app()
>> +
>> +    def kill_app(self) -> None:
>> +        """
>> +        Initiates killing of app. A bridge between asynchronous and
>> synchronous
>> +        code.
>> +        """
>> +        create_task(self._kill_app())
>> +
>> +    async def _kill_app(self) -> None:
>> +        """
>> +        This coroutine initiates the actual disconnect process and calls
>> +        urwid.ExitMainLoop() to kill the TUI.
>> +
>> +        :raise Exception: When an unhandled exception is caught.
>> +        """
>> +        self.exiting = True
>> +        await self.disconnect()
>> +        logging.debug('Disconnect finished. Exiting app')
>> +        raise urwid.ExitMainLoop()
>> +
>> +    async def disconnect(self) -> None:
>> +        """
>> +        Overrides the disconnect method to handle the errors locally.
>> +        """
>> +        try:
>> +            await super().disconnect()
>> +            self.retry = False
>> +        except EOFError as err:
>> +            logging.info('disconnect: %s', str(err))
>> +            self.retry = True
>> +        except ProtocolError as err:
>> +            logging.info('disconnect: %s', str(err))
>> +            self.retry = False
>> +        except Exception as err:
>> +            logging.error('disconnect: Unhandled exception %s', str(err))
>> +            self.retry = False
>> +            raise err
>>
>
> What about for OSError problems, like ConnectionResetByPeer and so forth?
> You could probably rewrite this to be retry False by default, and then
> select the handful of cases where you know you want to retry.
>
Addressed both these comments.

>
>
>> +
>> +    def _set_status(self, msg: str) -> None:
>> +        """
>> +        Sets the message as the status.
>> +
>> +        :param msg:
>> +            The message to be displayed in the status bar.
>> +        """
>> +        self.window.footer.set_text(msg)
>> +
>> +    def _get_formatted_address(self) -> str:
>> +        """
>> +        Returns a formatted version of the server's address.
>> +
>> +        :return: formatted address
>> +        """
>> +        if isinstance(self.address, tuple):
>> +            host, port = self.address
>> +            addr = f'{host}:{port}'
>> +        else:
>> +            addr = f'{self.address}'
>> +        return addr
>> +
>> +    async def _initiate_connection(self) -> Optional[ConnectError]:
>> +        """
>> +        Tries connecting to a server a number of times with a delay
>> between
>> +        each try. If all retries failed then return the error faced
>> during
>> +        the last retry.
>> +
>> +        :return: Error faced during last retry.
>> +        """
>> +        current_retries = 0
>> +        err = None
>> +
>> +        # initial try
>> +        await self.connect_server()
>> +        while self.retry and current_retries < self.num_retries:
>> +            logging.info('Connection Failed, retrying in %d',
>> self.retry_delay)
>> +            status = f'[Retry #{current_retries} ({self.retry_delay}s)]'
>> +            self._set_status(status)
>> +
>> +            await asyncio.sleep(self.retry_delay)
>> +
>> +            err = await self.connect_server()
>> +            current_retries += 1
>> +        # If all retries failed report the last error
>> +        if err:
>> +            logging.info('All retries failed: %s', err)
>> +            return err
>> +        return None
>> +
>> +    async def manage_connection(self) -> None:
>> +        """
>> +        Manage the connection based on the current run state.
>> +
>> +        A reconnect is issued when the current state is IDLE and the
>> number
>> +        of retries is not exhausted.
>> +        A disconnect is issued when the current state is DISCONNECTING.
>> +        """
>> +        while not self.exiting:
>> +            if self.runstate == Runstate.IDLE:
>> +                err = await self._initiate_connection()
>> +                # If retry is still true then, we have exhausted all our
>> tries.
>> +                if err:
>> +                    self._set_status(f'[Error: {err.error_message}]')
>> +                else:
>> +                    addr = self._get_formatted_address()
>> +                    self._set_status(f'[Connected {addr}]')
>> +            elif self.runstate == Runstate.DISCONNECTING:
>> +                self._set_status('[Disconnected]')
>> +                await self.disconnect()
>> +                # check if a retry is needed
>> +                if self.runstate == Runstate.IDLE:
>> +                    continue
>> +            await self.runstate_changed()
>> +
>> +    async def connect_server(self) -> Optional[ConnectError]:
>> +        """
>> +        Initiates a connection to the server at address `self.address`
>> +        and in case of a failure, sets the status to the respective
>> error.
>> +        """
>> +        try:
>> +            await self.connect(self.address)
>> +            self.retry = False
>> +        except ConnectError as err:
>> +            logging.info('connect_server: ConnectError %s', str(err))
>> +            self.retry = True
>> +            return err
>> +        return None
>> +
>> +    def run(self, debug: bool = False) -> None:
>> +        """
>> +        Starts the long running co-routines and the urwid event loop.
>> +
>> +        :param debug:
>> +            Enables/Disables asyncio event loop debugging
>> +        """
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
>> +        create_task(self.manage_connection(), self.aloop)
>> +        try:
>> +            main_loop.run()
>> +        except Exception as err:
>> +            logging.error('%s\n%s\n', str(err), pretty_traceback())
>> +            raise err
>> +
>> +
>> +class StatusBar(urwid.Text):
>> +    """
>> +    A simple statusbar modelled using the Text widget. The status can be
>> +    set using the set_text function. All text set is aligned to right.
>> +    """
>> +    def __init__(self, text: str = ''):
>> +        super().__init__(text, align='right')
>> +
>> +
>> +class Editor(urwid_readline.ReadlineEdit):
>> +    """
>> +    A simple editor modelled using the urwid_readline.ReadlineEdit
>> widget.
>> +    Mimcs GNU readline shortcuts and provides history support.
>> +
>> +    The readline shortcuts can be found below:
>> +    https://github.com/rr-/urwid_readline#features
>> +
>> +    Along with the readline features, this editor also has support for
>> +    history. Pressing the 'up' arrow key with empty message box, lists
>> the
>> +    previous message inplace.
>> +
>> +    Currently there is no support to save the history to a file. The
>> history of
>> +    previous commands is lost on exit.
>> +    """
>> +    def __init__(self, parent: App) -> None:
>> +        """
>> +        Initializes the editor widget
>> +
>> +        :param parent: Reference to the TUI object.
>> +        """
>> +        super().__init__(caption='> ', multiline=True)
>> +        self.parent = parent
>> +        self.history: List[str] = []
>> +        self.last_index: int = 0
>> +        self.show_history: bool = False
>> +
>> +    def keypress(self, size: Tuple[int, int], key: str) -> Optional[str]:
>> +        """
>> +        Handles the keypress on this widget.
>> +
>> +        :param size:
>> +            The current size of the widget.
>> +        :param key:
>> +            The key to be handled.
>> +
>> +        :return: Unhandled key if any.
>> +        """
>> +        msg = self.get_edit_text()
>> +        if key == 'up' and not msg:
>> +            # Show the history when 'up arrow' is pressed with no input
>> text.
>> +            # NOTE: The show_history logic is necessary because in
>> 'multiline'
>> +            # mode (which we use) 'up arrow' is used to move between
>> lines.
>> +            if not self.history:
>> +                return None
>> +            self.show_history = True
>> +            last_msg = self.history[self.last_index]
>> +            self.set_edit_text(last_msg)
>> +            self.edit_pos = len(last_msg)
>> +        elif key == 'up' and self.show_history:
>> +            self.last_index = min(self.last_index + 1, len(self.history)
>> - 1)
>> +            self.set_edit_text(self.history[self.last_index])
>> +            self.edit_pos = len(self.history[self.last_index])
>> +        elif key == 'down' and self.show_history:
>> +            if self.last_index == 0:
>> +                self.set_edit_text('')
>> +                self.show_history = False
>> +            else:
>> +                self.last_index -= 1
>> +                self.set_edit_text(self.history[self.last_index])
>> +                self.edit_pos = len(self.history[self.last_index])
>> +        elif key == 'meta enter':
>> +            # When using multiline, enter inserts a new line into the
>> editor
>> +            # send the input to the server on alt + enter
>> +            self.parent.cb_send_to_server(msg)
>> +            self.history.insert(0, msg)
>>
>
> Why not append to the end?
>
A dumb reason, I was more comfortable using positive indices.

You can count backwards with list indices too, so you can look at
> history[-1], -2, -3, etc to go further backwards.
>
I have now refactored this to append the messages to the end and count
backward using negative indices.


>
>
>> +            self.set_edit_text('')
>> +            self.last_index = 0
>> +            self.show_history = False
>> +        else:
>> +            self.show_history = False
>> +            self.last_index = 0
>> +            return cast(Optional[str], super().keypress(size, key))
>> +        return None
>> +
>> +
>> +class EditorWidget(urwid.Filler):
>> +    """
>> +    The Editor is a flow widget and has to wrapped inside a box widget.
>> +    This class wraps the Editor inside filler widget.
>> +    """
>> +    def __init__(self, parent: App) -> None:
>> +        super().__init__(Editor(parent), valign='top')
>> +
>> +
>> +class HistoryBox(urwid.ListBox):
>> +    """
>> +    This widget is modelled using the ListBox widget, contains the list
>> of
>> +    all messages both QMP messages and log messsages to be shown in the
>> TUI.
>> +
>> +    The messages are urwid.Text widgets. On every append of a message,
>> the
>> +    focus is shifted to the last appended message.
>> +    """
>> +    def __init__(self, parent: App) -> None:
>> +        """
>> +        Initializes the historybox widget
>> +
>> +        :param parent: Reference to the TUI object.
>> +        """
>> +        self.parent = parent
>> +        self.history = urwid.SimpleFocusListWalker([])
>> +        super().__init__(self.history)
>> +
>> +    def add_to_history(self, history: str) -> None:
>> +        """
>> +        Appends a message to the list and set the focus to the last
>> appended
>> +        message.
>> +
>> +        :param history:
>> +            The history item(message/event) to be appended to the list.
>> +        """
>> +        self.history.append(urwid.Text(history))
>> +        if self.history:
>> +            self.history.set_focus(len(self.history) - 1)
>>
>
> I assume this is something to work around a mypy error? if we've appended
> something to a list, then it should be impossible for the list to be empty,
> right?
>
I was really dumb and did not see this simple logic.

>
>>
>> +
>> +    def mouse_event(self, size: Tuple[int, int], _event: str, button:
>> float,
>> +                    _x: int, _y: int, focus: bool) -> None:
>> +        # Unfortunately there are no urwid constants that represent the
>> below
>> +        # events.
>> +        if button == 4:  # Scroll up event
>> +            super().keypress(size, 'up')
>> +        elif button == 5:  # Scroll down event
>> +            super().keypress(size, 'down')
>> +
>> +
>> +class HistoryWindow(urwid.Frame):
>> +    """
>> +    This window composes the HistoryBox and EditorWidget in a horizontal
>> split.
>> +    By default the first focus is given to the history box.
>> +    """
>> +    def __init__(self, parent: App) -> None:
>> +        """
>> +        Initializes this widget and its child widgets.
>> +
>> +        :param parent: Reference to the TUI object.
>> +        """
>> +        self.parent = parent
>> +        self.editor_widget = EditorWidget(parent)
>> +        self.editor = urwid.LineBox(self.editor_widget)
>> +        self.history = HistoryBox(parent)
>> +        self.body = urwid.Pile([('weight', 80, self.history),
>> +                                ('weight', 20, self.editor)])
>> +        super().__init__(self.body)
>> +        urwid.connect_signal(self.parent, UPDATE_MSG,
>> self.cb_add_to_history)
>> +
>> +    def cb_add_to_history(self, msg: str, level: Optional[str] = None)
>> -> None:
>> +        """
>> +        Appends a message to the history box
>> +
>> +        :param msg:
>> +            The message to be appended to the history box.
>> +        """
>> +        if level:
>> +            msg = f'[{level}]: {msg}'
>> +        self.history.add_to_history(msg)
>> +
>> +
>> +class Window(urwid.Frame):
>> +    """
>> +    This window is the top most widget of the TUI and will contain other
>> +    windows. Each child of this widget is responsible for displaying a
>> specific
>> +    functionality.
>> +    """
>> +    def __init__(self, parent: App) -> None:
>> +        """
>> +        Initializes this widget and its child windows.
>> +
>> +        :param parent: Reference to the TUI object.
>> +        """
>> +        self.parent = parent
>> +        footer = StatusBar()
>> +        body = HistoryWindow(parent)
>> +        super().__init__(body, footer=footer)
>> +
>> +
>> +class TUILogHandler(Handler):
>> +    """
>> +    This handler routes all the log messages to the TUI screen.
>> +    It is installed to the root logger to so that the log message from
>> all
>> +    libraries begin used is routed to the screen.
>> +    """
>> +    def __init__(self, tui: App) -> None:
>> +        """
>> +        Initializes the handler class.
>> +
>> +        :param tui:
>> +            Reference to the TUI object.
>> +        """
>> +        super().__init__()
>> +        self.tui = tui
>> +
>> +    def emit(self, record: LogRecord) -> None:
>> +        """
>> +        Emits a record to the TUI screen.
>> +
>> +        Appends the log message to the TUI screen
>> +        """
>> +        level = record.levelname
>> +        msg = record.getMessage()
>> +        self.tui.add_to_history(msg, level)
>> +
>> +
>> +def main() -> None:
>> +    """
>> +    Driver of the whole script, parses arguments, initialize the TUI and
>> +    the logger.
>> +    """
>> +    parser = argparse.ArgumentParser(description='AQMP TUI')
>> +    parser.add_argument('qmp_server', help='Address of the QMP server. '
>> +                        'Format <UNIX socket path | TCP addr:port>')
>> +    parser.add_argument('--num-retries', type=int, default=10,
>> +                        help='Number of times to reconnect before giving
>> up.')
>> +    parser.add_argument('--retry-delay', type=int,
>> +                        help='Time(s) to wait before next retry. '
>> +                        'Default action is to wait 2s between each
>> retry.')
>> +    parser.add_argument('--log-file', help='The Log file name')
>> +    parser.add_argument('--log-level', default='WARNING',
>> +                        help='Log level
>> <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
>> +    parser.add_argument('--asyncio-debug', action='store_true',
>> +                        help='Enable debug mode for asyncio loop. '
>> +                        'Generates lot of output, makes TUI unusable
>> when '
>> +                        'logs are logged in the TUI. '
>> +                        'Use only when logging to a file.')
>> +    args = parser.parse_args()
>> +
>> +    try:
>> +        address = QEMUMonitorProtocol.parse_address(args.qmp_server)
>> +    except QMPBadPortError as err:
>> +        parser.error(str(err))
>> +
>> +    app = App(address, args.num_retries, args.retry_delay)
>> +
>> +    root_logger = logging.getLogger()
>> +    root_logger.setLevel(logging.getLevelName(args.log_level))
>> +
>> +    if args.log_file:
>> +        root_logger.addHandler(logging.FileHandler(args.log_file))
>> +    else:
>> +        root_logger.addHandler(TUILogHandler(app))
>> +
>> +    app.run(args.asyncio_debug)
>> +
>> +
>> +if __name__ == '__main__':
>> +    main()
>> diff --git a/python/setup.cfg b/python/setup.cfg
>> index 589a90be21..e9ceaea637 100644
>> --- a/python/setup.cfg
>> +++ b/python/setup.cfg
>> @@ -81,8 +81,19 @@ namespace_packages = True
>>  # fusepy has no type stubs:
>>  allow_subclassing_any = True
>>
>> +[mypy-qemu.aqmp.aqmp_tui]
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

--000000000000c3e70205ca4b6a00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 24, 2021 at 12:30 AM John Snow &lt;<a h=
ref=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Aug 23, 2021 at 12:31 PM G S Niteesh =
Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.=
gs@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Added AQMP TUI.<br>
<br>
Implements the follwing basic features:<br>
1) Command transmission/reception.<br>
2) Shows events asynchronously.<br>
3) Shows server status in the bottom status bar.<br>
4) Automatic retries on disconnects and error conditions.<br>
<br>
Also added type annotations and necessary pylint/mypy configurations.<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 637 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 13 +-<br>
=C2=A02 files changed, 649 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br>
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py<br=
>
new file mode 100644<br>
index 0000000000..d3180e38bf<br>
--- /dev/null<br>
+++ b/python/qemu/aqmp/aqmp_tui.py<br>
@@ -0,0 +1,637 @@<br>
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
+from .error import ProtocolError<br>
+from .message import DeserializationError, Message, UnexpectedTypeError<br=
>
+from .protocol import ConnectError, Runstate<br>
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
r></blockquote><div><br></div><div>try list(filter(None, words)) -- it&#39;=
s a little easier to read.<br></div></div></div></blockquote><div><span cla=
ss=3D"gmail_default" style=3D"font-size:small">Thanks. Fixed.</span>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
+=C2=A0 =C2=A0 return &#39; &#39;.join(words)<br>
+<br>
+<br>
+def has_tui_handler(logger: logging.Logger,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hand=
ler_type: Type[Handler]) -&gt; bool:<br></blockquote><div><br></div><div>ma=
ybe has_handler_type(...), since you wrote something a bit more generic tha=
n just checking for the TUI handler.<br></div></div></div></blockquote><div=
><span class=3D"gmail_default" style=3D"font-size:small">Ahh yes. First I h=
ad hardcoded the TUILogHandler type but then decided to make it more generi=
c.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0False.<br></blockquote><di=
v><br></div><div>If you wanted to fit this on one line, the &quot;else Fals=
e&quot; is implied and could be omitted.</div></div></div></blockquote><div=
><span class=3D"gmail_default" style=3D"font-size:small">Omitted</span>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 handlers =3D logger.handlers<br>
+=C2=A0 =C2=A0 for handler in handlers:<br></blockquote><div><br></div><div=
>You could combine these lines if you wanted: for handler in logger.handler=
s: ...<br></div></div></div></blockquote><div><span class=3D"gmail_default"=
 style=3D"font-size:small">Fixed.</span>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
+=C2=A0 =C2=A0 def __init__(self, address: Union[str, Tuple[str, int]], num=
_retries: int,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retry_delay:=
 Optional[int]) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes the TUI.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param address:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Address of the server to connect=
 to.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param num_retries:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The number of times to retry bef=
ore stopping to reconnect.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param retry_delay:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The delay(sec) before each retry=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br></blockquote><div><br></=
div><div>Here and elsewhere, the init documentation can actually go into th=
e class docstring. So you don&#39;t have to write stuff like &quot;Initiali=
zes the TUI&quot; everywhere. Take a look at how I do it in the rest of AQM=
P as a guide.<br></div></div></div></blockquote><div><span class=3D"gmail_d=
efault" style=3D"font-size:small">Changed everywhere.</span>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.register_signal(type(self), UPDATE_MSG)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.window =3D Window(self)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.address =3D address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.aloop: Optional[asyncio.AbstractEventLoop=
] =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.num_retries =3D num_retries<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry_delay =3D retry_delay if retry_dela=
y else 2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry: bool =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exiting: bool =3D False<br>
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
+<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ExecInterruptedError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Error server dis=
connected before reply %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(&#39;Server =
disconnected before reply&#39;, &#39;ERROR&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.disconnect()<br></blo=
ckquote><div><br></div><div>In this case, the connection manager will proba=
bly already have noticed that we were disconnected, so you can probably omi=
t the call to disconnect here.<br></div></div></div></blockquote><div><span=
 class=3D"gmail_default" style=3D"font-size:small">Omitted.</span>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
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
<br></blockquote><div><br></div><div>Technically you&#39;re processing the =
message -- just a little bit. I&#39;d prefer to pass the raw input straight=
 to Message(...) if we could.<br></div></div></div></blockquote><div><span =
class=3D"gmail_default" style=3D"font-size:small">Fixed.</span>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D Message(bytes(raw_msg, e=
ncoding=3D&#39;utf-8&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self._send_to_server=
(msg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (ValueError, TypeError) as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Invalid message:=
 %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(f&#39;{raw_m=
sg}: {err}&#39;, &#39;ERROR&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (DeserializationError, UnexpectedTypeEr=
ror) as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Invalid message:=
 %s&#39;, err.error_message)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_to_history(f&#39;{raw_m=
sg}: {err.error_message}&#39;, &#39;ERROR&#39;)<br></blockquote><div><br></=
div><div>I see what you wanted to do here. You&#39;d like to show a nice er=
ror message even when the message isn&#39;t a valid QMP message, or even va=
lid JSON.=C2=A0</div></div></div></blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br><=
/div><div>In the case of UnexpectedTypeError, we know it was valid JSON but=
 not valid QMP -- we can still use the JSON library to format this message.=
</div><div>In the case of DeserializationError, it wasn&#39;t valid JSON at=
 all -- and if you want nice formatting, you need to get creative.</div><di=
v><br></div><div>You could probably apply your format_json() function only =
in the DeserializationError case -- that way it&#39;s only being used for a=
 fairly specific purpose, and if it isn&#39;t quite so rigorously good at f=
ormatting JSON, it doesn&#39;t matter. You could name it format_malformed_i=
nput to suggest what it&#39;s used for a bit more clearly, perhaps?<br></di=
v></div></div></blockquote><div><span class=3D"gmail_default" style=3D"font=
-size:small">I did a couple of more changes than what you have mentioned.</=
span></div><div><span class=3D"gmail_default" style=3D"font-size:small">1) =
Removed ValueError and TypeError - since these are possible to occur becaus=
e we use the deserialization=C2=A0interface of the message class.</span>=C2=
=A0</div><div><div class=3D"gmail_default" style=3D"font-size:small">2) Ref=
actored the format_json method to use the standard JSON module to format th=
e message incase of a valid JSON message and use the simple string manipula=
tion method incase of an invalid JSON message.</div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exiting =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.disconnect()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.debug(&#39;Disconnect finished. Exitin=
g app&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise urwid.ExitMainLoop()<br>
+<br>
+=C2=A0 =C2=A0 async def disconnect(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Overrides the disconnect method to handle the =
errors locally.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await super().disconnect()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except EOFError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;disconnect: %s&#=
39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ProtocolError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;disconnect: %s&#=
39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.error(&#39;disconnect: U=
nhandled exception %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise err<br></blockquote><div><=
br></div><div>What about for OSError problems, like ConnectionResetByPeer a=
nd so forth?</div><div>You could probably rewrite this to be retry False by=
 default, and then select the handful of cases where you know you want to r=
etry.<br></div></div></div></blockquote><div><span class=3D"gmail_default" =
style=3D"font-size:small">Addressed both these comments.</span>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
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
+=C2=A0 =C2=A0 async def _initiate_connection(self) -&gt; Optional[ConnectE=
rror]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Tries connecting to a server a number of times=
 with a delay between<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 each try. If all retries failed then return th=
e error faced during<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 the last retry.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :return: Error faced during last retry.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 current_retries =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # initial try<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.connect_server()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while self.retry and current_retries &lt; self=
.num_retries:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;Connection Faile=
d, retrying in %d&#39;, self.retry_delay)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D f&#39;[Retry #{curren=
t_retries} ({self.retry_delay}s)]&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._set_status(status)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await asyncio.sleep(self.retry_d=
elay)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D await self.connect_serve=
r()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 current_retries +=3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If all retries failed report the last error<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;All retries fail=
ed: %s&#39;, err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 async def manage_connection(self) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Manage the connection based on the current run=
 state.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 A reconnect is issued when the current state i=
s IDLE and the number<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 of retries is not exhausted.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 A disconnect is issued when the current state =
is DISCONNECTING.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while not self.exiting:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.runstate =3D=3D Runstate=
.IDLE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D await self=
._initiate_connection()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If retry is stil=
l true then, we have exhausted all our tries.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
._set_status(f&#39;[Error: {err.error_message}]&#39;)<br>
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
 is needed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.runstate =
=3D=3D Runstate.IDLE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.runstate_changed()<br=
>
+<br>
+=C2=A0 =C2=A0 async def connect_server(self) -&gt; Optional[ConnectError]:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initiates a connection to the server at addres=
s `self.address`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 and in case of a failure, sets the status to t=
he respective error.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.connect(self.address)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ConnectError as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logging.info" =
rel=3D"noreferrer" target=3D"_blank">logging.info</a>(&#39;connect_server: =
ConnectError %s&#39;, str(err))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.retry =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_task(self.manage_connection(), self.alo=
op)<br>
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
+=C2=A0 =C2=A0 def __init__(self, parent: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes the editor widget<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param parent: Reference to the TUI object.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(caption=3D&#39;&gt; &#39;, mu=
ltiline=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parent =3D parent<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history: List[str] =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index: int =3D 0<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D self.get_edit_text()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if key =3D=3D &#39;up&#39; and not msg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Show the history when &#39;up =
arrow&#39; is pressed with no input text.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # NOTE: The show_history logic i=
s necessary because in &#39;multiline&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # mode (which we use) &#39;up ar=
row&#39; is used to move between lines.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.history:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_history =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_msg =3D self.history[self.l=
ast_index]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.set_edit_text(last_msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.edit_pos =3D len(last_msg)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif key =3D=3D &#39;up&#39; and self.show_his=
tory:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index =3D min(self.las=
t_index + 1, len(self.history) - 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.set_edit_text(self.history[=
self.last_index])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.edit_pos =3D len(self.histo=
ry[self.last_index])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif key =3D=3D &#39;down&#39; and self.show_h=
istory:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.last_index =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.set_edit_text=
(&#39;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_history =
=3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_index -=
=3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.set_edit_text=
(self.history[self.last_index])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.edit_pos =3D =
len(self.history[self.last_index])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif key =3D=3D &#39;meta enter&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # When using multiline, enter in=
serts a new line into the editor<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # send the input to the server o=
n alt + enter<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parent.cb_send_to_server(ms=
g)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.insert(0, msg)<br><=
/blockquote><div><br></div><div>Why not append to the end<span class=3D"gma=
il_default" style=3D"font-size:small">?</span></div></div></div></blockquot=
e><div class=3D"gmail_default" style=3D"font-size:small">A dumb reason, I w=
as more comfortable using positive indices.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><span class=
=3D"gmail_default" style=3D"font-size:small"></span>You can count backwards=
 with list indices too, so you can look at history[-1], -2, -3, etc to go f=
urther backwards.</div></div></div></blockquote><div><span class=3D"gmail_d=
efault">I have now refactored this to append the messages to the end and co=
unt backward using negative indices.</span>=C2=A0</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
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
+=C2=A0 =C2=A0 def __init__(self, parent: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(Editor(parent), valign=3D&#39=
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
+=C2=A0 =C2=A0 def __init__(self, parent: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes the historybox widget<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param parent: Reference to the TUI object.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parent =3D parent<br>
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
history) - 1)<br></blockquote><div><br></div><div>I assume this is somethin=
g to work around a mypy error? if we&#39;ve appended something to a list, t=
hen it should be impossible for the list to be empty, right?<br></div></div=
></div></blockquote><div><span class=3D"gmail_default" style=3D"font-size:s=
mall">I was really dumb and did not see this simple logic.</span>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><div></div>=C2=A0<blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
+<br>
+=C2=A0 =C2=A0 def mouse_event(self, size: Tuple[int, int], _event: str, bu=
tton: float,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _x: =
int, _y: int, focus: bool) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Unfortunately there are no urwid constants t=
hat represent the below<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # events.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if button =3D=3D 4:=C2=A0 # Scroll up event<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().keypress(size, &#39;up&#=
39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif button =3D=3D 5:=C2=A0 # Scroll down even=
t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().keypress(size, &#39;down=
&#39;)<br>
+<br>
+<br>
+class HistoryWindow(urwid.Frame):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 This window composes the HistoryBox and EditorWidget in a ho=
rizontal split.<br>
+=C2=A0 =C2=A0 By default the first focus is given to the history box.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, parent: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes this widget and its child widgets.=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param parent: Reference to the TUI object.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parent =3D parent<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.editor_widget =3D EditorWidget(parent)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.editor =3D urwid.LineBox(self.editor_widg=
et)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history =3D HistoryBox(parent)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.body =3D urwid.Pile([(&#39;weight&#39;, 8=
0, self.history),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;weight&#39;, 20, self.editor)]=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(self.body)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.connect_signal(self.parent, UPDATE_MSG, =
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
+=C2=A0 =C2=A0 windows. Each child of this widget is responsible for displa=
ying a specific<br>
+=C2=A0 =C2=A0 functionality.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, parent: App) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initializes this widget and its child windows.=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param parent: Reference to the TUI object.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parent =3D parent<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 footer =3D StatusBar()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 body =3D HistoryWindow(parent)<br>
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
+=C2=A0 =C2=A0 parser.add_argument(&#39;--num-retries&#39;, type=3Dint, def=
ault=3D10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&#39;Number of times to reconnect before giving up.&#39;)=
<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--retry-delay&#39;, type=3Dint,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&#39;Time(s) to wait before next retry. &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;Default action is to wait 2s between each retry.&#39;)<br>
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
+=C2=A0 =C2=A0 app =3D App(address, args.num_retries, args.retry_delay)<br>
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
index 589a90be21..e9ceaea637 100644<br>
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
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000c3e70205ca4b6a00--

