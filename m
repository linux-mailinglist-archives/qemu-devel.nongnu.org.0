Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658035EF38
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:24:19 +0200 (CEST)
Received: from localhost ([::1]:50910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWaos-0000Fr-4y
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWals-0003sG-24
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:21:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWalp-0005iu-Cp
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618388468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wu3JbAsqSUpZv0rsDwJM6DA59uNdNdo269jZOqaj95o=;
 b=WDnq5vc/6BhV5fgA//j/qequxrice6ppxlgqK+hzvnT6K4y//ysujgcBBVhCGYlsTqH1kV
 JLcH/+pUIkN9DpC6O95xebUuPfg5i38jB0shodddfuIULdxLAVvoS7DIgZ3WaIIzRxRIUz
 00OGxgdTQ7jgkzz3a775Uex2vagjpPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-6-2QKgz2OC-3TZtwxr0A5g-1; Wed, 14 Apr 2021 04:21:06 -0400
X-MC-Unique: 6-2QKgz2OC-3TZtwxr0A5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91B738030BB
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 08:21:05 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1365A5D9D0;
 Wed, 14 Apr 2021 08:21:04 +0000 (UTC)
Date: Wed, 14 Apr 2021 07:38:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH RFC 0/7] RFC: Asynchronous QMP Draft
Message-ID: <YHaN5JPvjK2Wq6su@stefanha-x1.localdomain>
References: <20210413155553.2660523-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210413155553.2660523-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HGo+a3lFkRNg9U0Y"
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

--HGo+a3lFkRNg9U0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Below are the API docs that I found helpful for understanding the big
picture.

The QMP.execute() API is nice.

Regarding QMP events, I can think of two approaches:
1. Callbacks
2. An async get_event(name=3DOptional[str]) -> object API
   (plus get_event_nowait(name=3DOptional[str]) -> object)

(There's probably a third approach using async iterators but it's
similar to get_event().)

Both approaches are useful. The first is good in larger asynchronous
applications that perform many tasks concurrently. The second is good
when there is just one specific thing to do, like waiting for a block
job to complete.

My general impression is that the public API is nice and usable but the
implementation is complex and risks discouraging other people from
hacking on the code. There are too many abstractions and while it's
highly structured, there is a cost to having all this infrastructure. I
think simplifying it would make it easier for others to understand and
contribute to the code.

Ideas: open code or inline simple things instead of defining
abstractions that only have 1 user, drop the pydantic models, drop
classes that just wrap things like Message and the exception hierarchy,
combine protocol and qmp_protocol.

Things that might be worth adding:
1. File descriptor passing support.
2. Introspection support to easily check if a command/feature is
   available. Users can do this manually by sending QMP commands and
   interpreting the response, but this may be common enough to warrant a
   friendly API.

Help on module qmp.qmp_protocol in qmp:

NAME
    qmp.qmp_protocol - QMP Client Implementation

DESCRIPTION
    This module provides the QMP class, which can be used to connect and
    send commands to a QMP server such as QEMU. The QMP class can be used t=
o
    either connect to a listening server, or used to listen and accept an
    incoming connection from the server.

CLASSES
    qmp.error.AQMPError(builtins.Exception)
        ExecuteError
    qmp.protocol.AsyncProtocol(typing.Generic)
        QMP
   =20
    class ExecuteError(qmp.error.AQMPError)
     |  ExecuteError(sent: qmp.message.Message, received: qmp.message.Messa=
ge, error: qmp.models.ErrorInfo)
     | =20
     |  Execution statement returned failure.
     | =20
     |  Method resolution order:
     |      ExecuteError
     |      qmp.error.AQMPError
     |      builtins.Exception
     |      builtins.BaseException
     |      builtins.object
     | =20
     |  Methods defined here:
     | =20
     |  __init__(self, sent: qmp.message.Message, received: qmp.message.Mes=
sage, error: qmp.models.ErrorInfo)
     |      Initialize self.  See help(type(self)) for accurate signature.
     | =20
     |  __str__(self) -> str
     |      Return str(self).
     | =20
     |  -------------------------------------------------------------------=
---
     |  Data descriptors inherited from qmp.error.AQMPError:
     | =20
     |  __weakref__
     |      list of weak references to the object (if defined)
     | =20
     |  -------------------------------------------------------------------=
---
     |  Static methods inherited from builtins.Exception:
     | =20
     |  __new__(*args, **kwargs) from builtins.type
     |      Create and return a new object.  See help(type) for accurate si=
gnature.
     | =20
     |  -------------------------------------------------------------------=
---
     |  Methods inherited from builtins.BaseException:
     | =20
     |  __delattr__(self, name, /)
     |      Implement delattr(self, name).
     | =20
     |  __getattribute__(self, name, /)
     |      Return getattr(self, name).
     | =20
     |  __reduce__(...)
     |      Helper for pickle.
     | =20
     |  __repr__(self, /)
     |      Return repr(self).
     | =20
     |  __setattr__(self, name, value, /)
     |      Implement setattr(self, name, value).
     | =20
     |  __setstate__(...)
     | =20
     |  with_traceback(...)
     |      Exception.with_traceback(tb) --
     |      set self.__traceback__ to tb and return self.
     | =20
     |  -------------------------------------------------------------------=
---
     |  Data descriptors inherited from builtins.BaseException:
     | =20
     |  __cause__
     |      exception cause
     | =20
     |  __context__
     |      exception context
     | =20
     |  __dict__
     | =20
     |  __suppress_context__
     | =20
     |  __traceback__
     | =20
     |  args
   =20
    class QMP(qmp.protocol.AsyncProtocol)
     |  QMP(name: Optional[str] =3D None) -> None
     | =20
     |  Implements a QMP connection to/from the server.
     | =20
     |  Basic usage looks like this::
     | =20
     |    qmp =3D QMP('my_virtual_machine_name')
     |    await qmp.connect(('127.0.0.1', 1234))
     |    ...
     |    res =3D await qmp.execute('block-query')
     |    ...
     |    await qmp.disconnect()
     | =20
     |  :param name: Optional nickname for the connection, used for logging=
.
     | =20
     |  Method resolution order:
     |      QMP
     |      qmp.protocol.AsyncProtocol
     |      typing.Generic
     |      builtins.object
     | =20
     |  Methods defined here:
     | =20
     |  __init__(self, name: Optional[str] =3D None) -> None
     |      Initialize self.  See help(type(self)) for accurate signature.
     | =20
     |  async execute(self, cmd: str, arguments: Optional[Mapping[str, obje=
ct]] =3D None, oob: bool =3D False) -> object
     |      Execute a QMP command and return the response.
     |     =20
     |      :param cmd: QMP command name.
     |      :param arguments: Arguments (if any). Must be JSON-serializable=
.
     |      :param oob: If true, execute "out of band".
     |     =20
     |      :raise: ExecuteError if the server returns an error response.
     |      :raise: DisconnectedError if the connection was terminated earl=
y.
     |     =20
     |      :return: Execution response from the server. The type of object=
 depends
     |               on the command that was issued, though most return a d=
ict.
     | =20
     |  async execute_msg(self, msg: qmp.message.Message) -> object
     |      Execute a QMP message and return the response.
     |     =20
     |      :param msg: The QMP `Message` to execute.
     |      :raises: ValueError if the QMP `Message` does not have either t=
he
     |               'execute' or 'exec-oob' fields set.
     |      :raises: ExecuteError if the server returns an error response.
     |      :raises: DisconnectedError if the connection was terminated ear=
ly.
     |     =20
     |      :return: Execution response from the server. The type of object=
 depends
     |               on the command that was issued, though most return a d=
ict.
     | =20
     |  on_event(self, func: Callable[[ForwardRef('QMP'), qmp.message.Messa=
ge], Awaitable[NoneType]]) -> Callable[[ForwardRef('QMP'), qmp.message.Mess=
age], Awaitable[NoneType]]
     |      FIXME: Quick hack: decorator to register event handlers.
     |     =20
     |      Use it like this::
     |     =20
     |        @qmp.on_event
     |        async def my_event_handler(qmp, event: Message) -> None:
     |          print(f"Received event: {event['event']}")
     |     =20
     |      RFC: What kind of event handler would be the most useful in
     |      practical terms? In tests, we are usually waiting for an
     |      event with some criteria to occur; maybe it would be useful
     |      to allow "coroutine" style functions where we can block
     |      until a certain event shows up?
     | =20
     |  -------------------------------------------------------------------=
---
     |  Class methods defined here:
     | =20
     |  make_execute_msg(cmd: str, arguments: Optional[Mapping[str, object]=
] =3D None, oob: bool =3D False) -> qmp.message.Message from builtins.type
     |      Create an executable message to be sent by `execute_msg` later.
     |     =20
     |      :param cmd: QMP command name.
     |      :param arguments: Arguments (if any). Must be JSON-serializable=
.
     |      :param oob: If true, execute "out of band".
     |     =20
     |      :return: An executable QMP message.
     | =20
     |  -------------------------------------------------------------------=
---
     |  Data and other attributes defined here:
     | =20
     |  __orig_bases__ =3D (qmp.protocol.AsyncProtocol[qmp.message.Message]=
,)
     | =20
     |  __parameters__ =3D ()
     | =20
     |  logger =3D <Logger qmp.qmp_protocol (WARNING)>
     | =20
     |  -------------------------------------------------------------------=
---
     |  Methods inherited from qmp.protocol.AsyncProtocol:
     | =20
     |  async accept(self, address: Union[str, Tuple[str, int]], ssl: Optio=
nal[ssl.SSLContext] =3D None) -> None
     |      Accept a connection and begin processing message queues.
     |     =20
     |      :param address: Address to connect to;
     |                      UNIX socket path or TCP address/port.
     |      :param ssl:     SSL context to use, if any.
     |     =20
     |      :raise: `StateError`   (loop is running or disconnecting.)
     |      :raise: `ConnectError` (Connection was not successful.)
     | =20
     |  async connect(self, address: Union[str, Tuple[str, int]], ssl: Opti=
onal[ssl.SSLContext] =3D None) -> None
     |      Connect to the server and begin processing message queues.
     |     =20
     |      :param address: Address to connect to;
     |                      UNIX socket path or TCP address/port.
     |      :param ssl:     SSL context to use, if any.
     |     =20
     |      :raise: `StateError`   (loop is running or disconnecting.)
     |      :raise: `ConnectError` (Connection was not successful.)
     | =20
     |  async disconnect(self) -> None
     |      Disconnect and wait for all tasks to fully stop.
     |     =20
     |      If there were exceptions that caused the bottom half to termina=
te
     |      prematurely, they will be raised here.
     |     =20
     |      :raise: `Exception`      Arbitrary exceptions re-raised on beha=
lf of
     |                               the bottom half.
     |      :raise: `MultiException` Iterable Exception used to multiplex m=
ultiple
     |                               exceptions when multiple tasks failed.
     | =20
     |  -------------------------------------------------------------------=
---
     |  Readonly properties inherited from qmp.protocol.AsyncProtocol:
     | =20
     |  disconnecting
     |      Return True when the loop is disconnecting, or disconnected.
     | =20
     |  running
     |      Return True when the loop is currently connected and running.
     | =20
     |  unconnected
     |      Return True when the loop is fully idle and quiesced.
     |     =20
     |      Returns True specifically when the loop is neither `running`
     |      nor `disconnecting`. A call to `disconnect()` is required
     |      to transition from `disconnecting` to `unconnected`.
     | =20
     |  -------------------------------------------------------------------=
---
     |  Data descriptors inherited from qmp.protocol.AsyncProtocol:
     | =20
     |  __dict__
     |      dictionary for instance variables (if defined)
     | =20
     |  __weakref__
     |      list of weak references to the object (if defined)
     | =20
     |  -------------------------------------------------------------------=
---
     |  Class methods inherited from typing.Generic:
     | =20
     |  __class_getitem__(params) from builtins.type
     | =20
     |  __init_subclass__(*args, **kwargs) from builtins.type
     |      This method is called when a class is subclassed.
     |     =20
     |      The default implementation does nothing. It may be
     |      overridden to extend subclasses.

DATA
    Awaitable =3D typing.Awaitable
        A generic version of collections.abc.Awaitable.
   =20
    Callable =3D typing.Callable
        Callable type; Callable[[int], str] is a function of (int) -> str.
       =20
        The subscription syntax must always be used with exactly two
        values: the argument list and the return type.  The argument list
        must be a list of types or ellipsis; the return type must be a sing=
le type.
       =20
        There is no syntax to indicate optional or keyword arguments,
        such function types are rarely used as callback types.
   =20
    Dict =3D typing.Dict
        A generic version of dict.
   =20
    List =3D typing.List
        A generic version of list.
   =20
    Mapping =3D typing.Mapping
        A generic version of collections.abc.Mapping.
   =20
    Optional =3D typing.Optional
        Optional type.
       =20
        Optional[X] is equivalent to Union[X, None].
   =20
    Tuple =3D typing.Tuple
        Tuple type; Tuple[X, Y] is the cross-product type of X and Y.
       =20
        Example: Tuple[T1, T2] is a tuple of two elements corresponding
        to type variables T1 and T2.  Tuple[int, float, str] is a tuple
        of an int, a float and a string.
       =20
        To specify a variable-length tuple of homogeneous type, use Tuple[T=
, ...].

FILE
    /tmp/foo/qmp/qmp_protocol.py



--HGo+a3lFkRNg9U0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB2jeQACgkQnKSrs4Gr
c8hgKwf/TK9NVFBc1cpgu8aLODCFBrcDnRodvyKsvho17RF1L0lurn+SWL/bxKQ3
TbeQuPeDI/vh0CEJC1znCQ0wLCh5QUcio/SosmXWTInLUHxz7uqV67lvC7RYrZGP
CuLOnhzIXofYH/bQA+rVfyBWhPHpgDT9QBSk3iVkiLcAwabdvDm9rAtn45H441Vh
/ZxPjve4VGaEBVB9kNMJtgF2Nxn69an2thspBkIOEC+lng4X5QgUgxHIJU2dVdu/
433S17mtB2zmrW/l3gnVBobdeYk3jfylk2FAh98Cim0Rk8WIspfoZgJS6A1plt0T
n4LOqirn4cKRqjG8IAh2FaXorC8nSQ==
=wAyt
-----END PGP SIGNATURE-----

--HGo+a3lFkRNg9U0Y--


