Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162EF290897
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 17:37:26 +0200 (CEST)
Received: from localhost ([::1]:56900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTRnI-0003WQ-I4
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 11:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1kTRlI-0002JI-W7
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 11:35:23 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:39272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1kTRlA-0001pk-Vv
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 11:35:17 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 1BA222E18DF;
 Fri, 16 Oct 2020 18:34:52 +0300 (MSK)
Received: from localhost (localhost [::1])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Ax4yoH1BDo-YpwG2VaK; Fri, 16 Oct 2020 18:34:51 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1602862491; bh=bBfGtT0UvvuZF2+jN0bhvobuh/XtrZCn/T41206DEYM=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=pBpUsDHEuD5cKNmAaHIW1Ps/9vzaVnxFKbKKDwFPM5CXDj4UBDXllS5Y7NIM2fWyq
 opMQFSBL0SjMHzUYv5FvCYeToAy19Iy7yU6YK8Vascva+8LFnGGOUo7xdvHNC6Bodi
 edoDE59kBJuSmxy+TKUleDrhNwcTbp6fDjOB8DLU=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net [2a02:6b8:c0c:2f26:0:640:d077:482f])
 by iva4-81f2a0d63507.qloud-c.yandex.net with LMTP id Opngm2DAgQ-TwOqLAgR
 for <lekiravi@yandex-team.ru>; Fri, 16 Oct 2020 18:34:41 +0300
Received: by iva8-edafde7c849c.qloud-c.yandex.net with HTTP;
 Fri, 16 Oct 2020 18:34:40 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>
In-Reply-To: <20200921191912.105305-1-lekiravi@yandex-team.ru>
References: <20200921191912.105305-1-lekiravi@yandex-team.ru>
Subject: Re: [PATCH v4 0/4] Introducing QMP query-netdev command
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 16 Oct 2020 18:34:50 +0300
Message-Id: <3241602862308@mail.yandex-team.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/16 11:34:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

Ping again, as no progress since september 22.

http://patchwork.ozlabs.org/project/qemu-devel/list/?series=203284

21.09.2020, 22:19, "Alexey Kirillov" <lekiravi@yandex-team.ru>:
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
>  tests/qtest/test-query-netdev.c | 115 +++++++++++++++++
>  17 files changed, 807 insertions(+), 59 deletions(-)
>  create mode 100644 tests/qtest/test-query-netdev.c
>
> --
> 2.25.1


-- 
Alexey Kirillov
Yandex.Cloud

