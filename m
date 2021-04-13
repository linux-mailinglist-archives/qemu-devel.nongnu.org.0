Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D357D35E762
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 22:03:03 +0200 (CEST)
Received: from localhost ([::1]:39652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWPFW-00074d-0v
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 16:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWPDi-0006Yf-SV
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWPDd-0007Rw-2J
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618344059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vZvGEJ1HizDCgAqET80pT8iGGMiubT2L/hLf3WLKGZU=;
 b=elemSPDtIvHZi/aZzPuWlVTYjmCpF1JQs9F3f5eV/wAdVfw+Ur1ILn5wYTyi5V0/7VLgbO
 kraQpIpS9KYzoVgn/PwE6iL4mL5boclqvAZpMqK2VTxtKdaM5MgkM1+qJKJPyxOR7uKzbX
 EuK7gveHsCHGdBVI87a3XBJaFjS2iuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-GReSCDQDNvuFGgbQpQwsmg-1; Tue, 13 Apr 2021 16:00:56 -0400
X-MC-Unique: GReSCDQDNvuFGgbQpQwsmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EB1F8143F0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 20:00:55 +0000 (UTC)
Received: from localhost (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D82845D768;
 Tue, 13 Apr 2021 20:00:54 +0000 (UTC)
Date: Tue, 13 Apr 2021 21:00:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH RFC 3/7] protocol: generic async message-based protocol
 loop
Message-ID: <YHX4dTmEgNal6Jca@stefanha-x1.localdomain>
References: <20210413155553.2660523-1-jsnow@redhat.com>
 <20210413155553.2660523-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210413155553.2660523-4-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XSq5HTI8G4dKr8Mo"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: armbru@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XSq5HTI8G4dKr8Mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 11:55:49AM -0400, John Snow wrote:
> This module provides the protocol-agnostic framework upon which QMP will
> be built. I also have (not included in this series) a qtest
> implementation that uses this same framework, which is why it is split
> into two portions like this.
>=20
> The design uses two independent tasks in the "bottol half", a writer and
> a reader. These tasks run for the duration of the connection and
> independently send and receive messages, respectively.
>=20
> A third task, disconnect, is scheduled whenever an error occurs and
> facilitates coalescing of the other two tasks. MultiException is used in
> this case if *both* tasks should have Exceptions that need to be
> reported, though at the time of writing, I think this circumstance might
> only be a theoretical concern.
>=20
> The generic model here does not provide execute(), but the model for QMP
> is informative for how this class is laid out. Below, QMP's execute()
> function deposits a message into the outbound queue. The writer task
> wakes up to process the queue and deposits information in the write
> buffer, where the message is finally dispatched. Meanwhile, the
> execute() call is expected to block on an RPC mailbox waiting for a
> reply from the server.
>=20
> On the return trip, the reader wakes up when data arrives in the
> buffer. The message is deserialized and handed off to the protocol layer
> to route accordingly. QMP will route this message into either the Event
> queue or one of the pending RPC mailboxes.
>=20
> Upon this message being routed to the correct RPC mailbox, execute()
> will be woken up and allowed to process the reply and deliver it back to
> the caller.
>=20
> The reason for separating the inbound and outbound tasks to such an
> extreme degree is to allow for designs and extensions where this
> asynchronous loop may be launched in a separate thread. In this model,
> it is possible to use a synchronous, thread-safe function to deposit new
> messages into the outbound queue; this was seen as a viable way to offer
> solid synchronous bindings while still allowing events to be processed
> truly asynchronously.
>=20
> Separating it this way also allows us to fairly easily support
> Out-of-band executions with little additional effort; essentially all
> commands are treated as out-of-band.
>=20
> The execute graph:
>=20
>                        +---------+
>                        | caller  |
>                        +---------+
>                             |
>                             v
>                        +---------+
>      +---------------- |execute()| <----------+
>      |                 +---------+            |
>      |                                        |
> -----------------------------------------------------------
>      v                                        |
> +----+----+    +-----------+           +------+-------+
> |Mailboxes|    |Event Queue|           |Outbound Queue|
> +----+----+    +------+----+           +------+-------+
>      |                |                       ^
>      v                v                       |
>   +--+----------------+---+       +-----------+-----------+
>   | Reader Task/Coroutine |       | Writer Task/Coroutine |
>   +-----------+-----------+       +-----------+-----------+
>               |                               ^
>               v                               |
>         +-----+------+                  +-----+------+
>         |StreamReader|                  |StreamWriter|
>         +------------+                  +------------+

The arrow directions confuse me. I don't understand what they convey.

>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  protocol.py | 704 ++++++++++++++++++++++++++++++++++++++++++++++++++++

Yikes, this is complex. I'm not sure the abstractions are worth the
cost. Hopefully everything will be tied up with a simple high-level API
later in the series.

>  1 file changed, 704 insertions(+)
>  create mode 100644 protocol.py
>=20
> diff --git a/protocol.py b/protocol.py
> new file mode 100644
> index 0000000..27d1558
> --- /dev/null
> +++ b/protocol.py
> @@ -0,0 +1,704 @@
> +"""
> +Async message-based protocol support.
> +
> +This module provides a generic framework for sending and receiving
> +messages over an asyncio stream.
> +
> +`AsyncProtocol` is an abstract class that implements the core mechanisms
> +of a simple send/receive protocol, and is designed to be extended.
> +
> +`AsyncTasks` provides a container class that aggregates tasks that make
> +up the loop used by `AsyncProtocol`.
> +"""
> +
> +import asyncio
> +from asyncio import StreamReader, StreamWriter
> +import logging
> +from ssl import SSLContext
> +from typing import (
> +    Any,
> +    Awaitable,
> +    Callable,
> +    Coroutine,
> +    Iterator,
> +    List,
> +    Generic,
> +    Optional,
> +    Tuple,
> +    TypeVar,
> +    Union,
> +)
> +
> +from error import (
> +    ConnectError,
> +    MultiException,
> +    StateError,
> +)
> +from util import create_task, pretty_traceback, wait_closed
> +
> +
> +T =3D TypeVar('T')
> +_TaskFN =3D Callable[[], Awaitable[None]]  # aka ``async def func() -> N=
one``
> +_FutureT =3D TypeVar('_FutureT', bound=3DOptional['asyncio.Future[Any]']=
)
> +_GatherRet =3D List[Optional[BaseException]]
> +
> +
> +class AsyncTasks:
> +    """
> +    AsyncTasks is a collection of bottom half tasks designed to run fore=
ver.
> +
> +    This is a convenience wrapper to make calls from `AsyncProtocol` sim=
pler to
> +    follow by behaving as a simple aggregate of two or more tasks, such =
that
> +    a higher-level connection manager can simply refer to "the bottom ha=
lf"
> +    as one coherent entity instead of several.
> +
> +    The general flow is:
> +
> +    1. ``tasks =3D AsyncTasks(logger_for_my_client)``
> +    2. ``tasks.start(my_reader, my_writer)``
> +    3. ``...``
> +    4. ``await tasks.cancel()``
> +    5. ``tasks.result()``
> +
> +    :param logger: A logger to use for debugging messages. Useful to
> +                   associate messages with a particular server context.
> +    """
> +
> +    logger =3D logging.getLogger(__name__)
> +
> +    def __init__(self, logger: Optional[logging.Logger] =3D None):
> +        if logger is not None:
> +            self.logger =3D logger
> +
> +        # Named tasks
> +        self.reader: Optional['asyncio.Future[None]'] =3D None
> +        self.writer: Optional['asyncio.Future[None]'] =3D None
> +
> +        # Internal aggregate of all of the above tasks.
> +        self._all: Optional['asyncio.Future[_GatherRet]'] =3D None
> +
> +    def _all_tasks(self) -> Iterator[Optional['asyncio.Future[None]']]:
> +        """Yields all tasks, defined or not, in ideal cancellation order=
."""
> +        yield self.writer
> +        yield self.reader
> +
> +    def __iter__(self) -> Iterator['asyncio.Future[None]']:
> +        """Yields all defined tasks, in ideal cancellation order."""
> +        for task in self._all_tasks():
> +            if task is not None:
> +                yield task
> +
> +    @property
> +    def _all_tasks_defined(self) -> bool:
> +        """Returns True if all tasks are defined."""
> +        return all(map(lambda task: task is not None, self._all_tasks())=
)
> +
> +    @property
> +    def _some_tasks_done(self) -> bool:
> +        """Returns True if any defined tasks are done executing."""
> +        return any(map(lambda task: task.done(), iter(self)))
> +
> +    def __bool__(self) -> bool:
> +        """Returns True when any tasks are defined at all."""
> +        return bool(tuple(iter(self)))
> +
> +    @property
> +    def running(self) -> bool:
> +        """Returns True if all tasks are defined and still running."""
> +        return self._all_tasks_defined and not self._some_tasks_done
> +
> +    def start(self,
> +              reader_coro: Coroutine[Any, Any, None],
> +              writer_coro: Coroutine[Any, Any, None]) -> None:
> +        """
> +        Starts executing tasks in the current async context.
> +
> +        :param reader_coro: Coroutine, message reader task.
> +        :param writer_coro: Coroutine, message writer task.
> +        """
> +        self.reader =3D create_task(reader_coro)
> +        self.writer =3D create_task(writer_coro)
> +
> +        # Uses extensible self-iterator.
> +        self._all =3D asyncio.gather(*iter(self), return_exceptions=3DTr=
ue)
> +
> +    async def cancel(self) -> None:
> +        """
> +        Cancels all tasks and awaits full cancellation.
> +
> +        Exceptions, if any, can be obtained by calling `result()`.
> +        """
> +        for task in self:
> +            if task and not task.done():
> +                self.logger.debug("cancelling task %s", str(task))
> +                task.cancel()
> +
> +        if self._all:
> +            self.logger.debug("Awaiting all tasks to finish ...")
> +            await self._all
> +
> +    def _cleanup(self) -> None:
> +        """
> +        Erase all task handles; asserts that no tasks are running.
> +        """
> +        def _paranoid_task_erase(task: _FutureT) -> Optional[_FutureT]:
> +            assert (task is None) or task.done()
> +            return None if (task and task.done()) else task
> +
> +        self.reader =3D _paranoid_task_erase(self.reader)
> +        self.writer =3D _paranoid_task_erase(self.writer)
> +        self._all =3D _paranoid_task_erase(self._all)
> +
> +    def result(self) -> None:
> +        """
> +        Raises exception(s) from the finished tasks, if any.
> +
> +        Called to fully quiesce this task group. asyncio.CancelledError =
is
> +        never raised; in the event of an intentional cancellation this
> +        function will not raise any errors.
> +
> +        If an exception in one bottom half caused an unscheduled disconn=
ect,
> +        that exception will be raised.
> +
> +        :raise: `Exception`      Arbitrary exceptions re-raised on behal=
f of
> +                                 the bottom half.
> +        :raise: `MultiException` Iterable Exception used to multiplex mu=
ltiple
> +                                 exceptions when multiple threads failed=
.
> +        """
> +        exceptions: List[BaseException] =3D []
> +        results =3D self._all.result() if self._all else ()
> +        self._cleanup()
> +
> +        for result in results:
> +            if result is None:
> +                continue
> +            if not isinstance(result, asyncio.CancelledError):
> +                exceptions.append(result)
> +
> +        if len(exceptions) =3D=3D 1:
> +            raise exceptions.pop()
> +        if len(exceptions) > 1:
> +            raise MultiException(exceptions)
> +
> +
> +class AsyncProtocol(Generic[T]):
> +    """AsyncProtocol implements a generic async message-based protocol.
> +
> +    This protocol assumes the basic unit of information transfer between
> +    client and server is a "message", the details of which are left up
> +    to the implementation. It assumes the sending and receiving of these
> +    messages is full-duplex and not necessarily correlated; i.e. it
> +    supports asynchronous inbound messages.
> +
> +    It is designed to be extended by a specific protocol which provides
> +    the implementations for how to read and send messages. These must be
> +    defined in `_do_recv()` and `_do_send()`, respectively.
> +
> +    Other callbacks that have a default implemention, but may be
> +    extended or overridden:
> +     - _on_connect: Actions performed prior to loop start.
> +     - _on_start:   Actions performed immediately after loop start.
> +     - _on_message: Actions performed when a message is received.
> +                    The default implementation does nothing at all.
> +     - _cb_outbound: Log/Filter outgoing messages.
> +     - _cb_inbound: Log/Filter incoming messages.

This reminds me of asyncio.protocols and twisted.internet.protocol.

> +
> +    :param name: Name used for logging messages, if any.
> +    """
> +    #: Logger object for debugging messages
> +    logger =3D logging.getLogger(__name__)
> +
> +    # -------------------------
> +    # Section: Public interface
> +    # -------------------------
> +
> +    def __init__(self, name: Optional[str] =3D None) -> None:
> +        self.name =3D name
> +        if self.name is not None:
> +            self.logger =3D self.logger.getChild(self.name)
> +
> +        # stream I/O
> +        self._reader: Optional[StreamReader] =3D None
> +        self._writer: Optional[StreamWriter] =3D None
> +
> +        # I/O queues
> +        self._outgoing: asyncio.Queue[T] =3D asyncio.Queue()
> +
> +        # I/O tasks (message reader, message writer)
> +        self._tasks =3D AsyncTasks(self.logger)
> +
> +        # Disconnect task; separate from the core loop.
> +        self._dc_task: Optional[asyncio.Future[None]] =3D None
> +
> +    @property
> +    def running(self) -> bool:
> +        """
> +        Return True when the loop is currently connected and running.
> +        """
> +        if self.disconnecting:
> +            return False
> +        return self._tasks.running
> +
> +    @property
> +    def disconnecting(self) -> bool:
> +        """
> +        Return True when the loop is disconnecting, or disconnected.
> +        """
> +        return bool(self._dc_task)
> +
> +    @property
> +    def unconnected(self) -> bool:
> +        """
> +        Return True when the loop is fully idle and quiesced.
> +
> +        Returns True specifically when the loop is neither `running`
> +        nor `disconnecting`. A call to `disconnect()` is required
> +        to transition from `disconnecting` to `unconnected`.
> +        """
> +        return not (self.running or self.disconnecting)
> +
> +    async def accept(self, address: Union[str, Tuple[str, int]],
> +                     ssl: Optional[SSLContext] =3D None) -> None:
> +        """
> +        Accept a connection and begin processing message queues.
> +
> +        :param address: Address to connect to;
> +                        UNIX socket path or TCP address/port.
> +        :param ssl:     SSL context to use, if any.
> +
> +        :raise: `StateError`   (loop is running or disconnecting.)
> +        :raise: `ConnectError` (Connection was not successful.)
> +        """
> +        if self.disconnecting:
> +            raise StateError("Client is disconnecting/disconnected."
> +                             " Call disconnect() to fully disconnect.")
> +        if self.running:
> +            raise StateError("Client is already connected and running.")
> +        assert self.unconnected
> +
> +        try:
> +            await self._new_session(self._do_accept(address, ssl))
> +        except Exception as err:
> +            emsg =3D "Failed to accept incoming connection"
> +            self.logger.error("%s:\n%s\n", emsg, pretty_traceback())
> +            raise ConnectError(f"{emsg}: {err!s}") from err

Wrapping the exception in ConnectError() obfuscates what's going on IMO.

> +
> +    async def connect(self, address: Union[str, Tuple[str, int]],
> +                      ssl: Optional[SSLContext] =3D None) -> None:
> +        """
> +        Connect to the server and begin processing message queues.
> +
> +        :param address: Address to connect to;
> +                        UNIX socket path or TCP address/port.
> +        :param ssl:     SSL context to use, if any.
> +
> +        :raise: `StateError`   (loop is running or disconnecting.)
> +        :raise: `ConnectError` (Connection was not successful.)
> +        """
> +        if self.disconnecting:
> +            raise StateError("Client is disconnecting/disconnected."
> +                             " Call disconnect() to fully disconnect.")
> +        if self.running:
> +            raise StateError("Client is already connected and running.")
> +        assert self.unconnected
> +
> +        try:
> +            await self._new_session(self._do_connect(address, ssl))
> +        except Exception as err:
> +            emsg =3D "Failed to connect to server"
> +            self.logger.error("%s:\n%s\n", emsg, pretty_traceback())
> +            raise ConnectError(f"{emsg}: {err!s}") from err
> +
> +    async def disconnect(self) -> None:
> +        """
> +        Disconnect and wait for all tasks to fully stop.
> +
> +        If there were exceptions that caused the bottom half to terminat=
e
> +        prematurely, they will be raised here.
> +
> +        :raise: `Exception`      Arbitrary exceptions re-raised on behal=
f of
> +                                 the bottom half.
> +        :raise: `MultiException` Iterable Exception used to multiplex mu=
ltiple
> +                                 exceptions when multiple tasks failed.
> +        """
> +        self._schedule_disconnect()
> +        await self._wait_disconnect()
> +
> +    # -----------------------------
> +    # Section: Connection machinery
> +    # -----------------------------
> +
> +    async def _register_streams(self,
> +                                reader: asyncio.StreamReader,
> +                                writer: asyncio.StreamWriter) -> None:
> +        """Register the Reader/Writer streams."""
> +        self._reader =3D reader
> +        self._writer =3D writer
> +
> +    async def _new_session(self, coro: Awaitable[None]) -> None:
> +        """
> +        Create a new session.
> +
> +        This is called for both `accept()` and `connect()` pathways.
> +
> +        :param coro: An awaitable that will perform either connect or ac=
cept.
> +        """
> +        assert self._reader is None
> +        assert self._writer is None
> +
> +        # NB: If a previous session had stale messages, they are dropped=
 here.
> +        self._outgoing =3D asyncio.Queue()
> +
> +        # Connect / Await Connection
> +        await coro
> +        assert self._reader is not None
> +        assert self._writer is not None
> +
> +        await self._on_connect()
> +
> +        reader_coro =3D self._bh_loop_forever(self._bh_recv_message, 'Re=
ader')
> +        writer_coro =3D self._bh_loop_forever(self._bh_send_message, 'Wr=
iter')
> +        self._tasks.start(reader_coro, writer_coro)
> +
> +        await self._on_start()
> +
> +    async def _do_accept(self, address: Union[str, Tuple[str, int]],
> +                         ssl: Optional[SSLContext] =3D None) -> None:
> +        """
> +        Acting as the protocol server, accept a single connection.
> +
> +        Used as the awaitable callback to `_new_session()`.
> +        """
> +        self.logger.debug("Awaiting connection ...")
> +        connected =3D asyncio.Event()
> +        server: Optional[asyncio.AbstractServer] =3D None
> +
> +        async def _client_connected_cb(reader: asyncio.StreamReader,
> +                                       writer: asyncio.StreamWriter) -> =
None:
> +            """Used to accept a single incoming connection, see below.""=
"
> +            nonlocal server
> +            nonlocal connected
> +
> +            # A connection has been accepted; stop listening for new one=
s.
> +            assert server is not None
> +            server.close()
> +            await server.wait_closed()
> +            server =3D None
> +
> +            # Register this client as being connected
> +            await self._register_streams(reader, writer)
> +
> +            # Signal back: We've accepted a client!
> +            connected.set()
> +
> +        if isinstance(address, tuple):
> +            coro =3D asyncio.start_server(
> +                _client_connected_cb,
> +                host=3Daddress[0],
> +                port=3Daddress[1],
> +                ssl=3Dssl,
> +                backlog=3D1,
> +            )
> +        else:
> +            coro =3D asyncio.start_unix_server(
> +                _client_connected_cb,
> +                path=3Daddress,
> +                ssl=3Dssl,
> +                backlog=3D1,
> +            )
> +
> +        server =3D await coro     # Starts listening
> +        await connected.wait()  # Waits for the callback to fire (and fi=
nish)
> +        assert server is None

Async callbacks defeat the readability advantages of coroutines :(.

asyncio.start_server() is designed for spawning client connections in
separate tasks but we just want to accept a client connection in the
current coroutine. It might be possible to eliminate the callback
business by not using the server and instead doing:

  conn, addr =3D await loop.sock_accept(listen_sock)

Whether that ends up being simpler, I'm not sure because you may need to
unwrap/wrap the listen_sock and conn sockets into asyncio classes to
interface with the rest of the code.

> +
> +        self.logger.debug("Connection accepted")
> +
> +    async def _do_connect(self, address: Union[str, Tuple[str, int]],
> +                          ssl: Optional[SSLContext] =3D None) -> None:
> +        self.logger.debug("Connecting ...")
> +
> +        if isinstance(address, tuple):
> +            connect =3D asyncio.open_connection(address[0], address[1], =
ssl=3Dssl)
> +        else:
> +            connect =3D asyncio.open_unix_connection(path=3Daddress, ssl=
=3Dssl)
> +        reader, writer =3D await(connect)
> +        await self._register_streams(reader, writer)
> +
> +        self.logger.debug("Connected")
> +
> +    async def _on_connect(self) -> None:
> +        """
> +        Async callback invoked after connection, but prior to loop start=
.
> +
> +        This callback is invoked after the stream is opened, but prior t=
o
> +        starting the reader/writer tasks. Use this callback to handle
> +        handshakes, greetings, &c to avoid having special edge cases in =
the
> +        generic message handler.
> +        """
> +        # Nothing to do in the general case.
> +
> +    async def _on_start(self) -> None:
> +        """
> +        Async callback invoked after connection and loop start.
> +
> +        This callback is invoked after the stream is opened AND after
> +        the reader/writer tasks have been started. Use this callback to
> +        auto-perform certain tasks during the connect() call.
> +        """
> +        # Nothing to do in the general case.
> +
> +    def _schedule_disconnect(self) -> None:
> +        """
> +        Initiate a disconnect; idempotent.
> +
> +        This is called by the reader/writer tasks upon exceptions,
> +        or directly by a user call to `disconnect()`.
> +        """
> +        if not self._dc_task:
> +            self._dc_task =3D create_task(self._bh_disconnect())
> +
> +    async def _wait_disconnect(self) -> None:
> +        """
> +        _wait_disconnect waits for a scheduled disconnect to finish.
> +
> +        This function will gather any bottom half exceptions and re-rais=
e them;
> +        so it is intended to be used in the upper half call chain.
> +
> +        If a single exception is encountered, it will be re-raised faith=
fully.
> +        If multiple are found, they will be multiplexed into a MultiExce=
ption.
> +
> +        :raise: `Exception`      Many kinds; anything the bottom half ra=
ises.
> +        :raise: `MultiException` When the Reader/Writer both have except=
ions.
> +        """
> +        assert self._dc_task
> +        await self._dc_task
> +        self._dc_task =3D None
> +
> +        try:
> +            self._tasks.result()
> +        finally:
> +            self._cleanup()
> +
> +    def _cleanup(self) -> None:
> +        """
> +        Fully reset this object to a clean state.
> +        """
> +        assert not self.running
> +        assert self._dc_task is None
> +        # _tasks.result() called in _wait_disconnect does _tasks cleanup=
, so:
> +        assert not self._tasks
> +
> +        self._reader =3D None
> +        self._writer =3D None
> +
> +    # ------------------------------
> +    # Section: Bottom Half functions
> +    # ------------------------------
> +
> +    async def _bh_disconnect(self) -> None:
> +        """
> +        Disconnect and cancel all outstanding tasks.
> +
> +        It is designed to be called from its task context, self._dc_task=
.
> +        """
> +        # RFC: Maybe I shot myself in the foot by trying too hard to
> +        # group the tasks together as one unit. I suspect the ideal
> +        # cancellation order here is actually: MessageWriter,
> +        # StreamWriter, MessageReader
> +
> +        # What I have here instead is MessageWriter, MessageReader,
> +        # StreamWriter
> +
> +        # Cancel the the message reader/writer.
> +        await self._tasks.cancel()
> +
> +        # Handle the stream writer itself, now.
> +        if self._writer:
> +            if not self._writer.is_closing():
> +                self.logger.debug("Writer is open; draining")
> +                await self._writer.drain()
> +                self.logger.debug("Closing writer")
> +                self._writer.close()
> +            self.logger.debug("Awaiting writer to fully close")
> +            await wait_closed(self._writer)
> +            self.logger.debug("Fully closed.")
> +
> +        # TODO: Add a hook for higher-level protocol cancellations here?
> +        #       (Otherwise, the disconnected logging event happens too s=
oon.)
> +
> +        self.logger.debug("Protocol Disconnected.")
> +
> +    async def _bh_loop_forever(self, async_fn: _TaskFN, name: str) -> No=
ne:
> +        """
> +        Run one of the bottom-half functions in a loop forever.
> +
> +        If the bottom half ever raises any exception, schedule a disconn=
ect.
> +        """
> +        try:
> +            while True:
> +                await async_fn()
> +        except asyncio.CancelledError as err:
> +            # We are cancelled (by _bh_disconnect), so no need to call i=
t.
> +            self.logger.debug("Task.%s: cancelled: %s.",
> +                              name, type(err).__name__)
> +            raise
> +        except:
> +            self.logger.error("Task.%s: failure:\n%s\n", name,
> +                              pretty_traceback())
> +            self.logger.debug("Task.%s: scheduling disconnect.", name)
> +            self._schedule_disconnect()
> +            raise
> +        finally:
> +            self.logger.debug("Task.%s: exiting.", name)
> +
> +    async def _bh_send_message(self) -> None:
> +        """
> +        Wait for an outgoing message, then send it.
> +        """
> +        self.logger.log(5, "Waiting for message in outgoing queue to sen=
d ...")
> +        msg =3D await self._outgoing.get()
> +        try:
> +            self.logger.log(5, "Got outgoing message, sending ...")
> +            await self._send(msg)
> +        finally:
> +            self._outgoing.task_done()
> +            self.logger.log(5, "Outgoing message sent.")
> +
> +    async def _bh_recv_message(self) -> None:
> +        """
> +        Wait for an incoming message and call `_on_message` to route it.
> +
> +        Exceptions seen may be from `_recv` or from `_on_message`.
> +        """
> +        self.logger.log(5, "Waiting to receive incoming message ...")
> +        msg =3D await self._recv()
> +        self.logger.log(5, "Routing message ...")
> +        await self._on_message(msg)
> +        self.logger.log(5, "Message routed.")
> +
> +    # ---------------------
> +    # Section: Datagram I/O
> +    # ---------------------
> +
> +    def _cb_outbound(self, msg: T) -> T:
> +        """
> +        Callback: outbound message hook.
> +
> +        This is intended for subclasses to be able to add arbitrary hook=
s to
> +        filter or manipulate outgoing messages. The base implementation
> +        does nothing but log the message without any manipulation of the
> +        message. It is designed for you to invoke super() at the tail of
> +        any overridden method.
> +
> +        :param msg: raw outbound message
> +        :return: final outbound message
> +        """
> +        self.logger.debug("--> %s", str(msg))
> +        return msg
> +
> +    def _cb_inbound(self, msg: T) -> T:
> +        """
> +        Callback: inbound message hook.
> +
> +        This is intended for subclasses to be able to add arbitrary hook=
s to
> +        filter or manipulate incoming messages. The base implementation
> +        does nothing but log the message without any manipulation of the
> +        message. It is designed for you to invoke super() at the head of
> +        any overridden method.
> +
> +        This method does not "handle" incoming messages; it is a filter.
> +        The actual "endpoint" for incoming messages is `_on_message()`.
> +
> +        :param msg: raw inbound message
> +        :return: processed inbound message
> +        """
> +        self.logger.debug("<-- %s", str(msg))
> +        return msg
> +
> +    async def _readline(self) -> bytes:
> +        """
> +        Wait for a newline from the incoming reader.
> +
> +        This method is provided as a convenience for upper-layer
> +        protocols, as many will be line-based.
> +
> +        This function *may* return a sequence of bytes without a
> +        trailing newline if EOF occurs, but *some* bytes were
> +        received. In this case, the next call will raise EOF.
> +
> +        :raise OSError: Stream-related errors.
> +        :raise EOFError: If the reader stream is at EOF and there
> +                         are no bytes to return.
> +        """
> +        assert self._reader is not None
> +        msg_bytes =3D await self._reader.readline()
> +        self.logger.log(5, "Read %d bytes", len(msg_bytes))
> +
> +        if not msg_bytes:
> +            if self._reader.at_eof():
> +                self.logger.debug("EOF")
> +                raise EOFError()
> +
> +        return msg_bytes
> +
> +    async def _do_recv(self) -> T:
> +        """
> +        Abstract: Read from the stream and return a message.
> +
> +        Very low-level; intended to only be called by `_recv()`.
> +        """
> +        raise NotImplementedError
> +
> +    async def _recv(self) -> T:
> +        """
> +        Read an arbitrary protocol message. (WARNING: Extremely low-leve=
l.)
> +
> +        This function is intended primarily for _bh_recv_message to use
> +        in an asynchronous task loop. Using it outside of this loop will
> +        "steal" messages from the normal routing mechanism. It is safe t=
o
> +        use during `_on_connect()`, but should not be used otherwise.
> +
> +        This function uses `_do_recv()` to retrieve the raw message, and
> +        then transforms it using `_cb_inbound()`.
> +
> +        Errors raised may be any of those from either method implementat=
ion.
> +
> +        :return: A single (filtered, processed) protocol message.
> +        """
> +        message =3D await self._do_recv()
> +        return self._cb_inbound(message)
> +
> +    def _do_send(self, msg: T) -> None:
> +        """
> +        Abstract: Write a message to the stream.
> +
> +        Very low-level; intended to only be called by `_send()`.
> +        """
> +        raise NotImplementedError
> +
> +    async def _send(self, msg: T) -> None:
> +        """
> +        Send an arbitrary protocol message. (WARNING: Low-level.)
> +
> +        Like `_read()`, this function is intended to be called by the wr=
iter
> +        task loop that processes outgoing messages. This function will
> +        transform any outgoing messages according to `_cb_outbound()`.
> +
> +        :raise: OSError - Various stream errors.
> +        """
> +        assert self._writer is not None
> +        msg =3D self._cb_outbound(msg)
> +        self._do_send(msg)
> +
> +    async def _on_message(self, msg: T) -> None:
> +        """
> +        Called when a new message is received.
> +
> +        Executed from within the reader loop BH, so be advised that wait=
ing
> +        on other asynchronous tasks may be risky, depending. Additionall=
y,
> +        any errors raised here will directly cause the loop to halt; lim=
it
> +        error checking to what is strictly necessary for message routing=
.
> +
> +        :param msg: The incoming message, already logged/filtered.
> +        """
> +        # Nothing to do in the abstract case.
> --=20
> 2.30.2
>=20

--XSq5HTI8G4dKr8Mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB1+HUACgkQnKSrs4Gr
c8g4rQf7BlHgSBTnLCQghqW2hVX90qyVvYKcaTL/ITUpTpFIXUfm510FHplkmn5e
LTRnHDEnaib0hkvqqjETF3lSe+eMn73AzgFuqsSR2fT75Vw/nBoEgNGK3kwXbB6R
r693+E/VAf/dhEb42fL1fSeB16Izf2dNfQ0bXlUBpSgjlx13gF9tb/aDIJb1N5Y6
9+Lrbs4HgRT61YnRNi21TEuqqlArR4WPxYzuuYiXKXXaI9/5AHtMuMB6KXodFWZ3
4Yj4gS/HHWbFxrdjbIQB0VfRHvZQ8+Kl2dBr/guBonO0yrpFqhgn36y6gdPVPDcj
/kLeaUvFsN5pyFQL88HNBwa+wkkQVw==
=akvV
-----END PGP SIGNATURE-----

--XSq5HTI8G4dKr8Mo--


