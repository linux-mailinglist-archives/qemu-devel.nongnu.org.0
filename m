Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142A242F661
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:54:03 +0200 (CEST)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOaw-0000Z2-4C
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVt-0000HL-Ne
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVs-0001mM-0F
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634309327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lw9goYY+B7hBpAhduEmeVExfJqxW90te1SfQKwU69mk=;
 b=Pwceuzc0dfHroJFhDbmlxGB/UYfiVI9ECH/Ivz1CZTBggyqgY4HtNK+Zi34VNng8LloSq4
 rI3TPtWmYtQVnMlOHiEv6M+qtEP1tA7e4AVHj1lt2Y1qNGurxPAitedNuAvLIrXkkHLOkk
 xjqLdaLPz5kbX2gSQ8SKy6xB21uJ/YI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-I-MpFwQhM3Kh6Bs3N6gIWw-1; Fri, 15 Oct 2021 10:48:46 -0400
X-MC-Unique: I-MpFwQhM3Kh6Bs3N6gIWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 504D7802575
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:48:45 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9B0619736;
 Fri, 15 Oct 2021 14:48:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] iotests/051: Fix typo
Date: Fri, 15 Oct 2021 16:46:31 +0200
Message-Id: <20211015144640.198044-7-kwolf@redhat.com>
In-Reply-To: <20211015144640.198044-1-kwolf@redhat.com>
References: <20211015144640.198044-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The iothread isn't called 'iothread0', but 'thread0'. Depending on the
order that properties are parsed, the error message may change from the
expected one to another one saying that the iothread doesn't exist.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211008133442.141332-7-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/051        | 2 +-
 tests/qemu-iotests/051.pc.out | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 7bf29343d7..1d2fa93a11 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -199,7 +199,7 @@ case "$QEMU_DEFAULT_MACHINE" in
         # virtio-blk enables the iothread only when the driver initialises the
         # device, so a second virtio-blk device can't be added even with the
         # same iothread. virtio-scsi allows this.
-        run_qemu $iothread -device virtio-blk-pci,drive=disk,iothread=iothread0,share-rw=on
+        run_qemu $iothread -device virtio-blk-pci,drive=disk,iothread=thread0,share-rw=on
         run_qemu $iothread -device virtio-scsi,id=virtio-scsi1,iothread=thread0 -device scsi-hd,bus=virtio-scsi1.0,drive=disk,share-rw=on
         ;;
      *)
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
index afe7632964..063e4fc584 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -183,9 +183,9 @@ Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device scsi-hd,bus=virtio-scsi1.0,drive=disk,share-rw=on: Cannot change iothread of active block backend
 
-Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id=thread0 -device virtio-scsi,iothread=thread0,id=virtio-scsi0 -device scsi-hd,bus=virtio-scsi0.0,drive=disk,share-rw=on -device virtio-blk-pci,drive=disk,iothread=iothread0,share-rw=on
+Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id=thread0 -device virtio-scsi,iothread=thread0,id=virtio-scsi0 -device scsi-hd,bus=virtio-scsi0.0,drive=disk,share-rw=on -device virtio-blk-pci,drive=disk,iothread=thread0,share-rw=on
 QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: -device virtio-blk-pci,drive=disk,iothread=iothread0,share-rw=on: Cannot change iothread of active block backend
+(qemu) QEMU_PROG: -device virtio-blk-pci,drive=disk,iothread=thread0,share-rw=on: Cannot change iothread of active block backend
 
 Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id=thread0 -device virtio-scsi,iothread=thread0,id=virtio-scsi0 -device scsi-hd,bus=virtio-scsi0.0,drive=disk,share-rw=on -device virtio-scsi,id=virtio-scsi1,iothread=thread0 -device scsi-hd,bus=virtio-scsi1.0,drive=disk,share-rw=on
 QEMU X.Y.Z monitor - type 'help' for more information
-- 
2.31.1


