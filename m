Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635353BBD6C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:21:30 +0200 (CEST)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OXP-0007F3-D1
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0OW8-0006Sp-5f
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0OW4-0004ne-HL
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625491202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TiGmIhj69ZgHatsKxYVGhsuWj/RIdkQblhFW8wNR9fk=;
 b=dQF4FNnlRTn+6aM5yqeMbtmOm4QXa2KCmG4MrDpXZdVZipGr/8AzjmhUDAZka0t/1CiPEj
 SjJ4F+NEFgknUNBm5e9lGRVS0g8RIigJXQ+rg//QyorCc6eY1d+jgnM4qGAGnr72+fQYoh
 RVvuHciTF2PBW9y0IrNkGjUNGUYAImo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-UK4ZY6tYMcy1d1JdHgg7mA-1; Mon, 05 Jul 2021 09:20:00 -0400
X-MC-Unique: UK4ZY6tYMcy1d1JdHgg7mA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E0F8802E6C;
 Mon,  5 Jul 2021 13:19:59 +0000 (UTC)
Received: from localhost (ovpn-114-164.ams2.redhat.com [10.36.114.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EF4960864;
 Mon,  5 Jul 2021 13:19:51 +0000 (UTC)
Date: Mon, 5 Jul 2021 14:19:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 00/20] python: introduce Asynchronous QMP package
Message-ID: <YOMG9t3aS1unmtx0@stefanha-x1.localdomain>
References: <20210701041313.1696009-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210701041313.1696009-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pYik4gq1iKsSeZ/T"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pYik4gq1iKsSeZ/T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 01, 2021 at 12:12:53AM -0400, John Snow wrote:
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-async-qmp-aqmp
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/330003554
> Docs: https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html
> Based-on: <20210701020921.1679468-1-jsnow@redhat.com>
>           [PULL 00/15] Python patches
>=20
> Hi!
>=20
> This patch series adds an Asynchronous QMP package to the Python
> library. It offers a few improvements over the previous library:
>=20
> - out-of-band support
> - true asynchronous event support
> - avoids undocumented interfaces abusing non-blocking sockets
>=20
> This library serves as the basis for a new qmp-shell program that will
> offer improved reconnection support, true asynchronous display of
> events, VM and job status update notifiers, and so on.
>=20
> My intent is to eventually publish this library directly to PyPI as a
> standalone package. I would like to phase out our usage of the old QMP
> library over time; eventually replacing it entirely with this one.
>=20
> This series looks big by line count, but it's *mostly*
> docstrings. Seriously!
>=20
> This package has *no* external dependencies whatsoever.
>=20
> Notes & Design
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Here are some notes on the design of how the library works, to serve as
> a primer for review; however I also **highly recommend** browsing the
> generated Sphinx documentation for this series.
>=20
> Here's that link again:
> https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html
>=20
> The core machinery is split between the AsyncProtocol and QMP
> classes. AsyncProtocol provides the generic machinery, while QMP
> provides the QMP-specific details.
>=20
> The design uses two independent coroutines that act as the "bottom
> half", a writer task and a reader task. These tasks run for the duration
> of the connection and independently send and receive messages,
> respectively.
>=20
> A third task, disconnect, is scheduled asynchronously whenever an
> unrecoverable error occurs and facilitates coalescing of the other two
> tasks.
>=20
> This diagram for how execute() operates may be helpful for understanding
> how AsyncProtocol is laid out. The arrows indicate the direction of a
> QMP message; the long horizontal dash indicates the separation between
> the upper and lower half of the event loop. The queue mechanisms between
> both dashes serve as the intermediaries between the upper and lower
> half.
>=20
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
>=20
> The caller will invoke execute(), which in turn will deposit a message
> in the outbound send queue. This will wake up the writer task, which
> well send the message over the wire.
>=20
> The execute() method will then yield to wait for a reply delivered to an
> execution queue created solely for that execute statement.
>=20
> When a message arrives, the Reader task will unblock and route the
> message either to the EventListener subsystem, or place it in the
> appropriate pending execution queue.
>=20
> Once a message is placed in the pending execution queue, execute() will
> unblock and the execution will conclude, returning the result of the RPC
> call to the caller.
>=20
> Ugly Bits
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> - MultiException is ... wonky. I am still working out how to avoid needin=
g it.
>   See patch 04/20 for details here, or see
>   https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.error.html
>=20
>   Patch 06/20 also goes into details of the ugliness; see
>   AsyncProtocol._results or view the same information here:
>   https://people.redhat.com/~jsnow/sphinx/html/_modules/qemu/aqmp/protoco=
l.html#AsyncProtocol._results
>=20
> - There are quite a few lingering questions I have over the design of the
>   EventListener subsystem; I wrote about those ugly bits in excruciating =
detail
>   in patch 14/20.
>=20
>   You can view them formatted nicely here:
>   https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.events.html#expe=
rimental-interfaces-design-issues
>=20
> Patch Layout
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Patches 1-2 are tiny pylint configuration changes.
> Patches 3-5 begin to check in Async QMP components, they are small.
> Patches 6-11 add a generic async message-based protocol class,
>              AsyncProto. They are split as small as I could
>              reasonably split them.
> Patches 12-14 check in more QMP-specific components.
> Patches 15-18 add qmp_protocol.py, the new 'QMP' class. They're split as
>               far down as I could, I hope they're easy to review.
> Patches 19-20 add a few finishing touches, they are small patches.
>=20
> Future Work
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> These items are in progress:
>=20
> - A Synchronous QMP wrapper that allows this library to be easily used
>   from non-async code; this will also allow me to prove it works well by
>   demoing its replacement throughout iotests.
>=20
> - A QMP server class; to facilitate writing of unit tests.
>=20
> - Unit tests. Real unit tests.
>=20
> If you made it this far in the cover letter, congrats :)
>=20
> John Snow (20):
>   python/pylint: Add exception for TypeVar names ('T')
>   python/pylint: disable too-many-function-args
>   python/aqmp: add asynchronous QMP (AQMP) subpackage
>   python/aqmp: add error classes
>   python/aqmp: add asyncio compatibility wrappers
>   python/aqmp: add generic async message-based protocol support
>   python/aqmp: add runstate state machine to AsyncProtocol
>   python/aqmp: add logging to AsyncProtocol
>   python/aqmp: add AsyncProtocol.accept() method
>   python/aqmp: add _cb_inbound and _cb_inbound logging hooks
>   python/aqmp: add AsyncProtocol._readline() method
>   python/aqmp: add QMP Message format
>   python/aqmp: add well-known QMP object models
>   python/aqmp: add QMP event support
>   python/aqmp: add QMP protocol support
>   python/aqmp: Add message routing to QMP protocol
>   python/aqmp: add execute() interfaces
>   python/aqmp: add _raw() execution interface
>   python/aqmp: add asyncio_run compatibility wrapper
>   python/aqmp: add scary message
>=20
>  python/qemu/aqmp/__init__.py     |  61 +++
>  python/qemu/aqmp/error.py        |  97 ++++
>  python/qemu/aqmp/events.py       | 878 +++++++++++++++++++++++++++++++
>  python/qemu/aqmp/message.py      | 207 ++++++++
>  python/qemu/aqmp/models.py       | 133 +++++
>  python/qemu/aqmp/protocol.py     | 851 ++++++++++++++++++++++++++++++
>  python/qemu/aqmp/py.typed        |   0
>  python/qemu/aqmp/qmp_protocol.py | 565 ++++++++++++++++++++
>  python/qemu/aqmp/util.py         | 183 +++++++
>  python/setup.cfg                 |   4 +-
>  10 files changed, 2978 insertions(+), 1 deletion(-)
>  create mode 100644 python/qemu/aqmp/__init__.py
>  create mode 100644 python/qemu/aqmp/error.py
>  create mode 100644 python/qemu/aqmp/events.py
>  create mode 100644 python/qemu/aqmp/message.py
>  create mode 100644 python/qemu/aqmp/models.py
>  create mode 100644 python/qemu/aqmp/protocol.py
>  create mode 100644 python/qemu/aqmp/py.typed
>  create mode 100644 python/qemu/aqmp/qmp_protocol.py
>  create mode 100644 python/qemu/aqmp/util.py

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--pYik4gq1iKsSeZ/T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDjBvYACgkQnKSrs4Gr
c8i5Bwf7BVGSg2tV/gyijdZJnEzD3GX5PKy4KhmaI/jIsaGgLHGpYag4/ue3fiEX
4/4El0TfQFyrcAx4allpFpKOol/pX22U0fb7adpzfD/sCmG8k1mESPqEzGse6rqS
tbS8WhdRNjr12RAMvSLE1e8UTRmbaZKwWqA1K0gSEU0vJy90Zn8FBIV4h6FEosdy
3pr30rjnlx29W247yBdZV8GcLtBR0SI/xKmr0xSoCYHRu4wzAY6BMutu+GY2IIjh
nCFHYZYdKHfnScn+CrHJVRpim2Mc+BwgR5TojJZC4YcKfjN47ClAsLxIgtGCW7an
dUk6XjfCRG8XSsdEpOSiZMMjFePDxg==
=p6Zh
-----END PGP SIGNATURE-----

--pYik4gq1iKsSeZ/T--


