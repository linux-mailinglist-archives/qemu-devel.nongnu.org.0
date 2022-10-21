Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D69607433
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:37:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloT8-0000My-SZ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:37:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo2m-0004vx-KP
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2R-0003UU-9X
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:59 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2A-0001QT-KJ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:58 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MxmFk-1p1r5933ew-00zGXO; Fri, 21 Oct 2022 11:09:26 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v14 00/17] qapi: net: add unix socket type support to netdev
 backend
Date: Fri, 21 Oct 2022 11:09:05 +0200
Message-Id: <20221021090922.170074-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VpEY//5IvSRK3nyNuCUhBDNhXRWhS3c0IdbvRhR+YcIGrWmc4ru
 SkB76NAjT7fnPrpzZqSnF0A4JOsxwCCCdi7PAUgKG1pWk5JJ2ZrQu8eVmXm5Vyf0+r8KhvJ
 SXNLd3Ml0WgjaBFZ43YgF3vmUAJJjr35CU5Ki+f4yVJ2udaXHAAnYN6UIsFVM9A/lI4QWDe
 6Mxl8WsZXzPPOV1CbIY1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QbXaFyoQko0=:4/VXPKDBAFLW/6gPaxkpC+
 prXHCgl1yCLOv3BxWy003+2BqdlXE9X7Pae31lESm0NJGEHs6vKpf4r4TwZoNdCi7OwCDsxYb
 SHkeKnPU16dDgrVRqVgwei8yyW9hQ7X6XGZF+i9mV6guXEtDvYI1vcjZO8MFcFE+IMA/FArL2
 uQyjjXoAO3gsCUKyJajAH4rcDkSjuof9Koznk5rtJDuEDNYUt8Nm7PpiREzpRNPhv7Dl0HHzL
 ddBubK9X2CLoePqGTDVU6a6jkm6Uy5kJvU+ADBLg8PxBcFy+eP0IRZ+Y6TEkDjA2Dtlxw9K6Z
 4Zu9oBxn/dqypk46xVdwaBbUe+QyEvOrbBmqnxC2lkKcYzYPMSpmfuOikwJTx3iaqt9SJyOvc
 yRPwJqUjDcXnW0yN0sw11d1AmetGKbHBbBNjTr+Nv/QFtrZV+6QeT8k7DPqNNi5RSl4ocJmOC
 t1rLktOqbZDuKHy4sqgpccXn5Acq7a+ZUQ/5QlVs9FZQgW0kK/Al21eLOTTTR23X3EcyaGhrN
 1pl/m6u3zzVvMjaMUc2BdBp37a2QcHEmgtUMLFUnwxWAvoXw7vvuN+b1YzZs24cyTrtOQXY8L
 vZXa8XqLpc67bLGpxwiSX9+6/TF7sbQQQcWBH3csfEo45OvNlkPmkNGn3h8Ez59SPms52AsSp
 B65V5EW7fcKCoczefC7SLzFFBEJdqPLNAIHqaMGexwkzMtYKIDm/64wI6oPqYoV4xlGvtc0+T
 oH7b/sASzDk+Y+E1SQvlakP7zC6LN1AzD8xXFktAYXzGnsWd6ff48MgghLdsLTPmfp6iVrV+f
 tRGR8Ns
Received-SPF: permerror client-ip=217.72.192.75;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"-netdev socket" only supports inet sockets.=0D
=0D
It's not a complex task to add support for unix sockets, but=0D
the socket netdev parameters are not defined to manage well unix=0D
socket parameters.=0D
=0D
As discussed in:=0D
=0D
  "socket.c added support for unix domain socket datagram transport"=0D
  https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@g=
mail.com/=0D
=0D
This series adds support of unix socket type using SocketAddress QAPI struc=
ture.=0D
=0D
Two new netdev backends, "stream" and "dgram" are added, that are barely a =
copy of "socket"=0D
backend but they use the SocketAddress QAPI to provide socket parameters.=0D
And then they also implement unix sockets (TCP and UDP).=0D
=0D
Some examples of CLI syntax:=0D
=0D
  for TCP:=0D
=0D
  -netdev stream,id=3Dsocket0,addr.type=3Dinet,addr.host=3Dlocalhost,addr.p=
ort=3D1234=0D
  -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dinet,addr.host=3Dloc=
alhost,addr.port=3D1234=0D
=0D
  -netdev dgram,id=3Dsocket0,\=0D
          local.type=3Dinet,local.host=3Dlocalhost,local.port=3D1234,\=0D
          remote.type=3Dinet,remote.host=3Dlocalhost,remote.port=3D1235=0D
=0D
  for UNIX:=0D
=0D
  -netdev stream,id=3Dsocket0,addr.type=3Dunix,addr.path=3D/tmp/qemu0=0D
  -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dunix,addr.path=3D/tm=
p/qemu0=0D
=0D
  -netdev dgram,id=3Dsocket0,\=0D
          local.type=3Dunix,local.path=3D/tmp/qemu0,\=0D
          remote.type=3Dunix,remote.path=3D/tmp/qemu1=0D
=0D
  for FD:=0D
=0D
  -netdev stream,id=3Dsocket0,addr.type=3Dfd,addr.str=3D4=0D
  -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dfd,addr.str=3D5=0D
=0D
  -netdev dgram,id=3Dsocket0,local.type=3Dfd,addr.str=3D4=0D
=0D
v14:=0D
 - move some minor changes from PATCH 17 to 15=0D
 - update PATCH 17 commit message=0D
=0D
v13:=0D
  - fix server default in qtest=0D
  - use SocketAddress in event=0D
  - remove unwanted meson update=0D
  - update error message in net_init_dgram()=0D
=0D
v12:=0D
  - replace NETDEV_STREAM_EOC by NETDEV_STREAM_DISCONNECTED=0D
  - set server=3Doff by default=0D
=0D
v11:=0D
  - use qemu_set_info_str() in hw/net/xen_nic.c=0D
  - fix link_down state in stream client mode=0D
  - cleanup error case in net_stream_receive()=0D
  - update qapi version to 7.2=0D
=0D
v10:=0D
  - add Red Hat copyright=0D
  - initialize dgram_dst to NULL in SOCKET_ADDRESS_TYPE_FD=0D
  - remove redundente _stream / _dgram in functions name=0D
  - move net_dgram_init() into net_init_dgram()=0D
  - address Thomas' comments on qtest=0D
  - add a function qemu_set_info_str() to set info string=0D
  - tested stream netdev with fd type using qrap/passt and=0D
    "-netdev stream,addr.type=3Dfd,server=3Doff,addr.str=3D5,id=3Dnetdev0"=
=0D
=0D
v9:=0D
  - add events to report stream connection/disconnection=0D
  - remove from net/dgram.c send_fn, listen_fd, net_dgram_accept()=0D
    net_dgram_connect() and net_dgram_send() that are only=0D
    needed by net/stream.c=0D
  - remove from net/stream.c send_fn=0D
  - add Red Hat copyright=0D
  - add original net/socket.c Stefano's patch (EINVAL)=0D
=0D
v8:=0D
  - test ipv4 and ipv6 parameters (stream inet)=0D
  - test abstract parameter (stream unix)=0D
  - add SocketAddressInet supported parameters in qemu-options.hx=0D
    (only stream, supported by the move to QIO)=0D
  - with qio_channel_writev() replace (ret =3D=3D -1 && errno =3D=3D EAGAIN=
)=0D
    by (ret =3D=3D QIO_CHANNEL_ERR_BLOCK)=0D
=0D
v7:=0D
  - add qtests=0D
  - update parameters table in net.json=0D
  - update socket_uri() and socket_parse()=0D
=0D
v6:=0D
  - s/netdev option/-netdev option/ PATCH 4=0D
  - s/=C2=A0/ /=0D
  - update @NetdevStreamOptions and @NetdevDgramOptions comments=0D
  - update PATCH 4 description message=0D
  - add missing return in error case for unix stream socket=0D
  - split socket_uri() patch: move and rename, then change content=0D
=0D
v5:=0D
  - remove RFC prefix=0D
  - put the change of net_client_parse() into its own patch (exit() in the=
=0D
    function)=0D
  - update comments regarding netdev_is_modern() and netdev_parse_modern()=
=0D
  - update error case in net_stream_server_init()=0D
  - update qemu-options.hx with unix type=0D
  - fix HMP "info network" with unix protocol/server side.=0D
=0D
v4:=0D
  - net_client_parse() fails with exit() rather than with return.=0D
  - keep "{ 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' }" on its=0D
    own line in qapi/net.json=0D
  - add a comment in qapi/net.json about parameters usage=0D
  - move netdev_is_modern() check to qemu_init()=0D
  - in netdev_is_modern(), check for JSON and use qemu_opts_do_parse()=0D
    to parse parameters and detect type value.=0D
  - add a blank line after copyright comment=0D
=0D
v3:=0D
  - remove support of "-net" for dgram and stream. They are only=0D
    supported with "-netdev" option.=0D
  - use &error_fatal directly in net_client_inits()=0D
  - update qemu-options.hx=0D
  - move to QIO for stream socket=0D
=0D
v2:=0D
  - use "stream" and "dgram" rather than "socket-ng,mode=3Dstream"=0D
    and ""socket-ng,mode=3Ddgram"=0D
  - extract code to bypass qemu_opts_parse_noisily() to=0D
    a new patch=0D
  - do not ignore EINVAL (Stefano)=0D
  - fix "-net" option=0D
=0D
CC: Ralph Schmieder <ralph.schmieder@gmail.com>=0D
CC: Stefano Brivio <sbrivio@redhat.com>=0D
CC: Daniel P. Berrang=C3=A9 <berrange@redhat.com>=0D
CC: Markus Armbruster <armbru@redhat.com>=0D
=0D
Laurent Vivier (15):=0D
  net: introduce convert_host_port()=0D
  net: remove the @errp argument of net_client_inits()=0D
  net: simplify net_client_parse() error management=0D
  qapi: net: introduce a way to bypass qemu_opts_parse_noisily()=0D
  net: introduce qemu_set_info_str() function=0D
  qapi: net: add stream and dgram netdevs=0D
  net: stream: add unix socket=0D
  net: dgram: make dgram_dst generic=0D
  net: dgram: move mcast specific code from net_socket_fd_init_dgram()=0D
  net: dgram: add unix socket=0D
  qemu-sockets: move and rename SocketAddress_to_str()=0D
  qemu-sockets: update socket_uri() and socket_parse()  to be consistent=0D
  net: stream: move to QIO to enable additional parameters=0D
  tests/qtest: netdev: test stream and dgram backends=0D
  net: stream: add QAPI events to report connection state=0D
=0D
Stefano Brivio (2):=0D
  net: socket: Don't ignore EINVAL on netdev socket connection=0D
  net: stream: Don't ignore EINVAL on netdev socket connection=0D
=0D
 hmp-commands.hx             |   2 +-=0D
 hw/net/xen_nic.c            |   5 +-=0D
 include/net/net.h           |   7 +-=0D
 include/qemu/sockets.h      |   4 +-=0D
 monitor/hmp-cmds.c          |  23 +-=0D
 net/clients.h               |   6 +=0D
 net/dgram.c                 | 623 ++++++++++++++++++++++++++++++++++++=0D
 net/hub.c                   |   2 +=0D
 net/l2tpv3.c                |   3 +-=0D
 net/meson.build             |   2 +=0D
 net/net.c                   | 186 ++++++++---=0D
 net/slirp.c                 |   5 +-=0D
 net/socket.c                |  36 +--=0D
 net/stream.c                | 386 ++++++++++++++++++++++=0D
 net/tap-win32.c             |   3 +-=0D
 net/tap.c                   |  13 +-=0D
 net/vde.c                   |   3 +-=0D
 net/vhost-user.c            |   3 +-=0D
 net/vhost-vdpa.c            |   2 +-=0D
 qapi/net.json               | 115 ++++++-=0D
 qemu-options.hx             |  14 +=0D
 softmmu/vl.c                |  16 +-=0D
 tests/qtest/meson.build     |   1 +=0D
 tests/qtest/netdev-socket.c | 420 ++++++++++++++++++++++++=0D
 util/qemu-sockets.c         |  25 ++=0D
 25 files changed, 1774 insertions(+), 131 deletions(-)=0D
 create mode 100644 net/dgram.c=0D
 create mode 100644 net/stream.c=0D
 create mode 100644 tests/qtest/netdev-socket.c=0D
=0D
-- =0D
2.37.3=0D
=0D

