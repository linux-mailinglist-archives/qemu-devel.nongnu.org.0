Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABA83D14CF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:05:41 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6FfA-0001Ax-4P
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m6Fdj-0000Sq-NM
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:04:11 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:43966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m6Fdg-000417-5X
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:04:11 -0400
Received: by mail-io1-xd30.google.com with SMTP id k16so3111577ios.10
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pQs/vC5dLuS0Beu6TzV0MZuyz2l+PQ49rgzavLAYBAU=;
 b=gxR8TQYjXeV2u2V5deoMBkRdWwmpdwqpZ88Mym/JaUiu1YlzaSoSl9MiDoe9Xf4Atr
 MyRfaXh6GwTB59ZivxTJpvj0+ruGRilqrlm8qzFAXGlrwsb53Mt4hY4601Ln4lF/Nn3E
 UTVsEHPLHgZyMpd0kZCZGSGpjb/8yXAsJShseybGcyOQi10/jebPgXQTuOXbobzvQnH4
 4FAVrCApZet+UV3XRw6NHyxxMsGbzRxSCLndwlrRTfcPlsEPD5DL1QYq7lXTI209eGno
 AWY93XRy56b++MqrCZb360IBfhjjdYknrAkCUzwLNLt8SVvlralH2V0q+XRuRHj8xprc
 BV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pQs/vC5dLuS0Beu6TzV0MZuyz2l+PQ49rgzavLAYBAU=;
 b=a7YtF0lzsEkXZPqissSwpeyVOpILiMeTIDhe/+bY0saqD6AVKO9StJ/iw0YYgLC3OK
 e20NNI3YdtMM1A1B5oeLs/zn2vMwPi4qij6vMZeFENcmyXuCPeXAgFfnZEVGOXaDgP7w
 i7mNj2nq4a22HbHQpdLmT2kwj8qcPa4ejTKFE0H9jtqTeSwwPqHX1ShSlse/+TaCTuqz
 MWRQ80bSUbzbncE2EV8oA2x81oL015E8LT2SF7pwE67OCeeNsK7avoIg7GGGW5JeUJ7o
 pPCJLgXpWHo+CkN1pDXcXEIYZEy2/BO+IXUX8hx2ZcOO7YJrsc4YKgDitbilvHd1kuWz
 N50w==
X-Gm-Message-State: AOAM532a75V4QofJBLvbNX0/9NteOZKG7Hc5+93oBaEsOFN7/g3vqbNN
 blTuvIodMmjEj7GXpu6NohGHm1IQ2wSPr2XguUQ=
X-Google-Smtp-Source: ABdhPJzg0yy4CfrWP0NA80FDw5pUfFt+3tR0GZ7w/kCj5SKMGS881G1Oc54P8j1/sXF1TyT1t1urTGamdwfM4DYQJMY=
X-Received: by 2002:a6b:1406:: with SMTP id 6mr27813910iou.25.1626887047073;
 Wed, 21 Jul 2021 10:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210717003253.457418-1-jsnow@redhat.com>
In-Reply-To: <20210717003253.457418-1-jsnow@redhat.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Wed, 21 Jul 2021 22:33:40 +0530
Message-ID: <CAN6ztm8Evb+848p0TYDn63cxAxQbJ0NcfkSaf9s70rfx9rA22w@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] python: introduce Asynchronous QMP package
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000087d8b805c7a52805"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd30.google.com
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
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000087d8b805c7a52805
Content-Type: text/plain; charset="UTF-8"

Hello all,

I recently rebased(incrementally) my TUI on this V2 patch and faced an
issue.
https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v3
I decided to rebase incrementally so that I can address some of the
comments posted
in my patch series. While testing out, the initial draft of TUI
which worked fine in the V1
version of AQMP failed in this version.

Disconnecting from a fully connected state doesn't exit cleanly.
---------------------------------------------------------------------------------
To reproduce the issue:
1) Initiate a QMP server
2) Connect the TUI to the server using aqmp-tui localhost:1234 --log-file
log.txt
3) Once the TUI is connected and running, press 'Esc' to exit the app. This
should result
in the following exception.
--------------------------------------------------------------------------------------------------------------------------------------------
Transitioning from 'Runstate.IDLE' to 'Runstate.CONNECTING'.
Connecting to ('localhost', 1234) ...
Connected.
Awaiting greeting ...
Response: {
  "QMP": {
    .......... Skipping
  }
}
Negotiating capabilities ...
Request: {
  "execute": "qmp_capabilities",
    .......... Skipping
  }
}
Response: {
  "return": {}
}
Transitioning from 'Runstate.CONNECTING' to 'Runstate.RUNNING'.
Transitioning from 'Runstate.RUNNING' to 'Runstate.DISCONNECTING'.
Scheduling disconnect.
Draining the outbound queue ...
Flushing the StreamWriter ...
Cancelling writer task ...
Task.Writer: cancelled.
Task.Writer: exiting.
Cancelling reader task ...
Task.Reader: cancelled.
Task.Reader: exiting.
Closing StreamWriter.
Waiting for StreamWriter to close ...
QMP Disconnected.
Transitioning from 'Runstate.DISCONNECTING' to 'Runstate.IDLE'.
_kill_app: Connection lost
Connection lost
  | Traceback (most recent call last):
  |   File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py",
line 246, in run
  |     main_loop.run()
  |   File
"/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
line 287, in run
  |     self._run()
  |   File
"/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
line 385, in _run
  |     self.event_loop.run()
  |   File
"/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_loop.py",
line 1494, in run
  |     reraise(*exc_info)
  |   File
"/home/niteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/compat.py",
line 58, in reraise
  |     raise value
  |   File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py",
line 206, in _kill_app
  |     raise err
  |   File "/home/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py",
line 201, in _kill_app
  |     await self.disconnect()
  |   File "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py",
line 303, in disconnect
  |     await self._wait_disconnect()
  |   File "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py",
line 573, in _wait_disconnect
  |     await self._dc_task
  |   File "/home/niteesh/development/qemu/python/qemu/aqmp/qmp_client.py",
line 316, in _bh_disconnect
  |     await super()._bh_disconnect()
  |   File "/home/niteesh/development/qemu/python/qemu/aqmp/protocol.py",
line 644, in _bh_disconnect
  |     await wait_closed(self._writer)
  |   File "/home/niteesh/development/qemu/python/qemu/aqmp/util.py", line
137, in wait_closed
  |     await flush(writer)
  |   File "/home/niteesh/development/qemu/python/qemu/aqmp/util.py", line
49, in flush
  |     await writer.drain()
  |   File "/usr/lib/python3.6/asyncio/streams.py", line 339, in drain
  |     yield from self._protocol._drain_helper()
  |   File "/usr/lib/python3.6/asyncio/streams.py", line 210, in
_drain_helper
  |     raise ConnectionResetError('Connection lost')
  | ConnectionResetError: Connection lost
--------------------------------------------------------------------------------------------------------------------------------------------


On Sat, Jul 17, 2021 at 6:03 AM John Snow <jsnow@redhat.com> wrote:

> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-async-qmp-aqmp
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/338508045
> Docs: https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html
>
> Hi!
>
> This patch series adds an Asynchronous QMP package to the Python
> library. It offers a few improvements over the previous library:
>
> - out-of-band support
> - true asynchronous event support
> - avoids undocumented interfaces abusing non-blocking sockets
> - unit tests!
> - documentation!
>
> This library serves as the basis for a new qmp-shell program that will
> offer improved reconnection support, true asynchronous display of
> events, VM and job status update notifiers, and so on.
>
> My intent is to eventually publish this library directly to PyPI as a
> standalone package. I would like to phase out our usage of the old QMP
> library over time; eventually replacing it entirely with this one.
>
> This series looks big by line count, but it's *mostly*
> docstrings. Seriously!
>
> This package has *no* external dependencies whatsoever.
>
> Notes & Design
> ==============
>
> Here are some notes on the design of how the library works, to serve as
> a primer for review; however I also **highly recommend** browsing the
> generated Sphinx documentation for this series.
>
> Here's that link again:
> https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html
>
> The core machinery is split between the AsyncProtocol and QMP
> classes. AsyncProtocol provides the generic machinery, while QMP
> provides the QMP-specific details.
>
> The design uses two independent coroutines that act as the "bottom
> half", a writer task and a reader task. These tasks run for the duration
> of the connection and independently send and receive messages,
> respectively.
>
> A third task, disconnect, is scheduled asynchronously whenever an
> unrecoverable error occurs and facilitates coalescing of the other two
> tasks.
>
> This diagram for how execute() operates may be helpful for understanding
> how AsyncProtocol is laid out. The arrows indicate the direction of a
> QMP message; the long horizontal dash indicates the separation between
> the upper and lower half of the event loop. The queue mechanisms between
> both dashes serve as the intermediaries between the upper and lower
> half.
>
>                        +---------+
>                        | caller  |
>                        +---------+
>                            ^ |
>                            | v
>                        +---------+
>      +---------------> |execute()| -----------+
>      |                 +---------+            |
>      |                                        |
> [-----------------------------------------------------------]
>      |                                        |
>      |                                        v
> +----+------+    +----------------+    +------+-------+
> | ExecQueue |    | EventListeners |    |Outbound Queue|
> +----+------+    +----+-----------+    +------+-------+
>      ^                ^                       |
>      |                |                       |
> [-----------------------------------------------------------]
>      |                |                       |
>      |                |                       v
>   +--+----------------+---+       +-----------+-----------+
>   | Reader Task/Coroutine |       | Writer Task/Coroutine |
>   +-----------+-----------+       +-----------+-----------+
>               ^                               |
>               |                               v
>         +-----+------+                  +-----+------+
>         |StreamReader|                  |StreamWriter|
>         +------------+                  +------------+
>
> The caller will invoke execute(), which in turn will deposit a message
> in the outbound send queue. This will wake up the writer task, which
> well send the message over the wire.
>
> The execute() method will then yield to wait for a reply delivered to an
> execution queue created solely for that execute statement.
>
> When a message arrives, the Reader task will unblock and route the
> message either to the EventListener subsystem, or place it in the
> appropriate pending execution queue.
>
> Once a message is placed in the pending execution queue, execute() will
> unblock and the execution will conclude, returning the result of the RPC
> call to the caller.
>
> Patch Layout
> ============
>
> Patches 1-4   add tiny pre-requisites, utilities, etc.
> Patches 5-12  add a generic async message-based protocol class,
>               AsyncProtocol. They are split fairly small and should
>               be reasonably self-contained.
> Patches 13-15 check in more QMP-centric components.
> Patches 16-21 add qmp_client.py, with a new 'QMPClient()' class.
>               They're split into reasonably tiny pieces here.
> Patches 22-23 add a few finishing touches, they are small patches.
> Patch 24      adds unit tests. They're maybe a little messy yet, but
>               they've been quite helpful to me so far. Coverage of
>               protocol.py is at about 86%.
>
> Future Work
> ===========
>
> These items are in progress:
>
> - A synchronous QMP wrapper that allows this library to be easily used
>   from non-async code; this will also allow me to prove it works well by
>   demoing its replacement throughout iotests. I have all of iotests
>   passing locally, but I am still seeing some failures on gitlab CI I
>   need to diagnose, possibly a race condition somewhere.
>
> - A QMP server class; to facilitate writing of unit tests. It's done,
>   but needs some polish and tests.
>
> - More unit tests for qmp_client.py, qmp_server.py and other modules.
>
> Changelog
> =========
>
> V2:
>
> Renamed classes/methods:
>
> - Renamed qmp_protocol.py to qmp_client.py
> - Renamed 'QMP' class to 'QMPClient'
> - Renamed _begin_new_session() to _establish_session()
> - Split _establish_connection() out from _new_session().
> - Removed _results() method
>
> Bugfixes:
>
> - Suppress duplicate Exceptions when attempting to drain the
>   StreamWriter
> - Delay initialization of asyncio.Queue and asyncio.Event variables to
>   _new_session or later -- they must not be created outside of the loop,
>   even if they are not async functions.
> - Rework runstate_changed events to guarantee visibility of events to
>   waiters
> - Improve connect()/accept() cleanup to work with
>   asyncio.CancelledError, asyncio.TimeoutError
> - No-argument form of Message() now succeeds properly.
> - flush utility will correctly yield when data is below the "high water
>   mark", giving the stream a chance to actually flush.
> - Increase read buffer size to accommodate query-qmp-schema (Thanks
>   Niteesh)
>
> Ugly bits from V1 removed:
>
> - Remove tertiary filtering from EventListener (for now), accompanying
>   documentation removed from events.py
> - Use asyncio.wait() instead of custom wait_task_done()
> - MultiException is removed in favor of just raising the first Exception
>   that occurs in the bottom half; other Exceptions if any are logged
>   instead.
>
> Improvements:
>
> - QMPClient now allows ID-less execution statements via the _raw()
>   interface.
> - Add tests that grant ~86% coverage of protocol.py to the avocado test
>   suite.
> - Removed 'force' parameter from _bh_disconnect; the disconnection
>   routine determines for itself if we are in the error pathway or not
>   instead now.  This removes any chance of duplicate calls to
>   _schedule_disconnect accidentally dropping the 'force' setting.
>
> Debugging/Testing changes:
>
> - Add debug: bool parameter to asyncio_run utility wrapper
> - Improve error messages for '@require' decorator
> - Add debugging message for state change events
> - Avoid flushing the StreamWriter if we don't have one (This
>   circumstance only arises in testing, but it's helpful.)
> - Improved __repr__ method for AsyncProtocol, and removed __str__
>   method.  enforcing eval(__repr__(x)) == x does not make sense for
>   AsyncProtocol.
> - Misc logging message changes
> - Add a suite of fancy Task debugging utilities.
> - Most tracebacks now log at the DEBUG level instead of
>   CRITICAL/ERROR/WARNING; In those error cases, a one-line summary is
>   logged instead.
>
> Misc. aesthetic changes:
>
> - Misc docstring fixes, whitespace, etc.
> - Reordered the definition of some methods to try and keep similar
>   methods near each other (Moved _cleanup near _bh_disconnect in
>   QMPClient.)
>
> ~ Shucks Howdy, Gee Golly!
>
> John Snow (24):
>   python/aqmp: add asynchronous QMP (AQMP) subpackage
>   python/aqmp: add error classes
>   python/pylint: Add exception for TypeVar names ('T')
>   python/aqmp: add asyncio compatibility wrappers
>   python/aqmp: add generic async message-based protocol support
>   python/aqmp: add runstate state machine to AsyncProtocol
>   python/aqmp: Add logging utility helpers
>   python/aqmp: add logging to AsyncProtocol
>   python/aqmp: add AsyncProtocol.accept() method
>   python/aqmp: add configurable read buffer limit
>   python/aqmp: add _cb_inbound and _cb_inbound logging hooks
>   python/aqmp: add AsyncProtocol._readline() method
>   python/aqmp: add QMP Message format
>   python/aqmp: add well-known QMP object models
>   python/aqmp: add QMP event support
>   python/pylint: disable too-many-function-args
>   python/aqmp: add QMP protocol support
>   python/pylint: disable no-member check
>   python/aqmp: Add message routing to QMP protocol
>   python/aqmp: add execute() interfaces
>   python/aqmp: add _raw() execution interface
>   python/aqmp: add asyncio_run compatibility wrapper
>   python/aqmp: add scary message
>   python/aqmp: add AsyncProtocol unit tests
>
>  python/qemu/aqmp/__init__.py   |  58 +++
>  python/qemu/aqmp/error.py      |  50 ++
>  python/qemu/aqmp/events.py     | 706 ++++++++++++++++++++++++++
>  python/qemu/aqmp/message.py    | 209 ++++++++
>  python/qemu/aqmp/models.py     | 133 +++++
>  python/qemu/aqmp/protocol.py   | 882 +++++++++++++++++++++++++++++++++
>  python/qemu/aqmp/py.typed      |   0
>  python/qemu/aqmp/qmp_client.py | 621 +++++++++++++++++++++++
>  python/qemu/aqmp/util.py       | 207 ++++++++
>  python/setup.cfg               |   5 +-
>  python/tests/null_proto.py     |  67 +++
>  python/tests/protocol.py       | 458 +++++++++++++++++
>  12 files changed, 3395 insertions(+), 1 deletion(-)
>  create mode 100644 python/qemu/aqmp/__init__.py
>  create mode 100644 python/qemu/aqmp/error.py
>  create mode 100644 python/qemu/aqmp/events.py
>  create mode 100644 python/qemu/aqmp/message.py
>  create mode 100644 python/qemu/aqmp/models.py
>  create mode 100644 python/qemu/aqmp/protocol.py
>  create mode 100644 python/qemu/aqmp/py.typed
>  create mode 100644 python/qemu/aqmp/qmp_client.py
>  create mode 100644 python/qemu/aqmp/util.py
>  create mode 100644 python/tests/null_proto.py
>  create mode 100644 python/tests/protocol.py
>
> --
> 2.31.1
>
>
>

--00000000000087d8b805c7a52805
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hel=
lo all,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">I recently rebase=
d(incrementally) my TUI on this V2 patch and faced an issue.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><a href=3D"https://gitlab.com=
/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v3">https://gitlab.com/nitees=
h.gs/qemu/-/commits/aqmp-tui-prototype-v3</a><br>I decided to rebase increm=
entally so that I can address some of the comments posted</div><div class=
=3D"gmail_default" style=3D"font-size:small">in my patch series. While test=
ing out, the initial=C2=A0draft of TUI which=C2=A0worked fine in the V1</di=
v><div class=3D"gmail_default" style=3D"font-size:small">version of AQMP fa=
iled in this version.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Dis=
connecting from a fully connected state doesn&#39;t exit cleanly.</div><div=
 class=3D"gmail_default" style=3D"font-size:small">------------------------=
---------------------------------------------------------</div><div class=
=3D"gmail_default" style=3D"font-size:small">To reproduce the issue:</div><=
div class=3D"gmail_default" style=3D"font-size:small">1) Initiate a QMP ser=
ver</div><div class=3D"gmail_default" style=3D"font-size:small">2) Connect =
the TUI to the server using aqmp-tui=C2=A0localhost:1234 --log-file log.txt=
</div><div class=3D"gmail_default" style=3D"font-size:small">3) Once the TU=
I is connected and running, press &#39;Esc&#39; to exit the app. This shoul=
d result</div><div class=3D"gmail_default" style=3D"font-size:small">in the=
 following exception.</div><div class=3D"gmail_default" style=3D"font-size:=
small">--------------------------------------------------------------------=
------------------------------------------------------------------------</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Transitioning fro=
m &#39;Runstate.IDLE&#39; to &#39;Runstate.CONNECTING&#39;.<br>Connecting t=
o (&#39;localhost&#39;, 1234) ...<br>Connected.<br>Awaiting greeting ...<br=
>Response: {<br>=C2=A0 &quot;QMP&quot;: {<br>=C2=A0 =C2=A0 .......... Skipp=
ing<br>=C2=A0 }<br>}<br>Negotiating capabilities ...<br>Request: {<br>=C2=
=A0 &quot;execute&quot;: &quot;qmp_capabilities&quot;,<br>=C2=A0 =C2=A0 ...=
....... Skipping<br>=C2=A0 }<br>}<br>Response: {<br>=C2=A0 &quot;return&quo=
t;: {}<br>}<br>Transitioning from &#39;Runstate.CONNECTING&#39; to &#39;Run=
state.RUNNING&#39;.<br>Transitioning from &#39;Runstate.RUNNING&#39; to &#3=
9;Runstate.DISCONNECTING&#39;.<br>Scheduling disconnect.<br>Draining the ou=
tbound queue ...<br>Flushing the StreamWriter ...<br>Cancelling writer task=
 ...<br>Task.Writer: cancelled.<br>Task.Writer: exiting.<br>Cancelling read=
er task ...<br>Task.Reader: cancelled.<br>Task.Reader: exiting.<br>Closing =
StreamWriter.<br>Waiting for StreamWriter to close ...<br>QMP Disconnected.=
<br>Transitioning from &#39;Runstate.DISCONNECTING&#39; to &#39;Runstate.ID=
LE&#39;.<br>_kill_app: Connection lost<br>Connection lost<br>=C2=A0 | Trace=
back (most recent call last):<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/d=
evelopment/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, line 246, in run<br>=C2=
=A0 | =C2=A0 =C2=A0 main_loop.run()<br>=C2=A0 | =C2=A0 File &quot;/home/nit=
eesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main_l=
oop.py&quot;, line 287, in run<br>=C2=A0 | =C2=A0 =C2=A0 self._run()<br>=C2=
=A0 | =C2=A0 File &quot;/home/niteesh/development/qemu/python/.venv/lib/pyt=
hon3.6/site-packages/urwid/main_loop.py&quot;, line 385, in _run<br>=C2=A0 =
| =C2=A0 =C2=A0 self.event_loop.run()<br>=C2=A0 | =C2=A0 File &quot;/home/n=
iteesh/development/qemu/python/.venv/lib/python3.6/site-packages/urwid/main=
_loop.py&quot;, line 1494, in run<br>=C2=A0 | =C2=A0 =C2=A0 reraise(*exc_in=
fo)<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/development/qemu/python/.ve=
nv/lib/python3.6/site-packages/urwid/compat.py&quot;, line 58, in reraise<b=
r>=C2=A0 | =C2=A0 =C2=A0 raise value<br>=C2=A0 | =C2=A0 File &quot;/home/ni=
teesh/development/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, line 206, in _ki=
ll_app<br>=C2=A0 | =C2=A0 =C2=A0 raise err<br>=C2=A0 | =C2=A0 File &quot;/h=
ome/niteesh/development/qemu/python/qemu/aqmp/aqmp_tui.py&quot;, line 201, =
in _kill_app<br>=C2=A0 | =C2=A0 =C2=A0 await self.disconnect()<br>=C2=A0 | =
=C2=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqmp/protocol.=
py&quot;, line 303, in disconnect<br>=C2=A0 | =C2=A0 =C2=A0 await self._wai=
t_disconnect()<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh/development/qemu=
/python/qemu/aqmp/protocol.py&quot;, line 573, in _wait_disconnect<br>=C2=
=A0 | =C2=A0 =C2=A0 await self._dc_task<br>=C2=A0 | =C2=A0 File &quot;/home=
/niteesh/development/qemu/python/qemu/aqmp/qmp_client.py&quot;, line 316, i=
n _bh_disconnect<br>=C2=A0 | =C2=A0 =C2=A0 await super()._bh_disconnect()<b=
r>=C2=A0 | =C2=A0 File &quot;/home/niteesh/development/qemu/python/qemu/aqm=
p/protocol.py&quot;, line 644, in _bh_disconnect<br>=C2=A0 | =C2=A0 =C2=A0 =
await wait_closed(self._writer)<br>=C2=A0 | =C2=A0 File &quot;/home/niteesh=
/development/qemu/python/qemu/aqmp/util.py&quot;, line 137, in wait_closed<=
br>=C2=A0 | =C2=A0 =C2=A0 await flush(writer)<br>=C2=A0 | =C2=A0 File &quot=
;/home/niteesh/development/qemu/python/qemu/aqmp/util.py&quot;, line 49, in=
 flush<br>=C2=A0 | =C2=A0 =C2=A0 await writer.drain()<br>=C2=A0 | =C2=A0 Fi=
le &quot;/usr/lib/python3.6/asyncio/streams.py&quot;, line 339, in drain<br=
>=C2=A0 | =C2=A0 =C2=A0 yield from self._protocol._drain_helper()<br>=C2=A0=
 | =C2=A0 File &quot;/usr/lib/python3.6/asyncio/streams.py&quot;, line 210,=
 in _drain_helper<br>=C2=A0 | =C2=A0 =C2=A0 raise ConnectionResetError(&#39=
;Connection lost&#39;)<br>=C2=A0 | ConnectionResetError: Connection lost<br=
><div class=3D"gmail_default">---------------------------------------------=
---------------------------------------------------------------------------=
--------------------</div></div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, Jul 17, 2021 at 6:03 AM John Snow &lt;<a href=
=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">GitLab: <a href=3D"https://git=
lab.com/jsnow/qemu/-/commits/python-async-qmp-aqmp" rel=3D"noreferrer" targ=
et=3D"_blank">https://gitlab.com/jsnow/qemu/-/commits/python-async-qmp-aqmp=
</a><br>
CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/338508045" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipelines/338=
508045</a><br>
Docs: <a href=3D"https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://people.redhat.com/~jsnow/sp=
hinx/html/qemu.aqmp.html</a><br>
<br>
Hi!<br>
<br>
This patch series adds an Asynchronous QMP package to the Python<br>
library. It offers a few improvements over the previous library:<br>
<br>
- out-of-band support<br>
- true asynchronous event support<br>
- avoids undocumented interfaces abusing non-blocking sockets<br>
- unit tests!<br>
- documentation!<br>
<br>
This library serves as the basis for a new qmp-shell program that will<br>
offer improved reconnection support, true asynchronous display of<br>
events, VM and job status update notifiers, and so on.<br>
<br>
My intent is to eventually publish this library directly to PyPI as a<br>
standalone package. I would like to phase out our usage of the old QMP<br>
library over time; eventually replacing it entirely with this one.<br>
<br>
This series looks big by line count, but it&#39;s *mostly*<br>
docstrings. Seriously!<br>
<br>
This package has *no* external dependencies whatsoever.<br>
<br>
Notes &amp; Design<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Here are some notes on the design of how the library works, to serve as<br>
a primer for review; however I also **highly recommend** browsing the<br>
generated Sphinx documentation for this series.<br>
<br>
Here&#39;s that link again:<br>
<a href=3D"https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html" rel=
=3D"noreferrer" target=3D"_blank">https://people.redhat.com/~jsnow/sphinx/h=
tml/qemu.aqmp.html</a><br>
<br>
The core machinery is split between the AsyncProtocol and QMP<br>
classes. AsyncProtocol provides the generic machinery, while QMP<br>
provides the QMP-specific details.<br>
<br>
The design uses two independent coroutines that act as the &quot;bottom<br>
half&quot;, a writer task and a reader task. These tasks run for the durati=
on<br>
of the connection and independently send and receive messages,<br>
respectively.<br>
<br>
A third task, disconnect, is scheduled asynchronously whenever an<br>
unrecoverable error occurs and facilitates coalescing of the other two<br>
tasks.<br>
<br>
This diagram for how execute() operates may be helpful for understanding<br=
>
how AsyncProtocol is laid out. The arrows indicate the direction of a<br>
QMP message; the long horizontal dash indicates the separation between<br>
the upper and lower half of the event loop. The queue mechanisms between<br=
>
both dashes serve as the intermediaries between the upper and lower<br>
half.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+---------+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| caller=C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+---------+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^ |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| v<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+---------+<br>
=C2=A0 =C2=A0 =C2=A0+---------------&gt; |execute()| -----------+<br>
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+---------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |<br>
[-----------------------------------------------------------]<br>
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 v<br>
+----+------+=C2=A0 =C2=A0 +----------------+=C2=A0 =C2=A0 +------+-------+=
<br>
| ExecQueue |=C2=A0 =C2=A0 | EventListeners |=C2=A0 =C2=A0 |Outbound Queue|=
<br>
+----+------+=C2=A0 =C2=A0 +----+-----------+=C2=A0 =C2=A0 +------+-------+=
<br>
=C2=A0 =C2=A0 =C2=A0^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|<br>
[-----------------------------------------------------------]<br>
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0v<br>
=C2=A0 +--+----------------+---+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-----------+---=
--------+<br>
=C2=A0 | Reader Task/Coroutine |=C2=A0 =C2=A0 =C2=A0 =C2=A0| Writer Task/Co=
routine |<br>
=C2=A0 +-----------+-----------+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-----------+---=
--------+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0v<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +-----+------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +-----+------+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |StreamReader|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |StreamWriter|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +------------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +------------+<br>
<br>
The caller will invoke execute(), which in turn will deposit a message<br>
in the outbound send queue. This will wake up the writer task, which<br>
well send the message over the wire.<br>
<br>
The execute() method will then yield to wait for a reply delivered to an<br=
>
execution queue created solely for that execute statement.<br>
<br>
When a message arrives, the Reader task will unblock and route the<br>
message either to the EventListener subsystem, or place it in the<br>
appropriate pending execution queue.<br>
<br>
Once a message is placed in the pending execution queue, execute() will<br>
unblock and the execution will conclude, returning the result of the RPC<br=
>
call to the caller.<br>
<br>
Patch Layout<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Patches 1-4=C2=A0 =C2=A0add tiny pre-requisites, utilities, etc.<br>
Patches 5-12=C2=A0 add a generic async message-based protocol class,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AsyncProtocol. They are sp=
lit fairly small and should<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be reasonably self-contain=
ed.<br>
Patches 13-15 check in more QMP-centric components.<br>
Patches 16-21 add qmp_client.py, with a new &#39;QMPClient()&#39; class.<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 They&#39;re split into rea=
sonably tiny pieces here.<br>
Patches 22-23 add a few finishing touches, they are small patches.<br>
Patch 24=C2=A0 =C2=A0 =C2=A0 adds unit tests. They&#39;re maybe a little me=
ssy yet, but<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 they&#39;ve been quite hel=
pful to me so far. Coverage of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 protocol.py is at about 86=
%.<br>
<br>
Future Work<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
These items are in progress:<br>
<br>
- A synchronous QMP wrapper that allows this library to be easily used<br>
=C2=A0 from non-async code; this will also allow me to prove it works well =
by<br>
=C2=A0 demoing its replacement throughout iotests. I have all of iotests<br=
>
=C2=A0 passing locally, but I am still seeing some failures on gitlab CI I<=
br>
=C2=A0 need to diagnose, possibly a race condition somewhere.<br>
<br>
- A QMP server class; to facilitate writing of unit tests. It&#39;s done,<b=
r>
=C2=A0 but needs some polish and tests.<br>
<br>
- More unit tests for qmp_client.py, qmp_server.py and other modules.<br>
<br>
Changelog<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
V2:<br>
<br>
Renamed classes/methods:<br>
<br>
- Renamed qmp_protocol.py to qmp_client.py<br>
- Renamed &#39;QMP&#39; class to &#39;QMPClient&#39;<br>
- Renamed _begin_new_session() to _establish_session()<br>
- Split _establish_connection() out from _new_session().<br>
- Removed _results() method<br>
<br>
Bugfixes:<br>
<br>
- Suppress duplicate Exceptions when attempting to drain the<br>
=C2=A0 StreamWriter<br>
- Delay initialization of asyncio.Queue and asyncio.Event variables to<br>
=C2=A0 _new_session or later -- they must not be created outside of the loo=
p,<br>
=C2=A0 even if they are not async functions.<br>
- Rework runstate_changed events to guarantee visibility of events to<br>
=C2=A0 waiters<br>
- Improve connect()/accept() cleanup to work with<br>
=C2=A0 asyncio.CancelledError, asyncio.TimeoutError<br>
- No-argument form of Message() now succeeds properly.<br>
- flush utility will correctly yield when data is below the &quot;high wate=
r<br>
=C2=A0 mark&quot;, giving the stream a chance to actually flush.<br>
- Increase read buffer size to accommodate query-qmp-schema (Thanks<br>
=C2=A0 Niteesh)<br>
<br>
Ugly bits from V1 removed:<br>
<br>
- Remove tertiary filtering from EventListener (for now), accompanying<br>
=C2=A0 documentation removed from events.py<br>
- Use asyncio.wait() instead of custom wait_task_done()<br>
- MultiException is removed in favor of just raising the first Exception<br=
>
=C2=A0 that occurs in the bottom half; other Exceptions if any are logged<b=
r>
=C2=A0 instead.<br>
<br>
Improvements:<br>
<br>
- QMPClient now allows ID-less execution statements via the _raw()<br>
=C2=A0 interface.<br>
- Add tests that grant ~86% coverage of protocol.py to the avocado test<br>
=C2=A0 suite.<br>
- Removed &#39;force&#39; parameter from _bh_disconnect; the disconnection<=
br>
=C2=A0 routine determines for itself if we are in the error pathway or not<=
br>
=C2=A0 instead now.=C2=A0 This removes any chance of duplicate calls to<br>
=C2=A0 _schedule_disconnect accidentally dropping the &#39;force&#39; setti=
ng.<br>
<br>
Debugging/Testing changes:<br>
<br>
- Add debug: bool parameter to asyncio_run utility wrapper<br>
- Improve error messages for &#39;@require&#39; decorator<br>
- Add debugging message for state change events<br>
- Avoid flushing the StreamWriter if we don&#39;t have one (This<br>
=C2=A0 circumstance only arises in testing, but it&#39;s helpful.)<br>
- Improved __repr__ method for AsyncProtocol, and removed __str__<br>
=C2=A0 method.=C2=A0 enforcing eval(__repr__(x)) =3D=3D x does not make sen=
se for<br>
=C2=A0 AsyncProtocol.<br>
- Misc logging message changes<br>
- Add a suite of fancy Task debugging utilities.<br>
- Most tracebacks now log at the DEBUG level instead of<br>
=C2=A0 CRITICAL/ERROR/WARNING; In those error cases, a one-line summary is<=
br>
=C2=A0 logged instead.<br>
<br>
Misc. aesthetic changes:<br>
<br>
- Misc docstring fixes, whitespace, etc.<br>
- Reordered the definition of some methods to try and keep similar<br>
=C2=A0 methods near each other (Moved _cleanup near _bh_disconnect in<br>
=C2=A0 QMPClient.)<br>
<br>
~ Shucks Howdy, Gee Golly!<br>
<br>
John Snow (24):<br>
=C2=A0 python/aqmp: add asynchronous QMP (AQMP) subpackage<br>
=C2=A0 python/aqmp: add error classes<br>
=C2=A0 python/pylint: Add exception for TypeVar names (&#39;T&#39;)<br>
=C2=A0 python/aqmp: add asyncio compatibility wrappers<br>
=C2=A0 python/aqmp: add generic async message-based protocol support<br>
=C2=A0 python/aqmp: add runstate state machine to AsyncProtocol<br>
=C2=A0 python/aqmp: Add logging utility helpers<br>
=C2=A0 python/aqmp: add logging to AsyncProtocol<br>
=C2=A0 python/aqmp: add AsyncProtocol.accept() method<br>
=C2=A0 python/aqmp: add configurable read buffer limit<br>
=C2=A0 python/aqmp: add _cb_inbound and _cb_inbound logging hooks<br>
=C2=A0 python/aqmp: add AsyncProtocol._readline() method<br>
=C2=A0 python/aqmp: add QMP Message format<br>
=C2=A0 python/aqmp: add well-known QMP object models<br>
=C2=A0 python/aqmp: add QMP event support<br>
=C2=A0 python/pylint: disable too-many-function-args<br>
=C2=A0 python/aqmp: add QMP protocol support<br>
=C2=A0 python/pylint: disable no-member check<br>
=C2=A0 python/aqmp: Add message routing to QMP protocol<br>
=C2=A0 python/aqmp: add execute() interfaces<br>
=C2=A0 python/aqmp: add _raw() execution interface<br>
=C2=A0 python/aqmp: add asyncio_run compatibility wrapper<br>
=C2=A0 python/aqmp: add scary message<br>
=C2=A0 python/aqmp: add AsyncProtocol unit tests<br>
<br>
=C2=A0python/qemu/aqmp/__init__.py=C2=A0 =C2=A0|=C2=A0 58 +++<br>
=C2=A0python/qemu/aqmp/error.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 ++<br>
=C2=A0python/qemu/aqmp/events.py=C2=A0 =C2=A0 =C2=A0| 706 +++++++++++++++++=
+++++++++<br>
=C2=A0python/qemu/aqmp/message.py=C2=A0 =C2=A0 | 209 ++++++++<br>
=C2=A0python/qemu/aqmp/models.py=C2=A0 =C2=A0 =C2=A0| 133 +++++<br>
=C2=A0python/qemu/aqmp/protocol.py=C2=A0 =C2=A0| 882 ++++++++++++++++++++++=
+++++++++++<br>
=C2=A0python/qemu/aqmp/py.typed=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0python/qemu/aqmp/qmp_client.py | 621 +++++++++++++++++++++++<br>
=C2=A0python/qemu/aqmp/util.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 207 ++++++++<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0python/tests/null_proto.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 67 +++<br>
=C2=A0python/tests/protocol.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 458 ++++++++++++=
+++++<br>
=C2=A012 files changed, 3395 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/__init__.py<br>
=C2=A0create mode 100644 python/qemu/aqmp/error.py<br>
=C2=A0create mode 100644 python/qemu/aqmp/events.py<br>
=C2=A0create mode 100644 python/qemu/aqmp/message.py<br>
=C2=A0create mode 100644 python/qemu/aqmp/models.py<br>
=C2=A0create mode 100644 python/qemu/aqmp/protocol.py<br>
=C2=A0create mode 100644 python/qemu/aqmp/py.typed<br>
=C2=A0create mode 100644 python/qemu/aqmp/qmp_client.py<br>
=C2=A0create mode 100644 python/qemu/aqmp/util.py<br>
=C2=A0create mode 100644 python/tests/null_proto.py<br>
=C2=A0create mode 100644 python/tests/protocol.py<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div>

--00000000000087d8b805c7a52805--

