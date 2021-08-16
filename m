Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B23EDF7A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:46:59 +0200 (CEST)
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFkRe-0000Vs-2x
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mFkPs-0007dN-Pt
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:45:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mFkPp-00060A-GI
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629150304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JckAwdFLydimufc2PD72dl4bejwyUoqDomQWHVgO8HY=;
 b=LzAQ++GtyNlzm/etsSHnHwldxU30cFTLEBb5C9zS2KuMy0e3mBT891nNiU/GZyDlimt+Ze
 Ra8xy74okKGvQIgvxvWX3SmwEW5xm5ykreer5BV2xzWoRnMyhJc/bdZqbj200QpyqAEHiQ
 LN3kvrgZJMyQVrqu1UXeNubn+O6aqhM=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-x0IUOHo0OoqQc8tmMkKH0A-1; Mon, 16 Aug 2021 17:45:01 -0400
X-MC-Unique: x0IUOHo0OoqQc8tmMkKH0A-1
Received: by mail-oi1-f200.google.com with SMTP id
 i18-20020aca2b120000b02902678052797bso7109076oik.13
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 14:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JckAwdFLydimufc2PD72dl4bejwyUoqDomQWHVgO8HY=;
 b=ceUqIuvH0QwFOJOkeYumeVtvFmrbsY/rDtqhRp1DyrgFgiUNS+uOmBVYhtPYftsUt9
 6yxiYHZ2QmGe+/ekRnWFJz+8mSEBNzHferMRJaYRbGG5Us5FgDtIq5Qwc7sajewdB8TP
 32vhdnI/8zEe1CI5yh+EbtNJavMKMMoJJODN7LVoiTc2p2Ha+W4D5JH9x2KZYN9Km2H4
 SQSM0hxmep/Tv8nO0KO5MpC4xAjsP+82zb1ZuNS/urB2Myqj4Nn4EW6b2HwkYXja53xl
 /LvO3QbVwuZ7xwY6w3tJV4TVgOc6qJQJn7QItdj4nBo6r47P0OM9QJFmEwEhyDwVcmJB
 2XEw==
X-Gm-Message-State: AOAM531z0eYw51CLjpeTc5cWVKWetrzRmIn/ld/5tV7s5SWSKyfubsbx
 RrqoVzxvWH3pwaWSCwptg0kT053GhyyLGtZkxzKewYxydCzzRXNuFA+oq+akhUR+DFHLK1fRe5j
 GAElRZk+Z51qXZCQlPCXBd2lqOc3yRcg=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr11128oiw.112.1629150300177; 
 Mon, 16 Aug 2021 14:45:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjDSAVz97paGcsfbQKuibKFPYk0NtqMPUmtkbv1H139GRanoYuUWCgncim2YrNWcDQleIi+c8+C8MgnSHpsGY=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr11110oiw.112.1629150299862; 
 Mon, 16 Aug 2021 14:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210803182941.504537-1-jsnow@redhat.com>
In-Reply-To: <20210803182941.504537-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 16 Aug 2021 17:44:49 -0400
Message-ID: <CAFn=p-bmA_BgNbd6eAM+GUd6Ls85aj+GdM2d0h65-0HXTSCm6g@mail.gmail.com>
Subject: Re: [PATCH v3 00/25] python: introduce Asynchronous QMP package
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e8ce3f05c9b41c89"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e8ce3f05c9b41c89
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 2:29 PM John Snow <jsnow@redhat.com> wrote:

> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-async-qmp-aqmp
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/347375602
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
> library over time; eventually replacing it entirely with this
> one. (Since v2 of this series, I have authored a compatibility shim not
> included in this series that can be used to run all of iotests on this
> new library successfully with very minimal churn.)
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
> The core machinery is split between the AsyncProtocol and QMPClient
> classes. AsyncProtocol provides the generic machinery, while QMPClient
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
> the upper and lower halves of the event loop. The queue mechanisms
> between both dashes serve as the intermediaries between the upper and
> lower halves.
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
> Patches 24-25 adds unit tests. They're a little messy still, but
>               they've been quite helpful to me so far. Coverage of
>               protocol.py is at about ~86%.
>
> Future Work
> ===========
>
> These items are in progress:
>
> - A synchronous QMP wrapper that allows this library to be easily used
>   from non-async code; this will also allow me to prove it works well by
>   demoing its replacement throughout iotests.
>
>   This work is feature-complete, but needs polish. All of iotests is now
>   passing with Async QMP and this Sync wrapper. This will be its own
>   follow-up series.
>
> - A QMP server class; to facilitate writing of unit tests. An early
>   version is done, but possibly not feature complete. More polish and
>   tests are warranted. This will be its own follow-up series.
>
> - More unit tests for qmp_client.py, qmp_server.py and other modules.
>
> Changelog
> =========
>
> V3:
>
> - (02, 05) Typo fixes (Eric Blake)
> - (04) Rewrote the "wait_closed" compatibility function for Python 3.6;
>   the older version raised unwanted exceptions in error pathways.
>   (Niteesh)
> - (04, 05, 06, 08) Rewrote _bh_disconnect fairly substantially again;
>   the problem is that exceptions can surface during both flushing of the
>   stream and when waiting for the stream to close. These errors can be
>   new, primary causes of failure or secondary failures. Distinguishing
>   between them is tricky. The new disconnection method takes much
>   greater pains to ensure that even if Exceptions occur, disconnect
>   *will* complete. This adds robustness to cases exposed by iotests
>   where one or more endpoints might segfault or abort and cleanup can be
>   challenged.
> - (11) Fixed logging hook names (Niteesh)
> - (24, 25) Bumped avocado dependency to v90; It added support for async
>   test functions which made my prior workaround non-suitable. The
>   choices were to mandate <90 and keep the workarounds or mandate >=90
>   and drop the workarounds. I went with the latter.
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
> John Snow (25):
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
>   python/aqmp: add _cb_inbound and _cb_outbound logging hooks
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
>   python: bump avocado to v90.0
>   python/aqmp: add AsyncProtocol unit tests
>
>  python/Pipfile.lock            |   8 +-
>  python/qemu/aqmp/__init__.py   |  59 +++
>  python/qemu/aqmp/error.py      |  50 ++
>  python/qemu/aqmp/events.py     | 706 ++++++++++++++++++++++++++
>  python/qemu/aqmp/message.py    | 209 ++++++++
>  python/qemu/aqmp/models.py     | 133 +++++
>  python/qemu/aqmp/protocol.py   | 902 +++++++++++++++++++++++++++++++++
>  python/qemu/aqmp/py.typed      |   0
>  python/qemu/aqmp/qmp_client.py | 621 +++++++++++++++++++++++
>  python/qemu/aqmp/util.py       | 217 ++++++++
>  python/setup.cfg               |   7 +-
>  python/tests/null_proto.py     |  70 +++
>  python/tests/protocol.py       | 535 +++++++++++++++++++
>  13 files changed, 3511 insertions(+), 6 deletions(-)
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
Any opposition to me checking this into the tree when it opens up again?
I'd like to get it into the tree early in the cycle and test having iotests
run on the new library.

I am thinking that (In a follow-up series, not this one) I will modify the
QEMUMachine class to use the new library by default, but expose an
environment variable that can be used to push it to use the older library.
My hope is that if I do this early on in the development window that any
remaining problems could be identified and fixed while still causing little
to no disruption.

Thoughts?

--000000000000e8ce3f05c9b41c89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Aug 3, 2021 at 2:29 PM John Snow &lt;<a href=
=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">GitLab: <a href=3D"https://git=
lab.com/jsnow/qemu/-/commits/python-async-qmp-aqmp" rel=3D"noreferrer" targ=
et=3D"_blank">https://gitlab.com/jsnow/qemu/-/commits/python-async-qmp-aqmp=
</a><br>
CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/347375602" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipelines/347=
375602</a><br>
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
library over time; eventually replacing it entirely with this<br>
one. (Since v2 of this series, I have authored a compatibility shim not<br>
included in this series that can be used to run all of iotests on this<br>
new library successfully with very minimal churn.)<br>
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
The core machinery is split between the AsyncProtocol and QMPClient<br>
classes. AsyncProtocol provides the generic machinery, while QMPClient<br>
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
the upper and lower halves of the event loop. The queue mechanisms<br>
between both dashes serve as the intermediaries between the upper and<br>
lower halves.<br>
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
Patches 24-25 adds unit tests. They&#39;re a little messy still, but<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 they&#39;ve been quite hel=
pful to me so far. Coverage of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 protocol.py is at about ~8=
6%.<br>
<br>
Future Work<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
These items are in progress:<br>
<br>
- A synchronous QMP wrapper that allows this library to be easily used<br>
=C2=A0 from non-async code; this will also allow me to prove it works well =
by<br>
=C2=A0 demoing its replacement throughout iotests.<br>
<br>
=C2=A0 This work is feature-complete, but needs polish. All of iotests is n=
ow<br>
=C2=A0 passing with Async QMP and this Sync wrapper. This will be its own<b=
r>
=C2=A0 follow-up series.<br>
<br>
- A QMP server class; to facilitate writing of unit tests. An early<br>
=C2=A0 version is done, but possibly not feature complete. More polish and<=
br>
=C2=A0 tests are warranted. This will be its own follow-up series.<br>
<br>
- More unit tests for qmp_client.py, qmp_server.py and other modules.<br>
<br>
Changelog<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
V3:<br>
<br>
- (02, 05) Typo fixes (Eric Blake)<br>
- (04) Rewrote the &quot;wait_closed&quot; compatibility function for Pytho=
n 3.6;<br>
=C2=A0 the older version raised unwanted exceptions in error pathways.<br>
=C2=A0 (Niteesh)<br>
- (04, 05, 06, 08) Rewrote _bh_disconnect fairly substantially again;<br>
=C2=A0 the problem is that exceptions can surface during both flushing of t=
he<br>
=C2=A0 stream and when waiting for the stream to close. These errors can be=
<br>
=C2=A0 new, primary causes of failure or secondary failures. Distinguishing=
<br>
=C2=A0 between them is tricky. The new disconnection method takes much<br>
=C2=A0 greater pains to ensure that even if Exceptions occur, disconnect<br=
>
=C2=A0 *will* complete. This adds robustness to cases exposed by iotests<br=
>
=C2=A0 where one or more endpoints might segfault or abort and cleanup can =
be<br>
=C2=A0 challenged.<br>
- (11) Fixed logging hook names (Niteesh)<br>
- (24, 25) Bumped avocado dependency to v90; It added support for async<br>
=C2=A0 test functions which made my prior workaround non-suitable. The<br>
=C2=A0 choices were to mandate &lt;90 and keep the workarounds or mandate &=
gt;=3D90<br>
=C2=A0 and drop the workarounds. I went with the latter.<br>
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
John Snow (25):<br>
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
=C2=A0 python/aqmp: add _cb_inbound and _cb_outbound logging hooks<br>
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
=C2=A0 python: bump avocado to v90.0<br>
=C2=A0 python/aqmp: add AsyncProtocol unit tests<br>
<br>
=C2=A0python/Pipfile.lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A08 +-<br>
=C2=A0python/qemu/aqmp/__init__.py=C2=A0 =C2=A0|=C2=A0 59 +++<br>
=C2=A0python/qemu/aqmp/error.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 ++<br>
=C2=A0python/qemu/aqmp/events.py=C2=A0 =C2=A0 =C2=A0| 706 +++++++++++++++++=
+++++++++<br>
=C2=A0python/qemu/aqmp/message.py=C2=A0 =C2=A0 | 209 ++++++++<br>
=C2=A0python/qemu/aqmp/models.py=C2=A0 =C2=A0 =C2=A0| 133 +++++<br>
=C2=A0python/qemu/aqmp/protocol.py=C2=A0 =C2=A0| 902 ++++++++++++++++++++++=
+++++++++++<br>
=C2=A0python/qemu/aqmp/py.typed=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0python/qemu/aqmp/qmp_client.py | 621 +++++++++++++++++++++++<br>
=C2=A0python/qemu/aqmp/util.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 217 ++++++++<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0python/tests/null_proto.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 70 +++<br>
=C2=A0python/tests/protocol.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 535 ++++++++++++=
+++++++<br>
=C2=A013 files changed, 3511 insertions(+), 6 deletions(-)<br>
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
<br></blockquote><div><br></div><div>Any opposition to me checking this int=
o the tree when it opens up again? I&#39;d like to get it into the tree ear=
ly in the cycle and test having iotests run on the new library.</div><div><=
br></div><div>I am thinking that (In a follow-up series, not this one) I wi=
ll modify the QEMUMachine class to use the new library by default, but expo=
se an environment variable that can be used to push it to use the older lib=
rary. My hope is that if I do this early on in the development window that =
any remaining problems could be identified and fixed while still causing li=
ttle to no disruption.</div><div><br></div><div>Thoughts?<br></div></div></=
div>

--000000000000e8ce3f05c9b41c89--


