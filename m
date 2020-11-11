Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BB02AF20D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:25:40 +0100 (CET)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcq83-0002V9-6s
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpuw-0006jG-9U
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpul-00027x-EH
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=0ltEQLmUbEydZsc2Rjn+LwIVm7gugvDPVq7lxoIzrnw=;
 b=OYDexfLBjzkUmELpf/9DV7KSu2yMyPKBAuxCBrPiwKgvryzOYgs2r2B32Ihhs+XD0AtSI8
 Esv+1IpgCTzHgWjY1JzDhvHkTf3F4XvnB+3ENZaJbITs2brI6Vd5kAjoqUtezRkFQ7hBY7
 loIJvBAlgfmUzeV11sfTwBKTpyvl0yQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-CSBtJq82MdyNQ4yJyYlFeg-1; Wed, 11 Nov 2020 08:11:46 -0500
X-MC-Unique: CSBtJq82MdyNQ4yJyYlFeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 072D980475D;
 Wed, 11 Nov 2020 13:11:45 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A962975139;
 Wed, 11 Nov 2020 13:11:43 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 00/17] Net patches
Date: Wed, 11 Nov 2020 21:11:24 +0800
Message-Id: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c6f28ed5075df79fef39c500362a3f4089256c9c:

  Update version for v5.2.0-rc1 release (2020-11-10 22:29:57 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 71182187ddae5d5b17bd48464f719798321484ed:

  hw/net/can/ctucan_core: Use stl_le_p to write to tx_buffers (2020-11-11 20:34:36 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
AlexChen (1):
      net/l2tpv3: Remove redundant check in net_init_l2tpv3()

Cindy Lu (1):
      virtio-net: Set mac address to hardware if the peer is vdpa

Li Zhijian (2):
      colo-compare: fix missing compare_seq initialization
      colo-compare: check mark in mutual exclusion

Pan Nengyuan (1):
      net/filter-rewriter: destroy g_hash_table in colo_rewriter_cleanup

Peter Maydell (4):
      hw/net/can/ctucan: Don't allow guest to write off end of tx_buffer
      hw/net/can/ctucan: Avoid unused value in ctucan_send_ready_buffers()
      hw/net/can/ctucan_core: Handle big-endian hosts
      hw/net/can/ctucan_core: Use stl_le_p to write to tx_buffers

Prasad J Pandit (1):
      net: remove an assert call in eth_get_gso_type

Rao, Lei (3):
      Optimize seq_sorter function for colo-compare
      Reduce the time of checkpoint for COLO
      Fix the qemu crash when guest shutdown in COLO mode

Zhang Chen (4):
      net/colo-compare.c: Fix compare_timeout format issue
      net/colo-compare.c: Change the timer clock type
      net/colo-compare.c: Add secondary old packet detection
      net/colo-compare.c: Increase default queued packet scan frequency

 hw/net/can/ctucan_core.c | 23 ++++++-------------
 hw/net/can/ctucan_core.h |  3 +--
 hw/net/virtio-net.c      |  6 +++++
 migration/ram.c          | 14 +++++++++++-
 net/colo-compare.c       | 58 +++++++++++++++++++++++++-----------------------
 net/colo.c               |  5 +----
 net/eth.c                |  6 ++---
 net/filter-rewriter.c    |  2 ++
 net/l2tpv3.c             |  9 +++-----
 softmmu/vl.c             |  1 +
 10 files changed, 67 insertions(+), 60 deletions(-)



