Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB2C37704F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 09:20:32 +0200 (CEST)
Received: from localhost ([::1]:36010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfHGJ-0000ey-EJ
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 03:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHEh-0007AA-VG
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:18:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHEe-0003HY-JJ
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620458327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r/baGygLX7muSIc6wJAZH1LnIK1HRiYTPHqpuhAE8t4=;
 b=SV/ocM0f689mxSgF+TQf5OQrgx5ukmSFoVFLh+dpw3DpYn5DO5gaTxQ/p0wBxpHT9OK5VW
 T1BT5Tw+A+CePc/Qup6/GXO/lI8fGf28+5ngVnA1to1GnA+KvZ2ECEHwbyqymra564csH3
 EJA+vxVa9dFC6rY7ZPhXLGl9l7QZzxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-d3xUqKUWNWKN-N7glWCiVg-1; Sat, 08 May 2021 03:18:43 -0400
X-MC-Unique: d3xUqKUWNWKN-N7glWCiVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAFED107ACC7;
 Sat,  8 May 2021 07:18:42 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-172.pek2.redhat.com
 [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B3175C3FD;
 Sat,  8 May 2021 07:18:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 00/10] Net patches
Date: Sat,  8 May 2021 15:18:29 +0800
Message-Id: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 2bdeb0c2564c36b218ac73e21d7a6f6accb49091:

  tap-bsd: Remove special casing for older OpenBSD releases (2021-05-08 13:59:12 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Andrew Melnychenko (7):
      net/tap: Added TUNSETSTEERINGEBPF code.
      net: Added SetSteeringEBPF method for NetClientState.
      ebpf: Added eBPF RSS program.
      ebpf: Added eBPF RSS loader.
      virtio-net: Added eBPF RSS to virtio-net.
      docs: Added eBPF documentation.
      MAINTAINERS: Added eBPF maintainers information.

Brad Smith (1):
      tap-bsd: Remove special casing for older OpenBSD releases

Guenter Roeck (1):
      hw/net/imx_fec: return 0xffff when accessing non-existing PHY

Laurent Vivier (1):
      virtio-net: failover: add missing remove_migration_state_change_notifier()

 MAINTAINERS                    |   8 +
 configure                      |   8 +-
 docs/devel/ebpf_rss.rst        | 125 +++++++++
 docs/devel/index.rst           |   1 +
 ebpf/ebpf_rss-stub.c           |  40 +++
 ebpf/ebpf_rss.c                | 165 ++++++++++++
 ebpf/ebpf_rss.h                |  44 ++++
 ebpf/meson.build               |   1 +
 ebpf/rss.bpf.skeleton.h        | 431 +++++++++++++++++++++++++++++++
 ebpf/trace-events              |   4 +
 ebpf/trace.h                   |   1 +
 hw/net/imx_fec.c               |   8 +-
 hw/net/trace-events            |   2 +
 hw/net/vhost_net.c             |   3 +
 hw/net/virtio-net.c            | 116 ++++++++-
 include/hw/virtio/virtio-net.h |   4 +
 include/net/net.h              |   2 +
 meson.build                    |  23 ++
 meson_options.txt              |   2 +
 net/tap-bsd.c                  |  13 +-
 net/tap-linux.c                |  13 +
 net/tap-linux.h                |   1 +
 net/tap-solaris.c              |   5 +
 net/tap-stub.c                 |   5 +
 net/tap.c                      |   9 +
 net/tap_int.h                  |   1 +
 net/vhost-vdpa.c               |   2 +
 tools/ebpf/Makefile.ebpf       |  21 ++
 tools/ebpf/rss.bpf.c           | 569 +++++++++++++++++++++++++++++++++++++++++
 29 files changed, 1610 insertions(+), 17 deletions(-)
 create mode 100644 docs/devel/ebpf_rss.rst
 create mode 100644 ebpf/ebpf_rss-stub.c
 create mode 100644 ebpf/ebpf_rss.c
 create mode 100644 ebpf/ebpf_rss.h
 create mode 100644 ebpf/meson.build
 create mode 100644 ebpf/rss.bpf.skeleton.h
 create mode 100644 ebpf/trace-events
 create mode 100644 ebpf/trace.h
 create mode 100755 tools/ebpf/Makefile.ebpf
 create mode 100644 tools/ebpf/rss.bpf.c



