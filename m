Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DA23C7929
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:42:28 +0200 (CEST)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QAd-0004tL-IK
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3PyJ-0004jp-RQ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3PyF-0005io-5O
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UrzYFw4CRsE7vs+TD7b4My/cdeQe5/kaPnzxolvFX9s=;
 b=KaYdq807bFB5x03WP2SgSXICImSQJlnmrLOv+I4OpFRBUEMGl9fMc3C4d7V+99jztuz2zQ
 YfKfukSW4A+SgWuZ68b3/d82786MGGKJ6ZAbX8X0tYCFcvf3d98EfX1kwwjE+jHC4sHJms
 TGedo8FgpUfgCRU4o0AfSi5/wfV7+4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-y99DA7OHPMG3bd4_77AhCg-1; Tue, 13 Jul 2021 17:29:36 -0400
X-MC-Unique: y99DA7OHPMG3bd4_77AhCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AC9B362FA;
 Tue, 13 Jul 2021 21:29:35 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-112-106.phx2.redhat.com [10.3.112.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83D585D9DD;
 Tue, 13 Jul 2021 21:29:17 +0000 (UTC)
Subject: [PULL 0/3] VFIO update 2021-07-13 (for v6.1)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Jul 2021 15:29:17 -0600
Message-ID: <162621155674.487037.8788212042441164398.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Pankaj Gupta <pankaj.gupta@ionos.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, alex.williamson@redhat.com,
 Cai Huoqing <caihuoqing@baidu.com>, teawater <teawaterz@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 961fef0ace0b2a997544deec2f01981b9c9c96e3:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210712' into staging (2021-07-13 17:51:50 +0100)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20210713.0

for you to fetch changes up to fefc1861d4ba8b9b4d7153dc6b359a65468d15cb:

  vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI processor (2021-07-13 11:31:14 -0600)

----------------------------------------------------------------
VFIO update 2021-07-13

 * Coverity fix to discard listener (David Hildenbrand)

 * MSI-X PBA quirk for BAIDU VFs, additional helper use cases (Cai Huoqing)

----------------------------------------------------------------
Cai Huoqing (2):
      vfio/pci: Change to use vfio_pci_is()
      vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI processor

David Hildenbrand (1):
      vfio: Fix CID 1458134 in vfio_register_ram_discard_listener()

 hw/vfio/common.c         |  3 ++-
 hw/vfio/pci.c            | 12 ++++++++++--
 include/hw/pci/pci_ids.h |  3 +++
 3 files changed, 15 insertions(+), 3 deletions(-)


