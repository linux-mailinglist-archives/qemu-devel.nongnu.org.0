Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360116109F4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:56:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIF4-00074Q-IS; Fri, 28 Oct 2022 01:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEf-0006wX-Ad
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEd-0007EL-Im
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XRPnGtCHD34kOGXzLQ1KCs65Wkd4MTPb3oQNnRQwfaA=;
 b=PPQ7TkHNja/NJhaGt+W/OFz9wLIP62mxB+ZTEQIfL2addA+gsHQ0InZl7vwjkB/d0Crc/h
 ekLuocXSkLrL+ICIwrYNfDPIqbYDAzCp3uAYG2R+PF1CMSmVIXuD6dHzRprGG2bPUk9T9r
 bv3CRsIAcsL3of61CMWEZDpXDmbpo3A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-91EHsrmRMiS8tjRsvmcPSw-1; Fri, 28 Oct 2022 01:48:47 -0400
X-MC-Unique: 91EHsrmRMiS8tjRsvmcPSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14283101A5AD
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:48:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17C06C06224;
 Fri, 28 Oct 2022 05:48:38 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL 00/26] Net patches
Date: Fri, 28 Oct 2022 13:48:09 +0800
Message-Id: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:

  Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to e506fee8b1e092f6ac6f9459bf6a35b807644ad2:

  net: stream: add QAPI events to report connection state (2022-10-28 13:28:52 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Daniel P. Berrangé (1):
      net: improve error message for missing netdev backend

Eugenio Pérez (6):
      vdpa: Delete duplicated vdpa_feature_bits entry
      vdpa: Remove shadow CVQ command check
      vhost: allocate event_idx fields on vring
      vhost: toggle device callbacks using used event idx
      vhost: use avail event idx on vhost_svq_kick
      vhost: Accept event idx flag

Laurent Vivier (16):
      virtio-net: fix bottom-half packet TX on asynchronous completion
      virtio-net: fix TX timer with tx_burst
      net: introduce convert_host_port()
      net: remove the @errp argument of net_client_inits()
      net: simplify net_client_parse() error management
      qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
      net: introduce qemu_set_info_str() function
      qapi: net: add stream and dgram netdevs
      net: stream: add unix socket
      net: dgram: make dgram_dst generic
      net: dgram: move mcast specific code from net_socket_fd_init_dgram()
      net: dgram: add unix socket
      qemu-sockets: move and rename SocketAddress_to_str()
      qemu-sockets: update socket_uri() and socket_parse() to be consistent
      net: stream: move to QIO to enable additional parameters
      net: stream: add QAPI events to report connection state

Si-Wei Liu (1):
      vhost-vdpa: allow passing opened vhostfd to vhost-vdpa

Stefano Brivio (2):
      net: socket: Don't ignore EINVAL on netdev socket connection
      net: stream: Don't ignore EINVAL on netdev socket connection

 hmp-commands.hx                    |   2 +-
 hw/net/virtio-net.c                |  59 +++-
 hw/net/xen_nic.c                   |   5 +-
 hw/virtio/vhost-shadow-virtqueue.c |  39 ++-
 include/net/net.h                  |   7 +-
 include/qemu/sockets.h             |   4 +-
 monitor/hmp-cmds.c                 |  23 +-
 net/clients.h                      |   6 +
 net/dgram.c                        | 623 +++++++++++++++++++++++++++++++++++++
 net/hub.c                          |   2 +
 net/l2tpv3.c                       |   3 +-
 net/meson.build                    |   2 +
 net/net.c                          | 204 ++++++++----
 net/slirp.c                        |   5 +-
 net/socket.c                       |  36 +--
 net/stream.c                       | 386 +++++++++++++++++++++++
 net/tap-win32.c                    |   3 +-
 net/tap.c                          |  13 +-
 net/vde.c                          |   3 +-
 net/vhost-user.c                   |   3 +-
 net/vhost-vdpa.c                   |  76 ++---
 qapi/net.json                      | 118 ++++++-
 qemu-options.hx                    |  20 +-
 softmmu/vl.c                       |  16 +-
 util/qemu-sockets.c                |  25 ++
 25 files changed, 1473 insertions(+), 210 deletions(-)
 create mode 100644 net/dgram.c
 create mode 100644 net/stream.c


