Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B057E71E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:14:40 +0200 (CEST)
Received: from localhost ([::1]:47730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEy6h-0007BO-GJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxd-0006Qs-WA
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:18 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:34957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxa-0004uz-Hn
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:17 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MPp0l-1nsbqo0T3b-00Mupb; Fri, 22 Jul 2022 21:04:45 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v7 00/14] qapi: net: add unix socket type support to netdev
 backend
Date: Fri, 22 Jul 2022 21:04:28 +0200
Message-Id: <20220722190442.301310-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/nFbNcXBLtEOSNeIl+aqfBtqq/q2Izic5Y7+8jvSk6kwUQnyQPA
 qHZDABX+6ee3vaTlXVuvFd23OKHHRjqWDX32STRkD20JySp9H3dMcMuwQf375ZqJIcZwMo/
 /WJxLidR9+JCXVn3MJDEziL2wqfJMoxP5m+yv+CWrx+mI4a19NVJLTmICI2h8BGuguaokWu
 gBzBH9IqMU/H3mhacA1aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:biQjl1xaPYU=:r13ebnyNYx5VxRnMMpAw3E
 KqdEJ4GFsiOCZreds2gkMWGZA/rPSxFIzqN20KoVAshbUsTvAX12YmGJNdeOQNY7sYYpygi39
 j6qW6d+GeJ3R6Cfu+xa2eThDOz1xcA8h0muc94xKGdvFokZ/twCQOqYHer6LOH+YtUCR3JLbS
 no+7d9fjE70ze01HK+1uOqcM6YX//43+lxj+dlW/AC6ND/C4SpIYmQTXhDV25vEVHE1Zq2o5Z
 vf8nNV8YQoQxjjJfxF9+eUHpHxmxb1iskKQP9GYDtDWzCZpy0IbRakOarDSLnfKuL2YhtrEQW
 jXIwO5NRz3O+kY5P+g9URjokyLygoXikEMwWZrrZPiuKCrrj16HcMB4JDE5EtW/QwYfa1fFRV
 u7+J+nd08xBXVZR09Q66TmlgTOIitm9ocfbZzZ4JLJ1JW29dwkjg/S0OKifj30E9AwGLvx2LU
 K4sF+pMhk6lAcu2bTcOEhHjV1kmAX8HiRBPAtB/fMxJqa0OC3qf/kKRknlWiOj6FIllqDD8jc
 5thm7QYFZy/oZo48S5fwD6sp0HkgA9SmkUGgLo04qIjBbOXbEVAPkEK9zwfMyNjKbwyWyxgC6
 vkDnLYGnUc6HJ5Ea0jk2XOkbdIg0QGzaafIeMWYubZcRzqxyg33DhLPrR3BHa5KPWiB0Z5p3R
 qnM97Yj/wBe1Pd0BW3v0CAPxgqydVnYtJkJNl0mA7bj4oiugwgDOJ6ccYdIIw4GbFn5NAqfNG
 mKsKOSQ+8pm/AwkadvI3DYD3chrp93U1v6Ta/Q==
Received-SPF: permerror client-ip=212.227.126.133;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
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

"-netdev socket" only supports inet sockets.

It's not a complex task to add support for unix sockets, but
the socket netdev parameters are not defined to manage well unix
socket parameters.

As discussed in:

  "socket.c added support for unix domain socket datagram transport"
  https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/

This series adds support of unix socket type using SocketAddress QAPI structure.

Two new netdev backends, "stream" and "dgram" are added, that are barely a copy of "socket"
backend but they use the SocketAddress QAPI to provide socket parameters.
And then they also implement unix sockets (TCP and UDP).

Some examples of CLI syntax:

  for TCP:

  -netdev stream,id=socket0,addr.type=inet,addr.host=localhost,addr.port=1234
  -netdev stream,id=socket0,server=off,addr.type=inet,addr.host=localhost,addr.port=1234

  -netdev dgram,id=socket0,\
          local.type=inet,local.host=localhost,local.port=1234,\
          remote.type=inet,remote.host=localhost,remote.port=1235

  for UNIX:

  -netdev stream,id=socket0,addr.type=unix,addr.path=/tmp/qemu0
  -netdev stream,id=socket0,server=off,addr.type=unix,addr.path=/tmp/qemu0

  -netdev dgram,id=socket0,\
          local.type=unix,local.path=/tmp/qemu0,\
          remote.type=unix,remote.path=/tmp/qemu1

  for FD:

  -netdev stream,id=socket0,addr.type=fd,addr.str=4
  -netdev stream,id=socket0,server=off,addr.type=fd,addr.str=5

  -netdev dgram,id=socket0,local.type=fd,addr.str=4

v7:
  - add qtests
  - update parameters table in net.json
  - update socket_uri() and socket_parse()

v6:
  - s/netdev option/-netdev option/ PATCH 4
  - s/ / /
  - update @NetdevStreamOptions and @NetdevDgramOptions comments
  - update PATCH 4 description message
  - add missing return in error case for unix stream socket
  - split socket_uri() patch: move and rename, then change content

v5:
  - remove RFC prefix
  - put the change of net_client_parse() into its own patch (exit() in the
    function)
  - update comments regarding netdev_is_modern() and netdev_parse_modern()
  - update error case in net_stream_server_init()
  - update qemu-options.hx with unix type
  - fix HMP "info network" with unix protocol/server side.

v4:
  - net_client_parse() fails with exit() rather than with return.
  - keep "{ 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' }" on its
    own line in qapi/net.json
  - add a comment in qapi/net.json about parameters usage
  - move netdev_is_modern() check to qemu_init()
  - in netdev_is_modern(), check for JSON and use qemu_opts_do_parse()
    to parse parameters and detect type value.
  - add a blank line after copyright comment

v3:
  - remove support of "-net" for dgram and stream. They are only
    supported with "-netdev" option.
  - use &error_fatal directly in net_client_inits()
  - update qemu-options.hx
  - move to QIO for stream socket

v2:
  - use "stream" and "dgram" rather than "socket-ng,mode=stream"
    and ""socket-ng,mode=dgram"
  - extract code to bypass qemu_opts_parse_noisily() to
    a new patch
  - do not ignore EINVAL (Stefano)
  - fix "-net" option

CC: Ralph Schmieder <ralph.schmieder@gmail.com>
CC: Stefano Brivio <sbrivio@redhat.com>
CC: Daniel P. Berrangé <berrange@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>

Laurent Vivier (13):
  net: introduce convert_host_port()
  net: remove the @errp argument of net_client_inits()
  net: simplify net_client_parse() error management
  qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
  qapi: net: add stream and dgram netdevs
  net: stream: add unix socket
  net: dgram: make dgram_dst generic
  net: dgram: move mcast specific code from net_socket_fd_init_dgram()
  net: dgram: add unix socket
  qemu-sockets: move and rename SocketAddress_to_str()
  qemu-sockets: update socket_uri() and socket_parse()  to be consistent
  net: stream: move to QIO
  tests/qtest: netdev: test stream and dgram backends

Stefano Brivio (1):
  net: stream: Don't ignore EINVAL on netdev socket connection

 hmp-commands.hx             |   2 +-
 include/net/net.h           |   6 +-
 include/qemu/sockets.h      |   4 +-
 monitor/hmp-cmds.c          |  23 +-
 net/clients.h               |   6 +
 net/dgram.c                 | 707 ++++++++++++++++++++++++++++++++++++
 net/hub.c                   |   2 +
 net/meson.build             |   2 +
 net/net.c                   | 169 ++++++---
 net/stream.c                | 376 +++++++++++++++++++
 qapi/net.json               |  63 +++-
 qemu-options.hx             |  14 +
 softmmu/vl.c                |  16 +-
 tests/qtest/meson.build     |   1 +
 tests/qtest/netdev-socket.c | 322 ++++++++++++++++
 util/qemu-sockets.c         |  25 ++
 16 files changed, 1656 insertions(+), 82 deletions(-)
 create mode 100644 net/dgram.c
 create mode 100644 net/stream.c
 create mode 100644 tests/qtest/netdev-socket.c

-- 
2.37.1


