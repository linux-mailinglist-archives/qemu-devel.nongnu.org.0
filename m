Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA42C0EB1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:21:37 +0100 (CET)
Received: from localhost ([::1]:59878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDeq-0000i9-T7
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1khDdO-00081p-3w
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:20:06 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:48164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1khDdI-0006cZ-Ng
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:20:03 -0500
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id D39392E15C5;
 Mon, 23 Nov 2020 18:19:54 +0300 (MSK)
Received: from localhost (localhost [::1])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 LGffsLwrQe-Jqw4WFCp; Mon, 23 Nov 2020 18:19:54 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1606144794; bh=R4LAsIxng7Jzg1AEpntb1bM6ZZxr+XDChWP3WP3aZcM=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=a4iMVpWKwjaJmDlBvE5aCCFnytAOg/39+A/ZjKFeZXLxUrWce7wp8RtV+vNJADbfO
 WcVekcE1MlR7RaBOX2iL4elp+aw0z60x3PiUuVNVMfUMwGPeT0QP2Ku4L/uVh674zD
 PMO/0cFQjprFDX9yPE4+AsLYSJeSGGIAbhnBbaBM=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net [2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by myt5-ca7361f95f04.qloud-c.yandex.net with LMTP id Lq3gMeyJm8-bUMvPV5p
 for <lekiravi@yandex-team.ru>; Mon, 23 Nov 2020 18:19:42 +0300
Received: by myt6-91bfb4ccf42d.qloud-c.yandex.net with HTTP;
 Mon, 23 Nov 2020 18:19:41 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
In-Reply-To: <20201108235952.107961-1-lekiravi@yandex-team.ru>
References: <20201108235952.107961-1-lekiravi@yandex-team.ru>
Subject: Re: [PATCH v5 0/4] Introducing QMP query-netdev command
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 23 Nov 2020 18:19:51 +0300
Message-Id: <3742701606144510@mail.yandex-team.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

Patchwork page: http://patchwork.ozlabs.org/project/qemu-devel/list/?series=212983

09.11.2020, 03:02, "Alexey Kirillov" <lekiravi@yandex-team.ru>:
> This patch series introduces a new QMP command "query-netdev" to get
> information about currently attached backend network devices (netdevs).
> Also, since the "info_str" field of "NetClientState" is now deprecated,
> we no longer use it for netdevs, only for NIC/hubports.
> The HMP command "info network" now also uses the new QMP command inside.
>
> Usage example:
>
> -> { "execute": "query-netdev" }
> <- { "return": [
>          {
>              "listen": "127.0.0.1:90",
>              "type": "socket",
>              "peer-id": "hub0port1",
>              "id": "__org.qemu.net1"
>          },
>          {
>              "script": "/etc/qemu-ifup",
>              "downscript": "/etc/qemu-ifdown",
>              "ifname": "tap0",
>              "type": "tap",
>              "peer-id": "net5",
>              "vnet_hdr": true,
>              "id": "tap0"
>          },
>          {
>              "ipv6": true,
>              "ipv4": true,
>              "host": "10.0.2.2",
>              "ipv6-dns": "fec0::3",
>              "ipv6-prefix": "fec0::",
>              "net": "10.0.2.0/255.255.255.0",
>              "ipv6-host": "fec0::2",
>              "type": "user",
>              "peer-id": "net0",
>              "dns": "10.0.2.3",
>              "hostfwd": [
>                  {
>                      "str": "tcp::20004-:22"
>                  }
>              ],
>              "ipv6-prefixlen": 64,
>              "id": "netdev0",
>              "restrict": false
>          }
>      ]
>    }
>
> v4->v5:
> - Enable qtest of query-netdevs for AVR and RX archs.
> - Bump "Since" version in QAPI to 6.0.
>
> v3->v4:
> - Rename "query-netdevs" to "query-netdev".
> - Copy netdev drivers to new QAPI enum "NetBackend".
>
> v2->v3:
> - Remove NIC and hubports from query-netdevs.
> - Remove several fields from NetdevInfo since they are unnecessary.
> - Rename field @peer to @peer-id.
> - Add support of vhost-vdpa.
> - Keep "info_str" for NIC/hubports, but remove it for netdevs.
>
> v1->v2:
> - Rewrite HMP "info network" to get information from results of QMP command.
> - Remove obsolete field "info_str" from "NetClientState".
>
> Alexey Kirillov (4):
>   qapi: net: Add query-netdev command
>   tests: Add tests for query-netdev command
>   hmp: Use QMP query-netdev in hmp_info_network
>   net: Do not use legacy info_str for backends
>
>  include/net/net.h | 4 +-
>  net/clients.h | 1 +
>  net/hub.c | 4 +-
>  net/hub.h | 2 +-
>  net/l2tpv3.c | 21 +++-
>  net/net.c | 213 +++++++++++++++++++++++++++++++-
>  net/netmap.c | 13 ++
>  net/slirp.c | 128 ++++++++++++++++++-
>  net/socket.c | 91 ++++++++++----
>  net/tap-win32.c | 10 +-
>  net/tap.c | 107 ++++++++++++++--
>  net/vde.c | 39 +++++-
>  net/vhost-user.c | 20 ++-
>  net/vhost-vdpa.c | 15 ++-
>  qapi/net.json | 80 ++++++++++++
>  tests/qtest/meson.build | 3 +
>  tests/qtest/test-query-netdev.c | 120 ++++++++++++++++++
>  17 files changed, 812 insertions(+), 59 deletions(-)
>  create mode 100644 tests/qtest/test-query-netdev.c
>
> --
> 2.25.1


-- 
Alexey Kirillov
Yandex.Cloud

