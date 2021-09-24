Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E251416EA1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:12:10 +0200 (CEST)
Received: from localhost ([::1]:42874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThFZ-0003dO-Jf
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTh9S-0003Ze-SO
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:05:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTh9R-0003AA-5D
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632474348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+MvauAKX8Sg5PD9bcfdZIejMYCjC+7abVclCzHOyBc=;
 b=bX863WV/wxHiURTk7Mju/rMU3E8FiELWP4zqe/7Bu4QQLQTpjE880vUjopPIar/bDsd0QC
 jhhdMl8M9Q9pf8bjLzdIuvoxwNgvuExjW/qEOxve1WOkvGP/N6Z8NT+2G65eTmHqqczi+n
 Wx/f39GXvX8bNul7BLXCodq2sQdpmJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-CyHk565tPzyE8Y-u-sgYsQ-1; Fri, 24 Sep 2021 05:05:47 -0400
X-MC-Unique: CyHk565tPzyE8Y-u-sgYsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79EB05074D;
 Fri, 24 Sep 2021 09:05:46 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39E695D9DC;
 Fri, 24 Sep 2021 09:05:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] iotests/051: Fix typo
Date: Fri, 24 Sep 2021 11:04:19 +0200
Message-Id: <20210924090427.9218-4-kwolf@redhat.com>
In-Reply-To: <20210924090427.9218-1-kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The iothread isn't called 'iothread0', but 'thread0'. Depending on the
order that properties are parsed, the error message may change from the
expected one to another one saying that the iothread doesn't exist.

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


