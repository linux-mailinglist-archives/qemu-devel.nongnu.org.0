Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39A5B6859
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:03:54 +0200 (CEST)
Received: from localhost ([::1]:42386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXzxZ-0005Gk-GC
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg0-0000g0-Ll
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:48 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzfs-0004DI-8z
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:40 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mpkwn-1p6ULA0lKf-00q8wN; Tue, 13 Sep 2022 08:40:05 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v8 00/14] qapi: net: add unix socket type support to netdev
 backend
Date: Tue, 13 Sep 2022 08:39:46 +0200
Message-Id: <20220913064000.79353-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/dP/zYSDMqTylbJ7JVL6i8igL0VaFlxhSp+bh+k9l2dVuUJvq7h
 pK1Ew5qbKJWl1pr8Tu9YNQ99rEsANxDdMkbOSC0yorm1tsW5JeuPQ6wFiOaBf8KqnHgtnHc
 tejp0fipr0q91TO/hr/IVlptF9lS+SGq8LW5YdEgl7K3rthPXtN+bQFKIc9wvVpSgwggbSB
 wgrOb/Wy5LfaEgMztu9sg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uVYZhFh3Ye4=:pe1vt/lyFGlaMvBfhpTgoq
 Tj5yB/9pf7xS8Af3uiHIXBqKqEAiXSRjDun/c+Qru1RdfznRSfpIx+iNXt59U2LpBJ0w5RzCh
 3k/IEap1NMOottG2Ek+3liaVW8dM7t4H2mdSklm/NLDBtjY5ww7DVvbjxRa4ii5/Syf9uOwpX
 lUB9m3mq3wz2aT02RuOnI8R+4ZIKRDNjQbBNN9arlcv+0TOTQXl4b1eNspUK8pGloBEEnifFF
 nTPedIT1C28GfZj5UjixD1UVJ96zHkPiELu8CxStFstTV1vDEaG++hA3Ym3HBBMS8o5gdG+wb
 XTP6cbBdpXNdhVe0ISc12nmBXnB10YbWZ1n8vCu3RW6p6jmGP0kPgBcjcuM9SF9rrRFbCH6cv
 rba8H0oYRBfaSNTpn00HKM/OMQ+7OOIa4td/Mb9N9Upes478fXQgVnEn4yUANfRTTKKAKgXVR
 rr4Pfa/YYzVq8zB2UwIBN5P6AxsarCio4e9PTa1yUCideRuJElyrf1TKJ2oTLsveR2dc0r5/r
 2ecInxnPpk0OgPjIe8GlabgA/29q9OZsF6JZP0tEvzVOAaiZQ1Mt5PVj5Rw4PZcDxDzheEpLT
 8ywpvDv9hQac/NX4wL0zeCgQyBsMom4Y0sinRW3RplxEVM31THdd+gSjHQ+toh0AmW2b9dAHH
 UTzdSw17pbmc+MAiVLkJrrD68pWxGYYKsw9+sT8/6gbknIAYJpNmfJhvSS5qEx4VLWeoaw8kl
 pBDfQPFF7ovjhlR2C4bXFZwsMsmVqtDySI9zDlEcOXzCaXeP01rD2prSmhvMamXlMNdiKTUVQ
 WRUNDTB
Received-SPF: permerror client-ip=212.227.126.187;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Laurent Vivier (13):=0D
  net: introduce convert_host_port()=0D
  net: remove the @errp argument of net_client_inits()=0D
  net: simplify net_client_parse() error management=0D
  qapi: net: introduce a way to bypass qemu_opts_parse_noisily()=0D
  qapi: net: add stream and dgram netdevs=0D
  net: stream: add unix socket=0D
  net: dgram: make dgram_dst generic=0D
  net: dgram: move mcast specific code from net_socket_fd_init_dgram()=0D
  net: dgram: add unix socket=0D
  qemu-sockets: move and rename SocketAddress_to_str()=0D
  qemu-sockets: update socket_uri() and socket_parse()  to be consistent=0D
  net: stream: move to QIO=0D
  tests/qtest: netdev: test stream and dgram backends=0D
=0D
Stefano Brivio (1):=0D
  net: stream: Don't ignore EINVAL on netdev socket connection=0D
=0D
 hmp-commands.hx             |   2 +-=0D
 include/net/net.h           |   6 +-=0D
 include/qemu/sockets.h      |   4 +-=0D
 monitor/hmp-cmds.c          |  23 +-=0D
 net/clients.h               |   6 +=0D
 net/dgram.c                 | 707 ++++++++++++++++++++++++++++++++++++=0D
 net/hub.c                   |   2 +=0D
 net/meson.build             |   2 +=0D
 net/net.c                   | 169 ++++++---=0D
 net/stream.c                | 376 +++++++++++++++++++=0D
 qapi/net.json               |  63 +++-=0D
 qemu-options.hx             |  14 +=0D
 softmmu/vl.c                |  16 +-=0D
 tests/qtest/meson.build     |   1 +=0D
 tests/qtest/netdev-socket.c | 391 ++++++++++++++++++++=0D
 util/qemu-sockets.c         |  25 ++=0D
 16 files changed, 1725 insertions(+), 82 deletions(-)=0D
 create mode 100644 net/dgram.c=0D
 create mode 100644 net/stream.c=0D
 create mode 100644 tests/qtest/netdev-socket.c=0D
=0D
-- =0D
2.37.3=0D
=0D

