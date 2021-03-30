Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025F34E7BC
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:46:01 +0200 (CEST)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDku-0004UU-Bw
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfT-0000tI-QV
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfG-0003MX-8U
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617108006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0XDfaSsuxsoVngEIWBcd0FR+WCi/sksTiZFetGsygU=;
 b=a40XJjA1VZpqusdIVAnJoojP+xUOLTC8uXai9TWKfvtq/JWm67or0WUN2URs1MfOAyNAy2
 aXecjfCLCKfQJchvnRhQI0LeMVoXvp7dDzBxGddooy5XIlppKXABP4aAPdUSQncDX3FKnt
 hHAY13tig6hcJf7gO2T5lGw9l+PcNhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-0s-DYYrtM8qXBK1aHiDCeA-1; Tue, 30 Mar 2021 08:40:02 -0400
X-MC-Unique: 0s-DYYrtM8qXBK1aHiDCeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0D3BDF8A7;
 Tue, 30 Mar 2021 12:40:01 +0000 (UTC)
Received: from localhost (ovpn-113-220.ams2.redhat.com [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F722AC82;
 Tue, 30 Mar 2021 12:40:01 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/9] iotests: Fix typo in iotest 051
Date: Tue, 30 Mar 2021 14:39:49 +0200
Message-Id: <20210330123957.826170-2-mreitz@redhat.com>
In-Reply-To: <20210330123957.826170-1-mreitz@redhat.com>
References: <20210330123957.826170-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tao Xu <tao3.xu@intel.com>

There is an typo in iotest 051, correct it.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
Message-Id: <20210324084321.90952-1-tao3.xu@intel.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/051        | 2 +-
 tests/qemu-iotests/051.pc.out | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 333cc81818..7bf29343d7 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -199,7 +199,7 @@ case "$QEMU_DEFAULT_MACHINE" in
         # virtio-blk enables the iothread only when the driver initialises the
         # device, so a second virtio-blk device can't be added even with the
         # same iothread. virtio-scsi allows this.
-        run_qemu $iothread -device virtio-blk-pci,drive=disk,iohtread=iothread0,share-rw=on
+        run_qemu $iothread -device virtio-blk-pci,drive=disk,iothread=iothread0,share-rw=on
         run_qemu $iothread -device virtio-scsi,id=virtio-scsi1,iothread=thread0 -device scsi-hd,bus=virtio-scsi1.0,drive=disk,share-rw=on
         ;;
      *)
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
index e95bd42b8d..afe7632964 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -183,9 +183,9 @@ Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device scsi-hd,bus=virtio-scsi1.0,drive=disk,share-rw=on: Cannot change iothread of active block backend
 
-Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id=thread0 -device virtio-scsi,iothread=thread0,id=virtio-scsi0 -device scsi-hd,bus=virtio-scsi0.0,drive=disk,share-rw=on -device virtio-blk-pci,drive=disk,iohtread=iothread0,share-rw=on
+Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id=thread0 -device virtio-scsi,iothread=thread0,id=virtio-scsi0 -device scsi-hd,bus=virtio-scsi0.0,drive=disk,share-rw=on -device virtio-blk-pci,drive=disk,iothread=iothread0,share-rw=on
 QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: -device virtio-blk-pci,drive=disk,iohtread=iothread0,share-rw=on: Cannot change iothread of active block backend
+(qemu) QEMU_PROG: -device virtio-blk-pci,drive=disk,iothread=iothread0,share-rw=on: Cannot change iothread of active block backend
 
 Testing: -drive file=TEST_DIR/t.qcow2,if=none,node-name=disk -object iothread,id=thread0 -device virtio-scsi,iothread=thread0,id=virtio-scsi0 -device scsi-hd,bus=virtio-scsi0.0,drive=disk,share-rw=on -device virtio-scsi,id=virtio-scsi1,iothread=thread0 -device scsi-hd,bus=virtio-scsi1.0,drive=disk,share-rw=on
 QEMU X.Y.Z monitor - type 'help' for more information
-- 
2.29.2


