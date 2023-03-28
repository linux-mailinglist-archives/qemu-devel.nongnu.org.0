Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8006CB5F1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 07:21:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph1kG-0005Td-L6; Tue, 28 Mar 2023 01:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1k0-0005RE-Vr
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1jy-0007Gy-O2
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679980764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RIc4d0d0ecfqObMFeCAk96f0593ueOMIAU2RLRu6/4s=;
 b=OIGsF3izkSFuoW6F3aPcqswfoIcfKsjgundHaPMeYAMho3ZMl3oNXBwFEovPSqD+V7+hYk
 zaNrk2Oa++bWuQkdZQD467Z/ikMNpIPt7JlRT8GILqdipj1W3tfSPchW6WXxVcSi3zA954
 8ICTs8cn7rmV8fwpTJw0jjrUaA0i03Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-Ex7CSctcMyWY898t-h7bDg-1; Tue, 28 Mar 2023 01:19:23 -0400
X-MC-Unique: Ex7CSctcMyWY898t-h7bDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD2FA801206
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:19:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-204.pek2.redhat.com
 [10.72.13.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B041202701F;
 Tue, 28 Mar 2023 05:19:20 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL 00/12] Net patches
Date: Tue, 28 Mar 2023 13:19:05 +0800
Message-Id: <20230328051917.18006-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit e3debd5e7d0ce031356024878a0a18b9d109354a:

  Merge tag 'pull-request-2023-03-24' of https://gitlab.com/thuth/qemu into staging (2023-03-24 16:08:46 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to fba7c3b788dfcb99a3f9253f7d99cc0d217d6d3c:

  igb: respect VMVIR and VMOLR for VLAN (2023-03-28 13:10:55 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Akihiko Odaki (4):
      igb: Save more Tx states
      igb: Fix DMA requester specification for Tx packet
      hw/net/net_tx_pkt: Ignore ECN bit
      hw/net/net_tx_pkt: Align l3_hdr

Sriram Yagnaraman (8):
      MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
      igb: handle PF/VF reset properly
      igb: add ICR_RXDW
      igb: implement VFRE and VFTE registers
      igb: check oversized packets for VMDq
      igb: respect E1000_VMOLR_RSSE
      igb: implement VF Tx and Rx stats
      igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000e_core.c |   6 +-
 hw/net/e1000x_regs.h |   4 +
 hw/net/igb.c         |  26 ++++--
 hw/net/igb_core.c    | 256 ++++++++++++++++++++++++++++++++++++++-------------
 hw/net/igb_core.h    |   9 +-
 hw/net/igb_regs.h    |   6 ++
 hw/net/net_tx_pkt.c  |  30 +++---
 hw/net/net_tx_pkt.h  |   3 +-
 hw/net/trace-events  |   2 +
 hw/net/vmxnet3.c     |   4 +-
 11 files changed, 254 insertions(+), 93 deletions(-)



