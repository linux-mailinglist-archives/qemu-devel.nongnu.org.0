Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E513DDE7C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 19:26:43 +0200 (CEST)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAbi6-00026C-Ep
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 13:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAbgd-0000kB-KN
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 13:25:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAbgX-0004hm-Dq
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 13:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627925102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zWV5hN1vlaaVbCnIqOVlWdQf3JCgkG2whY7mq7I9keY=;
 b=g4KQLse0qq1QeycwWr6m5vwty3Nem9meT4AyrXUBSkyrVK4Y9a2qdQyls/GZMvOJCy9VwE
 giYvfLSWiEP2wFY6XR7SLfj3MHnmpqieToN4vg7Mk9qS7V2NPYwJ1cFdPhLx+M1RRnt+Id
 9vXI6J2wBGFRjJnHmOEIL0huDUfsX6M=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-CFY5Rg8XMju3OS0R4V134A-1; Mon, 02 Aug 2021 13:24:58 -0400
X-MC-Unique: CFY5Rg8XMju3OS0R4V134A-1
Received: by mail-oo1-f69.google.com with SMTP id
 n19-20020a4ae7530000b029024bc69d2a8aso7623865oov.16
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 10:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zWV5hN1vlaaVbCnIqOVlWdQf3JCgkG2whY7mq7I9keY=;
 b=ru/QGk4zrw6a+0xdlk0AgZgMS6JxJUuzeHaWvZRAf4BDyON1ZWnZxjHhbMVvc+LcD5
 NM8GNbvo/Ny0/gF1Hi9sxvXUictyei0uLslhusuU6B/ZqyvP1gdZINNpFqG9tcXd5zSK
 6qrUeLj1FbBOGu7UjC5zdAEBRdmaCPxxUI1qlzLCGRJpAbJH2qMx++VVRnZ1fwyTIF+w
 oY/XK+cNABKcthUU8x5CVlz9obQjqMYHUyZEVch/K1A9THsJzZvi4B4poGq2zdkdHDic
 vNHaH/3Qetl1CQMjvxcAEswEYXgbMKJFf9N7dhCw/GXtqIrgZvPRXV5LQvDA/GjQ22Mr
 4dMw==
X-Gm-Message-State: AOAM531kBPzXGn5raP9OROakWVFd8J3UHjrPlGZcyXiG6Gw1SP88je7n
 RPZ2maGqetAoWI46zrnLdgsgPrGhSp8d8wOSf2g1ZIGodsPmK4h4UMYQVHHypqj+CJhfq/rYAHx
 UkeaZziXmsVvhoX3YWnJZ/SDrTyPiSgU=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr23819oiw.112.1627925097727; 
 Mon, 02 Aug 2021 10:24:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu7sIMOXC2gw0m1Z5r66Lro+LEY+kCOaOlBFtq7RSQz2PqWJEhUYHVXQ2zveR/ocKmwWYzlkjJChHdg8yOKqU=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr23801oiw.112.1627925097526; 
 Mon, 02 Aug 2021 10:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210717003253.457418-1-jsnow@redhat.com>
 <20210717003253.457418-25-jsnow@redhat.com>
 <20210720203437.pzncze4y56phho3v@laptop.redhat>
In-Reply-To: <20210720203437.pzncze4y56phho3v@laptop.redhat>
From: John Snow <jsnow@redhat.com>
Date: Mon, 2 Aug 2021 13:24:46 -0400
Message-ID: <CAFn=p-a3oxkJeoXB788Kvqp-NmFFGG0ubc7OOB3F_r_0o801pg@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] python/aqmp: add AsyncProtocol unit tests
To: Beraldo Leal <bleal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000028c82805c896d905"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000028c82805c896d905
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 4:34 PM Beraldo Leal <bleal@redhat.com> wrote:

> On Fri, Jul 16, 2021 at 08:32:53PM -0400, John Snow wrote:
> > This tests most of protocol.py -- From a hacked up Coverage.py run, it's
> > at about 86%. There's a few error cases that aren't very well tested
> > yet, they're hard to induce artificially so far. I'm working on it.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/tests/null_proto.py |  67 ++++++
> >  python/tests/protocol.py   | 458 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 525 insertions(+)
> >  create mode 100644 python/tests/null_proto.py
> >  create mode 100644 python/tests/protocol.py
> >
> > diff --git a/python/tests/null_proto.py b/python/tests/null_proto.py
> > new file mode 100644
> > index 00000000000..c697efc0001
> > --- /dev/null
> > +++ b/python/tests/null_proto.py
> > @@ -0,0 +1,67 @@
> > +import asyncio
> > +
> > +from qemu.aqmp.protocol import AsyncProtocol
> > +
> > +
> > +class NullProtocol(AsyncProtocol[None]):
> > +    """
> > +    NullProtocol is a test mockup of an AsyncProtocol implementation.
> > +
> > +    It adds a fake_session instance variable that enables a code path
> > +    that bypasses the actual connection logic, but still allows the
> > +    reader/writers to start.
> > +
> > +    Because the message type is defined as None, an asyncio.Event named
> > +    'trigger_input' is created that prohibits the reader from
> > +    incessantly being able to yield None; this input can be poked to
> > +    simulate an incoming message.
> > +
> > +    For testing symmetry with do_recv, an interface is added to "send" a
> > +    Null message.
> > +
> > +    For testing purposes, a "simulate_disconnection" method is also
> > +    added which allows us to trigger a bottom half disconnect without
> > +    injecting any real errors into the reader/writer loops; in essence
> > +    it performs exactly half of what disconnect() normally does.
> > +    """
> > +    def __init__(self, name=None):
> > +        self.fake_session = False
> > +        self.trigger_input: asyncio.Event
> > +        super().__init__(name)
> > +
> > +    async def _establish_session(self):
> > +        self.trigger_input = asyncio.Event()
> > +        await super()._establish_session()
> > +
> > +    async def _do_accept(self, address, ssl=None):
> > +        if not self.fake_session:
> > +            await super()._do_accept(address, ssl)
> > +
> > +    async def _do_connect(self, address, ssl=None):
> > +        if not self.fake_session:
> > +            await super()._do_connect(address, ssl)
> > +
> > +    async def _do_recv(self) -> None:
> > +        await self.trigger_input.wait()
> > +        self.trigger_input.clear()
> > +
> > +    def _do_send(self, msg: None) -> None:
> > +        pass
> > +
> > +    async def send_msg(self) -> None:
> > +        await self._outgoing.put(None)
> > +
> > +    async def simulate_disconnect(self) -> None:
> > +        # Simulates a bottom half disconnect, e.g. schedules a
> > +        # disconnection but does not wait for it to complete. This is
> > +        # used to put the loop into the DISCONNECTING state without
> > +        # fully quiescing it back to IDLE; this is normally something
> > +        # you cannot coax AsyncProtocol to do on purpose, but it will be
> > +        # similar to what happens with an unhandled Exception in the
> > +        # reader/writer.
> > +        #
> > +        # Under normal circumstances, the library design requires you to
> > +        # await on disconnect(), which awaits the disconnect task and
> > +        # returns bottom half errors as a pre-condition to allowing the
> > +        # loop to return back to IDLE.
> > +        self._schedule_disconnect()
>
> Nitpick: Any reason for not using a docstring? I wouldn't mind if it was
> a docstring instead. ;)
>
>
Nope. I've changed it.


> > diff --git a/python/tests/protocol.py b/python/tests/protocol.py
> > new file mode 100644
> > index 00000000000..2374d01365e
> > --- /dev/null
> > +++ b/python/tests/protocol.py
> > @@ -0,0 +1,458 @@
> > +import asyncio
> > +from contextlib import contextmanager
> > +import os
> > +import socket
> > +from tempfile import TemporaryDirectory
> > +
> > +import avocado
> > +
> > +from qemu.aqmp import ConnectError, Runstate
> > +from qemu.aqmp.protocol import StateError
> > +from qemu.aqmp.util import asyncio_run, create_task
>
> Nitpick: Maybe an isort?
>
>
It actually is isorted, just using some different settings than you're used
to seeing in Avocado.


> > +# An Avocado bug prevents us from defining this testing class in-line
> here:
> > +from null_proto import NullProtocol
>
> Is this what you are looking for?
>
> https://github.com/avocado-framework/avocado/pull/4764
>
> If not, can you point to the right issue, please?
>
>
That's the one. I don't have time to update to v90 right now, so I'm going
to leave it as a todo item, please forgive me! I'll update the comment,
though.


> > +@contextmanager
> > +def jammed_socket():
> > +    # This method opens up a random TCP port on localhost, then jams it.
> > +    socks = []
> > +
> > +    try:
> > +        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> > +        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
> > +        sock.bind(('127.0.0.1', 0))
> > +        sock.listen(1)
> > +        address = sock.getsockname()
> > +
> > +        socks.append(sock)
> > +
> > +        # I don't *fully* understand why, but it takes *two* un-accepted
> > +        # connections to start jamming the socket.
> > +        for _ in range(2):
> > +            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> > +            sock.connect(address)
> > +            socks.append(sock)
> > +
> > +        yield address
> > +
> > +    finally:
> > +        for sock in socks:
> > +            sock.close()
> > +
> > +
> > +class Smoke(avocado.Test):
> > +
> > +    def setUp(self):
> > +        self.proto = NullProtocol()
> > +
> > +    def test__repr__(self):
> > +        self.assertEqual(
> > +            repr(self.proto),
> > +            "<NullProtocol runstate=IDLE>"
> > +        )
> > +
> > +    def testRunstate(self):
> > +        self.assertEqual(
> > +            self.proto.runstate,
> > +            Runstate.IDLE
> > +        )
> > +
> > +    def testDefaultName(self):
> > +        self.assertEqual(
> > +            self.proto.name,
> > +            None
> > +        )
> > +
> > +    def testLogger(self):
> > +        self.assertEqual(
> > +            self.proto.logger.name,
> > +            'qemu.aqmp.protocol'
> > +        )
> > +
> > +    def testName(self):
> > +        self.proto = NullProtocol('Steve')
> > +
> > +        self.assertEqual(
> > +            self.proto.name,
> > +            'Steve'
> > +        )
> > +
> > +        self.assertEqual(
> > +            self.proto.logger.name,
> > +            'qemu.aqmp.protocol.Steve'
> > +        )
> > +
> > +        self.assertEqual(
> > +            repr(self.proto),
> > +            "<NullProtocol name='Steve' runstate=IDLE>"
> > +        )
> > +
> > +
> > +class TestBase(avocado.Test):
> > +
> > +    def setUp(self):
> > +        self.proto = NullProtocol(type(self).__name__)
> > +        self.assertEqual(self.proto.runstate, Runstate.IDLE)
> > +        self.runstate_watcher = None
> > +
> > +    def tearDown(self):
> > +        self.assertEqual(self.proto.runstate, Runstate.IDLE)
> > +
> > +    async def _asyncSetUp(self):
> > +        pass
> > +
> > +    async def _asyncTearDown(self):
> > +        if self.runstate_watcher:
> > +            await self.runstate_watcher
> > +
> > +    def _asyncRunner(self, test_coroutine):
> > +        async def coroutine():
> > +            await self._asyncSetUp()
> > +            await test_coroutine
> > +            await self._asyncTearDown()
> > +
> > +        asyncio_run(coroutine(), debug=True)
> > +
> > +    # Definitions
> > +
> > +    # The states we expect a "bad" connect/accept attempt to transition
> through
> > +    BAD_CONNECTION_STATES = (
> > +        Runstate.CONNECTING,
> > +        Runstate.DISCONNECTING,
> > +        Runstate.IDLE,
> > +    )
> > +
> > +    # The states we expect a "good" session to transition through
> > +    GOOD_CONNECTION_STATES = (
> > +        Runstate.CONNECTING,
> > +        Runstate.RUNNING,
> > +        Runstate.DISCONNECTING,
> > +        Runstate.IDLE,
> > +    )
> > +
> > +    # Helpers
> > +
> > +    async def _watch_runstates(self, *states):
> > +        # This launches a task alongside most tests below to confirm
> that the
> > +        # sequence of runstate changes is exactly as anticipated.
> > +
> > +        async def _watcher():
> > +            for state in states:
> > +                new_state = await self.proto.runstate_changed()
> > +                self.assertEqual(
> > +                    new_state,
> > +                    state,
> > +                    msg=f"Expected state '{state.name}'",
> > +                )
> > +
> > +        self.runstate_watcher = create_task(_watcher())
> > +        # Kick the loop and force the task to block on the event.
> > +        await asyncio.sleep(0)
> > +
> > +
> > +class State(TestBase):
> > +
> > +    async def testSuperfluousDisconnect_(self):
> > +        await self._watch_runstates(
> > +            Runstate.DISCONNECTING,
> > +            Runstate.IDLE,
> > +        )
> > +        await self.proto.disconnect()
> > +
> > +    def testSuperfluousDisconnect(self):
> > +        self._asyncRunner(self.testSuperfluousDisconnect_())
> > +
> > +
> > +class Connect(TestBase):
> > +
> > +    async def _bad_connection(self, family: str):
> > +        assert family in ('INET', 'UNIX')
> > +
> > +        if family == 'INET':
> > +            await self.proto.connect(('127.0.0.1', 0))
> > +        elif family == 'UNIX':
> > +            await self.proto.connect('/dev/null')
> > +
> > +    async def _hanging_connection(self):
> > +        with jammed_socket() as addr:
> > +            await self.proto.connect(addr)
> > +
> > +    async def _bad_connection_test(self, family: str):
> > +        await self._watch_runstates(*self.BAD_CONNECTION_STATES)
> > +
> > +        with self.assertRaises(ConnectError) as context:
> > +            await self._bad_connection(family)
> > +
> > +        self.assertIsInstance(context.exception.exc, OSError)
> > +        self.assertEqual(
> > +            context.exception.error_message,
> > +            "Failed to establish connection"
> > +        )
> > +
> > +    def testBadINET(self):
> > +        self._asyncRunner(self._bad_connection_test('INET'))
> > +        # self.assertIsInstance(err.exc, ConnectionRefusedError)
> > +
> > +    def testBadUNIX(self):
> > +        self._asyncRunner(self._bad_connection_test('UNIX'))
> > +        # self.assertIsInstance(err.exc, ConnectionRefusedError)
> > +
> > +    async def testCancellation_(self):
> > +        # Note that accept() cannot be cancelled outright, as it isn't
> a task.
> > +        # However, we can wrap it in a task and cancel *that*.
> > +        await self._watch_runstates(*self.BAD_CONNECTION_STATES)
> > +        task = run_as_task(self._hanging_connection(),
> allow_cancellation=True)
> > +
> > +        state = await self.proto.runstate_changed()
> > +        self.assertEqual(state, Runstate.CONNECTING)
> > +
> > +        # This is insider baseball, but the connection attempt has
> > +        # yielded *just* before the actual connection attempt, so kick
> > +        # the loop to make sure it's truly wedged.
> > +        await asyncio.sleep(0)
> > +
> > +        task.cancel()
> > +        await task
> > +
> > +    def testCancellation(self):
> > +        self._asyncRunner(self.testCancellation_())
> > +
> > +    async def testTimeout_(self):
> > +        await self._watch_runstates(*self.BAD_CONNECTION_STATES)
> > +        task = run_as_task(self._hanging_connection())
> > +
> > +        # More insider baseball: to improve the speed of this test while
> > +        # guaranteeing that the connection even gets a chance to start,
> > +        # verify that the connection hangs *first*, then await the
> > +        # result of the task with a nearly-zero timeout.
> > +
> > +        state = await self.proto.runstate_changed()
> > +        self.assertEqual(state, Runstate.CONNECTING)
> > +        await asyncio.sleep(0)
> > +
> > +        with self.assertRaises(asyncio.TimeoutError):
> > +            await asyncio.wait_for(task, timeout=0)
> > +
> > +    def testTimeout(self):
> > +        self._asyncRunner(self.testTimeout_())
> > +
> > +    async def testRequire_(self):
> > +        await self._watch_runstates(*self.BAD_CONNECTION_STATES)
> > +        task = run_as_task(self._hanging_connection(),
> allow_cancellation=True)
> > +
> > +        state = await self.proto.runstate_changed()
> > +        self.assertEqual(state, Runstate.CONNECTING)
> > +
> > +        with self.assertRaises(StateError) as context:
> > +            await self._bad_connection('UNIX')
> > +
> > +        self.assertEqual(
> > +            context.exception.error_message,
> > +            "NullProtocol is currently connecting."
> > +        )
> > +        self.assertEqual(context.exception.state, Runstate.CONNECTING)
> > +        self.assertEqual(context.exception.required, Runstate.IDLE)
> > +
> > +        task.cancel()
> > +        await task
> > +
> > +    def testRequire(self):
> > +        self._asyncRunner(self.testRequire_())
> > +
> > +    async def testImplicitRunstateInit_(self):
> > +        # This tests what happens if we do not wait on the
> > +        # runstate until AFTER we connect, i.e., connect()/accept()
> > +        # themselves initialize the runstate event. All of the above
> > +        # tests force the initialization by waiting on the runstate
> > +        # *first*.
> > +        task = run_as_task(self._hanging_connection(),
> allow_cancellation=True)
> > +
> > +        # Kick the loop to coerce the state change
> > +        await asyncio.sleep(0)
> > +        assert self.proto.runstate == Runstate.CONNECTING
> > +
> > +        # We already missed the transition to CONNECTING
> > +        await self._watch_runstates(Runstate.DISCONNECTING,
> Runstate.IDLE)
> > +
> > +        task.cancel()
> > +        await task
> > +
> > +    def testImplicitRunstateInit(self):
> > +        self._asyncRunner(self.testImplicitRunstateInit_())
> > +
> > +
> > +class Accept(Connect):
> > +
> > +    async def _bad_connection(self, family: str):
> > +        assert family in ('INET', 'UNIX')
> > +
> > +        if family == 'INET':
> > +            await self.proto.accept(('example.com', 1))
> > +        elif family == 'UNIX':
> > +            await self.proto.accept('/dev/null')
> > +
> > +    async def _hanging_connection(self):
> > +        with TemporaryDirectory(suffix='.aqmp') as tmpdir:
> > +            sock = os.path.join(tmpdir, type(self.proto).__name__ +
> ".sock")
> > +            await self.proto.accept(sock)
> > +
> > +
> > +class FakeSession(TestBase):
> > +
> > +    def setUp(self):
> > +        super().setUp()
> > +        self.proto.fake_session = True
> > +
> > +    async def _asyncSetUp(self):
> > +        await super()._asyncSetUp()
> > +        await self._watch_runstates(*self.GOOD_CONNECTION_STATES)
> > +
> > +    async def _asyncTearDown(self):
> > +        await self.proto.disconnect()
> > +        await super()._asyncTearDown()
> > +
> > +    ####
> > +
> > +    async def testFakeConnect_(self):
> > +        await self.proto.connect('/not/a/real/path')
> > +        self.assertEqual(self.proto.runstate, Runstate.RUNNING)
> > +
> > +    def testFakeConnect(self):
> > +        """Test the full state lifecycle (via connect) with a no-op
> session."""
> > +        self._asyncRunner(self.testFakeConnect_())
> > +
> > +    async def testFakeAccept_(self):
> > +        await self.proto.accept('/not/a/real/path')
> > +        self.assertEqual(self.proto.runstate, Runstate.RUNNING)
> > +
> > +    def testFakeAccept(self):
> > +        """Test the full state lifecycle (via accept) with a no-op
> session."""
> > +        self._asyncRunner(self.testFakeAccept_())
> > +
> > +    async def testFakeRecv_(self):
> > +        await self.proto.accept('/not/a/real/path')
> > +
> > +        logname = self.proto.logger.name
> > +        with self.assertLogs(logname, level='DEBUG') as context:
> > +            self.proto.trigger_input.set()
> > +            self.proto.trigger_input.clear()
> > +            await asyncio.sleep(0)  # Kick reader.
> > +
> > +        self.assertEqual(
> > +            context.output,
> > +            [f"DEBUG:{logname}:<-- None"],
> > +        )
> > +
> > +    def testFakeRecv(self):
> > +        """Test receiving a fake/null message."""
> > +        self._asyncRunner(self.testFakeRecv_())
> > +
> > +    async def testFakeSend_(self):
> > +        await self.proto.accept('/not/a/real/path')
> > +
> > +        logname = self.proto.logger.name
> > +        with self.assertLogs(logname, level='DEBUG') as context:
> > +            # Cheat: Send a Null message to nobody.
> > +            await self.proto.send_msg()
> > +            # Kick writer; awaiting on a queue.put isn't sufficient to
> yield.
> > +            await asyncio.sleep(0)
> > +
> > +        self.assertEqual(
> > +            context.output,
> > +            [f"DEBUG:{logname}:--> None"],
> > +        )
> > +
> > +    def testFakeSend(self):
> > +        """Test sending a fake/null message."""
> > +        self._asyncRunner(self.testFakeSend_())
> > +
> > +    async def _prod_session_api(
> > +            self,
> > +            current_state: Runstate,
> > +            error_message: str,
> > +            accept: bool = True
> > +    ):
> > +        with self.assertRaises(StateError) as context:
> > +            if accept:
> > +                await self.proto.accept('/not/a/real/path')
> > +            else:
> > +                await self.proto.connect('/not/a/real/path')
> > +
> > +        self.assertEqual(context.exception.error_message, error_message)
> > +        self.assertEqual(context.exception.state, current_state)
> > +        self.assertEqual(context.exception.required, Runstate.IDLE)
> > +
> > +    async def testAcceptRequireRunning_(self):
> > +        await self.proto.accept('/not/a/real/path')
> > +
> > +        await self._prod_session_api(
> > +            Runstate.RUNNING,
> > +            "NullProtocol is already connected and running.",
> > +            accept=True,
> > +        )
> > +
> > +    def testAcceptRequireRunning(self):
> > +        """Test that accept() cannot be called when Runstate=RUNNING"""
> > +        self._asyncRunner(self.testAcceptRequireRunning_())
> > +
> > +    async def testConnectRequireRunning_(self):
> > +        await self.proto.accept('/not/a/real/path')
> > +
> > +        await self._prod_session_api(
> > +            Runstate.RUNNING,
> > +            "NullProtocol is already connected and running.",
> > +            accept=False,
> > +        )
> > +
> > +    def testConnectRequireRunning(self):
> > +        """Test that connect() cannot be called when Runstate=RUNNING"""
> > +        self._asyncRunner(self.testConnectRequireRunning_())
> > +
> > +    async def testAcceptRequireDisconnecting_(self):
> > +        await self.proto.accept('/not/a/real/path')
> > +
> > +        # Cheat: force a disconnect.
> > +        await self.proto.simulate_disconnect()
> > +
> > +        await self._prod_session_api(
> > +            Runstate.DISCONNECTING,
> > +            ("NullProtocol is disconnecting."
> > +             " Call disconnect() to return to IDLE state."),
> > +            accept=True,
> > +        )
> > +
> > +    def testAcceptRequireDisconnecting(self):
> > +        """Test that accept() cannot be called when
> Runstate=DISCONNECTING"""
> > +        self._asyncRunner(self.testAcceptRequireDisconnecting_())
> > +
> > +    async def testConnectRequireDisconnecting_(self):
> > +        await self.proto.accept('/not/a/real/path')
> > +
> > +        # Cheat: force a disconnect.
> > +        await self.proto.simulate_disconnect()
> > +
> > +        await self._prod_session_api(
> > +            Runstate.DISCONNECTING,
> > +            ("NullProtocol is disconnecting."
> > +             " Call disconnect() to return to IDLE state."),
> > +            accept=False,
> > +        )
> > +
> > +    def testConnectRequireDisconnecting(self):
> > +        """Test that connect() cannot be called when
> Runstate=DISCONNECTING"""
> > +        self._asyncRunner(self.testConnectRequireDisconnecting_())
> > --
> > 2.31.1
>
> Besides that, I just would like to bring to the table that Avocado has
> now a basic support for coroutines as tests that might help here. IIUC,
> some of the boilerplate code (and duplicated methods) could be removed
> with this:
>
> https://github.com/avocado-framework/avocado/pull/4788
>
> In any case, I understand if the latest version is not an option here,
> so:
>
>
It's an option, it's time that is the harsh master.


> Reviewed-by: Beraldo Leal <bleal@redhat.com>
>
>
Thanks! I updated a few bits and pieces and added the other items to a list
of things to do "later".


> Thanks,
> --
> Beraldo
>
>
--js

--00000000000028c82805c896d905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 20, 2021 at 4:34 PM Beral=
do Leal &lt;<a href=3D"mailto:bleal@redhat.com">bleal@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Jul=
 16, 2021 at 08:32:53PM -0400, John Snow wrote:<br>
&gt; This tests most of protocol.py -- From a hacked up Coverage.py run, it=
&#39;s<br>
&gt; at about 86%. There&#39;s a few error cases that aren&#39;t very well =
tested<br>
&gt; yet, they&#39;re hard to induce artificially so far. I&#39;m working o=
n it.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/tests/null_proto.py |=C2=A0 67 ++++++<br>
&gt;=C2=A0 python/tests/protocol.py=C2=A0 =C2=A0| 458 +++++++++++++++++++++=
++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 525 insertions(+)<br>
&gt;=C2=A0 create mode 100644 python/tests/null_proto.py<br>
&gt;=C2=A0 create mode 100644 python/tests/protocol.py<br>
&gt; <br>
&gt; diff --git a/python/tests/null_proto.py b/python/tests/null_proto.py<b=
r>
&gt; new file mode 100644<br>
&gt; index 00000000000..c697efc0001<br>
&gt; --- /dev/null<br>
&gt; +++ b/python/tests/null_proto.py<br>
&gt; @@ -0,0 +1,67 @@<br>
&gt; +import asyncio<br>
&gt; +<br>
&gt; +from qemu.aqmp.protocol import AsyncProtocol<br>
&gt; +<br>
&gt; +<br>
&gt; +class NullProtocol(AsyncProtocol[None]):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 NullProtocol is a test mockup of an AsyncProtocol imple=
mentation.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 It adds a fake_session instance variable that enables a=
 code path<br>
&gt; +=C2=A0 =C2=A0 that bypasses the actual connection logic, but still al=
lows the<br>
&gt; +=C2=A0 =C2=A0 reader/writers to start.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Because the message type is defined as None, an asyncio=
.Event named<br>
&gt; +=C2=A0 =C2=A0 &#39;trigger_input&#39; is created that prohibits the r=
eader from<br>
&gt; +=C2=A0 =C2=A0 incessantly being able to yield None; this input can be=
 poked to<br>
&gt; +=C2=A0 =C2=A0 simulate an incoming message.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 For testing symmetry with do_recv, an interface is adde=
d to &quot;send&quot; a<br>
&gt; +=C2=A0 =C2=A0 Null message.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 For testing purposes, a &quot;simulate_disconnection&qu=
ot; method is also<br>
&gt; +=C2=A0 =C2=A0 added which allows us to trigger a bottom half disconne=
ct without<br>
&gt; +=C2=A0 =C2=A0 injecting any real errors into the reader/writer loops;=
 in essence<br>
&gt; +=C2=A0 =C2=A0 it performs exactly half of what disconnect() normally =
does.<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, name=3DNone):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fake_session =3D False<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.trigger_input: asyncio.Event<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(name)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _establish_session(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.trigger_input =3D asyncio.Event()<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await super()._establish_session()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _do_accept(self, address, ssl=3DNone):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.fake_session:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await super()._do_accept(ad=
dress, ssl)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _do_connect(self, address, ssl=3DNone):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.fake_session:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await super()._do_connect(a=
ddress, ssl)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _do_recv(self) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.trigger_input.wait()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.trigger_input.clear()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def _do_send(self, msg: None) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def send_msg(self) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._outgoing.put(None)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def simulate_disconnect(self) -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Simulates a bottom half disconnect, e.g=
. schedules a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # disconnection but does not wait for it =
to complete. This is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # used to put the loop into the DISCONNEC=
TING state without<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # fully quiescing it back to IDLE; this i=
s normally something<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # you cannot coax AsyncProtocol to do on =
purpose, but it will be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # similar to what happens with an unhandl=
ed Exception in the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # reader/writer.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Under normal circumstances, the library=
 design requires you to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # await on disconnect(), which awaits the=
 disconnect task and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # returns bottom half errors as a pre-con=
dition to allowing the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # loop to return back to IDLE.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._schedule_disconnect()<br>
<br>
Nitpick: Any reason for not using a docstring? I wouldn&#39;t mind if it wa=
s<br>
a docstring instead. ;)<br>
<br></blockquote><div><br></div><div>Nope. I&#39;ve changed it.<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; diff --git a/python/tests/protocol.py b/python/tests/protocol.py<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..2374d01365e<br>
&gt; --- /dev/null<br>
&gt; +++ b/python/tests/protocol.py<br>
&gt; @@ -0,0 +1,458 @@<br>
&gt; +import asyncio<br>
&gt; +from contextlib import contextmanager<br>
&gt; +import os<br>
&gt; +import socket<br>
&gt; +from tempfile import TemporaryDirectory<br>
&gt; +<br>
&gt; +import avocado<br>
&gt; +<br>
&gt; +from qemu.aqmp import ConnectError, Runstate<br>
&gt; +from qemu.aqmp.protocol import StateError<br>
&gt; +from qemu.aqmp.util import asyncio_run, create_task<br>
<br>
Nitpick: Maybe an isort?<br>
<br></blockquote><div><br></div><div>It actually is isorted, just using som=
e different settings than you&#39;re used to seeing in Avocado.<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +# An Avocado bug prevents us from defining this testing class in-line=
 here:<br>
&gt; +from null_proto import NullProtocol<br>
<br>
Is this what you are looking for?<br>
<br>
<a href=3D"https://github.com/avocado-framework/avocado/pull/4764" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/avocado-framework/avocado/p=
ull/4764</a><br>
<br>
If not, can you point to the right issue, please?<br>
<br></blockquote><div><br></div><div>That&#39;s the one. I don&#39;t have t=
ime to update to v90 right now, so I&#39;m going to leave it as a todo item=
, please forgive me! I&#39;ll update the comment, though.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +@contextmanager<br>
&gt; +def jammed_socket():<br>
&gt; +=C2=A0 =C2=A0 # This method opens up a random TCP port on localhost, =
then jams it.<br>
&gt; +=C2=A0 =C2=A0 socks =3D []<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sock =3D socket.socket(socket.AF_INET, so=
cket.SOCK_STREAM)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sock.setsockopt(socket.SOL_SOCKET, socket=
.SO_REUSEADDR, 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sock.bind((&#39;127.0.0.1&#39;, 0))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sock.listen(1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 address =3D sock.getsockname()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 socks.append(sock)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # I don&#39;t *fully* understand why, but=
 it takes *two* un-accepted<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # connections to start jamming the socket=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for _ in range(2):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock =3D socket.socket(sock=
et.AF_INET, socket.SOCK_STREAM)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock.connect(address)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 socks.append(sock)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 yield address<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 finally:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for sock in socks:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock.close()<br>
&gt; +<br>
&gt; +<br>
&gt; +class Smoke(avocado.Test):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def setUp(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.proto =3D NullProtocol()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def test__repr__(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repr(self.proto),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;NullProtocol runs=
tate=3DIDLE&gt;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testRunstate(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.proto.runstate,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.IDLE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testDefaultName(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.prot=
o.name" rel=3D"noreferrer" target=3D"_blank">self.proto.name</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testLogger(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.prot=
o.logger.name" rel=3D"noreferrer" target=3D"_blank">self.proto.logger.name<=
/a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;qemu.aqmp.protocol&#39=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testName(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.proto =3D NullProtocol(&#39;Steve&#3=
9;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.prot=
o.name" rel=3D"noreferrer" target=3D"_blank">self.proto.name</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Steve&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.prot=
o.logger.name" rel=3D"noreferrer" target=3D"_blank">self.proto.logger.name<=
/a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;qemu.aqmp.protocol.Ste=
ve&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repr(self.proto),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;NullProtocol name=
=3D&#39;Steve&#39; runstate=3DIDLE&gt;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +<br>
&gt; +class TestBase(avocado.Test):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def setUp(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.proto =3D NullProtocol(type(self).__=
name__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(self.proto.runstate, Run=
state.IDLE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.runstate_watcher =3D None<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def tearDown(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(self.proto.runstate, Run=
state.IDLE)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _asyncSetUp(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _asyncTearDown(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.runstate_watcher:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.runstate_watcher=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def _asyncRunner(self, test_coroutine):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 async def coroutine():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._asyncSetUp()<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await test_coroutine<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._asyncTearDown()=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 asyncio_run(coroutine(), debug=3DTrue)<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Definitions<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # The states we expect a &quot;bad&quot; connect/accept=
 attempt to transition through<br>
&gt; +=C2=A0 =C2=A0 BAD_CONNECTION_STATES =3D (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.CONNECTING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.DISCONNECTING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.IDLE,<br>
&gt; +=C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # The states we expect a &quot;good&quot; session to tr=
ansition through<br>
&gt; +=C2=A0 =C2=A0 GOOD_CONNECTION_STATES =3D (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.CONNECTING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.RUNNING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.DISCONNECTING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.IDLE,<br>
&gt; +=C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Helpers<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _watch_runstates(self, *states):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This launches a task alongside most tes=
ts below to confirm that the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sequence of runstate changes is exactly=
 as anticipated.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 async def _watcher():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for state in states:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_state =3D=
 await self.proto.runstate_changed()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEq=
ual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 new_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 msg=3Df&quot;Expected state &#39;{<a href=3D"http://state.name" rel=3D"nor=
eferrer" target=3D"_blank">state.name</a>}&#39;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.runstate_watcher =3D create_task(_wa=
tcher())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Kick the loop and force the task to blo=
ck on the event.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await asyncio.sleep(0)<br>
&gt; +<br>
&gt; +<br>
&gt; +class State(TestBase):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testSuperfluousDisconnect_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._watch_runstates(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.DISCONNECTING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.IDLE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.disconnect()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testSuperfluousDisconnect(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testSuperfluousDis=
connect_())<br>
&gt; +<br>
&gt; +<br>
&gt; +class Connect(TestBase):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _bad_connection(self, family: str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert family in (&#39;INET&#39;, &#39;UN=
IX&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if family =3D=3D &#39;INET&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.connect((&=
#39;127.0.0.1&#39;, 0))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif family =3D=3D &#39;UNIX&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.connect(&#=
39;/dev/null&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _hanging_connection(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with jammed_socket() as addr:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.connect(ad=
dr)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _bad_connection_test(self, family: str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._watch_runstates(*self.BAD_CON=
NECTION_STATES)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertRaises(ConnectError) as c=
ontext:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._bad_connection(=
family)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsInstance(context.exception.e=
xc, OSError)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context.exception.error_mes=
sage,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Failed to establish c=
onnection&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testBadINET(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self._bad_connection_te=
st(&#39;INET&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # self.assertIsInstance(err.exc, Connecti=
onRefusedError)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testBadUNIX(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self._bad_connection_te=
st(&#39;UNIX&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # self.assertIsInstance(err.exc, Connecti=
onRefusedError)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testCancellation_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Note that accept() cannot be cancelled =
outright, as it isn&#39;t a task.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # However, we can wrap it in a task and c=
ancel *that*.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._watch_runstates(*self.BAD_CON=
NECTION_STATES)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 task =3D run_as_task(self._hanging_connec=
tion(), allow_cancellation=3DTrue)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 state =3D await self.proto.runstate_chang=
ed()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(state, Runstate.CONNECTI=
NG)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This is insider baseball, but the conne=
ction attempt has<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # yielded *just* before the actual connec=
tion attempt, so kick<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the loop to make sure it&#39;s truly we=
dged.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await asyncio.sleep(0)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 task.cancel()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await task<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testCancellation(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testCancellation_(=
))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testTimeout_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._watch_runstates(*self.BAD_CON=
NECTION_STATES)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 task =3D run_as_task(self._hanging_connec=
tion())<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # More insider baseball: to improve the s=
peed of this test while<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # guaranteeing that the connection even g=
ets a chance to start,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # verify that the connection hangs *first=
*, then await the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # result of the task with a nearly-zero t=
imeout.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 state =3D await self.proto.runstate_chang=
ed()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(state, Runstate.CONNECTI=
NG)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await asyncio.sleep(0)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertRaises(asyncio.TimeoutErr=
or):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await asyncio.wait_for(task=
, timeout=3D0)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testTimeout(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testTimeout_())<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testRequire_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._watch_runstates(*self.BAD_CON=
NECTION_STATES)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 task =3D run_as_task(self._hanging_connec=
tion(), allow_cancellation=3DTrue)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 state =3D await self.proto.runstate_chang=
ed()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(state, Runstate.CONNECTI=
NG)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertRaises(StateError) as con=
text:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._bad_connection(=
&#39;UNIX&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context.exception.error_mes=
sage,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;NullProtocol is curre=
ntly connecting.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(context.exception.state,=
 Runstate.CONNECTING)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(context.exception.requir=
ed, Runstate.IDLE)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 task.cancel()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await task<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testRequire(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testRequire_())<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testImplicitRunstateInit_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This tests what happens if we do not wa=
it on the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # runstate until AFTER we connect, i.e., =
connect()/accept()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # themselves initialize the runstate even=
t. All of the above<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # tests force the initialization by waiti=
ng on the runstate<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # *first*.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 task =3D run_as_task(self._hanging_connec=
tion(), allow_cancellation=3DTrue)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Kick the loop to coerce the state chang=
e<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await asyncio.sleep(0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self.proto.runstate =3D=3D Runstat=
e.CONNECTING<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We already missed the transition to CON=
NECTING<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._watch_runstates(Runstate.DISC=
ONNECTING, Runstate.IDLE)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 task.cancel()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await task<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testImplicitRunstateInit(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testImplicitRunsta=
teInit_())<br>
&gt; +<br>
&gt; +<br>
&gt; +class Accept(Connect):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _bad_connection(self, family: str):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert family in (&#39;INET&#39;, &#39;UN=
IX&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if family =3D=3D &#39;INET&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.accept((&#=
39;<a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">exam=
ple.com</a>&#39;, 1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif family =3D=3D &#39;UNIX&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.accept(&#3=
9;/dev/null&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _hanging_connection(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with TemporaryDirectory(suffix=3D&#39;.aq=
mp&#39;) as tmpdir:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock =3D os.path.join(tmpdi=
r, type(self.proto).__name__ + &quot;.sock&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.accept(soc=
k)<br>
&gt; +<br>
&gt; +<br>
&gt; +class FakeSession(TestBase):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def setUp(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().setUp()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.proto.fake_session =3D True<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _asyncSetUp(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await super()._asyncSetUp()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._watch_runstates(*self.GOOD_CO=
NNECTION_STATES)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _asyncTearDown(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.disconnect()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await super()._asyncTearDown()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ####<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testFakeConnect_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.connect(&#39;/not/a/real=
/path&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(self.proto.runstate, Run=
state.RUNNING)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testFakeConnect(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test the full state lif=
ecycle (via connect) with a no-op session.&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testFakeConnect_()=
)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testFakeAccept_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.accept(&#39;/not/a/real/=
path&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(self.proto.runstate, Run=
state.RUNNING)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testFakeAccept(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test the full state lif=
ecycle (via accept) with a no-op session.&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testFakeAccept_())=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testFakeRecv_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.accept(&#39;/not/a/real/=
path&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logname =3D <a href=3D"http://self.proto.=
logger.name" rel=3D"noreferrer" target=3D"_blank">self.proto.logger.name</a=
><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertLogs(logname, level=3D&#3=
9;DEBUG&#39;) as context:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.proto.trigger_input.se=
t()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.proto.trigger_input.cl=
ear()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await asyncio.sleep(0)=C2=
=A0 # Kick reader.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context.output,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [f&quot;DEBUG:{logname}:&lt=
;-- None&quot;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testFakeRecv(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test receiving a fake/n=
ull message.&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testFakeRecv_())<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testFakeSend_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.accept(&#39;/not/a/real/=
path&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logname =3D <a href=3D"http://self.proto.=
logger.name" rel=3D"noreferrer" target=3D"_blank">self.proto.logger.name</a=
><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertLogs(logname, level=3D&#3=
9;DEBUG&#39;) as context:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Cheat: Send a Null messag=
e to nobody.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.send_msg()=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Kick writer; awaiting on =
a queue.put isn&#39;t sufficient to yield.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await asyncio.sleep(0)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 context.output,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [f&quot;DEBUG:{logname}:--&=
gt; None&quot;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testFakeSend(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test sending a fake/nul=
l message.&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testFakeSend_())<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def _prod_session_api(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 current_state: Runstate,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: str,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accept: bool =3D True<br>
&gt; +=C2=A0 =C2=A0 ):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with self.assertRaises(StateError) as con=
text:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if accept:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.pr=
oto.accept(&#39;/not/a/real/path&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.pr=
oto.connect(&#39;/not/a/real/path&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(context.exception.error_=
message, error_message)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(context.exception.state,=
 current_state)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(context.exception.requir=
ed, Runstate.IDLE)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testAcceptRequireRunning_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.accept(&#39;/not/a/real/=
path&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._prod_session_api(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.RUNNING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;NullProtocol is alrea=
dy connected and running.&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accept=3DTrue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testAcceptRequireRunning(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test that accept() cann=
ot be called when Runstate=3DRUNNING&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testAcceptRequireR=
unning_())<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testConnectRequireRunning_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.accept(&#39;/not/a/real/=
path&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._prod_session_api(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.RUNNING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;NullProtocol is alrea=
dy connected and running.&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accept=3DFalse,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testConnectRequireRunning(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test that connect() can=
not be called when Runstate=3DRUNNING&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testConnectRequire=
Running_())<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testAcceptRequireDisconnecting_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.accept(&#39;/not/a/real/=
path&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Cheat: force a disconnect.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.simulate_disconnect()<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._prod_session_api(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.DISCONNECTING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;NullProtocol is disc=
onnecting.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; Call disconnec=
t() to return to IDLE state.&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accept=3DTrue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testAcceptRequireDisconnecting(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test that accept() cann=
ot be called when Runstate=3DDISCONNECTING&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testAcceptRequireD=
isconnecting_())<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 async def testConnectRequireDisconnecting_(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.accept(&#39;/not/a/real/=
path&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Cheat: force a disconnect.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self.proto.simulate_disconnect()<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 await self._prod_session_api(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Runstate.DISCONNECTING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;NullProtocol is disc=
onnecting.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; Call disconnec=
t() to return to IDLE state.&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accept=3DFalse,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def testConnectRequireDisconnecting(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test that connect() can=
not be called when Runstate=3DDISCONNECTING&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._asyncRunner(self.testConnectRequire=
Disconnecting_())<br>
&gt; -- <br>
&gt; 2.31.1<br>
<br>
Besides that, I just would like to bring to the table that Avocado has<br>
now a basic support for coroutines as tests that might help here. IIUC,<br>
some of the boilerplate code (and duplicated methods) could be removed<br>
with this:<br>
<br>
<a href=3D"https://github.com/avocado-framework/avocado/pull/4788" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/avocado-framework/avocado/p=
ull/4788</a><br>
<br>
In any case, I understand if the latest version is not an option here,<br>
so:<br>
<br></blockquote><div><br></div><div>It&#39;s an option, it&#39;s time that=
 is the harsh master.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Reviewed-by: Beraldo Leal &lt;<a href=3D"mailto:bleal@redhat.com" target=3D=
"_blank">bleal@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks! I updated a few bits and piece=
s and added the other items to a list of things to do &quot;later&quot;.<br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
--<br>
Beraldo<br>
<br></blockquote><div><br></div><div>--js <br></div></div></div>

--00000000000028c82805c896d905--


